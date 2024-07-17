package email;

import java.io.UnsupportedEncodingException;
import java.util.Properties;
import javax.mail.Address;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 * A utility class for sending e-mail messages
 *
 * @author www.codejava.net
 *
 */
public class EmailUtility {

    private final String host = "SWP391_SE1812_GROUP5";
    private final String user = "drapojo2004@gmail.com";
    private final String pass = "ndog zzck zvei eujw";

    public String sendMail(String to, String subject, String body, boolean content) {
        String status = null;
        try {
            // acquire a secure SMTPs session
            Properties pros = new Properties();
            pros.put("mail.transport.protocol", "smtps");
            pros.put("mail.smtps.host", "smtp.gmail.com");
            pros.put("mail.smtps.port", 465);
            pros.put("mail.smtps.auth", "true");
            pros.put("mail.smtps.quitwait", "false");
            Session session = Session.getDefaultInstance(pros);
            session.setDebug(true);
            // Wrap a message in session
            Message message = new MimeMessage(session);
            message.setSubject(subject);

            if (content) {
                message.setContent(body, "text/html; charset=UTF-8");
            } else {
                message.setText(body);
            }
            // specify E-mail address of Sender and Receiver
            Address sender = new InternetAddress(user, host);
            Address receiver = new InternetAddress(to);
            message.setFrom(sender);
            message.setRecipient(Message.RecipientType.TO, receiver);
            // sending an E-mail
            try (Transport tt = session.getTransport()) {
                // acqruiring a connection to remote server
                tt.connect(user, pass);
                tt.sendMessage(message,
                        message.getAllRecipients());
                status = "Email Sent Successfully";
            }
        } catch (MessagingException e) {
            status = e.toString();
        } catch (UnsupportedEncodingException e) {
            status = e.toString();
        }
        // return the status of email
        return status;
    }
}
