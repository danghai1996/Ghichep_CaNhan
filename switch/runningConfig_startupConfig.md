# Running config và Startup config

Thiết bị Cisco nói chung sử dụng file config để thực hiện công việc của nó. 

- **Running config** : được lưu trữ ở RAM. sẽ mất khi thiết bị mất nguồn điện
- **Startup config** : được lưu trữ trong NVRAM (Nonvolatile RAM). File cấu hình này không bị mất đi khi thiết bị mất nguồn điện và được sử dụng khi thiết bị Cisco được bật hoặc khởi động lại.

## File running config
Lệnh show file running config:
```
Switch#show running-config 
```

Một vài thông số trong file running-config:

- Current configuration: Kích thước file config
- Hostname : tên thiết bị
- version: phiên bản firmware thiết bị
- interface : thông tin các interface

Ví dụ 1 file running config
```
Building configuration...

Current configuration : 1240 bytes
!
version 12.2
no service timestamps log datetime msec
no service timestamps debug datetime msec
no service password-encryption
!
hostname Switch
!
!
!
!
!
spanning-tree mode pvst
spanning-tree extend system-id
!
interface FastEthernet0/1
 switchport access vlan 10
!
interface FastEthernet0/2
 switchport access vlan 10
!
interface FastEthernet0/3
!
interface FastEthernet0/4
!
interface FastEthernet0/5
!
interface FastEthernet0/6
!
interface FastEthernet0/7
!
interface FastEthernet0/8
!
interface FastEthernet0/9
!
interface FastEthernet0/10
!
interface FastEthernet0/11
 switchport access vlan 11
!
interface FastEthernet0/12
 switchport access vlan 11
!
interface FastEthernet0/13
!
interface FastEthernet0/14
!
interface FastEthernet0/15
!
interface FastEthernet0/16
!
interface FastEthernet0/17
!
interface FastEthernet0/18
!
interface FastEthernet0/19
!
interface FastEthernet0/20
!
interface FastEthernet0/21
 switchport access vlan 12
!
interface FastEthernet0/22
 switchport access vlan 12
!
interface FastEthernet0/23
!
interface FastEthernet0/24
!
interface GigabitEthernet0/1
!
interface GigabitEthernet0/2
!
interface Vlan1
 no ip address
 shutdown
!
!
!
!
line con 0
!
line vty 0 4
 login
line vty 5 15
 login
!
!
!
!
end
```

## File startup config
Lệnh show file startup config:
```
Switch#show startup-config 
```

## Lệnh `copy running-config startup-config`
Lệnh 
```
copy running-config startup-config
```
được sử dụng để lưu cấu hình hiện tại (running config) vào NVRAM để khi SW khởi động lại thì cấu hình không thay đổi. Khi đó, startup config sẽ có nội dung giống với running config.

