--
-- PostgreSQL database dump
--

-- Started on 2015-06-08 08:31:48

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- TOC entry 1853 (class 1262 OID 41291)
-- Name: skillsdb; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE skillsdb WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Ukrainian_Ukraine.1251' LC_CTYPE = 'Ukrainian_Ukraine.1251';


ALTER DATABASE skillsdb OWNER TO postgres;

\connect skillsdb

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- TOC entry 482 (class 2612 OID 16386)
-- Name: plpgsql; Type: PROCEDURAL LANGUAGE; Schema: -; Owner: postgres
--

CREATE PROCEDURAL LANGUAGE plpgsql;


ALTER PROCEDURAL LANGUAGE plpgsql OWNER TO postgres;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 140 (class 1259 OID 41292)
-- Dependencies: 6
-- Name: authentication; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE authentication (
    id bigint NOT NULL,
    login text NOT NULL,
    password text NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.authentication OWNER TO postgres;

--
-- TOC entry 141 (class 1259 OID 41298)
-- Dependencies: 6 140
-- Name: authentication_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE authentication_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.authentication_id_seq OWNER TO postgres;

--
-- TOC entry 1856 (class 0 OID 0)
-- Dependencies: 141
-- Name: authentication_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE authentication_id_seq OWNED BY authentication.id;


--
-- TOC entry 1857 (class 0 OID 0)
-- Dependencies: 141
-- Name: authentication_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('authentication_id_seq', 1, false);


--
-- TOC entry 142 (class 1259 OID 41300)
-- Dependencies: 6
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE categories (
    id bigint NOT NULL,
    title text NOT NULL
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- TOC entry 143 (class 1259 OID 41306)
-- Dependencies: 142 6
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO postgres;

--
-- TOC entry 1858 (class 0 OID 0)
-- Dependencies: 143
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE categories_id_seq OWNED BY categories.id;


--
-- TOC entry 1859 (class 0 OID 0)
-- Dependencies: 143
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('categories_id_seq', 1, false);


--
-- TOC entry 144 (class 1259 OID 41308)
-- Dependencies: 6
-- Name: contacts; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE contacts (
    id bigint NOT NULL,
    e_mail text NOT NULL,
    phone text,
    skype text,
    user_id integer NOT NULL
);


ALTER TABLE public.contacts OWNER TO postgres;

--
-- TOC entry 145 (class 1259 OID 41314)
-- Dependencies: 6 144
-- Name: contacts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE contacts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.contacts_id_seq OWNER TO postgres;

--
-- TOC entry 1860 (class 0 OID 0)
-- Dependencies: 145
-- Name: contacts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE contacts_id_seq OWNED BY contacts.id;


--
-- TOC entry 1861 (class 0 OID 0)
-- Dependencies: 145
-- Name: contacts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('contacts_id_seq', 1, false);


--
-- TOC entry 146 (class 1259 OID 41316)
-- Dependencies: 1816 6
-- Name: requests; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE requests (
    id bigint NOT NULL,
    user_from integer NOT NULL,
    user_to integer NOT NULL,
    subject_from integer NOT NULL,
    subject_to integer NOT NULL,
    status integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.requests OWNER TO postgres;

--
-- TOC entry 147 (class 1259 OID 41320)
-- Dependencies: 146 6
-- Name: requests_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE requests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.requests_id_seq OWNER TO postgres;

--
-- TOC entry 1862 (class 0 OID 0)
-- Dependencies: 147
-- Name: requests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE requests_id_seq OWNED BY requests.id;


--
-- TOC entry 1863 (class 0 OID 0)
-- Dependencies: 147
-- Name: requests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('requests_id_seq', 1, false);


--
-- TOC entry 148 (class 1259 OID 41322)
-- Dependencies: 6
-- Name: subjects; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE subjects (
    id bigint NOT NULL,
    title text NOT NULL,
    category_id integer
);


ALTER TABLE public.subjects OWNER TO postgres;

--
-- TOC entry 149 (class 1259 OID 41328)
-- Dependencies: 6 148
-- Name: subjects_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE subjects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.subjects_id_seq OWNER TO postgres;

--
-- TOC entry 1864 (class 0 OID 0)
-- Dependencies: 149
-- Name: subjects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE subjects_id_seq OWNED BY subjects.id;


--
-- TOC entry 1865 (class 0 OID 0)
-- Dependencies: 149
-- Name: subjects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('subjects_id_seq', 1, false);


--
-- TOC entry 150 (class 1259 OID 41330)
-- Dependencies: 6
-- Name: teachers; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE teachers (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    subject_id integer NOT NULL
);


ALTER TABLE public.teachers OWNER TO postgres;

--
-- TOC entry 151 (class 1259 OID 41333)
-- Dependencies: 6 150
-- Name: teachers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE teachers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.teachers_id_seq OWNER TO postgres;

--
-- TOC entry 1866 (class 0 OID 0)
-- Dependencies: 151
-- Name: teachers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE teachers_id_seq OWNED BY teachers.id;


--
-- TOC entry 1867 (class 0 OID 0)
-- Dependencies: 151
-- Name: teachers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('teachers_id_seq', 1, false);


--
-- TOC entry 152 (class 1259 OID 41335)
-- Dependencies: 6
-- Name: users; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE users (
    id bigint NOT NULL,
    first_name text NOT NULL,
    last_name text NOT NULL,
    sex text NOT NULL,
    birth date NOT NULL,
    country text NOT NULL,
    city text NOT NULL,
    summary text,
    photo bytea[]
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 153 (class 1259 OID 41341)
-- Dependencies: 152 6
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 1868 (class 0 OID 0)
-- Dependencies: 153
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- TOC entry 1869 (class 0 OID 0)
-- Dependencies: 153
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_id_seq', 1, false);


--
-- TOC entry 1813 (class 2604 OID 41343)
-- Dependencies: 141 140
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY authentication ALTER COLUMN id SET DEFAULT nextval('authentication_id_seq'::regclass);


--
-- TOC entry 1814 (class 2604 OID 41344)
-- Dependencies: 143 142
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY categories ALTER COLUMN id SET DEFAULT nextval('categories_id_seq'::regclass);


--
-- TOC entry 1815 (class 2604 OID 41345)
-- Dependencies: 145 144
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contacts ALTER COLUMN id SET DEFAULT nextval('contacts_id_seq'::regclass);


--
-- TOC entry 1817 (class 2604 OID 41346)
-- Dependencies: 147 146
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY requests ALTER COLUMN id SET DEFAULT nextval('requests_id_seq'::regclass);


--
-- TOC entry 1818 (class 2604 OID 41347)
-- Dependencies: 149 148
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY subjects ALTER COLUMN id SET DEFAULT nextval('subjects_id_seq'::regclass);


--
-- TOC entry 1819 (class 2604 OID 41348)
-- Dependencies: 151 150
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY teachers ALTER COLUMN id SET DEFAULT nextval('teachers_id_seq'::regclass);


--
-- TOC entry 1820 (class 2604 OID 41349)
-- Dependencies: 153 152
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- TOC entry 1844 (class 0 OID 41292)
-- Dependencies: 140
-- Data for Name: authentication; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY authentication (id, login, password, user_id) FROM stdin;
\.


--
-- TOC entry 1845 (class 0 OID 41300)
-- Dependencies: 142
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY categories (id, title) FROM stdin;
\.


--
-- TOC entry 1846 (class 0 OID 41308)
-- Dependencies: 144
-- Data for Name: contacts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY contacts (id, e_mail, phone, skype, user_id) FROM stdin;
\.


--
-- TOC entry 1847 (class 0 OID 41316)
-- Dependencies: 146
-- Data for Name: requests; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY requests (id, user_from, user_to, subject_from, subject_to, status) FROM stdin;
\.


--
-- TOC entry 1848 (class 0 OID 41322)
-- Dependencies: 148
-- Data for Name: subjects; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY subjects (id, title, category_id) FROM stdin;
\.


--
-- TOC entry 1849 (class 0 OID 41330)
-- Dependencies: 150
-- Data for Name: teachers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY teachers (id, user_id, subject_id) FROM stdin;
\.


--
-- TOC entry 1850 (class 0 OID 41335)
-- Dependencies: 152
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY users (id, first_name, last_name, sex, birth, country, city, summary, photo) FROM stdin;
1	John	Smith	m	1980-01-20	Ukraine	Kiev	\N	\N
2	Peter	North	m	1975-03-15	Ukraine	Kiev	\N	\N
3	Mary	Ivanova	f	1996-06-02	Ukraine	Brovary	\N	\N
4	Izabella	Harris	f	1997-05-31	Ukraine	Chabany	\N	\N
\.


--
-- TOC entry 1822 (class 2606 OID 41351)
-- Dependencies: 140 140
-- Name: auth_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY authentication
    ADD CONSTRAINT auth_pk PRIMARY KEY (id);


--
-- TOC entry 1824 (class 2606 OID 41353)
-- Dependencies: 142 142
-- Name: category_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY categories
    ADD CONSTRAINT category_pk PRIMARY KEY (id);


--
-- TOC entry 1826 (class 2606 OID 41355)
-- Dependencies: 144 144
-- Name: contacts_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY contacts
    ADD CONSTRAINT contacts_pk PRIMARY KEY (id);


--
-- TOC entry 1828 (class 2606 OID 41357)
-- Dependencies: 146 146
-- Name: request_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY requests
    ADD CONSTRAINT request_pk PRIMARY KEY (id);


--
-- TOC entry 1830 (class 2606 OID 41359)
-- Dependencies: 148 148
-- Name: subject_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY subjects
    ADD CONSTRAINT subject_pk PRIMARY KEY (id);


--
-- TOC entry 1832 (class 2606 OID 41361)
-- Dependencies: 150 150
-- Name: teacher_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY teachers
    ADD CONSTRAINT teacher_pk PRIMARY KEY (id);


--
-- TOC entry 1834 (class 2606 OID 41363)
-- Dependencies: 152 152
-- Name: user_id; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT user_id PRIMARY KEY (id);


--
-- TOC entry 1841 (class 2606 OID 41364)
-- Dependencies: 142 1823 148
-- Name: category; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY subjects
    ADD CONSTRAINT category FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE SET NULL;


--
-- TOC entry 1842 (class 2606 OID 41369)
-- Dependencies: 148 1829 150
-- Name: subject; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY teachers
    ADD CONSTRAINT subject FOREIGN KEY (subject_id) REFERENCES subjects(id);


--
-- TOC entry 1837 (class 2606 OID 41374)
-- Dependencies: 148 1829 146
-- Name: subject_from_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY requests
    ADD CONSTRAINT subject_from_id FOREIGN KEY (subject_from) REFERENCES subjects(id);


--
-- TOC entry 1838 (class 2606 OID 41379)
-- Dependencies: 148 1829 146
-- Name: subject_to_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY requests
    ADD CONSTRAINT subject_to_id FOREIGN KEY (subject_to) REFERENCES subjects(id);


--
-- TOC entry 1835 (class 2606 OID 41384)
-- Dependencies: 152 1833 140
-- Name: user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY authentication
    ADD CONSTRAINT "user" FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL;


--
-- TOC entry 1836 (class 2606 OID 41389)
-- Dependencies: 144 140 1821
-- Name: user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contacts
    ADD CONSTRAINT "user" FOREIGN KEY (user_id) REFERENCES authentication(id) ON DELETE SET NULL;


--
-- TOC entry 1843 (class 2606 OID 41394)
-- Dependencies: 152 1833 150
-- Name: user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY teachers
    ADD CONSTRAINT "user" FOREIGN KEY (user_id) REFERENCES users(id);


--
-- TOC entry 1839 (class 2606 OID 41399)
-- Dependencies: 1833 146 152
-- Name: user_from_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY requests
    ADD CONSTRAINT user_from_id FOREIGN KEY (user_from) REFERENCES users(id);


--
-- TOC entry 1840 (class 2606 OID 41404)
-- Dependencies: 1833 146 152
-- Name: user_to_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY requests
    ADD CONSTRAINT user_to_id FOREIGN KEY (user_to) REFERENCES users(id);


--
-- TOC entry 1855 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2015-06-08 08:31:48

--
-- PostgreSQL database dump complete
--

