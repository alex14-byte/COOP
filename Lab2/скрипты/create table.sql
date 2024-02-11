BEGIN;

create type role AS ENUM ('ADMIN', 'MANAGER', 'OWNER', 'RENTER', 'BLANK');

CREATE SEQUENCE IF NOT EXISTS public.address_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

CREATE SEQUENCE IF NOT EXISTS public.flat_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

CREATE SEQUENCE IF NOT EXISTS public.meter_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

CREATE SEQUENCE IF NOT EXISTS public.resource_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;


CREATE SEQUENCE IF NOT EXISTS public.provider_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

CREATE SEQUENCE IF NOT EXISTS public.tsj_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

CREATE SEQUENCE IF NOT EXISTS public.user_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

CREATE SEQUENCE IF NOT EXISTS public.value_history_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

CREATE TABLE IF NOT EXISTS public.address
(
    id bigint NOT NULL DEFAULT nextval('address_id_seq'::regclass),
    city text COLLATE pg_catalog."default" NOT NULL,
    street text COLLATE pg_catalog."default" NOT NULL,
    house_number bigint NOT NULL,
    tsj_id bigint NOT NULL,
    CONSTRAINT address_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.flat
(
    id bigint NOT NULL DEFAULT nextval('flat_id_seq'::regclass),
    "number" bigint NOT NULL,
    address_id bigint NOT NULL,
    CONSTRAINT flat_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.meter
(
    id bigint NOT NULL DEFAULT nextval('meter_id_seq'::regclass),
    serial_number text COLLATE pg_catalog."default",
    resource_id bigint NOT NULL,
    installation_date date NOT NULL,
    flat_id bigint NOT NULL,
    CONSTRAINT meter_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.provider
(
    id bigint NOT NULL DEFAULT nextval('provider_id_seq'::regclass),
    name text COLLATE pg_catalog."default" NOT NULL,
    contact text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT provider_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.resource
(
    id bigint NOT NULL DEFAULT nextval('resource_id_seq'::regclass),
    name text COLLATE pg_catalog."default" NOT NULL,
    price double precision NOT NULL,
    provider_id bigint NOT NULL,
    CONSTRAINT resource_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.tsj
(
    id bigint NOT NULL DEFAULT nextval('tsj_id_seq'::regclass),
    name text COLLATE pg_catalog."default" NOT NULL,
    manager_id bigint NOT NULL,
    CONSTRAINT tsj_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public."user"
(
    id bigint NOT NULL DEFAULT nextval('user_id_seq'::regclass),
    login text COLLATE pg_catalog."default",
    password text COLLATE pg_catalog."default" NOT NULL,
    first_name text COLLATE pg_catalog."default" NOT NULL,
    last_name text COLLATE pg_catalog."default" NOT NULL,
    surname text COLLATE pg_catalog."default",
    phone_number text COLLATE pg_catalog."default" NOT NULL,
    is_admin boolean NOT NULL DEFAULT false,
    CONSTRAINT user_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.value_history
(
    id bigint NOT NULL DEFAULT nextval('value_history_id_seq'::regclass),
    value text COLLATE pg_catalog."default" NOT NULL,
    meter_id bigint NOT NULL,
    cost double precision,
    CONSTRAINT value_history_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.user_in_flat
(
    user_id bigint NOT NULL,
    flat_id bigint NOT NULL,
    role role NOT NULL,
    PRIMARY KEY (user_id, flat_id)
);

ALTER TABLE IF EXISTS public.address
    ADD CONSTRAINT tsj_id FOREIGN KEY (tsj_id)
        REFERENCES public.tsj (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID;


ALTER TABLE IF EXISTS public.flat
    ADD CONSTRAINT address_id FOREIGN KEY (address_id)
        REFERENCES public.address (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID;


ALTER TABLE IF EXISTS public.meter
    ADD CONSTRAINT flat_id FOREIGN KEY (flat_id)
        REFERENCES public.flat (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID;


ALTER TABLE IF EXISTS public.meter
    ADD CONSTRAINT resource_id FOREIGN KEY (resource_id)
        REFERENCES public.resource (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID;


ALTER TABLE IF EXISTS public.resource
    ADD CONSTRAINT provider_id FOREIGN KEY (provider_id)
        REFERENCES public.provider (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID;


ALTER TABLE IF EXISTS public.tsj
    ADD CONSTRAINT manager_id FOREIGN KEY (manager_id)
        REFERENCES public."user" (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID;


ALTER TABLE IF EXISTS public.value_history
    ADD CONSTRAINT meter_id FOREIGN KEY (meter_id)
        REFERENCES public.meter (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID;


ALTER TABLE IF EXISTS public.user_in_flat
    ADD CONSTRAINT user_id FOREIGN KEY (user_id)
        REFERENCES public."user" (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID;


ALTER TABLE IF EXISTS public.user_in_flat
    ADD CONSTRAINT flat_id FOREIGN KEY (flat_id)
        REFERENCES public.flat (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID;

END;