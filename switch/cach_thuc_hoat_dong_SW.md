# Cách thức hoạt động của Switch

## Switch là gì?
- Switch là một thiết bị chuyển mạch tối quan trọng trong mạng, dùng để kết nối các đoạn mạng với nhau theo mô hình hình sao (Star).

- Switch như 1 bridge nhiều cổng. Khác với Hub nhận tín hiệu từ một cổng rồi chuyển tiếp tới tất cả các cổng còn lại, switch nhận tín hiệu vật lý, chuyển đổi thành dữ liệu, từ một cổng, kiểm tra địa chỉ đích rồi gửi tới một cổng tương ứng.

## Cách thức hoạt động của Switch
Switch thực chất là một cầu nối trong suốt với nhiều port, mỗi port là một đoạn trong Ethernet LAN, biệt lập với các port còn lại. Việc truyền gói tin dựa hoàn toàn vào địa chỉ MAC chứa trong gói, nó sẽ không được truyền khi chưa biết được địa chỉ gốc.

<img src="..\images\Screenshot_14.png">

Hoạt động của switch dựa hoàn toàn vào địa chỉ MAC. 

Khi một gói được đưa đến 1 port nào đó, chúng sẽ đối chiếu với bảng MAC nguồn. Nếu chúng chưa có trong bảng thì sẽ được ghi vào bảng. Một gói tin đến sẽ bao gồm địa chỉ MAC đích

Switch sẽ tra trong bảng MAC port nào chứa cùng địa chỉ MAC mà được đính trong gói tin đến. Nếu địa chỉ MAC không được tìm thấy trong bảng, tức là switch sẽ bị tràn. Nó còn được gọi là unknow unicast flooding, với địa chỉ unicast đích không xác định.

<img src="..\images\Screenshot_15.png">

Khi một gói tin được truyền, chúng sẽ được đặt vào hàng xếp trong port của switch. Mỗi hàng xếp sẽ có thứ tự ưu tiên khác nhau, nhờ đó switch sẽ biết được gói tin nào quan trọng và sẽ được truyền đi trước các gói ít quan trọng hơn. Điều này sẽ ngăn sự mất dữ liệu do xáo trộn khi lưu lượng truyền đến quá lớn. Khi một hàng xếp làm việc và một gói tin được kéo ra, switch không chỉ xét đến gói tin truyền tới đâu, mà còn cả việc nó có nên được truyền đi và truyền như thế nào.