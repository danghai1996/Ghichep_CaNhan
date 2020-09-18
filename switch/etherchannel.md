# Các giao thức và cấu hình cơ bản Etherchannel

EtherChannel cho phép bó các đường vật lý Ethernet liên kết để tạo ra một liên kết Ethernet hợp lý cho mục đích cung cấp băng thông và tốc độ cao liên kết giữa các switch, router và máy chủ. Một EtherChannel có thể được tạo ra bằng cách bó 2 đến 8 đường FastEthernet, Gigabit hoặc 10-Gigabit thành 1 link logical

Switch hoặc thiết bị ở 2 đầu EtherChannel phải hiểu và sử dụng công nghệ EtherChannel để đảm bảo hoạt động đúng và chống loop. Nếu chỉ có 1 đầu sử dụng EtherChannel, còn đầu bên kia không sử dụng thì có thể gây ra loop.

Traffic không phải lúc nào cũng được phân bố đồng đều qua các đường link thuộc EtherChannel, mà nó phụ thuộc vào phương pháp load balancing mà switch sử dụng và mẫu traffic trong mạng.

Nếu một trong các link thuộc EtherChannel bị down thì traffic sẽ tự động được chuyển sang link khác trong channel chỉ trong vòng vài miliseconds. Khi link up trở lại thì traffic được phân bố lại như cũ.

### Kết hợp các port với EtherChannel

EtherChannel có thể kết hợp các physical ports chỉ khi:
– Cùng tốc độ (speed)
– Cùng loại (full-duplex, half-duplex)
– Nếu port Layer 2 thì cùng port access thì phải access cùng VLAN còn port trunk thì phải cùng native VLAN và allowed VLAN. Hoặc cùng là port Layer 3 (routed port).

### Điều kiện cấu hình EtherChannel
- Các Switch phải đều phải hỗ trợ kỹ thuật EtherChannel và phải được cấu hình EtherChannel đồng nhất giữa các Port kết nối với nhau.
- Các Port kết nối EtherChannel giữa 2 Switch phải tương đồng với nhau:
    - Cấu hình (Configuration)
    - Tốc độ (Speed)
    - Băng thông (Bandwidth)
    - Duplex (Full Duplex)
    - Native VLAN và các VLANs
    - Switchport Mode (Trunking, Access)

## Phân loại EtherChannel
Có 2 loại giao thức EtherChannel:
- LACP (Link Aggregation Control Protocol) - Giao thức điều khiển liên kết tổng hợp
- PAgP (Port Aggregation Protocol) - Giao thức tổng hợp cổng : là 1 giao thức độc quyền của Cisco

### LACP (Link Aggregation Control Protocol) 
Là giao thức cấu hình EtherChannel chuẩn quốc tế IEEE 802.3ad và có thể dùng được cho hầu hết các thiết bị thuộc các hãng khác nhau, LACP hỗ trợ ghép tối đa 16 Link vật lý thành một Link logic (8 Port Active – 8 Port Passive).

LACP có 3 chế độ:
- `On`: Chế độ cấu hình EtherChannel tĩnh, chế độ này thường không được dùng vì các Switch cấu hình EtherChannel có thể hoạt động được và cũng có thể không hoạt động được vì các Switch được cầu hình bằng tay phục thuộc vào con người nên hoàn toàn không có bước thương lượng trao đổi chính sách giữa các bên dẫn đến khả năng Loop cao và bị STP (Spanning Tree Protocol) Block.
- `Active`: Chế độ tự động – Tự động thương lượng với đối tác
- `Passive`: Chế độ bị động – Chờ được thương lượng

<img src="..\images\Screenshot_32.png">

### PAgP (Port Aggregation Protocol)
Port Aggregation Protocol là một giao thức độc quyền của Cisco được sử dụng để hình thành EtherChannel. Chỉ hỗ trợ ghép tối đa 8 Link vật lý thành 1 Link logic

PAgP cũng có 3 chế độ tương tự LACP:
- `On`
- `Active` - (`Auto`)
- `Passive` - (`Desirable`)

<img src="..\images\Screenshot_31.png">

### Điều kiện tạo Etherchannel của 2 port giữa 2 SW
<img src="..\images\Screenshot_29.png">

# Lab cấu hình Etherchanel
## Cấu hình PAgP
<img src="..\images\Screenshot_30.png">

Quy hoạch IP:
- SW1 - VLAN10: 192.168.10.11/24
- SW2 - VLAN10: 192.168.10.12/24


### Cấu hình cơ bản
Trên SW1:
```
Switch#configure terminal 
Switch(config)#vlan 10
Switch(config-vlan)#name VLAN10
Switch(config-vlan)#exit

Switch(config)#interface vlan 10
Switch(config-if)#ip address 192.168.10.11 255.255.255.0
Switch(config-if)#no shutdown
Switch(config-if)#exit

Switch(config)#exit
Switch#
```

Trên SW2:
```
Switch#configure terminal 
Switch(config)#vlan 10
Switch(config-vlan)#name VLAN10
Switch(config-vlan)#exit

Switch(config)#interface vlan 10
Switch(config-if)#ip address 192.168.10.12 255.255.255.0
Switch(config-if)#no shutdown
Switch(config-if)#exit

Switch(config)#exit
Switch#
```

### Cấu hình PAgP
Vì ta sử dụng port 0/1 đến 0/4 nên ta có thể cấu hình nhanh bằng cách gộp vào range để cấu hình:

TRên SW1:
```
Switch#configure terminal 
Switch(config)#interface range fastEthernet 0/1-4
Switch(config-if-range)#switchport trunk native vlan 10
Switch(config-if-range)#switchport mode trunk 
Switch(config-if-range)#channel-protocol pagp
Switch(config-if-range)#channel-group 1 mode desirable
Switch(config-if-range)#exit
```

Trên SW2:
```
Switch#configure terminal 
Switch(config)#interface range fastEthernet 0/1-4
Switch(config-if-range)#switchport trunk native vlan 10
Switch(config-if-range)#switchport mode trunk 
Switch(config-if-range)#channel-protocol pagp
Switch(config-if-range)#channel-group 1 mode desirable
Switch(config-if-range)#exit
```

Kiểm tra trên cả 2 SW:
```
Switch#show etherchannel summary
```
Kết quả:
```
Flags:  D - down        P - in port-channel
        I - stand-alone s - suspended
        H - Hot-standby (LACP only)
        R - Layer3      S - Layer2
        U - in use      f - failed to allocate aggregator
        u - unsuitable for bundling
        w - waiting to be aggregated
        d - default port


Number of channel-groups in use: 1
Number of aggregators:           1

Group  Port-channel  Protocol    Ports
------+-------------+-----------+----------------------------------------------

1      Po1(SU)           PAgP   Fa0/1(P) Fa0/2(P) Fa0/3(P) Fa0/4(P)
```

Ping từ SW1 sang SW2 và ngược lại:
```
SW1#ping 192.168.10.12

Type escape sequence to abort.
Sending 5, 100-byte ICMP Echos to 192.168.10.12, timeout is 2 seconds:
!!!!!
Success rate is 100 percent (5/5), round-trip min/avg/max = 0/0/1 ms


SW2#ping 192.168.10.11

Type escape sequence to abort.
Sending 5, 100-byte ICMP Echos to 192.168.10.11, timeout is 2 seconds:
!!!!!
Success rate is 100 percent (5/5), round-trip min/avg/max = 0/0/1 ms
```

## Cấu hình LACP
<img src="..\images\Screenshot_30.png">

Quy hoạch IP:
- SW1 - VLAN10: 192.168.10.11/24
- SW2 - VLAN10: 192.168.10.12/24


### Cấu hình cơ bản
Trên SW1:
```
Switch#configure terminal 
Switch(config)#vlan 10
Switch(config-vlan)#name VLAN10
Switch(config-vlan)#exit

Switch(config)#interface vlan 10
Switch(config-if)#ip address 192.168.10.11 255.255.255.0
Switch(config-if)#no shutdown
Switch(config-if)#exit

Switch(config)#exit
Switch#
```

Trên SW2:
```
Switch#configure terminal 
Switch(config)#vlan 10
Switch(config-vlan)#name VLAN10
Switch(config-vlan)#exit

Switch(config)#interface vlan 10
Switch(config-if)#ip address 192.168.10.12 255.255.255.0
Switch(config-if)#no shutdown
Switch(config-if)#exit

Switch(config)#exit
Switch#
```

### Cấu hình LACP
TRên SW1:
```
Switch#configure terminal 
Switch(config)#interface range fastEthernet 0/1-4
Switch(config-if-range)#switchport trunk native vlan 10
Switch(config-if-range)#switchport mode trunk 
Switch(config-if-range)#channel-protocol lacp
Switch(config-if-range)#channel-group 1 mode passive
Switch(config-if-range)#exit
```

Trên SW2:
```
Switch#configure terminal 
Switch(config)#interface range fastEthernet 0/1-4
Switch(config-if-range)#switchport trunk native vlan 10
Switch(config-if-range)#switchport mode trunk 
Switch(config-if-range)#channel-protocol lacp
Switch(config-if-range)#channel-group 1 mode active
Switch(config-if-range)#exit
```

## Lưu ý
- Trên tất cả các switch của Catalyst (2970, 3560, 4500 và 6500), ta có thể cấu hình để chọn giao thức PagP và LACP. 
- Các model cũ hơn như 2950 có thể chỉ hỗ trợ PagP. 
- Từng interface nằm trong EtherChannel phải được cấu hình và gán cùng một nhóm duy nhất (từ 1 đến 64).