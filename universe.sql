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
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    description text,
    is_spherical boolean,
    has_life boolean,
    mass integer,
    age_in_millions_of_years integer,
    distance_from_the_earth numeric
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
-- Name: galaxy_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_type (
    galaxy_type_id integer NOT NULL,
    galaxy_id integer,
    type character varying(40),
    name character varying(40) NOT NULL
);


ALTER TABLE public.galaxy_type OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_type_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_type_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_type_galaxy_type_id_seq OWNED BY public.galaxy_type.galaxy_type_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    planet_id integer,
    name character varying(40) NOT NULL,
    description text,
    mass integer,
    age_in_millions_of_years integer,
    distance_from_planet numeric,
    radius integer,
    atmosphere text
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
    planet_id integer NOT NULL,
    star_id integer,
    name character varying(40) NOT NULL,
    description text,
    mass integer,
    age_in_millions_of_years integer,
    distance_from_the_star numeric
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_type (
    planet_type_id integer NOT NULL,
    planet_id integer,
    type character varying(40),
    name character varying(40) NOT NULL
);


ALTER TABLE public.planet_type OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_type_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_type_planet_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_type_planet_type_id_seq OWNED BY public.planet_type.planet_type_id;


--
-- Name: planets_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planets_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planets_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planets_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planets_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer,
    name character varying(40) NOT NULL,
    description text,
    temperature integer,
    magnitude numeric
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
-- Name: galaxy_type galaxy_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type ALTER COLUMN galaxy_type_id SET DEFAULT nextval('public.galaxy_type_galaxy_type_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planets_planet_id_seq'::regclass);


--
-- Name: planet_type planet_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type ALTER COLUMN planet_type_id SET DEFAULT nextval('public.planet_type_planet_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'The Andromeda Galaxy is a spiral galaxy...', true, false, 50000000, 10000, 25000);
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 'The Milky Way is a barred spiral galaxy...', true, false, 40000000, 12000, 0);
INSERT INTO public.galaxy VALUES (3, 'Whirlpool Galaxy', 'The Whirlpool Galaxy is a spiral galaxy...', true, false, 30000000, 8000, 23000);
INSERT INTO public.galaxy VALUES (4, 'Sombrero Galaxy', 'The Sombrero Galaxy is a spiral galaxy...', true, false, 25000000, 6000, 27000);
INSERT INTO public.galaxy VALUES (5, 'Pinwheel Galaxy', 'The Pinwheel Galaxy is a spiral galaxy...', true, false, 20000000, 5000, 24000);
INSERT INTO public.galaxy VALUES (6, 'Black Eye Galaxy', 'The Black Eye Galaxy is a spiral galaxy...', true, false, 18000000, 4000, 22000);
INSERT INTO public.galaxy VALUES (7, 'Cigar Galaxy', 'The Cigar Galaxy is a spiral galaxy...', true, false, 15000000, 3000, 21000);
INSERT INTO public.galaxy VALUES (8, 'Tadpole Galaxy', 'The Tadpole Galaxy is a spiral galaxy...', true, false, 10000000, 2000, 28000);
INSERT INTO public.galaxy VALUES (9, 'Cartwheel Galaxy', 'The Cartwheel Galaxy is a spiral galaxy...', true, false, 9000000, 1500, 30000);
INSERT INTO public.galaxy VALUES (10, 'Sunflower Galaxy', 'The Sunflower Galaxy is a spiral galaxy...', true, false, 8000000, 1000, 26000);
INSERT INTO public.galaxy VALUES (11, 'Butterfly Galaxy', 'The Butterfly Galaxy is a spiral galaxy...', true, false, 7000000, 800, 29000);
INSERT INTO public.galaxy VALUES (12, 'Sculptor Galaxy', 'The Sculptor Galaxy is a spiral galaxy...', true, false, 6000000, 600, 27000);
INSERT INTO public.galaxy VALUES (13, 'Leo Triplet', 'The Leo Triplet is a group of three galaxies...', false, false, 0, 0, 34000);
INSERT INTO public.galaxy VALUES (14, 'Fornax Cluster', 'The Fornax Cluster is a cluster of galaxies...', false, false, 0, 0, 38000);
INSERT INTO public.galaxy VALUES (15, 'Hickson Compact Group 7', 'Hickson Compact Group 7 is a group of galaxies...', false, false, 0, 0, 42000);
INSERT INTO public.galaxy VALUES (16, 'Virgo Cluster', 'The Virgo Cluster is a cluster of galaxies...', false, false, 0, 0, 50000);
INSERT INTO public.galaxy VALUES (17, 'Coma Cluster', 'The Coma Cluster is a cluster of galaxies...', false, false, 0, 0, 60000);
INSERT INTO public.galaxy VALUES (18, 'Abell 2744', 'Abell 2744 is a massive galaxy cluster...', false, false, 0, 0, 70000);
INSERT INTO public.galaxy VALUES (19, 'Perseus Cluster', 'The Perseus Cluster is a massive galaxy cluster...', false, false, 0, 0, 80000);


--
-- Data for Name: galaxy_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_type VALUES (1, 2, 'Active Galaxy', 'Terrestial');
INSERT INTO public.galaxy_type VALUES (2, 1, 'Lenticular', 'Anisterial');
INSERT INTO public.galaxy_type VALUES (3, 3, 'Spiral', 'Aquatic');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 1, 'Luna', 'Earths natural satellite', 7, 4500, 384400, 1737, 'None');
INSERT INTO public.moon VALUES (5, 5, 'Phobos', 'Marss moon', 1, 4500, 9376, 11, 'None');
INSERT INTO public.moon VALUES (10, 7, 'Ariel', 'Uranuss moon', 3, 4500, 190900, 579, 'Thin atmosphere of carbon dioxide');
INSERT INTO public.moon VALUES (52, 2, 'Kudan', 'Earths natural satellite', 7, 4500, 384400, 1737, 'None');
INSERT INTO public.moon VALUES (53, 4, 'Europah', 'Jupiters moon', 4, 4500, 67500, 1560, 'Thin atmosphere of oxygen');
INSERT INTO public.moon VALUES (54, 4, 'Ganymedee', 'Neptunes moon', 8, 4400, 1070400, 2634, 'Thin atmosphere of oxygen');
INSERT INTO public.moon VALUES (55, 4, 'Callistoo', 'Jupiters moon', 5, 4500, 1882700, 2410, 'Thin atmosphere of lithium');
INSERT INTO public.moon VALUES (56, 5, 'Lotosi', 'Marss moon', 1, 4500, 9376, 11, 'None');
INSERT INTO public.moon VALUES (57, 3, 'Deimosi', 'Marss moon', 2, 4500, 23463, 8, 'None');
INSERT INTO public.moon VALUES (58, 6, 'Titanic', 'Artic moon', 14, 4500, 1221870, 2575, 'None');
INSERT INTO public.moon VALUES (59, 6, 'Iapetuse', 'Saturns moon', 3, 4500, 3560820, 736, 'Thin atmosphere of carbon dioxide');
INSERT INTO public.moon VALUES (60, 7, 'Mirandan', 'Uranuss moon', 1, 4500, 129900, 240, 'Thin atmosphere of carbon dioxide');
INSERT INTO public.moon VALUES (61, 9, 'Ajaxi', 'Uranuss moon', 3, 4430, 190900, 579, 'Thin atmosphere of sulphur');
INSERT INTO public.moon VALUES (62, 7, 'Umbrieli', 'Uranuss moon', 2, 4500, 25000, 584, 'Thin atmosphere of carbon dioxide');
INSERT INTO public.moon VALUES (63, 7, 'Titaniani', 'Uranuss moon', 5, 4500, 436300, 788, 'Thin atmosphere of carbon dioxide');
INSERT INTO public.moon VALUES (64, 7, 'Oberons', 'Uranuss moon', 4, 4500, 583500, 761, 'Thin atmosphere of oxygen');
INSERT INTO public.moon VALUES (65, 8, 'Tritonik', 'Neptunes moon', 6, 4500, 354759, 1353, 'Thin atmosphere of nitrogen');
INSERT INTO public.moon VALUES (66, 8, 'Charonia', 'Plutos moon', 1, 4500, 19591, 606, 'Thin atmosphere of nitrogen');
INSERT INTO public.moon VALUES (67, 9, 'Haumean', 'Dwarf planet', 1, 4500, 64888, 620, 'None');
INSERT INTO public.moon VALUES (68, 10, 'Metanoicas', 'Candy Ceuch', 2, 4900, 74893, 453, 'None');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Mercury', 'Small rocky planet closest to the Sun', 33, 4500, 57.9);
INSERT INTO public.planet VALUES (2, 1, 'Venus', 'Similar in size and composition to Earth', 487, 4000, 108.2);
INSERT INTO public.planet VALUES (3, 2, 'Earth', 'Our home planet', 597, 4500, 149.6);
INSERT INTO public.planet VALUES (4, 2, 'Mars', 'Red planet with thin atmosphere', 63, 3500, 227.9);
INSERT INTO public.planet VALUES (5, 3, 'Jupiter', 'Giant gas planet with many moons', 1890, 5000, 778.5);
INSERT INTO public.planet VALUES (6, 3, 'Saturn', 'Known for its rings and large number of moons', 56800, 4500, 1434.0);
INSERT INTO public.planet VALUES (7, 4, 'Uranus', 'Ice giant with unique tilted axis of rotation', 86800, 4000, 2871.0);
INSERT INTO public.planet VALUES (8, 4, 'Neptune', 'Another ice giant with strong winds and storms', 10200, 4500, 4495.0);
INSERT INTO public.planet VALUES (9, 1, 'Pluto', 'Dwarf planet in the Kuiper belt', 131, 2000, 5906.4);
INSERT INTO public.planet VALUES (10, 2, 'Ceres', 'Dwarf planet and largest object in the asteroid belt', 9390, 1000, 413.8);
INSERT INTO public.planet VALUES (11, 3, 'Eris', 'Dwarf planet in the scattered disc region of the solar system', 167000, 3000, 96.4);
INSERT INTO public.planet VALUES (12, 4, 'Haumea', 'Dwarf planet in the Kuiper belt with elongated shape', 40100, 1500, 6483.6);
INSERT INTO public.planet VALUES (13, 1, 'Makemake', 'Dwarf planet in the Kuiper belt with reddish surface', 31400, 2500, 6859.7);
INSERT INTO public.planet VALUES (14, 2, 'Ganymede', 'Largest moon of Jupiter and in the solar system', 14800, 2000, 1070.4);
INSERT INTO public.planet VALUES (15, 3, 'Titan', 'Largest moon of Saturn and with thick atmosphere', 13500, 3000, 1221.8);
INSERT INTO public.planet VALUES (16, 4, 'Callisto', 'Large moon of Jupiter with ancient surface', 10800, 2500, 1882.7);


--
-- Data for Name: planet_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_type VALUES (2, 4, 'Jupiter', 'Anisterial');
INSERT INTO public.planet_type VALUES (3, 8, 'Mars', 'Aquatic');
INSERT INTO public.planet_type VALUES (4, 2, 'Active Galaxy', 'Terrestial');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Star1', 'Description1', 4000, -5.7);
INSERT INTO public.star VALUES (2, 2, 'Star2', 'Description2', 5500, 3.2);
INSERT INTO public.star VALUES (3, 3, 'Star3', 'Description3', 3000, -9.1);
INSERT INTO public.star VALUES (4, 4, 'Star4', 'Description4', 6000, 6.8);
INSERT INTO public.star VALUES (5, 5, 'Star5', 'Description5', 4500, 0.3);
INSERT INTO public.star VALUES (6, 1, 'Star6', 'Description6', 4100, -4.5);
INSERT INTO public.star VALUES (7, 2, 'Star7', 'Description7', 5600, 2.1);
INSERT INTO public.star VALUES (8, 3, 'Star8', 'Description8', 3100, -8.3);
INSERT INTO public.star VALUES (9, 4, 'Star9', 'Description9', 6100, 7.6);
INSERT INTO public.star VALUES (10, 5, 'Star10', 'Description10', 4600, -1.8);
INSERT INTO public.star VALUES (11, 1, 'Star11', 'Description11', 4200, -6.9);
INSERT INTO public.star VALUES (12, 2, 'Star12', 'Description12', 5700, 4.4);
INSERT INTO public.star VALUES (13, 3, 'Star13', 'Description13', 3200, -7.2);
INSERT INTO public.star VALUES (14, 4, 'Star14', 'Description14', 6200, 5.9);
INSERT INTO public.star VALUES (15, 5, 'Star15', 'Description15', 4700, -0.5);
INSERT INTO public.star VALUES (16, 1, 'Star16', 'Description16', 4300, -3.1);
INSERT INTO public.star VALUES (17, 2, 'Star17', 'Description17', 5800, 1.6);
INSERT INTO public.star VALUES (18, 3, 'Star18', 'Description18', 3300, -5.4);
INSERT INTO public.star VALUES (19, 4, 'Star19', 'Description19', 6300, 4.1);
INSERT INTO public.star VALUES (20, 5, 'Star20', 'Description20', 4800, -2.4);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 19, true);


--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_type_galaxy_type_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 68, true);


--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_type_planet_type_id_seq', 6, true);


--
-- Name: planets_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planets_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 20, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_type galaxy_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_name_key UNIQUE (name);


--
-- Name: galaxy_type galaxy_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_pkey PRIMARY KEY (galaxy_type_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet_type planet_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_name_key UNIQUE (name);


--
-- Name: planet_type planet_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_pkey PRIMARY KEY (planet_type_id);


--
-- Name: planet planets_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planets_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy_type galaxy_type_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet_type planet_type_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planets_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planets_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

