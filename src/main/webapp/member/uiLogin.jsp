<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng nhập</title>
</head>
<body>
    <%
        String err = request.getParameter("err");
        if ("timeout".equals(err)) {
    %>
    <h4>Bạn chưa đăng nhập hoặc đã hết phiên làm việc. Làm ơn đăng nhập lại!</h4>
    <%
        } else if ("fail".equals(err)) {
    %>
    <h4 style="color: red">Sai tên đăng nhập/mật khẩu!</h4>
    <%
        }
    %>
    <h2>Đăng nhập</h2>
    <form name="login" action="doLogin.jsp" method="post">
        <table border="0">
            <tr>
                <td>Tên đăng nhập:</td>
                <td><input type="text" name="txtUsername" id="txtUsername" required /></td>
            </tr>
            <tr>
                <td>Mật khẩu:</td>
                <td><input type="password" name="txtPassword" id="txtPassword" required /></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" id="btnLogin" value="Đăng nhập" /></td>
            </tr>
        </table>
    </form>
    <br />
    <a href="../customer/uiCustomerMain.jsp">Về trang chủ khách hàng</a>
</body>
</html>
