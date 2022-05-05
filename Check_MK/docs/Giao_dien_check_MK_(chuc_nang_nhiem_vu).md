
- [Giao diện người dùng check_MK](#giao-diện-người-dùng-check_mk)
  - [1. Giới thiệu](#1-giới-thiệu)
  - [2.Thanh điều hướng](#2thanh-điều-hướng)
    - [2.1 Các option bên trên thanh điều hướng](#21-các-option-bên-trên-thanh-điều-hướng)
      - [2.1.1 Thanh monitor](#211-thanh-monitor)
      - [2.1.2 Thanh Customize](#212-thanh-customize)
      - [2.1.3 Thanh Setup](#213-thanh-setup)
    - [2.2 Các option bên dưới thanh điều hướng](#22-các-option-bên-dưới-thanh-điều-hướng)
  - [3. Các Trang chính hay theo dõi](#3-các-trang-chính-hay-theo-dõi)
    - [3.1 ALL host](#31-all-host)
    - [3.2 Trang dashboard(trang tổng quan)](#32-trang-dashboardtrang-tổng-quan)
    - [3.5 Overview](#35-overview)
- [Tài liệu tham khảo](#tài-liệu-tham-khảo)

# Giao diện người dùng check_MK


## 1. Giới thiệu

Giao diện người dùng đồ hoạ (GUI) của CheckMK có 2 chức năng :
- Nó hiển thị trạng thái hiện tại của tất cả các máy chủ, dịch vụ và sự kiện trong môi trường giám sát 
- Nó được sử dụng trong môi trường cấu hình để thiết lập và quản lý môi trường giám sát 

Đối với cả 2 chức năng này, Checkmk cung cấp 2 chế độ xem của máy chủ và dịch vụ - và cũng có 2 menu để bắt đầu với cả 2 chức năng :menu màn hình và menu Cài đặt.

Hình ảnh sau đây cho thấy trang bắt đầu của Chekmk, bạn có thể nhìn thấy trang này ngay sau khi đăng nhập 

![Imgur](https://i.imgur.com/dKyc44p.png)

## 2.Thanh điều hướng

<img src= https://i.imgur.com/BhjWaLm.png align=left height= 450 px>

- Với thanh điều hướng ở bên trái và các biểu tượng trong đó, bạn đưa ra các quyết định cơ bản về những gì Checkmk sẽ làm cho bạn :

### 2.1 Các option bên trên thanh điều hướng
<img src = https://imgur.com/Mj2mtyd.png align=left height= 140 px >


**Monitor** -  Giám sát

**Cumstomize** - Để tuỳ chỉnh các phần giao diện cho việc giám sát

**Setup** - Để thiết lập các đối tượng được giám sát 

Đằng sau ba biểu tượng này là các menu ít nhiều mở rôngj, cái gọi là 'memnu lớn' hoặc menu biểu tượng


Ở cuối thanh điều hướng, trong menu người dung, bạn sẽ tìm thấy các mục nhập áp dụng cho tài khoản người dùng checkmk của mình. 



#### 2.1.1 Thanh monitor

Trong **monitor**, bạn sẽ tìm thấy các công cụ sẽ cung cấp cho bạn câu trả lời cho các câu hỏi giám sát của bạn. Menu được chia nhỏ theo các chủ đề. Bạn sẽ tìm thấy các mục menu được liệt kê bên dưới mỗi chủ đề:

![Imgur](https://i.imgur.com/8cwrSdz.png)



Các option :


![Imgur](https://i.imgur.com/vshtq71.png)

Chú thích :

**Overview**

1. Main dashboard :bảng điều khiển chính  
2. All host : Tất cả các máy chủ
3. Host search : tìm kiếm 1 host
4. Service search : TÌm kiếm máy chủ lưu trữ
5. Network topology : Cấu trúc mạng
6. Host groups : Nhóm host 
7. Service groups : nhóm dịch vụ
8. Sheduled downtimes : thời gian ngừng hoạt động
9. Comments : 


**Problems**

10. Host & service problems :  các vấn đề liên quan đến máy chủ và dịch vụ
11. Host problems : sự cố máy chủ
12. Service problems: sự cố dịch vụ
13. stale services :  dịch vụ stale
14. Alert Statistics : Thống kê cảnh báo 



**History**

15. Host & service ebents : sự kiện host và dịch vụ
16. 
17. Host & Service History : log host và dịch vụ  
18. Downtime history : lịch sử thời gian downtime 
19. Search history : tìm kiếm lịch sử
20. Search time graphs :Đồ thị thời gian tìm kiếm
21. Search perofmance data : tìm kiếm dữ liệu hiệu suất
22. Service check durations : thời lượng kiểm tra dịch vụ
23. Recently changed services :Các dịch vụ đã thay đổi gần đây 


**System** : 



**Event Console** :



**Inventory** :



#### 2.1.2 Thanh Customize

#### 2.1.3 Thanh Setup

### 2.2 Các option bên dưới thanh điều hướng

Trong **Help**, bạn sẽ tìm thấy phiên bản và phiên bản chẹcmk hiện đang được sử dung và một số mục nhập mà bạn có thể gọi ra tài liệu và thông tin- bên trong Checkmk hoặc bên ngoài. 

![Imgur](https://i.imgur.com/ygY1hIE.png)

Trong **User** Ở trên cùng bên phải của menu, bạn sẽ thấy tên người dùng hiện tại (cmkadmin) và vai trò(admin) được chỉ định cho người dùng này. Trong menu này, bạn có thể thay đổi mật khẩu, đăng xuất khỏi giao diện Checkmk và cá nhân hoá hồ sơ của mình. Có thể tìm thấy tổng quan về các cài đặt cá nhận có sẵn trong chương trên menu Người dùng.

![Imgur](https://i.imgur.com/GEAu4Wb.png)


Thanh điều hướng được hoàn thành ở phái dưới cùng của Sidebar (cho phép bạn ẩn hoặc hiển thị thanh bên bằng cách chỉ cần nhấp vào nó) và ở trên cùng bởi biểu tượng Checkmk. Nhấp vào biểu tượng luôn đưa bạn trở lại trang tổng quan mặc định được hiển thị trên trang chnhs

![Imgur](https://i.imgur.com/5qdxlBJ.png)




## 3. Các Trang chính hay theo dõi 

### 3.1 ALL host

![Imgur](https://i.imgur.com/haG9lhz.png)


- Chứa thông tin tất cả các host mà Check_Mk đang giám sát bao gồm các trạng thái và các dịch vụ check_MK đang giám sát.

### 3.2 Trang dashboard(trang tổng quan)

![Imgur](https://i.imgur.com/ecHQXiP.png)

Trang tổng quan cho phép bạn thêm sửa các hoạt động cần giám sát theo ý muốn của mình.


### 3.5 Overview

![Imgur](https://i.imgur.com/3QvtW8W.png)



# Tài liệu tham khảo 

   1. https://checkmk.com/product/latest-version
   2. https://github.com/huydv398/Ghichep-CkeckMK
   3. https://news.cloud365.vn/?s=checkmk

