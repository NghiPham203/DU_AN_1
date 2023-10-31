-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3306
-- Thời gian đã tạo: Th10 31, 2023 lúc 10:50 AM
-- Phiên bản máy phục vụ: 8.0.30
-- Phiên bản PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `organic`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `binhluan`
--

CREATE TABLE `binhluan` (
  `MaBL` int NOT NULL,
  `MaSP` int NOT NULL,
  `MaTK` int NOT NULL,
  `NoiDung` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `NgayBL` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitietdonhang`
--

CREATE TABLE `chitietdonhang` (
  `MaDH` int NOT NULL,
  `MaSP` int NOT NULL,
  `GiaSP` double(10,0) NOT NULL,
  `SoLuong` int NOT NULL,
  `TongTien` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitietgiohang`
--

CREATE TABLE `chitietgiohang` (
  `MaSP` int NOT NULL,
  `MaGH` int NOT NULL,
  `TenSP` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `GiaSP` double(10,2) DEFAULT NULL,
  `SoLuong` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danhmuc`
--

CREATE TABLE `danhmuc` (
  `MaDM` int NOT NULL,
  `TenDM` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `SoThuTu` int NOT NULL COMMENT 'số thứ tự mà danh mục sẽ xuất hiện , tùy mình sắp xếp',
  `UuTien` tinyint(1) NOT NULL COMMENT '0: là cho nó ẩn đi, 1 là cho nó xuất hiện tại trang chủ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `donhang`
--

CREATE TABLE `donhang` (
  `MaDH` int NOT NULL,
  `HoTen` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `Email` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `SoDienThoai` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `DiaChi` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `Quyen` tinyint(1) NOT NULL DEFAULT '0',
  `GhiChu` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `TrangThai` int NOT NULL COMMENT '0.Đơn hàng mới 1.Đang xử lý 2.Đang giao hàng 3.Đã giao	',
  `TongTien` int NOT NULL DEFAULT '0',
  `NgayDat` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `MaTK` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `giohang`
--

CREATE TABLE `giohang` (
  `MaGH` int NOT NULL,
  `MaTK` int NOT NULL,
  `TenSP` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `GiaSP` double(10,0) NOT NULL,
  `HinhAnh` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `SoLuong` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sanpham`
--

CREATE TABLE `sanpham` (
  `MaSP` int NOT NULL,
  `TenSP` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `GiaSP` double(10,0) NOT NULL DEFAULT '0' COMMENT 'Tiền Việt không có chữ số thập phân, mặc định là 0(nếu =0 thì hết hàng ví dụ )',
  `HinhAnh` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `TieuDe` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `MoTa` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `SoLuong` int NOT NULL,
  `Discount` int NOT NULL COMMENT '% giảm giá của 1 sản phẩm',
  `New` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: Bình thường , 1: là sản phẩm mới(Sản Phẩm mới trên 1 session)',
  `MaDM` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `taikhoan`
--

CREATE TABLE `taikhoan` (
  `MaTK` int NOT NULL,
  `HoTen` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `UserName` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'Biệt danh',
  `Email` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `MatKhau` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `DiaChi` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `GioiTinh` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: là nam, 1: là nữ',
  `SoDienThoai` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `Quyen` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: là user, 1: là admin'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `binhluan`
--
ALTER TABLE `binhluan`
  ADD PRIMARY KEY (`MaBL`),
  ADD KEY `MaSP` (`MaSP`),
  ADD KEY `MaTK` (`MaTK`);

--
-- Chỉ mục cho bảng `chitietdonhang`
--
ALTER TABLE `chitietdonhang`
  ADD PRIMARY KEY (`MaDH`,`MaSP`),
  ADD KEY `MaSP` (`MaSP`);

--
-- Chỉ mục cho bảng `chitietgiohang`
--
ALTER TABLE `chitietgiohang`
  ADD PRIMARY KEY (`MaSP`,`MaGH`),
  ADD KEY `MaGH` (`MaGH`);

--
-- Chỉ mục cho bảng `danhmuc`
--
ALTER TABLE `danhmuc`
  ADD PRIMARY KEY (`MaDM`);

--
-- Chỉ mục cho bảng `donhang`
--
ALTER TABLE `donhang`
  ADD PRIMARY KEY (`MaDH`),
  ADD KEY `MaTK` (`MaTK`);

--
-- Chỉ mục cho bảng `giohang`
--
ALTER TABLE `giohang`
  ADD PRIMARY KEY (`MaGH`),
  ADD KEY `MaTK` (`MaTK`);

--
-- Chỉ mục cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`MaSP`),
  ADD KEY `MaDM` (`MaDM`);

--
-- Chỉ mục cho bảng `taikhoan`
--
ALTER TABLE `taikhoan`
  ADD PRIMARY KEY (`MaTK`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `binhluan`
--
ALTER TABLE `binhluan`
  MODIFY `MaBL` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `danhmuc`
--
ALTER TABLE `danhmuc`
  MODIFY `MaDM` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `donhang`
--
ALTER TABLE `donhang`
  MODIFY `MaDH` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `giohang`
--
ALTER TABLE `giohang`
  MODIFY `MaGH` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  MODIFY `MaSP` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `taikhoan`
--
ALTER TABLE `taikhoan`
  MODIFY `MaTK` int NOT NULL AUTO_INCREMENT;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `binhluan`
--
ALTER TABLE `binhluan`
  ADD CONSTRAINT `binhluan_ibfk_1` FOREIGN KEY (`MaSP`) REFERENCES `sanpham` (`MaSP`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `binhluan_ibfk_2` FOREIGN KEY (`MaTK`) REFERENCES `taikhoan` (`MaTK`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Các ràng buộc cho bảng `chitietdonhang`
--
ALTER TABLE `chitietdonhang`
  ADD CONSTRAINT `chitietdonhang_ibfk_1` FOREIGN KEY (`MaDH`) REFERENCES `donhang` (`MaDH`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `chitietdonhang_ibfk_2` FOREIGN KEY (`MaSP`) REFERENCES `sanpham` (`MaSP`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Các ràng buộc cho bảng `chitietgiohang`
--
ALTER TABLE `chitietgiohang`
  ADD CONSTRAINT `chitietgiohang_ibfk_1` FOREIGN KEY (`MaGH`) REFERENCES `giohang` (`MaGH`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `chitietgiohang_ibfk_2` FOREIGN KEY (`MaSP`) REFERENCES `sanpham` (`MaSP`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Các ràng buộc cho bảng `donhang`
--
ALTER TABLE `donhang`
  ADD CONSTRAINT `donhang_ibfk_1` FOREIGN KEY (`MaTK`) REFERENCES `taikhoan` (`MaTK`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Các ràng buộc cho bảng `giohang`
--
ALTER TABLE `giohang`
  ADD CONSTRAINT `giohang_ibfk_1` FOREIGN KEY (`MaTK`) REFERENCES `taikhoan` (`MaTK`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Các ràng buộc cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD CONSTRAINT `sanpham_ibfk_1` FOREIGN KEY (`MaDM`) REFERENCES `danhmuc` (`MaDM`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
