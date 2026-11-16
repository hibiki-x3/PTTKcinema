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
    request.setCharacterEncoding("UTF-8");
    // trang submit gọi chính nó: nếu đã có tên phim thì gọi MovieDAO4 để tìm
    String name = request.getParameter("txtMovieName");
    Movie4[] listMovie = null;
    if (name != null) {
        name = name.trim();
        listMovie = (new MovieDAO4()).searchMovie(name);
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tìm kiếm phim</title>
</head>
<body>
    <h2>Tìm kiếm phim</h2>
    <form name="searchMovie" action="uiSearchMovie.jsp" method="get">
        Tên phim:
        <input type="text" id="txtMovieName" name="txtMovieName" value="<%=esc(name)%>" required />
        <input type="submit" id="btnSearch" value="Tìm kiếm" />
    </form>
    <%
        if (name != null && listMovie == null) {
    %>
    <p>Có lỗi khi kết nối cơ sở dữ liệu.</p>
    <%
        } else if (listMovie != null && listMovie.length == 0) {
    %>
    <p>Không tìm thấy phim nào có tên chứa "<%=esc(name)%>".</p>
    <%
        } else if (listMovie != null) {
    %>
    <br />
    <table id="tblMovie" border="1" cellpadding="5">
        <tr>
            <th>TT</th>
            <th>Tên phim</th>
            <th>Thể loại</th>
            <th>Thời lượng</th>
        </tr>
        <%
            for (int i = 0; i < listMovie.length; i++) {
                Movie4 movie = listMovie[i];
        %>
        <tr>
            <td><%=i + 1%></td>
            <td><a href="uiMovieDetail.jsp?id=<%=movie.getId()%>"><%=esc(movie.getName())%></a></td>
            <td><%=esc(movie.getGenre())%></td>
            <td><%=movie.getDuration()%></td>
        </tr>
        <%
            }
        %>
    </table>
    <%
        }
    %>
</body>
</html>
