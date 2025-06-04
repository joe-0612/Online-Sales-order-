CREATE TABLE orders (
    order_id INTEGER,
    order_date DATE,
    list_price NUMERIC,
    quantity INTEGER
);

SELECT
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(list_price * quantity) AS monthly_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM
    orders
WHERE 
    order_date BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY
    year, month
ORDER BY
    year, month;


