
Thực hiện hướng dẫn add host để check_Mk có thể giám sát :


# Hướng dẫn add host để Check_MK giám sát

Làm thế nào để add thêm một host. Để làm được điều này máy muốn giám sát phải được download và cài đặt Agent của Check_MK.

Đăng nhập vào Check_MK và làm theo hướng dẫn

### Tạo host

* Chọn **Hosts** ở mục SETTING 
* Chọn **New host**

![Imgur]()

* Điền thông tin của host muốn giám sát bao gồm tên địa chỉ IP của chúng. Sau đó lưu và đến service 

Điền tên cho host mới:

![Imgur]()

Nhập địa chỉ IP của host mới

![Imgur]()

Lưu và test thử:

![Imgur]()

Ping và agent hoàn thành là OK:

![Imgur]()

Save & go to Services 

![Imgur]()

* Đi vào bước quyết định giám sát những Service nào. Nếu muốn giám sát tất cả những Service mà check_mk phát hiện được hãy chọn Monitor không thì hãy chọn disable. Còn nếu bạn muốn loại bỏ hay giám sát 1 service riêng lẻ nào đó hãy chọn dấu X hoặc dấu tích

1: Tích để tích tất cả các Service mà check_mk tìm thấy

Monitor để giám sát

![Imgur]()

Hoặc chọn Service mà muốn giám sát và chọn Monitor để giám sát

![Imgur]()

Chọn **Changes**

![Imgur]()

Chọn **Activate afected**, để kích hoạt các service.

![Imgur]()

Nếu các service không khởi động được:

![Imgur]()

Click vào option:

![Imgur]()

Chọn reschedule check

![Imgur]()

Như vậy đã hoàn thành add host và service cho Check_mk




![Imgur]()

