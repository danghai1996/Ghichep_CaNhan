# Các mode của port trên Switch

## 1. Access port
- Một access port trên SW thuộc về VLAN cụ thể
- Tất cả các thiết bị cắm vào port này đều thuộc VLAN xác định của port
- Frame được gửi trên cổng truy nhập sẽ tuân theo chuẩn định dạng khung ethernet (802.3).
- Access port thường được dùng để kết nối tới các máy trạm (PC, laptop, máy in,...)
- Mặc định các port trên SW ban đầu ở VLAN1 và ở kiểu Access port.

### Cấu hình
Cấu hình Access port cho port `fastEthernet 0/1` trong SW:
```
Switch>enable 
Switch#configure terminal 
Switch(config)#interface fastEthernet 0/1
Switch(config-if)#switchport mode access 
```

## 2. Trunk port
- Trunk link là một kết nối vật lý và logic để hỗ trợ liên kết các VLAN trên nhiều SW với nhau
- Trunk port cho phép frame của nhiều VLAN có thể truyền trên đó. 
- Một Trunk port không được gán cho 1 VLAN riêng biệt.
- Trunk port thường được dùng để nối giữa các SW hoặc SW với Router. Vì vậy, trunk port thường là port có băng thông lớn.
- Các VLAN được ghép kênh qua Trunk port. Để ghép kênh lưu lượng của các VLAN, một giao thức đặc biệt sẽ được sử dụng để đóng gói frame để thiết bị có thể xác định được nó thuộc VLAN nào. Chuẩn frame được sử dụng đó là 802.1Q hoặc ISL.
- Nhờ có Trunk port mà 1 VLAN có thể được mở rộng

**Ví dụ:** Chỉ cần 1 đường vật lý cho cả 2 VLAN giữa 2 SW

<img src="..\images\Screenshot_25.png">

### Cấu hình :
```
Switch#configure terminal 
```

## 3. Kiểm tra port đang ở mode nào:
### Kiểm tra tất cả các port trên SW
```
switch# show interface switchport
```
Kết quả:
```
Switch#show interfaces switchport 
Name: Fa0/1
Switchport: Enabled
Administrative Mode: static access
Operational Mode: down
Administrative Trunking Encapsulation: dot1q
Operational Trunking Encapsulation: native
Negotiation of Trunking: Off
Access Mode VLAN: 1 (default)
Trunking Native Mode VLAN: 1 (default)
Voice VLAN: none
Administrative private-vlan host-association: none
Administrative private-vlan mapping: none
Administrative private-vlan trunk native VLAN: none
Administrative private-vlan trunk encapsulation: dot1q
Administrative private-vlan trunk normal VLANs: none
Administrative private-vlan trunk private VLANs: none
Operational private-vlan: none
Trunking VLANs Enabled: All
Pruning VLANs Enabled: 2-1001
Capture Mode Disabled
Capture VLANs Allowed: ALL
Protected: false
Unknown unicast blocked: disabled
Unknown multicast blocked: disabled
Appliance trust: none

Name: Fa0/2
Switchport: Enabled
Administrative Mode: dynamic auto
Operational Mode: down
 --More-- 
```

### Kiểm tra 1 port chỉ định
```
Switch#show interfaces fastEthernet 0/1 switchport
```
Kết quả:
```
Name: Fa0/1
Switchport: Enabled
Administrative Mode: static access
Operational Mode: down
Administrative Trunking Encapsulation: dot1q
Operational Trunking Encapsulation: native
Negotiation of Trunking: Off
Access Mode VLAN: 1 (default)
Trunking Native Mode VLAN: 1 (default)
Voice VLAN: none
Administrative private-vlan host-association: none
Administrative private-vlan mapping: none
Administrative private-vlan trunk native VLAN: none
Administrative private-vlan trunk encapsulation: dot1q
Administrative private-vlan trunk normal VLANs: none
Administrative private-vlan trunk private VLANs: none
Operational private-vlan: none
Trunking VLANs Enabled: All
Pruning VLANs Enabled: 2-1001
Capture Mode Disabled
Capture VLANs Allowed: ALL
Protected: false
Unknown unicast blocked: disabled
Unknown multicast blocked: disabled
Appliance trust: none
```

## Tham khảo
- https://vnpro.vn/tin-tuc/cong-truy-nhap-access-va-trung-ke-trunk-tren-switch-1046.html
- https://www.cisco.com/c/m/en_us/techdoc/dc/reference/cli/nxos/commands/l2/show-interface-switchport.html