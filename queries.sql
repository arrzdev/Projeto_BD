-- 1. Liste o nome de todos os clientes que fizeram encomendas contendo produtos de preço superior
-- a €50 no ano de 2023;
SELECT DISTINCT c.name
FROM Customer c
JOIN Orders o ON c.cust_no = o.cust_no
JOIN Contains ct ON o.order_no = ct.order_no
JOIN Product p ON ct.SKU = p.SKU
WHERE p.price > 50 AND EXTRACT(YEAR FROM o.date) = 2023;

-- 2. Liste o nome de todos os empregados que trabalham em armazéns e não em escritórios e
-- processaram encomendas em Janeiro de 2023;
SELECT e.name
FROM Employee e
JOIN Works w ON e.ssn = w.ssn
JOIN Warehouse wh ON w.address = wh.address
JOIN Process pr ON e.ssn = pr.ssn
JOIN Orders o ON pr.order_no = o.order_no
WHERE EXTRACT(MONTH FROM o.date) = 1
  AND EXTRACT(YEAR FROM o.date) = 2023
  AND NOT EXISTS ( --remove workers that also work on an office
    SELECT 1
    FROM Works w2
    JOIN Office o2 ON w2.address = o2.address
    WHERE w2.ssn = e.ssn
  );


-- 3. Indique o nome do produto mais vendido;
SELECT p.description AS best_selling_product
FROM Product p
JOIN Contains ct ON p.SKU = ct.SKU
GROUP BY p.description
ORDER BY SUM(ct.qtd) DESC
LIMIT 1;

-- 4. Indique o valor total de cada venda realizada.
SELECT s.order_no,  SUM(p.price * ct.qtd) AS total_value
FROM Sale s
JOIN Contains ct ON s.order_no = ct.order_no
JOIN Product p ON ct.SKU = p.SKU
GROUP BY s.order_no;
