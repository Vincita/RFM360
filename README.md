# Customer 360 – Phân khúc khách hàng bằng RFM Analysis

## 1. Tổng quan dự án

Dự án xây dựng mô hình **Customer 360** nhằm phân tích hành vi và giá trị của khách hàng dựa trên dữ liệu giao dịch.

Phân tích sử dụng mô hình **RFM (Recency – Frequency – Monetary)** kết hợp với **BCG Matrix** để phân khúc khách hàng và đưa ra các insight phục vụ chiến lược marketing và giữ chân khách hàng.

### Mục tiêu
- Phân tích hành vi mua hàng của khách hàng
- Phân khúc khách hàng theo mức độ giá trị
- Xác định các nhóm khách hàng quan trọng
- Đề xuất chiến lược marketing và giữ chân khách hàng

---

## 2. Phương pháp phân tích

### RFM Model
Mô hình RFM đánh giá khách hàng dựa trên 3 yếu tố:

- **Recency (R):** Thời gian từ lần mua gần nhất
- **Frequency (F):** Tần suất mua hàng
- **Monetary (M):** Tổng giá trị chi tiêu

Các chỉ số được chia theo **quartile (1–4)** để tạo ra các nhóm hành vi khách hàng khác nhau.

### BCG Matrix
BCG Matrix được sử dụng để đánh giá khách hàng theo:

- Giá trị đóng góp
- Tiềm năng tăng trưởng

Khách hàng được phân thành 4 nhóm:
- **Stars** – giá trị cao, tiềm năng cao  
- **Cash Cows** – đóng góp doanh thu ổn định  
- **Question Marks** – có tiềm năng phát triển  
- **Dogs** – giá trị và tiềm năng thấp  

---

## 3. Dataset

Dữ liệu được trích xuất từ **Azure SQL Server** gồm khoảng **113,000 khách hàng** với dữ liệu giao dịch từ **06/2022 – 08/2022**.

### Các bảng chính

**Customer_Registered**
- Thông tin khách hàng
- Chi nhánh và khu vực
- Trạng thái khách hàng
- Ngày đăng ký và hủy hợp đồng

**Customer_Transaction**
- Transaction ID
- Customer ID
- Ngày giao dịch
- GMV (giá trị giao dịch)

---

## 4. Quy trình xử lý dữ liệu

1. **Data Cleaning**
   - Lọc khách hàng đang hoạt động
   - Loại bỏ giao dịch không hợp lệ

2. **Tính toán RFM**
   - Recency
   - Frequency
   - Monetary

3. **Phân nhóm RFM**
   - Chia dữ liệu theo quartile
   - Gán điểm RFM từ 1–4

4. **Phân khúc khách hàng**
   - Tạo các nhóm khách hàng dựa trên RFM

5. **Phân loại BCG**
   - Đánh giá giá trị và tiềm năng khách hàng

---

## 5. Các nhóm khách hàng chính

- **Champions (VIP)** – khách hàng giá trị cao, mua thường xuyên  
- **Loyal Customers** – khách hàng trung thành  
- **Potential Loyalists** – khách hàng có tiềm năng trở thành loyal  
- **New Customers** – khách hàng mới  
- **Price Sensitive** – mua thường xuyên nhưng chi tiêu thấp  
- **At Risk** – khách hàng có dấu hiệu giảm tương tác  
- **Lost Customers** – khách hàng đã ngừng mua hàng

---

## 6. Insight chính

- Nhóm **Potential Loyalists** có tiềm năng tăng trưởng cao.  
- **VIP và Loyal Customers** đóng góp phần lớn doanh thu.  
- Nhiều khách hàng nằm trong nhóm **30–60 ngày và 90+ ngày Recency**, cho thấy cần chiến lược kích hoạt lại khách hàng.  
- Nhóm **At Risk** cần được chăm sóc để tránh mất khách hàng.

---

## 7. Đề xuất chiến lược

**VIP Customers**
- Ưu đãi độc quyền
- Chương trình loyalty

**Loyal Customers**
- Khuyến mãi định kỳ
- Email marketing

**Potential Loyalists**
- Khuyến khích mua lặp lại
- Chương trình tích điểm

**At Risk Customers**
- Chiến dịch re-engagement
- Ưu đãi cá nhân hóa

**Lost Customers**
- Win-back campaign
- Phân tích nguyên nhân rời bỏ

---

## 8. Cấu trúc Repository

```
Customer360-Analysis/
│
├── Customer360_Report.pdf
├── RFM_SQL_Query.sql
└── README.md
```

---

## Công cụ sử dụng
- SQL
- Data Analysis
- Customer Segmentation

---

**Lưu ý:**  
Đây là dự án cá nhân nhằm thực hành phân tích dữ liệu, không đại diện cho bất kỳ tổ chức hay doanh nghiệp nào.
