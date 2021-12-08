<%@page import="javax.mail.internet.AddressException"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="javax.mail.*" %>
<%@ page import ="java.util.Properties" %>
<%@ page import = "com.mangoMusic.member.model.Gmail"%>
 <%@ page import ="com.mangoMusic.member.model.MemberVO"%>
<%@ page import = "com.mangoMusic.member.model.MemberDAO"%>
<%@ page import = "com.mangoMusic.member.model.SHA256"%>
<%@ page import = "java.io.PrintWriter"%>
    
  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


  <%
    
    	MemberDAO dao = new MemberDAO();
     	String email = request.getParameter("email");
     	PrintWriter script = response.getWriter();
     	
     	if(email == null){
     		
    		script.println("<script>");
    		script.println("alert('이메일 입력');");
    		script.println("history.back();");
    		script.println("</script>");
    		script.close();
    		return;
     	}
     	
     	MemberVO vo = dao.selectByEmail(email);
     	if(vo.getEmail()==null||vo.getEmail().isEmpty()){
     		script.println("<script>");
    		script.println("alert('다시 이메일을 입력해주세요');");
    		script.println("history.back();");
    		script.println("</script>");
    		script.close();
    		return;
     	}
     	

    	
     	String host = "http://localhost:9090/mangoMusic/login/";

    	String from = "hyoeunk678@gmail.com";

    	String to = email;

    	String subject = "망고뮤직 아이디 확인";

    	String content = "당신의 아이디는 "+vo.getId()+" 입니다";

    	

    	// SMTP에 접속하기 위한 정보를 기입합니다.

    	Properties p = new Properties();

    	p.put("mail.smtp.user", from);
    	p.put("mail.smtp.host", "smtp.gmail.com");

    	p.put("mail.smtp.port", "465");

    	p.put("mail.smtp.starttls.enable", "true");

    	p.put("mail.smtp.auth", "true");

    	p.put("mail.smtp.debug", "true");

    	p.put("mail.smtp.socketFactory.port", "465");

		
    	p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

    	p.put("mail.smtp.socketFactory.fallback", "false");

    	p.put("mail.smtp.ssl.protocols","TLSv1.2"); 

    	try{

    	    Authenticator auth = new Gmail();

    	    Session ses = Session.getInstance(p, auth);

    	    ses.setDebug(true);

    	    MimeMessage msg = new MimeMessage(ses); 

    	    msg.setSubject(subject);

    	    Address fromAddr = new InternetAddress(from);

    	    msg.setFrom(fromAddr);

    	    Address toAddr = new InternetAddress(to);

    	    msg.addRecipient(Message.RecipientType.TO, toAddr);

    	    msg.setContent(content, "text/html;charset=UTF-8");

    	    Transport.send(msg);
    	    
    	    %>
    	    <script type="text/javascript">
            alert('이메일이 전송되었습니다');
            location.href="Login.jsp";
       		 </script>
    		<%

    	} catch(Exception e){
    	    e.printStackTrace();
    	    %>
    	    <script type="text/javascript">
            alert('오류가 발생했습니다');
            location.href="Login.jsp";
       		 </script>
    <%	} %>







</body>
</html>