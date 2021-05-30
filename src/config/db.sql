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
-- Name: order_details; Type: TABLE; Schema: public; Owner: lorena
--

CREATE TABLE public.order_details (
    id integer NOT NULL,
    id_order integer,
    id_product integer,
    quantity integer,
    price double precision
);


ALTER TABLE public.order_details OWNER TO lorena;

--
-- Name: order_details_id_seq; Type: SEQUENCE; Schema: public; Owner: lorena
--

CREATE SEQUENCE public.order_details_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_details_id_seq OWNER TO lorena;

--
-- Name: order_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lorena
--

ALTER SEQUENCE public.order_details_id_seq OWNED BY public.order_details.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: lorena
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    id_user integer,
    date timestamp without time zone,
    total double precision
);


ALTER TABLE public.orders OWNER TO lorena;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: lorena
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO lorena;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lorena
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: lorena
--

CREATE TABLE public.products (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    price double precision NOT NULL,
    image character varying(100),
    enabled boolean,
    stock integer
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
-- Name: order_details id; Type: DEFAULT; Schema: public; Owner: lorena
--

ALTER TABLE ONLY public.order_details ALTER COLUMN id SET DEFAULT nextval('public.order_details_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: lorena
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


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
-- Data for Name: order_details; Type: TABLE DATA; Schema: public; Owner: lorena
--

COPY public.order_details (id, id_order, id_product, quantity, price) FROM stdin;
43	28	1	9	0.5
44	28	28	1	0.5
45	28	25	1	0.5
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: lorena
--

COPY public.orders (id, id_user, date, total) FROM stdin;
28	37	2021-05-27 11:35:45.627	1.5
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: lorena
--

COPY public.products (id, name, price, image, enabled, stock) FROM stdin;
30	white chocolate bar	1.7	\N	f	10
14	chocolate cookies	1.5	\N	t	10
16	chocolate cookies	1.5	\N	t	10
17	strawberry candy	0.2	\N	t	10
18	banana bubblegum	0.5	NULL	t	10
27	blackberry bubblegum	0.5	\N	t	10
29	white chocolate bar	1.7	\N	t	10
3	chocolate bar	1.2	\N	f	30
2	lollipop	0.5	\N	t	10
1	bubblegum	0.5	\N	t	1
28	apple bubblegum	0.5	\N	f	9
25	watermelon bubblegum	0.5	\N	t	9
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
13	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6eyJpZCI6MzcsIm5hbWUiOiJtYW5hZ2VyMiIsImVtYWlsIjoiYWRtaW4yQGFkbWluLmNvbSIsInBhc3N3b3JkIjoiJDJhJDA4JDRmRlRTbWtTTXRkUzlPSm9KSkVRVXV1QS5YLnJJQkczRnNwVU9kVFU1S1pDWXR1b20uYmoyIiwicm9sZSI6Im1hbmFnZXIifSwiaWF0IjoxNjIyMDUwODg3LCJleHAiOjE2MjI2NTU2ODd9.NJrC6_ZhxaBwG07NgJJWTUH4r8OL6kPd0GMdXko00vs
14	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6eyJpZCI6MzcsIm5hbWUiOiJtYW5hZ2VyMiIsImVtYWlsIjoiYWRtaW4yQGFkbWluLmNvbSIsInBhc3N3b3JkIjoiJDJhJDA4JDRmRlRTbWtTTXRkUzlPSm9KSkVRVXV1QS5YLnJJQkczRnNwVU9kVFU1S1pDWXR1b20uYmoyIiwicm9sZSI6Im1hbmFnZXIifSwiaWF0IjoxNjIyMDcwMzEwLCJleHAiOjE2MjI2NzUxMTB9.juAHfcxKApNKRThGvOvnvixrLd8fcnfts2TWW18SvJA
15	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6eyJsZW5ndGgiOjIxMCwibmFtZSI6ImVycm9yIiwic2V2ZXJpdHkiOiJFUlJPUiIsImNvZGUiOiIyMzUwNSIsImRldGFpbCI6IktleSAoZW1haWwpPShjbGllbnQyQGNsaWVudC5jb20pIGFscmVhZHkgZXhpc3RzLiIsInNjaGVtYSI6InB1YmxpYyIsInRhYmxlIjoidXNlcnMiLCJjb25zdHJhaW50IjoidXNlcnNfZW1haWxfa2V5IiwiZmlsZSI6Im5idGluc2VydC5jIiwibGluZSI6IjY1NiIsInJvdXRpbmUiOiJfYnRfY2hlY2tfdW5pcXVlIn0sImlhdCI6MTYyMjA3MDM4NywiZXhwIjoxNjIyNjc1MTg3fQ.N5MGq2vJODIOZ7sxyLo618yca1bOeD8oU5WYSFyv59Q
16	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6bnVsbCwiaWF0IjoxNjIyMDcwNDA3LCJleHAiOjE2MjI2NzUyMDd9.PmgiAAuZ5zv1mNHtnO4yFTKOsfFLPYZc8EMQ2F6ugqE
17	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6bnVsbCwiaWF0IjoxNjIyMDcwNTA5LCJleHAiOjE2MjI2NzUzMDl9.uVyRTulms8imOaQKjQiqaHDkSJZpVTXct-Vd5w9QpCg
18	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6bnVsbCwiaWF0IjoxNjIyMDcwNjA4LCJleHAiOjE2MjI2NzU0MDh9.IMWknvCTFKvr5MquMqbse4dfzNU4dtXTABCKM2Czu5A
19	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6bnVsbCwiaWF0IjoxNjIyMDcwNjgyLCJleHAiOjE2MjI2NzU0ODJ9.m48TkFj-2K9wS6OtsZhx56naOPBp22JVCl5G-odbGwA
20	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6eyJsZW5ndGgiOjIxMCwibmFtZSI6ImVycm9yIiwic2V2ZXJpdHkiOiJFUlJPUiIsImNvZGUiOiIyMzUwNSIsImRldGFpbCI6IktleSAoZW1haWwpPShjbGllbnQzQGNsaWVudC5jb20pIGFscmVhZHkgZXhpc3RzLiIsInNjaGVtYSI6InB1YmxpYyIsInRhYmxlIjoidXNlcnMiLCJjb25zdHJhaW50IjoidXNlcnNfZW1haWxfa2V5IiwiZmlsZSI6Im5idGluc2VydC5jIiwibGluZSI6IjY1NiIsInJvdXRpbmUiOiJfYnRfY2hlY2tfdW5pcXVlIn0sImlhdCI6MTYyMjA3MTA2MywiZXhwIjoxNjIyNjc1ODYzfQ.IeMRY3saBx_0yc-58RvuIYyq7Jg-4IiMkmBbb-Cl9Zo
21	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6bnVsbCwiaWF0IjoxNjIyMDcxMDc3LCJleHAiOjE2MjI2NzU4Nzd9.lKFrNrt4A-znQB3dJvBmMcZC530zQ9o3OChwddUJQ54
22	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NTMsImlhdCI6MTYyMjA3MTI3NiwiZXhwIjoxNjIyNjc2MDc2fQ.wv9T5-fF1Fssu0GFIYcZ3sjp1mnjNW6av1fQ0rUXo_g
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: lorena
--

COPY public.users (id, name, email, password, role) FROM stdin;
38	client2	client2@client.com	$2a$08$aIFW0PzT4zgM9RcIb/gOqummBb9HpzLmdW4GpFXkKraD0sVAjnO.6	client
53	client3	client3@client.com	$2a$08$Lup0BwXfWSP0GfNCtpv6FOd.XllRbP/xHHlqo2zAfEIyWdQPDV9AK	client
1	manager	admin@admin.com	$2a$08$m28.xggnTLOLNAo7z08tlOtwag5FfI7p8tXHjyAtTmJR51mjtsXCG	manager
2	client1	client1@client.com	$2a$08$m28.xggnTLOLNAo7z08tlOtwag5FfI7p8tXHjyAtTmJR51mjtsXCG	client
37	manager2	admin2@admin.com	$2a$08$4fFTSmkSMtdS9OJoJJEQUuuA.X.rIBG3FspUOdTU5KZCYtuom.bj2	manager
\.


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lorena
--

SELECT pg_catalog.setval('public.categories_id_seq', 5, true);


--
-- Name: order_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lorena
--

SELECT pg_catalog.setval('public.order_details_id_seq', 45, true);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lorena
--

SELECT pg_catalog.setval('public.orders_id_seq', 28, true);


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

SELECT pg_catalog.setval('public.sessions_id_seq', 22, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lorena
--

SELECT pg_catalog.setval('public.users_id_seq', 54, true);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: lorena
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: order_details order_details_pkey; Type: CONSTRAINT; Schema: public; Owner: lorena
--

ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT order_details_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: lorena
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


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
-- Name: order_details id_order; Type: FK CONSTRAINT; Schema: public; Owner: lorena
--

ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT id_order FOREIGN KEY (id_order) REFERENCES public.orders(id);


--
-- Name: products_categories id_product; Type: FK CONSTRAINT; Schema: public; Owner: lorena
--

ALTER TABLE ONLY public.products_categories
    ADD CONSTRAINT id_product FOREIGN KEY (id_product) REFERENCES public.products(id);


--
-- Name: order_details id_product; Type: FK CONSTRAINT; Schema: public; Owner: lorena
--

ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT id_product FOREIGN KEY (id_product) REFERENCES public.products(id);


--
-- Name: orders id_user; Type: FK CONSTRAINT; Schema: public; Owner: lorena
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT id_user FOREIGN KEY (id_user) REFERENCES public.users(id);


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
-- Name: likes_users_products; Type: TABLE; Schema: public; Owner: lorena
--

CREATE TABLE public.likes_users_products (
    id integer NOT NULL,
    id_user integer,
    id_product integer,
    likes boolean DEFAULT false NOT NULL
);


ALTER TABLE public.likes_users_products OWNER TO lorena;

--
-- Name: likes_users_products_id_seq; Type: SEQUENCE; Schema: public; Owner: lorena
--

CREATE SEQUENCE public.likes_users_products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.likes_users_products_id_seq OWNER TO lorena;

--
-- Name: likes_users_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lorena
--

ALTER SEQUENCE public.likes_users_products_id_seq OWNED BY public.likes_users_products.id;


--
-- Name: order_details; Type: TABLE; Schema: public; Owner: lorena
--

CREATE TABLE public.order_details (
    id integer NOT NULL,
    id_order integer,
    id_product integer,
    quantity integer,
    price double precision
);


ALTER TABLE public.order_details OWNER TO lorena;

--
-- Name: order_details_id_seq; Type: SEQUENCE; Schema: public; Owner: lorena
--

CREATE SEQUENCE public.order_details_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_details_id_seq OWNER TO lorena;

--
-- Name: order_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lorena
--

ALTER SEQUENCE public.order_details_id_seq OWNED BY public.order_details.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: lorena
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    id_user integer,
    date timestamp without time zone,
    total double precision
);


ALTER TABLE public.orders OWNER TO lorena;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: lorena
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO lorena;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lorena
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: lorena
--

CREATE TABLE public.products (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    price double precision NOT NULL,
    image character varying(100),
    enabled boolean,
    stock integer
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
-- Name: likes_users_products id; Type: DEFAULT; Schema: public; Owner: lorena
--

ALTER TABLE ONLY public.likes_users_products ALTER COLUMN id SET DEFAULT nextval('public.likes_users_products_id_seq'::regclass);


--
-- Name: order_details id; Type: DEFAULT; Schema: public; Owner: lorena
--

ALTER TABLE ONLY public.order_details ALTER COLUMN id SET DEFAULT nextval('public.order_details_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: lorena
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


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
-- Data for Name: likes_users_products; Type: TABLE DATA; Schema: public; Owner: lorena
--

COPY public.likes_users_products (id, id_user, id_product, likes) FROM stdin;
5	38	1	t
\.


--
-- Data for Name: order_details; Type: TABLE DATA; Schema: public; Owner: lorena
--

COPY public.order_details (id, id_order, id_product, quantity, price) FROM stdin;
43	28	1	9	0.5
44	28	28	1	0.5
45	28	25	1	0.5
52	31	3	1	1.2
53	31	18	1	0.5
54	31	29	2	1.7
55	32	3	1	1.2
56	32	18	1	0.5
57	32	29	2	1.7
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: lorena
--

COPY public.orders (id, id_user, date, total) FROM stdin;
28	37	2021-05-27 11:35:45.627	1.5
31	37	2021-05-27 12:27:00.607	5.1
32	38	2021-05-27 12:54:21.756	5.1
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: lorena
--

COPY public.products (id, name, price, image, enabled, stock) FROM stdin;
30	white chocolate bar	1.7	\N	f	10
14	chocolate cookies	1.5	\N	t	10
16	chocolate cookies	1.5	\N	t	10
17	strawberry candy	0.2	\N	t	10
27	blackberry bubblegum	0.5	\N	t	10
1	bubblegum	0.5	\N	t	50
3	chocolate bar	1.2	\N	f	19
29	white chocolate bar	1.7	\N	t	48
2	lollipop	0.5	\N	t	10
18	banana bubblegum	0.5	\N	t	49
28	apple bubblegum	0.5	\N	f	9
25	watermelon bubblegum	0.5	\N	t	9
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
26	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNjIyMTQ2ODE1LCJleHAiOjE2MjI3NTE2MTV9.JeqJLguYjwWbnQdFXnhLwyBugx4FRvIOxLQ067MSkBI
27	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MzgsImlhdCI6MTYyMjE0NzM3NiwiZXhwIjoxNjIyNzUyMTc2fQ.ry5E9IPi2eYCmTStf6fT_xDItu7GvpEe29QXE5E54sc
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: lorena
--

COPY public.users (id, name, email, password, role) FROM stdin;
38	client2	client2@client.com	$2a$08$aIFW0PzT4zgM9RcIb/gOqummBb9HpzLmdW4GpFXkKraD0sVAjnO.6	client
53	client3	client3@client.com	$2a$08$Lup0BwXfWSP0GfNCtpv6FOd.XllRbP/xHHlqo2zAfEIyWdQPDV9AK	client
1	manager	admin@admin.com	$2a$08$m28.xggnTLOLNAo7z08tlOtwag5FfI7p8tXHjyAtTmJR51mjtsXCG	manager
2	client1	client1@client.com	$2a$08$m28.xggnTLOLNAo7z08tlOtwag5FfI7p8tXHjyAtTmJR51mjtsXCG	client
37	manager2	admin2@admin.com	$2a$08$4fFTSmkSMtdS9OJoJJEQUuuA.X.rIBG3FspUOdTU5KZCYtuom.bj2	manager
\.


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lorena
--

SELECT pg_catalog.setval('public.categories_id_seq', 5, true);


--
-- Name: likes_users_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lorena
--

SELECT pg_catalog.setval('public.likes_users_products_id_seq', 17, true);


--
-- Name: order_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lorena
--

SELECT pg_catalog.setval('public.order_details_id_seq', 57, true);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lorena
--

SELECT pg_catalog.setval('public.orders_id_seq', 32, true);


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

SELECT pg_catalog.setval('public.sessions_id_seq', 27, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lorena
--

SELECT pg_catalog.setval('public.users_id_seq', 54, true);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: lorena
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: likes_users_products likes_users_products_pkey; Type: CONSTRAINT; Schema: public; Owner: lorena
--

ALTER TABLE ONLY public.likes_users_products
    ADD CONSTRAINT likes_users_products_pkey PRIMARY KEY (id);


--
-- Name: order_details order_details_pkey; Type: CONSTRAINT; Schema: public; Owner: lorena
--

ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT order_details_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: lorena
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


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
-- Name: likes_users_products_composite_index; Type: INDEX; Schema: public; Owner: lorena
--

CREATE UNIQUE INDEX likes_users_products_composite_index ON public.likes_users_products USING btree (id_user, id_product);


--
-- Name: products_categories id_category; Type: FK CONSTRAINT; Schema: public; Owner: lorena
--

ALTER TABLE ONLY public.products_categories
    ADD CONSTRAINT id_category FOREIGN KEY (id_category) REFERENCES public.categories(id);


--
-- Name: order_details id_order; Type: FK CONSTRAINT; Schema: public; Owner: lorena
--

ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT id_order FOREIGN KEY (id_order) REFERENCES public.orders(id);


--
-- Name: products_categories id_product; Type: FK CONSTRAINT; Schema: public; Owner: lorena
--

ALTER TABLE ONLY public.products_categories
    ADD CONSTRAINT id_product FOREIGN KEY (id_product) REFERENCES public.products(id);


--
-- Name: order_details id_product; Type: FK CONSTRAINT; Schema: public; Owner: lorena
--

ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT id_product FOREIGN KEY (id_product) REFERENCES public.products(id);


--
-- Name: likes_users_products id_product; Type: FK CONSTRAINT; Schema: public; Owner: lorena
--

ALTER TABLE ONLY public.likes_users_products
    ADD CONSTRAINT id_product FOREIGN KEY (id_product) REFERENCES public.products(id);


--
-- Name: orders id_user; Type: FK CONSTRAINT; Schema: public; Owner: lorena
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT id_user FOREIGN KEY (id_user) REFERENCES public.users(id);


--
-- Name: likes_users_products id_user; Type: FK CONSTRAINT; Schema: public; Owner: lorena
--

ALTER TABLE ONLY public.likes_users_products
    ADD CONSTRAINT id_user FOREIGN KEY (id_user) REFERENCES public.users(id);


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
-- Name: likes_users_products; Type: TABLE; Schema: public; Owner: lorena
--

CREATE TABLE public.likes_users_products (
    id integer NOT NULL,
    id_user integer,
    id_product integer,
    likes boolean DEFAULT false NOT NULL
);


ALTER TABLE public.likes_users_products OWNER TO lorena;

--
-- Name: likes_users_products_id_seq; Type: SEQUENCE; Schema: public; Owner: lorena
--

CREATE SEQUENCE public.likes_users_products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.likes_users_products_id_seq OWNER TO lorena;

--
-- Name: likes_users_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lorena
--

ALTER SEQUENCE public.likes_users_products_id_seq OWNED BY public.likes_users_products.id;


--
-- Name: order_details; Type: TABLE; Schema: public; Owner: lorena
--

CREATE TABLE public.order_details (
    id integer NOT NULL,
    id_order integer,
    id_product integer,
    quantity integer,
    price double precision
);


ALTER TABLE public.order_details OWNER TO lorena;

--
-- Name: order_details_id_seq; Type: SEQUENCE; Schema: public; Owner: lorena
--

CREATE SEQUENCE public.order_details_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_details_id_seq OWNER TO lorena;

--
-- Name: order_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lorena
--

ALTER SEQUENCE public.order_details_id_seq OWNED BY public.order_details.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: lorena
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    id_user integer,
    date timestamp without time zone,
    total double precision
);


ALTER TABLE public.orders OWNER TO lorena;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: lorena
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO lorena;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lorena
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: lorena
--

CREATE TABLE public.products (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    price double precision NOT NULL,
    image character varying(100),
    enabled boolean,
    stock integer
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
-- Name: likes_users_products id; Type: DEFAULT; Schema: public; Owner: lorena
--

ALTER TABLE ONLY public.likes_users_products ALTER COLUMN id SET DEFAULT nextval('public.likes_users_products_id_seq'::regclass);


--
-- Name: order_details id; Type: DEFAULT; Schema: public; Owner: lorena
--

ALTER TABLE ONLY public.order_details ALTER COLUMN id SET DEFAULT nextval('public.order_details_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: lorena
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


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
-- Data for Name: likes_users_products; Type: TABLE DATA; Schema: public; Owner: lorena
--

COPY public.likes_users_products (id, id_user, id_product, likes) FROM stdin;
5	38	1	t
\.


--
-- Data for Name: order_details; Type: TABLE DATA; Schema: public; Owner: lorena
--

COPY public.order_details (id, id_order, id_product, quantity, price) FROM stdin;
43	28	1	9	0.5
44	28	28	1	0.5
45	28	25	1	0.5
52	31	3	1	1.2
53	31	18	1	0.5
54	31	29	2	1.7
55	32	3	1	1.2
56	32	18	1	0.5
57	32	29	2	1.7
58	33	3	1	1.2
59	33	18	1	0.5
60	33	29	2	1.7
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: lorena
--

COPY public.orders (id, id_user, date, total) FROM stdin;
28	37	2021-05-27 11:35:45.627	1.5
31	37	2021-05-27 12:27:00.607	5.1
32	38	2021-05-27 12:54:21.756	5.1
33	38	2021-05-27 16:40:07.609	5.1
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: lorena
--

COPY public.products (id, name, price, image, enabled, stock) FROM stdin;
1	bubblegum	0.5	https://picsum.photos/200	f	50
17	strawberry candy	0.2	https://picsum.photos/200	t	10
14	chocolate cookies	1.5	\N	t	10
27	blackberry bubblegum	0.5	\N	t	10
2	lollipop	0.5	\N	t	10
3	chocolate bar	1.2	\N	f	18
18	banana bubblegum	0.5	\N	t	48
31	M&M	3.5	\N	t	10
30	white chocolate	1.7	\N	f	10
16	mini chocolate cookies	1.5	\N	t	10
28	apple bubblegum	0.5	\N	f	9
25	watermelon bubblegum	0.5	\N	t	9
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
15	30	5
16	31	5
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: lorena
--

COPY public.sessions (id, token) FROM stdin;
29	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NTUsImlhdCI6MTYyMjE1Nzc0NCwiZXhwIjoxNjIyNzYyNTQ0fQ.jXdX1e0udtXLzR-W50AmWALRwpmFVY2h_LRGxjQnEo4
30	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NTUsImlhdCI6MTYyMjE1Nzc3NywiZXhwIjoxNjIyNzYyNTc3fQ.Ek5uKuCfyZ-1lb6wet0SRcG3sqpF-__IK0f2Dyp-CBM
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: lorena
--

COPY public.users (id, name, email, password, role) FROM stdin;
38	client2	client2@client.com	$2a$08$aIFW0PzT4zgM9RcIb/gOqummBb9HpzLmdW4GpFXkKraD0sVAjnO.6	client
53	client3	client3@client.com	$2a$08$Lup0BwXfWSP0GfNCtpv6FOd.XllRbP/xHHlqo2zAfEIyWdQPDV9AK	client
55	client4	client4@client.com	$2a$08$I/zQNyob.V3Q.GicKexYU.KToBdMU8jbmpm6slUGP54xLuemFYYFe	client
1	manager	admin@admin.com	$2a$08$m28.xggnTLOLNAo7z08tlOtwag5FfI7p8tXHjyAtTmJR51mjtsXCG	manager
2	client1	client1@client.com	$2a$08$m28.xggnTLOLNAo7z08tlOtwag5FfI7p8tXHjyAtTmJR51mjtsXCG	client
37	manager2	admin2@admin.com	$2a$08$4fFTSmkSMtdS9OJoJJEQUuuA.X.rIBG3FspUOdTU5KZCYtuom.bj2	manager
\.


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lorena
--

SELECT pg_catalog.setval('public.categories_id_seq', 5, true);


--
-- Name: likes_users_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lorena
--

SELECT pg_catalog.setval('public.likes_users_products_id_seq', 19, true);


--
-- Name: order_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lorena
--

SELECT pg_catalog.setval('public.order_details_id_seq', 60, true);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lorena
--

SELECT pg_catalog.setval('public.orders_id_seq', 33, true);


--
-- Name: products-categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lorena
--

SELECT pg_catalog.setval('public."products-categories_id_seq"', 18, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lorena
--

SELECT pg_catalog.setval('public.products_id_seq', 35, true);


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lorena
--

SELECT pg_catalog.setval('public.sessions_id_seq', 30, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lorena
--

SELECT pg_catalog.setval('public.users_id_seq', 55, true);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: lorena
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: likes_users_products likes_users_products_pkey; Type: CONSTRAINT; Schema: public; Owner: lorena
--

ALTER TABLE ONLY public.likes_users_products
    ADD CONSTRAINT likes_users_products_pkey PRIMARY KEY (id);


--
-- Name: order_details order_details_pkey; Type: CONSTRAINT; Schema: public; Owner: lorena
--

ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT order_details_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: lorena
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: products_categories products-categories_pkey; Type: CONSTRAINT; Schema: public; Owner: lorena
--

ALTER TABLE ONLY public.products_categories
    ADD CONSTRAINT "products-categories_pkey" PRIMARY KEY (id);


--
-- Name: products products_name_key; Type: CONSTRAINT; Schema: public; Owner: lorena
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_name_key UNIQUE (name);


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
-- Name: likes_users_products_composite_index; Type: INDEX; Schema: public; Owner: lorena
--

CREATE UNIQUE INDEX likes_users_products_composite_index ON public.likes_users_products USING btree (id_user, id_product);


--
-- Name: products_categories id_category; Type: FK CONSTRAINT; Schema: public; Owner: lorena
--

ALTER TABLE ONLY public.products_categories
    ADD CONSTRAINT id_category FOREIGN KEY (id_category) REFERENCES public.categories(id);


--
-- Name: order_details id_order; Type: FK CONSTRAINT; Schema: public; Owner: lorena
--

ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT id_order FOREIGN KEY (id_order) REFERENCES public.orders(id);


--
-- Name: products_categories id_product; Type: FK CONSTRAINT; Schema: public; Owner: lorena
--

ALTER TABLE ONLY public.products_categories
    ADD CONSTRAINT id_product FOREIGN KEY (id_product) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- Name: likes_users_products id_product; Type: FK CONSTRAINT; Schema: public; Owner: lorena
--

ALTER TABLE ONLY public.likes_users_products
    ADD CONSTRAINT id_product FOREIGN KEY (id_product) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- Name: orders id_user; Type: FK CONSTRAINT; Schema: public; Owner: lorena
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT id_user FOREIGN KEY (id_user) REFERENCES public.users(id);


--
-- Name: likes_users_products id_user; Type: FK CONSTRAINT; Schema: public; Owner: lorena
--

ALTER TABLE ONLY public.likes_users_products
    ADD CONSTRAINT id_user FOREIGN KEY (id_user) REFERENCES public.users(id);


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
-- Name: likes_users_products; Type: TABLE; Schema: public; Owner: lorena
--

CREATE TABLE public.likes_users_products (
    id integer NOT NULL,
    id_user integer,
    id_product integer,
    likes boolean DEFAULT false NOT NULL
);


ALTER TABLE public.likes_users_products OWNER TO lorena;

--
-- Name: likes_users_products_id_seq; Type: SEQUENCE; Schema: public; Owner: lorena
--

CREATE SEQUENCE public.likes_users_products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.likes_users_products_id_seq OWNER TO lorena;

--
-- Name: likes_users_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lorena
--

ALTER SEQUENCE public.likes_users_products_id_seq OWNED BY public.likes_users_products.id;


--
-- Name: order_details; Type: TABLE; Schema: public; Owner: lorena
--

CREATE TABLE public.order_details (
    id integer NOT NULL,
    id_order integer,
    id_product integer,
    quantity integer,
    price double precision
);


ALTER TABLE public.order_details OWNER TO lorena;

--
-- Name: order_details_id_seq; Type: SEQUENCE; Schema: public; Owner: lorena
--

CREATE SEQUENCE public.order_details_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_details_id_seq OWNER TO lorena;

--
-- Name: order_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lorena
--

ALTER SEQUENCE public.order_details_id_seq OWNED BY public.order_details.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: lorena
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    id_user integer,
    date timestamp without time zone,
    total double precision
);


ALTER TABLE public.orders OWNER TO lorena;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: lorena
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO lorena;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lorena
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: lorena
--

CREATE TABLE public.products (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    price double precision NOT NULL,
    image character varying(100),
    enabled boolean,
    stock integer
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
-- Name: likes_users_products id; Type: DEFAULT; Schema: public; Owner: lorena
--

ALTER TABLE ONLY public.likes_users_products ALTER COLUMN id SET DEFAULT nextval('public.likes_users_products_id_seq'::regclass);


--
-- Name: order_details id; Type: DEFAULT; Schema: public; Owner: lorena
--

ALTER TABLE ONLY public.order_details ALTER COLUMN id SET DEFAULT nextval('public.order_details_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: lorena
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


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
-- Data for Name: likes_users_products; Type: TABLE DATA; Schema: public; Owner: lorena
--

COPY public.likes_users_products (id, id_user, id_product, likes) FROM stdin;
5	38	1	t
20	56	1	t
\.


--
-- Data for Name: order_details; Type: TABLE DATA; Schema: public; Owner: lorena
--

COPY public.order_details (id, id_order, id_product, quantity, price) FROM stdin;
43	28	1	9	0.5
44	28	28	1	0.5
45	28	25	1	0.5
52	31	3	1	1.2
53	31	18	1	0.5
54	31	29	2	1.7
55	32	3	1	1.2
56	32	18	1	0.5
57	32	29	2	1.7
58	33	3	1	1.2
59	33	18	1	0.5
60	33	29	2	1.7
61	34	3	1	1.2
62	34	18	1	0.5
63	34	29	2	1.7
64	35	1	1	0.5
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: lorena
--

COPY public.orders (id, id_user, date, total) FROM stdin;
28	37	2021-05-27 11:35:45.627	1.5
31	37	2021-05-27 12:27:00.607	5.1
32	38	2021-05-27 12:54:21.756	5.1
33	38	2021-05-27 16:40:07.609	5.1
34	56	2021-05-27 22:22:25.343	1.7
35	56	2021-05-28 19:12:00.695	0.5
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: lorena
--

COPY public.products (id, name, price, image, enabled, stock) FROM stdin;
17	strawberry candy	0.2	https://picsum.photos/200	t	10
3	chocolate bar	1.2	\N	f	17
18	banana bubblegum	0.5	\N	t	47
14	chocolate cookies	1.5	\N	t	10
36	M&M Crispy	3.5	\N	t	10
37	M&M mini	3.5	\N	t	10
27	blackberry bubblegum	0.5	\N	t	10
1	bubblegum	0.5	\N	t	50
2	lollipop	0.5	\N	t	10
31	M&M	3.5	\N	t	10
30	white chocolate	1.7	\N	f	10
16	mini chocolate cookies	1.5	\N	t	10
28	apple bubblegum	0.5	\N	f	9
25	watermelon bubblegum	0.5	\N	t	9
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
15	30	5
16	31	5
19	36	5
20	37	5
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: lorena
--

COPY public.sessions (id, token) FROM stdin;
31	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NTYsImlhdCI6MTYyMjE3MTY4OSwiZXhwIjoxNjIyNzc2NDg5fQ.GKCfJ1SGBTw46xIi71h9mYweBEtoBrbwiQAvmU_pb5g
33	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NTYsImlhdCI6MTYyMjE3MTc2MiwiZXhwIjoxNjIyNzc2NTYyfQ.9oZIyyfzkncBKXAYPWWdVPiAzHWIGHPys3UgIc_g_IA
34	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MzgsImlhdCI6MTYyMjIzMzc2OSwiZXhwIjoxNjIyODM4NTY5fQ.HGVGKrLtv8psZNlSdZ2Dc1WkgBPsdYFGxUJOjLq4WSo
35	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MzgsImlhdCI6MTYyMjIzMzgyNywiZXhwIjoxNjIyODM4NjI3fQ.E7yXmmmXz_AaeRe5q6xV4wZBoRwYnhhCVatBqTTHjXg
36	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MzgsImlhdCI6MTYyMjIzNTMyMiwiZXhwIjoxNjIyODQwMTIyfQ.ihS8xxbUdYybZBXT3MpIIS4bBSwj6Y3m7ZaKDq3__rY
39	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MzcsImlhdCI6MTYyMjIzNzMzNiwiZXhwIjoxNjIyODQyMTM2fQ.UsMAMWHPTatBO7orUp6o6H9LU5Aey_a5toy4LSatYcE
40	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NTYsImlhdCI6MTYyMjI1MzgyMywiZXhwIjoxNjIyODU4NjIzfQ.T5iOfsxuopdLFBiJBPXEulIml9ibSNro17iBQweQ64I
41	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNjIyMzI4ODMxLCJleHAiOjE2MjI5MzM2MzF9.yTwg7NV5gQ3Qw_KJhG1c1nWjYXdVVz6zUKGxbb58sks
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: lorena
--

COPY public.users (id, name, email, password, role) FROM stdin;
38	client2	client2@client.com	$2a$08$aIFW0PzT4zgM9RcIb/gOqummBb9HpzLmdW4GpFXkKraD0sVAjnO.6	client
53	client3	client3@client.com	$2a$08$Lup0BwXfWSP0GfNCtpv6FOd.XllRbP/xHHlqo2zAfEIyWdQPDV9AK	client
56	client4	client4@client.com	$2a$08$N6JHPmnnheD0czXjqJWg.OFolgUiN54JF7E2FKtR2mUDtHNvXqpUa	client
1	manager	admin@admin.com	$2a$08$m28.xggnTLOLNAo7z08tlOtwag5FfI7p8tXHjyAtTmJR51mjtsXCG	manager
2	client1	client1@client.com	$2a$08$m28.xggnTLOLNAo7z08tlOtwag5FfI7p8tXHjyAtTmJR51mjtsXCG	client
37	manager2	admin2@admin.com	$2a$08$4fFTSmkSMtdS9OJoJJEQUuuA.X.rIBG3FspUOdTU5KZCYtuom.bj2	manager
\.


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lorena
--

SELECT pg_catalog.setval('public.categories_id_seq', 5, true);


--
-- Name: likes_users_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lorena
--

SELECT pg_catalog.setval('public.likes_users_products_id_seq', 24, true);


--
-- Name: order_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lorena
--

SELECT pg_catalog.setval('public.order_details_id_seq', 64, true);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lorena
--

SELECT pg_catalog.setval('public.orders_id_seq', 35, true);


--
-- Name: products-categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lorena
--

SELECT pg_catalog.setval('public."products-categories_id_seq"', 21, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lorena
--

SELECT pg_catalog.setval('public.products_id_seq', 38, true);


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lorena
--

SELECT pg_catalog.setval('public.sessions_id_seq', 41, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lorena
--

SELECT pg_catalog.setval('public.users_id_seq', 59, true);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: lorena
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: likes_users_products likes_users_products_pkey; Type: CONSTRAINT; Schema: public; Owner: lorena
--

ALTER TABLE ONLY public.likes_users_products
    ADD CONSTRAINT likes_users_products_pkey PRIMARY KEY (id);


--
-- Name: order_details order_details_pkey; Type: CONSTRAINT; Schema: public; Owner: lorena
--

ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT order_details_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: lorena
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: products_categories products-categories_pkey; Type: CONSTRAINT; Schema: public; Owner: lorena
--

ALTER TABLE ONLY public.products_categories
    ADD CONSTRAINT "products-categories_pkey" PRIMARY KEY (id);


--
-- Name: products products_name_key; Type: CONSTRAINT; Schema: public; Owner: lorena
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_name_key UNIQUE (name);


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
-- Name: likes_users_products_composite_index; Type: INDEX; Schema: public; Owner: lorena
--

CREATE UNIQUE INDEX likes_users_products_composite_index ON public.likes_users_products USING btree (id_user, id_product);


--
-- Name: products_categories id_category; Type: FK CONSTRAINT; Schema: public; Owner: lorena
--

ALTER TABLE ONLY public.products_categories
    ADD CONSTRAINT id_category FOREIGN KEY (id_category) REFERENCES public.categories(id);


--
-- Name: order_details id_order; Type: FK CONSTRAINT; Schema: public; Owner: lorena
--

ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT id_order FOREIGN KEY (id_order) REFERENCES public.orders(id);


--
-- Name: products_categories id_product; Type: FK CONSTRAINT; Schema: public; Owner: lorena
--

ALTER TABLE ONLY public.products_categories
    ADD CONSTRAINT id_product FOREIGN KEY (id_product) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- Name: likes_users_products id_product; Type: FK CONSTRAINT; Schema: public; Owner: lorena
--

ALTER TABLE ONLY public.likes_users_products
    ADD CONSTRAINT id_product FOREIGN KEY (id_product) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- Name: orders id_user; Type: FK CONSTRAINT; Schema: public; Owner: lorena
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT id_user FOREIGN KEY (id_user) REFERENCES public.users(id);


--
-- Name: likes_users_products id_user; Type: FK CONSTRAINT; Schema: public; Owner: lorena
--

ALTER TABLE ONLY public.likes_users_products
    ADD CONSTRAINT id_user FOREIGN KEY (id_user) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

