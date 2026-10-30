WITH orders_with_gender AS (
    SELECT
        po.person_id,
        m.pizzeria_id,
        p.gender
    FROM person_order po
    JOIN menu m ON po.menu_id = m.id
    JOIN person p ON po.person_id = p.id
),
pizzerias_with_gender AS (
    SELECT DISTINCT pizzeria_id, gender
    FROM orders_with_gender
),
only_female AS (
    SELECT pizzeria_id
    FROM pizzerias_with_gender
    WHERE gender = 'female'
    EXCEPT
    SELECT pizzeria_id
    FROM pizzerias_with_gender
    WHERE gender = 'male'
),
only_male AS (
    SELECT pizzeria_id
    FROM pizzerias_with_gender
    WHERE gender = 'male'
    EXCEPT
    SELECT pizzeria_id
    FROM pizzerias_with_gender
    WHERE gender = 'female'
)
SELECT pz.name AS pizzeria_name
FROM (
    SELECT pizzeria_id FROM only_female
    UNION
    SELECT pizzeria_id FROM only_male
) AS target_pizzerias
JOIN pizzeria pz ON target_pizzerias.pizzeria_id = pz.id
ORDER BY pizzeria_name;