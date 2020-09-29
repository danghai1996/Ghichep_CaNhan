# Update firemware cho Switch



1. Cài đặt phần mềm tftpd32 trên PC

IP : 172.16.2.128/20

<img src="..\images\Screenshot_58.png">

2. Đặt IP cho SW cùng dải với IP của máy

IP SW: 172.16.4.245/20

3. Kiểm tra version và vị trí ISO hiện tại SW dùng để boot:
```
SW1#show version
Cisco IOS Software, C3750 Software (C3750-IPBASEK9-M), Version 12.2(40)SE, RELEASE SOFTWARE (fc3)
```

```
SW1#show boot
BOOT path-list      : flash:c3750-ipbasek9-mz.122-40.SE.bin
Config file         : flash:/config.text
Private Config file : flash:/private-config.text
Enable Break        : no
Manual Boot         : no
HELPER path-list    :
Auto upgrade        : yes
Auto upgrade path   :
```

-> đường dẫn file: `flash:c3750-ipbasek9-mz.122-40.SE.bin`

4. Sao lưu lại file ISO hiện tại:
```
SW1#copy flash:c3750-ipbasek9-mz.122-40.SE.bin tftp
```
Nhập IP của tftp server
```
Address or name of remote host []? 172.16.2.128
```
Lưu dưới tên hiện tại của file. Enter hoặc gõ `y`
```
Destination filename [c3750-ipbasek9-mz.122-40.SE.bin]?
!!!!!!!!!
```

Ta sẽ thấy trạng thái sao lưu:

<img src="..\images\Screenshot_59.png">

Kiểm tra xem file ISO đã được lưu chưa:

<img src="..\images\Screenshot_60.png">

5. Upgrade ISO image từ TFPT server vào flash memory
```
SW1#copy tftp:c3750-ipservicesk9-mz.122-55.SE9.bin nvram
Address or name of remote host []? 172.16.2.128
Destination filename [nvram]?c3750-ipservicesk9-mz.122-55.SE9.bin
Accessing tftp://172.16.2.128/c3750-ipservicesk9-mz.122-55.SE9.bin...
Loading c3750-ipservicesk9-mz.122-55.SE9.bin from 172.16.2.128 (via Vlan99): !!
```
Chú ý: tên file phải kết thúc bằng `.bin`

Chờ quá trình hoàn tất:

<img src="..\images\Screenshot_61.png">

6. Sau khi hoàn thành, ta kiểm tra sẽ thấy file ta vừa up lên:
```
SW1#dir flash:
Directory of flash:/
    ....
    2  -rwx    13009047   Mar 1 1993 01:08:48 +00:00  c3750-ipservicesk9-mz.122-55.SE9.bin
    .....
```

<img src="..\images\Screenshot_62.png">

7. Cấu hình chỉ định đường dẫn boot
```
SW1(config)#boot system flash:c3750-ipservicesk9-mz.122-55.SE9.bin
SW1(config)#exit
SW1#write
```

8. Reload lại SW và kiểm tra version:
```
SW1#show version
Cisco IOS Software, C3750 Software (C3750-IPSERVICESK9-M), Version 12.2(55)SE9, RELEASE SOFTWARE (fc1)
```