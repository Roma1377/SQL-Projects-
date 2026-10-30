SELECT person.name
FROM person
INNER JOIN person_order po ON person.id = po.person_id
INNER JOIN menu m ON m.id = po.menu_id
WHERE gender= 'male' AND pizza_name IN ('pepperoni pizza', 'mushroom pizza')
  AND address IN ('Moscow', 'Samara')
ORDER BY 1 DESC