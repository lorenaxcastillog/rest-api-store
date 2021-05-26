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
-- Name: categories; Type: TABLE; Schema: public; Owner: lorena
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    name character varying(100)
);


ALTER TABLE public.categories OWNER TO lorena;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: lorena
--

CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO lorena;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lorena
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: lorena
--

CREATE TABLE public.products (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    code character varying(10) NOT NULL,
    price double precision NOT NULL,
    image character varying(100),
    enabled boolean
);


ALTER TABLE public.products OWNER TO lorena;

--
-- Name: products_categories; Type: TABLE; Schema: public; Owner: lorena
--

CREATE TABLE public.products_categories (
    id integer NOT NULL,
    id_product integer,
    id_category integer
);


ALTER TABLE public.products_categories OWNER TO lorena;

--
-- Name: products-categories_id_seq; Type: SEQUENCE; Schema: public; Owner: lorena
--

CREATE SEQUENCE public."products-categories_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."products-categories_id_seq" OWNER TO lorena;

--
-- Name: products-categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lorena
--

ALTER SEQUENCE public."products-categories_id_seq" OWNED BY public.products_categories.id;


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
-- Name: users; Type: TABLE; Schema: public; Owner: lorena
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    email character varying(300) NOT NULL,
    password character varying(300) NOT NULL,
    role character varying(50)
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
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: lorena
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: lorena
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: products_categories id; Type: DEFAULT; Schema: public; Owner: lorena
--

ALTER TABLE ONLY public.products_categories ALTER COLUMN id SET DEFAULT nextval('public."products-categories_id_seq"'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: lorena
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: lorena
--

COPY public.categories (id, name) FROM stdin;
1	candies
2	chocolates
3	lollipops
4	cookies
5	bubblegum
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: lorena
--

COPY public.products (id, name, code, price, image, enabled) FROM stdin;
1	bubblegum	BG01	0.5	\N	t
2	lollipop	LL01	0.5	\N	t
3	chocolate bar	CH01	1.2	\N	f
14	chocolate cookies	CH01	1.5	\N	t
16	chocolate cookies	CH01	1.5	\N	t
17	strawberry candy	CD01	0.2	\N	t
18	banana bubblegum	BG02	0.5	NULL	t
25	watermelon bubblegum	BG03	0.5	\N	t
27	blackberry bubblegum	BG03	0.5	\N	t
28	apple bubblegum	BG03	0.5	\N	f
29	white chocolate bar	CH03	1.7	\N	t
\.


--
-- Data for Name: products_categories; Type: TABLE DATA; Schema: public; Owner: lorena
--

COPY public.products_categories (id, id_product, id_category) FROM stdin;
1	1	5
2	2	3
3	3	2
4	14	4
6	16	4
7	17	1
8	18	5
10	25	5
12	27	5
13	28	5
14	29	2
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: lorena
--

COPY public.users (id, name, email, password, role) FROM stdin;
1	manager	admin@admin.com	$2a$08$m28.xggnTLOLNAo7z08tlOtwag5FfI7p8tXHjyAtTmJR51mjtsXCG	manager
2	client1	client1@client.com	$2a$08$m28.xggnTLOLNAo7z08tlOtwag5FfI7p8tXHjyAtTmJR51mjtsXCG	client
37	manager2	admin2@admin.com	$2a$08$4fFTSmkSMtdS9OJoJJEQUuuA.X.rIBG3FspUOdTU5KZCYtuom.bj2	manager
\.


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lorena
--

SELECT pg_catalog.setval('public.categories_id_seq', 5, true);


--
-- Name: products-categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lorena
--

SELECT pg_catalog.setval('public."products-categories_id_seq"', 14, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lorena
--

SELECT pg_catalog.setval('public.products_id_seq', 29, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lorena
--

SELECT pg_catalog.setval('public.users_id_seq', 37, true);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: lorena
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: products_categories products-categories_pkey; Type: CONSTRAINT; Schema: public; Owner: lorena
--

ALTER TABLE ONLY public.products_categories
    ADD CONSTRAINT "products-categories_pkey" PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: lorena
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: lorena
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: lorena
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: products_categories id_category; Type: FK CONSTRAINT; Schema: public; Owner: lorena
--

ALTER TABLE ONLY public.products_categories
    ADD CONSTRAINT id_category FOREIGN KEY (id_category) REFERENCES public.categories(id);


--
-- Name: products_categories id_product; Type: FK CONSTRAINT; Schema: public; Owner: lorena
--

ALTER TABLE ONLY public.products_categories
    ADD CONSTRAINT id_product FOREIGN KEY (id_product) REFERENCES public.products(id);


--
-- PostgreSQL database dump complete
--

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
-- Name: categories; Type: TABLE; Schema: public; Owner: lorena
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    name character varying(100)
);


ALTER TABLE public.categories OWNER TO lorena;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: lorena
--

CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO lorena;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lorena
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: lorena
--

CREATE TABLE public.products (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    code character varying(10) NOT NULL,
    price double precision NOT NULL,
    image character varying(100),
    enabled boolean
);


ALTER TABLE public.products OWNER TO lorena;

--
-- Name: products_categories; Type: TABLE; Schema: public; Owner: lorena
--

CREATE TABLE public.products_categories (
    id integer NOT NULL,
    id_product integer,
    id_category integer
);


ALTER TABLE public.products_categories OWNER TO lorena;

--
-- Name: products-categories_id_seq; Type: SEQUENCE; Schema: public; Owner: lorena
--

CREATE SEQUENCE public."products-categories_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."products-categories_id_seq" OWNER TO lorena;

--
-- Name: products-categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lorena
--

ALTER SEQUENCE public."products-categories_id_seq" OWNED BY public.products_categories.id;


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
-- Name: sessions; Type: TABLE; Schema: public; Owner: lorena
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    token text NOT NULL
);


ALTER TABLE public.sessions OWNER TO lorena;

--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: lorena
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sessions_id_seq OWNER TO lorena;

--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lorena
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: lorena
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    email character varying(300) NOT NULL,
    password character varying(300) NOT NULL,
    role character varying(50)
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
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: lorena
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: lorena
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: products_categories id; Type: DEFAULT; Schema: public; Owner: lorena
--

ALTER TABLE ONLY public.products_categories ALTER COLUMN id SET DEFAULT nextval('public."products-categories_id_seq"'::regclass);


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: lorena
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: lorena
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: lorena
--

COPY public.categories (id, name) FROM stdin;
1	candies
2	chocolates
3	lollipops
4	cookies
5	bubblegum
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: lorena
--

COPY public.products (id, name, code, price, image, enabled) FROM stdin;
1	bubblegum	BG01	0.5	\N	t
2	lollipop	LL01	0.5	\N	t
3	chocolate bar	CH01	1.2	\N	f
14	chocolate cookies	CH01	1.5	\N	t
16	chocolate cookies	CH01	1.5	\N	t
17	strawberry candy	CD01	0.2	\N	t
18	banana bubblegum	BG02	0.5	NULL	t
25	watermelon bubblegum	BG03	0.5	\N	t
27	blackberry bubblegum	BG03	0.5	\N	t
28	apple bubblegum	BG03	0.5	\N	f
29	white chocolate bar	CH03	1.7	\N	t
30	white chocolate bar	CH03	1.5	\N	t
\.


--
-- Data for Name: products_categories; Type: TABLE DATA; Schema: public; Owner: lorena
--

COPY public.products_categories (id, id_product, id_category) FROM stdin;
1	1	5
2	2	3
3	3	2
4	14	4
6	16	4
7	17	1
8	18	5
10	25	5
12	27	5
13	28	5
14	29	2
15	30	5
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: lorena
--

COPY public.sessions (id, token) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: lorena
--

COPY public.users (id, name, email, password, role) FROM stdin;
1	manager	admin@admin.com	$2a$08$m28.xggnTLOLNAo7z08tlOtwag5FfI7p8tXHjyAtTmJR51mjtsXCG	manager
2	client1	client1@client.com	$2a$08$m28.xggnTLOLNAo7z08tlOtwag5FfI7p8tXHjyAtTmJR51mjtsXCG	client
37	manager2	admin2@admin.com	$2a$08$4fFTSmkSMtdS9OJoJJEQUuuA.X.rIBG3FspUOdTU5KZCYtuom.bj2	manager
38	client2	client2@client.com	$2a$08$aIFW0PzT4zgM9RcIb/gOqummBb9HpzLmdW4GpFXkKraD0sVAjnO.6	\N
\.


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lorena
--

SELECT pg_catalog.setval('public.categories_id_seq', 5, true);


--
-- Name: products-categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lorena
--

SELECT pg_catalog.setval('public."products-categories_id_seq"', 15, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lorena
--

SELECT pg_catalog.setval('public.products_id_seq', 30, true);


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lorena
--

SELECT pg_catalog.setval('public.sessions_id_seq', 12, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lorena
--

SELECT pg_catalog.setval('public.users_id_seq', 44, true);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: lorena
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: products_categories products-categories_pkey; Type: CONSTRAINT; Schema: public; Owner: lorena
--

ALTER TABLE ONLY public.products_categories
    ADD CONSTRAINT "products-categories_pkey" PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: lorena
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: lorena
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_token_key; Type: CONSTRAINT; Schema: public; Owner: lorena
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_token_key UNIQUE (token);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: lorena
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: lorena
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: products_categories id_category; Type: FK CONSTRAINT; Schema: public; Owner: lorena
--

ALTER TABLE ONLY public.products_categories
    ADD CONSTRAINT id_category FOREIGN KEY (id_category) REFERENCES public.categories(id);


--
-- Name: products_categories id_product; Type: FK CONSTRAINT; Schema: public; Owner: lorena
--

ALTER TABLE ONLY public.products_categories
    ADD CONSTRAINT id_product FOREIGN KEY (id_product) REFERENCES public.products(id);


--
-- PostgreSQL database dump complete
--

