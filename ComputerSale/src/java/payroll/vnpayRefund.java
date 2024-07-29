package payroll;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.TimeZone;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.json.JSONObject;

/**
 *
 * @author CTT VNPAY
 */
public class vnpayRefund extends HttpServlet {

    @Override

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        //Command: refund
        String vnp_RequestId = Config.getRandomNumber(8);
        String vnp_Version = "2.1.0";
        String vnp_Command = "refund";
        String vnp_TmnCode = Config.vnp_TmnCode;
        String vnp_TransactionType = req.getParameter("trantype");
        String vnp_TxnRef = req.getParameter("order_id");
        long amount = Integer.parseInt(req.getParameter("amount"))*100;
        String vnp_Amount = String.valueOf(amount);
        String vnp_OrderInfo = "Hoan tien GD OrderId:" + vnp_TxnRef;
        String vnp_TransactionNo = ""; //Assuming value of the parameter "vnp_TransactionNo" does not exist on your system.
        String vnp_TransactionDate = req.getParameter("trans_date");
        String vnp_CreateBy = req.getParameter("user");
        
        Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
        String vnp_CreateDate = formatter.format(cld.getTime());
        
        String vnp_IpAddr = Config.getIpAddress(req);
        
        JSONObject json = new JSONObject();
        json.put("vnp_RequestId", vnp_RequestId);
        json.put("vnp_Version", vnp_Version);
        json.put("vnp_Command", vnp_Command);
        json.put("vnp_TmnCode", vnp_TmnCode);
        json.put("vnp_TransactionType", vnp_TransactionType);
        json.put("vnp_TxnRef", vnp_TxnRef);
        json.put("vnp_Amount", vnp_Amount);
        json.put("vnp_OrderInfo", vnp_OrderInfo);
        
        if(vnp_TransactionNo != null && !vnp_TransactionNo.isEmpty())
        {
            json.put("vnp_TransactionNo", "{get value of vnp_TransactionNo}");
        }
        json.put("vnp_TransactionDate", vnp_TransactionDate);
        json.put("vnp_CreateBy", vnp_CreateBy);
        json.put("vnp_CreateDate", vnp_CreateDate);
        json.put("vnp_IpAddr", vnp_IpAddr);
        
        
        String hash_Data= String.join("|", vnp_RequestId, vnp_Version, vnp_Command, vnp_TmnCode, 
                vnp_TransactionType, vnp_TxnRef, vnp_Amount, vnp_TransactionNo, vnp_TransactionDate, 
                vnp_CreateBy, vnp_CreateDate, vnp_IpAddr, vnp_OrderInfo);
        
        String vnp_SecureHash = Config.hmacSHA512(Config.secretKey, hash_Data.toString());
        
        json.put("vnp_SecureHash", vnp_SecureHash);
        
        URL url = new URL (Config.vnp_ApiUrl);
        HttpURLConnection con = (HttpURLConnection)url.openConnection();
        con.setRequestMethod("POST");
        con.setRequestProperty("Content-Type", "application/json");
        con.setDoOutput(true);
        DataOutputStream wr = new DataOutputStream(con.getOutputStream());
        wr.writeBytes(json.toString());
        wr.flush();
        wr.close();
        int responseCode = con.getResponseCode();
        System.out.println("nSending 'POST' request to URL : " + url);
        System.out.println("Post Data : " + json);
        System.out.println("Response Code : " + responseCode);
        BufferedReader in = new BufferedReader(
        new InputStreamReader(con.getInputStream()));
        String output;
        StringBuffer response = new StringBuffer();
        while ((output = in.readLine()) != null) {
        response.append(output);
        }
        in.close();
        System.out.println(response.toString());

    }
}
