# Cấu hình bonding 2 interface trên 1 server

## Chuẩn bị:
Server
- OS : Centos-7
- 2 NIC: eth0, eth1 cùng 1 dải VLAN639

<img src="..\images\Screenshot_34.png">

## Cấu hình
### 1. Kích hoạt bonding driver
```
modprobe bonding
```

Kiểm tra bằng lệnh:
```
modinfo bonding
```
<img src="..\images\Screenshot_35.png">

### 2. Tạo bond interface
```
DEVICE=bond0
TYPE=Bond
NAME=bond0
BONDING_MASTER=yes
BOOTPROTO=none
ONBOOT=yes
IPADDR=10.10.39.20
NETMASK=255.255.255.0
GATEWAY=10.10.39.1
BONDING_OPTS="mode=5 miimon=100"
DNS1=8.8.8.8
DNS2=8.8.4.4
```

Mode 5 ở đây là load balancing. Nhân Hòa chỉ dùng bonding mode 4.

### 3. Cấu hình các interface mạng (eth0, eth1)
Card `eth0`
```
vi /etc/sysconfig/network-scripts/ifcfg-eth0

HWADDR=52:54:00:63:e3:3e
TYPE=Ethernet
BOOTPROTO=none
DEVICE=eth0
ONBOOT=yes
MASTER=bond0
SLAVE=yes
```

Card `eth1`
```
HWADDR=52:54:00:8D:9B:73
TYPE=Ethernet
BOOTPROTO=none
DEVICE=eth1
ONBOOT=yes
MASTER=bond0
SLAVE=yes
```

### 4. Restart network
```
systemctl restart network
```

### 5. Kiểm tra IP
<img src="..\images\Screenshot_36.png">

Đặt lệnh ping ra google từ VM và từ máy khác tới VM. Sau đó tắt 1 card đi. Ta sẽ thấy lệnh ping không hề bị ngắt quãng.

<img src="..\images\Screenshot_39.png">

Từ VM ping ra internet:

<img src="..\images\Screenshot_37.png">

Từ ngoài ping tới VM:

<img src="..\images\Screenshot_38.png">

Tương tự với việc bật `eth0` và tắt `eth1`

## Các mode bonding
<img src="..\images\Screenshot_40.png">

**Mode 0**: Round Robin. Đấy là mode mặc định. Chuyển mạng theo thứ tự tuần tự slave 1 -> slave 2.

**Mode 1**: Active Backup. 1 card mạng active, 1 card mạng chờ. Nếu card active chết thì card chờ lên thay thế. Chỉ hỗ trợ môi trường x86

**Mode 2**: XOR [exclusive OR]. Địa chỉ MAC của card mạng slave được match với MAC của request đang đến. Khi kết nối được thành lập thì vẫn card mạng slave đó transmit/receive đến MAC đích.

**Mode 3**: Broadcast. Tất cả transmissions truyền đến tất cả slave

**Mode 4** (Kết hợp với Etherchannel): Dynamic Link Aggregation. Các card mạng hoạt động như một card mạng với thông lượng cao hơn, nhưng cũng cung cấp chuyển đổi dự phòng trong trường hợp một card mạng chết. Yêu cầu switch hỗ trợ IEEE 802.3ad.

**Mode 5**: Transmit Load Balancing (TLB). Lưu lượng được phân phối phụ thuộc vào tải hiện tại của các card mạng slave. Lưu lượng truy cập đến được nhận bởi slave hiện tại. Nếu slave hiện tại chết, slave khác sẽ lấy địa chỉ MAC của slave đã chết

**Mode 6**: Adaptive Load Balancing (ALB). Không yêu cầu switch có cấu hình cụ thể nào. Chỉ hỗ trợ môi trương x86. Các packet nhận được sẽ được cân bằng tải qua đàm phán ARP (ARP negotiation)