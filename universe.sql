--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying(30),
    galaxy_id integer NOT NULL,
    type character varying(30),
    diameter_lightyears integer NOT NULL,
    solar_mass numeric
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30),
    has_atmosphere boolean,
    discovery text,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    name character varying(30),
    diameter_km integer,
    star_id integer NOT NULL,
    color character varying(10),
    planet_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: species; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.species (
    species_id integer NOT NULL,
    name character varying(15),
    category character varying(15),
    planet_id integer NOT NULL
);


ALTER TABLE public.species OWNER TO freecodecamp;

--
-- Name: species_species_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.species_species_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.species_species_id_seq OWNER TO freecodecamp;

--
-- Name: species_species_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.species_species_id_seq OWNED BY public.species.species_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    name character varying(30),
    alive boolean,
    galaxy_id integer NOT NULL,
    star_id integer NOT NULL,
    distance_ly numeric
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: species species_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.species ALTER COLUMN species_id SET DEFAULT nextval('public.species_species_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Milchstraße', 1, 'Balkenspiralgalaxie', 120000, 1500000000);
INSERT INTO public.galaxy VALUES ('Andromedagalaxie', 2, 'Spiralgalaxie', 200000, 2500000000000);
INSERT INTO public.galaxy VALUES ('Sagittarius', 3, 'Zwerggalaxie', 1, 45000000);
INSERT INTO public.galaxy VALUES ('Centaurus A', 4, 'Elliptische Galaxie', 70000, 1000000000000);
INSERT INTO public.galaxy VALUES ('M87', 5, 'Elliptische Galaxie', 120000, 2300000000000);
INSERT INTO public.galaxy VALUES ('Dreiecksnebel', 6, 'Spiralgalaxie', 50000, 600000000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Erdmond', false, 'Discovery Text Erdmond', 1);
INSERT INTO public.moon VALUES (2, 'Europa', false, 'Discovery Text Europa', 2);
INSERT INTO public.moon VALUES (3, 'Enceladus', false, 'Discovery Text Enceladus', 3);
INSERT INTO public.moon VALUES (4, 'Deimos', true, 'Discovery Text Deimos', 4);
INSERT INTO public.moon VALUES (5, 'Ganymed', false, 'Discovery Text Ganymed', 5);
INSERT INTO public.moon VALUES (6, 'Titan', true, 'Discovery Text Titan', 6);
INSERT INTO public.moon VALUES (7, 'Triton', false, 'Discovery Text Triton', 7);
INSERT INTO public.moon VALUES (8, 'Phobos', false, 'Discovery Text Phobos', 8);
INSERT INTO public.moon VALUES (9, 'Io', false, 'Discovery Text Io', 9);
INSERT INTO public.moon VALUES (10, 'Callisto', true, 'Discovery Text Callisto', 10);
INSERT INTO public.moon VALUES (11, 'Charon', false, 'Discovery Text Charon', 11);
INSERT INTO public.moon VALUES (12, 'Mimas', true, 'Discovery Text Mimas', 12);
INSERT INTO public.moon VALUES (13, 'Io', false, 'Discovery Text Io', 2);
INSERT INTO public.moon VALUES (14, 'Ganymed', true, 'Discovery Text Ganymed', 3);
INSERT INTO public.moon VALUES (15, 'Titan', false, 'Discovery Text Titan', 4);
INSERT INTO public.moon VALUES (16, 'Phobos', false, 'Discovery Text Phobos', 5);
INSERT INTO public.moon VALUES (17, 'Callisto', false, 'Discovery Text Callisto', 6);
INSERT INTO public.moon VALUES (18, 'Mimas', false, 'Discovery Text Mimas', 7);
INSERT INTO public.moon VALUES (19, 'Charon', true, 'Discovery Text Charon', 8);
INSERT INTO public.moon VALUES (20, 'Oberon', false, 'Discovery Text Oberon', 9);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Erde', 127000, 1, 'blue', 1);
INSERT INTO public.planet VALUES ('Erde_Centauri', 2540000, 2, 'red', 2);
INSERT INTO public.planet VALUES ('Erde_Stephenson', 52300000, 3, 'yellow', 3);
INSERT INTO public.planet VALUES ('Erde_SN1885A', 23000, 4, 'blue', 4);
INSERT INTO public.planet VALUES ('Erde_Andromeda', 23800000, 5, 'green', 5);
INSERT INTO public.planet VALUES ('Erde_Sagittarius', 23000000, 6, 'pink', 6);
INSERT INTO public.planet VALUES ('Mars', 6800, 1, 'orange', 7);
INSERT INTO public.planet VALUES ('Mars_Centauri', 27840000, 2, 'red', 8);
INSERT INTO public.planet VALUES ('Mars_Stephenson', 5200000, 3, 'yellow', 9);
INSERT INTO public.planet VALUES ('Mars_SN1885A', 2300000, 4, 'blue', 10);
INSERT INTO public.planet VALUES ('Mars_Andromeda', 22300000, 5, 'green', 11);
INSERT INTO public.planet VALUES ('Mars_Sagittarius', 8000000, 6, 'pink', 12);


--
-- Data for Name: species; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.species VALUES (1, 'Mensch', 'Säugetier', 1);
INSERT INTO public.species VALUES (2, 'Bienen', 'Insekten', 1);
INSERT INTO public.species VALUES (3, 'Biwoks', 'Aliens', 7);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('Sonne', true, 1, 1, 0.00001536842);
INSERT INTO public.star VALUES ('Alpha Centauri', true, 4, 2, 4.34);
INSERT INTO public.star VALUES ('Stephenson', true, 1, 3, 20000);
INSERT INTO public.star VALUES ('SN 1885A', false, 2, 4, 50000000);
INSERT INTO public.star VALUES ('Andromeda I und II', false, 2, 5, 60000000);
INSERT INTO public.star VALUES ('Sagittarius Stream', true, 3, 6, 80000000);
INSERT INTO public.star VALUES ('Dwarf Globular Clusters', true, 3, 7, 7000000);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: species_species_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.species_species_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_moon_id_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key1 UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: species species_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.species
    ADD CONSTRAINT species_pkey PRIMARY KEY (species_id);


--
-- Name: species species_species_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.species
    ADD CONSTRAINT species_species_id_key UNIQUE (species_id);


--
-- Name: species species_species_id_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.species
    ADD CONSTRAINT species_species_id_key1 UNIQUE (species_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

