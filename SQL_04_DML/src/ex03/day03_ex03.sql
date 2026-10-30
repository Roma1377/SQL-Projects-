WITH female_visits AS (
    SELECT pv.pizzeria_id
    FROM person_visits pv
    JOIN person p ON pv.person_id = p.id
    WHERE p.gender = 'female'
),
male_visits AS (
    SELECT pv.pizzeria_id
    FROM person_visits pv
    JOIN person p ON pv.person_id = p.id
    WHERE p.gender = 'male'
),
counts AS (
    SELECT
        pz.name AS pizzeria_name,
        (SELECT COUNT(*) FROM female_visits f WHERE f.pizzeria_id = pz.id) AS female_count,
        (SELECT COUNT(*) FROM male_visits m WHERE m.pizzeria_id = pz.id) AS male_count
    FROM pizzeria pz
)
SELECT pizzeria_name
FROM counts
WHERE female_count > male_count
   OR male_count > female_count
ORDER BY pizzeria_name;