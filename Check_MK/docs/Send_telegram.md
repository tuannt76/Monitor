# Các bước setup cảnh báo Check_MK bởi Telegram

- [Các bước setup cảnh báo Check_MK bởi Telegram](#các-bước-setup-cảnh-báo-check_mk-bởi-telegram)
  - [1.Tạo Bot Telegram và lấy User ID](#1tạo-bot-telegram-và-lấy-user-id)
    - [1.1 Tạo Bot Telegram:](#11-tạo-bot-telegram)
    - [1.2 Xác định ID user](#12-xác-định-id-user)
  - [2. Cài Scripts trên check_Mk](#2-cài-scripts-trên-check_mk)
  - [3. Hướng dẫn gửi cảnh báo đến telelgram](#3-hướng-dẫn-gửi-cảnh-báo-đến-telelgram)
  - [4. Demo check_Mk gửi cảnh báo đến telegram](#4-demo-check_mk-gửi-cảnh-báo-đến-telegram)



## 1.Tạo Bot Telegram và lấy User ID

### 1.1 Tạo Bot Telegram:

Tìm `botfather` trên thanh tìm kiếm telegram :

![Imgur](https://i.imgur.com/wYgDDm1.png)

Thực hiện các bước sau:

`/newbot`

Đặt tên cho bot:

`TuanNT76_TEST_bot`

Xác nhận: Chú ý phải có hậu tố _bot ở sau thì mới tạo được botfather

`TuanNT76_TEST_bot`

Bạn sẽ nhận được thông tin con Bot Telegram của mình, lưu giữ lại chuỗi token.

![Imgur](https://i.imgur.com/x8M5uBi.png)

### 1.2 Xác định ID user 

Để người dùng bất kỳ nào có thể được nhận cảnh báo thì user phải chat vào con bot đó và ta sẽ lấy được ID của người dùng đó để thiết lập cảnh báo lên Check_MK.



**Bước 1** : vào trình duyệt web gõ theo link sau và điền bottoken của bạn 

ví dụ: 

```
https://api.telegram.org/botXXXXXXXXXXXXXXXXXX/getUpdates
```


Chú ý trước chuỗi token phải có `bot`

**Bước2 :** Sau đó chat với bot vừa tạo  :

 ![Imgur](https://i.imgur.com/qjMva5U.png)


- Refresh lại trang token thì sẽ cho ta một địa chỉ id đó là Chat ID( **nếu chưa ra ID thì chat với bot rồi tiếp tục f5**):

![Imgur](https://i.imgur.com/JdQQLRT.png)


**Ta sẽ có được ID của bot vừa tạo**

## 2. Cài Scripts trên check_Mk 

> Thao tác trên  check_MK server :

**Bước 1** :

```
Omd su my_site
```

**my_site** là site của bạn 

TRuy cập vào nơi sẽ lưu thư mục theo đường dẫn sau :

```
cd ~/local/share/check_mk/notifications/
```

**Bước 2** : Tải file ``srcipts`` trên trang chủ của Check_mk theo link sau :

```
wget --no-check-certificate https://raw.githubusercontent.com/filipnet/checkmk-telegram-notify/main/check_mk_telegram-notify.sh
```


**bước 3** : Cấp quyền cho file :

```
chmod ug+x check_mk_telegram-notify.sh
```
Sau đó :

```
omd restart apache
```


## 3. Hướng dẫn gửi cảnh báo đến telelgram

>Thao tác trên Check_Mk site của bạn :

**Bước 1** : truy cập theo đường dẫn **setup>Events>Notitication configuration**

![Imgur](https://i.imgur.com/DVsHZWk.png)

**Bước 2** : tạo 1 rule và điền các thông số sau  :

![Imgur](https://i.imgur.com/6A4rkAU.png)

Điền các thông số quan trọng sau :


- bot token telegram của bạn 

- Id bot telegram

- Tùy chọn tham số ``Pricacy`` đã được đề cập

![Imgur](https://i.imgur.com/RybUH0y.png)

## 4. Demo check_Mk gửi cảnh báo đến telegram 

Truy cập theo đường dẫn :

**Fake >overview > all hots > telegram > Services of Host > Service**

> gửi những cảnh báo đầu tiên 

**Bước 1:** Truy cập theo đường dẫn như hình :

![Imgur](https://i.imgur.com/5EXCBaN.png)

Chọn vào 1 dịch vụ đang bị cảnh báo CRIT

**Bước 2 :** Thao tác giống như hình 

![Imgur](https://i.imgur.com/UWJa03Z.png)

Ấn vào ``Fake check..``


**Bước 3:** ấn vào các thông số trong hình :

![Imgur](https://i.imgur.com/RybUH0y.png)

Ấn ``SAVE``

![Imgur](https://i.imgur.com/9an4Dj2.png)

Thành công :
![Imgur](https://i.imgur.com/AHF8zrG.png)

Đợi check_Mk gửi cảnh báo về :

![Imgur](https://i.imgur.com/AVV7PN0.png)

Thành công!

Nếu check_mk bị lỗi thì ta sẽ truy cập vào đường dẫn sau để gửi lại :

![Imgur](https://i.imgur.com/fRSelxB.png)


