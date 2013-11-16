--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(75) NOT NULL,
    password character varying(128) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    is_superuser boolean NOT NULL,
    last_login timestamp with time zone NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    user_id integer NOT NULL,
    content_type_id integer,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_flatpage; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE django_flatpage (
    id integer NOT NULL,
    url character varying(100) NOT NULL,
    title character varying(200) NOT NULL,
    content text NOT NULL,
    enable_comments boolean NOT NULL,
    template_name character varying(70) NOT NULL,
    registration_required boolean NOT NULL
);


ALTER TABLE public.django_flatpage OWNER TO postgres;

--
-- Name: django_flatpage_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_flatpage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_flatpage_id_seq OWNER TO postgres;

--
-- Name: django_flatpage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_flatpage_id_seq OWNED BY django_flatpage.id;


--
-- Name: django_flatpage_sites; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE django_flatpage_sites (
    id integer NOT NULL,
    flatpage_id integer NOT NULL,
    site_id integer NOT NULL
);


ALTER TABLE public.django_flatpage_sites OWNER TO postgres;

--
-- Name: django_flatpage_sites_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_flatpage_sites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_flatpage_sites_id_seq OWNER TO postgres;

--
-- Name: django_flatpage_sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_flatpage_sites_id_seq OWNED BY django_flatpage_sites.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO postgres;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO postgres;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_site_id_seq OWNED BY django_site.id;


--
-- Name: redpepp_client; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE redpepp_client (
    id integer NOT NULL,
    title character varying(250) NOT NULL,
    description text NOT NULL,
    image character varying(100),
    number integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    active boolean NOT NULL
);


ALTER TABLE public.redpepp_client OWNER TO postgres;

--
-- Name: redpepp_client_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE redpepp_client_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.redpepp_client_id_seq OWNER TO postgres;

--
-- Name: redpepp_client_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE redpepp_client_id_seq OWNED BY redpepp_client.id;


--
-- Name: redpepp_new; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE redpepp_new (
    id integer NOT NULL,
    datetime timestamp with time zone NOT NULL,
    title character varying(250) NOT NULL,
    text text NOT NULL,
    number integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    active boolean NOT NULL
);


ALTER TABLE public.redpepp_new OWNER TO postgres;

--
-- Name: redpepp_new_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE redpepp_new_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.redpepp_new_id_seq OWNER TO postgres;

--
-- Name: redpepp_new_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE redpepp_new_id_seq OWNED BY redpepp_new.id;


--
-- Name: redpepp_order; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE redpepp_order (
    id integer NOT NULL,
    name character varying(250) NOT NULL,
    email character varying(250) NOT NULL,
    tariff_id integer NOT NULL,
    message text NOT NULL,
    created timestamp with time zone NOT NULL
);


ALTER TABLE public.redpepp_order OWNER TO postgres;

--
-- Name: redpepp_order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE redpepp_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.redpepp_order_id_seq OWNER TO postgres;

--
-- Name: redpepp_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE redpepp_order_id_seq OWNED BY redpepp_order.id;


--
-- Name: redpepp_project; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE redpepp_project (
    id integer NOT NULL,
    title character varying(250) NOT NULL,
    caption text NOT NULL,
    text text NOT NULL,
    client_id integer NOT NULL,
    url character varying(200),
    number integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    active boolean NOT NULL
);


ALTER TABLE public.redpepp_project OWNER TO postgres;

--
-- Name: redpepp_project_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE redpepp_project_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.redpepp_project_id_seq OWNER TO postgres;

--
-- Name: redpepp_project_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE redpepp_project_id_seq OWNED BY redpepp_project.id;


--
-- Name: redpepp_projectimage; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE redpepp_projectimage (
    id integer NOT NULL,
    project_id integer NOT NULL,
    image character varying(100),
    number integer NOT NULL,
    description text,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL
);


ALTER TABLE public.redpepp_projectimage OWNER TO postgres;

--
-- Name: redpepp_projectimage_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE redpepp_projectimage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.redpepp_projectimage_id_seq OWNER TO postgres;

--
-- Name: redpepp_projectimage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE redpepp_projectimage_id_seq OWNED BY redpepp_projectimage.id;


--
-- Name: redpepp_tariff; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE redpepp_tariff (
    id integer NOT NULL,
    title character varying(250) NOT NULL,
    description text NOT NULL,
    image character varying(100),
    price integer NOT NULL,
    number integer NOT NULL,
    active boolean NOT NULL
);


ALTER TABLE public.redpepp_tariff OWNER TO postgres;

--
-- Name: redpepp_tariff_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE redpepp_tariff_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.redpepp_tariff_id_seq OWNER TO postgres;

--
-- Name: redpepp_tariff_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE redpepp_tariff_id_seq OWNED BY redpepp_tariff.id;


--
-- Name: redpepp_worker; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE redpepp_worker (
    id integer NOT NULL,
    name character varying(250) NOT NULL,
    nick character varying(250),
    email character varying(75),
    about text NOT NULL,
    photo character varying(100),
    number integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    active boolean NOT NULL
);


ALTER TABLE public.redpepp_worker OWNER TO postgres;

--
-- Name: redpepp_worker_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE redpepp_worker_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.redpepp_worker_id_seq OWNER TO postgres;

--
-- Name: redpepp_worker_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE redpepp_worker_id_seq OWNED BY redpepp_worker.id;


--
-- Name: redpepp_worker_occupations; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE redpepp_worker_occupations (
    id integer NOT NULL,
    worker_id integer NOT NULL,
    workeroccupation_id integer NOT NULL
);


ALTER TABLE public.redpepp_worker_occupations OWNER TO postgres;

--
-- Name: redpepp_worker_occupations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE redpepp_worker_occupations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.redpepp_worker_occupations_id_seq OWNER TO postgres;

--
-- Name: redpepp_worker_occupations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE redpepp_worker_occupations_id_seq OWNED BY redpepp_worker_occupations.id;


--
-- Name: redpepp_worker_project; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE redpepp_worker_project (
    id integer NOT NULL,
    worker_id integer NOT NULL,
    project_id integer NOT NULL
);


ALTER TABLE public.redpepp_worker_project OWNER TO postgres;

--
-- Name: redpepp_worker_project_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE redpepp_worker_project_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.redpepp_worker_project_id_seq OWNER TO postgres;

--
-- Name: redpepp_worker_project_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE redpepp_worker_project_id_seq OWNED BY redpepp_worker_project.id;


--
-- Name: redpepp_workeroccupation; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE redpepp_workeroccupation (
    id integer NOT NULL,
    number integer NOT NULL,
    name character varying(250) NOT NULL
);


ALTER TABLE public.redpepp_workeroccupation OWNER TO postgres;

--
-- Name: redpepp_workeroccupation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE redpepp_workeroccupation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.redpepp_workeroccupation_id_seq OWNER TO postgres;

--
-- Name: redpepp_workeroccupation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE redpepp_workeroccupation_id_seq OWNED BY redpepp_workeroccupation.id;


--
-- Name: south_migrationhistory; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE south_migrationhistory (
    id integer NOT NULL,
    app_name character varying(255) NOT NULL,
    migration character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.south_migrationhistory OWNER TO postgres;

--
-- Name: south_migrationhistory_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE south_migrationhistory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.south_migrationhistory_id_seq OWNER TO postgres;

--
-- Name: south_migrationhistory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE south_migrationhistory_id_seq OWNED BY south_migrationhistory.id;


--
-- Name: thumbnail_kvstore; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE thumbnail_kvstore (
    key character varying(200) NOT NULL,
    value text NOT NULL
);


ALTER TABLE public.thumbnail_kvstore OWNER TO postgres;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_flatpage ALTER COLUMN id SET DEFAULT nextval('django_flatpage_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_flatpage_sites ALTER COLUMN id SET DEFAULT nextval('django_flatpage_sites_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_site ALTER COLUMN id SET DEFAULT nextval('django_site_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY redpepp_client ALTER COLUMN id SET DEFAULT nextval('redpepp_client_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY redpepp_new ALTER COLUMN id SET DEFAULT nextval('redpepp_new_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY redpepp_order ALTER COLUMN id SET DEFAULT nextval('redpepp_order_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY redpepp_project ALTER COLUMN id SET DEFAULT nextval('redpepp_project_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY redpepp_projectimage ALTER COLUMN id SET DEFAULT nextval('redpepp_projectimage_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY redpepp_tariff ALTER COLUMN id SET DEFAULT nextval('redpepp_tariff_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY redpepp_worker ALTER COLUMN id SET DEFAULT nextval('redpepp_worker_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY redpepp_worker_occupations ALTER COLUMN id SET DEFAULT nextval('redpepp_worker_occupations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY redpepp_worker_project ALTER COLUMN id SET DEFAULT nextval('redpepp_worker_project_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY redpepp_workeroccupation ALTER COLUMN id SET DEFAULT nextval('redpepp_workeroccupation_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY south_migrationhistory ALTER COLUMN id SET DEFAULT nextval('south_migrationhistory_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add permission	1	add_permission
2	Can change permission	1	change_permission
3	Can delete permission	1	delete_permission
4	Can add group	2	add_group
5	Can change group	2	change_group
6	Can delete group	2	delete_group
7	Can add user	3	add_user
8	Can change user	3	change_user
9	Can delete user	3	delete_user
10	Can add content type	4	add_contenttype
11	Can change content type	4	change_contenttype
12	Can delete content type	4	delete_contenttype
13	Can add session	5	add_session
14	Can change session	5	change_session
15	Can delete session	5	delete_session
16	Can add site	6	add_site
17	Can change site	6	change_site
18	Can delete site	6	delete_site
19	Can add flat page	7	add_flatpage
20	Can change flat page	7	change_flatpage
21	Can delete flat page	7	delete_flatpage
22	Can add log entry	8	add_logentry
23	Can change log entry	8	change_logentry
24	Can delete log entry	8	delete_logentry
25	Can add kv store	9	add_kvstore
26	Can change kv store	9	change_kvstore
27	Can delete kv store	9	delete_kvstore
28	Can add migration history	10	add_migrationhistory
29	Can change migration history	10	change_migrationhistory
30	Can delete migration history	10	delete_migrationhistory
31	Can add Проект	11	add_project
32	Can change Проект	11	change_project
33	Can delete Проект	11	delete_project
34	Can add Картинка	12	add_projectimage
35	Can change Картинка	12	change_projectimage
36	Can delete Картинка	12	delete_projectimage
37	Can add Работник	13	add_worker
38	Can change Работник	13	change_worker
39	Can delete Работник	13	delete_worker
40	Can add Профессия	14	add_workeroccupation
41	Can change Профессия	14	change_workeroccupation
42	Can delete Профессия	14	delete_workeroccupation
43	Can add Клиент	15	add_client
44	Can change Клиент	15	change_client
45	Can delete Клиент	15	delete_client
46	Can add Новость	16	add_new
47	Can change Новость	16	change_new
48	Can delete Новость	16	delete_new
49	Can add Заказ	17	add_order
50	Can change Заказ	17	change_order
51	Can delete Заказ	17	delete_order
52	Can add Тариф	18	add_tariff
53	Can change Тариф	18	change_tariff
54	Can delete Тариф	18	delete_tariff
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_permission_id_seq', 54, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user (id, username, first_name, last_name, email, password, is_staff, is_active, is_superuser, last_login, date_joined) FROM stdin;
1	peter			peter.ezik@gmail.com	pbkdf2_sha256$10000$MYgavdoTMmLj$KlwyJ5BnjcFxambNwghYzT7hoJvKBrpg9aHL5iOve3M=	t	t	t	2013-08-01 14:01:31.09829+04	2013-07-09 14:25:11.18127+04
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_id_seq', 1, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) FROM stdin;
1	2013-07-09 15:21:58.919612+04	1	18	1	Tariff object	1	
2	2013-08-01 14:08:11.516785+04	1	15	1	Мир Уюта	1	
3	2013-08-01 14:09:15.928232+04	1	15	2	Беллакт	1	
4	2013-08-01 14:13:21.100911+04	1	14	1	руководитель	1	
5	2013-08-01 14:13:28.600766+04	1	14	2	программист	1	
6	2013-08-01 14:13:35.444595+04	1	14	3	верстальщик	1	
7	2013-08-01 14:13:46.305081+04	1	13	1	Пётр	1	
8	2013-08-01 14:14:01.46642+04	1	14	4	дизайнер	1	
9	2013-08-01 14:14:09.130931+04	1	13	2	Анна	1	
10	2013-08-01 14:14:18.970407+04	1	13	3	Виталий	1	
11	2013-08-01 14:14:38.009783+04	1	14	5	менеджер	1	
12	2013-08-01 14:14:46.92092+04	1	13	4	Сергей	1	
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 12, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_content_type (id, name, app_label, model) FROM stdin;
1	permission	auth	permission
2	group	auth	group
3	user	auth	user
4	content type	contenttypes	contenttype
5	session	sessions	session
6	site	sites	site
7	flat page	flatpages	flatpage
8	log entry	admin	logentry
9	kv store	thumbnail	kvstore
10	migration history	south	migrationhistory
11	Проект	redpepp	project
12	Картинка	redpepp	projectimage
13	Работник	redpepp	worker
14	Профессия	redpepp	workeroccupation
15	Клиент	redpepp	client
16	Новость	redpepp	new
17	Заказ	redpepp	order
18	Тариф	redpepp	tariff
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_content_type_id_seq', 18, true);


--
-- Data for Name: django_flatpage; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_flatpage (id, url, title, content, enable_comments, template_name, registration_required) FROM stdin;
\.


--
-- Name: django_flatpage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_flatpage_id_seq', 1, false);


--
-- Data for Name: django_flatpage_sites; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_flatpage_sites (id, flatpage_id, site_id) FROM stdin;
\.


--
-- Name: django_flatpage_sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_flatpage_sites_id_seq', 1, false);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
ca7592f78c0f0a735148b15ccd9335f2	MjA1N2EwOTdmOGM0YWUwMmFiZDgyZjQwYWJiNjFmYzBiOGYyMWU0ZTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLAXUu\n	2013-07-23 15:21:24.548705+04
1b4a24950cf097791dc36a51d0e501a5	MjA1N2EwOTdmOGM0YWUwMmFiZDgyZjQwYWJiNjFmYzBiOGYyMWU0ZTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLAXUu\n	2013-08-06 18:19:17.695684+04
d1460875540725b029b264274d785ee4	MjA1N2EwOTdmOGM0YWUwMmFiZDgyZjQwYWJiNjFmYzBiOGYyMWU0ZTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLAXUu\n	2013-08-15 14:01:31.121479+04
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_site (id, domain, name) FROM stdin;
1	example.com	example.com
\.


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_site_id_seq', 1, true);


--
-- Data for Name: redpepp_client; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY redpepp_client (id, title, description, image, number, created, modified, active) FROM stdin;
1	Мир Уюта	Мебельная компания.	img/clients/miryuta.jpg	1	2013-08-01 14:08:11.438526+04	2013-08-01 14:08:11.442922+04	t
2	Беллакт	Интернет-магазин "Беллакт" предприятия "VietBellac.	img/clients/bellakt_1.png	2	2013-08-01 14:09:15.923915+04	2013-08-01 14:09:15.926518+04	t
\.


--
-- Name: redpepp_client_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('redpepp_client_id_seq', 2, true);


--
-- Data for Name: redpepp_new; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY redpepp_new (id, datetime, title, text, number, created, modified, active) FROM stdin;
\.


--
-- Name: redpepp_new_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('redpepp_new_id_seq', 1, false);


--
-- Data for Name: redpepp_order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY redpepp_order (id, name, email, tariff_id, message, created) FROM stdin;
1	Пётр	peter.ezik@gmail.com	1	test	2013-07-23 18:05:36.656583+04
2	Петр	ya@ya.ru	1		2013-08-01 13:57:27.364049+04
\.


--
-- Name: redpepp_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('redpepp_order_id_seq', 2, true);


--
-- Data for Name: redpepp_project; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY redpepp_project (id, title, caption, text, client_id, url, number, created, modified, active) FROM stdin;
\.


--
-- Name: redpepp_project_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('redpepp_project_id_seq', 1, false);


--
-- Data for Name: redpepp_projectimage; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY redpepp_projectimage (id, project_id, image, number, description, created, modified) FROM stdin;
\.


--
-- Name: redpepp_projectimage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('redpepp_projectimage_id_seq', 1, false);


--
-- Data for Name: redpepp_tariff; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY redpepp_tariff (id, title, description, image, price, number, active) FROM stdin;
1	SIMPLE - сайт визитка			7000	1	t
\.


--
-- Name: redpepp_tariff_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('redpepp_tariff_id_seq', 1, true);


--
-- Data for Name: redpepp_worker; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY redpepp_worker (id, name, nick, email, about, photo, number, created, modified, active) FROM stdin;
1	Пётр		peter.ezik@gmail.com			1	2013-08-01 14:13:46.219312+04	2013-08-01 14:13:46.224775+04	t
2	Анна					2	2013-08-01 14:14:09.11477+04	2013-08-01 14:14:09.119356+04	t
3	Виталий					3	2013-08-01 14:14:18.954824+04	2013-08-01 14:14:18.959516+04	t
4	Сергей					4	2013-08-01 14:14:46.906795+04	2013-08-01 14:14:46.910984+04	t
\.


--
-- Name: redpepp_worker_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('redpepp_worker_id_seq', 4, true);


--
-- Data for Name: redpepp_worker_occupations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY redpepp_worker_occupations (id, worker_id, workeroccupation_id) FROM stdin;
1	1	1
2	1	2
3	1	3
4	2	4
5	3	4
6	4	5
\.


--
-- Name: redpepp_worker_occupations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('redpepp_worker_occupations_id_seq', 6, true);


--
-- Data for Name: redpepp_worker_project; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY redpepp_worker_project (id, worker_id, project_id) FROM stdin;
\.


--
-- Name: redpepp_worker_project_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('redpepp_worker_project_id_seq', 1, false);


--
-- Data for Name: redpepp_workeroccupation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY redpepp_workeroccupation (id, number, name) FROM stdin;
1	1	руководитель
2	2	программист
3	3	верстальщик
4	4	дизайнер
5	5	менеджер
\.


--
-- Name: redpepp_workeroccupation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('redpepp_workeroccupation_id_seq', 5, true);


--
-- Data for Name: south_migrationhistory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY south_migrationhistory (id, app_name, migration, applied) FROM stdin;
1	redpepp	0001_initial	2013-07-09 14:55:22.326597+04
\.


--
-- Name: south_migrationhistory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('south_migrationhistory_id_seq', 1, true);


--
-- Data for Name: thumbnail_kvstore; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY thumbnail_kvstore (key, value) FROM stdin;
\.


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_key UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_codename_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_key UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_key UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_key UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_model_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_key UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_flatpage_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_flatpage
    ADD CONSTRAINT django_flatpage_pkey PRIMARY KEY (id);


--
-- Name: django_flatpage_sites_flatpage_id_site_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_flatpage_sites
    ADD CONSTRAINT django_flatpage_sites_flatpage_id_site_id_key UNIQUE (flatpage_id, site_id);


--
-- Name: django_flatpage_sites_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_flatpage_sites
    ADD CONSTRAINT django_flatpage_sites_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: redpepp_client_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY redpepp_client
    ADD CONSTRAINT redpepp_client_pkey PRIMARY KEY (id);


--
-- Name: redpepp_new_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY redpepp_new
    ADD CONSTRAINT redpepp_new_pkey PRIMARY KEY (id);


--
-- Name: redpepp_order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY redpepp_order
    ADD CONSTRAINT redpepp_order_pkey PRIMARY KEY (id);


--
-- Name: redpepp_project_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY redpepp_project
    ADD CONSTRAINT redpepp_project_pkey PRIMARY KEY (id);


--
-- Name: redpepp_projectimage_image_4ab5ca0642b9b074_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY redpepp_projectimage
    ADD CONSTRAINT redpepp_projectimage_image_4ab5ca0642b9b074_uniq UNIQUE (image, number);


--
-- Name: redpepp_projectimage_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY redpepp_projectimage
    ADD CONSTRAINT redpepp_projectimage_pkey PRIMARY KEY (id);


--
-- Name: redpepp_tariff_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY redpepp_tariff
    ADD CONSTRAINT redpepp_tariff_pkey PRIMARY KEY (id);


--
-- Name: redpepp_worker_occupations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY redpepp_worker_occupations
    ADD CONSTRAINT redpepp_worker_occupations_pkey PRIMARY KEY (id);


--
-- Name: redpepp_worker_occupations_worker_id_36a0a4357efd85ab_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY redpepp_worker_occupations
    ADD CONSTRAINT redpepp_worker_occupations_worker_id_36a0a4357efd85ab_uniq UNIQUE (worker_id, workeroccupation_id);


--
-- Name: redpepp_worker_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY redpepp_worker
    ADD CONSTRAINT redpepp_worker_pkey PRIMARY KEY (id);


--
-- Name: redpepp_worker_project_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY redpepp_worker_project
    ADD CONSTRAINT redpepp_worker_project_pkey PRIMARY KEY (id);


--
-- Name: redpepp_worker_project_worker_id_7d86233a236d8dbd_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY redpepp_worker_project
    ADD CONSTRAINT redpepp_worker_project_worker_id_7d86233a236d8dbd_uniq UNIQUE (worker_id, project_id);


--
-- Name: redpepp_workeroccupation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY redpepp_workeroccupation
    ADD CONSTRAINT redpepp_workeroccupation_pkey PRIMARY KEY (id);


--
-- Name: south_migrationhistory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY south_migrationhistory
    ADD CONSTRAINT south_migrationhistory_pkey PRIMARY KEY (id);


--
-- Name: thumbnail_kvstore_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY thumbnail_kvstore
    ADD CONSTRAINT thumbnail_kvstore_pkey PRIMARY KEY (key);


--
-- Name: auth_group_permissions_group_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_group_permissions_group_id ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_group_permissions_permission_id ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_permission_content_type_id ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_user_groups_group_id ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_user_groups_user_id ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_permission_id ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_user_id ON auth_user_user_permissions USING btree (user_id);


--
-- Name: django_admin_log_content_type_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX django_admin_log_content_type_id ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX django_admin_log_user_id ON django_admin_log USING btree (user_id);


--
-- Name: django_flatpage_sites_flatpage_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX django_flatpage_sites_flatpage_id ON django_flatpage_sites USING btree (flatpage_id);


--
-- Name: django_flatpage_sites_site_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX django_flatpage_sites_site_id ON django_flatpage_sites USING btree (site_id);


--
-- Name: django_flatpage_url; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX django_flatpage_url ON django_flatpage USING btree (url);


--
-- Name: django_flatpage_url_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX django_flatpage_url_like ON django_flatpage USING btree (url varchar_pattern_ops);


--
-- Name: django_session_expire_date; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX django_session_expire_date ON django_session USING btree (expire_date);


--
-- Name: redpepp_order_tariff_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX redpepp_order_tariff_id ON redpepp_order USING btree (tariff_id);


--
-- Name: redpepp_project_client_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX redpepp_project_client_id ON redpepp_project USING btree (client_id);


--
-- Name: redpepp_projectimage_project_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX redpepp_projectimage_project_id ON redpepp_projectimage USING btree (project_id);


--
-- Name: redpepp_worker_occupations_worker_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX redpepp_worker_occupations_worker_id ON redpepp_worker_occupations USING btree (worker_id);


--
-- Name: redpepp_worker_occupations_workeroccupation_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX redpepp_worker_occupations_workeroccupation_id ON redpepp_worker_occupations USING btree (workeroccupation_id);


--
-- Name: redpepp_worker_project_project_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX redpepp_worker_project_project_id ON redpepp_worker_project USING btree (project_id);


--
-- Name: redpepp_worker_project_worker_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX redpepp_worker_project_worker_id ON redpepp_worker_project USING btree (worker_id);


--
-- Name: auth_group_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_fkey FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: client_id_refs_id_6f85323e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY redpepp_project
    ADD CONSTRAINT client_id_refs_id_6f85323e FOREIGN KEY (client_id) REFERENCES redpepp_client(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: content_type_id_refs_id_728de91f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT content_type_id_refs_id_728de91f FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_content_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_fkey FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_flatpage_sites_site_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_flatpage_sites
    ADD CONSTRAINT django_flatpage_sites_site_id_fkey FOREIGN KEY (site_id) REFERENCES django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: flatpage_id_refs_id_c0e84f5a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_flatpage_sites
    ADD CONSTRAINT flatpage_id_refs_id_c0e84f5a FOREIGN KEY (flatpage_id) REFERENCES django_flatpage(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: group_id_refs_id_3cea63fe; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT group_id_refs_id_3cea63fe FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: project_id_refs_id_4e9ccdb7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY redpepp_worker_project
    ADD CONSTRAINT project_id_refs_id_4e9ccdb7 FOREIGN KEY (project_id) REFERENCES redpepp_project(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: project_id_refs_id_acda63d5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY redpepp_projectimage
    ADD CONSTRAINT project_id_refs_id_acda63d5 FOREIGN KEY (project_id) REFERENCES redpepp_project(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tariff_id_refs_id_70fbc7fa; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY redpepp_order
    ADD CONSTRAINT tariff_id_refs_id_70fbc7fa FOREIGN KEY (tariff_id) REFERENCES redpepp_tariff(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_831107f1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT user_id_refs_id_831107f1 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_f2045483; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT user_id_refs_id_f2045483 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: worker_id_refs_id_21df34eb; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY redpepp_worker_project
    ADD CONSTRAINT worker_id_refs_id_21df34eb FOREIGN KEY (worker_id) REFERENCES redpepp_worker(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: worker_id_refs_id_b66a5948; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY redpepp_worker_occupations
    ADD CONSTRAINT worker_id_refs_id_b66a5948 FOREIGN KEY (worker_id) REFERENCES redpepp_worker(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: workeroccupation_id_refs_id_4cb1a1a3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY redpepp_worker_occupations
    ADD CONSTRAINT workeroccupation_id_refs_id_4cb1a1a3 FOREIGN KEY (workeroccupation_id) REFERENCES redpepp_workeroccupation(id) DEFERRABLE INITIALLY DEFERRED;


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

