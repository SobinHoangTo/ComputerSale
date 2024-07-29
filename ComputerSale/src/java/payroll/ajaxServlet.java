/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package payroll;

import dal.OrderDAO;
import dal.Order_detailDAO;
import dal.Serial_numberDAO;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Cart;
import model.Customer;
import model.Order;
import model.Serial_number;

/**
 *
 * @author CTT VNPAY
 */
public class ajaxServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try{
            String note = req.getParameter("note");
            int phone = Integer.parseInt(req.getParameter("phone"));
            String address = req.getParameter("address");
            HttpSession session = req.getSession();
            HashMap<Integer, Cart> order = (HashMap<Integer, Cart>)session.getAttribute("order");
            HashMap<Integer, Cart> cart = (HashMap<Integer, Cart>)session.getAttribute("cart");
            if(order==null||cart==null) throw new Exception();
            ArrayList<String> error = checkAmount(order);
            if(!error.isEmpty()){
                req.setAttribute("alertMessage", error);
                throw new Exception();
            }
            Customer tCus = (Customer) session.getAttribute("currentCustomer");
            session.setAttribute("orderID", addOrder(order, cart, tCus, phone, address, note));
            System.out.println("after done");
            session.removeAttribute("order");
            session.setAttribute("cart", cart);
            int cartlength = getCartLength(cart);
            session.setAttribute("cartLength", cartlength);
            
            
            
            String vnp_Version = "2.1.0";
            String vnp_Command = "pay";
            String orderType = "other";
            long amount = Integer.parseInt(req.getParameter("amount"));
            amount*=100;
            System.out.println(amount);
            String bankCode = req.getParameter("bankCode");
            ArrayList<Order> oTemp = new OrderDAO().getAllOrders();
            String vnp_TxnRef = (oTemp.get(oTemp.size()-1).getId()+1)+"";
            String vnp_IpAddr = Config.getIpAddress(req);
            
            String vnp_TmnCode = Config.vnp_TmnCode;
            
            Map<String, String> vnp_Params = new HashMap<>();
            vnp_Params.put("vnp_Version", vnp_Version);
            vnp_Params.put("vnp_Command", vnp_Command);
            vnp_Params.put("vnp_TmnCode", vnp_TmnCode);
            vnp_Params.put("vnp_Amount", String.valueOf(amount));
            vnp_Params.put("vnp_CurrCode", "VND");
            
            if (bankCode != null && !bankCode.isEmpty()) {
                vnp_Params.put("vnp_BankCode", bankCode);
            } else {
                vnp_Params.put("vnp_BankCode", "");
            }
            vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
            vnp_Params.put("vnp_OrderInfo", "SWP391 SE1812 Group5 Order ID:" + vnp_TxnRef);
            vnp_Params.put("vnp_OrderType", orderType);
            
            String locate = req.getParameter("language");
            if (locate != null && !locate.isEmpty()) {
                vnp_Params.put("vnp_Locale", locate);
            } else {
                vnp_Params.put("vnp_Locale", "vn");
            }
            vnp_Params.put("vnp_ReturnUrl", Config.vnp_ReturnUrl);
            vnp_Params.put("vnp_IpAddr", vnp_IpAddr);
            
            Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
            SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
            String vnp_CreateDate = formatter.format(cld.getTime());
            vnp_Params.put("vnp_CreateDate", vnp_CreateDate);
            
            cld.add(Calendar.MINUTE, 15);
            String vnp_ExpireDate = formatter.format(cld.getTime());
            vnp_Params.put("vnp_ExpireDate", vnp_ExpireDate);
            
            List fieldNames = new ArrayList(vnp_Params.keySet());
            Collections.sort(fieldNames);
            StringBuilder hashData = new StringBuilder();
            StringBuilder query = new StringBuilder();
            Iterator itr = fieldNames.iterator();
            while (itr.hasNext()) {
                String fieldName = (String) itr.next();
                String fieldValue = (String) vnp_Params.get(fieldName);
                if ((fieldValue != null) && (fieldValue.length() > 0)) {
                    //Build hash data
                    hashData.append(fieldName);
                    hashData.append('=');
                    hashData.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                    //Build query
                    query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString()));
                    query.append('=');
                    query.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                    if (itr.hasNext()) {
                        query.append('&');
                        hashData.append('&');
                    }
                }
            }
            String queryUrl = query.toString();
            String vnp_SecureHash = Config.hmacSHA512(Config.secretKey, hashData.toString());
            queryUrl += "&vnp_SecureHash=" + vnp_SecureHash;
            String paymentUrl = Config.vnp_PayUrl + "?" + queryUrl;
            resp.sendRedirect(paymentUrl);
        }catch (Exception e){
            System.out.println("ajaxServlet" + e.getMessage());
            req.getRequestDispatcher("orderstatus").forward(req, resp);
        }
        
    }
    private ArrayList<String> checkAmount(HashMap<Integer,Cart> order){
        ArrayList<String> error = new ArrayList<>();
        for (Map.Entry<Integer, Cart> i : order.entrySet()) {
                ArrayList<Serial_number> temp = new Serial_numberDAO().getAllByProductIdAndStatus(i.getKey(), 1);
                if(i.getValue().getQuantity()>temp.size()){
                    error.add(temp.size()>0?i.getValue().getProduct().getName() + " remaining " + temp.size() + " left!!!":i.getValue().getProduct().getName() + " is out of stock!!!");
                }
            }
        return error;
    }
    private int addOrder(HashMap<Integer, Cart> order, HashMap<Integer, Cart> cart, Customer tCus, int phone, String address, String note){
        int orderID = new OrderDAO().addOrder(tCus.getId(), phone, address, note);
            for (Map.Entry<Integer, Cart> i : order.entrySet()) {
                ArrayList<Serial_number> temp = new Serial_numberDAO().getAllByProductIdAndStatus(i.getKey(), 1);
                for(int j=0; j<i.getValue().getQuantity(); j++){
                    new Serial_numberDAO().updateStatus(temp.get(j).getId(), 2);
                    new Order_detailDAO().add(temp.get(j).getId(), orderID, i.getValue().getProduct().getId(), i.getValue().getProduct().getPrice());
                }
                cart.remove(i.getKey());
            }
        return orderID;
    }
    private int getCartLength(HashMap<Integer, Cart> cart) {
        int cartLength = 0;
        for (Map.Entry<Integer, Cart> i : cart.entrySet()) {
            cartLength += i.getValue().getQuantity();
        }
        return cartLength;
    }
    
}
