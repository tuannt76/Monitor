
# Tổng quan Nagios

- [Tổng quan Nagios](#tổng-quan-nagios)
  - [1.Nagios là gì ?](#1nagios-là-gì-)
    - [1.1. Tổng quan về Nagios ?](#11-tổng-quan-về-nagios-)
    - [1.2. Kiến trúc của Nagios](#12-kiến-trúc-của-nagios)
    - [1.3. Tính năng của Nagios](#13-tính-năng-của-nagios)
    - [1.4. Cách thức hoạt động của Nagios](#14-cách-thức-hoạt-động-của-nagios)
  - [2. Tổng quan về OMD](#2-tổng-quan-về-omd)
    - [2.1 Khái niệm](#21-khái-niệm)
    - [2. Phân biệt OMD-LABS và OMD(check_mk)](#2-phân-biệt-omd-labs-và-omdcheck_mk)
- [Tài liệu tham khảo](#tài-liệu-tham-khảo)

## 1.Nagios là gì ?


### 1.1. Tổng quan về Nagios ?
 - Nagios được phát hành bởi Galstad vào năm 1999
 - Nagios được phát triển là 1 phần mềm mã nguồn mở 
 - Nagios chỉ hỗ trơ triển khai Nagios hệ thống trên OS linux 
 - Nagios là 1 hệ thống dành cho người quản trị mạng trong việc giám sát 1 hệ thống, mạng va cơ sở hạ tầng.
 -  Ví dụ : như các host, Servive(DHCP,HTTP,...), DISK, hoạt động của CPU trong hệ thóng mạng 

### 1.2. Kiến trúc của Nagios 

- Hệ thống Nagios bao gồm 2 phần chính :

    - Nagios plugins
    - Nagios core

- Nagios plugins là phần mở rộng độc lập để hỗ trợ cho Nagios Core. Nó sẽ làm việc như thực hiện kiểm tra trên các thiết bị đã được cài nó, và sau đó trả lại kết quả cho Nagios Core.

-  Nagios core được coi như là công cụ giám sát,  quản lý những lịch trình sự kiện cơ bản, xử lý sự kiện và quản lý thông báo.

### 1.3. Tính năng của Nagios 

- Công đồng nguồn mở
- Lập kế hoạch nâng cấp cơ sở hạ tâng
- Giám sát toàn bộ cơ sở hạ tầng 

### 1.4. Cách thức hoạt động của Nagios

- Tiếp nhận thông tin
- Đẩy thông tin 
- Phản hồi kết quả
 
   - Tiếp nhận thông tin : trên các host được cài sẵn các plugin và nagios sẽ thực hiện kiểm tra định kỳ các máy trạm và các dihcj vụ nhờ Nagios clinet(agent). 
   
   - Đẩy thông tin : Plugin sẽ gửi về cho Nagios Server sau khi đã thu thâp đủ thông tin của việc kiểm tra. Dựa trên các công cụ giám sát Nagios Web các trạng thái của tất cả dịch vụ hoặc quá trình của chúng sẽ được xem xét.
   - Phản hồi kết quả : tất cả thông tin về trạng thái vừa kiểm tra sẽ được gửi tới các nhà quản trị qua email,SMS...Kèm theo đó Nagios sẽ đưa ra các cảnh báo nếu xảy ra tình trạng bất thường của các máy chủ hoặc host, thiết bị được giám sát. 


## 2. Tổng quan về OMD

### 2.1 Khái niệm 

- Năm 2010 dự án OMD(open Monitoring Distribution) được khởi động là sự kết hợp của Nagios,Check_MK,nagVis,.... Tạo lên 1 phiên bản linh hoạt trong giám sát.

- 2 phiên bản ra mắt của dự án OMD : OMD-LABS và OMD

### 2. Phân biệt OMD-LABS và OMD(check_mk)



|Phân biệt|OMD-LABS|OMD|
|---|---|---|
|**Khác nhau**|OMD-LABS là phiên bản nâng cấp của OMD(check_mk)..Ngoài check_MK nó còn tích hợp thêm 1 số sản phẩm mã nguồn mở khác như: Naemon;lcinga2;Grafana/inluxdb,...tích hợp thêm 1 số biểu đồ|OMD là 1 phiên bản nhỏ của OMD-LABS nó tập trung chủ yếu vào việc phát triển check_mk,Check_Mk là một phần của OMD|
||

**Giống nhau** : Đều sử dụng nhân là Nagios Core

# Tài liệu tham khảo 

   1. https://github.com/huydv398/Ghichep-CkeckMK
   2. https://github.com/niemdinhtrong/thuctapsinh/tree/master/NiemDT
   3. https://news.cloud365.vn/?s=checkmk