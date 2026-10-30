INSERT INTO person_order (id, person_id, menu_id, order_date)
SELECT
    (SELECT MAX(id) FROM person_order) + ROW_NUMBER() OVER (),
    p.id,
    (SELECT id FROM menu WHERE pizza_name = 'sicilian pizza' AND pizzeria_id = (SELECT id FROM pizzeria WHERE name = 'Dominos')),
    '2022-02-24'
FROM person p
WHERE p.name IN ('Denis', 'Irina')
  AND NOT EXISTS (
      SELECT 1 FROM person_order po
      WHERE po.person_id = p.id
        AND po.menu_id = (SELECT id FROM menu WHERE pizza_name = 'sicilian pizza')
        AND po.order_date = '2022-02-24'
  );