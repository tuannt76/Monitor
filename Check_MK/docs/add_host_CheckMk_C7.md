



# Hướng dẫn add host để Check_MK giám sát

Trước khi add thêm host để check_MK có thể giám sát thì **máy muốn được giám sát sẽ phải được download và cài đặt Agent của máy giám sát** (ở đây máy giam sát là Check_MK server) .

Link hướng dẫn cài ``Agent`` của checkMK vào máy cần được giám sát :

[Hướng dẫn cài đặt agent của check MK trên CentOS 7](./Set_up_agent_checkmk_C7.md)



Bài viết dưới đây sẽ hướng dẫn add host để check_Mk có thể giám sát :


Đăng nhập vào Check_MK và làm theo hướng dẫn

### Các bước để ADD host 

**<h2>1. Chọn Hosts ở mục SETTING**</h2>
![Imgur](https://i.imgur.com/hc469Vs.png)
**<h2>2. Chọn Add host**</h2>

![Imgur](https://i.imgur.com/Do3r2RA.png)



Điền tên cho host mới:

Nhập tên host và địa chỉ IP của host mới :

![Imgur](https://i.imgur.com/SNF5l70.png)

**<h2>3.Lưu và test thử:**</h2>

![Imgur](https://i.imgur.com/NAKxK5g.png)

Ping và agent hoàn thành là OK:


**<h2>4.Save & go to Services**</h2> 

![Imgur](https://i.imgur.com/FFxtUNy.png)


**<h2>5. Chọn  tất cả các Service mà check_mk tìm thấy**</h2>

![Imgur](https://i.imgur.com/EqMZCKx.png)

Hoặc chọn từng Service lẻ mà muốn giám sát :

![Imgur](https://i.imgur.com/Orugiw3.png)


Sau khi ấn chọn tất cả hoặc chọn 1 vài dịch vụ giám sát ta thấy các dịch vụ đã đươc giám sát ở dưới đây :

![Imgur](https://i.imgur.com/zDgTjAJ.png)

**<h2>6.Chọn **Changes****</h2>

![Imgur](https://i.imgur.com/Ny0hW8Z.png)

Chọn **Activate afected**, để kích hoạt các service.

![Imgur](https://i.imgur.com/7wgglem.png)

**<h2>7.Hoàn thành quá trình thêm các service, Ta vào mục all host để xem quá trình check_Mk giám sát :**</h2>

![Imgur](https://i.imgur.com/2uSeb4P.png)


Các host đang được giám sát( ở đây chỉ có 1 host ta vừa thêm vào) :

![Imgur](https://i.imgur.com/9r0Abcp.png)

Biểu thị các thông số `State`, `OK`,`Cr` đã được nhắc tới ở các bài trước(các thuật ngữ cơ bản trong Agent)  :

**<h2>8.Nếu các service không khởi động được:**</h2>

![Imgur](https://i.imgur.com/DAqTmJh.png)

![Imgur](https://i.imgur.com/aAuqfw4.png)

Click vào option và Chọn reschedule check :

![Imgur](https://i.imgur.com/eTuNsCX.png)


Như vậy đã hoàn thành add host và service cho Check_mk

Các dịch vụ đã được giám sát 
![Imgur](https://i.imgur.com/WQ44rOE.png)

