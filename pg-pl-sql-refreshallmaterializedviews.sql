CREATE OR REPLACE FUNCTION public.refreshallmaterializedviews()
 RETURNS integer
 LANGUAGE plpgsql
AS $function$
DECLARE
    r RECORD;
BEGIN
    RAISE NOTICE 'Refreshing materialized view';
    FOR r IN SELECT c.oid::regclass::text as matviewname FROM pg_class as c JOIN pg_namespace AS ns ON c.relnamespace = ns.oid WHERE c.relkind = 'm' and nspname not like 'sendgrid2'
    LOOP
        RAISE NOTICE 'Refreshing %', r.matviewname;
        EXECUTE 'REFRESH MATERIALIZED VIEW ' || r.matviewname;
    END LOOP;

    RETURN 1;
END 
$function$
;
