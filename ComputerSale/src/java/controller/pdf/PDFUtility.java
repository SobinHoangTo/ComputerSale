package controller.pdf;

import com.openhtmltopdf.pdfboxout.PdfRendererBuilder;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;

public class PDFUtility {

    public static void main(String[] args) {

        String htmlFilePath = "web" + File.separator + "Views" + File.separator;
        String outputFilePath = "PDF";
        boolean status = false;

        try {
            String htmlContent = readHTMLFile(htmlFilePath + "FormSendOrder.html");

            int action = 1;

            switch (action) {
                case 1:
                    outputFilePath += "/Invoice/Try11.pdf";
                    break;
                case 2:
                    outputFilePath += "/Warranty/Try2.pdf";
                    break;
                default:
                    throw new AssertionError("Invalid action");
            }

            htmlContent = fixMetaTags(htmlContent);

            File outputDir = new File(outputFilePath).getParentFile();
            if (!outputDir.exists()) {
                outputDir.mkdirs();
            }

            try (FileOutputStream outputStream = new FileOutputStream(outputFilePath)) {
                PdfRendererBuilder builder = new PdfRendererBuilder();
                builder.useFastMode();
                builder.withHtmlContent(htmlContent, new File(htmlFilePath + "FormSendOrder.html").toURI().toString());
                builder.toStream(outputStream);
                builder.run();
                System.out.println("PDF Created Successfully!");
                status = true;
            } catch (IOException e) {
                e.printStackTrace();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        System.out.println(htmlFilePath);
        System.out.println(outputFilePath);
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
            throw e; // Rethrow the exception to handle it further up the call stack if needed
        }
        return contentBuilder.toString();
    }

    public static String fixMetaTags(String htmlContent) {
        // Replace or fix any problematic <meta> tags
        // Example: Replace <meta ...> with <meta ... />
        htmlContent = htmlContent.replaceAll("<meta([^>]*)>", "<meta$1 />");
        return htmlContent;
    }
}
