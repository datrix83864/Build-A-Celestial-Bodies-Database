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
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    blackhole_observed boolean,
    distance_in_ly numeric(4,1),
    cluster character varying(30),
    approaching boolean
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
-- Name: lifeforms; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.lifeforms (
    name character varying(30) NOT NULL,
    homeplanet integer,
    spacefaring boolean,
    lifeforms_id integer NOT NULL,
    planets_infected integer
);


ALTER TABLE public.lifeforms OWNER TO freecodecamp;

--
-- Name: lifeforms_lifeforms_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.lifeforms_lifeforms_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.lifeforms_lifeforms_id_seq OWNER TO freecodecamp;

--
-- Name: lifeforms_lifeforms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.lifeforms_lifeforms_id_seq OWNED BY public.lifeforms.lifeforms_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    name character varying(30) NOT NULL,
    planet_id integer NOT NULL,
    moon_id integer NOT NULL,
    inhabitable boolean,
    explored_human_or_close_satellite boolean
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    name character varying(30) NOT NULL,
    star_id integer NOT NULL,
    planet_id integer NOT NULL,
    habitable boolean,
    type character varying(30),
    description text,
    size numeric(4,1)
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    name character varying(30) NOT NULL,
    star_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    type character varying(30),
    distance_in_ly numeric(4,1),
    num_planets_observed integer
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
-- Name: lifeforms lifeforms_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.lifeforms ALTER COLUMN lifeforms_id SET DEFAULT nextval('public.lifeforms_lifeforms_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Milky Way', 1, true, 0.0, 'Laniakea Supercluster', false);
INSERT INTO public.galaxy VALUES ('Andromeda Galaxy', 2, false, 100.0, 'Milky Way', false);
INSERT INTO public.galaxy VALUES ('Canis Major Dwarf Galaxy', 3, false, 200.0, 'Laniaka Supercluster', false);
INSERT INTO public.galaxy VALUES ('Cygnus A', 4, false, 300.0, 'Laniaka Supercluster', false);
INSERT INTO public.galaxy VALUES ('Maffei I', 5, false, 400.0, 'Laniaka Supercluster', false);
INSERT INTO public.galaxy VALUES ('Maffei II', 6, false, 500.0, 'Laniaka Supercluster', false);


--
-- Data for Name: lifeforms; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.lifeforms VALUES ('Human', 15, true, 1, NULL);
INSERT INTO public.lifeforms VALUES ('Martian', 16, false, 2, NULL);
INSERT INTO public.lifeforms VALUES ('Borg', 28, true, 3, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Earths Moon', 15, 23, false, true);
INSERT INTO public.moon VALUES ('Phobos', 16, 24, false, false);
INSERT INTO public.moon VALUES ('Deimos', 16, 25, false, false);
INSERT INTO public.moon VALUES ('Io', 19, 26, false, false);
INSERT INTO public.moon VALUES ('Europa', 19, 27, true, false);
INSERT INTO public.moon VALUES ('Ganymede', 19, 28, false, false);
INSERT INTO public.moon VALUES ('Callisto', 19, 29, false, false);
INSERT INTO public.moon VALUES ('Enceladus', 20, 30, false, false);
INSERT INTO public.moon VALUES ('Titan', 20, 31, true, false);
INSERT INTO public.moon VALUES ('Ariel', 21, 32, false, false);
INSERT INTO public.moon VALUES ('Galatea', 22, 33, false, false);
INSERT INTO public.moon VALUES ('Halimede', 22, 34, false, false);
INSERT INTO public.moon VALUES ('Hippocamp', 22, 35, false, false);
INSERT INTO public.moon VALUES ('Triton', 22, 36, false, false);
INSERT INTO public.moon VALUES ('Thalassa', 22, 37, false, false);
INSERT INTO public.moon VALUES ('Sao', 22, 38, false, false);
INSERT INTO public.moon VALUES ('Psamathe', 22, 39, false, false);
INSERT INTO public.moon VALUES ('Proteus', 22, 40, false, false);
INSERT INTO public.moon VALUES ('Neso', 22, 41, false, false);
INSERT INTO public.moon VALUES ('Nereid', 22, 42, false, false);
INSERT INTO public.moon VALUES ('Naiad', 22, 43, false, false);
INSERT INTO public.moon VALUES ('Larissa', 22, 44, false, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Earth', 1, 15, true, 'M', 'Home to creatures that call themselves humans', 1.0);
INSERT INTO public.planet VALUES ('Mars', 1, 16, false, 'terrestrial', 'red', 1.0);
INSERT INTO public.planet VALUES ('Mercury', 1, 17, false, 'terrestrial', 'small', 1.0);
INSERT INTO public.planet VALUES ('Venus', 1, 18, false, 'terrestrial', 'acidic', 1.0);
INSERT INTO public.planet VALUES ('Jupiter', 1, 19, false, 'gas giant', 'gassy', 100.0);
INSERT INTO public.planet VALUES ('Saturn', 1, 20, false, 'gas giant', 'really gassy', 250.0);
INSERT INTO public.planet VALUES ('Uranus', 1, 21, false, 'gas', 'smaller gas', 30.0);
INSERT INTO public.planet VALUES ('Neptune', 1, 22, false, 'gas', 'cold', 15.0);
INSERT INTO public.planet VALUES ('Pluto', 1, 23, false, 'dwarf', 'Because it should be', 0.3);
INSERT INTO public.planet VALUES ('Proxima Centauri b', 2, 24, true, 'super Earth', 'fast years', 1.1);
INSERT INTO public.planet VALUES ('Epsilon Eridani b', 7, 25, false, 'gas giant', 'slow', 0.7);
INSERT INTO public.planet VALUES ('GJ 887 b', 8, 26, true, 'super Earth', 'fast years', 4.2);
INSERT INTO public.planet VALUES ('GJ 887 c', 8, 27, false, 'Neptune-like', 'close to the star', 7.6);
INSERT INTO public.planet VALUES ('Ross 128 b', 9, 28, true, 'super Earth', 'rocky', 1.4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('Sun', 1, 1, 'yellow', 0.0, 8);
INSERT INTO public.star VALUES ('Proxima Centauri', 2, 1, 'white', 4.2, 0);
INSERT INTO public.star VALUES ('Rigil Kentaurus', 3, 1, 'white', 4.4, 0);
INSERT INTO public.star VALUES ('Toliman', 4, 1, 'white', 4.4, 0);
INSERT INTO public.star VALUES ('Barnards Star', 5, 1, 'white', 6.0, 0);
INSERT INTO public.star VALUES ('Luhman 16A', 6, 1, 'white', 6.5, 0);
INSERT INTO public.star VALUES ('Epsilon Eridani', 7, 1, 'M', 8.0, 1);
INSERT INTO public.star VALUES ('GJ 887', 8, 1, 'M', 9.0, 2);
INSERT INTO public.star VALUES ('Ross 128', 9, 1, 'M', 10.0, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: lifeforms_lifeforms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.lifeforms_lifeforms_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 44, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 28, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 9, true);


--
-- Name: galaxy distance; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT distance UNIQUE (distance_in_ly);


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
-- Name: lifeforms lifeforms_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.lifeforms
    ADD CONSTRAINT lifeforms_pkey PRIMARY KEY (lifeforms_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


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
-- Name: lifeforms lifeforms_homeplanet_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.lifeforms
    ADD CONSTRAINT lifeforms_homeplanet_fkey FOREIGN KEY (homeplanet) REFERENCES public.planet(planet_id);


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

