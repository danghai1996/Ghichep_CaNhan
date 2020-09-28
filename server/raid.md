# RAID

## RAID là gì ?
RAID là viết tắt của Redundant Arrays of Independent Disks(ngày trước là Redundant Arrays of Inexpensive Disks) - Mảng dự phòng độc lập của ổ đĩa 

Ban đầu RAID được sử dụng như một giải pháp phòng hộ vì nó cho phép ghi dữ liệu lên nhiều đĩa cứng cùng lúc. Về sau, RAID đã có nhiều biến thể cho phép không chỉ đảm bảo an toàn dữ liệu mà còn giúp gia tăng đáng kể tốc độ truy xuất dữ liệu từ đĩa cứng.

## Ưu điểm
Có 3 lý do chính để áp dụng RAID:
- Dự phòng
- Hiệu quả cao
- Giá thành thấp

Sự dự phòng là nhân tố quan trọng nhất trong quá trình phát triển RAID cho môi trường máy chủ. Dự phòng cho phép sao lưu dữ liệu bộ nhớ khi gặp sự cố. Nếu một ổ cứng trong dãy bị trục trặc thì nó có thể hoán đổi sang ổ cứng khác mà không cần tắt cả hệ thống hoặc có thể sử dụng ổ cứng dự phòng. Phương pháp dự phòng phụ thuộc vào phiên bản RAID được sử dụng.

Có 3 cấp độ RAID sử dụng cho hệ thống máy tính để bàn là RAID 0, RAID 1 và RAID 5.

## RAID Hardware
- Raid Hardware có bộ xử lý và bộ nhớ riêng để xử lý RAID. Trong cách triển khai này, hệ thống RAID là một hệ thống máy tính con độc lập chỉ dành cho ứng dụng RAID, giúp giảm tải khỏi hệ thống host.
- Raid Hardware có thể được triển khai theo 2 cách:
    - Sử dụng một card điều khiển RAID rời.
    - Sử dụng phần cứng tích hợp dựa trên công nghệ ROC (RAID-on-Chip).

## Các loại RAID
### 1. RAID 0
<img src ="../images/raid_0_animation.gif">  

Đây là loại Raid khá phổ biến và được nhiều người sử dụng hiện nay do có khả năng nâng cao hiệu suất tốc độc đọc ghi trao đổi dữ liệu của ổ cứng.

Khi sử dụng Raid 0, dữ liệu sẽ được phân chia đều vào các ổ đĩa. Giả sử bạn có 100MB dữ liệu và 2 ổ cứng sử dụng raid 0. Khi đó thay vì dồn 100MB vào một đĩa cứng duy nhất, RAID 0 sẽ giúp dồn 50MB vào mỗi đĩa cứng riêng giúp giảm một nửa thời gian làm việc theo lý thuyết. Có càng nhiều đĩa cứng thì tốc độc đọc ghi sẽ càng cao.

Có thể sử dụng 1 ổ cứng với RAID 0.

**Ưu điểm:**
- Tăng hiệu quả lưu trữ.
- Không làm mất dung lượng dữ liệu.

**Bất lợi:**
- Không có ổ dự phòng.

### 2. RAID 1
<img src="..\images\Screenshot_56.png">

RAID 1 mới là phiên bản thực sự đầu tiên. RAID cung cấp phương pháp dự phòng dữ liệu đơn giản bằng kĩ thuật “mirroring” (nhân bản dữ liệu). Kĩ thuật này cần 2 ổ cứng riêng biệt có cùng dung lượng. Một ổ sẽ là ổ hoạt động, ổ còn lại là ổ dự phòng. Khi dữ liệu được ghi vào ổ hoạt động thì đồng thời nó cũng được ghi vào ổ dự phòng.

RAID 1 cung cấp một phiên bản dự phòng dữ liệu đầy đủ cho hệ thống. Nếu một ổ gặp sự cố, ổ còn lại vẫn còn hoạt động. Hạn chế của kĩ thuật này là dung lượng RAID chỉ bằng dung lượng nhỏ nhất của hai ổ cứng nếu như dung lượng lưu trữ trên hai ổ được sử dụng độc lập.

Ưu điểm:
- Cung cấp dự phòng dữ liệu toàn diện.

Nhược điểm:
- Dung lượng lưu trữ chỉ lớn bằng dung lượng ổ nhỏ nhất.
- Không tăng hiệu suất thực thi.
- Nhiều thời gian chết để thay đổi ổ hoạt động khi có sự cố.

### 3. RAID 10
<img src="..\images\Screenshot_57.png">

- Raid 10 là sự kết hợp giữa Raid 1 và Raid 0.

- Số ổ cứng tối thiểu dùng để setup: 4 ổ cùng dung lượng, nếu 4 ổ khác dung lượng thì lấy ổ thấp nhất.

- Sử dụng Raid 10 dữ liệu sẽ được lưu đồng thời vào 4 ổ cứng. 2 ổ dạng Striping (Raid 0) và 2 ổ (Mirroring) Raid 1

**Ưu điểm:**
- Tăng hiệu quả thực thi.
- Dữ liệu được dự phòng toàn bộ.

**Nhược điểm:**
- Yêu cầu số lượng ổ cứng lớn.
- Khả năng truy xuất dữ liệu giảm một nửa.

### 4. RAID 5
- RAID 5 thực hiện chia đều dữ liệu trên các ổ đĩa giống như RAID 0 nhưng với một cơ chế phức tạp hơn. Dữ liệu và bản sao lưu được chia lên tất cả các ổ cứng.
- Giả sử có 8 đoạn dữ liệu và 3 ổ đĩa: Đoạn dữ liệu số 1 và số 2 sẽ được ghi vào ổ đĩa 1 và 2 riêng rẽ, đoạn sao lưu của chúng được ghi vào ổ cứng 3. Đoạn số 3 và 4 được ghi vào ổ 1 và 3 với đoạn sao lưu tương ứng ghi vào ổ đĩa 2. Đoạn số 5, 6 ghi vào ổ đĩa 2 và 3, còn đoạn sao lưu được ghi vào ổ đĩa 1 và sau đó trình tự này lặp lại, đoạn số 7,8 được ghi vào ổ 1, 2 và đoạn sao lưu ghi vào ổ 3 như ban đầu.
- Số lượng ổ cứng tối thiểu: 3

**Ưu điểm:**
- Tăng dung lượng lưu trữ
- Dữ liệu được dự phòng toàn bộ
- Khả năng hoán đổi nhanh 24x7

**Nhược điểm**
- Giá thành cao
- Hiệu quả thực thi giảm trong quá trình phục hồi