<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="dao.*,model.*"%>
<%!
    // đổi các kí tự đặc biệt để hiển thị an toàn trong trang HTML
    private String esc(String s) {
        if (s == null) return "";
        return s.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;").replace("\"", "&quot;");
    }
%>
<%
    // lấy id của phim đã chọn rồi gọi MovieDAO4 để lấy thông tin chi tiết
    Movie4 movie = null;
    try {
        int id = Integer.parseInt(request.getParameter("id"));
        movie = (new MovieDAO4()).getMovieDetail(id);
    } catch (NumberFormatException e) {
        movie = null;
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chi tiết phim</title>
</head>
<body>
    <h2>Chi tiết phim</h2>
    <%
        if (movie == null) {
    %>
    <p>Không tìm thấy phim.</p>
    <%
        } else {
    %>
    <table id="tblDetail" border="1" cellpadding="5">
        <tr>
            <th align="left">Tên phim</th>
            <td><%=esc(movie.getName())%></td>
        </tr>
        <tr>
            <th align="left">Thể loại</th>
            <td><%=esc(movie.getGenre())%></td>
        </tr>
        <tr>
            <th align="left">Thời lượng</th>
            <td><%=movie.getDuration()%> phút</td>
        </tr>
        <tr>
            <th align="left">Đạo diễn</th>
            <td><%=esc(movie.getDirector())%></td>
        </tr>
        <tr>
            <th align="left">Mô tả</th>
            <td><%=esc(movie.getDescription())%></td>
        </tr>
        <tr>
            <th align="left">Trạng thái</th>
            <td><%=esc(movie.getStatus())%></td>
        </tr>
    </table>
    <%
        }
    %>
    <br />
    <button type="button" id="btnBack" onclick="history.back()">Quay lại</button>
</body>
</html>
