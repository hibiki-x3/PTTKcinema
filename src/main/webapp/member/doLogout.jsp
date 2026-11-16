<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // đăng xuất: xóa session rồi quay về trang đăng nhập
    session.invalidate();
    response.sendRedirect("uiLogin.jsp");
%>
