--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: companies; Type: TABLE; Schema: public; Owner: vagrant; Tablespace: 
--

CREATE TABLE companies (
    company_id integer NOT NULL,
    name character varying(64) NOT NULL,
    address character varying(64) NOT NULL,
    hr_contact_info character varying(64) NOT NULL
);


ALTER TABLE public.companies OWNER TO vagrant;

--
-- Name: companies_company_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE companies_company_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.companies_company_id_seq OWNER TO vagrant;

--
-- Name: companies_company_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE companies_company_id_seq OWNED BY companies.company_id;


--
-- Name: incidents; Type: TABLE; Schema: public; Owner: vagrant; Tablespace: 
--

CREATE TABLE incidents (
    incident_id integer NOT NULL,
    user_id integer,
    company_id integer,
    reported_at character varying(64) NOT NULL,
    transaction_id integer
);


ALTER TABLE public.incidents OWNER TO vagrant;

--
-- Name: incidents_incident_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE incidents_incident_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.incidents_incident_id_seq OWNER TO vagrant;

--
-- Name: incidents_incident_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE incidents_incident_id_seq OWNED BY incidents.incident_id;


--
-- Name: transactions; Type: TABLE; Schema: public; Owner: vagrant; Tablespace: 
--

CREATE TABLE transactions (
    trans_id integer NOT NULL,
    user_id integer,
    "timestamp" character varying(64) NOT NULL,
    notes character varying(100) NOT NULL
);


ALTER TABLE public.transactions OWNER TO vagrant;

--
-- Name: transactions_trans_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE transactions_trans_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.transactions_trans_id_seq OWNER TO vagrant;

--
-- Name: transactions_trans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE transactions_trans_id_seq OWNED BY transactions.trans_id;


--
-- Name: user_type; Type: TABLE; Schema: public; Owner: vagrant; Tablespace: 
--

CREATE TABLE user_type (
    user_type_id integer NOT NULL,
    user_type character varying(15) NOT NULL
);


ALTER TABLE public.user_type OWNER TO vagrant;

--
-- Name: user_type_user_type_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE user_type_user_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_type_user_type_id_seq OWNER TO vagrant;

--
-- Name: user_type_user_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE user_type_user_type_id_seq OWNED BY user_type.user_type_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: vagrant; Tablespace: 
--

CREATE TABLE users (
    user_id integer NOT NULL,
    user_name character varying(64) NOT NULL,
    password character varying(64) NOT NULL,
    user_type_id integer NOT NULL
);


ALTER TABLE public.users OWNER TO vagrant;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE users_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO vagrant;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE users_user_id_seq OWNED BY users.user_id;


--
-- Name: company_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY companies ALTER COLUMN company_id SET DEFAULT nextval('companies_company_id_seq'::regclass);


--
-- Name: incident_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY incidents ALTER COLUMN incident_id SET DEFAULT nextval('incidents_incident_id_seq'::regclass);


--
-- Name: trans_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY transactions ALTER COLUMN trans_id SET DEFAULT nextval('transactions_trans_id_seq'::regclass);


--
-- Name: user_type_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY user_type ALTER COLUMN user_type_id SET DEFAULT nextval('user_type_user_type_id_seq'::regclass);


--
-- Name: user_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY users ALTER COLUMN user_id SET DEFAULT nextval('users_user_id_seq'::regclass);


--
-- Data for Name: companies; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY companies (company_id, name, address, hr_contact_info) FROM stdin;
1	ColaCola	123HarrisonSt	jack@colacola.com
2	HaloTech	412FirstSt	jane@halotech.com
3	HBAcademy	616SutterSt	joe@hbacademy.com
4	TownMobile	200BrannanSt	admin@townmobile.com
5	SanBrunoCable	709JonesSt	mike@sanbrunocable.com
6	TechAcademy	1001LindenAve	hrcomments@techacademy.com
7	SubwayMobile	302MarketSt	subwaymobile@subwaymobile.com
\.


--
-- Name: companies_company_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('companies_company_id_seq', 7, true);


--
-- Data for Name: incidents; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY incidents (incident_id, user_id, company_id, reported_at, transaction_id) FROM stdin;
1	1	2	20161020	1
2	1	2	20161020	3
3	1	2	20161020	4
4	1	2	20161020	5
\.


--
-- Name: incidents_incident_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('incidents_incident_id_seq', 4, true);


--
-- Data for Name: transactions; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY transactions (trans_id, user_id, "timestamp", notes) FROM stdin;
1	1	20161020	Sam puts his arm around my shoulders for an uncomfortable amount of time.
3	7	20161020	Received your event.  Can you provide the time this most recently happened?
4	1	20161020	This happened this morning, at 10:30am
5	7	20161020	Thank you.  We will investigate.
\.


--
-- Name: transactions_trans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('transactions_trans_id_seq', 5, true);


--
-- Data for Name: user_type; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY user_type (user_type_id, user_type) FROM stdin;
1	{user}
2	{hr}
\.


--
-- Name: user_type_user_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('user_type_user_type_id_seq', 2, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY users (user_id, user_name, password, user_type_id) FROM stdin;
1	Kathie	123456	1
2	Sarah	123456	1
3	Jennifer	123456	1
4	Noora	123456	1
5	Liz	123456	1
6	Lori	123456	1
7	Ela	123456	1
8	Raquel	123456	1
9	Vivian	123456	1
10	Lilly	123456	1
\.


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('users_user_id_seq', 10, true);


--
-- Name: companies_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant; Tablespace: 
--

ALTER TABLE ONLY companies
    ADD CONSTRAINT companies_pkey PRIMARY KEY (company_id);


--
-- Name: incidents_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant; Tablespace: 
--

ALTER TABLE ONLY incidents
    ADD CONSTRAINT incidents_pkey PRIMARY KEY (incident_id);


--
-- Name: transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant; Tablespace: 
--

ALTER TABLE ONLY transactions
    ADD CONSTRAINT transactions_pkey PRIMARY KEY (trans_id);


--
-- Name: user_type_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant; Tablespace: 
--

ALTER TABLE ONLY user_type
    ADD CONSTRAINT user_type_pkey PRIMARY KEY (user_type_id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: incidents_company_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY incidents
    ADD CONSTRAINT incidents_company_id_fkey FOREIGN KEY (company_id) REFERENCES companies(company_id);


--
-- Name: incidents_transaction_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY incidents
    ADD CONSTRAINT incidents_transaction_id_fkey FOREIGN KEY (transaction_id) REFERENCES transactions(trans_id);


--
-- Name: incidents_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY incidents
    ADD CONSTRAINT incidents_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(user_id);


--
-- Name: transactions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY transactions
    ADD CONSTRAINT transactions_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(user_id);


--
-- Name: users_user_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_user_type_id_fkey FOREIGN KEY (user_type_id) REFERENCES user_type(user_type_id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

