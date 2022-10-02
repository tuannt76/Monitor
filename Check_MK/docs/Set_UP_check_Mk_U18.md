# Hướng dẫn cài đặt Check_MK_U18


- [Hướng dẫn cài đặt Check_MK_U18](#hướng-dẫn-cài-đặt-check_mk_u18)
  - [1.Mô hình triển khai](#1mô-hình-triển-khai)
  - [2. Cài đặt Check_Mk server](#2-cài-đặt-check_mk-server)



## 1.Mô hình triển khai

Dựng check_MK lên 1 OS Ubuntu_u18

![Imgur](https://i.imgur.com/EMfgMiL.png)

IP Planning

![Imgur](https://i.imgur.com/Xacmabs.png)

## 2. Cài đặt Check_Mk server


**Lưu ý trước khi cài đặt :**

<h2>Update máy chủ trước khi cài đặt để tránh lỗi</h2>

```
yum update -y
reboot 
```


Các câu lệnh đang được thực hiện **Root** trên Ubuntu.

Thực hiện trên user thêm ``SU`` vào phía trước.


Tải file cài đặt check_MK 2.0:

Cú pháp :

```
wget https://download.checkmk.com/checkmk/..../....
```
Link trang chủ CheckMK để kiểm tra phiên bản trước khi cài đặt:

```
https://checkmk.com/download
```

Cài đặt bản CheckMK 2.0.0p23 :

```
wget https://download.checkmk.com/checkmk/2.0.0p23/check-mk-raw-2.0.0p23_0.bionic_amd64.deb
```

![Imgur](https://i.imgur.com/gB69R6w.png)

Cài đặt CheckMK

```
apt install check-mk-raw-2.0.0p23_0.bionic_amd64.deb
```

Tạo một site 

`omd create  my_site`

**Ví dụ** :

![Imgur](https://i.imgur.com/TnG4ya0.png)

``` 
omd create tuanntu18
```

Khởi động site

```
omd start tuanntu18
```
![Imgur](https://i.imgur.com/mxiaBjB.png)

Luôn bật Check_Mk khi khởi động server : 

Đổi mật khẩu cho User **cmkadmin**

```
su - tuanntu18
htpasswd -m etc/htpasswd cmkadmin
```

```
Nhập mật khẩu cho user
New password:
Re-type new password:
Updating password for user cmkadmin
```

![Imgur](https://i.imgur.com/fFBe8bd.png)


Quay lại User **root** để thực hiện tiếp câu lệnh (`Ctrl` + `d`)

**Các option thực hiện với OMD**

```
Omd
```

![Imgur](https://i.imgur.com/8IhSFqm.png)

Sau khi cài đặt truy cập vào trình duyệt : chorome, firefox,... 


**Đăng nhập và truy cập vào bằng user như trên**  :

![Imgur](https://i.imgur.com/afBnFFV.png)

**Giao diện check_Mk 2.0**

![Imgur](https://i.imgur.com/buyD6sI.png)


