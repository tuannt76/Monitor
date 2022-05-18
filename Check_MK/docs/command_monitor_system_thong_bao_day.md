
<h1>Câu lệnh giám sát hệ thống và đẩy tải hệ thống</h1>

- [1.Câu lệnh giám sát hệ thống](#1câu-lệnh-giám-sát-hệ-thống)
  - [2.1. TOP](#21-top)
  - [Test CPU](#test-cpu)
  - [Test RAM](#test-ram)
  - [Test Network](#test-network)
  - [Test Disk](#test-disk)
- [2. Câu lệnh đẩy tải hệ thống](#2-câu-lệnh-đẩy-tải-hệ-thống)
  - [2.1 stress](#21-stress)
      - [Test CPU](#test-cpu-1)
      - [Test RAM](#test-ram-1)
      - [Test disk](#test-disk-1)

# 1.Câu lệnh giám sát hệ thống 

## 2.1. TOP

## Test CPU

Có rất nhiều câu lệnh có thể kiểm tra được trạng thái của CPU. Có một câu lệnh quen thuộc là là `top` 

![Imgur](https://i.imgur.com/xTISwEB.png)

Câu lệnh này trả về các thông tin của CPU sau

```
%Cpu(s):  0,2 us,  0,2 sy,  0,0 ni, 99,5 id,  0,0 wa,  0,0 hi,  0,2 si,  0,0 st
```

`%CPU` thể hiện % thời gian CPU:

* `us` xử lý các process của user
* `sy` xử lý các process của kernel
* `ni` xử lý các process ưu tiên của user
* `id` CPU không hoạt động
* `wa` đợi cho I/O hoàn thành
* `hi` xử lý các kết nối phần cứng
* `si` xử lý các kết nối phần mềm
* `st` khoảng thời gian CPU có việc phải làm mà không thể đáp ứng

![Imgur](https://i.imgur.com/nBCMqc4.png)

* `PID` là ID của tiến trình
* `USER` tên user sử dụng tiến trình
* `PR` hiển thị mức độ ưu tiên của tiến trình
* `NI` cũng thể hiện mức độ ưu tiên của tiến trình nhưng nó được ưu tiên hơn cột `PR` ở trước đó
* `VIRT` tổng số RAM được sử dụng cho tiến trình (bao gồm tất cả những gì liên quan đến tiến trình đó vd như đọc ghi ...)
* `RES` số RAM tiến trình này sử dụng
* `SHR` lượng RAM dùng để share cho các tiến trình khác
* `S` trạng thái của tiến trình. Gồm các trạng thái sau:
 * `R`: tiến trình đang chạy
 * `D`: đang tạm nghỉ, có thể không bị gián đoạn
 * `S`: đang tạm nghỉ nhưng có thể bị gián đoạn
 * `T`: đã tạm dừng
 * `Z`: tiến trình chưa dừng hẳn
* `%CPU` là %CPU mà nó chiếm tính trên 1 core. Nên với hệ thống có nhiều core thì giá trị này có thể lớn hơn 100%.
* `%MEM` số RAM sử dụng cho tiến trình trên tổng số RAM available

**Giá trị load average**

![](https://github.com/niemdinhtrong/thuctapsinh/blob/master/NiemDT/Monitoring/images/3.png)

Ở đây ta thấy có 3 giá trị đây là các giá trị thể hiện số tiến trình trung bình được xử lý trung bình trong các khoảng thời gian lần lượt là 1 phút, 5 phút, 15 phút.
Để có thể chạy ổn thì giá trị này nên nhỏ hơn hoặc bằng số core của CPU.

## Test RAM

Kiểm tra thông số RAM ở đây tôi dùng câu lệnh `free`

![Imgur](https://i.imgur.com/9yohGnF.png)

Câu lệnh `free -m` hiển thị đơn vị là MB. Câu lệnh này hiển thị cả RAM thực và Swap.

* `total` là tổng dung lượng RAM
* `used` dung lượng RAM đã sử dụng
* `free` dung lượng RAM còn trống
* `share` dung lượng RAM dùng để chia sẻ
* `buff/cache` được sử dụng làm cache cho disk để tăng tốc độ đọc ghi
* `available` dung lượng RAM được có thể sử dụng mà không gây ảnh hưởng đến các tiến trình khác.

Bạn cần phân biệt dung lượng `free` và dung lượng `available`. Số RAM bạn có thể sử dụng là dung lượng `available` vì `available`=`free` + `cache`. Khi cần thiết hệ thống sẽ lấy bộ nhớ cache này ra để sử dụng.

## Test Network

Sử dụng câu lệnh `nload`

Ta cần cài `nload` trước khi sử dụng nó

```
yum install nload
```

![Imgur](https://i.imgur.com/slIdofj.png)

Kiểm tra được tốc độ vào và ra trên các card của máy.

* `curr` tốc độ tại thời điểm hiện tại
* `avg` tốc độ trung bình
* `min` tốc độ nhỏ nhất
* `max` tốc độ max
* `Ttl` tổng dung lượng đã vào và ra

## Test Disk

Ta có thể sử dụng câu lệnh `dd` để kiểm tra tốc độ nó sẽ đọc ghi trực tiếp lên disk để kiểm tra. Hoặc cũng có thể sử dụng câu lệnh `iostat`
Trước khi sử dụng được lệnh này ta cần cài đặt gói `sysstat`

```
yum install sysstat
```

![Imgur](https://i.imgur.com/YfeRLJ6.png)

* `device` tên thiết bị
* `tps` số transfers mỗi giây được cấp cho thiết bị. Số này càng cao tức là bộ xử lý càng sử dụng
* `kB_read/s` tốc độ đọc trên thiết bị
* `kB_wrtn/s` tốc độ ghi lên thiết bị
* `kB_read` tổng dung lượng đã đọc từ thiết bị
* `kB_wrtn` tổng dung lượng đã viết vào thiết bị





# 2. Câu lệnh đẩy tải hệ thống


## 2.1 stress

**stress** là câu lệnh được sử dụng để tạo ra khối lượng công việc để kiểm tra hiệu năng của phần cứng.

Để có thể kiểm tra tôi sử dụng 2 terminal để kiểm tra. Một tôi dùng chạy câu lệnh `stress` và một tôi sử dụng để dùng câu lệnh `htop` để theo dõi

Trước tiên cần cài đặt công cụ stress

```
yum install stress
```

**Một số ví dụ cụ thể**

#### Test CPU

Để test CPU ta sử dụng option `-c`

Để thấy sự khác biệt tôi dùng câu lệnh `htop` kiểm tra trước khi dùng câu lệnh `stress`

![Imgur](https://i.imgur.com/S329Wi1.png)

Sau đó tôi sử dụng lệnh `stress` ở terminal còn lại

```
[root@test2 ~]# stress -c 1
stress: info: [4362] dispatching hogs: 1 cpu, 0 io, 0 vm, 0 hdd
```

Ở câu lệnh này câu lệnh `stress` sẽ sinh ra một tiến trình với hiệu suất cao để kiểm tra CPU. 

Theo dõi ta thấy như sau

![Imgur](https://i.imgur.com/coNee88.png)
Ta tiếp tục tăng số process lên để kiểm tra

```
[root@test2 ~]# stress -c 2
stress: info: [4414] dispatching hogs: 2 cpu, 0 io, 0 vm, 0 hdd
```

Ta sẽ thấy như sau

![Imgur](https://i.imgur.com/Oqhom3t.png)

CPU lúc này đã được sử dụng hết công suất

Nếu ta tiếp tục tăng số process lớn hơn số core của CPU có thể thấy

```
[root@test2 ~]# stress -c 4
stress: info: [4434] dispatching hogs: 4 cpu, 0 io, 0 vm, 0 hdd
```

![Imgur](https://i.imgur.com/8GDrx7q.png)

Lúc này mỗi process chỉ còn sử dụng 50% CPU nên tốc độ sẽ giảm đi tương ứng

#### Test RAM

Để test hiệu năng của RAM ta dùng option `-m`

```
[root@test2 ~]# stress -m 2
stress: info: [4515] dispatching hogs: 0 cpu, 0 io, 2 vm, 0 hdd
```

Với câu lệnh này stress tạo ra 2 process mỗi process sẽ sử dụng `256M` RAM để kiểm tra.

![Imgur](https://i.imgur.com/QMDLYw2.png)

Nêú không muốn dùng số RAM mặc định cho mỗi process là `256M` ta có thể chi ra bằng cách dùng thêm option `--vm-bytes`. Bạn cũng có thể đặt lệnh test được chạy trong khoảng thời gian bao lâu bằng cách thêm option `-t`

```
[root@test2 ~]# stress -m 2 --vm-bytes 500M -t 60
stress: info: [4639] dispatching hogs: 0 cpu, 0 io, 2 vm, 0 hdd
```

Câu lệnh này sẽ sinh ra 2 tiến trình và mỗi tiến trình sử dụng `500M` RAM và chạy trong 60s

![Imgur](https://i.imgur.com/tkGwRsP.png)

#### Test disk

Để test disk ta dùng option `-d` 

VD câu lệnh

```
stress -d 1 --hdd-bytes 2G -t 1m
```

Câu lệnh này sẽ ghi một file có dung lượng 2G và disk và thực hiện trong vòng 1 phút

Kết quả trả về như sau

```
[root@test2 ~]# stress -d 1 --hdd-bytes 2G -t 1m
stress: info: [4951] dispatching hogs: 0 cpu, 0 io, 0 vm, 1 hdd
stress: info: [4951] successful run completed in 63s
```

Nếu không chỉ ra dung lượng file bằng cách thêm option `--hdd-bytes` thì mặc định file có dung lượng là 1G. Các file này sau lệnh stress nó sẽ tự động được dọn dẹp nên bạn ko các file rác bị tạo ra.

Bạn có thể  tạo ra test I/O của hệ thống bằng option `-io`

```
stress --io 2 -t 30s
```