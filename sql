SELECT 'Працівники' AS section, last_name, first_name, NULL AS additional_info
FROM workers

UNION ALL

SELECT 'Товари зі знижкою', name, NULL, (price * 9 + price * 0.5)
FROM goods

UNION ALL

SELECT 'Товари в алфавітному порядку', name, NULL, NULL
FROM goods

UNION ALL

SELECT 'Працівники (відсортовані)', last_name, first_name, qualification || ' | ' || passport_no
FROM workers

ORDER BY section, last_name, first_name;