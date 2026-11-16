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
    // trang này không bắt buộc đăng nhập: khách chưa đăng nhập vẫn tìm kiếm phim được
    Member4 member = (Member4) session.getAttribute("member");
    boolean loggedIn = member != null && "customer".equals(member.getRole());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang chủ khách hàng</title>
</head>
<body>
    <h2>Trang chủ khách hàng</h2>
    <%
        if (loggedIn) {
    %>
    <p>Xin chào, <%=esc(member.getFullName())%> (khách hàng)</p>
    <%
        }
    %>
    <a id="lnkSearchMovie" href="uiSearchMovie.jsp">Tìm kiếm phim</a>
    <br />
    <br />
    <%
        if (loggedIn) {
    %>
    <a id="lnkLogout" href="../member/doLogout.jsp">Đăng xuất</a>
    <%
        } else {
    %>
    <a id="lnkLogin" href="../member/uiLogin.jsp">Đăng nhập</a>
    <%
        }
    %>
</body>
</html>
