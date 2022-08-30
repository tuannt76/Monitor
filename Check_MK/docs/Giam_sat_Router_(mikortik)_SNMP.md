
# Giám sát Router bằng SNMP :

**Tham khảo Trước bài viết**

[Cấu hình SNMP để CheckMK giám sát bằng SNMP](https://docs.google.com/document/d/1TbI46OWf7iUFGMwfoPauLQ1WwGwiToKuvA7H_lMTpxM/edit?usp=sharing)


Ở bài viết này ta sẽ ```thực hiện lab``` giám sát router Mikrotik bằng giao thức SNMP...

Để thực hiện bài lab ta cần dựng phần mền giả lập EVE-NG

https://github.com/tuannt76/CCNA/blob/main/docs/0.Setup_EVE-NG.md

https://github.com/tuannt76/CCNA/blob/main/docs/0.Setup_SecureSRT%2CMobaxterm.md

**Cài router Mikortik**

https://github.com/tuannt76/CCNA/blob/main/docs/0.H%C6%B0%E1%BB%9Bng_d%E1%BA%ABn_th%C3%AAm_Router_Mikrotik_v%C3%A0o_EVE-NG.md

![Imgur](https://i.imgur.com/XQzoYNb.png)

Mô hình mạng chỉ mang tính chất minh hoạ mô hình mạng thực tế :


ở bài viết này tôi thực hiện giám sát qua vmnet 8 :

Trước khi thực hiện việc giám sát ta cần **cấu hình mikotik** với những nội dung sau :

1. Cài ip tĩnh cho Miktotik, cài đặt SNMP cho Mikrotik
2. NAT để cho mikotik có thể ping được ra ngoài internet (có thể kiểm tra ping đơn giản đến vmnet8).
3. setup SNMP cho Router Mikotik

Cấu hình SNMP trên Mikrotik

Lệnh cấu hình SNMP trên SW :
Lệnh trên switch
==================
Ví dụ :
snmp-server community “public” ro
snmp-server enable traps snmp
snmp-server contact "public"
snmp-server location "public"
snmp-server host 10.0.11.61 version 2c public udp-port 162
show snmp



## Các bước cài check_MK để giám sát switch,Router qua giao thức SNMP :

Trước khi cài ta cần kiểm tra xem router có SNMP chưa :

Thực hiện kiểm tra router trên **server check_Mk**  :

```
snmpwalk -v2c -c public 192.168.77.135
```

![Imgur](https://i.imgur.com/jAaKUGL.png)

**<h2>Nếu chưa được thì phải xem xét lại các cài đặt phía trên**</h2>

>Thực hiện trên check_Mk :


Bước 1 : Truy cập vào đường dẫn theo hình :

![Imgur](https://i.imgur.com/tn8JNac.png)

Nhớ thêm **comutiny** vào dòng **SNMP credentials**

**comutiny** ở bài lab này là **"public"**

ấn ``save``

![Imgur](https://i.imgur.com/9bNVbrq.png)

Bước 2 : Chọn các dịch vụ ấn cần giám sát :
![Imgur](https://i.imgur.com/iUw73ac.png)



Bước 3 : Sau đó Fix all :

![Imgur](https://i.imgur.com/jMhvF8g.png)

Bước 4 : Hoàn tất quá trình giám sát router qua giao thức SNMP :

![Imgur](https://i.imgur.com/bDKttXh.png)

Check_Mk tự động gửi cảnh báo :

![Imgur](https://i.imgur.com/gmnaWrM.png)

