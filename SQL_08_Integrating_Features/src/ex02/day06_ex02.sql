SELECT
    p.name,
    m.pizza_name,
    m.price,
    ROUND(m.price * (1 - pd.discount / 100), 2) AS discount_price,
    pz.name AS pizzeria_name
FROM person_order po
    JOIN person p ON po.person_id = p.id
    JOIN menu m ON po.menu_id = m.id
    JOIN pizzeria pz ON m.pizzeria_id = pz.id
    JOIN person_discounts pd ON pd.person_id = po.person_id
                            AND pd.pizzeria_id = m.pizzeria_id
ORDER BY p.name, m.pizza_name;