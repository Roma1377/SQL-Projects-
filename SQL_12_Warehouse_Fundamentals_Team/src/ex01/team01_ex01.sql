SELECT
  t1.name,
  t1.lastname,
  t1.currency_name,
  (t1.money * t1.rate_to_usd) AS currency_in_usd
FROM (
  SELECT
    COALESCE(u.name, 'not defined') AS name,
    COALESCE(u.lastname, 'not defined') AS lastname,
    c.name AS currency_name,
    b.money,
    COALESCE(
      (SELECT rate_to_usd
       FROM currency
       WHERE currency.id = b.currency_id
         AND currency.updated < b.updated
       ORDER BY currency.updated DESC
       LIMIT 1),
      (SELECT rate_to_usd
       FROM currency
       WHERE currency.id = b.currency_id
         AND currency.updated > b.updated
       ORDER BY currency.updated ASC
       LIMIT 1)
    ) AS rate_to_usd
  FROM balance b
  INNER JOIN (
    SELECT id, name
    FROM currency
    GROUP BY id, name
  ) c ON c.id = b.currency_id
  LEFT JOIN "user" u ON u.id = b.user_id
) t1
ORDER BY 1 DESC, 2, 3;