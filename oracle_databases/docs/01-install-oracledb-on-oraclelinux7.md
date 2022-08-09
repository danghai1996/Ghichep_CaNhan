# Cài đặt Oracle Databases 19c trên Oracle Linux 7

## Chuẩn bị
- 1 máy đã cài đặt Oracle Linux 7

# Cài đặt
## 1. Tải về phần mềm Oracle Databases
Truy cập https://www.oracle.com/database/technologies/oracle19c-linux-downloads.html

Tải về file:  `Oracle Database 19c (19.3) for Linux x86-64`

<img src = "..\images\Screenshot_1.png">

Thực hiện upload lên máy cài đặt Oracle Linux 7 đã chuẩn bị ở trên.

## 2. Cấu hình ban đầu
### 2.1. Đặt hostname
Đặt hostname :
```
hostnamect set-hostname oracle-linux
bash
```

Chỉnh sửa file hosts: Thêm dòng theo form sau:
```
<IP-address>  <fully-qualified-machine-name>  <machine-name>
```

Trong tài liệu này là:
```
172.16.68.240 oracle-linux.localdomain oracle-linux
```

Chỉnh sửa hostname trong file `/etc/hostname`:
```
oracle-linux.localdomain
```

### 2.2. Disable firewalld và SELinux
Disable Firewall:
```
systemctl stop firewalld
systemctl disable firewalld
```

Disable SELinux
```

```