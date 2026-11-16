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
    // chỉ nhân viên bán vé đã đăng nhập mới được vào trang này
    Member4 member = (Member4) session.getAttribute("member");
    if (member == null || !"saler".equals(member.getRole())) {
        response.sendRedirect("../member/uiLogin.jsp?err=timeout");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang chủ nhân viên bán vé</title>
</head>
<body>
    <h2>Trang chủ nhân viên bán vé</h2>
    <p>Xin chào, <%=esc(member.getFullName())%> (nhân viên bán vé)</p>
    <p>Các chức năng (chưa cài đặt trong phiên bản này):</p>
    <ul>
        <li>Bán vé tại quầy</li>
        <li>Cấp thẻ thành viên</li>
    </ul>
    <a id="lnkLogout" href="../member/doLogout.jsp">Đăng xuất</a>
</body>
</html>
