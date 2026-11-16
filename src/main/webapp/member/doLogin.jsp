<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="dao.*,model.*"%>
<%
    request.setCharacterEncoding("UTF-8");
    String username = request.getParameter("txtUsername");
    String password = request.getParameter("txtPassword");
    Member4 member = new Member4();
    member.setUsername(username);
    member.setPassword(password);

    boolean ok = (new MemberDAO4()).checkLogin(member);
    // đăng nhập đúng thì lưu thành viên vào session và chuyển đến trang chủ theo vai trò
    if (ok && "customer".equals(member.getRole())) {
        session.setAttribute("member", member);
        response.sendRedirect("../customer/uiCustomerMain.jsp");
    } else if (ok && "saler".equals(member.getRole())) {
        session.setAttribute("member", member);
        response.sendRedirect("../saler/uiSalerMain.jsp");
    } else if (ok && "manager".equals(member.getRole())) {
        session.setAttribute("member", member);
        response.sendRedirect("../management/uiManagerMain.jsp");
    } else {
        response.sendRedirect("uiLogin.jsp?err=fail");
    }
%>
