# Các mode có trên Switch

Sau khi kết nối thành công lần đầu với Switch thì cửa sổ command sẽ bắt đầu với tên mặc định `Switch`

### Các chế độ lệnh chính trên Switch
- User EXEC
- Privileged EXEC
- Global configuration
- Interface configuration
- Config-vlan
- VLAN configuration
- Line configuration 

## 1. User EXEC
Đây là cấp độ truy cập đầu tiên. (Đối với công tắc) Thay đổi cài đặt thiết bị đầu cuối, thực hiện các tác vụ cơ bản và liệt kê thông tin hệ thống.

Lời nhắc
```
Switch>
```

Để thoát:
```
logout
```

## 2. Privileged EXEC
Privileged EXEC mode cho phép người dùng xem cấu hình hệ thống, khởi động lại hệ thống và truy cập các mode khác.

Truy cập: Từ User EXEC mode, gõ lệnh:
```
enable
```

Lời nhắc:
```
Switch#
```

Thoát:
```
disable
```

## 3. Global configuration
Cấu hình chung cho switch

Truy cập: Từ Privileged EXEC mode, gõ lệnh
```
configure
```

Lời nhắc:
```
Switch(config)#
```

Để quay lại chế độ Privileged EXEC, nhấn tổ hợp phím **Ctrl+Z** hoặc dùng 1 trong 2 lệnh:
```
exit
```
hoặc
```
end
```

## 4. Interface configuration
Dùng để cấu hình các interface

Truy cập: Từ Global configuration mode, gõ lệnh:
```
interface <tên_interface>
```

Ví dụ:
```
Switch(config)#interface FastEthernet0/2
```

Lời nhắc:
```
Switch(config-if)#
```

Để quay lại  privileged EXEC mode, nhấn **Ctrl+Z** hoặc gõ lệnh:
```
end
```

Để quay lại Global configuration mode
```
exit
```

## 5. VLAN configuration
Dùng để cấu hình VLAN

Truy cập: Từ Global configuration mode, gõ lệnh:
```
vlan <vlan_ID>
```
Ví dụ:
```
Switch(config)#vlan 10
```

Lời nhắc:
```
Switch(config-vlan)#
```

Để quay lại global configuration mode:
```
exit
```

Để quay lại privileged EXEC mode, nhấn **Ctrl+Z** hoặc
```
end
```

## 6. Line configuration
Truy cập: Từ global configuration mode, gõ lệnh:
```
line <dòng>
```

Lời nhắc:
```
Switch(config-line)#
```

Quay lại global configuration mode:
```
exit
```

Để quay lại privileged EXEC mode, nhấn **Ctrl+Z** hoặc
```
end
```

# Tham khảo:
https://www.cisco.com/c/en/us/td/docs/switches/lan/catalyst2960/software/release/12-2_58_se/command/reference/2960cr/intro.html