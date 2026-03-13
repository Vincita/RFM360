USE hw;
WITH custumers_rfm AS(
-- Tính chỉ số RFM cho mỗi khách hàng
SELECT
    CustomerID,
    --  Recency: số ngày từ lần mua gần nhất tới ngày 01-09-2022(vì trong dữ liệu chỉ ghi nhận tới ngày 31-08-2022)
    TIMESTAMPDIFF(DAY, MAX(Purchase_Date),'2022-09-01') AS Recency,

    -- Frequency: số giao dịch trung bình mỗi năm
    round(count(*)/NULLIF(TIMESTAMPDIFF(DAY, c.created_date,'2022-09-01')/365,0),2) AS Frequency,

    -- Monetary: số tiền chi tiêu trung bình mỗi năm
    round(sum(GMV)/NULLIF(TIMESTAMPDIFF(DAY, c.created_date,'2022-09-01')/365,0),0) AS Monetary
FROM customer_transaction a
JOIN customer_registered c ON c.ID = a.CustomerID
GROUP BY a.CustomerID, c.created_date
),

-- Ranking theo từng chỉ số
custom_rn AS(
SELECT *,
       ROW_NUMBER() OVER(ORDER BY Recency ASC) AS rn_recency,
       ROW_NUMBER() OVER(ORDER BY Frequency) AS rn_frequency,
       ROW_NUMBER() OVER(ORDER BY Monetary) AS rn_monetary
from custumers_rfm
),

-- Tính các mốc quartile
quartile AS (
SELECT
    -- Quanrtile R
    MAX(CASE WHEN rn_recency = FLOOR(max_rn*0.25) THEN Recency END) AS r25,
    MAX(CASE WHEN rn_recency = FLOOR(max_rn*0.5) THEN Recency END) AS r50,
    MAX(CASE WHEN rn_recency = FLOOR(max_rn*0.75) THEN Recency END) AS r75,

    -- Quartile F
    MAX(CASE WHEN rn_frequency = FLOOR(max_rn*0.25) THEN Frequency END) AS f25,
    MAX(CASE WHEN rn_frequency = FLOOR(max_rn*0.5) THEN Frequency END) AS f50,
    MAX(CASE WHEN rn_frequency = FLOOR(max_rn*0.75) THEN Frequency END) AS f75,

    -- Quartile M
    MAX(CASE WHEN rn_monetary = FLOOR(max_rn*0.25) THEN Monetary END) AS m25,
    MAX(CASE WHEN rn_monetary = FLOOR(max_rn*0.5) THEN Monetary END) AS m50,
    MAX(CASE WHEN rn_monetary = FLOOR(max_rn*0.75) THEN Monetary END) AS m75
FROM (
    SELECT *,
           MAX(rn_recency) OVER() AS max_rn
    FROM custom_rn
) t
),

-- Phân vị RFM
rfm_score AS (
SELECT a.*,

CASE
    WHEN Recency < q.r25 THEN 1
    WHEN Recency < q.r50 THEN 2
    WHEN Recency < q.r75 THEN 3
    ELSE 4
END AS R,

CASE
    WHEN Frequency < q.f25 THEN 1
    WHEN Frequency < q.f50 THEN 2
    WHEN Frequency < q.f75 THEN 3
    ELSE 4
END AS F,

CASE
    WHEN Monetary < q.m25 THEN 1
    WHEN Monetary < q.m50 THEN 2
    WHEN Monetary < q.m75 THEN 3
    ELSE 4
END AS M

FROM custom_rn a
CROSS JOIN quartile q
)

-- B5: Tạo nhóm RFM và phân loại khách hàng
SELECT *,
       CONCAT(R,F,M) AS RFM_group,

       CASE
           WHEN CONCAT(R,F,M) IN ('444','443','434','433')
                THEN 'VIP'

           WHEN CONCAT(R,F,M) IN ('344','343','333','334','441','442','431','432','341','342','331','332')
                THEN 'Loyal Customers'

           WHEN CONCAT(R,F,M) IN ('322','323','324','423','424','422','223','224','233','234','243','244')
                THEN 'Potential Loyalists'

            WHEN CONCAT(R,F,M) IN ('411','412','413','414','311','312','313','314','421')
                THEN 'New Customers'

            WHEN CONCAT(R,F,M) IN ('221','222','213','212','131','132','141','142','134','144','133','143','224','214')
                THEN 'At Risk'

           WHEN CONCAT(R,F,M) IN ('111','112','113','114','121','122','123','211','124')
                THEN 'Lost'

           ELSE 'Others'
       END AS CustomerType

FROM rfm_score
WHERE Monetary != 0
