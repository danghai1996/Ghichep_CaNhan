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

LACP gửi các gói trên các cổng EtherChannel của switch. LACP gán vai trò cổng đến các đầu cuối của EtherChannel. Các switch có độ ưu tiên thấp nhất sẽ được phép ra quyết định về các cổng nào sẽ được tham gia vào EtherChannel ở một thời điểm. Các cổng được chọn lựa và trở thành active theo giá trị độ ưu tiên priority của nó, trong đó giá trị ưu tiên cao

LACP có 3 chế độ:
- `On`: Chế độ cấu hình EtherChannel tĩnh, chế độ này thường không được dùng vì các Switch cấu hình EtherChannel có thể hoạt động được và cũng có thể không hoạt động được vì các Switch được cầu hình bằng tay phục thuộc vào con người nên hoàn toàn không có bước thương lượng trao đổi chính sách giữa các bên dẫn đến khả năng Loop cao và bị STP (Spanning Tree Protocol) Block.
- `Active`: Chế độ tự động – Tự động thương lượng với đối tác
- `Passive`: Chế độ bị động – Chờ được thương lượng

### PAgP (Port Aggregation Protocol)
Port Aggregation Protocol là một giao thức độc quyền của Cisco được sử dụng để hình thành EtherChannel. Chỉ hỗ trợ ghép tối đa 8 Link vật lý thành 1 Link logic

Các gói tin PagP được trao đổi giữa các switch trên các cổng EtherChannel. Các thông số của swtich láng giềng được xác định (như khả năng của cổng) và sẽ được so sánh với switch cục bộ. Các cổng có cùng neighbor ID và khả năng hình thành nhóm sẽ được nhóm lại với nhau thành các kết nối FEC. PagP hình thành nên EtherChannel chỉ trên những cổng được cấu hình cùng static VLAN hoặc là cùng loại trunking. PagP cũng thay đổi các thông số động của EtherChannel nếu một trong những cổng của bundle bị thay đổi.