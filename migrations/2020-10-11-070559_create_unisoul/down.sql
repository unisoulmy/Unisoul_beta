DO $$
BEGIN
   IF EXISTS (SELECT *
			    FROM pg_catalog.pg_tables 
			   WHERE tableowner = 'postgres'
			     AND UPPER(tablename)  = 'TABLE_USER')
   THEN
      DROP TABLE public.TABLE_USER;
   END IF;
   
   IF EXISTS (SELECT 1
			    FROM pg_catalog.pg_tables 
			   WHERE tableowner = 'postgres'
			     AND UPPER(tablename)  = 'TABLE_ROLE')
   THEN
      DROP TABLE public.TABLE_ROLE;
   END IF;
   
   IF EXISTS (SELECT 1
			    FROM pg_catalog.pg_tables 
			   WHERE tableowner = 'postgres'
			     AND UPPER(tablename)  = 'TABLE_COUNTRY')
   THEN
      DROP TABLE public.TABLE_COUNTRY;
   END IF;
   
   IF EXISTS (SELECT 1
			    FROM pg_catalog.pg_tables 
			   WHERE tableowner = 'postgres'
			     AND UPPER(tablename)  = 'TABLE_UNIVERSITY')
   THEN
      DROP TABLE public.TABLE_UNIVERSITY;
   END IF;
   
   IF EXISTS (SELECT 1
			    FROM pg_catalog.pg_tables 
			   WHERE tableowner = 'postgres'
			     AND UPPER(tablename)  = 'TABLE_STATE')
   THEN
      DROP TABLE public.TABLE_STATE;
   END IF;
   
   IF EXISTS (SELECT 1
			    FROM pg_catalog.pg_tables 
			   WHERE tableowner = 'postgres'
			     AND UPPER(tablename)  = 'TABLE_AREA')
   THEN
      DROP TABLE public.TABLE_AREA;
   END IF;
   
   IF EXISTS (SELECT *
			     FROM pg_catalog.pg_SEQUENCES 
			    WHERE sequenceowner = 'postgres'
			      AND UPPER(sequencename)  = 'TABLE_ROLE_ROLE_ID_SEQ')
	THEN
	   DROP SEQUENCE public.TABLE_ROLE_ROLE_ID_seq;
	END IF;
	
	IF EXISTS (SELECT *
			     FROM pg_catalog.pg_SEQUENCES 
			    WHERE sequenceowner = 'postgres'
			      AND UPPER(sequencename)  = 'TABLE_ROLE_ROLE_ID_SEQ')
	THEN
	   DROP SEQUENCE public.TABLE_ROLE_ROLE_ID_seq;
	END IF;
	
	IF EXISTS (SELECT *
			     FROM pg_catalog.pg_SEQUENCES 
			    WHERE sequenceowner = 'postgres'
			      AND UPPER(sequencename)  = 'TABLE_USER_USER_ID_SEQ')
	THEN
	   DROP SEQUENCE public.TABLE_USER_USER_ID_seq;
	END IF;
	
	IF EXISTS (SELECT *
			     FROM pg_catalog.pg_SEQUENCES 
			    WHERE sequenceowner = 'postgres'
			      AND UPPER(sequencename)  = 'TABLE_COUNTRY_COUNTRY_ID_SEQ')
	THEN
	   DROP SEQUENCE public.TABLE_COUNTRY_COUNTRY_ID_seq;
	END IF;
	
	IF EXISTS (SELECT *
			     FROM pg_catalog.pg_SEQUENCES 
			    WHERE sequenceowner = 'postgres'
			      AND UPPER(sequencename)  = 'TABLE_UNIVERSITY_UNIVERSITY_ID_SEQ')
	THEN
	   DROP SEQUENCE public.TABLE_UNIVERSITY_UNIVERSITY_ID_seq;
	END IF;
	
	IF EXISTS (SELECT *
			     FROM pg_catalog.pg_SEQUENCES 
			    WHERE sequenceowner = 'postgres'
			      AND UPPER(sequencename)  = 'TABLE_STATE_STATE_ID_SEQ')
	THEN
	   DROP SEQUENCE public.TABLE_STATE_STATE_ID_SEQ;
	END IF;
	
	IF EXISTS (SELECT *
			     FROM pg_catalog.pg_SEQUENCES 
			    WHERE sequenceowner = 'postgres'
			      AND UPPER(sequencename)  = 'TABLE_AREA_AREA_ID_SEQ')
	THEN
	   DROP SEQUENCE public.TABLE_AREA_AREA_ID_SEQ;
	END IF;
	
	IF EXISTS (SELECT *
			   	 FROM pg_catalog.pg_proc 
			    WHERE proname = 'create_role')
    THEN
	   DROP FUNCTION public.create_role;
	END IF;
	
	IF EXISTS (SELECT *
			   	 FROM pg_catalog.pg_proc 
			    WHERE proname = 'create_user')
    THEN
	   DROP FUNCTION public.create_user;
	END IF;
	
	IF EXISTS (SELECT *
			   	 FROM pg_catalog.pg_proc 
			    WHERE proname = 'f_get_country')
    THEN
	   DROP FUNCTION public.f_get_country;
	END IF;
	
	IF EXISTS (SELECT *
			   	 FROM pg_catalog.pg_proc 
			    WHERE proname = 'f_get_role')
    THEN
	   DROP FUNCTION public.f_get_role;
	END IF;
	
	IF EXISTS (SELECT *
			   	 FROM pg_catalog.pg_proc 
			    WHERE proname = 'f_get_university')
    THEN
	   DROP FUNCTION public.f_get_university;
	END IF;
END$$;
