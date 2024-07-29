package controller.pdf;

import com.openhtmltopdf.pdfboxout.PdfRendererBuilder;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.*;
import java.nio.charset.StandardCharsets;
import model.Order;
import dal.OrderDAO;
import util.MyUtils;

@WebServlet(name = "CreatePDF", urlPatterns = {"/createPDF"})
public class CreatePDF extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String actionRaw = request.getParameter("action");
        String idRaw = request.getParameter("id");

        try {
            int action = Integer.parseInt(actionRaw);
            int orderID = Integer.parseInt(idRaw);

            String htmlFilePath = "";
            String pdfOutputDirectory = "";
            String fileName = "";
//set file name and context path
            switch (action) {
                case 1:
                    htmlFilePath = "Views/FormSendOrder.html";
                    pdfOutputDirectory = "PDF/Invoice";
                    Order orders = new OrderDAO().getById(orderID);
                    String name = orders.getId() + "_" + orders.getCustomer_id();
                    fileName = "Invoice_" + name + ".pdf";
                    break;
                case 2:
                    htmlFilePath = "Views/FormWarranty.html";
                    pdfOutputDirectory = "PDF/Warranty";
                    fileName = "Warranty_" + orderID + ".pdf";
                    break;
                default:
                    throw new IllegalArgumentException("Invalid action");
            }
//create pdf file
            String servletContextPath = getServletContext().getRealPath("/");
            File pdfDir = new File(servletContextPath, pdfOutputDirectory);
            String outputDirectoryPath = pdfDir.getCanonicalPath();

            if (!pdfDir.exists()) {
                pdfDir.mkdirs();
            }

            String outputFilePath = outputDirectoryPath + File.separator + fileName;
            String htmlContent = readHTMLFile(getServletContext().getRealPath(htmlFilePath));
            htmlContent = fixMetaTags(htmlContent);

            try (FileOutputStream outputStream = new FileOutputStream(outputFilePath)) {
                PdfRendererBuilder builder = new PdfRendererBuilder();
                builder.useFastMode();
                builder.withHtmlContent(htmlContent, getServletContext().getRealPath(htmlFilePath));
                builder.toStream(outputStream);
                builder.run();
                System.out.println("PDF Created Successfully!");
                //open file if successful create file
                MyUtils.setAlertAttributes(request, true, "Converted file path: " + outputFilePath);
                response.sendRedirect(request.getContextPath() + "/" + pdfOutputDirectory + "/" + fileName);
            } catch (IOException e) {
                e.printStackTrace();
                MyUtils.setAlertAttributes(request, false, "PDF generation failed.");
                request.getRequestDispatcher("/manageorders").forward(request, response);
            }

        } catch (IllegalArgumentException e) {
            e.printStackTrace();
            MyUtils.setAlertAttributes(request, false, "Invalid action or order ID.");
            request.getRequestDispatcher("/manageorders").forward(request, response);
        }
    }

    public static String readHTMLFile(String filePath) throws IOException {
        StringBuilder contentBuilder = new StringBuilder();
        try (BufferedReader reader = new BufferedReader(new InputStreamReader(new FileInputStream(filePath), StandardCharsets.UTF_8))) {
            String line;
            while ((line = reader.readLine()) != null) {
                contentBuilder.append(line).append("\n");
            }
        } catch (IOException e) {
            System.err.println("Error reading HTML file: " + e.getMessage());
            throw e;
        }
        return contentBuilder.toString();
    }

    public static String fixMetaTags(String htmlContent) {
        // Replace or fix any problematic <meta> tags
        htmlContent = htmlContent.replace("<head>", "<head>\n<meta charset=\"UTF-8\">");
        htmlContent = htmlContent.replaceAll("<meta([^>]*)>", "<meta$1 />");
        return htmlContent;
    }

}
