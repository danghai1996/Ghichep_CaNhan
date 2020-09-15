# Cấu hình chia VLAN trên Switch

<img src="..\images\Screenshot_22.png">

|VLAN|Port|
|----|----|
|VLAN10|Fa0/1, Fa0/2|
|VLAN11|Fa0/11, Fa0/12|
|VLAN12|Fa0/21, Fa0/22|


Mặc định, thì tất cả các cổng (port) trên switch đều nằm trong cùng VLAN có ID là 1 (VLAN 1)

## Tạo các VLAN10, VLAN11, VLAN12
```
Switch>enable
Switch#configure terminal

Switch(config)#vlan 10
Switch(config-vlan)#name VLAN10
Switch(config-vlan)#exit

Switch(config)#vlan 11
Switch(config-vlan)#name VLAN11
Switch(config-vlan)#exit

Switch(config)#vlan 12
Switch(config-vlan)#name VLAN12
Switch(config-vlan)#exit
```

Kiểm tra lại VLAN vừa tạo:

<img src="..\images\Screenshot_23.png">

3 VLAN đã được khởi tạo. Tuy nhiên, chưa có port nào được gán vào vlan.

## Gán các port vào VLAN đã định trước
```
Switch>enable
Switch#configure terminal

Switch(config)#interface fastEthernet 0/1
Switch(config-if)#switchport access vlan 10
Switch(config-if)#exit

Switch(config)#interface fastEthernet 0/2
Switch(config-if)#switchport access vlan 10
Switch(config-if)#exit

Switch(config)#interface fastEthernet 0/11
Switch(config-if)#switchport access vlan 11
Switch(config-if)#exit

Switch(config)#interface fastEthernet 0/12
Switch(config-if)#switchport access vlan 11
Switch(config-if)#exit

Switch(config)#interface fastEthernet 0/21
Switch(config-if)#switchport access vlan 12
Switch(config-if)#exit

Switch(config)#interface fastEthernet 0/22
Switch(config-if)#switchport access vlan 12
Switch(config-if)#end
```

Kiểm tra các port gán đúng vlan chưa
```
Switch#show vlan
```

<img src="..\images\Screenshot_24.png">

Kiểm tra ping từ các PC trong cùng VLAN -> OK

Ping giữa các VLAN khác nhau -> Không ping được.
