/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package LoginGoogle;

import dal.CustomerDAO;
import dal.EmployeeDAO;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import org.json.JSONObject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Customer;
import model.Employee;

@WebServlet(name = "LoginGoogleHandler", urlPatterns = {"/LoginGoogleHandler"})
public class LoginGoogleHandler extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            String code = request.getParameter("code");
            String accessToken = getToken(code);
            System.out.println(accessToken);

            UserInfo user = getUserInfo(accessToken);
            Customer cTemp = new CustomerDAO().getByEmail(user.getEmail());
            if (cTemp != null) {
                session.setAttribute("currentCustomer", cTemp);
                response.sendRedirect("home");
                return;
            }
            System.out.println(user.getEmail());
            Employee eTemp = new EmployeeDAO().getByEmail(user.getEmail());
            if (eTemp != null) {
                session.setAttribute("currentEmployee", eTemp);
                switch (eTemp.getRole_id()) {
                    case 1 ->
                        response.sendRedirect("viewstatistic");
                    case 2 ->
                        response.sendRedirect("employeehome");
                    default ->
                        response.sendRedirect("employeehome");
                }
                return;
            }
            String[] words = user.getGiven_name().split("\\s");
            String firstname = "";
            String lastname = "";
            for (int i = 0; i < words.length; i++) {
                if(i<words.length/2){
                    firstname+=words[i] + (i<(words.length-1)?" ":"");
                }
                else{
                    lastname+=words[i] + (i<(words.length-1)?" ":"");
                }
            }
            new CustomerDAO().add(null, user.getEmail(), null, "", "", firstname, lastname);
            session.setAttribute("currentCustomer", new CustomerDAO().getByEmail(user.getEmail()));
            response.sendRedirect("home");
            return;
        } catch (Exception e) {
            System.out.println("Login Google exception: " + e.getMessage());
        }
        response.sendRedirect("login");
    }

    public static String getToken(String code) throws IOException {
        String urlString = PrivateInfo.GOOGLE_LINK_GET_TOKEN;

        URL url = new URL(urlString);
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();

        // Set the request method to POST
        connection.setRequestMethod("POST");
        connection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
        connection.setRequestProperty("Accept", "application/json");
        connection.setDoOutput(true);

        // Set the POST parameters
        String urlParameters = "client_id=" + PrivateInfo.GOOGLE_CLIENT_ID
                + "&client_secret=" + PrivateInfo.GOOGLE_CLIENT_SECRET
                + "&redirect_uri=" + PrivateInfo.GOOGLE_REDIRECT_URI
                + "&code=" + code
                + "&grant_type=" + PrivateInfo.GOOGLE_GRANT_TYPE;

        // Write parameters to request body
        try (OutputStream os = connection.getOutputStream()) {
            byte[] input = urlParameters.getBytes("utf-8");
            os.write(input, 0, input.length);
        }

        // Read the response
        StringBuilder response = new StringBuilder();
        try (BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream(), "utf-8"))) {
            String responseLine;
            while ((responseLine = br.readLine()) != null) {
                response.append(responseLine.trim());
            }
        }

        // Parse the JSON response and get the access token
        JSONObject jsonResponse = new JSONObject(response.toString());
        String accessToken = jsonResponse.getString("access_token");

        return accessToken;
    }

    public static UserInfo getUserInfo(final String accessToken) throws IOException {
        String urlString = PrivateInfo.GOOGLE_LINK_GET_USER_INFO + "?access_token=" + accessToken;
        URL url = new URL(urlString);
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();

        // Set the request method to GET
        connection.setRequestMethod("GET");
        connection.setRequestProperty("Accept", "application/json");

        // Read the response
        int responseCode = connection.getResponseCode();
        if (responseCode == HttpURLConnection.HTTP_OK) {
            StringBuilder response = new StringBuilder();
            try (BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream(), "utf-8"))) {
                String responseLine;
                while ((responseLine = br.readLine()) != null) {
                    response.append(responseLine.trim());
                }
            }

            // Parse the JSON response and get the access token
            JSONObject jsonResponse = new JSONObject(response.toString());
            System.out.println(jsonResponse.toString());
            UserInfo userInfo = new UserInfo(jsonResponse.getString("id"),
                    jsonResponse.getString("email"),
                    jsonResponse.getBoolean("verified_email"),
                    jsonResponse.getString("name"),
                    jsonResponse.getString("given_name"),
                    null,
                    jsonResponse.getString("picture"));
            return userInfo;
        } else {
            throw new IOException("Failed to get token: HTTP response code " + responseCode);
        }
    }
//    public static String getToken(String code) throws ClientProtocolException, IOException {
//        // call api to get token
//        String response = Request.Post(Constants.GOOGLE_LINK_GET_TOKEN)
//                .bodyForm(Form.form().add("client_id", Constants.GOOGLE_CLIENT_ID)
//                        .add("client_secret", Constants.GOOGLE_CLIENT_SECRET)
//                        .add("redirect_uri", Constants.GOOGLE_REDIRECT_URI).add("code", code)
//                        .add("grant_type", Constants.GOOGLE_GRANT_TYPE).build())
//                .execute().returnContent().asString();
//        
//        JSONObject json = new JSONObject(response);
//        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
//        String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
//        return accessToken;
//    }
//
//    public static UserInfo getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
//        String link = Constants.GOOGLE_LINK_GET_USER_INFO + accessToken;
//        String response = Request.Get(link).execute().returnContent().asString();
//
//        UserInfo googlePojo = new Gson().fromJson(response, UserInfo.class);
//
//        return googlePojo;
//    }
//}

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
