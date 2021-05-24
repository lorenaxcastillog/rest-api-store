--
-- PostgreSQL database dump
--

-- Dumped from database version 13.3
-- Dumped by pg_dump version 13.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
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
-- Name: products; Type: TABLE; Schema: public; Owner: lorena
--

CREATE TABLE public.products (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    code character varying(10) NOT NULL,
    price double precision NOT NULL,
    image character varying(100),
    category character varying(200),
    enabled boolean
);


ALTER TABLE public.products OWNER TO lorena;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: lorena
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_id_seq OWNER TO lorena;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lorena
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: lorena
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    role character varying(20) NOT NULL
);


ALTER TABLE public.roles OWNER TO lorena;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: lorena
--

CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO lorena;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lorena
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: lorena
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    email character varying(300) NOT NULL,
    password character varying(300) NOT NULL
);


ALTER TABLE public.users OWNER TO lorena;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: lorena
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO lorena;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lorena
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: lorena
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: lorena
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: lorena
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: lorena
--

COPY public.products (id, name, code, price, image, category, enabled) FROM stdin;
1	bubblegum	BG01	0.5	\N	candies	t
2	lollipop	LL01	0.5	\N	candies and lollipops	t
3	chocolate bar	CH01	1.2	\N	chocolates	f
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: lorena
--

COPY public.roles (id, role) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: lorena
--

COPY public.users (id, name, email, password) FROM stdin;
1	manager	admin@admin.com	123456
2	client1	client1@client.com	654321
10	client2	client2@client.com	654321
\.


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lorena
--

SELECT pg_catalog.setval('public.products_id_seq', 3, true);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lorena
--

SELECT pg_catalog.setval('public.roles_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lorena
--

SELECT pg_catalog.setval('public.users_id_seq', 10, true);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: lorena
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: lorena
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: lorena
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

