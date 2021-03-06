--
-- PostgreSQL database dump
--

-- Dumped from database version 12.3
-- Dumped by pg_dump version 12.3

-- Started on 2020-07-12 07:43:26

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
-- TOC entry 202 (class 1259 OID 32816)
-- Name: department; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.department (
    dept_no character varying(10) NOT NULL,
    dept_name character varying(50)
);


ALTER TABLE public.department OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 32868)
-- Name: employee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee (
    emp_no integer NOT NULL,
    emp_title_id character varying(140),
    birth_date date NOT NULL,
    first_name character varying(140),
    last_name character varying(140),
    sex character varying(10),
    hire_date date NOT NULL
);


ALTER TABLE public.employee OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 32821)
-- Name: employee_dept; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee_dept (
    emp_no integer NOT NULL,
    dept_no character varying(10) NOT NULL
);


ALTER TABLE public.employee_dept OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 32826)
-- Name: manager; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.manager (
    dept_no character varying(10),
    emp_no integer NOT NULL
);


ALTER TABLE public.manager OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 32836)
-- Name: salary; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.salary (
    emp_no integer NOT NULL,
    salary integer
);


ALTER TABLE public.salary OWNER TO postgres;

--
-- TOC entry 2702 (class 2606 OID 32820)
-- Name: department department_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.department
    ADD CONSTRAINT department_pkey PRIMARY KEY (dept_no);


--
-- TOC entry 2704 (class 2606 OID 32825)
-- Name: employee_dept employee_dept_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_dept
    ADD CONSTRAINT employee_dept_pkey PRIMARY KEY (emp_no, dept_no);


--
-- TOC entry 2710 (class 2606 OID 32872)
-- Name: employee employee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (emp_no);


--
-- TOC entry 2706 (class 2606 OID 32830)
-- Name: manager manager_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.manager
    ADD CONSTRAINT manager_pkey PRIMARY KEY (emp_no);


--
-- TOC entry 2708 (class 2606 OID 32840)
-- Name: salary salary_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.salary
    ADD CONSTRAINT salary_pkey PRIMARY KEY (emp_no);


--
-- TOC entry 2711 (class 2606 OID 32831)
-- Name: manager manager_dept_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.manager
    ADD CONSTRAINT manager_dept_no_fkey FOREIGN KEY (dept_no) REFERENCES public.department(dept_no);


-- Completed on 2020-07-12 07:43:27

--
-- PostgreSQL database dump complete
--

