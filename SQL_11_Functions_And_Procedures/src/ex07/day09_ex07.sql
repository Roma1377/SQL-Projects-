CREATE OR REPLACE FUNCTION func_minimum(VARIADIC arr NUMERIC[])
RETURNS NUMERIC
LANGUAGE SQL AS $$
    SELECT MIN(val) FROM unnest(arr) AS t(val);
$$;

-- Проверка
SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);