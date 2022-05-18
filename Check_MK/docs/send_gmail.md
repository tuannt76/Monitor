- [Cấu hình CheckMK cảnh báo qua Postfix-Email](#cấu-hình-checkmk-cảnh-báo-qua-postfix-email)
  - [1.Cấu hình Postfix](#1cấu-hình-postfix)
    - [1.1 Remove Sendmail](#11-remove-sendmail)
    - [1.2 Install postfix](#12-install-postfix)
    - [1.3 Configure Postfix](#13-configure-postfix)
    - [1.4 Configure Postfix SASL Credentials](#14-configure-postfix-sasl-credentials)
    - [1.5 Cho phép ứng dụng truy cập gmail](#15-cho-phép-ứng-dụng-truy-cập-gmail)
    - [Kiểm tra](#kiểm-tra)
  - [2. Cấu hình cảnh báo trên site CheckMK](#2-cấu-hình-cảnh-báo-trên-site-checkmk)
    - [2.1 Tạo group chứa User được nhận cảnh báo](#21-tạo-group-chứa-user-được-nhận-cảnh-báo)
    - [2.2 Cấu hình cảnh báo](#22-cấu-hình-cảnh-báo)

# Cấu hình CheckMK cảnh báo qua Postfix-Email

Hướng dẫn thiết lập cảnh báo qua email. Khi có bất thường với hệ thống thì cảnh báo sẽ được gửi về Gmail của bạn hoặc nhiều người trong nhóm

## 1.Cấu hình Postfix

Postfix là là một phần mềm nguồn mở được dùng để gửi mail (Mail ranfer Agent-MTA). Được phát hành bởi IBM với mục tieu thay thế trình gửi mail phổ biến là sendmail. 

Trong bài viết sẽ hướng dẫn cài đặt Postfix để gửi Mail trên CentOS-7.

### 1.1 Remove Sendmail

Trước tiên cần kiểm tra xem sendmail đã được cài đặt chưa bằng câu lệnh

```
rpm -qa | grep sendmail
```

Nếu có kết quả trả về chứng tỏ sendmail đã được cài đặt. Ta cần remove nó

```
yum remove sendmail*
```
>Nên xoá để cài đặt lại từ đầu 

### 1.2 Install postfix
Cài đặt postfix và một số gói liên quan

```
yum -y install postfix cyrus-sasl-plain mailx
```

Đặt postfix như MTA mặc định của hệ thống, (MTA tạm hiểu là tác nhân chuyển thư. Đây là dịch vụ xử lý các tin nhắn trực tuyến: chuyển thư từ máy tính đến một nơi khác)

```
alternatives --set mta /usr/sbin/postfix
```

Nếu câu lệnh bị lỗi và trả về output `/usr/sbin/postfix has not been configured as an alternative for mta` thì thực hiện lệnh sau:

```
alternatives --set mta /usr/sbin/sendmail.postfix
```

Restart và enable postfix

```
systemctl restart postfix
systemctl enable postfix
```

### 1.3 Configure Postfix
Mở file `main.cf` để chỉnh sửa

```
vi /etc/postfix/main.cf
```

Thêm vào cuối file những dòng sau:

```
myhostname = hostname.example.com
relayhost = [smtp.gmail.com]:587
smtp_use_tls = yes
smtp_sasl_auth_enable = yes
smtp_sasl_password_maps = hash:/etc/postfix/sasl_passwd
smtp_tls_CAfile = /etc/ssl/certs/ca-bundle.crt
smtp_sasl_security_options = noanonymous
smtp_sasl_tls_security_options = noanonymous
```

### 1.4 Configure Postfix SASL Credentials

Tạo file `/etc/postfix/sasl_passwd` và thêm vào dòng sau

```
[smtp.gmail.com]:587 username:password
```


Trong đó:
* username: địa chỉ Email dùng để gửi mail cảnh báo đi
* password: Là password Email dùng để gửi mail cảnh báo đi

**<h2>Gmail là acc gmail thật của bạn**</h2>


Phân quyền cho file vừa tạo:

```
postmap /etc/postfix/sasl_passwd
chown root:postfix /etc/postfix/sasl_passwd*
chmod 640 /etc/postfix/sasl_passwd*
systemctl reload postfix
```

<h2>Khi thêm hoặc sửa lại gmail thì phải phân quyền lại cho gmail mới bằng các dòng lệnh trên</h2>

### 1.5 Cho phép ứng dụng truy cập gmail



Đăng nhập Gmail của gmail thêm vào file phía trên trên URL trình duyệt web và tiếp tục chạy tiếp URL sau: 

```
https://myaccount.google.com/lesssecureapps
```


**Bật** chế độ cho phép ứng dụng truy cập

![Imgur](https://i.imgur.com/OGR453c.png)

### Kiểm tra

Kiểm tra lại xem đã gửi mail thành công chưa

```
echo "Đã gửi thành công" | mail -s "Mail kiểm tra" ngoctuan76999@gmail.com
```
>Note : ngoctuan7699@gmail.com là địa chỉ mail nhận còn mail phía trên là mail gửi 


![Imgur](https://i.imgur.com/FeDsiiM.png)

**Như vậy đã cài đặt thành công Postfix cho Server chuyển xang cài Cảnh báo**

## 2. Cấu hình cảnh báo trên site CheckMK

### 2.1 Tạo group chứa User được nhận cảnh báo


**Bước 1 :**Truy cập theo đường dẫn , sau đó ta nhấn vào `add group` : :

![Imgur](https://i.imgur.com/rDDabmO.png)


Điền đầy đủ thông tin và lưu

![Imgur](https://i.imgur.com/gBm2ndX.png)

chọn Save


**Bước 2 :** truy cập theo đường dẫn và sau đó chọn `add user` :


![Imgur](https://i.imgur.com/Oi1WNDF.png)

Điền đầy đủ thông tin cho user

![Imgur](https://i.imgur.com/D60fwZl.png)

Lưu lại khi hoàn thành thông tin

Cập nhật thông tin sau khi thay đổi

![Imgur](https://i.imgur.com/nluRnQp.png)

### 2.2 Cấu hình cảnh báo

**Bước 1** :Truy cập theo đường dẫn :

![Imgur](https://i.imgur.com/1WBgOnC.png)

**Bước 2** Tạo Notification rule :

![Imgur](https://i.imgur.com/AwTj2nQ.png)

- Kéo xuống dưới ta sẽ tích thêm vào những ô cần cảnh báo :

![Imgur](https://i.imgur.com/MKaq50p.png)


**Lưu và kích hoạt sự thay đổi**

Kiểm tra khi có thay đổi của host:

![Imgur](https://i.imgur.com/Bstboke.png)

Khi có thay đổi của Service:

![Imgur](https://i.imgur.com/F0AL9UI.png)


