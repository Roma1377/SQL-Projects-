-- Session #1
BEGIN;

UPDATE pizzeria SET rating = 4.0 WHERE name = 'Dominos';

UPDATE pizzeria SET rating = 4.0 WHERE name = 'Pizza Hut';

COMMIT;

-- Session #2
BEGIN;

UPDATE pizzeria SET rating = 3.0 WHERE name = 'Pizza Hut';

UPDATE pizzeria SET rating = 3.0 WHERE name = 'Dominos';

COMMIT;