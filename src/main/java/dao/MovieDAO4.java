package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.Movie4;

public class MovieDAO4 extends DAO4 {

    public MovieDAO4() {
        super();
    }

    /**
     * Tìm các phim có tên chứa từ khóa đã nhập.
     * @param name từ khóa trong tên phim
     * @return mảng các phim tìm được (mảng rỗng nếu không có), null nếu có lỗi
     */
    public Movie4[] searchMovie(String name) {
        ArrayList<Movie4> list = new ArrayList<Movie4>();
        String sql = "SELECT * FROM tblMovie WHERE name LIKE ? ORDER BY name";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, "%" + name + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(toMovie(rs));
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return list.toArray(new Movie4[0]);
    }

    /**
     * Lấy thông tin chi tiết của một phim.
     * @param id id của phim đã chọn
     * @return phim tìm được, null nếu không có hoặc có lỗi
     */
    public Movie4 getMovieDetail(int id) {
        Movie4 movie = null;
        String sql = "SELECT * FROM tblMovie WHERE id = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                movie = toMovie(rs);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
            movie = null;
        }
        return movie;
    }

    // đóng gói một dòng kết quả thành đối tượng Movie4
    private Movie4 toMovie(ResultSet rs) throws Exception {
        Movie4 movie = new Movie4();
        movie.setId(rs.getInt("id"));
        movie.setName(rs.getString("name"));
        movie.setGenre(rs.getString("genre"));
        movie.setDuration(rs.getInt("duration"));
        movie.setDirector(rs.getString("director"));
        movie.setDescription(rs.getString("description"));
        movie.setStatus(rs.getString("status"));
        return movie;
    }
}
