# Cài đặt agent của Check_MK trên Windows

- [Cài đặt agent của Check_MK trên Windows](#cài-đặt-agent-của-check_mk-trên-windows)
  - [**1. Mô hình mạng**](#1-mô-hình-mạng)
  - [**2. Các bước thực hiện**](#2-các-bước-thực-hiện)

## **1. Mô hình mạng** 


Mô hình mạng :

<img src= https://i.imgur.com/fKoT2mJ.png width=50%>


IPplanning:

![Imgur](https://i.imgur.com/dreUce3.png)

Agent có thể dùng chung cho tất cả các bản Win bao gồm cả Windows Server.

## **2. Các bước thực hiện**

> **Thực hiện trên máy clinet Win 7:**

Tiến hành đăng nhập vào server CheckMK trên trình duyệt web để tải agent trên về...

**<h2>Bước 1 : Tìm agent phù hợp cho máy Client</h2>**

Tại máy Check_MK server tìm agent phù hợp cho Windows. Bản Agent phù hợp với Windows phải có đuôi file là `.MSI`

Truy cập theo đường dẫn sau :
![Imgur](https://i.imgur.com/GrLigiM.png)

Tiến hành click và tải xuống.

Sau khi có agent trên máy ta tiến hành chạy file bằng quyền admin

**<h2>Link hướng dẫn add host Windows để CheckMK có thể giám sát :</h2>**

>note: **Add host CentOS hay host Windows thao tác giống nhau :**

[Add host để CheckMK giám sát](./add_host_CheckMk_C7.md)

