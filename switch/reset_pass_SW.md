# Reset password cho Switch

## Đặt mật khẩu truy cập enable mode cho Switch
Đặt mật khẩu
```
SW1#configure terminal 
SW1(config)#enable password hai1996
SW1(config)#exit
SW1#
```

Trong đó: `hai1996` là mật khẩu

Để mật khẩu không bị mất đi sau khi reset SW:
```
SW1#write
```

## Reset password cho Switch
- Rút nguồn ra khỏi Switch
- Nhấn giữ phím MODE trên SW

    <img src="..\images\Screenshot_33.png">

Gõ lệnh:
```
switch: flash_init
```

List các file:
```
switch: dir flash:

Directory of flash:/

1    -rw-  4414921   <date>               c2960-lanbase-mz.122-25.FX.bin
2    -rw-  1100      <date>               config.text
59600363 bytes available (4416021 bytes used)
```

Đổi tên file `config.text` -> `config.old`
```
switch: rename flash:config.text flash:config.old
```

Reload SW:
```
switch: boot
```

Sau khi SW boot lên. Ta tiến hành truy cập SW:
```
Switch>enable 
Switch#rename flash:config.old flash:config.text
Switch#copy flash:config.text system:running-config
```

Đặt lại Password
```
Switch#configure terminal 
Switch(config)#enable password abc123
Switch(config)#exit
Switch#write
Switch#reload
```


### Lab trên Packet Tracer:
Khi boot SW lên lại, lệnh copy bên trên sẽ không thành công. Ta sử dụng lệnh sau:
```
Switch#copy flash: running-config 
Source filename []? config.old
Destination filename [running-config]? 
```