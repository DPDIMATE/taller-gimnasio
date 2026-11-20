--
-- PostgreSQL database dump
--

\restrict IhzpE5QnAsv0vpTBjcYQ5nLmhVhL7tX2CdLa0IU1BgdG5tnMszRxnnJ4aU791kt

-- Dumped from database version 18.6
-- Dumped by pg_dump version 18.6

-- Started on 2026-11-19 18:21:50

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 228 (class 1259 OID 16610)
-- Name: clases; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clases (
    id_clase integer NOT NULL,
    id_entrenador integer NOT NULL,
    nombre character varying(100) NOT NULL,
    dia_semana character varying(20) NOT NULL,
    hora time without time zone NOT NULL,
    cupo integer NOT NULL,
    estado character varying(20) DEFAULT 'activa'::character varying NOT NULL,
    CONSTRAINT chk_estado_clase CHECK (((estado)::text = ANY ((ARRAY['activa'::character varying, 'suspendida'::character varying])::text[])))
);


ALTER TABLE public.clases OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16609)
-- Name: clases_id_clase_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clases_id_clase_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.clases_id_clase_seq OWNER TO postgres;

--
-- TOC entry 4990 (class 0 OID 0)
-- Dependencies: 227
-- Name: clases_id_clase_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clases_id_clase_seq OWNED BY public.clases.id_clase;


--
-- TOC entry 226 (class 1259 OID 16599)
-- Name: entrenadores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.entrenadores (
    id_entrenador integer NOT NULL,
    nombre character varying(100) NOT NULL,
    especialidad character varying(100),
    correo character varying(100)
);


ALTER TABLE public.entrenadores OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16598)
-- Name: entrenadores_id_entrenador_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.entrenadores_id_entrenador_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.entrenadores_id_entrenador_seq OWNER TO postgres;

--
-- TOC entry 4991 (class 0 OID 0)
-- Dependencies: 225
-- Name: entrenadores_id_entrenador_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.entrenadores_id_entrenador_seq OWNED BY public.entrenadores.id_entrenador;


--
-- TOC entry 220 (class 1259 OID 16554)
-- Name: fichas_medicas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fichas_medicas (
    documento_socio character varying(20) NOT NULL,
    peso numeric(5,2),
    estatura numeric(3,2),
    lesiones character varying(255)
);


ALTER TABLE public.fichas_medicas OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16627)
-- Name: inscripciones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inscripciones (
    documento_socio character varying(20) NOT NULL,
    id_clase integer NOT NULL,
    fecha_inscripcion date NOT NULL
);


ALTER TABLE public.inscripciones OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16577)
-- Name: membresias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.membresias (
    id_membresia integer NOT NULL,
    documento_socio character varying(20) NOT NULL,
    id_plan integer NOT NULL,
    fecha_inicio date NOT NULL,
    fecha_fin date NOT NULL,
    valor_pagado numeric(10,2) NOT NULL,
    CONSTRAINT membresias_fecha_inicio_fecha_fin_check CHECK ((fecha_fin > fecha_inicio)),
    CONSTRAINT membresias_valor_pagado_check CHECK ((valor_pagado > (0)::numeric))
);


ALTER TABLE public.membresias OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16576)
-- Name: membresias_id_membresia_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.membresias_id_membresia_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.membresias_id_membresia_seq OWNER TO postgres;

--
-- TOC entry 4992 (class 0 OID 0)
-- Dependencies: 223
-- Name: membresias_id_membresia_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.membresias_id_membresia_seq OWNED BY public.membresias.id_membresia;


--
-- TOC entry 231 (class 1259 OID 16806)
-- Name: ocupacion_clases; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.ocupacion_clases AS
 SELECT c.id_clase,
    c.nombre AS clase,
    c.dia_semana,
    c.hora,
    c.cupo,
    count(i.documento_socio) AS inscritos
   FROM (public.clases c
     LEFT JOIN public.inscripciones i ON ((c.id_clase = i.id_clase)))
  WHERE ((c.estado)::text = 'activa'::text)
  GROUP BY c.id_clase, c.nombre, c.dia_semana, c.hora, c.cupo;


ALTER VIEW public.ocupacion_clases OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16566)
-- Name: planes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.planes (
    id_plan integer NOT NULL,
    nombre character varying(80) NOT NULL,
    duracion_meses integer NOT NULL,
    precio numeric(10,2) NOT NULL
);


ALTER TABLE public.planes OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16565)
-- Name: planes_id_plan_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.planes_id_plan_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.planes_id_plan_seq OWNER TO postgres;

--
-- TOC entry 4993 (class 0 OID 0)
-- Dependencies: 221
-- Name: planes_id_plan_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.planes_id_plan_seq OWNED BY public.planes.id_plan;


--
-- TOC entry 219 (class 1259 OID 16545)
-- Name: socios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.socios (
    documento character varying(20) NOT NULL,
    nombre character varying(100) NOT NULL,
    telefono character varying(20),
    correo character varying(100),
    acepta_whatsapp character varying(2) DEFAULT 'no'::character varying NOT NULL
);


ALTER TABLE public.socios OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 16801)
-- Name: socios_vencidos; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.socios_vencidos AS
 SELECT s.documento,
    s.nombre AS socio,
    s.telefono,
    s.acepta_whatsapp,
    max(m.fecha_fin) AS fecha_vencimiento
   FROM (public.socios s
     JOIN public.membresias m ON (((s.documento)::text = (m.documento_socio)::text)))
  GROUP BY s.documento, s.nombre, s.telefono, s.acepta_whatsapp
 HAVING (max(m.fecha_fin) < CURRENT_DATE);


ALTER VIEW public.socios_vencidos OWNER TO postgres;

--
-- TOC entry 4794 (class 2604 OID 16613)
-- Name: clases id_clase; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clases ALTER COLUMN id_clase SET DEFAULT nextval('public.clases_id_clase_seq'::regclass);


--
-- TOC entry 4793 (class 2604 OID 16602)
-- Name: entrenadores id_entrenador; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entrenadores ALTER COLUMN id_entrenador SET DEFAULT nextval('public.entrenadores_id_entrenador_seq'::regclass);


--
-- TOC entry 4792 (class 2604 OID 16580)
-- Name: membresias id_membresia; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.membresias ALTER COLUMN id_membresia SET DEFAULT nextval('public.membresias_id_membresia_seq'::regclass);


--
-- TOC entry 4791 (class 2604 OID 16569)
-- Name: planes id_plan; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planes ALTER COLUMN id_plan SET DEFAULT nextval('public.planes_id_plan_seq'::regclass);


--
-- TOC entry 4983 (class 0 OID 16610)
-- Dependencies: 228
-- Data for Name: clases; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clases (id_clase, id_entrenador, nombre, dia_semana, hora, cupo, estado) FROM stdin;
2	2	Musculacion	Martes	10:00:00	20	activa
4	2	Entrenamiento funcional	Viernes	18:00:00	12	activa
1	1	Yoga	Lunes	08:00:00	3	activa
3	2	Spinning	Miercoles	17:00:00	10	suspendida
15	1	Pilates	Viernes	18:00:00	12	activa
\.


--
-- TOC entry 4981 (class 0 OID 16599)
-- Dependencies: 226
-- Data for Name: entrenadores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.entrenadores (id_entrenador, nombre, especialidad, correo) FROM stdin;
1	Andres Perez	Musculacion	andres@gmail.com
2	Sofia Morales	Yoga	sofia@gmail.com
3	David Castro	Entrenamiento funcional	david@gmail.com
\.


--
-- TOC entry 4975 (class 0 OID 16554)
-- Dependencies: 220
-- Data for Name: fichas_medicas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fichas_medicas (documento_socio, peso, estatura, lesiones) FROM stdin;
1001	65.50	1.63	Ninguna
1002	78.00	1.75	Lesion de rodilla
1003	59.20	1.60	Ninguna
1004	82.30	1.80	Dolor de espalda
\.


--
-- TOC entry 4984 (class 0 OID 16627)
-- Dependencies: 229
-- Data for Name: inscripciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inscripciones (documento_socio, id_clase, fecha_inscripcion) FROM stdin;
1001	1	2026-10-01
1001	2	2026-10-02
1002	1	2026-10-03
1002	3	2026-10-04
1003	2	2026-10-05
1003	4	2026-10-06
1004	1	2026-10-07
1004	3	2026-10-08
1005	2	2026-10-09
1005	4	2026-10-10
1007	2	2026-11-19
1008	2	2026-11-19
1007	4	2026-11-19
1001	4	2026-11-19
\.


--
-- TOC entry 4979 (class 0 OID 16577)
-- Dependencies: 224
-- Data for Name: membresias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.membresias (id_membresia, documento_socio, id_plan, fecha_inicio, fecha_fin, valor_pagado) FROM stdin;
1	1001	1	2025-01-01	2025-02-01	80000.00
2	1001	2	2025-02-02	2025-05-02	200000.00
3	1001	3	2026-10-01	2027-04-01	390000.00
4	1002	1	2026-11-01	2026-12-01	80000.00
5	1003	2	2026-09-01	2026-12-01	210000.00
6	1004	1	2026-10-15	2026-11-15	75000.00
7	1005	3	2026-08-01	2027-02-01	390000.00
8	1006	1	2026-11-10	2026-12-10	80000.00
17	1007	1	2026-11-01	2026-12-01	75000.00
18	1007	2	2026-11-10	2027-02-10	195000.00
19	1007	3	2026-12-01	2027-06-01	390000.00
20	1008	1	2026-10-01	2026-11-01	80000.00
21	1002	2	2026-11-03	2027-02-03	210000.00
22	1006	1	2026-11-15	2026-12-15	80000.00
\.


--
-- TOC entry 4977 (class 0 OID 16566)
-- Dependencies: 222
-- Data for Name: planes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.planes (id_plan, nombre, duracion_meses, precio) FROM stdin;
1	Mensual	1	80000.00
2	Trimestral	3	210000.00
3	Semestral	6	390000.00
\.


--
-- TOC entry 4974 (class 0 OID 16545)
-- Dependencies: 219
-- Data for Name: socios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.socios (documento, nombre, telefono, correo, acepta_whatsapp) FROM stdin;
1002	Carlos Ramirez	5551002	carlos@gmail.com	no
1004	Pedro Gomez	5551004	pedro@gmail.com	no
1006	Juan Herrera	5551006	juan@gmail.com	no
1001	Laura Martinez	5559999	laura@gmail.com	si
1003	Ana Torres	5551003	\N	si
1005	Maria Lopez	5551005	maria@gmail.com	si
1007	Sofia Ramirez	3001001007	\N	si
1008	Miguel Torres	3001001008	miguel@gmail.com	no
\.


--
-- TOC entry 4994 (class 0 OID 0)
-- Dependencies: 227
-- Name: clases_id_clase_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clases_id_clase_seq', 15, true);


--
-- TOC entry 4995 (class 0 OID 0)
-- Dependencies: 225
-- Name: entrenadores_id_entrenador_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.entrenadores_id_entrenador_seq', 3, true);


--
-- TOC entry 4996 (class 0 OID 0)
-- Dependencies: 223
-- Name: membresias_id_membresia_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.membresias_id_membresia_seq', 22, true);


--
-- TOC entry 4997 (class 0 OID 0)
-- Dependencies: 221
-- Name: planes_id_plan_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.planes_id_plan_seq', 3, true);


--
-- TOC entry 4814 (class 2606 OID 16780)
-- Name: clases clases_id_entrenador_dia_semana_hora_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clases
    ADD CONSTRAINT clases_id_entrenador_dia_semana_hora_key UNIQUE (id_entrenador, dia_semana, hora);


--
-- TOC entry 4816 (class 2606 OID 16621)
-- Name: clases clases_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clases
    ADD CONSTRAINT clases_pkey PRIMARY KEY (id_clase);


--
-- TOC entry 4810 (class 2606 OID 16608)
-- Name: entrenadores entrenadores_correo_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entrenadores
    ADD CONSTRAINT entrenadores_correo_key UNIQUE (correo);


--
-- TOC entry 4812 (class 2606 OID 16606)
-- Name: entrenadores entrenadores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entrenadores
    ADD CONSTRAINT entrenadores_pkey PRIMARY KEY (id_entrenador);


--
-- TOC entry 4804 (class 2606 OID 16559)
-- Name: fichas_medicas fichas_medicas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fichas_medicas
    ADD CONSTRAINT fichas_medicas_pkey PRIMARY KEY (documento_socio);


--
-- TOC entry 4818 (class 2606 OID 16634)
-- Name: inscripciones inscripciones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripciones
    ADD CONSTRAINT inscripciones_pkey PRIMARY KEY (documento_socio, id_clase);


--
-- TOC entry 4808 (class 2606 OID 16587)
-- Name: membresias membresias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.membresias
    ADD CONSTRAINT membresias_pkey PRIMARY KEY (id_membresia);


--
-- TOC entry 4806 (class 2606 OID 16575)
-- Name: planes planes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planes
    ADD CONSTRAINT planes_pkey PRIMARY KEY (id_plan);


--
-- TOC entry 4800 (class 2606 OID 16553)
-- Name: socios socios_correo_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socios
    ADD CONSTRAINT socios_correo_key UNIQUE (correo);


--
-- TOC entry 4802 (class 2606 OID 16551)
-- Name: socios socios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socios
    ADD CONSTRAINT socios_pkey PRIMARY KEY (documento);


--
-- TOC entry 4822 (class 2606 OID 16622)
-- Name: clases clases_id_entrenador_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clases
    ADD CONSTRAINT clases_id_entrenador_fkey FOREIGN KEY (id_entrenador) REFERENCES public.entrenadores(id_entrenador);


--
-- TOC entry 4819 (class 2606 OID 16791)
-- Name: fichas_medicas fichas_medicas_documento_socio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fichas_medicas
    ADD CONSTRAINT fichas_medicas_documento_socio_fkey FOREIGN KEY (documento_socio) REFERENCES public.socios(documento) ON DELETE CASCADE;


--
-- TOC entry 4823 (class 2606 OID 16796)
-- Name: inscripciones inscripciones_documento_socio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripciones
    ADD CONSTRAINT inscripciones_documento_socio_fkey FOREIGN KEY (documento_socio) REFERENCES public.socios(documento) ON DELETE CASCADE;


--
-- TOC entry 4824 (class 2606 OID 16640)
-- Name: inscripciones inscripciones_id_clase_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripciones
    ADD CONSTRAINT inscripciones_id_clase_fkey FOREIGN KEY (id_clase) REFERENCES public.clases(id_clase);


--
-- TOC entry 4820 (class 2606 OID 16588)
-- Name: membresias membresias_documento_socio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.membresias
    ADD CONSTRAINT membresias_documento_socio_fkey FOREIGN KEY (documento_socio) REFERENCES public.socios(documento);


--
-- TOC entry 4821 (class 2606 OID 16593)
-- Name: membresias membresias_id_plan_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.membresias
    ADD CONSTRAINT membresias_id_plan_fkey FOREIGN KEY (id_plan) REFERENCES public.planes(id_plan);


-- Completed on 2026-11-19 18:21:50

--
-- PostgreSQL database dump complete
--

\unrestrict IhzpE5QnAsv0vpTBjcYQ5nLmhVhL7tX2CdLa0IU1BgdG5tnMszRxnnJ4aU791kt

