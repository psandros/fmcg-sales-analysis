CREATE DATABASE fmcg_db;
USE	fmcg_db;
CREATE TABLE fmcg_sales (
    tanggal DATE,
    kode_sku VARCHAR(10),
    nama_produk VARCHAR(50),
    kategori VARCHAR(30),
    subkategori VARCHAR(30),
    wilayah VARCHAR(30),
    channel VARCHAR(20),
    actual_unit INT,
    target_unit INT,
    actual_revenue BIGINT,
    target_revenue BIGINT,
    cogs BIGINT,
    profit BIGINT,
    stok_awal INT,
    stok_akhir INT,
    achievement_pct FLOAT,
    gap_unit INT,
    profit_margin_pct FLOAT,
    days_of_stock INT
);
SHOW TABLES;
SELECT COUNT(*)
FROM fmcg_sales;

-- Wilayah mana yang paling tinggi dan paling rendah pencapaiannya?
SELECT wilayah, SUM(actual_revenue) AS total_revenue FROM fmcg_sales GROUP BY wilayah;
SELECT 
    wilayah,
    SUM(actual_revenue) AS total_revenue,
    SUM(target_revenue) AS total_target,
    ROUND(SUM(actual_revenue) / SUM(target_revenue) * 100, 1) AS achievement_pct
FROM fmcg_sales
GROUP BY wilayah
ORDER BY achievement_pct DESC;
-- Channel mana yang paling efektif untuk tiap kategori produk?
SELECT 
    kategori,
    channel,
    SUM(actual_revenue) AS total_revenue,
    ROUND(AVG(profit_margin_pct), 1) AS avg_margin
FROM fmcg_sales
GROUP BY kategori, channel
ORDER BY kategori, total_revenue DESC;
-- Produk mana yang jadi tulang punggung revenue perusahaan?
SELECT 
    kode_sku,
    nama_produk,
    kategori,
    SUM(actual_revenue) AS total_revenue,
    ROUND(AVG(profit_margin_pct), 1) AS avg_margin,
    SUM(actual_unit) AS total_unit_terjual
FROM fmcg_sales
GROUP BY kode_sku, nama_produk, kategori
ORDER BY total_revenue DESC
LIMIT 5;
-- Berapa SKU yang cukup untuk cover 80% total revenue perusahaan?
SELECT 
    nama_produk,
    kategori,
    total_revenue,
    ROUND(total_revenue / SUM(total_revenue) OVER() * 100, 1) AS pct_of_total,
    ROUND(SUM(total_revenue) OVER(ORDER BY total_revenue DESC) / SUM(total_revenue) OVER() * 100, 1) AS cumulative_pct
FROM (
    SELECT 
        nama_produk,
        kategori,
        SUM(actual_revenue) AS total_revenue
    FROM fmcg_sales
    GROUP BY nama_produk, kategori
) ranked
ORDER BY total_revenue DESC;
-- SKU dan wilayah mana yang paling sering berisiko kehabisan stok?
SELECT 
    nama_produk,
    wilayah,
    ROUND(AVG(days_of_stock), 0) AS avg_days_of_stock,
    SUM(actual_unit) AS total_terjual,
    ROUND(AVG(achievement_pct), 1) AS avg_achievement
FROM fmcg_sales
GROUP BY nama_produk, wilayah
HAVING avg_days_of_stock < 20
ORDER BY avg_days_of_stock ASC
LIMIT 10;