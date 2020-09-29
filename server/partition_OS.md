# Các phân vùng trong OS

## Phân vùng là gì?

Thuật ngữ phân vùng – partition, được sử dụng ở đây nghĩa là các phần được định dạng riêng biệt trong toàn bộ ổ cứng. Ví dụ, 1 phân vùng logical đã được chia tùy theo nhu cầu sử dụng, bạn có thể tùy chỉnh và áp dụng với nhiều việc khác nhau. Nếu bạn có 1 ổ cứng với dung lượng 1TB, và chia thành 2 phân vùng (ví dụ 250GB và 750GB), dữ liệu lưu trữ trên đó hoàn toàn riêng biệt và không ảnh hưởng đến nhau, bạn có thể sử dụng 1 phân vùng Windows với văn bản,tài liệu, phim ảnh, game, và phân vùng còn lại dành cho Linux.


## Một số phân vùng trong OS
### Phân vùng `/boot`
Chứa các tập tin cấu hình cho quá trình khởi động hệ thống (boot configuration files)

Thông thường khi boot các máy Linux, ta chỉ cần để `/boot` từ 512 MB đến 1 GB là đủ

### Phân vùng `swap`
Một phân vùng nhằm tăng thêm bộ nhớ ảo của RAM, tuy nhiên tốc độ chậm hơn do sử dụng ổ đĩa.

### Phân vùng `/`
Phân vùng chứa các file cài đặt của hệ thống

### Phân vùng `/media` 
thư mục này được dùng để tạo ra các tập tin gắn (loaded) tạm thời được hệ thống tạo ra khi một thiết bị lưu động (removable media) được cắm vào như đĩa CDs, máy ảnh kỹ thuật số…


### Phân vùng `/mnt` 
thư mục này được dùng để gắn các hệ thống tập tin tạm thời (mounted filesystems)