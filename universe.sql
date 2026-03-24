--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
    name character varying(50) NOT NULL,
    description text,
    age_in_million_years integer NOT NULL,
    has_life boolean DEFAULT false
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
    name character varying(50) NOT NULL,
    description text,
    is_spherical boolean DEFAULT true,
    distance_from_orbiting_planet_in_km numeric(120,1),
    planet_id integer NOT NULL
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
    name character varying(50) NOT NULL,
    description text,
    has_life boolean DEFAULT false,
    distance_from_earth_in_million_km integer NOT NULL,
    star_id integer NOT NULL
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
-- Name: planet_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_type (
    planet_type_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text
);


ALTER TABLE public.planet_type OWNER TO freecodecamp;

--
-- Name: planet_type_planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_type_planet (
    planet_type_planet_id integer NOT NULL,
    planet_id integer NOT NULL,
    planet_type_id integer NOT NULL,
    name character varying(50)
);


ALTER TABLE public.planet_type_planet OWNER TO freecodecamp;

--
-- Name: planet_type_planet_planet_type_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_type_planet_planet_type_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_type_planet_planet_type_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_type_planet_planet_type_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_type_planet_planet_type_planet_id_seq OWNED BY public.planet_type_planet.planet_type_planet_id;


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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    distance_from_earth_in_million_km integer NOT NULL,
    is_spherical boolean DEFAULT true,
    age_in_million_years integer NOT NULL,
    galaxy_id integer NOT NULL
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
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_type planet_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type ALTER COLUMN planet_type_id SET DEFAULT nextval('public.planet_type_planet_type_id_seq'::regclass);


--
-- Name: planet_type_planet planet_type_planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type_planet ALTER COLUMN planet_type_planet_id SET DEFAULT nextval('public.planet_type_planet_planet_type_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy, a barred spiral galaxy', 13600, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest major galaxy, will collide with Milky Way in ~4.5 billion years', 10000, false);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Third-largest galaxy in our Local Group', 5000, false);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'Galaxy with a bright nucleus and large central bulge', 8000, false);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Classic spiral galaxy, famous for its well-defined arms', 400, false);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 'Face-on spiral galaxy in the constellation Ursa Major', 2300, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Earth''s only natural satellite', true, 123123.5, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Larger moon of Mars, irregularly shaped', false, 101.0, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Smaller moon of Mars', false, 10.1, 4);
INSERT INTO public.moon VALUES (4, 'Io', 'Most volcanically active body in the solar system', true, 123123.5, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 'Ice-covered moon, possible subsurface ocean', true, 123123.5, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'Largest moon in the solar system', true, 123123.5, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 'Heavily cratered moon of Jupiter', true, 123123.5, 5);
INSERT INTO public.moon VALUES (8, 'Titan', 'Saturn''s largest moon, has thick atmosphere', true, 123123.5, 6);
INSERT INTO public.moon VALUES (9, 'Enceladus', 'Active geysers, possible subsurface ocean', true, 123123.5, 6);
INSERT INTO public.moon VALUES (10, 'Mimas', 'Known for its large crater making it look like Death Star', true, 123123.5, 6);
INSERT INTO public.moon VALUES (11, 'Rhea', 'Second-largest moon of Saturn', true, 123123.5, 6);
INSERT INTO public.moon VALUES (12, 'Iapetus', 'Two-toned moon with bright and dark hemispheres', true, 123123.5, 6);
INSERT INTO public.moon VALUES (13, 'Miranda', 'Moon with chaotic surface terrain', true, 123123.5, 7);
INSERT INTO public.moon VALUES (14, 'Ariel', 'Brightest moon of Uranus', true, 123123.5, 7);
INSERT INTO public.moon VALUES (15, 'Umbriel', 'Darkest moon of Uranus', true, 123123.5, 7);
INSERT INTO public.moon VALUES (16, 'Titania', 'Largest moon of Uranus', true, 123123.5, 7);
INSERT INTO public.moon VALUES (17, 'Oberon', 'Outermost major moon of Uranus', true, 123123.5, 7);
INSERT INTO public.moon VALUES (18, 'Triton', 'Largest moon of Neptune, orbits backwards', true, 123123.5, 8);
INSERT INTO public.moon VALUES (19, 'Nereid', 'Moon with highly eccentric orbit', true, 123123.5, 8);
INSERT INTO public.moon VALUES (20, 'Charon', 'Large moon of Pluto (technically a dwarf planet moon)', true, 123123.5, 4);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Smallest planet, closest to the Sun', false, 0, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'Hottest planet, thick toxic atmosphere', false, 0, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'Our home planet, only known planet with life', true, 0, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'The Red Planet, potential for human colonization', false, 0, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Largest planet, famous for its Great Red Spot', false, 0, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Known for its spectacular ring system', false, 0, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Ice giant that rotates on its side', false, 0, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Windiest planet, deep blue color', false, 0, 1);
INSERT INTO public.planet VALUES (9, 'Proxima b', 'Exoplanet orbiting Proxima Centauri', false, 4, 2);
INSERT INTO public.planet VALUES (10, 'Proxima c', 'Second planet in Proxima Centauri system', false, 4, 2);
INSERT INTO public.planet VALUES (11, 'Alpha Centauri Bb', 'Possible exoplanet in Alpha Centauri', false, 4, 6);
INSERT INTO public.planet VALUES (12, 'Kepler-442b', 'Potentially habitable exoplanet', false, 1206, 3);


--
-- Data for Name: planet_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_type VALUES (1, 'Terrestrial', 'Rocky planets');
INSERT INTO public.planet_type VALUES (2, 'Gas Giant', 'Large gaseous planets');
INSERT INTO public.planet_type VALUES (3, 'Ice Giant', 'Planets with icy compositions');


--
-- Data for Name: planet_type_planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_type_planet VALUES (1, 1, 1, NULL);
INSERT INTO public.planet_type_planet VALUES (2, 2, 1, NULL);
INSERT INTO public.planet_type_planet VALUES (3, 3, 1, NULL);
INSERT INTO public.planet_type_planet VALUES (4, 4, 1, NULL);
INSERT INTO public.planet_type_planet VALUES (5, 5, 2, NULL);
INSERT INTO public.planet_type_planet VALUES (6, 6, 2, NULL);
INSERT INTO public.planet_type_planet VALUES (7, 7, 3, NULL);
INSERT INTO public.planet_type_planet VALUES (8, 8, 3, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'Proxima Centauri', 4, true, 4850, 1);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 642, true, 8, 1);
INSERT INTO public.star VALUES (4, 'Sirius', 8, true, 242, 1);
INSERT INTO public.star VALUES (5, 'Polaris', 433, true, 70, 1);
INSERT INTO public.star VALUES (6, 'Alpha Centauri A', 5, true, 5000, 1);
INSERT INTO public.star VALUES (1, 'Sun', 1, true, 4600, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: planet_type_planet_planet_type_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_type_planet_planet_type_planet_id_seq', 8, true);


--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_type_planet_type_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


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
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


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
-- Name: planet_type_planet planet_type_planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type_planet
    ADD CONSTRAINT planet_type_planet_name_key UNIQUE (name);


--
-- Name: planet_type_planet planet_type_planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type_planet
    ADD CONSTRAINT planet_type_planet_pkey PRIMARY KEY (planet_type_planet_id);


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
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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
-- Name: planet_type_planet planet_type_planet_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type_planet
    ADD CONSTRAINT planet_type_planet_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet_type_planet planet_type_planet_planet_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type_planet
    ADD CONSTRAINT planet_type_planet_planet_type_id_fkey FOREIGN KEY (planet_type_id) REFERENCES public.planet_type(planet_type_id);


--
-- PostgreSQL database dump complete
--

