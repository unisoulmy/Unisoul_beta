CREATE TABLE public.TABLE_AREA
(
	AREA_ID bigint NOT NULL,
	AREA_NAME character(100) NOT NULL,
	STATE_ID bigint NOT NULL,
	ACTIVE char,
	CREATED_BY bigint,
	CREATION_DATE DATE,
	LAST_UPDATED_BY bigint,
	LAST_UPDATE_DATE DATE,
	CONSTRAINT CONS_TABLE_AREA_PK PRIMARY KEY (AREA_ID)
)

TABLESPACE pg_default;

ALTER TABLE public.TABLE_AREA
	OWNER to postgres;

CREATE TABLE public.TABLE_COUNTRY
(
	COUNTRY_ID bigint NOT NULL,
	COUNTRY_NAME character(100) NOT NULL,
	ACTIVE char,
	CREATED_BY bigint,
	CREATION_DATE DATE,
	LAST_UPDATED_BY bigint,
	LAST_UPDATE_DATE DATE,
	CONSTRAINT CONS_TABLE_COUNTRY_PK PRIMARY KEY (COUNTRY_ID)
)

TABLESPACE pg_default;

ALTER TABLE public.TABLE_COUNTRY
	OWNER to postgres;
	
CREATE TABLE public.TABLE_ROLE
(
	ROLE_ID bigint NOT NULL,
	ROLE_NAME character(50) NOT NULL,
	ROLE_DESCRIPTION character (200),
	ACTIVE char NOT NULL,
	CREATED_BY bigint,
	CREATION_DATE DATE,
	LAST_UPDATED_BY bigint,
	LAST_UPDATE_DATE DATE,
	CONSTRAINT CONS_TABLE_ROLE_PK PRIMARY KEY (ROLE_ID)
)

TABLESPACE pg_default;

ALTER TABLE public.TABLE_ROLE
	OWNER to postgres;

CREATE TABLE public.TABLE_STATE
(
	STATE_ID bigint NOT NULL,
	STATE_NAME character(100) NOT NULL,
	COUNTRY_ID bigint NOT NULL,
	ACTIVE CHAR,
	CREATED_BY bigint,
	CREATION_DATE DATE,
	LAST_UPDATED_BY bigint,
	LAST_UPDATE_DATE DATE,
	CONSTRAINT CONS_TABLE_STATE_PK PRIMARY KEY (STATE_ID)
)

TABLESPACE pg_default;

ALTER TABLE public.TABLE_STATE
	OWNER to postgres;
	
CREATE TABLE public.TABLE_UNIVERSITY
(
	UNIVERSITY_ID bigint NOT NULL,
	UNIVERSITY_NAME character(100) NOT NULL,
	AREA_ID bigint,
	EMAIL_PREFIX character(100) NOT NULL,
	ACTIVE char NOT NULL,
	CREATED_BY bigint,
	CREATION_DATE DATE,
	LAST_UPDATED_BY bigint,
	LAST_UPDATE_DATE DATE,
	CONSTRAINT CONS_TABLE_UNIVERSITY_PK PRIMARY KEY (UNIVERSITY_ID)
)

TABLESPACE pg_default;

ALTER TABLE public.TABLE_UNIVERSITY
	OWNER to postgres;
	
CREATE TABLE public.TABLE_USER
(
	USER_ID bigint NOT NULL,
	GENDER char NOT NULL,
	FIRST_NAME character(20) NOT NULL,
	LAST_NAME character(20) NOT NULL,
	EMAIL_ADDRESS character(50) NOT NULL,
	MOBILE_NUMBER character(50),
	ROLE_ID bigint NOT NULL,
	DATE_OF_BIRTH date,
	PASSWORD character(100) NOT NULL,
	ACTIVATED_FLAG char NOT NULL,
	RACE_COUNTRY_ID bigint NOT NULL,
	PROFILE_PICTURE_URL character(500) ,
	CONSTRAINT CONS_TABLE_USER_PK PRIMARY KEY (USER_ID)
)

TABLESPACE pg_default;

ALTER TABLE public.TABLE_USER
	OWNER to postgres;
	
	-- SEQUENCE: public.table_area_area_id_seq

-- DROP SEQUENCE public.table_area_area_id_seq;

CREATE SEQUENCE public.table_area_area_id_seq
    CYCLE
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE public.table_area_area_id_seq
    OWNER TO postgres;

-- SEQUENCE: public.table_country_country_id_seq

-- DROP SEQUENCE public.table_country_country_id_seq;

CREATE SEQUENCE public.table_country_country_id_seq
    CYCLE
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE public.table_country_country_id_seq
    OWNER TO postgres;
	
CREATE SEQUENCE public.TABLE_ROLE_ROLE_ID_SEQ
		INCREMENT 1
		START 1
		MINVALUE 1
		MAXVALUE 9223372036854775807
		CACHE 1;

	ALTER SEQUENCE public.TABLE_ROLE_ROLE_ID_SEQ
		OWNER TO postgres;	

-- SEQUENCE: public.table_state_state_id_seq

-- DROP SEQUENCE public.table_state_state_id_seq;

CREATE SEQUENCE public.table_state_state_id_seq
    CYCLE
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE public.table_state_state_id_seq
    OWNER TO postgres;

-- SEQUENCE: public.table_university_university_id_seq

-- DROP SEQUENCE public.table_university_university_id_seq;

CREATE SEQUENCE public.table_university_university_id_seq
    CYCLE
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE public.table_university_university_id_seq
    OWNER TO postgres;
	
CREATE SEQUENCE public.TABLE_USER_USER_ID_SEQ
		INCREMENT 1
		START 1
		MINVALUE 1
		MAXVALUE 9223372036854775807
		CACHE 1;

	ALTER SEQUENCE public.TABLE_USER_USER_ID_SEQ
		OWNER TO postgres;		
		
CREATE OR REPLACE FUNCTION public.CREATE_ROLE(
   "P_ROLE_NAME" character, 
   "P_ROLE_DESCRIPTION" character, 
   "P_ACTIVE" char, 
   "P_USER_ID" bigint) 
    RETURNS BIGINT
	LANGUAGE 'plpgsql'
	AS $BODY$
	DECLARE
	   v_roleid	BIGINT;
	BEGIN
	   IF "P_ROLE_NAME" IS NULL THEN
		  RETURN -1;
	   END IF;   
	   
	   IF "P_ROLE_DESCRIPTION" IS NULL THEN
		  RETURN -1;
	   END IF;   
	   
	   IF "P_ACTIVE" IS NULL THEN
		  RETURN -1;
	   END IF;
	   
	   v_roleid := NEXTVAL('public.TABLE_ROLE_ROLE_ID_SEQ');
	   
	    INSERT INTO public.TABLE_ROLE( ROLE_ID,
										ROLE_NAME, 
										ROLE_DESCRIPTION, 
										ROLE_ACTIVE, 
										CREATED_BY, 
										CREATION_DATE, 
										LAST_UPDATED_BY, 
										LAST_UPDATE_DATE
									  )
							   VALUES (v_roleid,
									   "P_ROLE_NAME", 
									   "P_ROLE_DESCRIPTION", 
									   "P_ACTIVE", 
									   "P_USER_ID", 
									   CURRENT_DATE, 
									   "P_USER_ID", 
									   CURRENT_DATE);
	
	
	   RETURN v_roleid;
	END;
	$BODY$;
	
CREATE OR REPLACE FUNCTION public.CREATE_USER(
		"P_GENDER" "char",
		"P_FIRST_NAME" character,
		"P_LAST_NAME" character,
		"P_EMAIL_ADDRESS" character,
		"P_MOBILE_NUMBER" character,
		"P_DOB" date,
		"P_PASSWORD" character,
		"P_ACTIVATED_FLAG" "char",
		"P_RACE_COUNTRY_ID" integer,
		"P_PROFILE_PICTURE_URL" character) 
    RETURNS BIGINT
	LANGUAGE 'plpgsql'
	AS $BODY$
	DECLARE
	   v_userid	BIGINT;
	BEGIN
	   IF "P_GENDER" IS NULL THEN
		  RETURN -1;
	   END IF;   
	   
	   IF "P_FIRST_NAME" IS NULL THEN
		  RETURN -1;
	   END IF;   
	   
	   IF "P_LAST_NAME" IS NULL THEN
		  RETURN -1;
	   END IF;
	   
	   IF "P_EMAIL_ADDRESS" IS NULL THEN
		  RETURN -1;
	   END IF;
	   
	   IF "P_DOB" IS NULL THEN
		  RETURN -1;
	   END IF;
	   
	   IF "P_PASSWORD" IS NULL THEN
		  RETURN -1;
	   END IF;
	   
	   IF "P_RACE_COUNTRY_ID" IS NULL THEN
		  RETURN -1;
	   END IF;
	   
	   v_userid := NEXTVAL('public.TABLE_USER_USER_ID_seq');
	   
	   INSERT INTO public.TABLE_USER( USER_ID,
										GENDER, 
										FIRST_NAME, 
										LAST_NAME, 
										EMAIL_ADDRESS, 
										MOBILE_NUMBER, 
										ROLE_ID, 
										DATE_OF_BIRTH, 
										PASSWORD, 
										ACTIVATED_FLAG, 
										RACE_COUNTRY_ID, 
										PROFILE_PICTURE_URL
									  )
							   VALUES (v_userid,
									   "P_GENDER", 
									   "P_FIRST_NAME", 
									   "P_LAST_NAME", 
									   "P_EMAIL_ADDRESS", 
									   "P_MOBILE_NUMBER", 
									   1, 
									   "P_DOB", 
									   "P_PASSWORD", 
									   "P_ACTIVATED_FLAG", 
									   "P_RACE_COUNTRY_ID", 
									   "P_PROFILE_PICTURE_URL");
	
	   RETURN v_userid;
	END;
	$BODY$;
	
create or replace function f_get_country(p_country_id		table_country.country_id%TYPE DEFAULT NULL,
										 p_country_name    	table_country.country_name%TYPE DEFAULT NULL,
										 p_active			table_country.active%TYPE DEFAULT NULL) 
returns TABLE(id table_country.country_id%TYPE, name table_country.country_name%TYPE, active_status table_country.active%TYPE)
as $$
begin
	RETURN QUERY
	SELECT country_id, country_name, active
	  FROM table_country
	 WHERE country_id = COALESCE(p_country_id, country_id)
	   AND UPPER(country_name) = COALESCE(UPPER(p_country_name), UPPER(country_name))
	   AND active = COALESCE(p_active, active);
end;
$$ language plpgsql;

create or replace function f_get_role(p_role_name   table_role.role_name%TYPE DEFAULT NULL,
										 p_active   	table_role.active%TYPE DEFAULT NULL) 
returns TABLE(id table_role.role_id%TYPE, name table_role.role_name%TYPE)
as $$
begin
    RETURN QUERY
	SELECT role_id, role_name
	  FROM table_role
	 WHERE role_name = COALESCE (p_role_name, role_name)
	   AND active = COALESCE (p_active, active);
end;
$$ language plpgsql;

create or replace function f_get_university(p_university_id   table_university.university_id%TYPE DEFAULT NULL, 
										    p_university_name table_university.university_name%TYPE DEFAULT NULL,
											p_country_id	  table_country.country_id%TYPE DEFAULT NULL,
											p_state_id		  table_state.state_id%TYPE DEFAULT NULL,
											p_area_id		  table_area.area_id%TYPE DEFAULT NULL,
										    p_active	      table_university.active%TYPE DEFAULT NULL) 
returns  TABLE (university_id 		bigint, 
				university_name 	character(100),
				area_id 			table_area.area_id%TYPE,
				area_name 			table_area.area_name%TYPE,
				state_id 			table_state.state_id%TYPE,
				state_name 			table_state.state_name%TYPE,
				country_id 			table_country.country_id%TYPE,
				country_name 		table_country.country_name%TYPE,
				email_prefix 	character(100), 
				active 				char)
as $$
begin
    RETURN QUERY 
	   SELECT tu.university_id, 
	   	      tu.university_name, 
			  ta.area_id,
			  ta.area_name,
			  ts.state_id,
			  ts.state_name,
			  tc.country_id,
			  tc.country_name,
			  tu.email_prefix, 
			  tu.active 
	    FROM table_university tu,
			 table_area ta,
			 table_state ts,
			 table_country tc
	  WHERE tu.area_id = ta.area_id
	    AND ta.state_id = ts.state_id
		AND ts.country_id = tc.country_id
	  	AND tu.university_id = COALESCE (p_university_id, tu.university_id)
	    AND tu.university_name = COALESCE(p_university_name, tu.university_name)
		AND tu.active = COALESCE(p_active, tu.active)
		AND tu.area_id = COALESCE(p_area_id, tu.area_id)
		AND ts.state_id = COALESCE(p_state_id, ts.state_id)
		AND tc.country_id = COALESCE(p_country_id, tc.country_id);
end;
$$ language plpgsql;

TRUNCATE table_role;
TRUNCATE table_country;
TRUNCATE table_university;
TRUNCATE table_user;
TRUNCATE table_area;
TRUNCATE table_state;

ALTER SEQUENCE table_country_country_id_seq RESTART WITH 1;
ALTER SEQUENCE table_user_user_id_seq RESTART WITH 1;
ALTER SEQUENCE table_role_role_id_seq RESTART WITH 1;
ALTER SEQUENCE table_university_university_id_seq RESTART WITH 1;
ALTER SEQUENCE table_state_state_id_seq RESTART WITH 1;
ALTER SEQUENCE table_area_area_id_seq RESTART WITH 1;


INSERT INTO public.table_country 
(
	country_id,
	country_name,
	active,
	created_by,
	creation_date,
	last_updated_by,
	last_update_date
)
VALUES
(
	NEXTVAL('public.table_country_country_id_seq'),
	'Malaysia',
	'Y',
	1,
	NOW(),
	1,
	NOW()
);

INSERT INTO public.table_state
(
	state_id,
	state_name,
	country_id,
	active,
	created_by,
	creation_date,
	last_updated_by,
	last_update_date
)
VALUES
(
	NEXTVAL('table_state_state_id_seq'),
	'Kuala Lumpur',
	1,
	'Y',
	1,
	NOW(),
	1,
	NOW()
);

INSERT INTO public.table_state
(
	state_id,
	state_name,
	country_id,
	active,
	created_by,
	creation_date,
	last_updated_by,
	last_update_date
)
VALUES
(
	NEXTVAL('table_state_state_id_seq'),
	'Penang',
	1,
	'Y',
	1,
	NOW(),
	1,
	NOW()
);

INSERT INTO public.table_area
(
	area_id,
	area_name,
	state_id,
	active,
	created_by,
	creation_date,
	last_updated_by,
	last_update_date
)
VALUES
(
	NEXTVAL('table_area_area_id_seq'),
	'Genting Kelang',
	1,
	'Y',
	1,
	NOW(),
	1,
	NOW()
);

INSERT INTO public.table_area
(
	area_id,
	area_name,
	state_id,
	active,
	created_by,
	creation_date,
	last_updated_by,
	last_update_date
)
VALUES
(
	NEXTVAL('table_area_area_id_seq'),
	'Tanjung Bunga',
	2,
	'Y',
	1,
	NOW(),
	1,
	NOW()
);


INSERT INTO public.table_role
(
	role_id,
	role_name,
	role_description,
	active,
	created_by,
	creation_date,
	last_updated_by,
	last_update_date
)
VALUES
(
	NEXTVAL('table_role_role_id_seq'),
	'ADMIN',
    'Admin has the highest privilledge in performing any actions', 
    'Y', 
    '1',
	NOW(),
	1,
	NOW()
);

INSERT INTO public.table_role
(
	role_id,
	role_name,
	role_description,
	active,
	created_by,
	creation_date,
	last_updated_by,
	last_update_date
)
VALUES
(
	NEXTVAL('table_role_role_id_seq'),
	'STUDENT',
    'Student is the university student, who is the main user of this application', 
    'Y', 
    '1',
	NOW(),
	1,
	NOW()
);

INSERT INTO public.table_user
(
	user_id,
	gender,
	first_name,
	last_name,
	email_address,
	mobile_number,
	role_id,
	date_of_birth,
	password,
	activated_flag,
	race_country_id,
	profile_picture_url
)
VALUES
(
	NEXTVAL('table_user_user_id_seq'),
	'M',
	'YEE HOU',
	'GAN',
	't.rmor1992@gmail.com',
	'60124366452',
	(SELECT id FROM f_get_role('ADMIN', 'Y')),
	TO_DATE('19-07-1992', 'DD-MM-YYYY'),
	'$unisoul$',
	'N',
	(select id from f_get_country(p_country_id => NULL, p_country_name => 'Malaysia', p_active => 'Y')),
	'https://yt3.ggpht.com/a-/AOh14Ghn0Jtnzb5XlbAYA0p2MF_xnEQbdrRPKvTOb77KSSo=s100-c-k-c0xffffffff-no-rj-mo'
   );

INSERT INTO public.table_user
(
	user_id,
	gender,
	first_name,
	last_name,
	email_address,
	mobile_number,
	role_id,
	date_of_birth,
	password,
	activated_flag,
	race_country_id,
	profile_picture_url
)
VALUES
(
	NEXTVAL('table_user_user_id_seq'),
	'M',
	'PENG JIA',
	'ONG',
	'ongpengjia@gmail.com',
	'60194228350',
	(SELECT id FROM f_get_role('ADMIN', 'Y')),
	TO_DATE('13-09-1993', 'DD-MM-YYYY'),
	'$unisoul$',
	'N',
	(select id from f_get_country(p_country_id => NULL, p_country_name => 'Malaysia', p_active => 'Y')),
	'https://yt3.ggpht.com/a-/AOh14Ghn0Jtnzb5XlbAYA0p2MF_xnEQbdrRPKvTOb77KSSo=s100-c-k-c0xffffffff-no-rj-mo'
   );

INSERT INTO public.table_user
(
	user_id,
	gender,
	first_name,
	last_name,
	email_address,
	mobile_number,
	role_id,
	date_of_birth,
	password,
	activated_flag,
	race_country_id,
	profile_picture_url
)
VALUES
(
	NEXTVAL('table_user_user_id_seq'),
	'F',
	'XIN NI',
	'TAN',
	'xinni1231@gmail.com',
	'60164778901',
	(SELECT id FROM f_get_role('ADMIN', 'Y')),
	TO_DATE('31-12-1992', 'DD-MM-YYYY'),
	'$unisoul$',
	'N',
	(select id from f_get_country(p_country_id => NULL, p_country_name => 'Malaysia', p_active => 'Y')),
	'https://yt3.ggpht.com/a-/AOh14Ghn0Jtnzb5XlbAYA0p2MF_xnEQbdrRPKvTOb77KSSo=s100-c-k-c0xffffffff-no-rj-mo'
   );

INSERT INTO public.table_university
(
	university_id,
	university_name,
	area_id,
	email_prefix,
	active,
	created_by,
	creation_date,
	last_updated_by,
	last_update_date
)
VALUES
(
	NEXTVAL('public.table_university_university_id_seq'),
	'Tunku Abdul Rahman University College - Kuala Lumpur',
	1,
	'@tarc.edu.my',
	'Y',
	1,
	NOW(),
	1,
	NOW()
);

INSERT INTO public.table_university
(
	university_id,
	university_name,
	area_id,
	email_prefix,
	active,
	created_by,
	creation_date,
	last_updated_by,
	last_update_date
)
VALUES
(
	NEXTVAL('public.table_university_university_id_seq'),
	'Tunku Abdul Rahman University College - Penang',
	1,
	'@tarc.edu.my',
	'Y',
	1,
	NOW(),
	1,
	NOW()
);

							
