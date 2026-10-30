COMMENT ON TABLE person_discounts IS 'Персональные скидки клиентов в конкретных пиццериях';

COMMENT ON COLUMN person_discounts.id IS 'Уникальный идентификатор записи о скидке';
COMMENT ON COLUMN person_discounts.person_id IS 'Идентификатор клиента (внешний ключ к person)';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'Идентификатор пиццерии (внешний ключ к pizzeria)';
COMMENT ON COLUMN person_discounts.discount IS 'Размер скидки в процентах (от 0 до 100)';