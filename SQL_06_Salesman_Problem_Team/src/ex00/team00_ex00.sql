DROP TABLE IF EXISTS tsp;

CREATE TABLE tsp (
    point1 TEXT NOT NULL,
    point2 TEXT NOT NULL,
    cost   INTEGER NOT NULL,
    PRIMARY KEY (point1, point2)
);

INSERT INTO tsp (point1, point2, cost) VALUES
    ('a', 'b', 10),
    ('b', 'a', 10),
    ('a', 'd', 20),
    ('d', 'a', 20),
    ('a', 'c', 15),
    ('c', 'a', 15),
    ('b', 'd', 25),
    ('d', 'b', 25),
    ('b', 'c', 35),
    ('c', 'b', 35),
    ('c', 'd', 30),
    ('d', 'c', 30);

WITH RECURSIVE tours AS (
    SELECT
        point1 AS start_city,
        point2 AS current_city,
        ARRAY[point1, point2] AS tour,
        cost AS total_cost,
        1 AS depth
    FROM tsp
    WHERE point1 = 'a'

    UNION ALL

    SELECT
        t.start_city,
        tsp.point2,
        t.tour || tsp.point2,
        t.total_cost + tsp.cost,
        t.depth + 1
    FROM tours t
    JOIN tsp ON t.current_city = tsp.point1
    WHERE
        t.depth < 4
        AND (
            (t.depth < 3 AND NOT (tsp.point2 = ANY(t.tour)))
            OR
            (t.depth = 3 AND tsp.point2 = 'a')
        )
),
all_tours AS (
    SELECT total_cost, tour
    FROM tours
    WHERE depth = 4 AND current_city = 'a'
),
min_cost AS (
    SELECT MIN(total_cost) AS min_total_cost
    FROM all_tours
)
SELECT
    total_cost,
    tour::TEXT AS tour
FROM all_tours, min_cost
WHERE total_cost = min_total_cost
ORDER BY total_cost, tour::TEXT;