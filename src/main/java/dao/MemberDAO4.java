package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import model.Member4;

public class MemberDAO4 extends DAO4 {

    public MemberDAO4() {
        super();
    }

    /**
     * Kiểm tra đăng nhập.
     * @param member thành viên đã có username và password do người dùng nhập
     * @return true nếu đúng tên đăng nhập và mật khẩu; khi đó các thuộc tính
     *         còn lại của member (id, fullName, role, ...) được điền từ CSDL
     */
    public boolean checkLogin(Member4 member) {
        boolean result = false;
        if (member.getUsername() == null || member.getPassword() == null) {
            return false;
        }
        String sql = "SELECT * FROM tblMember WHERE username = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, member.getUsername());
            ResultSet rs = ps.executeQuery();
            // so sánh trong Java để phân biệt chữ hoa, chữ thường
            if (rs.next() && member.getUsername().equals(rs.getString("username"))
                    && member.getPassword().equals(rs.getString("password"))) {
                member.setId(rs.getInt("id"));
                member.setFullName(rs.getString("fullName"));
                member.setBirthday(rs.getDate("birthday"));
                member.setAddress(rs.getString("address"));
                member.setEmail(rs.getString("email"));
                member.setPhone(rs.getString("phone"));
                member.setRole(rs.getString("role"));
                result = true;
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
            result = false;
        }
        return result;
    }
}
