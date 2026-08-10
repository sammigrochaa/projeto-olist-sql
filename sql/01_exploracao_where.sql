-- ============================================
-- 01_exploracao_where.sql
-- Exploração inicial com WHERE, AND, OR, ORDER BY e LIMIT
-- Tabela: olist_orders_dataset
-- ============================================

-- Consulta 1: todos os pedidos, sem filtro (linha de base)
-- Resultado esperado: 99441 linhas
SELECT * FROM olist_orders_dataset;

-- Consulta 2: pedidos que NÃO estão com status 'delivered'
-- Resultado: 2963 linhas
SELECT * FROM olist_orders_dataset 
WHERE order_status != 'delivered';

-- Consulta 3: conferência cruzada - pedidos COM status 'delivered'
-- Resultado: 96478 linhas (2963 + 96478 = 99441, confirma o total)
SELECT * FROM olist_orders_dataset 
WHERE order_status = 'delivered';

-- Consulta 4: pedidos cancelados OU indisponíveis
-- Resultado: 1234 linhas
SELECT * FROM olist_orders_dataset 
WHERE order_status = 'canceled' OR order_status = 'unavailable';

-- Consulta 5: pedidos cancelados E comprados a partir de 2018
-- Resultado: 334 linhas
SELECT * FROM olist_orders_dataset 
WHERE order_status = 'canceled' 
AND order_purchase_timestamp >= '2018-01-01';

-- Consulta 6: os 5 pedidos cancelados mais recentes (2018 em diante)
-- Resultado: 5 linhas (17/10, 16/10, 03/10, 01/10, 29/09 de 2018)
SELECT * FROM olist_orders_dataset
WHERE order_status = 'canceled' 
AND order_purchase_timestamp >= '2018-01-01'
ORDER BY order_purchase_timestamp DESC
LIMIT 5;