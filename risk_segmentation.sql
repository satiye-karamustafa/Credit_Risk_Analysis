WITH Risk_tablosu AS
(SELECT loan_grade, COUNT(loan_status) as total_kredi ,
SUM(CAST(loan_status AS INT)) as batan_kredi
FROM temizlenmis_kredi_verisi
GROUP BY loan_grade)

SELECT loan_grade, total_kredi, batan_kredi, 
(CAST (batan_kredi AS FLOAT) / total_kredi) * 100 as batma_yuzde_orani,
RANK () OVER (ORDER BY (CAST (batan_kredi AS FLOAT) / total_kredi) * 100 DESC) AS risk_siralamasi
FROM Risk_tablosu;

