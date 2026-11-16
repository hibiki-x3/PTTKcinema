<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.*"%>
<%!
    // đổi các kí tự đặc biệt để hiển thị an toàn trong trang HTML
    private String esc(String s) {
        if (s == null) return "";
        return s.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;").replace("\"", "&quot;");
    }
%>
<%
    // chỉ nhân viên quản lí đã đăng nhập mới được vào trang này
    Member4 member = (Member4) session.getAttribute("member");
    if (member == null || !"manager".equals(member.getRole())) {
        response.sendRedirect("../member/uiLogin.jsp?err=timeout");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang chủ nhân viên quản lí</title>
</head>
<body>
    <h2>Trang chủ nhân viên quản lí</h2>
    <p>Xin chào, <%=esc(member.getFullName())%> (nhân viên quản lí)</p>
    <p>Các chức năng (chưa cài đặt trong phiên bản này):</p>
    <ul>
        <li>Quản lí thông tin phim</li>
        <li>Quản lí thông tin phòng chiếu</li>
        <li>Lên lịch chiếu</li>
        <li>Xem thống kê</li>
    </ul>
    <a id="lnkLogout" href="../member/doLogout.jsp">Đăng xuất</a>
</body>
</html>
