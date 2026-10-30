DROP FUNCTION IF EXISTS fnc_persons_female();
DROP FUNCTION IF EXISTS fnc_persons_male();

CREATE OR REPLACE FUNCTION fnc_persons(pgender VARCHAR DEFAULT 'female')
RETURNS SETOF person
LANGUAGE SQL AS $$
    SELECT * FROM person WHERE gender = pgender;
$$;

-- Проверка
SELECT * FROM fnc_persons(pgender := 'male');
SELECT * FROM fnc_persons();