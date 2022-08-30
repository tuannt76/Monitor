

**Tài liệu hướng dẫn Cài đặt Agent CheckMK sử dụng script**


*Thực hiện trên dòng lệnh Linux CentOS 7 hoặc Ubuntu*

**Bước 1**: Tải file script
Thực hiện lệnh sau

```
yum update -y
yum install wget -y
wget https://raw.githubusercontent.com/tuannt76/Monitoring/main/Check_MK/CheckMK_Agent.sh
```
or Ubuntu
```
apt update
apt upgrade
apt install wget
wget https://raw.githubusercontent.com/tuannt76/Monitoring/main/Check_MK/CheckMK_Agent.sh

```


**Bước 2**: Cấp quyền thực thi cho script

Thực hiện lệnh:

```
chmod +x CheckMK_Agent.sh
```

**Bước 3**: Chạy script

Thực hiện lệnh

```
bash CheckMK_Agent.sh
```

Bước 4 : điền các thông số hiện trên màn hình để hoàn thành cài Agent
