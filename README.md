# Hệ thống quản lí rạp chiếu phim

Code của project Subject No. 15, viết bằng JSP + DAO + MySQL theo thiết kế trong báo cáo. Gồm chức năng đăng nhập và module "Khách hàng tìm kiếm thông tin phim".

## Cấu trúc project

```
PTTKcinema/
├── pom.xml                          Cấu hình Maven (tự tải thư viện kết nối MySQL)
├── database/
│   └── cinema.sql                   Tạo CSDL cinema (11 bảng), phim mẫu và 3 tài khoản mẫu
└── src/main/
    ├── java/
    │   ├── model/
    │   │   ├── Member4.java         Lớp thực thể thành viên
    │   │   └── Movie4.java          Lớp thực thể phim
    │   └── dao/
    │       ├── DAO4.java            Kết nối CSDL dùng chung
    │       ├── MemberDAO4.java      checkLogin()
    │       └── MovieDAO4.java       searchMovie(), getMovieDetail()
    └── webapp/
        ├── index.jsp                Chuyển đến trang chủ khách hàng
        ├── member/
        │   ├── uiLogin.jsp          Trang đăng nhập
        │   ├── doLogin.jsp          Kiểm tra đăng nhập, chuyển trang theo vai trò
        │   └── doLogout.jsp         Đăng xuất
        ├── customer/
        │   ├── uiCustomerMain.jsp   Trang chủ khách hàng
        │   ├── uiSearchMovie.jsp    Tìm kiếm phim theo tên
        │   └── uiMovieDetail.jsp    Chi tiết phim
        ├── saler/
        │   └── uiSalerMain.jsp      Trang chủ nhân viên bán vé
        └── management/
            └── uiManagerMain.jsp    Trang chủ nhân viên quản lí
```

Tên các lớp Java được đặt bằng tiếng Anh, thêm số 4 ở cuối (chữ số cuối của mã sinh viên B23DCVT094): `Member4`, `Movie4`, `DAO4`, `MemberDAO4`, `MovieDAO4`.

## Cách chạy

1. Tạo CSDL: mở MySQL Workbench (hoặc dòng lệnh mysql) và chạy file `database/cinema.sql`. File này xóa CSDL `cinema` cũ (nếu có) rồi tạo lại.
2. Sửa thông tin kết nối trong `src/main/java/dao/DAO4.java` cho đúng với máy của bạn: `dbUrl` (cổng, mặc định 3306), `dbUser`, `dbPassword`.
3. Mở project bằng NetBeans (hoặc IDE khác hỗ trợ Maven) và chạy trên Apache Tomcat.
4. Mở trình duyệt: `http://localhost:8080/`

## Tài khoản mẫu

| Vai trò            | Tên đăng nhập | Mật khẩu | Trang sau khi đăng nhập          |
|--------------------|---------------|----------|----------------------------------|
| Khách hàng         | customer      | 123456   | customer/uiCustomerMain.jsp      |
| Nhân viên bán vé   | saler         | 123456   | saler/uiSalerMain.jsp            |
| Nhân viên quản lí  | manager       | 123456   | management/uiManagerMain.jsp     |

Trang đăng nhập: `http://localhost:8080/member/uiLogin.jsp` (hoặc click "Đăng nhập" ở trang chủ khách hàng).

- Trang chủ của nhân viên bán vé và nhân viên quản lí bắt buộc đăng nhập đúng vai trò; nếu chưa đăng nhập sẽ bị chuyển về trang đăng nhập.
- Trang chủ khách hàng và chức năng tìm kiếm phim không bắt buộc đăng nhập.
- Thư mục của nhân viên quản lí tên là `management` chứ không phải `manager`, vì Tomcat đã có sẵn ứng dụng Manager ở địa chỉ `/manager`.

## Luồng chạy của modul Tìm kiếm thông tin phim

1. `uiCustomerMain.jsp`: khách hàng click "Tìm kiếm phim".
2. `uiSearchMovie.jsp`: nhập tên phim, click "Tìm kiếm". Trang submit gọi chính nó, gọi `MovieDAO4.searchMovie()` và hiển thị danh sách các phim có tên chứa từ khóa.
3. Click vào tên một phim: `uiMovieDetail.jsp` gọi `MovieDAO4.getMovieDetail()` và hiển thị thông tin chi tiết của phim. Nút "Quay lại" trở về trang tìm kiếm.

Thử với từ khóa `yêu`: kết quả là hai phim "Hà Nội mến yêu" và "Mùa hè yêu thương".
