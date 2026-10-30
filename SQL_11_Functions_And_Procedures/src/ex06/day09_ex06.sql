CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date(
    pperson VARCHAR DEFAULT 'Dmitriy',
    pprice  NUMERIC DEFAULT 500,
    pdate   DATE    DEFAULT '2022-01-08'
)
RETURNS TABLE (pizzeria_name VARCHAR)
LANGUAGE plpgsql AS $$
BEGIN
    RETURN QUERY
    SELECT pz.name
    FROM person_visits pv
    JOIN person p ON pv.person_id = p.id
    JOIN pizzeria pz ON pv.pizzeria_id = pz.id
    JOIN menu m ON m.pizzeria_id = pz.id
    WHERE p.name = pperson
      AND pv.visit_date = pdate
      AND m.price < pprice;
END;
$$;

-- Проверки
SELECT * FROM fnc_person_visits_and_eats_on_date(pprice := 800);
SELECT * FROM fnc_person_visits_and_eats_on_date(pperson := 'Anna', pprice := 1300, pdate := '2022-01-01');