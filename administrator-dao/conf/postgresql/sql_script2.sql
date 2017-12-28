-- Table: public.tariffgroup

-- DROP TABLE public.tariffgroup;

CREATE TABLE public.tariffgroup
(
  id integer NOT NULL DEFAULT nextval('tariffgroup_id_seq'::regclass),
  tariffgroupname character varying(45) NOT NULL,
  creationdate timestamp without time zone NOT NULL,
  CONSTRAINT idx_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.tariffgroup
  OWNER TO postgres;

-- Index: public.tariffgroupname_unique

-- DROP INDEX public.tariffgroupname_unique;

CREATE UNIQUE INDEX tariffgroupname_unique
  ON public.tariffgroup
  USING btree
  (tariffgroupname COLLATE pg_catalog."default" DESC NULLS LAST);