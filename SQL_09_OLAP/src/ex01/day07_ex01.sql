SELECT name,
       count_of_visits
FROM (
    SELECT p.name,
           COUNT(*) AS count_of_visits
    FROM person_visits pv
    JOIN person p ON pv.person_id = p.id
    GROUP BY p.name
    ORDER BY count_of_visits DESC, p.name ASC
    LIMIT 4
) AS top_visitors
ORDER BY name ASC;