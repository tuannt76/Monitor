
# Giám sát Router bằng SNMP :


Ở bài viết này ta sẽ thực hiện lab giám sát router Mikrotik bằng giao thức SNMP...

Để thực hiện bài lab ta cần dựng phần mền giả lập EVE-NG

https://github.com/tuannt76/CCNA/blob/main/docs/0.Setup_EVE-NG.md

https://github.com/tuannt76/CCNA/blob/main/docs/0.Setup_SecureSRT%2CMobaxterm.md

**Cài router Mikortik**

https://github.com/tuannt76/CCNA/blob/main/docs/0.H%C6%B0%E1%BB%9Bng_d%E1%BA%ABn_th%C3%AAm_Router_Mikrotik_v%C3%A0o_EVE-NG.md

![Imgur](https://i.imgur.com/XQzoYNb.png)

Mô hình mạng chỉ mang tính chất minh hoạ mô hình mạng thực tế :


ở bài viết này tôi thực hiện giám sát qua vmnet 8 :

Trước khi thực hiện việc giám sát ta cần **cấu hình mikotik** với những nội dung sau :

1. Cài ip tĩnh cho Miktotik
2. NAT để cho mikotik có thể ping được ra ngoài internet (có thể kiểm tra ping đơn giản đến vmnet8).
3. setup SNMP cho Router Mikotik


## Các bước cài check_MK để giám sát switch,Router qua giao thưc SNMP :

Trước khi cài ta cần kiểm tra xem router có SNMP chưa :

Thực hiện kiểm tra router trên server check_Mk  :

```
snmpwalk -v2c -c public 192.168.77.135
```

![Imgur](https://i.imgur.com/jAaKUGL.png)


Bước 1 : Truy cập vào đường dẫn theo hình :

![Imgur](https://i.imgur.com/tn8JNac.png)

ấn ``save``

![Imgur](https://i.imgur.com/9bNVbrq.png)

Chọn các dịch vụ ấn cần giám sát :
![Imgur](https://i.imgur.com/iUw73ac.png)

Sau đó Fix all :

![Imgur](https://i.imgur.com/jMhvF8g.png)

Hoàn tất quá trình giám sát router qua giao thức SNMP :

[Imgur](https://i.imgur.com/bDKttXh.png)

Check_Mk gửi cảnh báo :

![Imgur](https://i.imgur.com/gmnaWrM.png)