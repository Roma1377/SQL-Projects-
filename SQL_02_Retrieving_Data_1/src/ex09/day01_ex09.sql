-- через IN
SELECT name
FROM pizzeria
WHERE id NOT IN (SELECT pizzeria_id FROM person_visits);

-- через EXISTS
SELECT name
FROM pizzeria AS p
WHERE NOT EXISTS (SELECT 1 FROM person_visits WHERE pizzeria_id = p.id);