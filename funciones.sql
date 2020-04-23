---- BLOQUE SENCILLO
DO $$
<<first_block>>
DECLARE
	contador integer := 0;
BEGIN
	contador := contador + 1;
	RAISE NOTICE 'El valor actual es %', contador;
	contador := contador + 1;
	RAISE NOTICE 'El valor actual es %', contador;
END first_block $$;

-------SUB BLOQUES
DO $$
<<bloque_externo>>
DECLARE
	contador integer := 0;
BEGIN
	contador := contador + 1;
	RAISE NOTICE 'El valor externo antes es %', contador;
	DECLARE
		contador integer:= 0;
	BEGIN
		contador := contador + 1;
		bloque_externo.contador := bloque_externo.contador + 1;
		RAISE NOTICE 'El valor del bloque interno es %', contador;
		RAISE NOTICE 'El valor del bloque externo es  %', bloque_externo.contador;
	END;
	RAISE NOTICE 'El valor del bloque externo al salir es %', contador;
END bloque_externo $$;

--- Variables
DO $$
DECLARE
	creado time := NOW();
BEGIN
	RAISE NOTICE '%', creado;
	PERFORM pg_sleep(10);
	creado := NOW();
	RAISE NOTICE '%', creado;
END $$;

----Primer Funciòn
CREATE OR REPLACE FUNCTION inc(val integer) RETURNS integer AS $$
BEGIN
	RAISE NOTICE '%', val;
	return val +1;
END; $$
LANGUAGE PLPGSQL;

select inc(20);
select inc(inc(20));
select inc();
---

--Parámetros de Salidas
CREATE OR REPLACE FUNCTION hi_lo(
	a NUMERIC,
	b NUMERIC,
	c NUMERIC,
	OUT hi NUMERIC,
	OUT lo NUMERIC
) AS $$
BEGIN
	hi := GREATEST(a,b,c);
	lo := LEAST(a,b,c);
END; $$
LANGUAGE PLPGSQL;

select hi_lo(10,20,30);
select * from hi_lo(10,20,30);
select * from hi_lo(10,20,30,40);







