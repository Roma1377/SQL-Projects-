SELECT COALESCE(v.name, o.name) AS name,
       COALESCE(v.count, 0) + COALESCE(o.count, 0) AS total_count
FROM (
    SELECT p.name,
           COUNT(*) AS count
    FROM person_visits pv
    JOIN pizzeria p ON pv.pizzeria_id = p.id
    GROUP BY p.name
) v
FULL JOIN (
    SELECT p.name,
           COUNT(*) AS count
    FROM person_order po
    JOIN menu m ON po.menu_id = m.id
    JOIN pizzeria p ON m.pizzeria_id = p.id
    GROUP BY p.name
) o ON v.name = o.name
ORDER BY total_count DESC, name ASC;