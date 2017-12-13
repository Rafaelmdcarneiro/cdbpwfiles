CREATE DATABASE pw
    WITH 
    OWNER = XXXXXXXXXXXXXX
    ENCODING = 'UTF8'
    LC_COLLATE = 'en_US.UTF-8'
    LC_CTYPE = 'en_US.UTF-8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

CREATE TABLE public.passwords
(
    password_id bigint NOT NULL DEFAULT nextval('passwords_password_id_seq'::regclass),
    password_username text COLLATE pg_catalog."C.UTF-8",
    password_password text COLLATE pg_catalog."default",
    CONSTRAINT passwords_pkey PRIMARY KEY (password_id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.passwords
    OWNER to XXXXXXXXXXXXXX;

-- Index: i_password

-- DROP INDEX public.i_password;

CREATE INDEX i_password
    ON public.passwords USING btree
    (password_password COLLATE pg_catalog."default" varchar_ops)
    TABLESPACE pg_default;

-- Index: i_username

-- DROP INDEX public.i_username;

CREATE INDEX i_username
    ON public.passwords USING btree
    (password_username COLLATE pg_catalog."C.UTF-8" bpchar_pattern_ops)
    TABLESPACE pg_default;

-- Index: u_up

-- DROP INDEX public.u_up;

CREATE UNIQUE INDEX u_up
    ON public.passwords USING btree
    (password_username COLLATE pg_catalog."C.UTF-8", password_password COLLATE pg_catalog."default")
    TABLESPACE pg_default;