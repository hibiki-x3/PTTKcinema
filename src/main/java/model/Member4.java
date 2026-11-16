package model;

import java.util.Date;

/**
 * Lớp thực thể Member4 (thành viên), tương ứng với bảng tblMember.
 * Thuộc tính role cho biết thành viên là khách hàng (customer),
 * nhân viên bán vé (saler) hay nhân viên quản lí (manager).
 */
public class Member4 {
    private int id;
    private String username;
    private String password;
    private String fullName;
    private Date birthday;
    private String address;
    private String email;
    private String phone;
    private String role;

    public Member4() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
}
