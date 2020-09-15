# Cấu hình IP cho Switch

Đối với Switch Layer2 chỉ có thể set IP cho VLAN

Switch Layer3 thì ta có thể đặt IP cho từng port của SW.

## SW Layer2
Cấu hình IP cho VLAN. Thông thường, VLAN1 mặc định hoạt động giống như NIC riêng của Switch để kết nối vào mạng LAN để gửi các gói IP.

Ví dụ đơn giản:

<img src="..\images\Screenshot_16.png">

Lab trên Package Tracer:

<img src="..\images\Screenshot_17.png">

Ta truy cập console của SW thông qua Laptop

Truy cập console của SW. Thực hiện các lệnh sau:

Truy cập Privileged EXEC mode của SW
```
Switch>enable
Switch#
```

Truy cập Global configuration mode
```
Switch#configure terminal
Switch(config)#
```

Cấu hình cho vlan1
```
Switch(config)#interface vlan 1
Switch(config-if)#
```

Đặt IP cho interface vlan 1:
```
Switch(config-if)#ip address 10.10.10.3 255.255.255.0
Switch(config-if)#no shutdown
Switch(config-if)#end
```

Kiểm tra lại:
```
Switch#show interfaces vlan 1
Vlan1 is up, line protocol is up
  Hardware is CPU Interface, address is 0002.1652.8024 (bia 0002.1652.8024)
  Internet address is 10.10.10.3/24
...
```

Đứng từ PC, ping tới địa chỉ 10.10.10.3 của interface VLAN 1 trên Switch

<img src="..\images\Screenshot_18.png">

Đứng từ SW ping tới địa chỉ 10.10.10.2 của PC
```
Switch#ping 10.10.10.2

Type escape sequence to abort.
Sending 5, 100-byte ICMP Echos to 10.10.10.2, timeout is 2 seconds:
!!!!!
Success rate is 100 percent (5/5), round-trip min/avg/max = 0/0/1 ms
```

## SW Layer 3
<img src="..\images\Screenshot_21.png">

Lab trên Package Tracer

<img src="..\images\Screenshot_20.png">

Truy cập console của SW. Thực hiện các lệnh sau:

Truy cập Privileged EXEC mode của SW
```
Switch>enable
Switch#
```

Truy cập Global configuration mode
```
Switch#configure terminal
Switch(config)#
```

Cấu hình interface fastEthernet 0/2
```
Switch(config)#interface fastEthernet 0/2
Switch(config-if)#no switchport
Switch(config-if)#no shutdown FastEthernet0/2, change state to down
Switch(config-if)#ip address 10.10.10.5 255.255.255.0
```

### Kiểm tra
Ping từ PC tới SW:

<img src="..\images\Screenshot_19.png">