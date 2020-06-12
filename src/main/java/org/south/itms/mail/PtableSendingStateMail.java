package org.south.itms.mail;

import com.sun.mail.util.MailSSLSocketFactory;
import org.south.itms.util.CheckPtableSendingStateResult;

import javax.mail.*;

import javax.mail.internet.InternetAddress;

import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.util.Date;

import java.util.Properties;



/**
 * @author bobo
 */


public class PtableSendingStateMail {

    // 配置参数
    public static String myEmailAccount = "support@nfledmedia.com";
    public static String myEmailPassword = "123qwe!@#QWE";
    public static String myEmailSMTPHost = "smtp.exmail.qq.com";
    public static String port = "465";
    public static String protocol = "smtp";

    // 初始化参数
    public static Session initProperties() {
        Properties properties = new Properties();
        properties.setProperty("mail.transport.protocol", protocol);
        properties.setProperty("mail.smtp.host", myEmailSMTPHost);
        properties.setProperty("mail.smtp.port", port);
        properties.put("mail.smtp.auth", "true");
        MailSSLSocketFactory mailSSLSocketFactory = null;
        try {
            mailSSLSocketFactory = new MailSSLSocketFactory();
            mailSSLSocketFactory.setTrustAllHosts(true);
        } catch (GeneralSecurityException e) {
            e.printStackTrace();
        }
        properties.put("mail.smtp.ssl.enable", "true");
        properties.put("mail.smtp.ssl.socketFactory", mailSSLSocketFactory);
        properties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        properties.put("mail.smtp.socketFactory.fallback", "false");
        properties.put("mail.smtp.socketFactory.port", port);
        Session session = Session.getDefaultInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(myEmailAccount, myEmailPassword);
            }
        });
        return session;
    }


    public static void send(String sender, String subject, String content, String receiverList) {
        try {

            Session session = initProperties();
            MimeMessage mimeMessage = new MimeMessage(session);
            mimeMessage.setFrom(new InternetAddress(myEmailAccount, sender));

            // 解析收件地址(多人用,相连)
            new InternetAddress();
            InternetAddress[] internetAddressTo = InternetAddress.parse(receiverList);
            mimeMessage.setRecipients(Message.RecipientType.TO, internetAddressTo);

            // 主题
            mimeMessage.setSubject(subject);
            // 时间
            mimeMessage.setSentDate(new Date());
            // 容器类 附件
            MimeMultipart mimeMultipart = new MimeMultipart();
            // 可以包装文本,图片,附件
            MimeBodyPart bodyPart = new MimeBodyPart();
            // 设置内容
            bodyPart.setContent(content, "text/html; charset=UTF-8");
            mimeMultipart.addBodyPart(bodyPart);

            // 添加图片&附件
            //bodyPart = new MimeBodyPart();
            //bodyPart.attachFile(fileSrc);
           // mimeMultipart.addBodyPart(bodyPart);

            mimeMessage.setContent(mimeMultipart);
            mimeMessage.saveChanges();
            Transport.send(mimeMessage);

        } catch (MessagingException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
