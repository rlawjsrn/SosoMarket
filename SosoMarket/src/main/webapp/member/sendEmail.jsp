<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.mail.*, javax.mail.internet.*, java.util.*" %>
<%


  // Set TLS protocol explicitly
  System.setProperty("https.protocols", "TLSv1.2");

  // Create email address and token
  String email = request.getParameter("email");
  String token = UUID.randomUUID().toString();
  String authCode = request.getParameter("authCode");
  

  // SMTP settings for sending email
  String host = "smtp.gmail.com";
  String username = "zhdzhdvksvks@gmail.com";
  String password = "onbf dduh yumf xkqd";

  // Email content and delivery settings
  String subject = "이메일 인증";
  String content = "인증번호: "
                  + authCode;
  Properties props = new Properties();
  props.put("mail.smtp.host", host);
  props.put("mail.smtp.auth", "true");
  props.put("mail.smtp.starttls.enable", "true"); // Enable TLS connection

  // Additional properties for SSL
  props.put("mail.smtp.ssl.protocols", "TLSv1.2");
  props.put("mail.smtp.socketFactory.port", "465"); // Use port 465 for SSL
  props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

  // Create a session with the properties
  Session emailsession = Session.getInstance(props, new Authenticator() {
    protected PasswordAuthentication getPasswordAuthentication() {
      return new PasswordAuthentication(username, password);
    }
  });

  // Set additional properties for the Transport object
  Transport transport = emailsession.getTransport("smtp");
  transport.connect(host, username, password);

  // Send email
  MimeMessage message = new MimeMessage(emailsession);
  message.setFrom(new InternetAddress(username));
  message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
  message.setSubject(subject);
  message.setContent(content, "text/html;charset=utf-8");
  transport.sendMessage(message, message.getAllRecipients());
  transport.close();

  // Save token and email information to session
  HttpSession httpSession = request.getSession();
  httpSession.setAttribute("token", token);
  httpSession.setAttribute("email", email);

  // Move page after sending email

%>