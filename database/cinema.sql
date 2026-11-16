-- CSDL của hệ thống quản lí rạp chiếu phim (MySQL)
-- Gồm 11 bảng theo Bảng 1 của báo cáo, dữ liệu mẫu cho bảng tblMovie
-- và 3 tài khoản mẫu để đăng nhập (mật khẩu đều là 123456).

DROP DATABASE IF EXISTS cinema;
CREATE DATABASE cinema CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE cinema;

CREATE TABLE tblMember (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255),
    password VARCHAR(255),
    fullName VARCHAR(255),
    birthday DATE,
    address VARCHAR(255),
    email VARCHAR(255),
    phone VARCHAR(255),
    role VARCHAR(255)
);

CREATE TABLE tblCustomer (
    tblMemberId INT PRIMARY KEY,
    point INT,
    FOREIGN KEY (tblMemberId) REFERENCES tblMember(id)
);

CREATE TABLE tblMembershipCard (
    id INT AUTO_INCREMENT PRIMARY KEY,
    code VARCHAR(255),
    issueDate DATE,
    tblCustomerId INT,
    tblMemberId INT,
    FOREIGN KEY (tblCustomerId) REFERENCES tblCustomer(tblMemberId),
    FOREIGN KEY (tblMemberId) REFERENCES tblMember(id)
);

CREATE TABLE tblCinema (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    address VARCHAR(255),
    description VARCHAR(255)
);

CREATE TABLE tblRoom (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    description VARCHAR(255),
    tblCinemaId INT,
    FOREIGN KEY (tblCinemaId) REFERENCES tblCinema(id)
);

CREATE TABLE tblSeat (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    type VARCHAR(255),
    tblRoomId INT,
    FOREIGN KEY (tblRoomId) REFERENCES tblRoom(id)
);

CREATE TABLE tblMovie (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    genre VARCHAR(255),
    duration INT,
    director VARCHAR(255),
    description VARCHAR(255),
    status VARCHAR(255)
);

CREATE TABLE tblTimeSlot (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    startTime TIME,
    endTime TIME
);

CREATE TABLE tblShowtime (
    id INT AUTO_INCREMENT PRIMARY KEY,
    showDate DATE,
    price FLOAT,
    tblMovieId INT,
    tblRoomId INT,
    tblTimeSlotId INT,
    FOREIGN KEY (tblMovieId) REFERENCES tblMovie(id),
    FOREIGN KEY (tblRoomId) REFERENCES tblRoom(id),
    FOREIGN KEY (tblTimeSlotId) REFERENCES tblTimeSlot(id)
);

CREATE TABLE tblInvoice (
    id INT AUTO_INCREMENT PRIMARY KEY,
    saleDate DATE,
    saleType VARCHAR(255),
    tblCustomerId INT,
    tblMemberId INT,
    FOREIGN KEY (tblCustomerId) REFERENCES tblCustomer(tblMemberId),
    FOREIGN KEY (tblMemberId) REFERENCES tblMember(id)
);

CREATE TABLE tblTicket (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tblShowtimeId INT,
    tblSeatId INT,
    tblInvoiceId INT,
    FOREIGN KEY (tblShowtimeId) REFERENCES tblShowtime(id),
    FOREIGN KEY (tblSeatId) REFERENCES tblSeat(id),
    FOREIGN KEY (tblInvoiceId) REFERENCES tblInvoice(id)
);

-- Dữ liệu mẫu để chạy modul Tìm kiếm thông tin phim
INSERT INTO tblMovie (name, genre, duration, director, description, status) VALUES
('Hà Nội mến yêu', 'Tình cảm', 110, 'Nguyễn Văn A', 'Chuyện tình yêu ở Hà Nội', 'đang chiếu'),
('Mùa hè yêu thương', 'Hài', 95, 'Trần Thị B', 'Kì nghỉ hè đáng nhớ của một gia đình', 'đang chiếu'),
('Chuyến xe cuối cùng', 'Tâm lí', 102, 'Lê Văn C', 'Hành trình về quê của người tài xế già', 'đang chiếu'),
('Bí mật ngôi nhà cổ', 'Kinh dị', 98, 'Nguyễn Văn A', 'Những điều kì lạ trong ngôi nhà cổ', 'đang chiếu'),
('Cuộc đua kì thú', 'Hoạt hình', 88, 'Trần Thị B', 'Cuộc đua của các bạn nhỏ trong rừng', 'ngừng chiếu'),
('Người bạn năm ấy', 'Tình cảm', 115, 'Lê Văn C', 'Tình bạn thời học sinh', 'ngừng chiếu');

-- Tài khoản mẫu để đăng nhập: mỗi vai trò một tài khoản, mật khẩu đều là 123456
INSERT INTO tblMember (username, password, fullName, birthday, address, email, phone, role) VALUES
('customer', '123456', 'Nguyễn Văn An', '2000-01-15', 'Hà Nội', 'customer@example.com', '0900000001', 'customer'),
('saler', '123456', 'Trần Thị Bình', '1998-05-20', 'Hà Nội', 'saler@example.com', '0900000002', 'saler'),
('manager', '123456', 'Lê Văn Cường', '1990-09-10', 'Hà Nội', 'manager@example.com', '0900000003', 'manager');

-- Khách hàng có thêm một dòng trong bảng tblCustomer
INSERT INTO tblCustomer (tblMemberId, point)
SELECT id, 0 FROM tblMember WHERE username = 'customer';
