DELIMITER $$
DROP PROCEDURE IF EXISTS traer_data;
CREATE PROCEDURE traer_data(
    IN _p_precio1 NUMERIC(6,2),
    IN _p_precio2 NUMERIC(6,2)
)
LANGUAGE SQL MODIFIES SQL DATA
BEGIN
    START TRANSACTION;
    SELECT p.id_producto,
           p.nomb_producto,
           p.precio AS precio soles, 
           p.precio / 3.5 AS precio_dolares,
           UPPER( c.desc_categoria)
     FROM prodcuto p,
          categoria c
    WHERE precio BETWEEN _p_precio1 AND _p_precio2
    AND   p._id_categoria = c.id_categoria
    ORDER BY p.precio DESC;
   COMMIT;
END$$
DELIMITER ;

