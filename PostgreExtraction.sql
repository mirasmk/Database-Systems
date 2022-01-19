--
-- PostgreSQL database dump
--

-- Dumped from database version 14.0
-- Dumped by pg_dump version 14.0

-- Started on 2021-11-19 22:52:56

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
-- TOC entry 210 (class 1259 OID 16403)
-- Name: country; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.country (
    cname character varying(50) NOT NULL,
    population bigint
);


ALTER TABLE public.country OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 16442)
-- Name: discover; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.discover (
    cname character varying(50) NOT NULL,
    disease_code character varying(50) NOT NULL,
    first_enc_date date
);


ALTER TABLE public.discover OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16432)
-- Name: disease; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.disease (
    disease_code character varying(50) NOT NULL,
    pathogen character varying(20),
    description character varying(140),
    id integer
);


ALTER TABLE public.disease OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16398)
-- Name: diseasetype; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.diseasetype (
    id integer NOT NULL,
    description character varying(140)
);


ALTER TABLE public.diseasetype OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16477)
-- Name: doctor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.doctor (
    email character varying(60) NOT NULL,
    degree character varying(20)
);


ALTER TABLE public.doctor OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16467)
-- Name: publicservant; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.publicservant (
    email character varying(60) NOT NULL,
    department character varying(50)
);


ALTER TABLE public.publicservant OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16502)
-- Name: record; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.record (
    email character varying(60) NOT NULL,
    cname character varying(50) NOT NULL,
    disease_code character varying(50) NOT NULL,
    total_deaths integer,
    total_patients integer
);


ALTER TABLE public.record OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16487)
-- Name: specialize; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.specialize (
    id integer NOT NULL,
    email character varying(60) NOT NULL
);


ALTER TABLE public.specialize OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16457)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    email character varying(60) NOT NULL,
    name character varying(30),
    surname character varying(40),
    salary integer,
    phone character varying(20),
    cname character varying(50)
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 3364 (class 0 OID 16403)
-- Dependencies: 210
-- Data for Name: country; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.country (cname, population) FROM stdin;
United States	333649395
India	1398650612
Kazakhstan	19086675
Turkey	85588593
Argentina	45765005
France	65469059
Germany	84147349
South Africa	60342024
Canada	38195987
Sweden	10185200
China	1447049584
Spain	46779779
England	68383076
\.


--
-- TOC entry 3366 (class 0 OID 16442)
-- Dependencies: 212
-- Data for Name: discover; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.discover (cname, disease_code, first_enc_date) FROM stdin;
China	covid-19	2019-11-01
Spain	A360	1613-01-01
United States	D571	1910-01-01
England	E550	1645-01-01
India	B470	1860-01-01
United States	A072	1987-01-01
South Africa	B20	1920-01-01
Germany	F310	1952-01-01
Spain	A020	1576-01-01
South Africa	A984	1976-01-01
\.


--
-- TOC entry 3365 (class 0 OID 16432)
-- Dependencies: 211
-- Data for Name: disease; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.disease (disease_code, pathogen, description, id) FROM stdin;
covid-19	virus	Coronavirus disease 2019 - a contagious disease caused by severe acute respiratory syndrome coronavirus 2 (SARS-CoV-2).	5
A360	bacterium	Diphtheria - infection caused by strains of bacteria called Corynebacterium diphtheriae that make toxin (poison).	1
D571	\N	Sickle cell disease - is a group of blood disorders typically inherited from parents.	3
E550	\N	Rickets - is a condition that results in weak or soft bones in children.	2
B470	fungus	Eumycetoma - fungal infection of the skin and the tissues just under the skin, affecting most commonly the feet.	1
A072	parasite	Cryptosporidiosis - is a parasitic disease caused by Cryptosporidium, which affects the distal small intestine.	1
B20	virus	HIV - they cause acquired immunodeficiency syndrome (AIDS), a condition with progressive failure of the immune system	1
F310	\N	Bipolar - mental health condition that causes extreme mood swings that include emotional highs (mania or hypomania) and lows (depression).	4
A020	bacterium	Salmonellosis - is a symptomatic infection caused by bacteria of the Salmonella type.	1
A984	virus	Ebola - is a virus that causes problems with how your blood clots.	1
\.


--
-- TOC entry 3363 (class 0 OID 16398)
-- Dependencies: 209
-- Data for Name: diseasetype; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.diseasetype (id, description) FROM stdin;
1	infectious
2	deficiency
3	hereditary
4	physiological
5	virology
6	incurable
7	iatrogenic
8	idiopathic
9	terminal
10	predisease
\.


--
-- TOC entry 3369 (class 0 OID 16477)
-- Dependencies: 215
-- Data for Name: doctor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.doctor (email, degree) FROM stdin;
facilisis.facilisis@google.org	Doctoral
aliquam.adipiscing.lacus@google.ca	Doctoral
eu.lacus@aol.net	Associate
diam.vel.arcu@yahoo.net	Master
enim.mauris@hotmail.ca	Doctoral
morbi@aol.com	Doctoral
sed.neque@icloud.ca	Associate
lobortis.nisi@outlook.com	Doctoral
urna.convallis@google.edu	Master
sed.congue@protonmail.com	Doctoral
\.


--
-- TOC entry 3368 (class 0 OID 16467)
-- Dependencies: 214
-- Data for Name: publicservant; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.publicservant (email, department) FROM stdin;
ac.metus@hotmail.net	Dept1
nisl.nulla.eu@hotmail.couk	Dept2
in.faucibus@yahoo.net	Dept4
nulla.semper@google.com	Dept5
magna@aol.ca	Dept2
cursus.integer.mollis@aol.couk	Dept6
lobortis@hotmail.com	Dept1
est.congue@icloud.ca	Dept4
et@aol.ca	Dept3
feugiat.placerat@icloud.net	Dept3
\.


--
-- TOC entry 3371 (class 0 OID 16502)
-- Dependencies: 217
-- Data for Name: record; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.record (email, cname, disease_code, total_deaths, total_patients) FROM stdin;
ac.metus@hotmail.net	China	covid-19	15000	600000
ac.metus@hotmail.net	Germany	covid-19	20000	400000
ac.metus@hotmail.net	England	covid-19	4000	40000
nisl.nulla.eu@hotmail.couk	Sweden	covid-19	1000	60000
in.faucibus@yahoo.net	South Africa	covid-19	8000	30000
nulla.semper@google.com	China	E550	30	7000
nulla.semper@google.com	Canada	A072	40	6000
magna@aol.ca	South Africa	A984	100000	900000
cursus.integer.mollis@aol.couk	Turkey	B20	5000	40000
lobortis@hotmail.com	Argentina	covid-19	15000	700000
est.congue@icloud.ca	England	F310	1	60000
et@aol.ca	Spain	E550	20	4500
et@aol.ca	India	D571	10	700
feugiat.placerat@icloud.net	India	covid-19	100000	900000
feugiat.placerat@icloud.net	Kazakhstan	covid-19	3000	30000
feugiat.placerat@icloud.net	France	covid-19	17000	300000
feugiat.placerat@icloud.net	Spain	covid-19	1000	75000
\.


--
-- TOC entry 3370 (class 0 OID 16487)
-- Dependencies: 216
-- Data for Name: specialize; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.specialize (id, email) FROM stdin;
1	facilisis.facilisis@google.org
2	facilisis.facilisis@google.org
3	facilisis.facilisis@google.org
5	aliquam.adipiscing.lacus@google.ca
7	aliquam.adipiscing.lacus@google.ca
1	eu.lacus@aol.net
1	diam.vel.arcu@yahoo.net
2	diam.vel.arcu@yahoo.net
4	diam.vel.arcu@yahoo.net
1	enim.mauris@hotmail.ca
8	enim.mauris@hotmail.ca
2	morbi@aol.com
2	sed.neque@icloud.ca
4	lobortis.nisi@outlook.com
5	lobortis.nisi@outlook.com
6	lobortis.nisi@outlook.com
9	urna.convallis@google.edu
1	sed.congue@protonmail.com
2	sed.congue@protonmail.com
5	eu.lacus@aol.net
\.


--
-- TOC entry 3367 (class 0 OID 16457)
-- Dependencies: 213
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (email, name, surname, salary, phone, cname) FROM stdin;
ac.metus@hotmail.net	Jamal	Mcfarland	400000	034-941-5898	Germany
nisl.nulla.eu@hotmail.couk	Clinton	Lowe	200000	034-663-3376	India
in.faucibus@yahoo.net	Jocelyn	Howell	500000	031-507-6141	England
nulla.semper@google.com	Sierra	Benton	300000	038-251-4602	China
magna@aol.ca	April	Edwards	440000	085-006-6961	India
cursus.integer.mollis@aol.couk	Nayda	Clay	540000	067-151-3049	France
lobortis@hotmail.com	Perry	Robbins	370000	018-313-0864	Germany
est.congue@icloud.ca	Dimash	Sagynbek	750000	082-838-5774	England
et@aol.ca	Aidyn	Kozha	1500000	061-556-4328	Kazakhstan
facilisis.facilisis@google.org	Zane	Fuller	670000	004-433-4182	England
aliquam.adipiscing.lacus@google.ca	Macey	Vargas	900000	024-475-5475	United States
eu.lacus@aol.net	Armando	Pena	340000	082-668-5618	England
diam.vel.arcu@yahoo.net	Kiayada	Wiley	430000	053-361-2507	France
enim.mauris@hotmail.ca	Josiah	Raymond	230000	035-173-0394	Canada
morbi@aol.com	Iola	Hooper	340000	004-433-4111	Turkey
sed.neque@icloud.ca	Cain	Barnett	900000	024-475-5498	United States
lobortis.nisi@outlook.com	Mira	Delgado	360000	082-685-5618	England
urna.convallis@google.edu	Harlan	Barker	830000	053-393-2507	Sweden
sed.congue@protonmail.com	Josiah	Horne	330000	035-766-0394	Canada
feugiat.placerat@icloud.net	Adilet	Bolatbek	1000000	067-752-8535	Kazakhstan
\.


--
-- TOC entry 3198 (class 2606 OID 16407)
-- Name: country country_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_pkey PRIMARY KEY (cname);


--
-- TOC entry 3202 (class 2606 OID 16446)
-- Name: discover discover_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discover
    ADD CONSTRAINT discover_pkey PRIMARY KEY (cname, disease_code);


--
-- TOC entry 3200 (class 2606 OID 16436)
-- Name: disease disease_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.disease
    ADD CONSTRAINT disease_pkey PRIMARY KEY (disease_code);


--
-- TOC entry 3196 (class 2606 OID 16402)
-- Name: diseasetype diseasetype_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.diseasetype
    ADD CONSTRAINT diseasetype_pkey PRIMARY KEY (id);


--
-- TOC entry 3208 (class 2606 OID 16481)
-- Name: doctor doctor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor
    ADD CONSTRAINT doctor_pkey PRIMARY KEY (email);


--
-- TOC entry 3206 (class 2606 OID 16471)
-- Name: publicservant publicservant_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.publicservant
    ADD CONSTRAINT publicservant_pkey PRIMARY KEY (email);


--
-- TOC entry 3212 (class 2606 OID 16506)
-- Name: record record_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.record
    ADD CONSTRAINT record_pkey PRIMARY KEY (email, cname, disease_code);


--
-- TOC entry 3210 (class 2606 OID 16491)
-- Name: specialize specialize_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.specialize
    ADD CONSTRAINT specialize_pkey PRIMARY KEY (id, email);


--
-- TOC entry 3204 (class 2606 OID 16461)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (email);


--
-- TOC entry 3214 (class 2606 OID 24596)
-- Name: discover discover_cname_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discover
    ADD CONSTRAINT discover_cname_fkey FOREIGN KEY (cname) REFERENCES public.country(cname) ON DELETE CASCADE;


--
-- TOC entry 3215 (class 2606 OID 24601)
-- Name: discover discover_disease_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discover
    ADD CONSTRAINT discover_disease_code_fkey FOREIGN KEY (disease_code) REFERENCES public.disease(disease_code) ON DELETE CASCADE;


--
-- TOC entry 3213 (class 2606 OID 24591)
-- Name: disease disease_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.disease
    ADD CONSTRAINT disease_id_fkey FOREIGN KEY (id) REFERENCES public.diseasetype(id) ON DELETE CASCADE;


--
-- TOC entry 3218 (class 2606 OID 24611)
-- Name: doctor doctor_email_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor
    ADD CONSTRAINT doctor_email_fkey FOREIGN KEY (email) REFERENCES public.users(email) ON DELETE CASCADE;


--
-- TOC entry 3217 (class 2606 OID 24606)
-- Name: publicservant publicservant_email_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.publicservant
    ADD CONSTRAINT publicservant_email_fkey FOREIGN KEY (email) REFERENCES public.users(email) ON DELETE CASCADE;


--
-- TOC entry 3223 (class 2606 OID 24636)
-- Name: record record_cname_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.record
    ADD CONSTRAINT record_cname_fkey FOREIGN KEY (cname) REFERENCES public.country(cname) ON DELETE CASCADE;


--
-- TOC entry 3222 (class 2606 OID 24631)
-- Name: record record_disease_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.record
    ADD CONSTRAINT record_disease_code_fkey FOREIGN KEY (disease_code) REFERENCES public.disease(disease_code) ON DELETE CASCADE;


--
-- TOC entry 3221 (class 2606 OID 24626)
-- Name: record record_email_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.record
    ADD CONSTRAINT record_email_fkey FOREIGN KEY (email) REFERENCES public.publicservant(email) ON DELETE CASCADE;


--
-- TOC entry 3219 (class 2606 OID 24616)
-- Name: specialize specialize_email_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.specialize
    ADD CONSTRAINT specialize_email_fkey FOREIGN KEY (email) REFERENCES public.doctor(email) ON DELETE CASCADE;


--
-- TOC entry 3220 (class 2606 OID 24621)
-- Name: specialize specialize_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.specialize
    ADD CONSTRAINT specialize_id_fkey FOREIGN KEY (id) REFERENCES public.diseasetype(id) ON DELETE CASCADE;


--
-- TOC entry 3216 (class 2606 OID 24586)
-- Name: users users_cname_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_cname_fkey FOREIGN KEY (cname) REFERENCES public.country(cname) ON DELETE CASCADE;


-- Completed on 2021-11-19 22:52:57

--
-- PostgreSQL database dump complete
--

