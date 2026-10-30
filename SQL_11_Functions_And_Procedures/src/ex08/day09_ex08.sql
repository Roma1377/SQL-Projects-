CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop INTEGER DEFAULT 10)
RETURNS SETOF INTEGER
LANGUAGE SQL AS $$
    WITH RECURSIVE fib(a, b) AS (
        VALUES (0, 1)
        UNION ALL
        SELECT b, a + b FROM fib WHERE b < pstop
    )
    SELECT a FROM fib WHERE a < pstop;
$$;

-- Проверка
SELECT * FROM fnc_fibonacci(100);
