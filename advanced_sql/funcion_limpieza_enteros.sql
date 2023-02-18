CREATE OR REPLACE FUNCTION keepcoding.limpieza_enteros (input INT)
RETURNS INT
AS (
  (SELECT (IFNULL (input, -99999)))
  );