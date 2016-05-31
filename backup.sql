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
-- Name: acumulas; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE acumulas (
    id integer NOT NULL,
    acumulado_id integer,
    acumula_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.acumulas OWNER TO postgres;

--
-- Name: acumulas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE acumulas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.acumulas_id_seq OWNER TO postgres;

--
-- Name: acumulas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE acumulas_id_seq OWNED BY acumulas.id;


--
-- Name: adjunta_fisicamentes; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE adjunta_fisicamentes (
    id integer NOT NULL,
    adjuntado_id integer,
    adjunta_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.adjunta_fisicamentes OWNER TO postgres;

--
-- Name: adjunta_fisicamentes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE adjunta_fisicamentes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.adjunta_fisicamentes_id_seq OWNER TO postgres;

--
-- Name: adjunta_fisicamentes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE adjunta_fisicamentes_id_seq OWNED BY adjunta_fisicamentes.id;


--
-- Name: admin_users; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE admin_users (
    id integer NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.admin_users OWNER TO postgres;

--
-- Name: admin_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE admin_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_users_id_seq OWNER TO postgres;

--
-- Name: admin_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE admin_users_id_seq OWNED BY admin_users.id;


--
-- Name: bloque_periodos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE bloque_periodos (
    bloque_id integer,
    periodo_id integer,
    id integer,
    vice_id integer,
    presidente_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.bloque_periodos OWNER TO postgres;

--
-- Name: bloques; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE bloques (
    id integer NOT NULL,
    denominacion text,
    codigo text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.bloques OWNER TO postgres;

--
-- Name: bloques_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE bloques_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bloques_id_seq OWNER TO postgres;

--
-- Name: bloques_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE bloques_id_seq OWNED BY bloques.id;


--
-- Name: bloques_tramites; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE bloques_tramites (
    bloque_id integer,
    tramite_id integer
);


ALTER TABLE public.bloques_tramites OWNER TO postgres;

--
-- Name: boletin_oficials; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE boletin_oficials (
    id integer NOT NULL,
    nro integer,
    publicacion date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.boletin_oficials OWNER TO postgres;

--
-- Name: boletin_oficials_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE boletin_oficials_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.boletin_oficials_id_seq OWNER TO postgres;

--
-- Name: boletin_oficials_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE boletin_oficials_id_seq OWNED BY boletin_oficials.id;


--
-- Name: boletin_oficials_normas; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE boletin_oficials_normas (
    boletin_oficial_id integer,
    norma_id integer
);


ALTER TABLE public.boletin_oficials_normas OWNER TO postgres;

--
-- Name: capitulos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE capitulos (
    id integer NOT NULL,
    nombre character varying,
    titulo_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    orden integer
);


ALTER TABLE public.capitulos OWNER TO postgres;

--
-- Name: capitulos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE capitulos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.capitulos_id_seq OWNER TO postgres;

--
-- Name: capitulos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE capitulos_id_seq OWNED BY capitulos.id;


--
-- Name: capitulos_normas; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE capitulos_normas (
    id integer NOT NULL,
    orden integer,
    capitulo_id integer,
    norma_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.capitulos_normas OWNER TO postgres;

--
-- Name: capitulos_normas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE capitulos_normas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.capitulos_normas_id_seq OWNER TO postgres;

--
-- Name: capitulos_normas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE capitulos_normas_id_seq OWNED BY capitulos_normas.id;


--
-- Name: circuito_ordens; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE circuito_ordens (
    id integer NOT NULL,
    seccion_id integer,
    sub_seccion_id integer,
    destino character varying,
    circuito_id integer,
    orden_del_dia_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.circuito_ordens OWNER TO postgres;

--
-- Name: circuito_ordens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE circuito_ordens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.circuito_ordens_id_seq OWNER TO postgres;

--
-- Name: circuito_ordens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE circuito_ordens_id_seq OWNED BY circuito_ordens.id;


--
-- Name: circuitos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE circuitos (
    id integer NOT NULL,
    expediente_id integer,
    tramite_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    nro integer
);


ALTER TABLE public.circuitos OWNER TO postgres;

--
-- Name: circuitos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE circuitos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.circuitos_id_seq OWNER TO postgres;

--
-- Name: circuitos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE circuitos_id_seq OWNED BY circuitos.id;


--
-- Name: circuitos_normas; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE circuitos_normas (
    circuito_id integer,
    norma_id integer
);


ALTER TABLE public.circuitos_normas OWNER TO postgres;

--
-- Name: clasificacions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE clasificacions (
    id integer NOT NULL,
    nombre character varying,
    tipo character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.clasificacions OWNER TO postgres;

--
-- Name: clasificacions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE clasificacions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clasificacions_id_seq OWNER TO postgres;

--
-- Name: clasificacions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE clasificacions_id_seq OWNED BY clasificacions.id;


--
-- Name: clasificacions_normas; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE clasificacions_normas (
    clasificacion_id integer,
    norma_id integer
);


ALTER TABLE public.clasificacions_normas OWNER TO postgres;

--
-- Name: comisions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE comisions (
    id integer NOT NULL,
    denominacion character varying,
    codigo character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    vig_desde date,
    vig_hasta date
);


ALTER TABLE public.comisions OWNER TO postgres;

--
-- Name: comisions_despachos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE comisions_despachos (
    despacho_id integer,
    comision_id integer
);


ALTER TABLE public.comisions_despachos OWNER TO postgres;

--
-- Name: comisions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE comisions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comisions_id_seq OWNER TO postgres;

--
-- Name: comisions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE comisions_id_seq OWNED BY comisions.id;


--
-- Name: comisions_periodos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE comisions_periodos (
    comision_id integer,
    periodo_id integer
);


ALTER TABLE public.comisions_periodos OWNER TO postgres;

--
-- Name: comisions_personas; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE comisions_personas (
    comision_id integer,
    concejal_id integer
);


ALTER TABLE public.comisions_personas OWNER TO postgres;

--
-- Name: comisions_tramites; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE comisions_tramites (
    comision_id integer,
    tramite_id integer
);


ALTER TABLE public.comisions_tramites OWNER TO postgres;

--
-- Name: dependencia_municipals; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE dependencia_municipals (
    id integer NOT NULL,
    denominacion character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.dependencia_municipals OWNER TO postgres;

--
-- Name: dependencia_municipals_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE dependencia_municipals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dependencia_municipals_id_seq OWNER TO postgres;

--
-- Name: dependencia_municipals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE dependencia_municipals_id_seq OWNED BY dependencia_municipals.id;


--
-- Name: despachos_concejals; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE despachos_concejals (
    despacho_id integer,
    concejal_id integer
);


ALTER TABLE public.despachos_concejals OWNER TO postgres;

--
-- Name: destinos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE destinos (
    id integer NOT NULL,
    tipo integer,
    fecha date,
    destino character varying,
    norma_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.destinos OWNER TO postgres;

--
-- Name: destinos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE destinos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.destinos_id_seq OWNER TO postgres;

--
-- Name: destinos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE destinos_id_seq OWNED BY destinos.id;


--
-- Name: diario_de_sesions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE diario_de_sesions (
    id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.diario_de_sesions OWNER TO postgres;

--
-- Name: diario_de_sesions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE diario_de_sesions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.diario_de_sesions_id_seq OWNER TO postgres;

--
-- Name: diario_de_sesions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE diario_de_sesions_id_seq OWNED BY diario_de_sesions.id;


--
-- Name: digestos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE digestos (
    id integer NOT NULL,
    nombre character varying,
    observacion text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.digestos OWNER TO postgres;

--
-- Name: digestos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE digestos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.digestos_id_seq OWNER TO postgres;

--
-- Name: digestos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE digestos_id_seq OWNED BY digestos.id;


--
-- Name: documentacion_presentadas; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE documentacion_presentadas (
    id integer NOT NULL,
    tipo character varying,
    condonacion_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.documentacion_presentadas OWNER TO postgres;

--
-- Name: documentacion_presentadas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE documentacion_presentadas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.documentacion_presentadas_id_seq OWNER TO postgres;

--
-- Name: documentacion_presentadas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE documentacion_presentadas_id_seq OWNED BY documentacion_presentadas.id;


--
-- Name: estado_expedientes; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE estado_expedientes (
    id integer NOT NULL,
    nombre character varying,
    especificacion1 text,
    especificacion2 text,
    tipo character varying,
    circuito_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    ref_id integer,
    ref_type character varying,
    fecha date
);


ALTER TABLE public.estado_expedientes OWNER TO postgres;

--
-- Name: estado_expedientes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE estado_expedientes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.estado_expedientes_id_seq OWNER TO postgres;

--
-- Name: estado_expedientes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE estado_expedientes_id_seq OWNED BY estado_expedientes.id;


--
-- Name: estado_tramites; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE estado_tramites (
    id integer NOT NULL,
    nombre character varying,
    especificacion text,
    tipo character varying,
    tramite_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    ref_id integer,
    ref_type character varying
);


ALTER TABLE public.estado_tramites OWNER TO postgres;

--
-- Name: estado_tramites_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE estado_tramites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.estado_tramites_id_seq OWNER TO postgres;

--
-- Name: estado_tramites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE estado_tramites_id_seq OWNED BY estado_tramites.id;


--
-- Name: expediente_administrativos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE expediente_administrativos (
    id integer NOT NULL,
    nro_exp character varying,
    nro_fojas integer,
    bis integer,
    tema text,
    observacion text,
    expediente_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    sub_indice character varying,
    letra character varying,
    anio date
);


ALTER TABLE public.expediente_administrativos OWNER TO postgres;

--
-- Name: expediente_administrativos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE expediente_administrativos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.expediente_administrativos_id_seq OWNER TO postgres;

--
-- Name: expediente_administrativos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE expediente_administrativos_id_seq OWNED BY expediente_administrativos.id;


--
-- Name: expedientes; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE expedientes (
    id integer NOT NULL,
    nro_exp character varying,
    nro_fojas integer,
    bis integer,
    tema text,
    observacion text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    anio date
);


ALTER TABLE public.expedientes OWNER TO postgres;

--
-- Name: expedientes_despachos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE expedientes_despachos (
    id integer NOT NULL,
    expediente_id integer,
    despacho_id integer
);


ALTER TABLE public.expedientes_despachos OWNER TO postgres;

--
-- Name: expedientes_despachos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE expedientes_despachos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.expedientes_despachos_id_seq OWNER TO postgres;

--
-- Name: expedientes_despachos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE expedientes_despachos_id_seq OWNED BY expedientes_despachos.id;


--
-- Name: expedientes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE expedientes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.expedientes_id_seq OWNER TO postgres;

--
-- Name: expedientes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE expedientes_id_seq OWNED BY expedientes.id;


--
-- Name: expedientes_tags; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE expedientes_tags (
    expediente_id integer,
    tag_id integer
);


ALTER TABLE public.expedientes_tags OWNER TO postgres;

--
-- Name: libros; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE libros (
    id integer NOT NULL,
    nombre character varying,
    digesto_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    orden integer
);


ALTER TABLE public.libros OWNER TO postgres;

--
-- Name: libros_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE libros_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.libros_id_seq OWNER TO postgres;

--
-- Name: libros_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE libros_id_seq OWNED BY libros.id;


--
-- Name: modifica_relationships; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE modifica_relationships (
    id integer NOT NULL,
    modifica_id integer,
    me_modifica_id integer,
    desde date,
    hasta date,
    dia integer,
    mes integer,
    anio integer,
    dia_habil integer,
    observacion text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    type character varying,
    tipo character varying,
    tipo_relacion character varying
);


ALTER TABLE public.modifica_relationships OWNER TO postgres;

--
-- Name: modifica_relationships_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE modifica_relationships_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.modifica_relationships_id_seq OWNER TO postgres;

--
-- Name: modifica_relationships_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE modifica_relationships_id_seq OWNED BY modifica_relationships.id;


--
-- Name: normas; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE normas (
    id integer NOT NULL,
    letra character varying,
    nro integer,
    bis integer,
    sumario text,
    observaciones text,
    sancion date,
    entrada_vigencia date,
    finaliza_vigencia date,
    plazo_dia integer,
    plazo_mes integer,
    plazo_anio integer,
    organismo_origen character varying,
    type character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    expediente_id integer,
    tipo integer,
    descripcion text,
    anio integer,
    indice bigint
);


ALTER TABLE public.normas OWNER TO postgres;

--
-- Name: normas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE normas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.normas_id_seq OWNER TO postgres;

--
-- Name: normas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE normas_id_seq OWNED BY normas.id;


--
-- Name: normas_otra_publicacions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE normas_otra_publicacions (
    norma_id integer,
    otra_publicacion_id integer
);


ALTER TABLE public.normas_otra_publicacions OWNER TO postgres;

--
-- Name: normas_tags; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE normas_tags (
    norma_id integer,
    tag_id integer
);


ALTER TABLE public.normas_tags OWNER TO postgres;

--
-- Name: orden_del_dia; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE orden_del_dia (
    id integer NOT NULL,
    nro integer,
    fecha date,
    observacion text,
    sesion_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.orden_del_dia OWNER TO postgres;

--
-- Name: orden_del_dia_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE orden_del_dia_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orden_del_dia_id_seq OWNER TO postgres;

--
-- Name: orden_del_dia_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE orden_del_dia_id_seq OWNED BY orden_del_dia.id;


--
-- Name: orden_del_dia_seccions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE orden_del_dia_seccions (
    orden_del_dia_id integer,
    seccion_id integer
);


ALTER TABLE public.orden_del_dia_seccions OWNER TO postgres;

--
-- Name: otra_publicacions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE otra_publicacions (
    id integer NOT NULL,
    nombre character varying,
    observacion text,
    publicacion date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.otra_publicacions OWNER TO postgres;

--
-- Name: otra_publicacions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE otra_publicacions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.otra_publicacions_id_seq OWNER TO postgres;

--
-- Name: otra_publicacions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE otra_publicacions_id_seq OWNED BY otra_publicacions.id;


--
-- Name: periodos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE periodos (
    id integer NOT NULL,
    desde date,
    hasta date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.periodos OWNER TO postgres;

--
-- Name: periodos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE periodos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.periodos_id_seq OWNER TO postgres;

--
-- Name: periodos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE periodos_id_seq OWNED BY periodos.id;


--
-- Name: periodos_personas; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE periodos_personas (
    concejal_id integer,
    periodo_id integer
);


ALTER TABLE public.periodos_personas OWNER TO postgres;

--
-- Name: personas; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE personas (
    id integer NOT NULL,
    nombre character varying,
    apellido character varying,
    tipo_doc integer,
    nro_doc character varying,
    telefono character varying,
    email character varying,
    domicilio character varying,
    cargo integer,
    bloque_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    type character varying,
    cuit integer
);


ALTER TABLE public.personas OWNER TO postgres;

--
-- Name: personas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE personas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.personas_id_seq OWNER TO postgres;

--
-- Name: personas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE personas_id_seq OWNED BY personas.id;


--
-- Name: personas_tramites; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE personas_tramites (
    persona_id integer,
    tramite_id integer
);


ALTER TABLE public.personas_tramites OWNER TO postgres;

--
-- Name: relationship_concejals; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE relationship_concejals (
    id integer NOT NULL,
    suplente_id integer,
    titular_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.relationship_concejals OWNER TO postgres;

--
-- Name: relationship_concejals_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE relationship_concejals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.relationship_concejals_id_seq OWNER TO postgres;

--
-- Name: relationship_concejals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE relationship_concejals_id_seq OWNED BY relationship_concejals.id;


--
-- Name: reparticion_oficials; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE reparticion_oficials (
    id integer NOT NULL,
    denominacion character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.reparticion_oficials OWNER TO postgres;

--
-- Name: reparticion_oficials_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE reparticion_oficials_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reparticion_oficials_id_seq OWNER TO postgres;

--
-- Name: reparticion_oficials_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE reparticion_oficials_id_seq OWNED BY reparticion_oficials.id;


--
-- Name: rols; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE rols (
    id integer NOT NULL,
    tipo character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.rols OWNER TO postgres;

--
-- Name: rols_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE rols_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rols_id_seq OWNER TO postgres;

--
-- Name: rols_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE rols_id_seq OWNED BY rols.id;


--
-- Name: rols_usuarios; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE rols_usuarios (
    usuario_id integer,
    rol_id integer
);


ALTER TABLE public.rols_usuarios OWNER TO postgres;

--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO postgres;

--
-- Name: seccions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE seccions (
    id integer NOT NULL,
    nombre character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.seccions OWNER TO postgres;

--
-- Name: seccions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE seccions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seccions_id_seq OWNER TO postgres;

--
-- Name: seccions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE seccions_id_seq OWNED BY seccions.id;


--
-- Name: sesions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE sesions (
    id integer NOT NULL,
    nro integer,
    observacion text,
    tipo1 character varying,
    tipo2 character varying,
    diario_de_sesion_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.sesions OWNER TO postgres;

--
-- Name: sesions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sesions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sesions_id_seq OWNER TO postgres;

--
-- Name: sesions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE sesions_id_seq OWNED BY sesions.id;


--
-- Name: sub_seccions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE sub_seccions (
    id integer NOT NULL,
    nombre character varying,
    seccion_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.sub_seccions OWNER TO postgres;

--
-- Name: sub_seccions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sub_seccions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sub_seccions_id_seq OWNER TO postgres;

--
-- Name: sub_seccions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE sub_seccions_id_seq OWNED BY sub_seccions.id;


--
-- Name: tags; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tags (
    id integer NOT NULL,
    nombre character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.tags OWNER TO postgres;

--
-- Name: tags_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tags_id_seq OWNER TO postgres;

--
-- Name: tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tags_id_seq OWNED BY tags.id;


--
-- Name: titulos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE titulos (
    id integer NOT NULL,
    nombre character varying,
    libro_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    orden integer
);


ALTER TABLE public.titulos OWNER TO postgres;

--
-- Name: titulos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE titulos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.titulos_id_seq OWNER TO postgres;

--
-- Name: titulos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE titulos_id_seq OWNED BY titulos.id;


--
-- Name: tramites; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tramites (
    id integer NOT NULL,
    nro_fojas integer,
    asunto text,
    responsable integer,
    tipo_contribucion integer,
    condicion_contribuyente integer,
    observaciones text,
    type character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    expediente_id integer,
    destino character varying,
    iniciador character varying,
    domicilio character varying,
    telefono character varying,
    email character varying,
    nro_exp integer,
    anio_exp integer,
    bis_exp integer,
    comision character varying,
    concejales_firmantes character varying,
    usuario character varying,
    fecha date
);


ALTER TABLE public.tramites OWNER TO postgres;

--
-- Name: tramites_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tramites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tramites_id_seq OWNER TO postgres;

--
-- Name: tramites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tramites_id_seq OWNED BY tramites.id;


--
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE usuarios (
    id integer NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    persona_id integer
);


ALTER TABLE public.usuarios OWNER TO postgres;

--
-- Name: usuarios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE usuarios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuarios_id_seq OWNER TO postgres;

--
-- Name: usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE usuarios_id_seq OWNED BY usuarios.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY acumulas ALTER COLUMN id SET DEFAULT nextval('acumulas_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY adjunta_fisicamentes ALTER COLUMN id SET DEFAULT nextval('adjunta_fisicamentes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY admin_users ALTER COLUMN id SET DEFAULT nextval('admin_users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bloques ALTER COLUMN id SET DEFAULT nextval('bloques_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY boletin_oficials ALTER COLUMN id SET DEFAULT nextval('boletin_oficials_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY capitulos ALTER COLUMN id SET DEFAULT nextval('capitulos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY capitulos_normas ALTER COLUMN id SET DEFAULT nextval('capitulos_normas_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY circuito_ordens ALTER COLUMN id SET DEFAULT nextval('circuito_ordens_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY circuitos ALTER COLUMN id SET DEFAULT nextval('circuitos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY clasificacions ALTER COLUMN id SET DEFAULT nextval('clasificacions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comisions ALTER COLUMN id SET DEFAULT nextval('comisions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY dependencia_municipals ALTER COLUMN id SET DEFAULT nextval('dependencia_municipals_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY destinos ALTER COLUMN id SET DEFAULT nextval('destinos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY diario_de_sesions ALTER COLUMN id SET DEFAULT nextval('diario_de_sesions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY digestos ALTER COLUMN id SET DEFAULT nextval('digestos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY documentacion_presentadas ALTER COLUMN id SET DEFAULT nextval('documentacion_presentadas_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY estado_expedientes ALTER COLUMN id SET DEFAULT nextval('estado_expedientes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY estado_tramites ALTER COLUMN id SET DEFAULT nextval('estado_tramites_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY expediente_administrativos ALTER COLUMN id SET DEFAULT nextval('expediente_administrativos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY expedientes ALTER COLUMN id SET DEFAULT nextval('expedientes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY expedientes_despachos ALTER COLUMN id SET DEFAULT nextval('expedientes_despachos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY libros ALTER COLUMN id SET DEFAULT nextval('libros_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY modifica_relationships ALTER COLUMN id SET DEFAULT nextval('modifica_relationships_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY normas ALTER COLUMN id SET DEFAULT nextval('normas_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY orden_del_dia ALTER COLUMN id SET DEFAULT nextval('orden_del_dia_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY otra_publicacions ALTER COLUMN id SET DEFAULT nextval('otra_publicacions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY periodos ALTER COLUMN id SET DEFAULT nextval('periodos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY personas ALTER COLUMN id SET DEFAULT nextval('personas_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY relationship_concejals ALTER COLUMN id SET DEFAULT nextval('relationship_concejals_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reparticion_oficials ALTER COLUMN id SET DEFAULT nextval('reparticion_oficials_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rols ALTER COLUMN id SET DEFAULT nextval('rols_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY seccions ALTER COLUMN id SET DEFAULT nextval('seccions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sesions ALTER COLUMN id SET DEFAULT nextval('sesions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sub_seccions ALTER COLUMN id SET DEFAULT nextval('sub_seccions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tags ALTER COLUMN id SET DEFAULT nextval('tags_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY titulos ALTER COLUMN id SET DEFAULT nextval('titulos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tramites ALTER COLUMN id SET DEFAULT nextval('tramites_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuarios ALTER COLUMN id SET DEFAULT nextval('usuarios_id_seq'::regclass);


--
-- Data for Name: acumulas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY acumulas (id, acumulado_id, acumula_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: acumulas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('acumulas_id_seq', 1, false);


--
-- Data for Name: adjunta_fisicamentes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY adjunta_fisicamentes (id, adjuntado_id, adjunta_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: adjunta_fisicamentes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('adjunta_fisicamentes_id_seq', 1, false);


--
-- Data for Name: admin_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY admin_users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at) FROM stdin;
15	sanchezlilianamaria@admin.com	$2a$10$GS3Yz10c8WenUhVaakLJQOn2RSj0kpetp19WJtOhTQ7kJJGQdqXwa	\N	\N	\N	15	2016-04-21 12:53:19.280435	2016-04-20 11:55:14.953582	127.0.0.1	127.0.0.1	2016-02-22 15:55:02.880787	2016-04-21 12:53:19.281639
13	asetto@entrada.com	$2a$10$DKDMi.H5R4CTdTSIWKh85OQgCv/2JJu9eyDQqnai4KHxS7U0INVGu	\N	\N	\N	0	\N	\N	\N	\N	2015-09-23 13:04:15.319942	2015-09-23 13:04:15.319942
14	rarias@entrada.com	$2a$10$WjoSNpK094t1bHu2cRJf2e0q/ZiSRc12MFeQJXeLns.7ofNHuiqxa	\N	\N	\N	72	2016-05-05 13:11:48.503591	2016-05-04 12:52:13.957196	127.0.0.1	127.0.0.1	2015-09-23 13:12:08.701707	2016-05-05 13:11:48.504766
9	mechenique@entrada.com	$2a$10$efUTJnmypjBYNzTAwcCoJO/IjE..AAAWYE6ajWdkbDMf6xF/LtBHO	\N	\N	\N	162	2016-05-06 10:43:50.340278	2016-05-05 10:37:26.202854	127.0.0.1	127.0.0.1	2015-09-22 13:22:08.223518	2016-05-06 10:43:50.341415
10	mbaudino@entrada.com	$2a$10$o.Yb4OT.O1FacDrHtQNYYelaMLhCVvokpdp3UVVrwOS/.S8hSUttO	\N	\N	\N	210	2016-05-06 11:06:39.135724	2016-05-04 11:02:32.225725	127.0.0.1	127.0.0.1	2015-09-22 13:23:15.315703	2016-05-06 11:06:39.136876
11	invitado@invitado.com	$2a$10$vwl5sNRID9STvuhVcqL8T.arcK/x4iYOeWGXTctFxhfe6cgUaoN1m	\N	\N	\N	110	2016-05-06 11:38:07.191119	2016-04-22 11:14:28.622562	127.0.0.1	127.0.0.1	2015-09-22 13:24:34.685792	2016-05-06 11:38:07.19233
6	leo@admin.com	$2a$10$TvTT.ysCuuCRAwwY0du7buv1vjqdVvKMLvh9jhx5H0fl2/HTbDDjq	27c880c1cd19c57b8ea9dab2c4bf060dbaee42daa98248388d86a92f2c560589	2015-09-22 14:58:27.047126	\N	12	2016-03-31 10:56:03.395605	2016-02-29 11:42:14.095789	127.0.0.1	127.0.0.1	2015-09-18 11:50:15.201665	2016-03-31 10:56:03.396749
3	lalo@admin.com	$2a$10$VhTyWqSqiKpEilasu7LK2ezhY1vuTYYwa3cItjDRtYTWdI3vvc0Cq	\N	\N	\N	25	2015-12-18 14:27:57.50546	2015-11-18 12:59:42.339511	127.0.0.1	127.0.0.1	2015-09-18 11:48:27.139303	2015-12-18 14:27:57.506709
5	roli@admin.com	$2a$10$dki6OXeJS7oEWiumGPanUeQmO3DDsJnPkkFzJfVzrdVKiHk7VEf8y	0f674046829503235829c46e6404df835ca5784ba1b18057254329b73784b9bd	2015-09-22 14:57:43.55919	\N	20	2015-12-21 11:38:29.11987	2015-12-17 11:48:49.056575	127.0.0.1	127.0.0.1	2015-09-18 11:49:23.936987	2015-12-21 11:38:29.121096
4	guille@admin.com	$2a$10$vpW/gDFa4SAtgR1y/p4Q..oJqCVr9oAIxUnP3StIv0XmIDyQB3mHy	\N	\N	2016-04-28 12:52:11.406941	62	2016-04-28 12:58:21.199072	2016-04-28 12:52:11.438435	127.0.0.1	127.0.0.1	2015-09-18 11:48:42.358437	2016-04-28 12:58:21.200283
12	gfantino@entrada.com	$2a$10$dwexhkSQg.Bk.IqQqO0oHuDWk1u.CnqwCMH18JLYBc4J74v2D25Rm	\N	\N	2015-10-05 13:54:32.705829	15	2015-10-14 15:30:08.993778	2015-10-14 15:28:37.099014	127.0.0.1	127.0.0.1	2015-09-22 14:23:34.669349	2015-11-20 15:40:05.324416
\.


--
-- Name: admin_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('admin_users_id_seq', 15, true);


--
-- Data for Name: bloque_periodos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY bloque_periodos (bloque_id, periodo_id, id, vice_id, presidente_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: bloques; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY bloques (id, denominacion, codigo, created_at, updated_at) FROM stdin;
\.


--
-- Name: bloques_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('bloques_id_seq', 1, false);


--
-- Data for Name: bloques_tramites; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY bloques_tramites (bloque_id, tramite_id) FROM stdin;
\.


--
-- Data for Name: boletin_oficials; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY boletin_oficials (id, nro, publicacion, created_at, updated_at) FROM stdin;
\.


--
-- Name: boletin_oficials_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('boletin_oficials_id_seq', 1, false);


--
-- Data for Name: boletin_oficials_normas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY boletin_oficials_normas (boletin_oficial_id, norma_id) FROM stdin;
\.


--
-- Data for Name: capitulos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY capitulos (id, nombre, titulo_id, created_at, updated_at, orden) FROM stdin;
\.


--
-- Name: capitulos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('capitulos_id_seq', 1, false);


--
-- Data for Name: capitulos_normas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY capitulos_normas (id, orden, capitulo_id, norma_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: capitulos_normas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('capitulos_normas_id_seq', 1, false);


--
-- Data for Name: circuito_ordens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY circuito_ordens (id, seccion_id, sub_seccion_id, destino, circuito_id, orden_del_dia_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: circuito_ordens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('circuito_ordens_id_seq', 1, false);


--
-- Data for Name: circuitos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY circuitos (id, expediente_id, tramite_id, created_at, updated_at, nro) FROM stdin;
\.


--
-- Name: circuitos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('circuitos_id_seq', 1, false);


--
-- Data for Name: circuitos_normas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY circuitos_normas (circuito_id, norma_id) FROM stdin;
\.


--
-- Data for Name: clasificacions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY clasificacions (id, nombre, tipo, created_at, updated_at) FROM stdin;
\.


--
-- Name: clasificacions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('clasificacions_id_seq', 1, false);


--
-- Data for Name: clasificacions_normas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY clasificacions_normas (clasificacion_id, norma_id) FROM stdin;
\.


--
-- Data for Name: comisions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY comisions (id, denominacion, codigo, created_at, updated_at, vig_desde, vig_hasta) FROM stdin;
3	COM. REFORMA POLITICA	\N	2015-09-21 14:50:11.953421	2015-09-21 14:50:11.953421	\N	\N
4	Gobierno, Peticiones Generales, Acuerdos, Interpretaciones y Rel. Inst	\N	2015-09-21 14:50:22.698779	2015-09-21 14:50:22.698779	\N	\N
5	Economía y Presupuesto	\N	2015-09-21 14:50:39.219606	2015-09-21 14:50:39.219606	\N	\N
6	Desarrollo Social, Salud y Deporte	\N	2015-09-21 14:50:48.114214	2015-09-21 14:50:48.114214	\N	\N
7	Desarrollo Humano, Educación y Cultura	\N	2015-09-21 14:50:59.652831	2015-09-21 14:50:59.652831	\N	\N
8	Obras Públicas y Vialidad	\N	2015-09-21 14:51:08.247685	2015-09-21 14:51:08.247685	\N	\N
9	Servicios Públicos y Transporte	\N	2015-09-21 14:51:21.932154	2015-09-21 14:51:21.932154	\N	\N
10	Desarrollo Económico y Relaciones Internacionales	\N	2015-09-21 14:51:30.177495	2015-09-21 14:51:30.177495	\N	\N
11	Planificación y Desarrollo Sustentable	\N	2015-09-21 14:51:39.798759	2015-09-21 14:51:39.798759	\N	\N
12	Derechos Humanos	\N	2015-09-21 14:51:49.981504	2015-09-21 14:51:49.981504	\N	\N
13	Coordinación y Planificación de Labor	\N	2015-09-21 14:51:56.636744	2015-09-21 14:51:56.636744	\N	\N
14	COMISION ESPECIAL DE REFORMA DEL REGLAMENTO INTERNO	\N	2015-09-21 14:52:03.443302	2015-09-21 14:52:03.443302	\N	\N
15	COMISION INVESTIGADORA RESOLUCION Nº 851/11	\N	2015-09-21 14:52:18.362082	2015-09-21 14:52:18.362082	\N	\N
16	Servicios Públicos y Transporte	\N	2015-09-21 14:52:58.749258	2015-09-21 14:52:58.749258	\N	\N
18	Desarrollo Humano, Educación y Cultura	\N	2015-09-22 13:44:53.708473	2015-09-22 13:44:53.708473	\N	\N
19	Gobierno, Peticiones Generales, Acuerdos, Interpretaciones y Rel. Inst	\N	2015-09-22 13:47:09.400752	2015-09-22 13:47:09.400752	\N	\N
20	Gobierno, Peticiones Generales, Acuerdos, Interpretaciones y Rel. Inst	\N	2015-09-24 12:16:09.506051	2015-09-24 12:16:09.506051	\N	\N
21	Desarrollo Humano, Educación y Cultura	\N	2015-09-24 12:24:21.697395	2015-09-24 12:24:21.697395	\N	\N
22	Desarrollo Humano, Educación y Cultura	\N	2015-09-24 12:39:15.755571	2015-09-24 12:39:15.755571	\N	\N
23	Desarrollo Humano, Educación y Cultura	\N	2015-09-24 12:44:53.523175	2015-09-24 12:44:53.523175	\N	\N
24	Desarrollo Humano, Educación y Cultura	\N	2015-09-24 13:32:37.753921	2015-09-24 13:32:37.753921	\N	\N
25	Gobierno, Peticiones Generales, Acuerdos, Interpretaciones y Rel. Inst	\N	2015-09-24 13:53:14.459005	2015-09-24 13:53:14.459005	\N	\N
26	Desarrollo Social, Salud y Deporte	\N	2015-09-24 13:53:14.464436	2015-09-24 13:53:14.464436	\N	\N
27	Gobierno, Peticiones Generales, Acuerdos, Interpretaciones y Rel. Inst	\N	2015-09-24 14:13:03.911867	2015-09-24 14:13:03.911867	\N	\N
28	Servicios Públicos y Transporte	\N	2015-09-24 14:42:21.966317	2015-09-24 14:42:21.966317	\N	\N
29	Obras Públicas y Vialidad	\N	2015-09-24 14:42:21.971462	2015-09-24 14:42:21.971462	\N	\N
30	Desarrollo Social, Salud y Deporte	\N	2015-09-24 14:42:21.976049	2015-09-24 14:42:21.976049	\N	\N
31	Planificación y Desarrollo Sustentable	\N	2015-09-24 14:48:56.910531	2015-09-24 14:48:56.910531	\N	\N
32	Economía y Presupuesto	\N	2015-09-24 14:53:40.491057	2015-09-24 14:53:40.491057	\N	\N
33	Economía y Presupuesto	\N	2015-09-24 14:55:22.297269	2015-09-24 14:55:22.297269	\N	\N
34	Economía y Presupuesto	\N	2015-09-29 15:26:50.768451	2015-09-29 15:26:50.768451	\N	\N
35	Economía y Presupuesto	\N	2015-09-29 15:44:46.341439	2015-09-29 15:44:46.341439	\N	\N
36	Gobierno, Peticiones Generales, Acuerdos, Interpretaciones y Rel. Inst	\N	2015-09-29 15:44:46.346567	2015-09-29 15:44:46.346567	\N	\N
37	Desarrollo Humano, Educación y Cultura	\N	2015-09-30 15:26:54.408526	2015-09-30 15:26:54.408526	\N	\N
38	Gobierno, Peticiones Generales, Acuerdos, Interpretaciones y Rel. Inst	\N	2015-09-30 15:30:00.638868	2015-09-30 15:30:00.638868	\N	\N
39	Desarrollo Social, Salud y Deporte	\N	2015-09-30 15:53:11.543636	2015-09-30 15:53:11.543636	\N	\N
40	Economía y Presupuesto	\N	2015-09-30 15:53:11.548716	2015-09-30 15:53:11.548716	\N	\N
41		\N	2015-09-30 15:53:11.553338	2015-09-30 15:53:11.553338	\N	\N
42	Gobierno, Peticiones Generales, Acuerdos, Interpretaciones y Rel. Inst	\N	2015-09-30 16:03:20.11337	2015-09-30 16:03:20.11337	\N	\N
43	Gobierno, Peticiones Generales, Acuerdos, Interpretaciones y Rel. Inst	\N	2015-09-30 16:07:45.483774	2015-09-30 16:07:45.483774	\N	\N
44	Desarrollo Social, Salud y Deporte	\N	2015-09-30 16:13:57.139599	2015-09-30 16:13:57.139599	\N	\N
45	Desarrollo Social, Salud y Deporte	\N	2015-10-01 14:33:46.51514	2015-10-01 14:33:46.51514	\N	\N
46	Economía y Presupuesto	\N	2015-10-01 14:33:46.52012	2015-10-01 14:33:46.52012	\N	\N
47	Desarrollo Social, Salud y Deporte	\N	2015-10-01 15:17:37.340432	2015-10-01 15:17:37.340432	\N	\N
48	Economía y Presupuesto	\N	2015-10-01 15:17:37.345506	2015-10-01 15:17:37.345506	\N	\N
49	Desarrollo Social, Salud y Deporte	\N	2015-10-01 15:35:53.754333	2015-10-01 15:35:53.754333	\N	\N
50	Economía y Presupuesto	\N	2015-10-01 15:35:53.759673	2015-10-01 15:35:53.759673	\N	\N
51	Desarrollo Social, Salud y Deporte	\N	2015-10-01 15:49:37.971779	2015-10-01 15:49:37.971779	\N	\N
52	Economía y Presupuesto	\N	2015-10-01 15:49:37.976897	2015-10-01 15:49:37.976897	\N	\N
53	Derechos Humanos	\N	2015-10-06 14:42:56.697369	2015-10-06 14:42:56.697369	\N	\N
54	Economía y Presupuesto	\N	2015-10-06 16:08:28.535052	2015-10-06 16:08:28.535052	\N	\N
55	Economía y Presupuesto	\N	2015-10-06 16:12:41.793598	2015-10-06 16:12:41.793598	\N	\N
56	Economía y Presupuesto	\N	2015-10-06 16:15:12.144359	2015-10-06 16:15:12.144359	\N	\N
57	Economía y Presupuesto	\N	2015-10-06 16:21:00.825812	2015-10-06 16:21:00.825812	\N	\N
58	Economía y Presupuesto	\N	2015-10-06 16:24:05.429833	2015-10-06 16:24:05.429833	\N	\N
59	Economía y Presupuesto	\N	2015-10-06 16:27:10.842153	2015-10-06 16:27:10.842153	\N	\N
60	Desarrollo Social, Salud y Deporte	\N	2015-10-07 14:55:08.372887	2015-10-07 14:55:08.372887	\N	\N
61	Desarrollo Social, Salud y Deporte	\N	2015-10-07 15:01:00.496065	2015-10-07 15:01:00.496065	\N	\N
62	Economía y Presupuesto	\N	2015-10-07 15:01:00.50143	2015-10-07 15:01:00.50143	\N	\N
63	Gobierno, Peticiones Generales, Acuerdos, Interpretaciones y Rel. Inst	\N	2015-10-07 15:11:30.414345	2015-10-07 15:11:30.414345	\N	\N
64	Gobierno, Peticiones Generales, Acuerdos, Interpretaciones y Rel. Inst	\N	2015-10-07 15:13:06.24823	2015-10-07 15:13:06.24823	\N	\N
65	Desarrollo Social, Salud y Deporte	\N	2015-10-07 15:59:19.863378	2015-10-07 15:59:19.863378	\N	\N
66	Economía y Presupuesto	\N	2015-10-07 15:59:19.868689	2015-10-07 15:59:19.868689	\N	\N
67	Desarrollo Social, Salud y Deporte	\N	2015-10-07 16:15:40.162553	2015-10-07 16:15:40.162553	\N	\N
68	Economía y Presupuesto	\N	2015-10-07 16:15:40.167708	2015-10-07 16:15:40.167708	\N	\N
69	Servicios Públicos y Transporte	\N	2015-10-08 10:37:22.107132	2015-10-08 10:37:22.107132	\N	\N
70	Servicios Públicos y Transporte	\N	2015-10-08 10:40:24.28062	2015-10-08 10:40:24.28062	\N	\N
71	Desarrollo Social, Salud y Deporte	\N	2015-10-08 11:04:05.639674	2015-10-08 11:04:05.639674	\N	\N
72	Economía y Presupuesto	\N	2015-10-08 11:04:05.644815	2015-10-08 11:04:05.644815	\N	\N
73	Desarrollo Social, Salud y Deporte	\N	2015-10-08 11:09:39.012372	2015-10-08 11:09:39.012372	\N	\N
74	Economía y Presupuesto	\N	2015-10-08 11:09:39.017605	2015-10-08 11:09:39.017605	\N	\N
75	Desarrollo Social, Salud y Deporte	\N	2015-10-08 11:13:35.131364	2015-10-08 11:13:35.131364	\N	\N
76	Gobierno, Peticiones Generales, Acuerdos, Interpretaciones y Rel. Inst	\N	2015-10-14 14:13:43.86956	2015-10-14 14:13:43.86956	\N	\N
77	Economía y Presupuesto	\N	2015-10-14 14:13:43.8746	2015-10-14 14:13:43.8746	\N	\N
78		\N	2015-10-14 14:15:20.372622	2015-10-14 14:15:20.372622	\N	\N
79	Economía y Presupuesto	\N	2015-10-14 14:25:03.229328	2015-10-14 14:25:03.229328	\N	\N
80	Economía y Presupuesto	\N	2015-10-14 14:26:55.475912	2015-10-14 14:26:55.475912	\N	\N
81	Gobierno, Peticiones Generales, Acuerdos, Interpretaciones y Rel. Inst	\N	2015-10-14 15:43:17.907782	2015-10-14 15:43:17.907782	\N	\N
82	Desarrollo Humano, Educación y Cultura	\N	2015-10-14 15:47:40.896618	2015-10-14 15:47:40.896618	\N	\N
83	Desarrollo Humano, Educación y Cultura	\N	2015-10-14 15:52:02.469696	2015-10-14 15:52:02.469696	\N	\N
84	Economía y Presupuesto	\N	2015-10-14 16:08:17.629613	2015-10-14 16:08:17.629613	\N	\N
85	Desarrollo Humano, Educación y Cultura	\N	2015-10-14 16:08:17.634696	2015-10-14 16:08:17.634696	\N	\N
86	Economía y Presupuesto	\N	2015-10-15 10:57:52.113987	2015-10-15 10:57:52.113987	\N	\N
87	Desarrollo Humano, Educación y Cultura	\N	2015-10-15 10:57:52.119372	2015-10-15 10:57:52.119372	\N	\N
88	Coordinación y Planificación de Labor	\N	2015-10-21 12:46:21.842397	2015-10-21 12:46:21.842397	\N	\N
89	Desarrollo Humano, Educación y Cultura	\N	2015-10-21 15:06:00.416805	2015-10-21 15:06:00.416805	\N	\N
90	Desarrollo Social, Salud y Deporte	\N	2015-10-21 16:14:33.372937	2015-10-21 16:14:33.372937	\N	\N
91	Economía y Presupuesto	\N	2015-10-21 16:14:33.378153	2015-10-21 16:14:33.378153	\N	\N
92	Gobierno, Peticiones Generales, Acuerdos, Interpretaciones y Rel. Inst	\N	2015-10-22 10:56:29.213879	2015-10-22 10:56:29.213879	\N	\N
93	Gobierno, Peticiones Generales, Acuerdos, Interpretaciones y Rel. Inst	\N	2015-10-22 11:00:35.370498	2015-10-22 11:00:35.370498	\N	\N
94	Economía y Presupuesto	\N	2015-10-22 11:05:23.13811	2015-10-22 11:05:23.13811	\N	\N
95	Economía y Presupuesto	\N	2015-10-22 11:07:56.916939	2015-10-22 11:07:56.916939	\N	\N
96	Desarrollo Social, Salud y Deporte	\N	2015-10-22 11:14:35.241648	2015-10-22 11:14:35.241648	\N	\N
97	Economía y Presupuesto	\N	2015-10-22 11:14:35.246859	2015-10-22 11:14:35.246859	\N	\N
102	Desarrollo Social, Salud y Deporte	\N	2015-10-22 12:35:05.832129	2015-10-22 12:35:05.832129	\N	\N
103	Economía y Presupuesto	\N	2015-10-22 12:35:05.837069	2015-10-22 12:35:05.837069	\N	\N
98	Desarrollo Social, Salud y Deporte	\N	2015-10-22 11:37:02.375753	2015-10-22 11:37:02.375753	\N	\N
99	Economía y Presupuesto	\N	2015-10-22 11:37:02.381018	2015-10-22 11:37:02.381018	\N	\N
100	Gobierno, Peticiones Generales, Acuerdos, Interpretaciones y Rel. Inst	\N	2015-10-22 11:52:38.554492	2015-10-22 11:52:38.554492	\N	\N
101	Economía y Presupuesto	\N	2015-10-22 11:52:38.559595	2015-10-22 11:52:38.559595	\N	\N
104	Desarrollo Social, Salud y Deporte	\N	2015-10-22 12:50:19.463041	2015-10-22 12:50:19.463041	\N	\N
105	Economía y Presupuesto	\N	2015-10-22 12:50:19.468438	2015-10-22 12:50:19.468438	\N	\N
106	Desarrollo Humano, Educación y Cultura	\N	2015-10-23 10:50:25.36908	2015-10-23 10:50:25.36908	\N	\N
107	Desarrollo Humano, Educación y Cultura	\N	2015-10-23 10:54:34.915923	2015-10-23 10:54:34.915923	\N	\N
108		\N	2015-10-28 13:25:57.027583	2015-10-28 13:25:57.027583	\N	\N
109	Obras Públicas y Vialidad	\N	2015-10-28 13:38:20.938262	2015-10-28 13:38:20.938262	\N	\N
110	Gobierno, Peticiones Generales, Acuerdos, Interpretaciones y Rel. Inst	\N	2015-10-28 14:39:49.548495	2015-10-28 14:39:49.548495	\N	\N
111	Desarrollo Social, Salud y Deporte	\N	2015-10-28 14:39:49.5538	2015-10-28 14:39:49.5538	\N	\N
112	Desarrollo Social, Salud y Deporte	\N	2015-10-28 14:44:16.336764	2015-10-28 14:44:16.336764	\N	\N
113	Desarrollo Social, Salud y Deporte	\N	2015-10-28 14:48:43.025667	2015-10-28 14:48:43.025667	\N	\N
114	Economía y Presupuesto	\N	2015-10-28 14:48:43.030596	2015-10-28 14:48:43.030596	\N	\N
115	Desarrollo Social, Salud y Deporte	\N	2015-10-28 14:56:20.288572	2015-10-28 14:56:20.288572	\N	\N
116	Economía y Presupuesto	\N	2015-10-28 14:56:20.293952	2015-10-28 14:56:20.293952	\N	\N
117	Economía y Presupuesto	\N	2015-10-29 11:15:59.992009	2015-10-29 11:15:59.992009	\N	\N
118	Desarrollo Humano, Educación y Cultura	\N	2015-10-29 11:15:59.997117	2015-10-29 11:15:59.997117	\N	\N
119	Economía y Presupuesto	\N	2015-10-29 11:51:27.934244	2015-10-29 11:51:27.934244	\N	\N
120	Coordinación y Planificación de Labor	\N	2015-10-29 11:51:27.939582	2015-10-29 11:51:27.939582	\N	\N
121	Economía y Presupuesto	\N	2015-10-29 11:54:09.925685	2015-10-29 11:54:09.925685	\N	\N
122	Economía y Presupuesto	\N	2015-10-29 11:58:02.5551	2015-10-29 11:58:02.5551	\N	\N
123	Desarrollo Humano, Educación y Cultura	\N	2015-10-29 12:02:37.524351	2015-10-29 12:02:37.524351	\N	\N
124	Desarrollo Humano, Educación y Cultura	\N	2015-10-29 12:06:38.303856	2015-10-29 12:06:38.303856	\N	\N
125	Desarrollo Social, Salud y Deporte	\N	2015-10-29 12:26:38.487011	2015-10-29 12:26:38.487011	\N	\N
126	Economía y Presupuesto	\N	2015-10-29 12:26:38.49222	2015-10-29 12:26:38.49222	\N	\N
127	Desarrollo Social, Salud y Deporte	\N	2015-10-29 12:30:51.464468	2015-10-29 12:30:51.464468	\N	\N
128	Economía y Presupuesto	\N	2015-10-29 12:30:51.469559	2015-10-29 12:30:51.469559	\N	\N
129	Economía y Presupuesto	\N	2015-11-05 11:10:35.344447	2015-11-05 11:10:35.344447	\N	\N
130	Desarrollo Social, Salud y Deporte	\N	2015-11-05 11:21:37.901736	2015-11-05 11:21:37.901736	\N	\N
131	Economía y Presupuesto	\N	2015-11-05 11:21:37.907152	2015-11-05 11:21:37.907152	\N	\N
132	Desarrollo Humano, Educación y Cultura	\N	2015-11-05 11:25:11.8777	2015-11-05 11:25:11.8777	\N	\N
133	Desarrollo Social, Salud y Deporte	\N	2015-11-05 11:44:29.693287	2015-11-05 11:44:29.693287	\N	\N
134	Desarrollo Social, Salud y Deporte	\N	2015-11-05 12:31:53.736597	2015-11-05 12:31:53.736597	\N	\N
135	Economía y Presupuesto	\N	2015-11-05 12:31:53.741757	2015-11-05 12:31:53.741757	\N	\N
136	Desarrollo Social, Salud y Deporte	\N	2015-11-05 12:38:28.893725	2015-11-05 12:38:28.893725	\N	\N
137	Desarrollo Social, Salud y Deporte	\N	2015-11-05 12:51:32.204956	2015-11-05 12:51:32.204956	\N	\N
138	Economía y Presupuesto	\N	2015-11-05 12:51:32.210253	2015-11-05 12:51:32.210253	\N	\N
139	Desarrollo Social, Salud y Deporte	\N	2015-11-05 12:57:49.96479	2015-11-05 12:57:49.96479	\N	\N
140	Economía y Presupuesto	\N	2015-11-05 12:57:49.97006	2015-11-05 12:57:49.97006	\N	\N
141	Desarrollo Social, Salud y Deporte	\N	2015-11-05 13:03:10.916653	2015-11-05 13:03:10.916653	\N	\N
142	Economía y Presupuesto	\N	2015-11-05 13:03:10.921988	2015-11-05 13:03:10.921988	\N	\N
143	Desarrollo Social, Salud y Deporte	\N	2015-11-05 13:43:04.501193	2015-11-05 13:43:04.501193	\N	\N
144	Economía y Presupuesto	\N	2015-11-05 13:43:04.506566	2015-11-05 13:43:04.506566	\N	\N
145	Desarrollo Social, Salud y Deporte	\N	2015-11-06 10:57:09.747335	2015-11-06 10:57:09.747335	\N	\N
146	Desarrollo Social, Salud y Deporte	\N	2015-11-06 11:10:18.97778	2015-11-06 11:10:18.97778	\N	\N
147	Economía y Presupuesto	\N	2015-11-06 11:10:18.982959	2015-11-06 11:10:18.982959	\N	\N
148	Desarrollo Humano, Educación y Cultura	\N	2015-11-12 12:51:44.188401	2015-11-12 12:51:44.188401	\N	\N
149	Desarrollo Humano, Educación y Cultura	\N	2015-11-12 12:57:01.38453	2015-11-12 12:57:01.38453	\N	\N
150	Desarrollo Humano, Educación y Cultura	\N	2015-11-12 13:00:44.968572	2015-11-12 13:00:44.968572	\N	\N
151	Desarrollo Humano, Educación y Cultura	\N	2015-11-12 13:09:46.334657	2015-11-12 13:09:46.334657	\N	\N
152	Economía y Presupuesto	\N	2015-11-12 13:49:38.766098	2015-11-12 13:49:38.766098	\N	\N
153	Desarrollo Social, Salud y Deporte	\N	2015-11-12 13:53:35.964602	2015-11-12 13:53:35.964602	\N	\N
154	Economía y Presupuesto	\N	2015-11-12 13:53:35.969799	2015-11-12 13:53:35.969799	\N	\N
155	Desarrollo Social, Salud y Deporte	\N	2015-11-12 14:02:16.06636	2015-11-12 14:02:16.06636	\N	\N
156	Economía y Presupuesto	\N	2015-11-12 14:02:16.071649	2015-11-12 14:02:16.071649	\N	\N
157	Desarrollo Social, Salud y Deporte	\N	2015-11-12 14:09:50.056108	2015-11-12 14:09:50.056108	\N	\N
158	Economía y Presupuesto	\N	2015-11-12 14:09:50.061347	2015-11-12 14:09:50.061347	\N	\N
159	Economía y Presupuesto	\N	2015-11-12 14:13:30.823213	2015-11-12 14:13:30.823213	\N	\N
160	Desarrollo Humano, Educación y Cultura	\N	2015-11-12 14:13:30.828345	2015-11-12 14:13:30.828345	\N	\N
161	Economía y Presupuesto	\N	2015-11-12 14:15:46.644477	2015-11-12 14:15:46.644477	\N	\N
162	Derechos Humanos	\N	2015-11-17 15:11:41.408143	2015-11-17 15:11:41.408143	\N	\N
163	Gobierno, Peticiones Generales, Acuerdos, Interpretaciones y Rel. Inst	\N	2015-11-18 15:25:59.847547	2015-11-18 15:25:59.847547	\N	\N
164	Gobierno, Peticiones Generales, Acuerdos, Interpretaciones y Rel. Inst	\N	2015-11-18 15:30:50.48369	2015-11-18 15:30:50.48369	\N	\N
165	Economía y Presupuesto	\N	2015-11-18 15:40:30.464613	2015-11-18 15:40:30.464613	\N	\N
166	Desarrollo Humano, Educación y Cultura	\N	2015-11-18 15:40:30.482228	2015-11-18 15:40:30.482228	\N	\N
167	Economía y Presupuesto	\N	2015-11-18 15:45:35.763171	2015-11-18 15:45:35.763171	\N	\N
168	Desarrollo Humano, Educación y Cultura	\N	2015-11-18 15:45:35.768467	2015-11-18 15:45:35.768467	\N	\N
169	Desarrollo Social, Salud y Deporte	\N	2015-11-18 15:52:22.580737	2015-11-18 15:52:22.580737	\N	\N
170	Economía y Presupuesto	\N	2015-11-18 15:52:22.586341	2015-11-18 15:52:22.586341	\N	\N
171	Desarrollo Social, Salud y Deporte	\N	2015-11-19 11:23:45.625829	2015-11-19 11:23:45.625829	\N	\N
172	Economía y Presupuesto	\N	2015-11-19 11:23:45.631188	2015-11-19 11:23:45.631188	\N	\N
173	Desarrollo Social, Salud y Deporte	\N	2015-11-19 12:03:56.952188	2015-11-19 12:03:56.952188	\N	\N
174	Economía y Presupuesto	\N	2015-11-19 12:03:56.95755	2015-11-19 12:03:56.95755	\N	\N
175	Desarrollo Social, Salud y Deporte	\N	2015-11-19 12:08:16.359587	2015-11-19 12:08:16.359587	\N	\N
176	Economía y Presupuesto	\N	2015-11-19 12:08:16.36477	2015-11-19 12:08:16.36477	\N	\N
177	Desarrollo Social, Salud y Deporte	\N	2015-11-19 12:14:03.971127	2015-11-19 12:14:03.971127	\N	\N
178	Economía y Presupuesto	\N	2015-11-19 12:25:54.045407	2015-11-19 12:25:54.045407	\N	\N
179	Desarrollo Económico y Relaciones Internacionales	\N	2015-11-19 12:25:54.050512	2015-11-19 12:25:54.050512	\N	\N
180	Desarrollo Humano, Educación y Cultura	\N	2015-11-19 12:25:54.054888	2015-11-19 12:25:54.054888	\N	\N
181	Desarrollo Social, Salud y Deporte	\N	2015-11-19 12:25:54.05922	2015-11-19 12:25:54.05922	\N	\N
182	Planificación y Desarrollo Sustentable	\N	2015-11-19 12:25:54.063335	2015-11-19 12:25:54.063335	\N	\N
183	Gobierno, Peticiones Generales, Acuerdos, Interpretaciones y Rel. Inst	\N	2015-11-19 12:25:54.067422	2015-11-19 12:25:54.067422	\N	\N
184	Obras Públicas y Vialidad	\N	2015-11-19 12:25:54.07153	2015-11-19 12:25:54.07153	\N	\N
185	Servicios Públicos y Transporte	\N	2015-11-19 12:25:54.075557	2015-11-19 12:25:54.075557	\N	\N
186	Derechos Humanos	\N	2015-11-19 12:25:54.079565	2015-11-19 12:25:54.079565	\N	\N
187	COM. REFORMA POLITICA	\N	2015-11-19 12:25:54.083565	2015-11-19 12:25:54.083565	\N	\N
188	COMISION ESPECIAL DE REFORMA DEL REGLAMENTO INTERNO	\N	2015-11-19 12:25:54.087562	2015-11-19 12:25:54.087562	\N	\N
189	Economía y Presupuesto	\N	2015-11-19 13:01:07.502903	2015-11-19 13:01:07.502903	\N	\N
190	Desarrollo Económico y Relaciones Internacionales	\N	2015-11-19 13:01:07.508043	2015-11-19 13:01:07.508043	\N	\N
191	Desarrollo Humano, Educación y Cultura	\N	2015-11-19 13:01:07.512358	2015-11-19 13:01:07.512358	\N	\N
192	Desarrollo Social, Salud y Deporte	\N	2015-11-19 13:01:07.516587	2015-11-19 13:01:07.516587	\N	\N
193	Planificación y Desarrollo Sustentable	\N	2015-11-19 13:01:07.520795	2015-11-19 13:01:07.520795	\N	\N
194	Gobierno, Peticiones Generales, Acuerdos, Interpretaciones y Rel. Inst	\N	2015-11-19 13:01:07.524973	2015-11-19 13:01:07.524973	\N	\N
195	Obras Públicas y Vialidad	\N	2015-11-19 13:01:07.529176	2015-11-19 13:01:07.529176	\N	\N
196	Servicios Públicos y Transporte	\N	2015-11-19 13:01:07.533394	2015-11-19 13:01:07.533394	\N	\N
197	Derechos Humanos	\N	2015-11-19 13:01:07.537625	2015-11-19 13:01:07.537625	\N	\N
198	COM. REFORMA POLITICA	\N	2015-11-19 13:01:07.541805	2015-11-19 13:01:07.541805	\N	\N
199	COMISION ESPECIAL DE REFORMA DEL REGLAMENTO INTERNO	\N	2015-11-19 13:01:07.545661	2015-11-19 13:01:07.545661	\N	\N
200	Economía y Presupuesto	\N	2015-11-19 13:07:44.484056	2015-11-19 13:07:44.484056	\N	\N
201	Desarrollo Económico y Relaciones Internacionales	\N	2015-11-19 13:07:44.489292	2015-11-19 13:07:44.489292	\N	\N
202	Desarrollo Humano, Educación y Cultura	\N	2015-11-19 13:07:44.493746	2015-11-19 13:07:44.493746	\N	\N
203	Desarrollo Social, Salud y Deporte	\N	2015-11-19 13:07:44.498154	2015-11-19 13:07:44.498154	\N	\N
204	Planificación y Desarrollo Sustentable	\N	2015-11-19 13:07:44.5025	2015-11-19 13:07:44.5025	\N	\N
205	Gobierno, Peticiones Generales, Acuerdos, Interpretaciones y Rel. Inst	\N	2015-11-19 13:07:44.50666	2015-11-19 13:07:44.50666	\N	\N
206	Obras Públicas y Vialidad	\N	2015-11-19 13:07:44.510844	2015-11-19 13:07:44.510844	\N	\N
207	Servicios Públicos y Transporte	\N	2015-11-19 13:07:44.514859	2015-11-19 13:07:44.514859	\N	\N
211	Desarrollo Social, Salud y Deporte	\N	2015-11-19 15:38:13.030539	2015-11-19 15:38:13.030539	\N	\N
212	Economía y Presupuesto	\N	2015-11-19 15:38:13.035829	2015-11-19 15:38:13.035829	\N	\N
208	Desarrollo Social, Salud y Deporte	\N	2015-11-19 15:27:14.728357	2015-11-19 15:27:14.728357	\N	\N
209	Desarrollo Social, Salud y Deporte	\N	2015-11-19 15:31:48.565088	2015-11-19 15:31:48.565088	\N	\N
210	Economía y Presupuesto	\N	2015-11-19 15:31:48.570467	2015-11-19 15:31:48.570467	\N	\N
213	Desarrollo Social, Salud y Deporte	\N	2015-11-25 14:26:00.296489	2015-11-25 14:26:00.296489	\N	\N
214	Economía y Presupuesto	\N	2015-11-25 14:26:00.323237	2015-11-25 14:26:00.323237	\N	\N
215	Economía y Presupuesto	\N	2015-11-26 10:59:03.491789	2015-11-26 10:59:03.491789	\N	\N
216	Economía y Presupuesto	\N	2015-11-26 11:02:22.399214	2015-11-26 11:02:22.399214	\N	\N
217	Desarrollo Humano, Educación y Cultura	\N	2015-11-26 11:02:22.404348	2015-11-26 11:02:22.404348	\N	\N
218	Economía y Presupuesto	\N	2015-11-26 11:05:07.573123	2015-11-26 11:05:07.573123	\N	\N
219	Economía y Presupuesto	\N	2015-11-26 11:08:37.535094	2015-11-26 11:08:37.535094	\N	\N
220	Economía y Presupuesto	\N	2015-11-26 11:11:31.692713	2015-11-26 11:11:31.692713	\N	\N
221	Economía y Presupuesto	\N	2015-11-26 11:14:42.264775	2015-11-26 11:14:42.264775	\N	\N
222	Economía y Presupuesto	\N	2015-11-26 11:23:33.080933	2015-11-26 11:23:33.080933	\N	\N
223	Desarrollo Social, Salud y Deporte	\N	2015-11-26 11:45:43.690412	2015-11-26 11:45:43.690412	\N	\N
224	Economía y Presupuesto	\N	2015-11-26 11:45:43.695725	2015-11-26 11:45:43.695725	\N	\N
225	Desarrollo Social, Salud y Deporte	\N	2015-11-26 11:53:52.547719	2015-11-26 11:53:52.547719	\N	\N
226	Economía y Presupuesto	\N	2015-11-26 11:53:52.552984	2015-11-26 11:53:52.552984	\N	\N
227	Desarrollo Social, Salud y Deporte	\N	2015-11-26 11:58:34.065811	2015-11-26 11:58:34.065811	\N	\N
228	Economía y Presupuesto	\N	2015-11-26 11:58:34.071089	2015-11-26 11:58:34.071089	\N	\N
229	Desarrollo Humano, Educación y Cultura	\N	2015-12-02 14:22:34.124213	2015-12-02 14:22:34.124213	\N	\N
230	Obras Públicas y Vialidad	\N	2015-12-03 13:38:02.551133	2015-12-03 13:38:02.551133	\N	\N
231	Obras Públicas y Vialidad	\N	2015-12-03 13:47:10.512379	2015-12-03 13:47:10.512379	\N	\N
232	Gobierno, Peticiones Generales, Acuerdos, Interpretaciones y Rel. Inst	\N	2015-12-03 13:47:10.517594	2015-12-03 13:47:10.517594	\N	\N
233	Desarrollo Social, Salud y Deporte	\N	2015-12-03 13:50:09.471015	2015-12-03 13:50:09.471015	\N	\N
234	Servicios Públicos y Transporte	\N	2015-12-03 13:53:38.363471	2015-12-03 13:53:38.363471	\N	\N
235	Servicios Públicos y Transporte	\N	2015-12-03 13:55:52.071906	2015-12-03 13:55:52.071906	\N	\N
236	Servicios Públicos y Transporte	\N	2015-12-03 14:02:47.055077	2015-12-03 14:02:47.055077	\N	\N
237	Desarrollo Social, Salud y Deporte	\N	2015-12-03 14:12:42.025028	2015-12-03 14:12:42.025028	\N	\N
238	Economía y Presupuesto	\N	2015-12-03 14:12:42.0302	2015-12-03 14:12:42.0302	\N	\N
239	Desarrollo Social, Salud y Deporte	\N	2015-12-03 14:18:22.42781	2015-12-03 14:18:22.42781	\N	\N
240	Economía y Presupuesto	\N	2015-12-03 14:18:22.432953	2015-12-03 14:18:22.432953	\N	\N
241	Desarrollo Social, Salud y Deporte	\N	2015-12-03 15:05:10.674491	2015-12-03 15:05:10.674491	\N	\N
242	Economía y Presupuesto	\N	2015-12-03 15:05:10.680145	2015-12-03 15:05:10.680145	\N	\N
243	Desarrollo Social, Salud y Deporte	\N	2015-12-03 15:12:16.678064	2015-12-03 15:12:16.678064	\N	\N
244	Economía y Presupuesto	\N	2015-12-03 15:12:16.683188	2015-12-03 15:12:16.683188	\N	\N
245	Desarrollo Social, Salud y Deporte	\N	2015-12-03 15:18:41.565286	2015-12-03 15:18:41.565286	\N	\N
246	Economía y Presupuesto	\N	2015-12-03 15:18:41.5704	2015-12-03 15:18:41.5704	\N	\N
247	Gobierno, Peticiones Generales, Acuerdos, Interpretaciones y Rel. Inst	\N	2015-12-10 11:03:18.296898	2015-12-10 11:03:18.296898	\N	\N
248	Gobierno, Peticiones Generales, Acuerdos, Interpretaciones y Rel. Inst	\N	2015-12-10 11:07:02.493892	2015-12-10 11:07:02.493892	\N	\N
249	Desarrollo Social, Salud y Deporte	\N	2015-12-10 11:11:28.302452	2015-12-10 11:11:28.302452	\N	\N
250	Economía y Presupuesto	\N	2015-12-10 11:11:28.307562	2015-12-10 11:11:28.307562	\N	\N
251	Desarrollo Social, Salud y Deporte	\N	2015-12-10 11:14:30.507509	2015-12-10 11:14:30.507509	\N	\N
252	Economía y Presupuesto	\N	2015-12-10 11:14:30.512789	2015-12-10 11:14:30.512789	\N	\N
253	Desarrollo Social, Salud y Deporte	\N	2015-12-10 11:20:46.671748	2015-12-10 11:20:46.671748	\N	\N
254	Economía y Presupuesto	\N	2015-12-10 11:20:46.676797	2015-12-10 11:20:46.676797	\N	\N
255	Desarrollo Social, Salud y Deporte	\N	2015-12-10 11:37:21.548723	2015-12-10 11:37:21.548723	\N	\N
256	Economía y Presupuesto	\N	2015-12-10 11:37:21.553839	2015-12-10 11:37:21.553839	\N	\N
257	Desarrollo Social, Salud y Deporte	\N	2015-12-10 11:55:20.060063	2015-12-10 11:55:20.060063	\N	\N
258	Economía y Presupuesto	\N	2015-12-10 11:55:20.065268	2015-12-10 11:55:20.065268	\N	\N
259	Desarrollo Social, Salud y Deporte	\N	2015-12-10 12:10:21.339499	2015-12-10 12:10:21.339499	\N	\N
260	Economía y Presupuesto	\N	2015-12-10 12:10:21.344649	2015-12-10 12:10:21.344649	\N	\N
261	Economía y Presupuesto	\N	2015-12-10 12:12:29.647008	2015-12-10 12:12:29.647008	\N	\N
262	Economía y Presupuesto	\N	2015-12-10 12:25:41.408354	2015-12-10 12:25:41.408354	\N	\N
263	Economía y Presupuesto	\N	2015-12-10 12:52:38.396075	2015-12-10 12:52:38.396075	\N	\N
264	Economía y Presupuesto	\N	2015-12-10 12:54:44.724474	2015-12-10 12:54:44.724474	\N	\N
265	Economía y Presupuesto	\N	2015-12-10 13:16:37.92276	2015-12-10 13:16:37.92276	\N	\N
266	Desarrollo Económico y Relaciones Internacionales	\N	2015-12-10 13:16:37.927815	2015-12-10 13:16:37.927815	\N	\N
267	Desarrollo Humano, Educación y Cultura	\N	2015-12-10 13:16:37.932246	2015-12-10 13:16:37.932246	\N	\N
268	Desarrollo Social, Salud y Deporte	\N	2015-12-10 13:16:37.936673	2015-12-10 13:16:37.936673	\N	\N
269	Planificación y Desarrollo Sustentable	\N	2015-12-10 13:16:37.941002	2015-12-10 13:16:37.941002	\N	\N
270	Gobierno, Peticiones Generales, Acuerdos, Interpretaciones y Rel. Inst	\N	2015-12-10 13:16:37.945143	2015-12-10 13:16:37.945143	\N	\N
271	Obras Públicas y Vialidad	\N	2015-12-10 13:16:37.949327	2015-12-10 13:16:37.949327	\N	\N
272	Servicios Públicos y Transporte	\N	2015-12-10 13:16:37.953433	2015-12-10 13:16:37.953433	\N	\N
273	Derechos Humanos	\N	2015-12-10 13:16:37.957531	2015-12-10 13:16:37.957531	\N	\N
274	COMISION ESPECIAL DE REFORMA DEL REGLAMENTO INTERNO	\N	2015-12-10 13:16:37.961585	2015-12-10 13:16:37.961585	\N	\N
275	Economía y Presupuesto	\N	2015-12-10 13:51:07.243436	2015-12-10 13:51:07.243436	\N	\N
276	Desarrollo Económico y Relaciones Internacionales	\N	2015-12-10 13:51:07.248566	2015-12-10 13:51:07.248566	\N	\N
277	Desarrollo Humano, Educación y Cultura	\N	2015-12-10 13:51:07.252953	2015-12-10 13:51:07.252953	\N	\N
278	Desarrollo Social, Salud y Deporte	\N	2015-12-10 13:51:07.257204	2015-12-10 13:51:07.257204	\N	\N
279	Gobierno, Peticiones Generales, Acuerdos, Interpretaciones y Rel. Inst	\N	2015-12-10 13:51:07.261357	2015-12-10 13:51:07.261357	\N	\N
280	Obras Públicas y Vialidad	\N	2015-12-10 13:51:07.265498	2015-12-10 13:51:07.265498	\N	\N
281	Servicios Públicos y Transporte	\N	2015-12-10 13:51:07.269749	2015-12-10 13:51:07.269749	\N	\N
282	Economía y Presupuesto	\N	2015-12-10 14:37:23.174618	2015-12-10 14:37:23.174618	\N	\N
283	Desarrollo Económico y Relaciones Internacionales	\N	2015-12-10 14:37:23.179927	2015-12-10 14:37:23.179927	\N	\N
284	Desarrollo Humano, Educación y Cultura	\N	2015-12-10 14:37:23.184367	2015-12-10 14:37:23.184367	\N	\N
285	Desarrollo Social, Salud y Deporte	\N	2015-12-10 14:37:23.188794	2015-12-10 14:37:23.188794	\N	\N
286	Planificación y Desarrollo Sustentable	\N	2015-12-10 14:37:23.193097	2015-12-10 14:37:23.193097	\N	\N
287	Gobierno, Peticiones Generales, Acuerdos, Interpretaciones y Rel. Inst	\N	2015-12-10 14:37:23.197272	2015-12-10 14:37:23.197272	\N	\N
288	Obras Públicas y Vialidad	\N	2015-12-10 14:37:23.201469	2015-12-10 14:37:23.201469	\N	\N
289	Servicios Públicos y Transporte	\N	2015-12-10 14:37:23.205725	2015-12-10 14:37:23.205725	\N	\N
290	Derechos Humanos	\N	2015-12-10 14:37:23.209954	2015-12-10 14:37:23.209954	\N	\N
291	COM. REFORMA POLITICA	\N	2015-12-10 14:37:23.214142	2015-12-10 14:37:23.214142	\N	\N
292	COMISION ESPECIAL DE REFORMA DEL REGLAMENTO INTERNO	\N	2015-12-10 14:37:23.218148	2015-12-10 14:37:23.218148	\N	\N
293	Gobierno, Peticiones Generales, Acuerdos, Interpretaciones y Rel. Inst	\N	2015-12-10 14:41:40.467716	2015-12-10 14:41:40.467716	\N	\N
294	Desarrollo Social, Salud y Deporte	\N	2015-12-10 14:41:40.473132	2015-12-10 14:41:40.473132	\N	\N
295	Gobierno, Peticiones Generales, Acuerdos, Interpretaciones y Rel. Inst	\N	2015-12-10 14:43:38.712937	2015-12-10 14:43:38.712937	\N	\N
296	Gobierno, Peticiones Generales, Acuerdos, Interpretaciones y Rel. Inst	\N	2015-12-10 14:47:15.068021	2015-12-10 14:47:15.068021	\N	\N
297	Economía y Presupuesto	\N	2015-12-10 15:00:26.904697	2015-12-10 15:00:26.904697	\N	\N
298	Planificación y Desarrollo Sustentable	\N	2015-12-15 16:12:42.919272	2015-12-15 16:12:42.919272	\N	\N
299	Obras Públicas y Vialidad	\N	2015-12-15 16:12:42.924336	2015-12-15 16:12:42.924336	\N	\N
300	Economía y Presupuesto	\N	2015-12-17 10:48:51.335685	2015-12-17 10:48:51.335685	\N	\N
301	Economía y Presupuesto	\N	2015-12-17 10:53:17.835187	2015-12-17 10:53:17.835187	\N	\N
302	Gobierno, Peticiones Generales, Acuerdos, Interpretaciones y Rel. Inst	\N	2015-12-17 10:58:21.930298	2015-12-17 10:58:21.930298	\N	\N
303	Planificación y Desarrollo Sustentable	\N	2015-12-17 10:58:21.935422	2015-12-17 10:58:21.935422	\N	\N
304	Gobierno, Peticiones Generales, Acuerdos, Interpretaciones y Rel. Inst	\N	2015-12-17 11:02:20.360442	2015-12-17 11:02:20.360442	\N	\N
306	Gobierno, Peticiones Generales, Acuerdos, Interpretaciones y Rel. Inst	\N	2015-12-17 11:19:04.822462	2015-12-17 11:19:04.822462	\N	\N
307	Servicios Públicos y Transporte	\N	2015-12-17 11:28:19.969995	2015-12-17 11:28:19.969995	\N	\N
308	Servicios Públicos y Transporte	\N	2015-12-17 11:34:02.703212	2015-12-17 11:34:02.703212	\N	\N
309	Servicios Públicos y Transporte	\N	2015-12-17 11:39:28.564467	2015-12-17 11:39:28.564467	\N	\N
310	Economía y Presupuesto	\N	2015-12-17 11:43:43.120645	2015-12-17 11:43:43.120645	\N	\N
311	Economía y Presupuesto	\N	2015-12-17 11:47:23.532991	2015-12-17 11:47:23.532991	\N	\N
312	Economía y Presupuesto	\N	2015-12-17 12:03:37.449628	2015-12-17 12:03:37.449628	\N	\N
315	Economía y Presupuesto	\N	2015-12-17 12:32:13.369101	2015-12-17 12:32:13.369101	\N	\N
316	Economía y Presupuesto	\N	2015-12-17 12:36:21.217041	2015-12-17 12:36:21.217041	\N	\N
317	Desarrollo Humano, Educación y Cultura	\N	2015-12-17 12:36:21.222078	2015-12-17 12:36:21.222078	\N	\N
328	Desarrollo Social, Salud y Deporte	\N	2015-12-21 10:53:24.943975	2015-12-21 10:53:24.943975	\N	\N
329	Economía y Presupuesto	\N	2015-12-21 10:53:24.949099	2015-12-21 10:53:24.949099	\N	\N
330	Planificación y Desarrollo Sustentable	\N	2015-12-21 10:57:02.243842	2015-12-21 10:57:02.243842	\N	\N
331	Gobierno, Peticiones Generales, Acuerdos, Interpretaciones y Rel. Inst	\N	2015-12-21 10:57:02.249033	2015-12-21 10:57:02.249033	\N	\N
334	Desarrollo Social, Salud y Deporte	\N	2015-12-21 11:34:18.806893	2015-12-21 11:34:18.806893	\N	\N
335	Economía y Presupuesto	\N	2015-12-21 11:34:18.812098	2015-12-21 11:34:18.812098	\N	\N
336	Desarrollo Social, Salud y Deporte	\N	2015-12-21 11:54:52.846164	2015-12-21 11:54:52.846164	\N	\N
337	Economía y Presupuesto	\N	2015-12-21 11:54:52.851451	2015-12-21 11:54:52.851451	\N	\N
338	Desarrollo Social, Salud y Deporte	\N	2015-12-21 12:00:59.373584	2015-12-21 12:00:59.373584	\N	\N
339	Economía y Presupuesto	\N	2015-12-21 12:00:59.378665	2015-12-21 12:00:59.378665	\N	\N
340	Planificación y Desarrollo Sustentable	\N	2015-12-21 12:04:11.802961	2015-12-21 12:04:11.802961	\N	\N
343	Desarrollo Social, Salud y Deporte	\N	2015-12-21 12:15:25.154321	2015-12-21 12:15:25.154321	\N	\N
344	Economía y Presupuesto	\N	2015-12-21 12:15:25.160676	2015-12-21 12:15:25.160676	\N	\N
345	Desarrollo Social, Salud y Deporte	\N	2015-12-21 12:20:54.650249	2015-12-21 12:20:54.650249	\N	\N
346	Economía y Presupuesto	\N	2015-12-21 12:20:54.655513	2015-12-21 12:20:54.655513	\N	\N
347	Desarrollo Social, Salud y Deporte	\N	2015-12-21 12:25:38.414275	2015-12-21 12:25:38.414275	\N	\N
348	Desarrollo Social, Salud y Deporte	\N	2015-12-21 12:33:07.117449	2015-12-21 12:33:07.117449	\N	\N
349	Economía y Presupuesto	\N	2015-12-21 12:33:07.122644	2015-12-21 12:33:07.122644	\N	\N
355	Gobierno, Peticiones Generales, Acuerdos, Interpretaciones y Rel. Inst	\N	2015-12-22 11:14:28.363662	2015-12-22 11:14:28.363662	\N	\N
356	Gobierno, Peticiones Generales, Acuerdos, Interpretaciones y Rel. Inst	\N	2015-12-22 11:17:44.153101	2015-12-22 11:17:44.153101	\N	\N
358	Planificación y Desarrollo Sustentable	\N	2015-12-22 11:32:58.981486	2015-12-22 11:32:58.981486	\N	\N
305	Gobierno, Peticiones Generales, Acuerdos, Interpretaciones y Rel. Inst	\N	2015-12-17 11:05:52.384529	2015-12-17 11:05:52.384529	\N	\N
313	Economía y Presupuesto	\N	2015-12-17 12:13:10.323701	2015-12-17 12:13:10.323701	\N	\N
314	Economía y Presupuesto	\N	2015-12-17 12:16:50.286092	2015-12-17 12:16:50.286092	\N	\N
318	Gobierno, Peticiones Generales, Acuerdos, Interpretaciones y Rel. Inst	\N	2015-12-17 12:43:14.031727	2015-12-17 12:43:14.031727	\N	\N
319	Economía y Presupuesto	\N	2015-12-17 12:43:14.03673	2015-12-17 12:43:14.03673	\N	\N
320	Gobierno, Peticiones Generales, Acuerdos, Interpretaciones y Rel. Inst	\N	2015-12-18 15:12:11.525954	2015-12-18 15:12:11.525954	\N	\N
321	Servicios Públicos y Transporte	\N	2015-12-18 15:51:55.729586	2015-12-18 15:51:55.729586	\N	\N
322		\N	2015-12-18 15:51:55.734929	2015-12-18 15:51:55.734929	\N	\N
323	Desarrollo Social, Salud y Deporte	\N	2015-12-21 10:39:10.260264	2015-12-21 10:39:10.260264	\N	\N
324	Gobierno, Peticiones Generales, Acuerdos, Interpretaciones y Rel. Inst	\N	2015-12-21 10:39:10.265464	2015-12-21 10:39:10.265464	\N	\N
325	Desarrollo Social, Salud y Deporte	\N	2015-12-21 10:45:42.622557	2015-12-21 10:45:42.622557	\N	\N
326	Economía y Presupuesto	\N	2015-12-21 10:45:42.627725	2015-12-21 10:45:42.627725	\N	\N
327	Planificación y Desarrollo Sustentable	\N	2015-12-21 10:48:32.268774	2015-12-21 10:48:32.268774	\N	\N
332	Desarrollo Social, Salud y Deporte	\N	2015-12-21 11:01:52.228258	2015-12-21 11:01:52.228258	\N	\N
333	Economía y Presupuesto	\N	2015-12-21 11:01:52.233321	2015-12-21 11:01:52.233321	\N	\N
341	Desarrollo Social, Salud y Deporte	\N	2015-12-21 12:10:01.397906	2015-12-21 12:10:01.397906	\N	\N
342	Economía y Presupuesto	\N	2015-12-21 12:10:01.403019	2015-12-21 12:10:01.403019	\N	\N
350	Desarrollo Social, Salud y Deporte	\N	2015-12-21 12:37:35.276828	2015-12-21 12:37:35.276828	\N	\N
351	Economía y Presupuesto	\N	2015-12-21 12:37:35.281891	2015-12-21 12:37:35.281891	\N	\N
352	Desarrollo Social, Salud y Deporte	\N	2015-12-21 12:42:46.649729	2015-12-21 12:42:46.649729	\N	\N
353	Economía y Presupuesto	\N	2015-12-21 12:42:46.654791	2015-12-21 12:42:46.654791	\N	\N
354	Economía y Presupuesto	\N	2015-12-21 12:50:41.244432	2015-12-21 12:50:41.244432	\N	\N
357	Planificación y Desarrollo Sustentable	\N	2015-12-22 11:19:49.292773	2015-12-22 11:19:49.292773	\N	\N
359	Planificación y Desarrollo Sustentable	\N	2015-12-22 11:42:22.633509	2015-12-22 11:42:22.633509	\N	\N
360	Desarrollo Económico y Relaciones Internacionales	\N	2015-12-22 11:45:10.55855	2015-12-22 11:45:10.55855	\N	\N
361	Economía y Presupuesto	\N	2015-12-22 11:48:11.869598	2015-12-22 11:48:11.869598	\N	\N
362	Economía y Presupuesto	\N	2015-12-22 11:53:56.637873	2015-12-22 11:53:56.637873	\N	\N
363	Desarrollo Social, Salud y Deporte	\N	2015-12-22 12:11:48.196995	2015-12-22 12:11:48.196995	\N	\N
364	Economía y Presupuesto	\N	2015-12-22 12:11:48.202092	2015-12-22 12:11:48.202092	\N	\N
365	Desarrollo Social, Salud y Deporte	\N	2015-12-22 12:20:03.222738	2015-12-22 12:20:03.222738	\N	\N
366	Economía y Presupuesto	\N	2015-12-22 12:20:03.227947	2015-12-22 12:20:03.227947	\N	\N
367	Desarrollo Social, Salud y Deporte	\N	2015-12-22 12:44:53.273801	2015-12-22 12:44:53.273801	\N	\N
368	Economía y Presupuesto	\N	2015-12-22 12:44:53.27916	2015-12-22 12:44:53.27916	\N	\N
369	Desarrollo Social, Salud y Deporte	\N	2015-12-22 14:02:21.415532	2015-12-22 14:02:21.415532	\N	\N
370	Economía y Presupuesto	\N	2015-12-22 14:02:21.430998	2015-12-22 14:02:21.430998	\N	\N
371	Economía y Presupuesto	\N	2015-12-22 14:06:51.523932	2015-12-22 14:06:51.523932	\N	\N
372	Economía y Presupuesto	\N	2015-12-22 14:09:45.679854	2015-12-22 14:09:45.679854	\N	\N
373	Economía y Presupuesto	\N	2015-12-22 14:12:50.558097	2015-12-22 14:12:50.558097	\N	\N
374	Economía y Presupuesto	\N	2015-12-22 14:21:18.38603	2015-12-22 14:21:18.38603	\N	\N
375	Economía y Presupuesto	\N	2015-12-22 14:26:17.252866	2015-12-22 14:26:17.252866	\N	\N
376	Economía y Presupuesto	\N	2015-12-22 14:37:08.253983	2015-12-22 14:37:08.253983	\N	\N
377	Economía y Presupuesto	\N	2015-12-22 14:42:34.532557	2015-12-22 14:42:34.532557	\N	\N
378	Planificación y Desarrollo Sustentable	\N	2015-12-28 13:58:07.15666	2015-12-28 13:58:07.15666	\N	\N
379	Gobierno, Peticiones Generales, Acuerdos, Interpretaciones y Rel. Inst	\N	2015-12-28 14:50:21.982648	2015-12-28 14:50:21.982648	\N	\N
380	Economía y Presupuesto	\N	2015-12-28 15:35:18.876518	2015-12-28 15:35:18.876518	\N	\N
381	Economía y Presupuesto	\N	2015-12-28 15:38:13.519261	2015-12-28 15:38:13.519261	\N	\N
382	Economía y Presupuesto	\N	2015-12-28 15:42:29.480071	2015-12-28 15:42:29.480071	\N	\N
383	Economía y Presupuesto	\N	2015-12-29 11:04:47.874868	2015-12-29 11:04:47.874868	\N	\N
384	Gobierno, Peticiones Generales, Acuerdos, Interpretaciones y Rel. Inst	\N	2015-12-29 11:04:47.880105	2015-12-29 11:04:47.880105	\N	\N
385	Economía y Presupuesto	\N	2015-12-29 11:27:51.354323	2015-12-29 11:27:51.354323	\N	\N
386	Gobierno, Peticiones Generales, Acuerdos, Interpretaciones y Rel. Inst	\N	2015-12-29 11:27:51.359728	2015-12-29 11:27:51.359728	\N	\N
387	Economía y Presupuesto	\N	2015-12-29 11:32:17.592274	2015-12-29 11:32:17.592274	\N	\N
388	Economía y Presupuesto	\N	2015-12-29 11:42:46.100979	2015-12-29 11:42:46.100979	\N	\N
389	Economía y Presupuesto	\N	2015-12-29 11:51:05.305746	2015-12-29 11:51:05.305746	\N	\N
390	Desarrollo Social, Salud y Deporte	\N	2015-12-29 12:07:16.71463	2015-12-29 12:07:16.71463	\N	\N
391	Economía y Presupuesto	\N	2015-12-29 12:07:16.71983	2015-12-29 12:07:16.71983	\N	\N
392	Desarrollo Social, Salud y Deporte	\N	2015-12-29 12:19:55.440772	2015-12-29 12:19:55.440772	\N	\N
393	Economía y Presupuesto	\N	2015-12-29 12:19:55.445964	2015-12-29 12:19:55.445964	\N	\N
394	Desarrollo Social, Salud y Deporte	\N	2015-12-29 12:23:58.11536	2015-12-29 12:23:58.11536	\N	\N
395	Economía y Presupuesto	\N	2015-12-29 12:23:58.120515	2015-12-29 12:23:58.120515	\N	\N
396	Desarrollo Social, Salud y Deporte	\N	2015-12-29 12:37:10.787117	2015-12-29 12:37:10.787117	\N	\N
397	Economía y Presupuesto	\N	2015-12-29 12:37:10.792234	2015-12-29 12:37:10.792234	\N	\N
398	Desarrollo Social, Salud y Deporte	\N	2015-12-29 12:42:29.888004	2015-12-29 12:42:29.888004	\N	\N
399	Gobierno, Peticiones Generales, Acuerdos, Interpretaciones y Rel. Inst	\N	2015-12-29 12:42:29.893229	2015-12-29 12:42:29.893229	\N	\N
400	Desarrollo Social, Salud y Deporte	\N	2015-12-29 13:02:06.950012	2015-12-29 13:02:06.950012	\N	\N
401	Economía y Presupuesto	\N	2016-03-08 13:52:49.224348	2016-03-08 13:52:49.224348	\N	\N
402	Economía y Presupuesto	\N	2016-03-08 13:54:36.175172	2016-03-08 13:54:36.175172	\N	\N
403	Economía y Presupuesto	\N	2016-03-08 13:56:54.765878	2016-03-08 13:56:54.765878	\N	\N
404	Gobierno, Peticiones Generales, Acuerdos, Interpretaciones y Rel. Inst	\N	2016-03-08 15:01:05.080586	2016-03-08 15:01:05.080586	\N	\N
405	Gobierno, Peticiones Generales, Acuerdos, Interpretaciones y Rel. Inst	\N	2016-03-08 15:04:06.269458	2016-03-08 15:04:06.269458	\N	\N
406		\N	2016-03-08 15:04:06.272465	2016-03-08 15:04:06.272465	\N	\N
407	Economía y Presupuesto	\N	2016-03-10 10:49:05.269482	2016-03-10 10:49:05.269482	\N	\N
408	Desarrollo Humano, Educación y Cultura	\N	2016-03-10 10:49:05.272858	2016-03-10 10:49:05.272858	\N	\N
409	Desarrollo Humano, Educación y Cultura	\N	2016-03-10 10:51:53.681784	2016-03-10 10:51:53.681784	\N	\N
410	Desarrollo Social, Salud y Deporte	\N	2016-03-10 10:56:19.682459	2016-03-10 10:56:19.682459	\N	\N
411	Economía y Presupuesto	\N	2016-03-10 10:56:19.685738	2016-03-10 10:56:19.685738	\N	\N
412	Desarrollo Social, Salud y Deporte	\N	2016-03-10 11:02:36.403769	2016-03-10 11:02:36.403769	\N	\N
413	Economía y Presupuesto	\N	2016-03-10 11:02:36.407028	2016-03-10 11:02:36.407028	\N	\N
414	Desarrollo Social, Salud y Deporte	\N	2016-03-10 11:08:20.507304	2016-03-10 11:08:20.507304	\N	\N
415	Economía y Presupuesto	\N	2016-03-10 11:08:20.510554	2016-03-10 11:08:20.510554	\N	\N
416	Economía y Presupuesto	\N	2016-03-10 11:11:14.122305	2016-03-10 11:11:14.122305	\N	\N
417	Economía y Presupuesto	\N	2016-03-10 11:13:23.443744	2016-03-10 11:13:23.443744	\N	\N
418	Economía y Presupuesto	\N	2016-03-10 11:16:05.818644	2016-03-10 11:16:05.818644	\N	\N
419	Economía y Presupuesto	\N	2016-03-10 11:18:26.739845	2016-03-10 11:18:26.739845	\N	\N
420	Economía y Presupuesto	\N	2016-03-10 11:54:40.404534	2016-03-10 11:54:40.404534	\N	\N
421	Economía y Presupuesto	\N	2016-03-10 11:58:58.708075	2016-03-10 11:58:58.708075	\N	\N
422	Economía y Presupuesto	\N	2016-03-10 12:13:30.476226	2016-03-10 12:13:30.476226	\N	\N
423	Economía y Presupuesto	\N	2016-03-10 12:17:26.539802	2016-03-10 12:17:26.539802	\N	\N
424	Economía y Presupuesto	\N	2016-03-10 12:21:23.191081	2016-03-10 12:21:23.191081	\N	\N
425	Economía y Presupuesto	\N	2016-03-10 12:26:57.129527	2016-03-10 12:26:57.129527	\N	\N
426	Economía y Presupuesto	\N	2016-03-10 14:55:38.41114	2016-03-10 14:55:38.41114	\N	\N
427	Desarrollo Social, Salud y Deporte	\N	2016-03-16 13:26:22.255326	2016-03-16 13:26:22.255326	\N	\N
428	Desarrollo Social, Salud y Deporte	\N	2016-03-16 13:32:59.97533	2016-03-16 13:32:59.97533	\N	\N
429	Servicios Públicos y Transporte	\N	2016-03-16 15:18:57.104904	2016-03-16 15:18:57.104904	\N	\N
430	Servicios Públicos y Transporte	\N	2016-03-16 15:35:54.252686	2016-03-16 15:35:54.252686	\N	\N
431	Desarrollo Humano, Educación y Cultura	\N	2016-03-16 15:41:40.205314	2016-03-16 15:41:40.205314	\N	\N
436	Economía y Presupuesto	\N	2016-03-30 14:11:34.207886	2016-03-30 14:11:34.207886	\N	\N
432	Gobierno, Peticiones Generales, Acuerdos, Interpretaciones y Rel. Inst	\N	2016-03-16 15:47:52.705557	2016-03-16 15:47:52.705557	\N	\N
433	Gobierno, Peticiones Generales, Acuerdos, Interpretaciones y Rel. Inst	\N	2016-03-16 16:29:19.20614	2016-03-16 16:29:19.20614	\N	\N
434	Desarrollo Humano, Educación y Cultura	\N	2016-03-22 14:20:36.818077	2016-03-22 14:20:36.818077	\N	\N
435	Gobierno, Peticiones Generales, Acuerdos, Interpretaciones y Rel. Inst	\N	2016-03-22 15:49:50.497728	2016-03-22 15:49:50.497728	\N	\N
439	Economía y Presupuesto	\N	2016-03-30 14:48:12.23299	2016-03-30 14:48:12.23299	\N	\N
440	Economía y Presupuesto	\N	2016-03-30 14:56:33.656698	2016-03-30 14:56:33.656698	\N	\N
441	Economía y Presupuesto	\N	2016-03-30 15:56:31.204346	2016-03-30 15:56:31.204346	\N	\N
442	Desarrollo Humano, Educación y Cultura	\N	2016-03-30 15:56:31.208234	2016-03-30 15:56:31.208234	\N	\N
443	Desarrollo Social, Salud y Deporte	\N	2016-03-30 16:00:11.34322	2016-03-30 16:00:11.34322	\N	\N
444	Economía y Presupuesto	\N	2016-03-30 16:00:11.346259	2016-03-30 16:00:11.346259	\N	\N
437	Economía y Presupuesto	\N	2016-03-30 14:33:27.486634	2016-03-30 14:33:27.486634	\N	\N
438	Economía y Presupuesto	\N	2016-03-30 14:41:59.832037	2016-03-30 14:41:59.832037	\N	\N
445	Gobierno, Peticiones Generales, Acuerdos, Interpretaciones y Rel. Inst	\N	2016-03-31 11:56:56.913486	2016-03-31 11:56:56.913486	\N	\N
446	Desarrollo Social, Salud y Deporte	\N	2016-03-31 12:02:58.040699	2016-03-31 12:02:58.040699	\N	\N
447	Economía y Presupuesto	\N	2016-03-31 12:02:58.044198	2016-03-31 12:02:58.044198	\N	\N
448	Gobierno, Peticiones Generales, Acuerdos, Interpretaciones y Rel. Inst	\N	2016-03-31 12:18:26.489281	2016-03-31 12:18:26.489281	\N	\N
449	Obras Públicas y Vialidad	\N	2016-03-31 12:18:26.49218	2016-03-31 12:18:26.49218	\N	\N
450	Desarrollo Social, Salud y Deporte	\N	2016-04-05 11:20:47.870786	2016-04-05 11:20:47.870786	\N	\N
451	Economía y Presupuesto	\N	2016-04-05 11:20:47.893499	2016-04-05 11:20:47.893499	\N	\N
452	Desarrollo Social, Salud y Deporte	\N	2016-04-05 11:26:35.072225	2016-04-05 11:26:35.072225	\N	\N
453	Economía y Presupuesto	\N	2016-04-05 11:26:35.075265	2016-04-05 11:26:35.075265	\N	\N
454	Desarrollo Social, Salud y Deporte	\N	2016-04-05 11:31:15.145323	2016-04-05 11:31:15.145323	\N	\N
455	Economía y Presupuesto	\N	2016-04-05 11:31:15.148861	2016-04-05 11:31:15.148861	\N	\N
456	Desarrollo Social, Salud y Deporte	\N	2016-04-05 11:35:26.20254	2016-04-05 11:35:26.20254	\N	\N
457	Economía y Presupuesto	\N	2016-04-05 11:35:26.205586	2016-04-05 11:35:26.205586	\N	\N
458	Desarrollo Social, Salud y Deporte	\N	2016-04-05 11:54:22.126361	2016-04-05 11:54:22.126361	\N	\N
459	Economía y Presupuesto	\N	2016-04-05 11:54:22.129702	2016-04-05 11:54:22.129702	\N	\N
460	Desarrollo Social, Salud y Deporte	\N	2016-04-05 12:21:43.378041	2016-04-05 12:21:43.378041	\N	\N
461	Economía y Presupuesto	\N	2016-04-05 12:21:43.381266	2016-04-05 12:21:43.381266	\N	\N
462	Desarrollo Social, Salud y Deporte	\N	2016-04-05 12:26:19.847311	2016-04-05 12:26:19.847311	\N	\N
463	Economía y Presupuesto	\N	2016-04-05 12:26:19.850972	2016-04-05 12:26:19.850972	\N	\N
464	Economía y Presupuesto	\N	2016-04-06 11:48:56.583916	2016-04-06 11:48:56.583916	\N	\N
465	Economía y Presupuesto	\N	2016-04-06 11:51:28.084364	2016-04-06 11:51:28.084364	\N	\N
466	Planificación y Desarrollo Sustentable	\N	2016-04-06 13:14:17.218899	2016-04-06 13:14:17.218899	\N	\N
467	Gobierno, Peticiones Generales, Acuerdos, Interpretaciones y Rel. Inst	\N	2016-04-07 10:51:02.630833	2016-04-07 10:51:02.630833	\N	\N
468	Desarrollo Social, Salud y Deporte	\N	2016-04-07 10:55:55.118648	2016-04-07 10:55:55.118648	\N	\N
469	Economía y Presupuesto	\N	2016-04-07 10:55:55.121986	2016-04-07 10:55:55.121986	\N	\N
470	Servicios Públicos y Transporte	\N	2016-04-07 11:10:00.035977	2016-04-07 11:10:00.035977	\N	\N
471	Desarrollo Humano, Educación y Cultura	\N	2016-04-07 11:58:21.989353	2016-04-07 11:58:21.989353	\N	\N
472	Desarrollo Humano, Educación y Cultura	\N	2016-04-07 12:14:46.02321	2016-04-07 12:14:46.02321	\N	\N
473	Desarrollo Humano, Educación y Cultura	\N	2016-04-07 12:23:26.913081	2016-04-07 12:23:26.913081	\N	\N
474	Desarrollo Social, Salud y Deporte	\N	2016-04-07 12:34:12.711027	2016-04-07 12:34:12.711027	\N	\N
475	Desarrollo Social, Salud y Deporte	\N	2016-04-07 12:45:52.240937	2016-04-07 12:45:52.240937	\N	\N
476	Economía y Presupuesto	\N	2016-04-07 12:45:52.24412	2016-04-07 12:45:52.24412	\N	\N
477	Desarrollo Social, Salud y Deporte	\N	2016-04-07 13:05:08.830492	2016-04-07 13:05:08.830492	\N	\N
478	Economía y Presupuesto	\N	2016-04-07 13:05:08.833834	2016-04-07 13:05:08.833834	\N	\N
479	Desarrollo Social, Salud y Deporte	\N	2016-04-07 13:13:19.873825	2016-04-07 13:13:19.873825	\N	\N
480	Economía y Presupuesto	\N	2016-04-07 13:13:19.887072	2016-04-07 13:13:19.887072	\N	\N
481	Desarrollo Social, Salud y Deporte	\N	2016-04-07 15:37:54.532742	2016-04-07 15:37:54.532742	\N	\N
482	Economía y Presupuesto	\N	2016-04-07 15:37:54.536587	2016-04-07 15:37:54.536587	\N	\N
483	Desarrollo Social, Salud y Deporte	\N	2016-04-07 15:49:17.725922	2016-04-07 15:49:17.725922	\N	\N
484	Economía y Presupuesto	\N	2016-04-07 15:49:17.729113	2016-04-07 15:49:17.729113	\N	\N
485	Desarrollo Social, Salud y Deporte	\N	2016-04-07 15:55:50.68726	2016-04-07 15:55:50.68726	\N	\N
486	Economía y Presupuesto	\N	2016-04-07 15:55:50.690294	2016-04-07 15:55:50.690294	\N	\N
487	Desarrollo Social, Salud y Deporte	\N	2016-04-07 15:58:03.107291	2016-04-07 15:58:03.107291	\N	\N
488	Servicios Públicos y Transporte	\N	2016-04-07 16:00:25.183776	2016-04-07 16:00:25.183776	\N	\N
489	Servicios Públicos y Transporte	\N	2016-04-07 16:02:49.093173	2016-04-07 16:02:49.093173	\N	\N
490	Servicios Públicos y Transporte	\N	2016-04-07 16:04:40.136921	2016-04-07 16:04:40.136921	\N	\N
491	Desarrollo Social, Salud y Deporte	\N	2016-04-13 14:23:40.634939	2016-04-13 14:23:40.634939	\N	\N
492	Economía y Presupuesto	\N	2016-04-13 14:23:40.664595	2016-04-13 14:23:40.664595	\N	\N
493	Desarrollo Social, Salud y Deporte	\N	2016-04-13 14:32:49.555189	2016-04-13 14:32:49.555189	\N	\N
494	Economía y Presupuesto	\N	2016-04-13 14:32:49.558241	2016-04-13 14:32:49.558241	\N	\N
495	Desarrollo Social, Salud y Deporte	\N	2016-04-13 14:36:26.579321	2016-04-13 14:36:26.579321	\N	\N
496	Economía y Presupuesto	\N	2016-04-13 14:36:26.582178	2016-04-13 14:36:26.582178	\N	\N
497	Desarrollo Social, Salud y Deporte	\N	2016-04-13 14:40:37.40697	2016-04-13 14:40:37.40697	\N	\N
498	Economía y Presupuesto	\N	2016-04-13 14:40:37.410165	2016-04-13 14:40:37.410165	\N	\N
499	Gobierno, Peticiones Generales, Acuerdos, Interpretaciones y Rel. Inst	\N	2016-04-14 10:44:24.31656	2016-04-14 10:44:24.31656	\N	\N
500	Economía y Presupuesto	\N	2016-04-14 10:44:24.319698	2016-04-14 10:44:24.319698	\N	\N
501	Desarrollo Humano, Educación y Cultura	\N	2016-04-14 10:49:18.154477	2016-04-14 10:49:18.154477	\N	\N
502	Desarrollo Humano, Educación y Cultura	\N	2016-04-14 10:54:16.44634	2016-04-14 10:54:16.44634	\N	\N
503	Gobierno, Peticiones Generales, Acuerdos, Interpretaciones y Rel. Inst	\N	2016-04-14 10:58:40.098666	2016-04-14 10:58:40.098666	\N	\N
504	Gobierno, Peticiones Generales, Acuerdos, Interpretaciones y Rel. Inst	\N	2016-04-14 11:19:15.37211	2016-04-14 11:19:15.37211	\N	\N
505	Planificación y Desarrollo Sustentable	\N	2016-04-14 11:23:55.181685	2016-04-14 11:23:55.181685	\N	\N
506	Planificación y Desarrollo Sustentable	\N	2016-04-14 11:28:15.914135	2016-04-14 11:28:15.914135	\N	\N
507	Planificación y Desarrollo Sustentable	\N	2016-04-14 11:32:11.474193	2016-04-14 11:32:11.474193	\N	\N
508	Economía y Presupuesto	\N	2016-04-14 11:35:42.634798	2016-04-14 11:35:42.634798	\N	\N
509	Desarrollo Humano, Educación y Cultura	\N	2016-04-14 11:35:42.638005	2016-04-14 11:35:42.638005	\N	\N
510	Economía y Presupuesto	\N	2016-04-14 11:54:17.886992	2016-04-14 11:54:17.886992	\N	\N
511	Economía y Presupuesto	\N	2016-04-14 12:00:46.136402	2016-04-14 12:00:46.136402	\N	\N
512	Gobierno, Peticiones Generales, Acuerdos, Interpretaciones y Rel. Inst	\N	2016-04-19 15:16:52.416881	2016-04-19 15:16:52.416881	\N	\N
513	Economía y Presupuesto	\N	2016-04-21 11:36:12.897044	2016-04-21 11:36:12.897044	\N	\N
514	Economía y Presupuesto	\N	2016-04-21 11:38:50.947528	2016-04-21 11:38:50.947528	\N	\N
515	Gobierno, Peticiones Generales, Acuerdos, Interpretaciones y Rel. Inst	\N	2016-04-21 13:42:17.153802	2016-04-21 13:42:17.153802	\N	\N
516	Economía y Presupuesto	\N	2016-04-21 13:42:17.156768	2016-04-21 13:42:17.156768	\N	\N
517	Gobierno, Peticiones Generales, Acuerdos, Interpretaciones y Rel. Inst	\N	2016-04-21 14:01:34.17817	2016-04-21 14:01:34.17817	\N	\N
518	Desarrollo Humano, Educación y Cultura	\N	2016-04-21 14:39:16.598341	2016-04-21 14:39:16.598341	\N	\N
519	Desarrollo Social, Salud y Deporte	\N	2016-04-21 14:44:17.776033	2016-04-21 14:44:17.776033	\N	\N
520	Economía y Presupuesto	\N	2016-04-21 14:44:17.779108	2016-04-21 14:44:17.779108	\N	\N
521	Desarrollo Social, Salud y Deporte	\N	2016-04-21 14:50:52.12205	2016-04-21 14:50:52.12205	\N	\N
522	Economía y Presupuesto	\N	2016-04-21 14:50:52.126078	2016-04-21 14:50:52.126078	\N	\N
523	Desarrollo Social, Salud y Deporte	\N	2016-04-21 15:07:06.78693	2016-04-21 15:07:06.78693	\N	\N
524	Economía y Presupuesto	\N	2016-04-21 15:07:06.789962	2016-04-21 15:07:06.789962	\N	\N
525	Desarrollo Social, Salud y Deporte	\N	2016-04-21 15:28:00.21774	2016-04-21 15:28:00.21774	\N	\N
526	Economía y Presupuesto	\N	2016-04-21 15:28:00.220864	2016-04-21 15:28:00.220864	\N	\N
527	Desarrollo Social, Salud y Deporte	\N	2016-04-21 15:40:14.14514	2016-04-21 15:40:14.14514	\N	\N
528	Economía y Presupuesto	\N	2016-04-21 15:40:14.148273	2016-04-21 15:40:14.148273	\N	\N
529	Desarrollo Social, Salud y Deporte	\N	2016-04-21 15:53:06.124589	2016-04-21 15:53:06.124589	\N	\N
530	Economía y Presupuesto	\N	2016-04-21 15:53:06.127699	2016-04-21 15:53:06.127699	\N	\N
531	Desarrollo Social, Salud y Deporte	\N	2016-04-27 15:49:33.809996	2016-04-27 15:49:33.809996	\N	\N
532	Economía y Presupuesto	\N	2016-04-27 15:49:33.814596	2016-04-27 15:49:33.814596	\N	\N
533	Desarrollo Social, Salud y Deporte	\N	2016-04-27 15:52:21.432682	2016-04-27 15:52:21.432682	\N	\N
534	Economía y Presupuesto	\N	2016-04-27 15:52:21.435846	2016-04-27 15:52:21.435846	\N	\N
535	Desarrollo Social, Salud y Deporte	\N	2016-04-27 15:54:56.577012	2016-04-27 15:54:56.577012	\N	\N
536	Economía y Presupuesto	\N	2016-04-27 15:54:56.581177	2016-04-27 15:54:56.581177	\N	\N
537	Desarrollo Social, Salud y Deporte	\N	2016-04-27 15:57:48.222529	2016-04-27 15:57:48.222529	\N	\N
538	Economía y Presupuesto	\N	2016-04-27 15:57:48.225429	2016-04-27 15:57:48.225429	\N	\N
539	Desarrollo Social, Salud y Deporte	\N	2016-04-27 16:04:26.665426	2016-04-27 16:04:26.665426	\N	\N
540	Economía y Presupuesto	\N	2016-04-27 16:04:26.668554	2016-04-27 16:04:26.668554	\N	\N
541	Obras Públicas y Vialidad	\N	2016-04-27 16:07:07.460392	2016-04-27 16:07:07.460392	\N	\N
542	COM. REFORMA POLITICA	\N	2016-04-28 11:07:07.960101	2016-04-28 11:07:07.960101	\N	\N
543	COM. REFORMA POLITICA	\N	2016-04-28 11:09:25.571441	2016-04-28 11:09:25.571441	\N	\N
544	Planificación y Desarrollo Sustentable	\N	2016-05-04 14:15:23.557959	2016-05-04 14:15:23.557959	\N	\N
545	Gobierno, Peticiones Generales, Acuerdos, Interpretaciones y Rel. Inst	\N	2016-05-05 10:40:48.735393	2016-05-05 10:40:48.735393	\N	\N
546	Gobierno, Peticiones Generales, Acuerdos, Interpretaciones y Rel. Inst	\N	2016-05-05 10:43:55.30601	2016-05-05 10:43:55.30601	\N	\N
547	Gobierno, Peticiones Generales, Acuerdos, Interpretaciones y Rel. Inst	\N	2016-05-05 10:47:58.063514	2016-05-05 10:47:58.063514	\N	\N
548	Gobierno, Peticiones Generales, Acuerdos, Interpretaciones y Rel. Inst	\N	2016-05-05 10:50:32.646878	2016-05-05 10:50:32.646878	\N	\N
549	Economía y Presupuesto	\N	2016-05-05 11:00:15.868239	2016-05-05 11:00:15.868239	\N	\N
550	Gobierno, Peticiones Generales, Acuerdos, Interpretaciones y Rel. Inst	\N	2016-05-05 11:00:15.872683	2016-05-05 11:00:15.872683	\N	\N
551	Desarrollo Social, Salud y Deporte	\N	2016-05-05 11:06:40.076246	2016-05-05 11:06:40.076246	\N	\N
552	Economía y Presupuesto	\N	2016-05-05 11:06:40.079711	2016-05-05 11:06:40.079711	\N	\N
553	Desarrollo Social, Salud y Deporte	\N	2016-05-05 11:30:37.236566	2016-05-05 11:30:37.236566	\N	\N
554	Economía y Presupuesto	\N	2016-05-05 11:30:37.240073	2016-05-05 11:30:37.240073	\N	\N
555	Desarrollo Social, Salud y Deporte	\N	2016-05-05 12:03:16.047565	2016-05-05 12:03:16.047565	\N	\N
556	Desarrollo Humano, Educación y Cultura	\N	2016-05-05 12:03:16.050605	2016-05-05 12:03:16.050605	\N	\N
557	Economía y Presupuesto	\N	2016-05-05 12:07:28.906874	2016-05-05 12:07:28.906874	\N	\N
558	Economía y Presupuesto	\N	2016-05-05 12:12:56.954959	2016-05-05 12:12:56.954959	\N	\N
559	Desarrollo Social, Salud y Deporte	\N	2016-05-05 12:26:17.821925	2016-05-05 12:26:17.821925	\N	\N
560	Economía y Presupuesto	\N	2016-05-05 12:26:17.824917	2016-05-05 12:26:17.824917	\N	\N
561	Gobierno, Peticiones Generales, Acuerdos, Interpretaciones y Rel. Inst	\N	2016-05-05 12:40:03.646005	2016-05-05 12:40:03.646005	\N	\N
562	Economía y Presupuesto	\N	2016-05-05 12:40:03.649445	2016-05-05 12:40:03.649445	\N	\N
563	Desarrollo Social, Salud y Deporte	\N	2016-05-05 12:43:25.190245	2016-05-05 12:43:25.190245	\N	\N
564	Economía y Presupuesto	\N	2016-05-05 12:43:25.193304	2016-05-05 12:43:25.193304	\N	\N
\.


--
-- Data for Name: comisions_despachos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY comisions_despachos (despacho_id, comision_id) FROM stdin;
8	1
9	2
10	16
10	17
14	18
15	19
3556	20
3557	21
3558	22
3559	23
3562	24
3563	25
3563	26
3564	27
3565	28
3565	29
3565	30
3566	31
3567	32
3568	33
3598	34
3597	35
3597	36
3607	37
3606	38
3612	39
3612	40
3612	41
3604	42
3605	43
3613	44
3617	45
3617	46
3616	47
3616	48
3615	49
3615	50
3614	51
3614	52
3636	53
3639	54
3641	55
3642	56
3643	57
3644	58
3645	59
3659	60
3662	61
3662	62
3668	63
3671	64
3663	65
3663	66
3664	67
3664	68
3675	69
3676	70
3667	71
3667	72
3666	73
3666	74
3661	75
3699	76
3699	77
3701	78
3704	79
3705	80
3701	81
3702	82
3703	83
3706	84
3706	85
3707	86
3707	87
3725	88
3729	89
3737	90
3737	91
3742	92
3743	93
3740	94
3738	95
3736	96
3736	97
3734	98
3734	99
3733	100
3733	101
3731	102
3731	103
3730	104
3730	105
3728	106
3727	107
3765	108
3766	109
3767	110
3767	111
3768	112
3769	113
3769	114
3770	115
3770	116
3789	117
3789	118
3784	119
3784	120
3783	121
3782	122
3775	123
3774	124
3772	125
3772	126
3771	127
3771	128
3847	129
3846	130
3846	131
3822	132
3838	133
3835	134
3835	135
3839	136
3840	137
3840	138
3841	139
3841	140
3843	141
3843	142
3844	143
3844	144
3836	145
3845	146
3845	147
3868	148
3870	149
3871	150
3872	151
3873	152
3874	153
3874	154
3876	155
3876	156
3878	157
3878	158
3880	159
3880	160
3881	161
3908	162
3928	163
3927	164
3917	165
3917	166
3916	167
3916	168
3921	169
3921	170
3924	171
3924	172
3926	173
3926	174
3923	175
3923	176
3919	177
3929	178
3929	179
3929	180
3929	181
3929	182
3929	183
3929	184
3929	185
3929	186
3929	187
3929	188
3930	189
3930	190
3930	191
3930	192
3930	193
3930	194
3930	195
3930	196
3930	197
3930	198
3930	199
3931	200
3931	201
3931	202
3931	203
3931	204
3931	205
3931	206
3931	207
3918	208
3925	209
3925	210
3922	211
3922	212
3969	213
3969	214
3987	215
3986	216
3986	217
3985	218
3984	219
3983	220
3982	221
3981	222
3970	223
3970	224
3971	225
3971	226
3972	227
3972	228
4015	229
4024	230
4025	231
4025	232
4026	233
4035	234
4034	235
4033	236
4027	237
4027	238
4028	239
4028	240
4074	248
4071	249
4071	250
4069	251
4069	252
4066	257
4066	258
4065	259
4065	260
4087	261
4084	263
4083	264
4082	265
4082	266
4082	267
4082	268
4082	269
4082	270
4082	271
4082	272
4082	273
4082	274
4032	241
4032	242
4030	243
4030	244
4029	245
4029	246
4075	247
4068	253
4068	254
4067	255
4067	256
4085	262
4081	275
4081	276
4081	277
4081	278
4081	279
4081	280
4081	281
4080	282
4080	283
4080	284
4080	285
4080	286
4080	287
4080	288
4080	289
4080	290
4080	291
4080	292
4079	293
4079	294
4077	295
4078	296
4063	297
4107	298
4107	299
4114	300
4115	301
4118	302
4118	303
4119	304
4120	305
4121	306
4122	307
4123	308
4124	309
4125	310
4126	311
4127	312
4128	313
4129	314
4130	315
4131	316
4131	317
4133	318
4133	319
4134	320
4135	321
4135	322
4137	323
4137	324
4139	325
4139	326
4140	327
4141	328
4141	329
4142	330
4142	331
4143	332
4143	333
4144	334
4144	335
4151	336
4151	337
4152	338
4152	339
4153	340
4154	341
4154	342
4155	343
4155	344
4149	345
4149	346
4145	347
4146	348
4146	349
4147	350
4147	351
4148	352
4148	353
4158	354
4195	355
4196	356
4192	357
4193	358
4191	359
4189	360
4186	361
4185	362
4175	363
4175	364
4174	365
4174	366
4173	367
4173	368
4172	369
4172	370
4171	371
4170	372
4169	373
4168	374
4167	375
4166	376
4165	377
4204	378
4206	379
4210	380
4209	381
4208	382
4212	383
4212	384
4213	385
4213	386
4214	387
4215	388
4216	389
4222	390
4222	391
4221	392
4221	393
4220	394
4220	395
4219	396
4219	397
4217	398
4217	399
4218	400
4420	401
4421	402
4422	403
4430	404
4431	405
4431	406
4455	407
4455	408
4456	409
4440	410
4440	411
4441	412
4441	413
4442	414
4442	415
4451	416
4450	417
4452	418
4458	419
4447	420
4448	421
4454	422
4453	423
4446	424
4449	425
4445	426
4502	427
4503	428
4504	429
4505	430
4513	431
4515	432
4517	433
4549	434
4553	435
4590	436
4586	437
4587	438
4588	439
4589	440
4603	441
4603	442
4601	443
4601	444
4602	445
4599	446
4599	447
4605	448
4605	449
4597	450
4597	451
4596	452
4596	453
4595	454
4595	455
4594	456
4594	457
4593	458
4593	459
4592	460
4592	461
4591	462
4591	463
4645	464
4644	465
4646	466
4652	467
4657	468
4657	469
4669	470
4668	471
4667	472
4666	473
4665	474
4664	475
4664	476
4662	477
4662	478
4661	479
4661	480
4660	481
4660	482
4659	483
4659	484
4658	485
4658	486
4656	487
4655	488
4654	489
4653	490
4698	493
4698	494
4697	495
4697	496
4696	497
4696	498
4716	504
4707	505
4702	511
4776	513
4775	514
4773	515
4773	516
4771	517
4777	518
4786	519
4786	520
4787	521
4787	522
4822	537
4822	538
4699	491
4699	492
4714	499
4714	500
4713	501
4712	502
4715	503
4708	506
4706	507
4705	508
4705	509
4703	510
4709	512
4788	523
4788	524
4790	525
4790	526
4791	527
4791	528
4792	529
4792	530
4825	531
4825	532
4824	533
4824	534
4823	535
4823	536
4821	539
4821	540
4820	541
4826	542
4827	543
4851	544
4857	545
4860	546
4859	547
4858	548
4867	549
4867	550
4866	551
4866	552
4865	553
4865	554
4861	555
4861	556
4870	557
4869	558
4862	559
4862	560
4868	561
4868	562
4864	563
4864	564
\.


--
-- Name: comisions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('comisions_id_seq', 564, true);


--
-- Data for Name: comisions_periodos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY comisions_periodos (comision_id, periodo_id) FROM stdin;
\.


--
-- Data for Name: comisions_personas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY comisions_personas (comision_id, concejal_id) FROM stdin;
\.


--
-- Data for Name: comisions_tramites; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY comisions_tramites (comision_id, tramite_id) FROM stdin;
\.


--
-- Data for Name: dependencia_municipals; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY dependencia_municipals (id, denominacion, created_at, updated_at) FROM stdin;
\.


--
-- Name: dependencia_municipals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('dependencia_municipals_id_seq', 1, false);


--
-- Data for Name: despachos_concejals; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY despachos_concejals (despacho_id, concejal_id) FROM stdin;
14	22
14	23
14	24
14	25
15	26
15	27
15	28
15	29
3559	30
3559	31
3559	32
3559	33
3559	34
3559	35
3562	36
3562	37
3562	38
3562	39
3562	40
3562	41
3562	42
3562	43
3563	44
3563	45
3563	46
3563	47
3563	48
3563	49
3563	50
3564	51
3564	52
3564	53
3565	54
3565	55
3565	56
3565	57
3565	58
3565	59
3565	60
3565	61
3565	62
3565	63
3566	64
3566	65
3566	66
3566	67
3566	68
3566	69
3567	70
3567	71
3567	72
3567	73
3568	74
3568	75
3568	76
3568	77
3598	78
3598	79
3598	80
3598	81
3597	82
3597	83
3597	84
3597	85
3597	86
3597	87
3597	88
3607	89
3607	90
3607	91
3607	92
3606	93
3606	94
3606	95
3606	96
3612	97
3612	98
3612	99
3612	100
3612	101
3612	102
3612	103
3612	104
3612	105
3604	106
3604	107
3604	108
3604	109
3604	110
3605	111
3605	112
3605	113
3605	114
3613	115
3613	116
3613	117
3613	118
3613	119
3613	120
3617	121
3617	122
3617	123
3617	124
3617	125
3617	126
3617	127
3617	128
3617	129
3617	130
3616	131
3616	132
3616	133
3616	134
3616	135
3616	136
3616	137
3616	138
3616	139
3615	140
3615	141
3615	142
3615	143
3615	144
3615	145
3615	146
3615	147
3615	148
3614	149
3614	150
3614	151
3614	152
3614	153
3614	154
3614	155
3614	156
3614	157
3636	158
3636	159
3636	160
3636	161
3639	162
3639	163
3639	164
3639	165
3639	166
3639	167
3641	168
3641	169
3641	170
3641	171
3641	172
3641	173
3642	174
3642	175
3642	176
3642	177
3642	178
3643	179
3643	180
3643	181
3643	182
3643	183
3644	184
3644	185
3644	186
3644	187
3644	188
3645	189
3645	190
3645	191
3645	192
3645	193
3662	194
3662	195
3662	196
3662	197
3662	198
3662	199
3662	200
3662	201
3662	202
3659	203
3659	204
3659	205
3659	206
3659	207
3663	208
3663	209
3663	210
3663	211
3663	212
3663	213
3663	214
3663	215
3663	216
3664	217
3664	218
3664	219
3664	220
3664	221
3664	222
3664	223
3664	224
3664	225
3675	226
3675	227
3675	228
3675	229
3676	230
3676	231
3676	232
3676	233
3667	234
3667	235
3667	236
3667	237
3667	238
3667	239
3667	240
3667	241
3667	242
3666	243
3666	244
3666	245
3666	246
3666	247
3666	248
3666	249
3666	250
3666	251
3661	252
3661	253
3661	254
3661	255
3661	256
3671	257
3671	258
3671	259
3671	260
3671	261
3668	262
3668	263
3668	264
3668	265
3668	266
3699	267
3699	268
3699	269
3699	270
3699	271
3699	272
3699	273
3701	274
3701	275
3701	276
3701	277
3702	278
3702	279
3702	280
3702	281
3702	282
3702	283
3702	284
3702	285
3703	286
3703	287
3703	288
3703	289
3703	290
3704	291
3704	292
3704	293
3704	294
3705	295
3705	296
3705	297
3705	298
3706	299
3706	300
3706	301
3706	302
3706	303
3706	304
3707	305
3707	306
3707	307
3707	308
3707	309
3707	310
3707	311
3725	312
3725	313
3725	314
3725	315
3729	316
3729	317
3740	318
3740	319
3740	320
3740	321
3740	322
3738	323
3738	324
3738	325
3738	326
3737	327
3737	328
3737	329
3737	330
3737	331
3737	332
3737	333
3737	334
3737	335
3737	336
3742	337
3742	338
3742	339
3742	340
3743	341
3743	342
3743	343
3743	344
3736	345
3736	346
3736	347
3736	348
3736	349
3736	350
3736	351
3736	352
3736	353
3736	354
3734	355
3734	356
3734	357
3734	358
3734	359
3734	360
3734	361
3734	362
3734	363
3734	364
3733	365
3733	366
3733	367
3733	368
3733	369
3733	370
3733	371
3733	372
3733	373
3733	374
3731	375
3731	376
3731	377
3731	378
3731	379
3731	380
3731	381
3731	382
3731	383
3731	384
3730	385
3730	386
3730	387
3730	388
3730	389
3730	390
3730	391
3730	392
3730	393
3730	394
3729	395
3729	396
3729	397
3728	398
3728	399
3728	400
3728	401
3728	402
3727	403
3727	404
3727	405
3727	406
3727	407
3765	408
3765	409
3765	410
3765	411
3766	412
3766	413
3766	414
3766	415
3767	416
3767	417
3767	418
3767	419
3767	420
3767	421
3767	422
3768	423
3768	424
3768	425
3768	426
3768	427
3768	428
3769	429
3769	430
3769	431
3769	432
3769	433
3769	434
3769	435
3769	436
3769	437
3789	438
3789	439
3789	440
3789	441
3789	442
3789	443
3784	444
3784	445
3784	446
3784	447
3784	448
3784	449
3783	450
3783	451
3783	452
3783	453
3782	454
3782	455
3782	456
3782	457
3775	458
3775	459
3775	460
3775	461
3774	462
3774	463
3774	464
3774	465
3772	466
3772	467
3772	468
3772	469
3772	470
3772	471
3772	472
3772	473
3772	474
3771	475
3771	476
3771	477
3771	478
3771	479
3771	480
3771	481
3771	482
3771	483
3847	484
3847	485
3846	486
3846	487
3846	488
3846	489
3846	490
3846	491
3846	492
3838	497
3838	498
3838	499
3838	500
3838	501
3835	502
3835	503
3835	504
3835	505
3835	506
3835	507
3835	508
3839	509
3839	510
3839	511
3839	512
3839	513
3822	493
3822	494
3822	495
3822	496
3840	514
3840	515
3840	516
3840	517
3840	518
3840	519
3840	520
3841	521
3841	522
3841	523
3841	524
3841	525
3841	526
3841	527
3843	528
3843	529
3843	530
3843	531
3843	532
3843	533
3843	534
3844	535
3844	536
3844	537
3844	538
3844	539
3844	540
3844	541
3836	542
3836	543
3836	544
3836	545
3836	546
3845	547
3845	548
3845	549
3845	550
3845	551
3845	552
3845	553
3868	554
3868	555
3868	556
3868	557
3869	558
3869	559
3869	560
3869	561
3870	562
3870	563
3870	564
3870	565
3871	566
3871	567
3871	568
3871	569
3872	570
3872	571
3872	572
3872	573
3873	574
3873	575
3873	576
3873	577
3873	578
3874	579
3874	580
3874	581
3874	582
3874	583
3874	584
3874	585
3874	586
3874	587
3874	588
3876	589
3876	590
3876	591
3876	592
3876	593
3876	594
3876	595
3876	596
3876	597
3876	598
3878	599
3878	600
3878	601
3878	602
3878	603
3878	604
3878	605
3878	606
3880	607
3880	608
3880	609
3880	610
3880	611
3880	612
3880	613
3881	614
3881	615
3881	616
3881	617
3908	618
3908	619
3908	620
3908	621
3908	622
3928	623
3928	624
3928	625
3928	626
3927	627
3927	628
3927	629
3927	630
3917	631
3917	632
3917	633
3917	634
3917	635
3917	636
3916	637
3916	638
3916	639
3916	640
3916	641
3916	642
3921	643
3921	644
3921	645
3921	646
3921	647
3921	648
3921	649
3921	650
3924	651
3924	652
3924	653
3924	654
3924	655
3924	656
3924	657
3924	658
3926	659
3926	660
3926	661
3926	662
3926	663
3926	664
3926	665
3923	666
3923	667
3923	668
3923	669
3923	670
3923	671
3923	672
3923	673
3919	674
3919	675
3919	676
3919	677
3919	678
3919	679
3929	680
3929	681
3929	682
3929	683
3929	684
3929	685
3929	686
3929	687
3929	688
3930	689
3930	690
3930	691
3930	692
3930	693
3930	694
3930	695
3930	696
3930	697
3918	698
3918	699
3918	700
3918	701
3918	702
3918	703
3925	704
3925	705
3925	706
3925	707
3925	708
3925	709
3925	710
3925	711
3922	712
3922	713
3922	714
3922	715
3922	716
3922	717
3922	718
3922	719
3987	720
3987	721
3987	722
3987	723
3987	724
3986	725
3986	726
3986	727
3986	728
3986	729
3986	730
3985	731
3985	732
3985	733
3985	734
3985	735
3984	736
3984	737
3984	738
3984	739
3984	740
3983	741
3983	742
3983	743
3983	744
3983	745
3982	746
3982	747
3982	748
3982	749
3982	750
3981	751
3981	752
3981	753
3981	754
3981	755
3969	756
3969	757
3969	758
3969	759
3969	760
3969	761
3969	762
3969	763
3969	764
3970	765
3970	766
3970	767
3970	768
3970	769
3970	770
3970	771
3970	772
3970	773
3971	774
3971	775
3971	776
3971	777
3971	778
3971	779
3971	780
3971	781
3971	782
3972	783
3972	784
3972	785
3972	786
3972	787
3972	788
3972	789
3972	790
3972	791
4015	792
4015	793
4015	794
4015	795
4024	796
4024	797
4024	798
4024	799
4025	800
4025	801
4025	802
4025	803
4025	804
4025	805
4026	806
4026	807
4026	808
4026	809
4026	810
4026	811
4026	812
4026	813
4035	814
4035	815
4035	816
4035	817
4034	818
4034	819
4034	820
4034	821
4033	822
4033	823
4033	824
4033	825
4027	826
4027	827
4027	828
4027	829
4027	830
4027	831
4027	832
4027	833
4027	834
4027	835
4028	836
4028	837
4028	838
4028	839
4028	840
4028	841
4028	842
4028	843
4028	845
4028	846
4032	847
4032	848
4032	849
4032	850
4032	851
4032	852
4032	853
4032	854
4032	855
4032	856
4030	857
4030	858
4030	859
4030	860
4030	861
4030	862
4030	863
4030	864
4030	865
4030	866
4029	867
4029	868
4029	869
4029	870
4029	871
4029	872
4029	873
4029	874
4029	875
4029	876
4075	877
4075	878
4075	879
4075	880
4075	881
4074	882
4074	883
4074	884
4074	885
4071	886
4071	887
4071	888
4071	889
4071	890
4071	891
4071	892
4071	893
4069	894
4069	895
4069	896
4069	897
4069	898
4069	899
4069	900
4069	901
4068	902
4068	903
4068	904
4068	905
4068	906
4068	907
4068	908
4068	909
4067	910
4067	911
4067	912
4067	913
4067	914
4067	915
4067	916
4067	917
4066	918
4066	919
4066	920
4066	921
4066	922
4066	923
4066	924
4066	925
4065	926
4065	927
4065	928
4065	929
4065	930
4065	931
4065	932
4065	933
4087	934
4087	935
4087	936
4085	937
4085	938
4085	939
4084	940
4084	941
4084	942
4083	943
4083	944
4083	945
4082	946
4082	947
4082	948
4082	949
4082	950
4082	951
4082	952
4082	953
4081	954
4081	955
4081	956
4081	957
4081	958
4081	959
4081	960
4081	961
4080	962
4080	963
4080	964
4080	965
4080	966
4080	967
4080	968
4080	969
4077	973
4077	974
4077	975
4079	970
4079	971
4079	972
4078	976
4078	977
4078	978
4063	979
4063	980
4063	981
4063	982
4107	983
4107	984
4107	985
4107	986
4107	987
4107	988
4107	989
4114	990
4114	991
4114	992
4115	993
4115	994
4115	995
4115	996
4118	997
4118	998
4118	999
4118	1000
4118	1001
4118	1002
4118	1003
4118	1004
4118	1005
4119	1006
4119	1007
4119	1008
4119	1009
4119	1010
4119	1011
4119	1012
4120	1013
4120	1014
4120	1015
4120	1016
4121	1017
4121	1018
4121	1019
4121	1020
4122	1021
4122	1022
4122	1023
4122	1024
4123	1025
4123	1026
4123	1027
4123	1028
4124	1029
4124	1030
4124	1031
4124	1032
4125	1033
4125	1034
4125	1035
4125	1036
4126	1037
4126	1038
4126	1039
4126	1040
4127	1041
4127	1042
4127	1043
4127	1044
4128	1045
4128	1046
4128	1047
4129	1050
4129	1051
4129	1052
4131	1054
4131	1055
4131	1056
4131	1057
4131	1058
4131	1059
4131	1060
4133	1061
4133	1062
4133	1063
4133	1064
4133	1065
4133	1066
4134	1067
4134	1068
4134	1069
4134	1070
4135	1071
4135	1072
4135	1073
4135	1074
4135	1075
4135	1076
4135	1077
4137	1078
4137	1079
4137	1080
4137	1081
4137	1082
4137	1083
4137	1084
4139	1085
4139	1086
4139	1087
4139	1088
4139	1089
4139	1090
4139	1091
4139	1092
4139	1093
4139	1094
4140	1095
4140	1096
4140	1097
4140	1098
4140	1099
4141	1100
4141	1101
4141	1102
4141	1103
4141	1104
4141	1105
4141	1106
4141	1107
4141	1108
4141	1109
4142	1110
4142	1111
4142	1112
4142	1113
4142	1114
4142	1115
4143	1116
4143	1117
4143	1118
4143	1119
4143	1120
4143	1121
4143	1122
4143	1123
4143	1124
4143	1125
4144	1126
4144	1127
4144	1128
4144	1129
4144	1130
4144	1131
4144	1132
4144	1133
4144	1134
4144	1135
4151	1136
4151	1137
4151	1138
4151	1139
4151	1140
4151	1141
4151	1142
4151	1143
4151	1144
4151	1145
4152	1146
4152	1147
4152	1148
4152	1149
4152	1150
4152	1151
4152	1152
4152	1153
4152	1154
4152	1155
4153	1156
4153	1157
4153	1158
4153	1159
4154	1160
4154	1161
4154	1162
4154	1163
4154	1164
4154	1165
4154	1166
4154	1167
4154	1168
4154	1169
4155	1170
4155	1171
4155	1172
4155	1173
4155	1174
4155	1175
4155	1176
4155	1177
4155	1178
4149	1179
4149	1180
4149	1181
4149	1182
4149	1183
4149	1184
4149	1185
4149	1186
4149	1187
4149	1188
4145	1189
4145	1190
4145	1191
4145	1192
4145	1193
4145	1194
4146	1195
4146	1196
4146	1197
4146	1198
4146	1199
4146	1200
4146	1201
4146	1202
4146	1203
4146	1204
4195	1228
4195	1229
4195	1230
4195	1231
4196	1232
4196	1233
4196	1234
4196	1235
4193	1240
4193	1241
4193	1242
4193	1243
4193	1244
4189	1250
4189	1251
4189	1252
4189	1253
4189	1254
4186	1255
4186	1256
4186	1257
4186	1258
4185	1259
4185	1260
4185	1261
4185	1262
4175	1263
4175	1264
4175	1265
4175	1266
4175	1267
4175	1268
4175	1269
4147	1205
4147	1206
4147	1207
4147	1208
4147	1209
4147	1210
4147	1211
4147	1212
4147	1213
4147	1214
4148	1215
4148	1216
4148	1217
4148	1218
4148	1219
4148	1220
4148	1221
4148	1222
4148	1223
4148	1224
4158	1225
4158	1226
4158	1227
4192	1236
4192	1237
4192	1238
4192	1239
4191	1245
4191	1246
4191	1247
4191	1248
4191	1249
4174	1270
4174	1271
4174	1272
4174	1273
4174	1274
4174	1275
4174	1276
4173	1277
4173	1278
4173	1279
4173	1280
4173	1281
4173	1282
4172	1283
4172	1284
4172	1285
4172	1286
4172	1287
4172	1288
4172	1289
4171	1290
4171	1291
4171	1292
4171	1293
4171	1294
4170	1295
4170	1296
4170	1297
4170	1298
4170	1299
4169	1300
4169	1301
4169	1302
4169	1303
4169	1304
4168	1305
4168	1306
4168	1307
4168	1308
4168	1309
4167	1310
4167	1311
4167	1312
4167	1313
4167	1314
4166	1315
4166	1316
4166	1317
4166	1318
4166	1319
4165	1320
4165	1321
4165	1322
4165	1323
4165	1324
4204	1325
4204	1326
4204	1327
4204	1328
4206	1329
4206	1330
4206	1331
4206	1332
4210	1333
4210	1334
4210	1335
4210	1336
4209	1337
4209	1338
4209	1339
4209	1340
4208	1341
4208	1342
4208	1343
4208	1344
4212	1345
4212	1346
4212	1347
4212	1348
4212	1349
4212	1350
4212	1351
4213	1352
4213	1353
4213	1354
4213	1355
4213	1356
4213	1357
4214	1358
4214	1359
4214	1360
4214	1361
4215	1362
4215	1363
4215	1364
4215	1365
4216	1366
4216	1367
4216	1368
4216	1369
4222	1370
4222	1371
4222	1372
4222	1373
4222	1374
4222	1375
4222	1376
4222	1377
4222	1378
4221	1379
4221	1380
4221	1381
4221	1382
4221	1383
4221	1384
4221	1385
4221	1386
4221	1387
4220	1388
4220	1389
4220	1390
4220	1391
4220	1392
4220	1393
4220	1394
4220	1395
4220	1396
4219	1397
4219	1398
4219	1399
4219	1400
4219	1401
4219	1402
4219	1403
4219	1404
4219	1405
4217	1406
4217	1407
4217	1408
4217	1409
4217	1410
4217	1411
4218	1412
4218	1413
4218	1414
4218	1415
4218	1416
4218	1417
4431	1418
4431	1419
4431	1420
4431	1421
4430	1422
4430	1423
4430	1424
4430	1425
4420	1426
4420	1427
4420	1428
4420	1429
4420	1430
4421	1431
4421	1432
4421	1433
4421	1434
4455	1435
4455	1436
4455	1437
4455	1438
4455	1439
4455	1440
4455	1441
4455	1442
4456	1443
4456	1444
4456	1445
4456	1446
4456	1447
4440	1448
4440	1449
4440	1450
4440	1451
4440	1452
4440	1453
4440	1454
4440	1455
4440	1456
4440	1457
4440	1458
4440	1459
4441	1460
4441	1461
4441	1462
4441	1463
4441	1464
4441	1465
4441	1466
4441	1467
4441	1468
4441	1469
4441	1470
4441	1471
4442	1472
4442	1473
4442	1474
4442	1475
4442	1476
4442	1477
4442	1478
4442	1479
4442	1480
4442	1481
4442	1482
4451	1483
4451	1484
4451	1485
4451	1486
4450	1487
4450	1488
4450	1489
4450	1490
4452	1491
4452	1492
4452	1493
4452	1494
4458	1495
4458	1496
4458	1497
4458	1498
4458	1499
4447	1500
4447	1501
4447	1502
4447	1503
4447	1504
4448	1505
4448	1506
4448	1507
4448	1508
4448	1509
4454	1510
4454	1511
4454	1512
4454	1513
4453	1514
4453	1515
4453	1516
4453	1517
4446	1518
4446	1519
4446	1520
4446	1521
4446	1522
4449	1523
4449	1524
4449	1525
4449	1526
4449	1527
4445	1528
4445	1529
4445	1530
4445	1531
4503	1532
4503	1533
4503	1534
4503	1535
4503	1536
4503	1537
4502	1538
4502	1539
4502	1540
4502	1541
4502	1542
4502	1543
4504	1544
4504	1545
4504	1546
4504	1547
4504	1548
4505	1549
4505	1550
4505	1551
4505	1552
4505	1553
4513	1554
4513	1555
4513	1556
4513	1557
4517	1558
4517	1559
4517	1560
4517	1561
4515	1562
4515	1563
4515	1564
4515	1565
4549	1566
4549	1567
4549	1568
4549	1569
4549	1570
4553	1571
4553	1572
4553	1573
4553	1574
4590	1575
4590	1576
4590	1578
4590	1579
4590	1580
4586	1581
4586	1582
4586	1583
4586	1584
4586	1585
4587	1586
4587	1587
4587	1588
4587	1589
4587	1590
4588	1591
4588	1592
4588	1593
4588	1594
4588	1595
4588	1596
4589	1597
4589	1598
4589	1599
4589	1600
4603	1601
4603	1602
4603	1603
4603	1604
4603	1605
4603	1606
4603	1607
4603	1608
4601	1609
4601	1610
4601	1611
4601	1612
4601	1613
4601	1614
4601	1615
4601	1616
4601	1617
4601	1618
4602	1620
4602	1621
4602	1622
4602	1623
4602	1624
4602	1625
4599	1626
4599	1627
4599	1628
4599	1629
4599	1630
4599	1631
4599	1632
4599	1633
4599	1634
4599	1635
4599	1636
4605	1637
4605	1638
4605	1639
4605	1640
4605	1641
4597	1642
4597	1643
4597	1644
4597	1645
4597	1646
4597	1647
4597	1648
4597	1649
4597	1650
4597	1651
4597	1652
4596	1653
4596	1654
4596	1655
4596	1656
4596	1657
4596	1658
4596	1659
4596	1660
4596	1661
4595	1662
4595	1663
4595	1664
4595	1665
4595	1666
4595	1667
4595	1668
4595	1669
4595	1670
4595	1671
4595	1672
4594	1673
4594	1674
4594	1675
4594	1676
4594	1677
4594	1678
4594	1679
4594	1680
4594	1681
4594	1682
4593	1683
4593	1684
4593	1685
4593	1686
4593	1687
4593	1688
4593	1689
4593	1690
4593	1691
4593	1692
4593	1693
4592	1694
4592	1695
4592	1696
4592	1697
4592	1698
4592	1699
4592	1700
4592	1701
4592	1702
4592	1703
4592	1704
4591	1705
4591	1706
4591	1707
4591	1708
4591	1709
4591	1710
4591	1711
4591	1712
4591	1713
4591	1714
4591	1715
4645	1716
4645	1717
4645	1718
4645	1719
4644	1720
4644	1721
4644	1722
4644	1723
4646	1725
4646	1726
4646	1727
4646	1728
4652	1729
4652	1730
4652	1731
4652	1732
4657	1733
4657	1734
4657	1735
4657	1736
4657	1737
4657	1738
4657	1739
4657	1740
4657	1741
4657	1742
4669	1743
4669	1744
4669	1745
4669	1746
4668	1747
4668	1748
4668	1749
4668	1750
4667	1751
4667	1752
4667	1753
4667	1754
4667	1755
4666	1756
4666	1757
4666	1758
4666	1759
4666	1760
4665	1761
4665	1762
4665	1763
4665	1764
4665	1765
4665	1766
4665	1767
4665	1768
4665	1769
4665	1770
4664	1771
4664	1772
4664	1773
4664	1774
4664	1775
4664	1776
4664	1777
4664	1778
4664	1779
4662	1780
4662	1781
4662	1782
4662	1783
4662	1784
4662	1785
4662	1786
4662	1787
4662	1788
4662	1789
4661	1790
4661	1791
4661	1792
4661	1793
4661	1794
4661	1795
4661	1796
4661	1797
4661	1798
4661	1799
4660	1800
4660	1801
4660	1802
4660	1803
4660	1804
4660	1805
4660	1806
4660	1807
4660	1808
4660	1809
4659	1810
4659	1811
4659	1812
4659	1813
4659	1814
4659	1815
4659	1816
4659	1817
4659	1818
4658	1819
4658	1820
4658	1821
4658	1822
4658	1823
4658	1824
4658	1825
4658	1826
4658	1827
4658	1828
4656	1829
4656	1830
4656	1831
4656	1832
4656	1833
4656	1834
4656	1835
4655	1836
4655	1837
4655	1838
4655	1839
4655	1840
4655	1841
4654	1842
4654	1843
4654	1844
4654	1845
4654	1846
4654	1847
4653	1848
4653	1849
4653	1850
4653	1851
4653	1852
4653	1853
4699	1854
4699	1855
4699	1856
4699	1857
4699	1858
4699	1859
4699	1860
4699	1861
4699	1862
4698	1863
4698	1864
4698	1865
4698	1866
4698	1867
4698	1868
4698	1869
4698	1870
4698	1871
4697	1872
4697	1873
4697	1874
4697	1875
4697	1876
4697	1877
4697	1878
4697	1879
4697	1880
4696	1881
4696	1882
4696	1883
4696	1884
4696	1885
4696	1886
4696	1887
4696	1888
4696	1889
4714	1890
4714	1891
4714	1892
4714	1893
4714	1894
4714	1895
4713	1896
4713	1897
4713	1898
4713	1899
4712	1900
4712	1901
4712	1902
4712	1903
4715	1904
4715	1905
4715	1906
4715	1907
4716	1908
4716	1909
4716	1910
4716	1911
4716	1912
4716	1913
4707	1914
4707	1915
4707	1916
4707	1917
4707	1918
4708	1919
4708	1920
4708	1921
4708	1922
4708	1923
4706	1924
4706	1925
4706	1926
4706	1927
4706	1928
4705	1929
4705	1930
4705	1931
4705	1932
4705	1933
4703	1934
4703	1935
4703	1936
4703	1937
4703	1938
4709	1945
4709	1946
4709	1947
4709	1948
4709	1949
4774	1960
4774	1961
4774	1962
4774	1963
4774	1964
4774	1965
4774	1966
4774	1967
4774	1968
4790	2014
4790	2015
4790	2016
4790	2017
4790	2018
4790	2019
4790	2020
4790	2021
4790	2022
4791	2023
4791	2024
4791	2025
4791	2026
4791	2027
4791	2028
4791	2029
4791	2030
4791	2031
4792	2032
4792	2033
4792	2034
4792	2035
4792	2036
4792	2037
4792	2038
4792	2039
4792	2040
4792	2041
4825	2046
4825	2047
4825	2048
4825	2049
4825	2050
4825	2051
4825	2052
4825	2053
4825	2054
4824	2055
4824	2056
4824	2057
4824	2058
4824	2059
4824	2060
4824	2061
4824	2062
4824	2063
4823	2064
4823	2065
4823	2066
4823	2067
4823	2068
4823	2069
4823	2070
4823	2071
4823	2072
4827	2096
4827	2097
4827	2098
4827	2099
4851	2100
4851	2101
4851	2102
4851	2103
4858	2116
4858	2117
4858	2118
4858	2119
4865	2134
4865	2135
4865	2136
4865	2137
4865	2138
4865	2139
4865	2140
4865	2141
4702	1939
4702	1940
4702	1941
4702	1942
4702	1943
4702	1944
4776	1950
4776	1951
4776	1952
4776	1953
4775	1954
4775	1955
4775	1956
4775	1957
4775	1958
4775	1959
4773	1969
4773	1970
4773	1971
4773	1972
4773	1973
4773	1974
4771	1975
4771	1976
4771	1977
4771	1978
4777	1979
4777	1980
4777	1981
4777	1982
4777	1983
4786	1984
4786	1985
4786	1986
4786	1987
4786	1988
4786	1989
4786	1990
4786	1991
4786	1992
4786	1993
4787	1994
4787	1995
4787	1996
4787	1997
4787	1998
4787	1999
4787	2000
4787	2001
4787	2002
4787	2003
4788	2004
4788	2005
4788	2006
4788	2007
4788	2008
4788	2009
4788	2010
4788	2011
4788	2012
4788	2013
4820	2042
4820	2043
4820	2044
4820	2045
4822	2073
4822	2074
4822	2075
4822	2076
4822	2077
4822	2078
4822	2079
4822	2080
4822	2081
4821	2082
4821	2083
4821	2084
4821	2085
4821	2086
4821	2087
4821	2088
4821	2089
4821	2090
4821	2091
4826	2092
4826	2093
4826	2094
4826	2095
4857	2104
4857	2105
4857	2106
4857	2107
4860	2108
4860	2109
4860	2110
4860	2111
4859	2112
4859	2113
4859	2114
4859	2115
4867	2120
4867	2121
4867	2122
4867	2123
4867	2124
4867	2125
4866	2126
4866	2127
4866	2128
4866	2129
4866	2130
4866	2131
4866	2132
4866	2133
4861	2142
4861	2143
4861	2144
4861	2145
4861	2146
4861	2147
4861	2148
4870	2149
4870	2150
4870	2151
4870	2152
4869	2153
4869	2154
4869	2155
4869	2156
4862	2157
4862	2158
4862	2159
4862	2160
4862	2161
4862	2162
4862	2163
4862	2164
4864	2165
4864	2166
4864	2167
4864	2168
4864	2169
4864	2170
4864	2171
4864	2172
\.


--
-- Data for Name: destinos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY destinos (id, tipo, fecha, destino, norma_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: destinos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('destinos_id_seq', 1, false);


--
-- Data for Name: diario_de_sesions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY diario_de_sesions (id, created_at, updated_at) FROM stdin;
\.


--
-- Name: diario_de_sesions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('diario_de_sesions_id_seq', 1, false);


--
-- Data for Name: digestos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY digestos (id, nombre, observacion, created_at, updated_at) FROM stdin;
\.


--
-- Name: digestos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('digestos_id_seq', 1, false);


--
-- Data for Name: documentacion_presentadas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY documentacion_presentadas (id, tipo, condonacion_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: documentacion_presentadas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('documentacion_presentadas_id_seq', 1, false);


--
-- Data for Name: estado_expedientes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY estado_expedientes (id, nombre, especificacion1, especificacion2, tipo, circuito_id, created_at, updated_at, ref_id, ref_type, fecha) FROM stdin;
\.


--
-- Name: estado_expedientes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('estado_expedientes_id_seq', 1, false);


--
-- Data for Name: estado_tramites; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY estado_tramites (id, nombre, especificacion, tipo, tramite_id, created_at, updated_at, ref_id, ref_type) FROM stdin;
\.


--
-- Name: estado_tramites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('estado_tramites_id_seq', 1, false);


--
-- Data for Name: expediente_administrativos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY expediente_administrativos (id, nro_exp, nro_fojas, bis, tema, observacion, expediente_id, created_at, updated_at, sub_indice, letra, anio) FROM stdin;
\.


--
-- Name: expediente_administrativos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('expediente_administrativos_id_seq', 1, false);


--
-- Data for Name: expedientes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY expedientes (id, nro_exp, nro_fojas, bis, tema, observacion, created_at, updated_at, anio) FROM stdin;
1	12001	\N	0	\N	\N	2015-09-21 14:36:58.816007	2015-09-21 14:36:58.816007	\N
2		\N	0	\N	\N	2015-09-21 14:36:58.826441	2015-09-21 14:36:58.826441	\N
3	12536	\N	0	\N	\N	2015-09-21 14:37:08.351291	2015-09-21 14:37:08.351291	\N
4	20563	\N	0	\N	\N	2015-09-21 14:37:39.744262	2015-09-21 14:37:39.744262	\N
6	16589	\N	0	\N	\N	2015-09-21 14:52:58.766316	2015-09-21 14:52:58.766316	\N
7	3536	\N	0	\N	\N	2015-09-22 13:44:53.744303	2015-09-22 13:44:53.744303	\N
8	2264	\N	0	\N	\N	2015-09-22 13:47:09.426718	2015-09-22 13:47:09.426718	\N
9	2166	\N	0	\N	\N	2015-09-22 13:47:09.430859	2015-09-22 13:47:09.430859	\N
10	22344 - 22215 - 21678 - 22383 - 21635 - 22590 - 22578	\N	0	\N	\N	2015-09-24 12:16:09.519084	2015-09-24 12:16:09.519084	\N
11	22630	\N	0	\N	\N	2015-09-24 12:22:01.620546	2015-09-24 12:22:01.620546	\N
12	22631 	\N	0	\N	\N	2015-09-24 12:39:15.76096	2015-09-24 12:39:15.76096	\N
13	22656	\N	\N	\N	\N	2015-09-24 12:40:58.812549	2015-09-24 12:44:53.564112	\N
14	22445	\N	0	\N	\N	2015-09-24 13:28:38.363306	2015-09-24 13:28:38.363306	\N
15	22659	\N	0	\N	\N	2015-09-24 13:53:14.502591	2015-09-24 13:53:14.502591	\N
16	22638	\N	0	\N	\N	2015-09-24 14:13:03.932603	2015-09-24 14:13:03.932603	\N
17	22628	\N	0	\N	\N	2015-09-24 14:42:22.024617	2015-09-24 14:42:22.024617	\N
18	22633	\N	0	\N	\N	2015-09-24 14:48:56.959066	2015-09-24 14:48:56.959066	\N
19	22608	\N	0	\N	\N	2015-09-24 14:53:40.516485	2015-09-24 14:53:40.516485	\N
20	22643	\N	0	\N	\N	2015-09-24 14:54:15.908412	2015-09-24 14:54:15.908412	\N
21	22645	\N	0	\N	\N	2015-09-29 15:18:47.29632	2015-09-29 15:18:47.29632	\N
22	22669	\N	0	\N	\N	2015-09-29 15:21:55.910291	2015-09-29 15:21:55.910291	\N
23	22597	\N	0	\N	\N	2015-09-30 14:51:42.82811	2015-09-30 14:51:42.82811	\N
24	22582	\N	0	\N	\N	2015-09-30 14:54:55.123344	2015-09-30 14:54:55.123344	\N
25	22168	\N	0	\N	\N	2015-09-30 14:58:06.153597	2015-09-30 14:58:06.153597	\N
26	22696	\N	0	\N	\N	2015-09-30 15:02:01.592758	2015-09-30 15:02:01.592758	\N
27	22607	\N	0	\N	\N	2015-09-30 15:53:11.597332	2015-09-30 15:53:11.597332	\N
28	22511	\N	0	\N	\N	2015-09-30 16:13:57.173433	2015-09-30 16:13:57.173433	\N
29	22561	\N	0	\N	\N	2015-09-30 16:16:15.728228	2015-09-30 16:16:15.728228	\N
30	22614	\N	0	\N	\N	2015-09-30 16:17:18.815739	2015-09-30 16:17:18.815739	\N
31	22617	\N	0	\N	\N	2015-09-30 16:18:13.57847	2015-09-30 16:18:13.57847	\N
32	22673	\N	0	\N	\N	2015-09-30 16:19:17.388305	2015-09-30 16:19:17.388305	\N
33	22678	\N	0	\N	\N	2015-10-06 14:37:46.424406	2015-10-06 14:37:46.424406	\N
34	21934	\N	0	\N	\N	2015-10-06 15:01:29.491164	2015-10-06 15:01:29.491164	\N
35	21716	\N	0	\N	\N	2015-10-06 15:04:47.050935	2015-10-06 15:04:47.050935	\N
36	22712	\N	0	\N	\N	2015-10-06 15:08:22.524338	2015-10-06 15:08:22.524338	\N
37	22713	\N	0	\N	\N	2015-10-06 15:11:16.131541	2015-10-06 15:11:16.131541	\N
38	22715	\N	0	\N	\N	2015-10-06 15:13:36.856702	2015-10-06 15:13:36.856702	\N
39	22475	\N	0	\N	\N	2015-10-06 15:16:24.558898	2015-10-06 15:16:24.558898	\N
41	22721	\N	0	\N	\N	2015-10-07 14:58:02.603723	2015-10-07 14:58:02.603723	\N
42	22706	\N	0	\N	\N	2015-10-07 15:01:00.506135	2015-10-07 15:01:00.506135	\N
44	22707	\N	0	\N	\N	2015-10-07 15:04:57.812127	2015-10-07 15:04:57.812127	\N
45	22725	\N	0	\N	\N	2015-10-07 15:06:50.830995	2015-10-07 15:06:50.830995	\N
46	22676	\N	0	\N	\N	2015-10-07 15:08:31.22367	2015-10-07 15:08:31.22367	\N
47	22691	\N	0	\N	\N	2015-10-07 15:11:30.423785	2015-10-07 15:11:30.423785	\N
48	22720	\N	0	\N	\N	2015-10-07 15:13:06.253418	2015-10-07 15:13:06.253418	\N
40	22724	\N	\N	\N	\N	2015-10-07 14:55:08.378282	2015-10-07 15:38:40.283113	\N
49	22687	\N	0	\N	\N	2015-10-07 15:40:02.053902	2015-10-07 15:40:02.053902	\N
50	22688	\N	0	\N	\N	2015-10-07 15:43:12.766945	2015-10-07 15:43:12.766945	\N
43	22679	\N	\N	\N	\N	2015-10-07 15:03:20.495536	2015-10-07 15:59:19.9149	\N
51	22555	\N	0	\N	\N	2015-10-14 14:13:43.879021	2015-10-14 14:13:43.879021	\N
52	22350	\N	0	\N	\N	2015-10-14 14:15:20.377909	2015-10-14 14:15:20.377909	\N
57	22642	\N	0	\N	\N	2015-10-14 14:29:48.582143	2015-10-14 14:29:48.582143	\N
53	22731	\N	\N	\N	\N	2015-10-14 14:17:03.230625	2015-10-14 15:47:40.938042	\N
54	22751	\N	\N	\N	\N	2015-10-14 14:19:14.194253	2015-10-14 15:52:02.499006	\N
55	22743	\N	\N	\N	\N	2015-10-14 14:25:03.234819	2015-10-14 15:55:38.488429	\N
56	22744	\N	\N	\N	\N	2015-10-14 14:26:55.481333	2015-10-14 16:02:44.961804	\N
58	22625	\N	\N	\N	\N	2015-10-14 14:31:29.266062	2015-10-15 10:57:52.156775	\N
59		\N	22750	\N	\N	2015-10-21 12:46:21.847732	2015-10-21 12:46:21.847732	\N
60	22775	\N	0	\N	\N	2015-10-21 14:51:50.921449	2015-10-21 14:51:50.921449	\N
61	22777	\N	0	\N	\N	2015-10-21 14:54:32.574237	2015-10-21 14:54:32.574237	\N
62	22774	\N	0	\N	\N	2015-10-21 14:56:48.939908	2015-10-21 14:56:48.939908	\N
63	22690	\N	0	\N	\N	2015-10-21 15:06:42.964013	2015-10-21 15:06:42.964013	\N
64	22734	\N	0	\N	\N	2015-10-21 15:09:05.577479	2015-10-21 15:09:05.577479	\N
65	22759	\N	0	\N	\N	2015-10-21 15:11:15.923542	2015-10-21 15:11:15.923542	\N
66	22742	\N	0	\N	\N	2015-10-21 15:13:52.48229	2015-10-21 15:13:52.48229	\N
67	22727	\N	0	\N	\N	2015-10-21 15:16:36.283365	2015-10-21 15:16:36.283365	\N
68	22717	\N	0	\N	\N	2015-10-21 15:18:06.094172	2015-10-21 15:18:06.094172	\N
69	22756	\N	0	\N	\N	2015-10-21 15:21:17.813042	2015-10-21 15:21:17.813042	\N
70	22741	\N	0	\N	\N	2015-10-21 15:23:48.97588	2015-10-21 15:23:48.97588	\N
71	22616	\N	0	\N	\N	2015-10-21 16:17:02.912497	2015-10-21 16:17:02.912497	\N
72	22681	\N	0	\N	\N	2015-10-21 16:18:55.075864	2015-10-21 16:18:55.075864	\N
73	22694	\N	0	\N	\N	2015-10-28 13:25:57.032876	2015-10-28 13:25:57.032876	\N
74	22773	\N	0	\N	\N	2015-10-28 13:28:34.627279	2015-10-28 13:28:34.627279	\N
75	22748	\N	0	\N	\N	2015-10-28 13:45:22.816271	2015-10-28 13:45:22.816271	\N
76	22797	\N	0	\N	\N	2015-10-28 13:50:42.718972	2015-10-28 13:50:42.718972	\N
77	22733	\N	0	\N	\N	2015-10-28 13:53:07.614952	2015-10-28 13:53:07.614952	\N
78	22781	\N	0	\N	\N	2015-10-28 13:54:54.1364	2015-10-28 13:54:54.1364	\N
79	22532	\N	0	\N	\N	2015-10-28 13:56:05.672239	2015-10-28 13:56:05.672239	\N
80	22732	\N	0	\N	\N	2015-10-28 13:57:33.301324	2015-10-28 13:57:33.301324	\N
81	22782	\N	0	\N	\N	2015-10-28 14:56:59.283608	2015-10-28 14:56:59.283608	\N
82	22798	\N	0	\N	\N	2015-10-28 14:58:40.086552	2015-10-28 14:58:40.086552	\N
83	22608	\N	0	\N	\N	2015-10-28 15:38:46.579396	2015-10-28 15:38:46.579396	\N
84	22768	\N	0	\N	\N	2015-10-28 15:42:42.36238	2015-10-28 15:42:42.36238	\N
85	22747	\N	0	\N	\N	2015-10-28 15:53:12.259739	2015-10-28 15:53:12.259739	\N
86	22772	\N	0	\N	\N	2015-10-28 16:30:15.108384	2015-10-28 16:30:15.108384	\N
87	22813	\N	0	\N	\N	2015-11-04 15:13:18.442684	2015-11-04 15:13:18.442684	\N
88	22819	\N	0	\N	\N	2015-11-04 16:00:47.537295	2015-11-04 16:00:47.537295	\N
89	22823	\N	0	\N	\N	2015-11-04 16:04:24.493812	2015-11-04 16:04:24.493812	\N
90	22543	\N	0	\N	\N	2015-11-04 16:06:02.70811	2015-11-04 16:06:02.70811	\N
91	22814	\N	0	\N	\N	2015-11-04 16:07:37.13814	2015-11-04 16:07:37.13814	\N
92	22790	\N	0	\N	\N	2015-11-04 16:09:45.789604	2015-11-04 16:09:45.789604	\N
93	22796	\N	0	\N	\N	2015-11-04 16:11:11.547862	2015-11-04 16:11:11.547862	\N
94	22767	\N	0	\N	\N	2015-11-04 16:13:52.119207	2015-11-04 16:13:52.119207	\N
95	22755	\N	0	\N	\N	2015-11-04 16:15:12.94204	2015-11-04 16:15:12.94204	\N
96	22770	\N	0	\N	\N	2015-11-04 16:16:11.225441	2015-11-04 16:16:11.225441	\N
97	22745	\N	0	\N	\N	2015-11-04 16:17:49.087078	2015-11-04 16:17:49.087078	\N
98	22348	\N	0	\N	\N	2015-11-04 16:32:46.941319	2015-11-04 16:32:46.941319	\N
99		\N	0	\N	\N	2015-11-05 12:31:53.778266	2015-11-05 12:31:53.778266	\N
100	22835	\N	0	\N	\N	2015-11-10 15:14:22.11005	2015-11-10 15:14:22.11005	\N
101	22830	\N	0	\N	\N	2015-11-10 15:16:21.677809	2015-11-10 15:16:21.677809	\N
102	22845	\N	0	\N	\N	2015-11-10 15:18:05.72923	2015-11-10 15:18:05.72923	\N
103	22846	\N	0	\N	\N	2015-11-10 15:19:36.474792	2015-11-10 15:19:36.474792	\N
104	22852	\N	0	\N	\N	2015-11-10 15:20:54.594301	2015-11-10 15:20:54.594301	\N
105	22836	\N	0	\N	\N	2015-11-10 15:24:33.286706	2015-11-10 15:24:33.286706	\N
106	22771	\N	0	\N	\N	2015-11-10 15:30:50.777236	2015-11-10 15:30:50.777236	\N
107	22824	\N	0	\N	\N	2015-11-10 15:33:22.473369	2015-11-10 15:33:22.473369	\N
108	22754	\N	0	\N	\N	2015-11-10 15:35:53.283559	2015-11-10 15:35:53.283559	\N
109	22795	\N	0	\N	\N	2015-11-10 15:59:15.305187	2015-11-10 15:59:15.305187	\N
110	22818	\N	0	\N	\N	2015-11-10 16:00:42.758983	2015-11-10 16:00:42.758983	\N
111	22875	\N	0	\N	\N	2015-11-17 15:06:45.609999	2015-11-17 15:06:45.609999	\N
112	22868	\N	0	\N	\N	2015-11-18 13:34:00.065394	2015-11-18 13:34:46.79024	\N
113	22869	\N	0	\N	\N	2015-11-18 13:39:52.742852	2015-11-18 13:39:52.742852	\N
114	22543	\N	0	\N	\N	2015-11-18 13:48:53.756118	2015-11-18 13:48:53.756118	\N
115	22862	\N	0	\N	\N	2015-11-18 13:51:08.858943	2015-11-18 13:51:08.858943	\N
116	22622	\N	0	\N	\N	2015-11-18 13:55:01.204765	2015-11-18 13:56:05.837879	\N
117	22705	\N	0	\N	\N	2015-11-18 13:58:13.450323	2015-11-18 13:58:13.450323	\N
118	22789	\N	0	\N	\N	2015-11-18 14:00:43.550124	2015-11-18 14:00:43.550124	\N
119	22837	\N	0	\N	\N	2015-11-18 14:02:37.389179	2015-11-18 14:02:37.389179	\N
120	22865	\N	0	\N	\N	2015-11-18 14:04:13.438999	2015-11-18 14:04:13.438999	\N
121	22806	\N	0	\N	\N	2015-11-18 14:06:09.225183	2015-11-18 14:06:09.225183	\N
122	22872	\N	0	\N	\N	2015-11-18 14:11:55.085144	2015-11-18 14:11:55.085144	\N
123	22856	\N	0	\N	\N	2015-11-18 14:14:42.76404	2015-11-18 14:14:42.76404	\N
126	22826	\N	0	\N	\N	2015-11-18 14:26:02.038702	2015-11-18 14:26:02.038702	\N
127	22827	\N	0	\N	\N	2015-11-18 14:27:41.90124	2015-11-18 14:27:41.90124	\N
124	22843	\N	0	\N	\N	2015-11-18 14:15:36.950164	2015-11-18 14:15:36.950164	\N
125	22825	\N	0	\N	\N	2015-11-18 14:23:02.889979	2015-11-18 14:23:02.889979	\N
128	22821	\N	0	\N	\N	2015-11-25 14:06:33.774444	2015-11-25 14:06:33.774444	\N
129	22832	\N	0	\N	\N	2015-11-25 14:08:35.855825	2015-11-25 14:08:35.855825	\N
130	22866	\N	0	\N	\N	2015-11-25 14:10:54.526683	2015-11-25 14:10:54.526683	\N
131	22840	\N	0	\N	\N	2015-11-25 14:12:24.180184	2015-11-25 14:12:24.180184	\N
132	22882	\N	0	\N	\N	2015-11-25 14:56:23.374459	2015-11-25 14:56:23.374459	\N
133	22518	\N	0	\N	\N	2015-11-25 15:21:02.152917	2015-11-25 15:21:02.152917	\N
134	22822	\N	0	\N	\N	2015-11-25 15:22:58.169874	2015-11-25 15:22:58.169874	\N
135	22888	\N	0	\N	\N	2015-11-25 15:25:22.943907	2015-11-25 15:25:22.943907	\N
136	22878	\N	0	\N	\N	2015-11-25 15:27:42.168513	2015-11-25 15:27:42.168513	\N
137	22893	\N	0	\N	\N	2015-11-25 15:29:45.201104	2015-11-25 15:29:45.201104	\N
138	22863	\N	0	\N	\N	2015-11-25 15:34:13.857058	2015-11-25 15:34:13.857058	\N
139	22752	\N	0	\N	\N	2015-11-25 15:35:52.166631	2015-11-25 15:35:52.166631	\N
140	22929	\N	0	\N	\N	2015-12-02 14:15:45.430092	2015-12-02 14:15:45.430092	\N
141	22808	\N	0	\N	\N	2015-12-02 15:09:29.261397	2015-12-02 15:09:29.261397	\N
142	22909	\N	0	\N	\N	2015-12-02 15:10:54.457378	2015-12-02 15:10:54.457378	\N
143	22931	\N	0	\N	\N	2015-12-02 15:12:48.808859	2015-12-02 15:12:48.808859	\N
144	22853	\N	0	\N	\N	2015-12-02 15:14:41.481923	2015-12-02 15:14:41.481923	\N
145	22918	\N	0	\N	\N	2015-12-02 15:16:19.202173	2015-12-02 15:16:19.202173	\N
146	22779	\N	0	\N	\N	2015-12-02 15:17:57.109533	2015-12-02 15:17:57.109533	\N
147	22879	\N	0	\N	\N	2015-12-02 15:20:03.140118	2015-12-02 15:20:03.140118	\N
148	22885	\N	0	\N	\N	2015-12-02 15:22:36.408518	2015-12-02 15:22:36.408518	\N
149	22897	\N	0	\N	\N	2015-12-02 15:29:48.518331	2015-12-02 15:29:48.518331	\N
150	22898	\N	0	\N	\N	2015-12-02 15:31:46.659665	2015-12-02 15:31:46.659665	\N
151	22900	\N	0	\N	\N	2015-12-02 15:32:56.238232	2015-12-02 15:32:56.238232	\N
152	22894	\N	0	\N	\N	2015-12-09 15:28:37.35124	2015-12-09 15:28:37.35124	\N
153	22926	\N	0	\N	\N	2015-12-09 15:39:57.527422	2015-12-09 15:39:57.527422	\N
154	22892	\N	0	\N	\N	2015-12-09 15:41:43.623723	2015-12-09 15:41:43.623723	\N
155	22942	\N	0	\N	\N	2015-12-09 15:43:13.926979	2015-12-09 15:43:13.926979	\N
156	22907	\N	0	\N	\N	2015-12-09 15:47:25.362326	2015-12-09 15:47:25.362326	\N
157	22880	\N	0	\N	\N	2015-12-09 15:49:14.28713	2015-12-09 15:49:14.28713	\N
158	22884	\N	0	\N	\N	2015-12-09 15:50:45.48096	2015-12-09 15:50:45.48096	\N
159	22950	\N	0	\N	\N	2015-12-09 15:56:22.38748	2015-12-09 15:56:22.38748	\N
160	22920	\N	0	\N	\N	2015-12-09 15:58:30.743721	2015-12-09 15:58:30.743721	\N
161	22902	\N	0	\N	\N	2015-12-09 16:00:09.701075	2015-12-09 16:00:09.701075	\N
162	22919	\N	0	\N	\N	2015-12-09 16:09:42.790755	2015-12-09 16:09:42.790755	\N
163	22168	\N	0	\N	\N	2015-12-09 16:10:56.227159	2015-12-09 16:10:56.227159	\N
164	22479	\N	0	\N	\N	2015-12-09 16:12:33.549901	2015-12-09 16:12:33.549901	\N
165	22825	\N	0	\N	\N	2015-12-09 16:24:19.122661	2015-12-09 16:24:19.122661	\N
166	22826	\N	0	\N	\N	2015-12-09 16:26:01.42905	2015-12-09 16:26:01.42905	\N
167	22827	\N	0	\N	\N	2015-12-09 16:27:15.537664	2015-12-09 16:27:15.537664	\N
168	22786	\N	0	\N	\N	2015-12-09 16:28:30.197044	2015-12-09 16:28:30.197044	\N
169	22958	\N	0	\N	\N	2015-12-09 16:29:55.714	2015-12-09 16:29:55.714	\N
170	22969	\N	0	\N	\N	2015-12-09 16:32:05.297506	2015-12-09 16:32:05.297506	\N
171	22965	\N	0	\N	\N	2015-12-09 16:33:21.901531	2015-12-09 16:33:21.901531	\N
172	22956	\N	0	\N	\N	2015-12-09 16:34:41.669453	2015-12-09 16:34:41.669453	\N
173	22791	\N	0	\N	\N	2015-12-15 14:14:50.176048	2015-12-15 14:14:50.176048	\N
174	22834	\N	0	\N	\N	2015-12-16 14:42:43.345897	2015-12-16 14:42:43.345897	\N
175	22596	\N	0	\N	\N	2015-12-16 14:46:10.030274	2015-12-16 14:46:10.030274	\N
176	22955	\N	0	\N	\N	2015-12-16 14:50:15.559359	2015-12-16 14:50:15.559359	\N
179	22304	\N	0	\N	\N	2015-12-16 14:52:54.573103	2015-12-16 14:52:54.573103	\N
180	22735	\N	0	\N	\N	2015-12-16 14:54:18.339271	2015-12-16 14:54:18.339271	\N
181	22810	\N	0	\N	\N	2015-12-16 14:55:51.675766	2015-12-16 14:55:51.675766	\N
182	22847	\N	0	\N	\N	2015-12-16 14:57:23.900431	2015-12-16 14:57:23.900431	\N
183	22857	\N	0	\N	\N	2015-12-16 14:59:30.621664	2015-12-16 14:59:30.621664	\N
185	22980	\N	0	\N	\N	2015-12-16 15:06:40.402035	2015-12-16 15:06:40.402035	\N
186	22977	\N	0	\N	\N	2015-12-16 15:07:55.944674	2015-12-16 15:07:55.944674	\N
187	22981	\N	0	\N	\N	2015-12-16 15:09:12.808018	2015-12-16 15:09:12.808018	\N
188	22976	\N	0	\N	\N	2015-12-16 15:11:07.446076	2015-12-16 15:11:07.446076	\N
189	22788	\N	0	\N	\N	2015-12-16 15:13:35.355697	2015-12-16 15:13:35.355697	\N
190	22982	\N	0	\N	\N	2015-12-16 15:15:43.485889	2015-12-16 15:15:43.485889	\N
191	22968	\N	0	\N	\N	2015-12-16 15:17:20.039236	2015-12-16 15:17:20.039236	\N
192	22855	\N	0	\N	\N	2015-12-16 15:18:56.657694	2015-12-16 15:18:56.657694	\N
193	22960	\N	0	\N	\N	2015-12-16 15:20:59.9655	2015-12-16 15:20:59.9655	\N
194	22020	\N	0	\N	\N	2015-12-16 15:24:51.704365	2015-12-16 15:24:51.704365	\N
195	22962	\N	0	\N	\N	2015-12-16 15:30:37.662111	2015-12-16 15:30:37.662111	\N
196	22930	\N	0	\N	\N	2015-12-16 15:33:11.232614	2015-12-16 15:33:11.232614	\N
197	22912	\N	0	\N	\N	2015-12-16 15:39:03.014483	2015-12-16 15:39:03.014483	\N
198	22911	\N	0	\N	\N	2015-12-16 15:41:37.677982	2015-12-16 15:41:37.677982	\N
199	22928	\N	0	\N	\N	2015-12-16 15:44:09.843378	2015-12-16 15:44:09.843378	\N
200		\N	0	\N	\N	2015-12-16 15:44:09.847879	2015-12-16 15:44:09.847879	\N
201	22966	\N	0	\N	\N	2015-12-16 15:46:28.153675	2015-12-16 15:46:28.153675	\N
202	22764	\N	0	\N	\N	2015-12-16 15:48:38.286169	2015-12-16 15:48:38.286169	\N
203	22975	\N	0	\N	\N	2015-12-16 15:50:19.510701	2015-12-16 15:50:19.510701	\N
204	22910	\N	0	\N	\N	2015-12-16 15:52:31.207229	2015-12-16 15:52:31.207229	\N
205	22933	\N	0	\N	\N	2015-12-16 15:54:18.903398	2015-12-16 15:55:57.939716	\N
206	22939	\N	0	\N	\N	2015-12-16 15:57:48.166061	2015-12-16 15:57:48.166061	\N
207	22949	\N	0	\N	\N	2015-12-16 15:59:21.411413	2015-12-16 15:59:21.411413	\N
208	22435	\N	0	\N	\N	2015-12-16 16:01:22.029604	2015-12-16 16:01:22.029604	\N
209	22692	\N	0	\N	\N	2015-12-16 16:03:00.489341	2015-12-16 16:03:00.489341	\N
210	22927	\N	0	\N	\N	2015-12-16 16:04:43.594401	2015-12-16 16:04:43.594401	\N
211	22923	\N	0	\N	\N	2015-12-16 16:08:07.690356	2015-12-16 16:08:07.690356	\N
212	22964	\N	0	\N	\N	2015-12-16 16:55:19.217858	2015-12-16 16:55:19.217858	\N
177	22979	\N	\N	\N	\N	2015-12-16 14:51:32.757603	2015-12-17 11:02:20.412025	\N
178		\N	\N	\N	\N	2015-12-16 14:51:32.762135	2015-12-17 11:02:20.414308	\N
184	22406	\N	\N	\N	\N	2015-12-16 15:03:07.012443	2015-12-17 11:43:43.145104	\N
213	22952	\N	0	\N	\N	2015-12-21 14:00:57.729895	2015-12-21 14:00:57.729895	\N
214	23003	\N	0	\N	\N	2015-12-21 14:02:38.584132	2015-12-21 14:02:38.584132	\N
215	23005	\N	0	\N	\N	2015-12-21 14:03:57.665843	2015-12-21 14:03:57.665843	\N
216	22420	\N	0	\N	\N	2015-12-21 14:05:13.489254	2015-12-21 14:05:13.489254	\N
217	21457	\N	0	\N	\N	2015-12-21 14:07:16.530412	2015-12-21 14:07:16.530412	\N
218	23004	\N	0	\N	\N	2015-12-21 14:08:30.48991	2015-12-21 14:08:30.48991	\N
219	23006	\N	0	\N	\N	2015-12-21 14:09:43.732379	2015-12-21 14:09:43.732379	\N
220	22986	\N	0	\N	\N	2015-12-21 14:29:17.329979	2015-12-21 14:29:17.329979	\N
221	22978	\N	0	\N	\N	2015-12-21 14:30:40.292322	2015-12-21 14:30:40.292322	\N
222	22973	\N	0	\N	\N	2015-12-21 14:32:10.860941	2015-12-21 14:32:10.860941	\N
223	22983	\N	0	\N	\N	2015-12-21 14:33:15.696829	2015-12-21 14:33:15.696829	\N
224	22951	\N	0	\N	\N	2015-12-21 15:34:07.302784	2015-12-21 15:34:07.302784	\N
225	23001	\N	0	\N	\N	2015-12-21 15:35:50.931262	2015-12-21 15:35:50.931262	\N
226	22803	\N	0	\N	\N	2015-12-21 15:55:12.244874	2015-12-21 15:55:12.244874	\N
227	22988	\N	0	\N	\N	2015-12-21 16:13:18.945731	2015-12-21 16:13:18.945731	\N
228	22987	\N	0	\N	\N	2015-12-21 16:15:00.189393	2015-12-21 16:15:00.189393	\N
229	22839	\N	0	\N	\N	2015-12-21 16:16:20.775362	2015-12-21 16:16:20.775362	\N
230	22598	\N	0	\N	\N	2015-12-21 16:53:29.510528	2015-12-21 16:53:29.510528	\N
231	22992	\N	0	\N	\N	2015-12-21 16:55:17.206582	2015-12-21 16:55:17.206582	\N
232	23019	\N	0	\N	\N	2015-12-28 14:50:21.988	2015-12-28 14:50:21.988	\N
233	22999	\N	0	\N	\N	2015-12-28 15:15:54.754795	2015-12-28 15:15:54.754795	\N
234	22709	\N	0	\N	\N	2015-12-28 15:17:48.216934	2015-12-28 15:17:48.216934	\N
235	23014	\N	0	\N	\N	2015-12-28 15:19:29.062099	2015-12-28 15:19:29.062099	\N
236	23018	\N	0	\N	\N	2015-12-28 15:20:39.636069	2015-12-28 15:20:39.636069	\N
237	23016	\N	0	\N	\N	2015-12-28 15:47:20.570852	2015-12-28 15:47:20.570852	\N
238	23017	\N	0	\N	\N	2015-12-28 15:50:05.975459	2015-12-28 15:50:05.975459	\N
239	23009	\N	0	\N	\N	2015-12-28 15:51:35.788989	2015-12-28 15:51:35.788989	\N
240	23011	\N	0	\N	\N	2015-12-28 15:53:13.39592	2015-12-28 15:53:13.39592	\N
241	23012	\N	0	\N	\N	2015-12-28 15:55:17.138742	2015-12-28 15:55:17.138742	\N
242	22991	\N	0	\N	\N	2015-12-28 16:27:46.037197	2015-12-28 16:27:46.037197	\N
243	22738	\N	0	\N	\N	2015-12-28 16:29:08.205851	2015-12-28 16:29:08.205851	\N
244	22940	\N	0	\N	\N	2015-12-28 16:31:19.179609	2015-12-28 16:31:19.179609	\N
245	22995	\N	0	\N	\N	2015-12-28 16:33:07.98223	2015-12-28 16:33:07.98223	\N
246	22994	\N	0	\N	\N	2015-12-28 16:34:56.913989	2015-12-28 16:34:56.913989	\N
247	22997	\N	0	\N	\N	2015-12-28 16:36:37.560142	2015-12-28 16:36:37.560142	\N
248	22682 - 22615 - 22595 - 22674 - 22421 - 22634 - 23105 - 23041 - 23129	\N	0	\N	\N	2016-03-08 13:52:49.232361	2016-03-09 11:00:39.409539	\N
249	22667 - 22621 - 22703 - 22693 - 22698 - 22470 - 22565 - 22471 - 22517 - 22666 - 22490 - 22683 - 22704 - 22626- 22551 - 22670 - 22672 - 22469 - 22588 - 22601 - 22714 - 22550 - 22695 - 22560 - 22587 - 22700- 22699- 22602 - 22557 - 22680 - 22711 - 22710 - 22701 - 22635 - C -0209 - 22753 -  22473 - 22619 - 22604 - 22635 - 22559	\N	0	\N	\N	2016-03-08 13:54:36.178285	2016-03-09 11:22:49.144992	\N
251	23098	\N	0	\N	\N	2016-03-08 15:01:05.083691	2016-03-08 15:01:05.083691	\N
252	22296	\N	0	\N	\N	2016-03-08 15:04:06.275065	2016-03-08 15:04:06.275065	\N
253		\N	0	\N	\N	2016-03-08 15:04:06.277659	2016-03-08 15:04:06.277659	\N
250	23073 - 23117 - 23074 - 23086 - 23090 - 23096 - 23101 - 23116 - 23044 - 23110 - 23128 - 23049 - 23050 - 23045 - 23087 - 23054 - 23083 - 23047 - 23073 - 23059 - 23070 - 23121 - 23056 - 23066 - 23055 - 23052 - 23051 - 23058 - 23061 - 23068 - 23069 - 23085 -	\N	0	\N	\N	2016-03-08 13:56:54.772263	2016-03-09 11:29:54.311069	\N
254	22925	\N	0	\N	\N	2016-03-09 13:47:18.738627	2016-03-09 13:47:18.738627	\N
255	22946	\N	0	\N	\N	2016-03-09 13:49:25.60217	2016-03-09 13:49:25.60217	\N
256	23000	\N	0	\N	\N	2016-03-09 13:51:27.956087	2016-03-09 13:51:27.956087	\N
257	23040	\N	0	\N	\N	2016-03-09 14:30:34.057667	2016-03-09 14:30:34.057667	\N
258	23119	\N	0	\N	\N	2016-03-09 14:32:12.945792	2016-03-09 14:32:12.945792	\N
259	22959	\N	0	\N	\N	2016-03-09 14:34:17.316692	2016-03-09 14:34:17.316692	\N
260	23112	\N	0	\N	\N	2016-03-09 14:35:59.44119	2016-03-09 14:35:59.44119	\N
261	23088	\N	0	\N	\N	2016-03-09 14:37:36.890915	2016-03-09 14:37:36.890915	\N
262	23062	\N	0	\N	\N	2016-03-09 14:39:17.840366	2016-03-09 14:39:17.840366	\N
263	23104	\N	0	\N	\N	2016-03-09 14:41:45.405449	2016-03-09 14:41:45.405449	\N
264	23027	\N	0	\N	\N	2016-03-09 14:43:26.172993	2016-03-09 14:43:26.172993	\N
265	23103	\N	0	\N	\N	2016-03-09 14:45:09.045814	2016-03-09 14:45:09.045814	\N
266	23110	\N	0	\N	\N	2016-03-09 14:47:02.24288	2016-03-09 14:47:02.24288	\N
267	23125	\N	0	\N	\N	2016-03-09 14:49:21.972711	2016-03-09 14:49:21.972711	\N
268	23124	\N	0	\N	\N	2016-03-09 14:52:10.654173	2016-03-09 14:52:10.654173	\N
269	23035	\N	0	\N	\N	2016-03-09 15:21:05.993709	2016-03-09 15:21:05.993709	\N
270	23186	\N	0	\N	\N	2016-03-16 13:26:22.258341	2016-03-16 13:26:22.258341	\N
271	23197	\N	0	\N	\N	2016-03-16 13:27:52.839687	2016-03-16 13:27:52.839687	\N
272	23175	\N	0	\N	\N	2016-03-16 14:33:57.692467	2016-03-16 14:33:57.692467	\N
273	23178	\N	0	\N	\N	2016-03-16 14:35:44.082187	2016-03-16 14:35:44.082187	\N
274	23167	\N	0	\N	\N	2016-03-16 15:31:49.632986	2016-03-16 15:31:49.632986	\N
275	23209	\N	0	\N	\N	2016-03-16 15:47:52.717694	2016-03-16 15:47:52.717694	\N
276	23137	\N	0	\N	\N	2016-03-16 15:52:24.590329	2016-03-16 15:52:24.590329	\N
277	23176	\N	0	\N	\N	2016-03-22 14:20:36.821272	2016-03-22 14:20:36.821272	\N
278	23143	\N	0	\N	\N	2016-03-22 15:36:28.068464	2016-03-22 15:36:28.068464	\N
279	23207	\N	0	\N	\N	2016-03-30 13:58:51.93779	2016-03-30 13:58:51.93779	\N
280		\N	23182	\N	\N	2016-03-30 14:01:40.271509	2016-03-30 14:01:40.271509	\N
281		\N	23181	\N	\N	2016-03-30 14:03:59.254387	2016-03-30 14:03:59.254387	\N
282	23205	\N	0	\N	\N	2016-03-30 14:05:35.307832	2016-03-30 14:05:35.307832	\N
283	23183	\N	0	\N	\N	2016-03-30 14:06:48.376	2016-03-30 14:06:48.376	\N
284	23210	\N	0	\N	\N	2016-03-30 14:58:54.024255	2016-03-30 14:58:54.024255	\N
285	23199	\N	0	\N	\N	2016-03-30 15:00:49.662767	2016-03-30 15:00:49.662767	\N
286	23107	\N	0	\N	\N	2016-03-30 15:02:44.974081	2016-03-30 15:02:44.974081	\N
287	23184	\N	0	\N	\N	2016-03-30 15:04:46.188583	2016-03-30 15:04:46.188583	\N
288	23060	\N	0	\N	\N	2016-03-30 15:06:37.588768	2016-03-30 15:06:37.588768	\N
289	23203	\N	0	\N	\N	2016-03-30 15:08:06.440908	2016-03-30 15:08:06.440908	\N
290	23122	\N	0	\N	\N	2016-03-30 15:09:38.738006	2016-03-30 15:09:38.738006	\N
291	23229	\N	0	\N	\N	2016-03-30 15:11:32.339478	2016-03-30 15:11:32.339478	\N
292	23239	\N	0	\N	\N	2016-03-30 15:13:10.162589	2016-03-30 15:13:10.162589	\N
293	22864	\N	0	\N	\N	2016-03-30 15:15:22.552766	2016-03-30 15:15:22.552766	\N
294	23165	\N	0	\N	\N	2016-03-30 15:26:07.456351	2016-03-30 15:26:07.456351	\N
295	23282	\N	0	\N	\N	2016-03-30 16:09:10.732733	2016-03-30 16:09:10.732733	\N
296	23289	\N	0	\N	\N	2016-04-06 11:41:58.029561	2016-04-06 11:41:58.029561	\N
297	23206	\N	0	\N	\N	2016-04-06 11:43:46.45874	2016-04-06 11:43:46.45874	\N
298	23267	\N	0	\N	\N	2016-04-06 13:14:17.237572	2016-04-06 13:14:17.237572	\N
299	23301	\N	0	\N	\N	2016-04-06 15:22:54.048706	2016-04-06 15:22:54.048706	\N
300	23299	\N	0	\N	\N	2016-04-06 15:33:17.129023	2016-04-06 15:33:17.129023	\N
301	23305	\N	0	\N	\N	2016-04-06 15:34:58.77588	2016-04-06 15:34:58.77588	\N
302	23304	\N	0	\N	\N	2016-04-06 15:36:58.621552	2016-04-06 15:36:58.621552	\N
303	23314	\N	0	\N	\N	2016-04-06 15:45:56.554149	2016-04-06 15:45:56.554149	\N
304	23237	\N	0	\N	\N	2016-04-06 15:48:15.098921	2016-04-06 15:48:15.098921	\N
305	23246	\N	0	\N	\N	2016-04-06 15:50:22.789152	2016-04-06 15:50:22.789152	\N
306	23188	\N	0	\N	\N	2016-04-06 15:52:16.877356	2016-04-06 15:52:16.877356	\N
307	23245	\N	0	\N	\N	2016-04-06 15:54:01.818238	2016-04-06 15:54:01.818238	\N
308	23030	\N	0	\N	\N	2016-04-06 15:55:45.779093	2016-04-06 15:55:45.779093	\N
309	23235	\N	0	\N	\N	2016-04-06 15:57:32.056577	2016-04-06 15:57:32.056577	\N
310	23179	\N	0	\N	\N	2016-04-06 15:59:38.335305	2016-04-06 15:59:38.335305	\N
311	23169	\N	0	\N	\N	2016-04-06 16:01:09.040938	2016-04-06 16:01:09.040938	\N
312	23298	\N	0	\N	\N	2016-04-06 16:03:09.287169	2016-04-06 16:03:09.287169	\N
313	23308	\N	0	\N	\N	2016-04-06 16:05:22.753262	2016-04-06 16:05:22.753262	\N
314	23306	\N	0	\N	\N	2016-04-06 16:06:35.872911	2016-04-06 16:06:35.872911	\N
351	19582 - 22583	\N	0	\N	\N	2016-04-27 16:11:30.712543	2016-04-27 16:11:30.712543	\N
316	23250	\N	0	\N	\N	2016-04-13 14:02:17.450372	2016-04-13 14:02:17.450372	\N
317	23173	\N	0	\N	\N	2016-04-13 14:04:25.290181	2016-04-13 14:04:25.290181	\N
318	23242	\N	0	\N	\N	2016-04-13 14:05:49.206046	2016-04-13 14:05:49.206046	\N
319	23279	\N	0	\N	\N	2016-04-13 14:07:06.378843	2016-04-13 14:07:06.378843	\N
321	23315	\N	0	\N	\N	2016-04-13 15:34:00.728711	2016-04-13 15:34:00.728711	\N
322	23202	\N	0	\N	\N	2016-04-13 15:36:06.001788	2016-04-13 15:36:06.001788	\N
323	23015	\N	0	\N	\N	2016-04-13 15:38:21.238334	2016-04-13 15:38:21.238334	\N
324	23280	\N	0	\N	\N	2016-04-13 15:40:01.447765	2016-04-13 15:40:01.447765	\N
325	22993	\N	0	\N	\N	2016-04-13 15:41:37.045827	2016-04-13 15:41:37.045827	\N
326	23341	\N	0	\N	\N	2016-04-13 15:43:47.153956	2016-04-13 15:43:47.153956	\N
327	23343	\N	0	\N	\N	2016-04-13 15:51:45.073601	2016-04-13 15:51:45.073601	\N
328	23344	\N	0	\N	\N	2016-04-13 15:54:14.58717	2016-04-13 15:54:14.58717	\N
329	23283	\N	0	\N	\N	2016-04-13 16:09:17.155784	2016-04-13 16:09:17.155784	\N
330	23321	\N	0	\N	\N	2016-04-13 16:18:58.998036	2016-04-13 16:18:58.998036	\N
331	23290	\N	0	\N	\N	2016-04-13 16:22:17.095548	2016-04-13 16:22:17.095548	\N
320	23318- 23322 - 23323 - 23325 -	\N	0	\N	\N	2016-04-13 15:32:07.20059	2016-04-14 12:00:46.158728	\N
332	23365	\N	0	\N	\N	2016-04-20 14:23:23.896117	2016-04-20 14:23:23.896117	\N
333	23352	\N	0	\N	\N	2016-04-20 15:06:58.911473	2016-04-20 15:06:58.911473	\N
334	23376	\N	0	\N	\N	2016-04-20 15:15:37.170096	2016-04-20 15:15:37.170096	\N
335	23372	\N	0	\N	\N	2016-04-20 15:18:19.961911	2016-04-20 15:18:19.961911	\N
336	23375	\N	0	\N	\N	2016-04-20 15:20:27.801467	2016-04-20 15:20:27.801467	\N
337	23351	\N	0	\N	\N	2016-04-21 11:52:06.767668	2016-04-21 11:52:06.767668	\N
338	23260	\N	0	\N	\N	2016-04-21 14:44:17.808989	2016-04-21 14:44:17.808989	\N
339	23288	\N	0	\N	\N	2016-04-21 14:50:52.163841	2016-04-21 14:50:52.163841	\N
340	23270	\N	0	\N	\N	2016-04-21 15:07:06.792593	2016-04-21 15:07:06.792593	\N
341	23259	\N	0	\N	\N	2016-04-21 15:28:00.25924	2016-04-21 15:28:00.25924	\N
342	23355	\N	0	\N	\N	2016-04-21 15:40:14.177776	2016-04-21 15:40:14.177776	\N
343	23277	\N	0	\N	\N	2016-04-21 15:51:34.163101	2016-04-21 15:51:34.163101	\N
344	23362	\N	0	\N	\N	2016-04-27 14:21:59.186419	2016-04-27 14:21:59.186419	\N
345	23311	\N	0	\N	\N	2016-04-27 15:28:23.142272	2016-04-27 15:28:23.142272	\N
346	23339	\N	0	\N	\N	2016-04-27 15:30:02.128516	2016-04-27 15:30:02.128516	\N
347	23309	\N	0	\N	\N	2016-04-27 15:31:29.245415	2016-04-27 15:31:29.245415	\N
348	23335	\N	0	\N	\N	2016-04-27 15:33:05.248965	2016-04-27 15:33:05.248965	\N
349	23268	\N	0	\N	\N	2016-04-27 15:35:16.296103	2016-04-27 15:35:16.296103	\N
350	21978	\N	0	\N	\N	2016-04-27 16:10:13.352986	2016-04-27 16:10:13.352986	\N
352	23348	\N	0	\N	\N	2016-05-04 13:25:32.271176	2016-05-04 13:25:32.271176	\N
353	23409	\N	0	\N	\N	2016-05-04 15:09:57.649133	2016-05-04 15:09:57.649133	\N
354	22018	\N	0	\N	\N	2016-05-04 15:11:22.959877	2016-05-04 15:11:22.959877	\N
355	23411	\N	0	\N	\N	2016-05-04 15:12:40.902022	2016-05-04 15:12:40.902022	\N
356	23389	\N	0	\N	\N	2016-05-04 15:14:08.240701	2016-05-04 15:14:08.240701	\N
357	23403	\N	0	\N	\N	2016-05-04 15:20:52.052796	2016-05-04 15:20:52.052796	\N
358	23367	\N	0	\N	\N	2016-05-04 15:22:22.165426	2016-05-04 15:22:22.165426	\N
359	23406	\N	0	\N	\N	2016-05-04 15:24:57.216026	2016-05-04 15:24:57.216026	\N
360	23347	\N	0	\N	\N	2016-05-04 15:26:07.082024	2016-05-04 15:26:07.082024	\N
361	23396	\N	0	\N	\N	2016-05-04 15:27:30.234138	2016-05-04 15:27:30.234138	\N
362	23395	\N	0	\N	\N	2016-05-04 15:30:48.423152	2016-05-04 15:30:48.423152	\N
363	23382	\N	0	\N	\N	2016-05-04 15:33:30.401151	2016-05-04 15:33:30.401151	\N
364	22906	\N	0	\N	\N	2016-05-04 15:35:05.917479	2016-05-04 15:35:05.917479	\N
365	23410	\N	0	\N	\N	2016-05-04 15:36:58.879117	2016-05-04 15:36:58.879117	\N
\.


--
-- Data for Name: expedientes_despachos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY expedientes_despachos (id, expediente_id, despacho_id) FROM stdin;
1	1	8
2	2	8
3	3	9
4	4	9
6	6	10
7	7	14
8	8	15
9	9	15
10	10	3556
11	11	3557
12	12	3558
13	13	3559
14	14	3562
15	15	3563
16	16	3564
17	17	3565
18	18	3566
19	19	3567
20	20	3568
21	21	3597
22	22	3598
23	23	3604
24	24	3605
25	25	3606
26	26	3607
27	27	3612
28	28	3613
29	29	3614
30	30	3615
31	31	3616
32	32	3617
33	33	3636
34	34	3639
35	35	3641
36	36	3642
37	37	3643
38	38	3644
39	39	3645
40	40	3659
41	41	3661
42	42	3662
43	43	3663
44	44	3664
45	45	3666
46	46	3667
47	47	3668
48	48	3671
49	49	3675
50	50	3676
51	51	3699
52	52	3701
53	53	3702
54	54	3703
55	55	3704
56	56	3705
57	57	3706
58	58	3707
59	59	3725
60	60	3727
61	61	3728
62	62	3729
63	63	3730
64	64	3731
65	65	3733
66	66	3734
67	67	3736
68	68	3737
69	69	3738
70	70	3740
71	71	3742
72	72	3743
73	73	3765
74	74	3766
75	75	3767
76	76	3768
77	77	3769
78	78	3770
79	79	3771
80	80	3772
81	81	3774
82	82	3775
83	83	3782
84	84	3783
85	85	3784
86	86	3789
87	87	3822
88	88	3835
89	89	3836
90	90	3838
91	91	3839
92	92	3840
93	93	3841
94	94	3843
95	95	3844
96	96	3845
97	97	3846
98	98	3847
99	99	3835
100	100	3868
101	101	3869
102	102	3870
103	103	3871
104	104	3872
105	105	3873
106	106	3874
107	107	3876
108	108	3878
109	109	3880
110	110	3881
111	111	3908
112	112	3916
113	113	3917
114	114	3918
115	115	3919
116	116	3920
117	117	3921
118	118	3922
119	119	3923
120	120	3924
121	121	3925
122	122	3926
123	123	3927
124	124	3928
125	125	3929
126	126	3930
127	127	3931
128	128	3969
129	129	3970
130	130	3971
131	131	3972
132	132	3975
133	133	3981
134	134	3982
135	135	3983
136	136	3984
137	137	3985
138	138	3986
139	139	3987
140	140	4015
141	141	4024
142	142	4025
143	143	4026
144	144	4027
145	145	4028
146	146	4029
147	147	4030
148	148	4032
149	149	4033
150	150	4034
151	151	4035
152	152	4063
153	153	4065
154	154	4066
155	155	4067
156	156	4068
157	157	4069
158	158	4071
159	159	4074
160	160	4075
161	161	4076
162	162	4077
163	163	4078
164	164	4079
165	165	4080
166	166	4081
167	167	4082
168	168	4083
169	169	4084
170	170	4085
171	171	4086
172	172	4087
173	173	4107
174	174	4114
175	175	4115
176	176	4118
177	177	4119
178	178	4119
179	179	4120
180	180	4121
181	181	4122
182	182	4123
183	183	4124
184	184	4125
185	185	4126
186	186	4127
187	187	4128
188	188	4129
189	189	4130
190	190	4131
191	191	4133
192	192	4134
193	193	4135
194	194	4137
195	195	4139
196	196	4140
197	197	4141
198	198	4142
199	199	4143
200	200	4143
201	201	4144
202	202	4145
203	203	4146
204	204	4147
205	205	4148
206	206	4149
207	207	4151
208	208	4152
209	209	4153
210	210	4154
211	211	4155
212	212	4158
213	213	4165
214	214	4166
215	215	4167
216	216	4168
217	217	4169
218	218	4170
219	219	4171
220	220	4172
221	221	4173
222	222	4174
223	223	4175
224	224	4185
225	225	4186
226	226	4189
227	227	4191
228	228	4192
229	229	4193
230	230	4195
231	231	4196
232	232	4206
233	233	4207
234	234	4208
235	235	4209
236	236	4210
237	237	4212
238	238	4213
239	239	4214
240	240	4215
241	241	4216
242	242	4217
243	243	4218
244	244	4219
245	245	4220
246	246	4221
247	247	4222
248	248	4420
249	249	4421
250	250	4422
251	251	4430
252	252	4431
253	253	4431
254	254	4440
255	255	4441
256	256	4442
257	257	4445
258	258	4446
259	259	4447
260	260	4448
261	261	4449
262	262	4450
263	263	4451
264	264	4452
265	265	4453
266	266	4454
267	267	4455
268	268	4456
269	269	4458
270	270	4502
271	271	4503
272	272	4504
273	273	4505
274	274	4513
275	275	4515
276	276	4517
277	277	4549
278	278	4553
279	279	4586
280	280	4587
281	281	4588
282	282	4589
283	283	4590
284	284	4591
285	285	4592
286	286	4593
287	287	4594
288	288	4595
289	289	4596
290	290	4597
291	291	4599
292	292	4601
293	293	4602
294	294	4603
295	295	4605
296	296	4644
297	297	4645
298	298	4646
299	299	4652
300	300	4653
301	301	4654
302	302	4655
303	303	4656
304	304	4657
305	305	4658
306	306	4659
307	307	4660
308	308	4661
309	309	4662
310	310	4664
311	311	4665
312	312	4666
313	313	4667
314	314	4668
316	316	4696
317	317	4697
318	318	4698
319	319	4699
320	320	4702
321	321	4703
322	322	4705
323	323	4706
324	324	4707
325	325	4708
326	326	4709
327	327	4712
328	328	4713
329	329	4714
330	330	4715
331	331	4716
332	332	4771
333	333	4773
334	334	4775
335	335	4776
336	336	4777
337	337	4774
338	338	4786
339	339	4787
340	340	4788
341	341	4790
342	342	4791
343	343	4792
344	344	4820
345	345	4821
346	346	4822
347	347	4823
348	348	4824
349	349	4825
350	350	4826
351	351	4827
352	352	4851
353	353	4857
354	354	4858
355	355	4859
356	356	4860
357	357	4861
358	358	4862
359	359	4864
360	360	4865
361	361	4866
362	362	4867
363	363	4868
364	364	4869
365	365	4870
\.


--
-- Name: expedientes_despachos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('expedientes_despachos_id_seq', 365, true);


--
-- Name: expedientes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('expedientes_id_seq', 365, true);


--
-- Data for Name: expedientes_tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY expedientes_tags (expediente_id, tag_id) FROM stdin;
\.


--
-- Data for Name: libros; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY libros (id, nombre, digesto_id, created_at, updated_at, orden) FROM stdin;
\.


--
-- Name: libros_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('libros_id_seq', 1, false);


--
-- Data for Name: modifica_relationships; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY modifica_relationships (id, modifica_id, me_modifica_id, desde, hasta, dia, mes, anio, dia_habil, observacion, created_at, updated_at, type, tipo, tipo_relacion) FROM stdin;
\.


--
-- Name: modifica_relationships_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('modifica_relationships_id_seq', 1, false);


--
-- Data for Name: normas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY normas (id, letra, nro, bis, sumario, observaciones, sancion, entrada_vigencia, finaliza_vigencia, plazo_dia, plazo_mes, plazo_anio, organismo_origen, type, created_at, updated_at, expediente_id, tipo, descripcion, anio, indice) FROM stdin;
\.


--
-- Name: normas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('normas_id_seq', 1, false);


--
-- Data for Name: normas_otra_publicacions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY normas_otra_publicacions (norma_id, otra_publicacion_id) FROM stdin;
\.


--
-- Data for Name: normas_tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY normas_tags (norma_id, tag_id) FROM stdin;
\.


--
-- Data for Name: orden_del_dia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY orden_del_dia (id, nro, fecha, observacion, sesion_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: orden_del_dia_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('orden_del_dia_id_seq', 1, false);


--
-- Data for Name: orden_del_dia_seccions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY orden_del_dia_seccions (orden_del_dia_id, seccion_id) FROM stdin;
\.


--
-- Data for Name: otra_publicacions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY otra_publicacions (id, nombre, observacion, publicacion, created_at, updated_at) FROM stdin;
\.


--
-- Name: otra_publicacions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('otra_publicacions_id_seq', 1, false);


--
-- Data for Name: periodos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY periodos (id, desde, hasta, created_at, updated_at) FROM stdin;
\.


--
-- Name: periodos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('periodos_id_seq', 1, false);


--
-- Data for Name: periodos_personas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY periodos_personas (concejal_id, periodo_id) FROM stdin;
\.


--
-- Data for Name: personas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY personas (id, nombre, apellido, tipo_doc, nro_doc, telefono, email, domicilio, cargo, bloque_id, created_at, updated_at, type, cuit) FROM stdin;
1	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-22 12:46:59.859438	2015-09-22 12:46:59.859438	Concejal	\N
2	Yawni, Viviana Andrea	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-22 12:50:03.462151	2015-09-22 12:50:03.462151	Concejal	\N
3	Miranda, Claudio	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-22 12:50:42.02248	2015-09-22 12:50:42.02248	Concejal	\N
4	Cabral, Maria del Carmen	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-22 12:51:13.471518	2015-09-22 12:51:13.471518	Concejal	\N
5	Carranza, Martin	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-22 12:51:35.437672	2015-09-22 12:51:35.437672	Concejal	\N
6	Oviedo, Adriana Miriam	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-22 12:52:09.123316	2015-09-22 12:52:09.123316	Concejal	\N
7	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-22 12:53:01.595014	2015-09-22 12:53:01.595014	Concejal	\N
8	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-22 12:53:35.908812	2015-09-22 12:53:35.908812	Concejal	\N
9	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-22 12:54:05.083576	2015-09-22 12:54:05.083576	Concejal	\N
10	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-22 12:54:56.988523	2015-09-22 12:54:56.988523	Concejal	\N
11	Llamosas, Juan Manuel	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-22 12:55:40.89966	2015-09-22 12:55:40.89966	Concejal	\N
12	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-22 12:56:20.982903	2015-09-22 12:56:20.982903	Concejal	\N
13	Natali, Guillermo Luis	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-22 12:57:03.051665	2015-09-22 12:57:03.051665	Concejal	\N
15	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-22 13:01:07.520939	2015-09-22 13:01:07.520939	Concejal	\N
16	Dova, Mauricio	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-22 13:01:22.915178	2015-09-22 13:01:22.915178	Concejal	\N
17	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-22 13:03:36.421686	2015-09-22 13:03:36.421686	Concejal	\N
18	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-22 13:03:50.371369	2015-09-22 13:03:50.371369	Concejal	\N
19	David, Samantha	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-22 13:04:08.529796	2015-09-22 13:04:08.529796	Concejal	\N
20	Scoppa, Eduardo Juan	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-22 13:04:37.524624	2015-09-22 13:04:37.524624	Concejal	\N
21	Da Costa, Osvaldo	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-22 13:04:55.201829	2015-09-22 13:04:55.201829	Concejal	\N
22	Scoppa, Eduardo Juan	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-22 13:44:53.72055	2015-09-22 13:44:53.72055	Concejal	\N
23	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-22 13:44:53.729821	2015-09-22 13:44:53.729821	Concejal	\N
24	Cabral, Maria del Carmen	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-22 13:44:53.73485	2015-09-22 13:44:53.73485	Concejal	\N
25	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-22 13:44:53.73958	2015-09-22 13:44:53.73958	Concejal	\N
26	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-22 13:47:09.40623	2015-09-22 13:47:09.40623	Concejal	\N
27	Cabral, Maria del Carmen	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-22 13:47:09.41177	2015-09-22 13:47:09.41177	Concejal	\N
28	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-22 13:47:09.416809	2015-09-22 13:47:09.416809	Concejal	\N
29	Yawni, Viviana Andrea	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-22 13:47:09.421719	2015-09-22 13:47:09.421719	Concejal	\N
30	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-24 12:44:53.528327	2015-09-24 12:44:53.528327	Concejal	\N
31	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-24 12:44:53.538042	2015-09-24 12:44:53.538042	Concejal	\N
32	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-24 12:44:53.543503	2015-09-24 12:44:53.543503	Concejal	\N
33	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-24 12:44:53.548744	2015-09-24 12:44:53.548744	Concejal	\N
34	Dova, Mauricio	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-24 12:44:53.553896	2015-09-24 12:44:53.553896	Concejal	\N
35	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-24 12:44:53.559039	2015-09-24 12:44:53.559039	Concejal	\N
36	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-24 13:32:37.759203	2015-09-24 13:32:37.759203	Concejal	\N
37	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-24 13:32:37.764322	2015-09-24 13:32:37.764322	Concejal	\N
38	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-24 13:32:37.769126	2015-09-24 13:32:37.769126	Concejal	\N
39	David, Samantha	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-24 13:32:37.77364	2015-09-24 13:32:37.77364	Concejal	\N
40	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-24 13:32:37.778075	2015-09-24 13:32:37.778075	Concejal	\N
41	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-24 13:32:37.782479	2015-09-24 13:32:37.782479	Concejal	\N
42	Dova, Mauricio	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-24 13:32:37.786788	2015-09-24 13:32:37.786788	Concejal	\N
43	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-24 13:32:37.790988	2015-09-24 13:32:37.790988	Concejal	\N
44	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-24 13:53:14.469262	2015-09-24 13:53:14.469262	Concejal	\N
45	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-24 13:53:14.474633	2015-09-24 13:53:14.474633	Concejal	\N
46	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-24 13:53:14.479403	2015-09-24 13:53:14.479403	Concejal	\N
47	David, Samantha	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-24 13:53:14.484127	2015-09-24 13:53:14.484127	Concejal	\N
48	Cabral, Maria del Carmen	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-24 13:53:14.488773	2015-09-24 13:53:14.488773	Concejal	\N
49	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-24 13:53:14.493405	2015-09-24 13:53:14.493405	Concejal	\N
50	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-24 13:53:14.497981	2015-09-24 13:53:14.497981	Concejal	\N
51	Cabral, Maria del Carmen	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-24 14:13:03.91726	2015-09-24 14:13:03.91726	Concejal	\N
52	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-24 14:13:03.922993	2015-09-24 14:13:03.922993	Concejal	\N
53	David, Samantha	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-24 14:13:03.927877	2015-09-24 14:13:03.927877	Concejal	\N
54	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-24 14:42:21.980575	2015-09-24 14:42:21.980575	Concejal	\N
55	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-24 14:42:21.985666	2015-09-24 14:42:21.985666	Concejal	\N
56	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-24 14:42:21.990322	2015-09-24 14:42:21.990322	Concejal	\N
57	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-24 14:42:21.994965	2015-09-24 14:42:21.994965	Concejal	\N
58	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-24 14:42:21.999429	2015-09-24 14:42:21.999429	Concejal	\N
59	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-24 14:42:22.003833	2015-09-24 14:42:22.003833	Concejal	\N
60	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-24 14:42:22.008038	2015-09-24 14:42:22.008038	Concejal	\N
61	David, Samantha	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-24 14:42:22.012236	2015-09-24 14:42:22.012236	Concejal	\N
62	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-24 14:42:22.016429	2015-09-24 14:42:22.016429	Concejal	\N
63	Da Costa, Osvaldo	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-24 14:42:22.020566	2015-09-24 14:42:22.020566	Concejal	\N
64	Carranza, Martin	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-24 14:48:56.926853	2015-09-24 14:48:56.926853	Concejal	\N
65	Cabral, Maria del Carmen	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-24 14:48:56.936293	2015-09-24 14:48:56.936293	Concejal	\N
66	Da Costa, Osvaldo	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-24 14:48:56.940951	2015-09-24 14:48:56.940951	Concejal	\N
67	David, Samantha	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-24 14:48:56.945486	2015-09-24 14:48:56.945486	Concejal	\N
68	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-24 14:48:56.950029	2015-09-24 14:48:56.950029	Concejal	\N
69	Scoppa, Eduardo Juan	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-24 14:48:56.954541	2015-09-24 14:48:56.954541	Concejal	\N
70	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-24 14:53:40.496429	2015-09-24 14:53:40.496429	Concejal	\N
71	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-24 14:53:40.502014	2015-09-24 14:53:40.502014	Concejal	\N
72	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-24 14:53:40.506887	2015-09-24 14:53:40.506887	Concejal	\N
73	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-24 14:53:40.511774	2015-09-24 14:53:40.511774	Concejal	\N
74	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-24 14:55:22.309778	2015-09-24 14:55:22.309778	Concejal	\N
75	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-24 14:55:22.331417	2015-09-24 14:55:22.331417	Concejal	\N
76	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-24 14:55:22.335263	2015-09-24 14:55:22.335263	Concejal	\N
77	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-24 14:55:22.33895	2015-09-24 14:55:22.33895	Concejal	\N
78	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-29 15:26:50.773884	2015-09-29 15:26:50.773884	Concejal	\N
79	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-29 15:26:50.779419	2015-09-29 15:26:50.779419	Concejal	\N
80	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-29 15:26:50.784329	2015-09-29 15:26:50.784329	Concejal	\N
81	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-29 15:26:50.789233	2015-09-29 15:26:50.789233	Concejal	\N
82	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-29 15:44:46.351266	2015-09-29 15:44:46.351266	Concejal	\N
83	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-29 15:44:46.356447	2015-09-29 15:44:46.356447	Concejal	\N
84	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-29 15:44:46.361105	2015-09-29 15:44:46.361105	Concejal	\N
85	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-29 15:44:46.365747	2015-09-29 15:44:46.365747	Concejal	\N
86	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-29 15:44:46.370321	2015-09-29 15:44:46.370321	Concejal	\N
87	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-29 15:44:46.375123	2015-09-29 15:44:46.375123	Concejal	\N
88	Oviedo, Adriana Miriam	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-29 15:44:46.379684	2015-09-29 15:44:46.379684	Concejal	\N
89	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-30 15:26:54.417756	2015-09-30 15:26:54.417756	Concejal	\N
90	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-30 15:26:54.426478	2015-09-30 15:26:54.426478	Concejal	\N
91	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-30 15:26:54.431185	2015-09-30 15:26:54.431185	Concejal	\N
92	Dova, Mauricio	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-30 15:26:54.435747	2015-09-30 15:26:54.435747	Concejal	\N
93	Yawni, Viviana Andrea	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-30 15:30:00.644145	2015-09-30 15:30:00.644145	Concejal	\N
94	Cabral, Maria del Carmen	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-30 15:30:00.649401	2015-09-30 15:30:00.649401	Concejal	\N
95	Oviedo, Adriana Miriam	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-30 15:30:00.654272	2015-09-30 15:30:00.654272	Concejal	\N
96	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-30 15:30:00.65904	2015-09-30 15:30:00.65904	Concejal	\N
97	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-30 15:53:11.557777	2015-09-30 15:53:11.557777	Concejal	\N
98	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-30 15:53:11.562769	2015-09-30 15:53:11.562769	Concejal	\N
99	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-30 15:53:11.567207	2015-09-30 15:53:11.567207	Concejal	\N
100	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-30 15:53:11.571586	2015-09-30 15:53:11.571586	Concejal	\N
101	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-30 15:53:11.575939	2015-09-30 15:53:11.575939	Concejal	\N
102	David, Samantha	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-30 15:53:11.58023	2015-09-30 15:53:11.58023	Concejal	\N
103	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-30 15:53:11.58452	2015-09-30 15:53:11.58452	Concejal	\N
104	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-30 15:53:11.588781	2015-09-30 15:53:11.588781	Concejal	\N
105	Oviedo, Adriana Miriam	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-30 15:53:11.593022	2015-09-30 15:53:11.593022	Concejal	\N
106	Oviedo, Adriana Miriam	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-30 16:03:20.118812	2015-09-30 16:03:20.118812	Concejal	\N
107	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-30 16:03:20.12443	2015-09-30 16:03:20.12443	Concejal	\N
108	Yawni, Viviana Andrea	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-30 16:03:20.129295	2015-09-30 16:03:20.129295	Concejal	\N
109	Cabral, Maria del Carmen	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-30 16:03:20.134072	2015-09-30 16:03:20.134072	Concejal	\N
110	David, Samantha	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-30 16:03:20.138756	2015-09-30 16:03:20.138756	Concejal	\N
111	Oviedo, Adriana Miriam	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-30 16:07:45.488922	2015-09-30 16:07:45.488922	Concejal	\N
112	Yawni, Viviana Andrea	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-30 16:07:45.494018	2015-09-30 16:07:45.494018	Concejal	\N
113	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-30 16:07:45.498642	2015-09-30 16:07:45.498642	Concejal	\N
114	Cabral, Maria del Carmen	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-30 16:07:45.503214	2015-09-30 16:07:45.503214	Concejal	\N
115	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-30 16:13:57.144907	2015-09-30 16:13:57.144907	Concejal	\N
116	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-30 16:13:57.150274	2015-09-30 16:13:57.150274	Concejal	\N
117	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-30 16:13:57.155046	2015-09-30 16:13:57.155046	Concejal	\N
118	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-30 16:13:57.159777	2015-09-30 16:13:57.159777	Concejal	\N
119	Oviedo, Adriana Miriam	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-30 16:13:57.1643	2015-09-30 16:13:57.1643	Concejal	\N
120	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-30 16:13:57.168818	2015-09-30 16:13:57.168818	Concejal	\N
121	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-01 14:33:46.524612	2015-10-01 14:33:46.524612	Concejal	\N
122	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-01 14:33:46.529738	2015-10-01 14:33:46.529738	Concejal	\N
123	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-01 14:33:46.534354	2015-10-01 14:33:46.534354	Concejal	\N
124	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-01 14:33:46.538866	2015-10-01 14:33:46.538866	Concejal	\N
125	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-01 14:33:46.54321	2015-10-01 14:33:46.54321	Concejal	\N
126	David, Samantha	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-01 14:33:46.547567	2015-10-01 14:33:46.547567	Concejal	\N
127	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-01 14:33:46.551905	2015-10-01 14:33:46.551905	Concejal	\N
128	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-01 14:33:46.556222	2015-10-01 14:33:46.556222	Concejal	\N
129	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-01 14:33:46.560533	2015-10-01 14:33:46.560533	Concejal	\N
130	Oviedo, Adriana Miriam	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-01 14:33:46.5648	2015-10-01 14:33:46.5648	Concejal	\N
131	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-01 15:17:37.350039	2015-10-01 15:17:37.350039	Concejal	\N
132	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-01 15:17:37.355197	2015-10-01 15:17:37.355197	Concejal	\N
133	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-01 15:17:37.359768	2015-10-01 15:17:37.359768	Concejal	\N
134	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-01 15:17:37.364258	2015-10-01 15:17:37.364258	Concejal	\N
135	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-01 15:17:37.368685	2015-10-01 15:17:37.368685	Concejal	\N
136	David, Samantha	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-01 15:17:37.373073	2015-10-01 15:17:37.373073	Concejal	\N
137	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-01 15:17:37.377434	2015-10-01 15:17:37.377434	Concejal	\N
138	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-01 15:17:37.38183	2015-10-01 15:17:37.38183	Concejal	\N
139	Oviedo, Adriana Miriam	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-01 15:17:37.386183	2015-10-01 15:17:37.386183	Concejal	\N
140	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-01 15:35:53.764333	2015-10-01 15:35:53.764333	Concejal	\N
141	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-01 15:35:53.769491	2015-10-01 15:35:53.769491	Concejal	\N
142	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-01 15:35:53.774188	2015-10-01 15:35:53.774188	Concejal	\N
143	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-01 15:35:53.778813	2015-10-01 15:35:53.778813	Concejal	\N
144	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-01 15:35:53.783238	2015-10-01 15:35:53.783238	Concejal	\N
145	David, Samantha	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-01 15:35:53.787593	2015-10-01 15:35:53.787593	Concejal	\N
146	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-01 15:35:53.791943	2015-10-01 15:35:53.791943	Concejal	\N
147	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-01 15:35:53.796176	2015-10-01 15:35:53.796176	Concejal	\N
148	Oviedo, Adriana Miriam	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-01 15:35:53.800333	2015-10-01 15:35:53.800333	Concejal	\N
149	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-01 15:49:37.981554	2015-10-01 15:49:37.981554	Concejal	\N
150	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-01 15:49:37.986833	2015-10-01 15:49:37.986833	Concejal	\N
151	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-01 15:49:37.991442	2015-10-01 15:49:37.991442	Concejal	\N
152	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-01 15:49:37.996074	2015-10-01 15:49:37.996074	Concejal	\N
153	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-01 15:49:38.000693	2015-10-01 15:49:38.000693	Concejal	\N
154	David, Samantha	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-01 15:49:38.005234	2015-10-01 15:49:38.005234	Concejal	\N
155	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-01 15:49:38.009786	2015-10-01 15:49:38.009786	Concejal	\N
156	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-01 15:49:38.014309	2015-10-01 15:49:38.014309	Concejal	\N
157	Oviedo, Adriana Miriam	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-01 15:49:38.018876	2015-10-01 15:49:38.018876	Concejal	\N
158	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-06 14:42:56.706797	2015-10-06 14:42:56.706797	Concejal	\N
159	Da Costa, Osvaldo	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-06 14:42:56.715759	2015-10-06 14:42:56.715759	Concejal	\N
160	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-06 14:42:56.72064	2015-10-06 14:42:56.72064	Concejal	\N
161	Dova, Mauricio	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-06 14:42:56.725264	2015-10-06 14:42:56.725264	Concejal	\N
162	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-06 16:08:28.54067	2015-10-06 16:08:28.54067	Concejal	\N
163	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-06 16:08:28.546045	2015-10-06 16:08:28.546045	Concejal	\N
164	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-06 16:08:28.550858	2015-10-06 16:08:28.550858	Concejal	\N
165	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-06 16:08:28.555489	2015-10-06 16:08:28.555489	Concejal	\N
166	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-06 16:08:28.56008	2015-10-06 16:08:28.56008	Concejal	\N
167	David, Samantha	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-06 16:08:28.564635	2015-10-06 16:08:28.564635	Concejal	\N
168	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-06 16:12:41.79893	2015-10-06 16:12:41.79893	Concejal	\N
169	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-06 16:12:41.804471	2015-10-06 16:12:41.804471	Concejal	\N
170	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-06 16:12:41.809219	2015-10-06 16:12:41.809219	Concejal	\N
171	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-06 16:12:41.8139	2015-10-06 16:12:41.8139	Concejal	\N
172	David, Samantha	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-06 16:12:41.818541	2015-10-06 16:12:41.818541	Concejal	\N
173	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-06 16:12:41.822994	2015-10-06 16:12:41.822994	Concejal	\N
174	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-06 16:15:12.149573	2015-10-06 16:15:12.149573	Concejal	\N
175	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-06 16:15:12.154763	2015-10-06 16:15:12.154763	Concejal	\N
176	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-06 16:15:12.159481	2015-10-06 16:15:12.159481	Concejal	\N
177	David, Samantha	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-06 16:15:12.164046	2015-10-06 16:15:12.164046	Concejal	\N
178	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-06 16:15:12.168625	2015-10-06 16:15:12.168625	Concejal	\N
179	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-06 16:21:00.83121	2015-10-06 16:21:00.83121	Concejal	\N
180	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-06 16:21:00.83656	2015-10-06 16:21:00.83656	Concejal	\N
181	David, Samantha	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-06 16:21:00.841421	2015-10-06 16:21:00.841421	Concejal	\N
182	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-06 16:21:00.846022	2015-10-06 16:21:00.846022	Concejal	\N
183	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-06 16:21:00.850595	2015-10-06 16:21:00.850595	Concejal	\N
184	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-06 16:24:05.435115	2015-10-06 16:24:05.435115	Concejal	\N
185	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-06 16:24:05.440235	2015-10-06 16:24:05.440235	Concejal	\N
186	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-06 16:24:05.445046	2015-10-06 16:24:05.445046	Concejal	\N
187	David, Samantha	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-06 16:24:05.449557	2015-10-06 16:24:05.449557	Concejal	\N
188	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-06 16:24:05.453999	2015-10-06 16:24:05.453999	Concejal	\N
189	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-07 11:21:44.059304	2015-10-07 11:21:44.059304	Concejal	\N
190	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-07 11:21:44.064761	2015-10-07 11:21:44.064761	Concejal	\N
191	David, Samantha	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-07 11:21:44.069598	2015-10-07 11:21:44.069598	Concejal	\N
192	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-07 11:21:44.074256	2015-10-07 11:21:44.074256	Concejal	\N
193	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-07 11:21:44.078944	2015-10-07 11:21:44.078944	Concejal	\N
194	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-07 15:35:14.42311	2015-10-07 15:35:14.42311	Concejal	\N
195	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-07 15:35:14.428609	2015-10-07 15:35:14.428609	Concejal	\N
196	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-07 15:35:14.433309	2015-10-07 15:35:14.433309	Concejal	\N
197	Oviedo, Adriana Miriam	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-07 15:35:14.437923	2015-10-07 15:35:14.437923	Concejal	\N
198	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-07 15:35:14.442522	2015-10-07 15:35:14.442522	Concejal	\N
199	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-07 15:35:14.447078	2015-10-07 15:35:14.447078	Concejal	\N
200	David, Samantha	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-07 15:35:14.451717	2015-10-07 15:35:14.451717	Concejal	\N
201	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-07 15:35:14.456245	2015-10-07 15:35:14.456245	Concejal	\N
202	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-07 15:35:14.460783	2015-10-07 15:35:14.460783	Concejal	\N
203	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-07 15:38:40.254584	2015-10-07 15:38:40.254584	Concejal	\N
204	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-07 15:38:40.263931	2015-10-07 15:38:40.263931	Concejal	\N
205	Oviedo, Adriana Miriam	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-07 15:38:40.268938	2015-10-07 15:38:40.268938	Concejal	\N
206	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-07 15:38:40.273749	2015-10-07 15:38:40.273749	Concejal	\N
207	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-07 15:38:40.278443	2015-10-07 15:38:40.278443	Concejal	\N
208	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-07 15:59:19.873419	2015-10-07 15:59:19.873419	Concejal	\N
209	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-07 15:59:19.878589	2015-10-07 15:59:19.878589	Concejal	\N
210	Oviedo, Adriana Miriam	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-07 15:59:19.883166	2015-10-07 15:59:19.883166	Concejal	\N
211	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-07 15:59:19.887808	2015-10-07 15:59:19.887808	Concejal	\N
212	David, Samantha	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-07 15:59:19.892341	2015-10-07 15:59:19.892341	Concejal	\N
213	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-07 15:59:19.896837	2015-10-07 15:59:19.896837	Concejal	\N
214	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-07 15:59:19.901431	2015-10-07 15:59:19.901431	Concejal	\N
215	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-07 15:59:19.905977	2015-10-07 15:59:19.905977	Concejal	\N
216	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-07 15:59:19.910419	2015-10-07 15:59:19.910419	Concejal	\N
217	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-07 16:15:40.172337	2015-10-07 16:15:40.172337	Concejal	\N
218	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-07 16:15:40.177573	2015-10-07 16:15:40.177573	Concejal	\N
219	Oviedo, Adriana Miriam	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-07 16:15:40.182109	2015-10-07 16:15:40.182109	Concejal	\N
220	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-07 16:15:40.186658	2015-10-07 16:15:40.186658	Concejal	\N
221	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-07 16:15:40.191056	2015-10-07 16:15:40.191056	Concejal	\N
222	David, Samantha	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-07 16:15:40.195397	2015-10-07 16:15:40.195397	Concejal	\N
223	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-07 16:15:40.199684	2015-10-07 16:15:40.199684	Concejal	\N
224	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-07 16:15:40.203872	2015-10-07 16:15:40.203872	Concejal	\N
225	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-07 16:15:40.208067	2015-10-07 16:15:40.208067	Concejal	\N
226	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-08 10:37:22.112726	2015-10-08 10:37:22.112726	Concejal	\N
227	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-08 10:37:22.11815	2015-10-08 10:37:22.11815	Concejal	\N
228	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-08 10:37:22.12298	2015-10-08 10:37:22.12298	Concejal	\N
229	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-08 10:37:22.127858	2015-10-08 10:37:22.127858	Concejal	\N
230	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-08 10:40:24.286028	2015-10-08 10:40:24.286028	Concejal	\N
231	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-08 10:40:24.29127	2015-10-08 10:40:24.29127	Concejal	\N
232	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-08 10:40:24.296019	2015-10-08 10:40:24.296019	Concejal	\N
233	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-08 10:40:24.300711	2015-10-08 10:40:24.300711	Concejal	\N
234	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-08 11:04:05.64945	2015-10-08 11:04:05.64945	Concejal	\N
235	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-08 11:04:05.654534	2015-10-08 11:04:05.654534	Concejal	\N
236	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-08 11:04:05.659086	2015-10-08 11:04:05.659086	Concejal	\N
237	Oviedo, Adriana Miriam	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-08 11:04:05.663602	2015-10-08 11:04:05.663602	Concejal	\N
238	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-08 11:04:05.667978	2015-10-08 11:04:05.667978	Concejal	\N
239	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-08 11:04:05.672417	2015-10-08 11:04:05.672417	Concejal	\N
240	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-08 11:04:05.676857	2015-10-08 11:04:05.676857	Concejal	\N
241	David, Samantha	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-08 11:04:05.681261	2015-10-08 11:04:05.681261	Concejal	\N
242	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-08 11:04:05.685572	2015-10-08 11:04:05.685572	Concejal	\N
243	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-08 11:09:39.022328	2015-10-08 11:09:39.022328	Concejal	\N
244	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-08 11:09:39.027874	2015-10-08 11:09:39.027874	Concejal	\N
245	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-08 11:09:39.032502	2015-10-08 11:09:39.032502	Concejal	\N
246	Oviedo, Adriana Miriam	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-08 11:09:39.03713	2015-10-08 11:09:39.03713	Concejal	\N
247	David, Samantha	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-08 11:09:39.04167	2015-10-08 11:09:39.04167	Concejal	\N
248	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-08 11:09:39.046233	2015-10-08 11:09:39.046233	Concejal	\N
249	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-08 11:09:39.05103	2015-10-08 11:09:39.05103	Concejal	\N
250	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-08 11:09:39.056192	2015-10-08 11:09:39.056192	Concejal	\N
251	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-08 11:09:39.061391	2015-10-08 11:09:39.061391	Concejal	\N
252	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-08 11:13:35.136623	2015-10-08 11:13:35.136623	Concejal	\N
253	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-08 11:13:35.142075	2015-10-08 11:13:35.142075	Concejal	\N
254	Oviedo, Adriana Miriam	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-08 11:13:35.14679	2015-10-08 11:13:35.14679	Concejal	\N
255	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-08 11:13:35.151312	2015-10-08 11:13:35.151312	Concejal	\N
256	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-08 11:13:35.155913	2015-10-08 11:13:35.155913	Concejal	\N
257	Cabral, Maria del Carmen	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-08 12:17:01.40023	2015-10-08 12:17:01.40023	Concejal	\N
258	David, Samantha	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-08 12:17:01.405744	2015-10-08 12:17:01.405744	Concejal	\N
259	Oviedo, Adriana Miriam	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-08 12:17:01.410604	2015-10-08 12:17:01.410604	Concejal	\N
260	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-08 12:17:01.415362	2015-10-08 12:17:01.415362	Concejal	\N
261	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-08 12:17:01.419953	2015-10-08 12:17:01.419953	Concejal	\N
262	Cabral, Maria del Carmen	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-08 12:50:14.594468	2015-10-08 12:50:14.594468	Concejal	\N
263	David, Samantha	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-08 12:50:14.600141	2015-10-08 12:50:14.600141	Concejal	\N
264	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-08 12:50:14.605016	2015-10-08 12:50:14.605016	Concejal	\N
265	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-08 12:50:14.609774	2015-10-08 12:50:14.609774	Concejal	\N
266	Oviedo, Adriana Miriam	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-08 12:50:14.614441	2015-10-08 12:50:14.614441	Concejal	\N
267	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-14 15:16:14.359644	2015-10-14 15:16:14.359644	Concejal	\N
268	Cabral, Maria del Carmen	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-14 15:16:14.36489	2015-10-14 15:16:14.36489	Concejal	\N
269	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-14 15:16:14.369468	2015-10-14 15:16:14.369468	Concejal	\N
270	Oviedo, Adriana Miriam	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-14 15:16:14.373815	2015-10-14 15:16:14.373815	Concejal	\N
271	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-14 15:16:14.378131	2015-10-14 15:16:14.378131	Concejal	\N
272	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-14 15:16:14.382355	2015-10-14 15:16:14.382355	Concejal	\N
273	Yawni, Viviana Andrea	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-14 15:16:14.386453	2015-10-14 15:16:14.386453	Concejal	\N
278	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-14 15:47:40.901863	2015-10-14 15:47:40.901863	Concejal	\N
279	Dova, Mauricio	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-14 15:47:40.907102	2015-10-14 15:47:40.907102	Concejal	\N
280	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-14 15:47:40.911811	2015-10-14 15:47:40.911811	Concejal	\N
281	Yawni, Viviana Andrea	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-14 15:47:40.916345	2015-10-14 15:47:40.916345	Concejal	\N
282	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-14 15:47:40.92076	2015-10-14 15:47:40.92076	Concejal	\N
283	David, Samantha	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-14 15:47:40.925094	2015-10-14 15:47:40.925094	Concejal	\N
284	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-14 15:47:40.929323	2015-10-14 15:47:40.929323	Concejal	\N
285	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-14 15:47:40.933533	2015-10-14 15:47:40.933533	Concejal	\N
291	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-14 15:55:38.468323	2015-10-14 15:55:38.468323	Concejal	\N
292	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-14 15:55:38.474074	2015-10-14 15:55:38.474074	Concejal	\N
293	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-14 15:55:38.478852	2015-10-14 15:55:38.478852	Concejal	\N
294	David, Samantha	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-14 15:55:38.483639	2015-10-14 15:55:38.483639	Concejal	\N
295	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-14 16:02:44.941921	2015-10-14 16:02:44.941921	Concejal	\N
296	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-14 16:02:44.947602	2015-10-14 16:02:44.947602	Concejal	\N
297	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-14 16:02:44.952369	2015-10-14 16:02:44.952369	Concejal	\N
298	David, Samantha	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-14 16:02:44.957108	2015-10-14 16:02:44.957108	Concejal	\N
299	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-14 16:08:17.639128	2015-10-14 16:08:17.639128	Concejal	\N
300	Cabral, Maria del Carmen	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-14 16:08:17.644295	2015-10-14 16:08:17.644295	Concejal	\N
301	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-14 16:08:17.648946	2015-10-14 16:08:17.648946	Concejal	\N
302	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-14 16:08:17.653538	2015-10-14 16:08:17.653538	Concejal	\N
303	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-14 16:08:17.658141	2015-10-14 16:08:17.658141	Concejal	\N
304	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-14 16:08:17.662794	2015-10-14 16:08:17.662794	Concejal	\N
312	Scoppa, Eduardo Juan	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-21 12:57:29.700332	2015-10-21 12:57:29.700332	Concejal	\N
313	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-21 12:57:29.70601	2015-10-21 12:57:29.70601	Concejal	\N
314	Carranza, Martin	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-21 12:57:29.7108	2015-10-21 12:57:29.7108	Concejal	\N
315	Oviedo, Adriana Miriam	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-21 12:57:29.715521	2015-10-21 12:57:29.715521	Concejal	\N
316	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-21 15:06:00.42224	2015-10-21 15:06:00.42224	Concejal	\N
317	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-21 15:06:00.427805	2015-10-22 13:20:01.304185	Concejal	\N
274	Oviedo, Adriana Miriam	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-14 15:42:17.138655	2015-10-14 15:42:17.138655	Concejal	\N
275	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-14 15:42:17.144472	2015-10-14 15:42:17.144472	Concejal	\N
276	Cabral, Maria del Carmen	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-14 15:42:17.149278	2015-10-14 15:42:17.149278	Concejal	\N
277	Yawni, Viviana Andrea	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-14 15:42:17.154073	2015-10-14 15:42:17.154073	Concejal	\N
286	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-14 15:52:02.475119	2015-10-14 15:52:02.475119	Concejal	\N
287	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-14 15:52:02.48046	2015-10-14 15:52:02.48046	Concejal	\N
288	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-14 15:52:02.485333	2015-10-14 15:52:02.485333	Concejal	\N
289	Dova, Mauricio	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-14 15:52:02.489882	2015-10-14 15:52:02.489882	Concejal	\N
290	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-14 15:52:02.494453	2015-10-14 15:52:02.494453	Concejal	\N
305	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-15 10:57:52.124144	2015-10-15 10:57:52.124144	Concejal	\N
306	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-15 10:57:52.129572	2015-10-15 10:57:52.129572	Concejal	\N
307	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-15 10:57:52.134297	2015-10-15 10:57:52.134297	Concejal	\N
308	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-15 10:57:52.138965	2015-10-15 10:57:52.138965	Concejal	\N
309	David, Samantha	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-15 10:57:52.143454	2015-10-15 10:57:52.143454	Concejal	\N
310	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-15 10:57:52.147954	2015-10-15 10:57:52.147954	Concejal	\N
311	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-15 10:57:52.152358	2015-10-15 10:57:52.152358	Concejal	\N
318	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-21 16:04:15.238768	2015-10-21 16:04:15.238768	Concejal	\N
319	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-21 16:04:15.24457	2015-10-21 16:04:15.24457	Concejal	\N
320	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-21 16:04:15.249393	2015-10-21 16:04:15.249393	Concejal	\N
321	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-21 16:04:15.254146	2015-10-21 16:04:15.254146	Concejal	\N
322	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-21 16:04:15.25888	2015-10-21 16:04:15.25888	Concejal	\N
323	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-21 16:09:01.672055	2015-10-21 16:09:01.672055	Concejal	\N
324	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-21 16:09:01.677959	2015-10-21 16:09:01.677959	Concejal	\N
325	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-21 16:09:01.682824	2015-10-21 16:09:01.682824	Concejal	\N
326	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-21 16:09:01.687658	2015-10-21 16:09:01.687658	Concejal	\N
327	Oviedo, Adriana Miriam	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-21 16:14:33.38273	2015-10-21 16:14:33.38273	Concejal	\N
328	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-21 16:14:33.387853	2015-10-21 16:14:33.387853	Concejal	\N
329	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-21 16:14:33.392555	2015-10-21 16:14:33.392555	Concejal	\N
330	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-21 16:14:33.396881	2015-10-21 16:14:33.396881	Concejal	\N
331	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-21 16:14:33.401197	2015-10-21 16:14:33.401197	Concejal	\N
332	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-21 16:14:33.40546	2015-10-21 16:14:33.40546	Concejal	\N
333	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-21 16:14:33.409787	2015-10-21 16:14:33.409787	Concejal	\N
334	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-21 16:14:33.414116	2015-10-21 16:14:33.414116	Concejal	\N
335	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-21 16:14:33.418451	2015-10-21 16:14:33.418451	Concejal	\N
336	David, Samantha	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-21 16:14:33.42278	2015-10-21 16:14:33.42278	Concejal	\N
337	Cabral, Maria del Carmen	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-22 10:56:29.219284	2015-10-22 10:56:29.219284	Concejal	\N
338	Oviedo, Adriana Miriam	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-22 10:56:29.224778	2015-10-22 10:56:29.224778	Concejal	\N
339	Yawni, Viviana Andrea	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-22 10:56:29.229659	2015-10-22 10:56:29.229659	Concejal	\N
340	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-22 10:56:29.234432	2015-10-22 10:56:29.234432	Concejal	\N
341	Cabral, Maria del Carmen	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-22 10:59:00.889332	2015-10-22 10:59:00.889332	Concejal	\N
342	Oviedo, Adriana Miriam	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-22 10:59:00.895136	2015-10-22 10:59:00.895136	Concejal	\N
343	Yawni, Viviana Andrea	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-22 10:59:00.899977	2015-10-22 10:59:00.899977	Concejal	\N
344	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-22 10:59:00.904769	2015-10-22 10:59:00.904769	Concejal	\N
345	Oviedo, Adriana Miriam	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-22 11:14:35.251287	2015-10-22 11:14:35.251287	Concejal	\N
346	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-22 11:14:35.256464	2015-10-22 11:14:35.256464	Concejal	\N
347	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-22 11:14:35.261011	2015-10-22 11:14:35.261011	Concejal	\N
348	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-22 11:14:35.265534	2015-10-22 11:14:35.265534	Concejal	\N
349	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-22 11:14:35.270045	2015-10-22 11:14:35.270045	Concejal	\N
350	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-22 11:14:35.274443	2015-10-22 11:14:35.274443	Concejal	\N
351	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-22 11:14:35.278684	2015-10-22 11:14:35.278684	Concejal	\N
352	David, Samantha	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-22 11:14:35.282872	2015-10-22 11:14:35.282872	Concejal	\N
353	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-22 11:14:35.28706	2015-10-22 11:14:35.28706	Concejal	\N
354	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-22 11:14:35.29137	2015-10-22 11:14:35.29137	Concejal	\N
355	Oviedo, Adriana Miriam	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-22 11:37:02.385637	2015-10-22 11:37:02.385637	Concejal	\N
356	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-22 11:37:02.390822	2015-10-22 11:37:02.390822	Concejal	\N
357	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-22 11:37:02.395397	2015-10-22 11:37:02.395397	Concejal	\N
358	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-22 11:37:02.399868	2015-10-22 11:37:02.399868	Concejal	\N
359	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-22 11:37:02.404221	2015-10-22 11:37:02.404221	Concejal	\N
360	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-22 11:37:02.408533	2015-10-22 11:37:02.408533	Concejal	\N
361	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-22 11:37:02.41284	2015-10-22 11:37:02.41284	Concejal	\N
362	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-22 11:37:02.417193	2015-10-22 11:37:02.417193	Concejal	\N
363	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-22 11:37:02.421355	2015-10-22 11:37:02.421355	Concejal	\N
364	David, Samantha	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-22 11:37:02.425632	2015-10-22 11:37:02.425632	Concejal	\N
365	Oviedo, Adriana Miriam	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-22 11:52:38.564212	2015-10-22 11:52:38.564212	Concejal	\N
366	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-22 11:52:38.569358	2015-10-22 11:52:38.569358	Concejal	\N
367	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-22 11:52:38.573881	2015-10-22 11:52:38.573881	Concejal	\N
368	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-22 11:52:38.578412	2015-10-22 11:52:38.578412	Concejal	\N
369	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-22 11:52:38.58289	2015-10-22 11:52:38.58289	Concejal	\N
370	David, Samantha	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-22 11:52:38.587244	2015-10-22 11:52:38.587244	Concejal	\N
371	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-22 11:52:38.591575	2015-10-22 11:52:38.591575	Concejal	\N
372	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-22 11:52:38.595858	2015-10-22 11:52:38.595858	Concejal	\N
373	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-22 11:52:38.600174	2015-10-22 11:52:38.600174	Concejal	\N
374	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-22 11:52:38.60462	2015-10-22 11:52:38.60462	Concejal	\N
375	Oviedo, Adriana Miriam	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-22 12:35:05.841503	2015-10-22 12:35:05.841503	Concejal	\N
376	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-22 12:35:05.846408	2015-10-22 12:35:05.846408	Concejal	\N
377	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-22 12:35:05.85075	2015-10-22 12:35:05.85075	Concejal	\N
378	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-22 12:35:05.854976	2015-10-22 12:35:05.854976	Concejal	\N
379	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-22 12:35:05.859121	2015-10-22 12:35:05.859121	Concejal	\N
380	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-22 12:35:05.863195	2015-10-22 12:35:05.863195	Concejal	\N
381	David, Samantha	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-22 12:35:05.867273	2015-10-22 12:35:05.867273	Concejal	\N
382	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-22 12:35:05.871358	2015-10-22 12:35:05.871358	Concejal	\N
383	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-22 12:35:05.875413	2015-10-22 12:35:05.875413	Concejal	\N
384	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-22 12:35:05.879408	2015-10-22 12:35:05.879408	Concejal	\N
385	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-22 12:50:19.472955	2015-10-22 12:50:19.472955	Concejal	\N
386	Oviedo, Adriana Miriam	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-22 12:50:19.478155	2015-10-22 12:50:19.478155	Concejal	\N
387	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-22 12:50:19.48282	2015-10-22 12:50:19.48282	Concejal	\N
388	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-22 12:50:19.487425	2015-10-22 12:50:19.487425	Concejal	\N
389	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-22 12:50:19.49207	2015-10-22 12:50:19.49207	Concejal	\N
390	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-22 12:50:19.496545	2015-10-22 12:50:19.496545	Concejal	\N
391	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-22 12:50:19.500964	2015-10-22 12:50:19.500964	Concejal	\N
392	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-22 12:50:19.505428	2015-10-22 12:50:19.505428	Concejal	\N
393	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-22 12:50:19.509808	2015-10-22 12:50:19.509808	Concejal	\N
394	David, Samantha	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-22 12:50:19.51418	2015-10-22 12:50:19.51418	Concejal	\N
398	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-23 10:50:25.374515	2015-10-23 10:50:25.374515	Concejal	\N
399	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-23 10:50:25.380047	2015-10-23 10:50:25.380047	Concejal	\N
400	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-23 10:50:25.384839	2015-10-23 10:50:25.384839	Concejal	\N
401	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-23 10:50:25.38964	2015-10-23 10:50:25.38964	Concejal	\N
402	Da Costa, Osvaldo	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-23 10:50:25.394393	2015-10-23 10:50:25.394393	Concejal	\N
395	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-22 13:20:01.306975	2015-10-22 13:20:01.306975	Concejal	\N
396	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-22 13:20:01.312511	2015-10-22 13:20:01.312511	Concejal	\N
397	Da Costa, Osvaldo	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-22 13:20:01.317519	2015-10-22 13:20:01.317519	Concejal	\N
403	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-23 10:54:34.921263	2015-10-23 10:54:34.921263	Concejal	\N
404	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-23 10:54:34.926738	2015-10-23 10:54:34.926738	Concejal	\N
405	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-23 10:54:34.931422	2015-10-23 10:54:34.931422	Concejal	\N
406	Da Costa, Osvaldo	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-23 10:54:34.936048	2015-10-23 10:54:34.936048	Concejal	\N
407	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-23 10:54:34.940514	2015-10-23 10:54:34.940514	Concejal	\N
408	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-28 14:32:41.054487	2015-10-28 14:32:41.054487	Concejal	\N
409	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-28 14:32:41.060354	2015-10-28 14:32:41.060354	Concejal	\N
410	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-28 14:32:41.065213	2015-10-28 14:32:41.065213	Concejal	\N
411	Da Costa, Osvaldo	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-28 14:32:41.069991	2015-10-28 14:32:41.069991	Concejal	\N
412	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-28 14:35:10.512632	2015-10-28 14:35:10.512632	Concejal	\N
413	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-28 14:35:10.518625	2015-10-28 14:35:10.518625	Concejal	\N
414	Da Costa, Osvaldo	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-28 14:35:10.52357	2015-10-28 14:35:10.52357	Concejal	\N
415	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-28 14:35:10.528307	2015-10-28 14:35:10.528307	Concejal	\N
416	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-28 14:39:49.558426	2015-10-28 14:39:49.558426	Concejal	\N
417	Oviedo, Adriana Miriam	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-28 14:39:49.563657	2015-10-28 14:39:49.563657	Concejal	\N
418	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-28 14:39:49.568423	2015-10-28 14:39:49.568423	Concejal	\N
419	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-28 14:39:49.572945	2015-10-28 14:39:49.572945	Concejal	\N
420	Cabral, Maria del Carmen	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-28 14:39:49.577416	2015-10-28 14:39:49.577416	Concejal	\N
421	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-28 14:39:49.581907	2015-10-28 14:39:49.581907	Concejal	\N
422	Yawni, Viviana Andrea	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-28 14:39:49.586373	2015-10-28 14:39:49.586373	Concejal	\N
423	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-28 14:44:16.341942	2015-10-28 14:44:16.341942	Concejal	\N
424	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-28 14:44:16.347314	2015-10-28 14:44:16.347314	Concejal	\N
425	Oviedo, Adriana Miriam	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-28 14:44:16.351982	2015-10-28 14:44:16.351982	Concejal	\N
426	Miranda, Claudio	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-28 14:44:16.356564	2015-10-28 14:44:16.356564	Concejal	\N
427	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-28 14:44:16.361101	2015-10-28 14:44:16.361101	Concejal	\N
428	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-28 14:44:16.365637	2015-10-28 14:44:16.365637	Concejal	\N
429	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-28 14:48:43.03505	2015-10-28 14:48:43.03505	Concejal	\N
430	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-28 14:48:43.04026	2015-10-28 14:48:43.04026	Concejal	\N
431	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-28 14:48:43.044845	2015-10-28 14:48:43.044845	Concejal	\N
432	Oviedo, Adriana Miriam	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-28 14:48:43.049404	2015-10-28 14:48:43.049404	Concejal	\N
433	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-28 14:48:43.053991	2015-10-28 14:48:43.053991	Concejal	\N
434	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-28 14:48:43.058433	2015-10-28 14:48:43.058433	Concejal	\N
435	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-28 14:48:43.062754	2015-10-28 14:48:43.062754	Concejal	\N
436	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-28 14:48:43.067012	2015-10-28 14:48:43.067012	Concejal	\N
437	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-28 14:48:43.071243	2015-10-28 14:48:43.071243	Concejal	\N
438	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-29 11:16:00.001547	2015-10-29 11:16:00.001547	Concejal	\N
439	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-29 11:16:00.006634	2015-10-29 11:16:00.006634	Concejal	\N
440	Cabral, Maria del Carmen	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-29 11:16:00.011159	2015-10-29 11:16:00.011159	Concejal	\N
441	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-29 11:16:00.015557	2015-10-29 11:16:00.015557	Concejal	\N
442	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-29 11:16:00.019904	2015-10-29 11:16:00.019904	Concejal	\N
443	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-29 11:16:00.024101	2015-10-29 11:16:00.024101	Concejal	\N
444	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-29 11:51:27.944305	2015-10-29 11:51:27.944305	Concejal	\N
445	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-29 11:51:27.949637	2015-10-29 11:51:27.949637	Concejal	\N
446	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-29 11:51:27.954288	2015-10-29 11:51:27.954288	Concejal	\N
447	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-29 11:51:27.958944	2015-10-29 11:51:27.958944	Concejal	\N
448	Scoppa, Eduardo Juan	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-29 11:51:27.963509	2015-10-29 11:51:27.963509	Concejal	\N
449	Carranza, Martin	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-29 11:51:27.967998	2015-10-29 11:51:27.967998	Concejal	\N
450	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-29 11:54:09.930991	2015-10-29 11:54:09.930991	Concejal	\N
451	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-29 11:54:09.93616	2015-10-29 11:54:09.93616	Concejal	\N
452	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-29 11:54:09.940839	2015-10-29 11:54:09.940839	Concejal	\N
453	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-29 11:54:09.94566	2015-10-29 11:54:09.94566	Concejal	\N
454	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-29 11:58:02.560313	2015-10-29 11:58:02.560313	Concejal	\N
455	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-29 11:58:02.565625	2015-10-29 11:58:02.565625	Concejal	\N
456	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-29 11:58:02.570402	2015-10-29 11:58:02.570402	Concejal	\N
457	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-29 11:58:02.575103	2015-10-29 11:58:02.575103	Concejal	\N
458	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-29 12:02:37.529729	2015-10-29 12:02:37.529729	Concejal	\N
459	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-29 12:02:37.534806	2015-10-29 12:02:37.534806	Concejal	\N
460	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-29 12:02:37.539421	2015-10-29 12:02:37.539421	Concejal	\N
461	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-29 12:02:37.543903	2015-10-29 12:02:37.543903	Concejal	\N
462	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-29 12:06:38.309124	2015-10-29 12:06:38.309124	Concejal	\N
463	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-29 12:06:38.314302	2015-10-29 12:06:38.314302	Concejal	\N
464	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-29 12:06:38.318961	2015-10-29 12:06:38.318961	Concejal	\N
465	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-29 12:06:38.323493	2015-10-29 12:06:38.323493	Concejal	\N
466	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-29 12:26:38.497009	2015-10-29 12:26:38.497009	Concejal	\N
467	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-29 12:26:38.502144	2015-10-29 12:26:38.502144	Concejal	\N
468	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-29 12:26:38.506749	2015-10-29 12:26:38.506749	Concejal	\N
469	Oviedo, Adriana Miriam	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-29 12:26:38.511401	2015-10-29 12:26:38.511401	Concejal	\N
470	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-29 12:26:38.516023	2015-10-29 12:26:38.516023	Concejal	\N
471	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-29 12:26:38.520534	2015-10-29 12:26:38.520534	Concejal	\N
472	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-29 12:26:38.525061	2015-10-29 12:26:38.525061	Concejal	\N
473	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-29 12:26:38.529568	2015-10-29 12:26:38.529568	Concejal	\N
474	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-29 12:26:38.534032	2015-10-29 12:26:38.534032	Concejal	\N
475	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-29 12:30:51.47423	2015-10-29 12:30:51.47423	Concejal	\N
476	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-29 12:30:51.479555	2015-10-29 12:30:51.479555	Concejal	\N
477	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-29 12:30:51.484437	2015-10-29 12:30:51.484437	Concejal	\N
478	Oviedo, Adriana Miriam	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-29 12:30:51.489589	2015-10-29 12:30:51.489589	Concejal	\N
479	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-29 12:30:51.494601	2015-10-29 12:30:51.494601	Concejal	\N
480	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-29 12:30:51.499293	2015-10-29 12:30:51.499293	Concejal	\N
481	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-29 12:30:51.503643	2015-10-29 12:30:51.503643	Concejal	\N
482	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-29 12:30:51.507713	2015-10-29 12:30:51.507713	Concejal	\N
483	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-29 12:30:51.511991	2015-10-29 12:30:51.511991	Concejal	\N
484	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-05 11:10:35.349886	2015-11-05 11:10:35.349886	Concejal	\N
485	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-05 11:10:35.355354	2015-11-05 11:10:35.355354	Concejal	\N
486	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-05 11:21:37.911833	2015-11-05 11:21:37.911833	Concejal	\N
487	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-05 11:21:37.916996	2015-11-05 11:21:37.916996	Concejal	\N
488	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-05 11:21:37.921626	2015-11-05 11:21:37.921626	Concejal	\N
489	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-05 11:21:37.926168	2015-11-05 11:21:37.926168	Concejal	\N
490	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-05 11:21:37.930522	2015-11-05 11:21:37.930522	Concejal	\N
491	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-05 11:21:37.934795	2015-11-05 11:21:37.934795	Concejal	\N
492	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-05 11:21:37.939021	2015-11-05 11:21:37.939021	Concejal	\N
493	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-05 11:25:11.882728	2015-11-05 11:25:11.882728	Concejal	\N
494	Cabral, Maria del Carmen	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-05 11:25:11.887875	2015-11-05 11:25:11.887875	Concejal	\N
495	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-05 11:25:11.892418	2015-11-05 11:25:11.892418	Concejal	\N
496	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-05 11:25:11.896826	2015-11-05 11:25:11.896826	Concejal	\N
497	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-05 11:44:29.698746	2015-11-05 11:44:29.698746	Concejal	\N
498	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-05 11:44:29.704196	2015-11-05 11:44:29.704196	Concejal	\N
499	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-05 11:44:29.709039	2015-11-05 11:44:29.709039	Concejal	\N
500	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-05 11:44:29.713798	2015-11-05 11:44:29.713798	Concejal	\N
501	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-05 11:44:29.718281	2015-11-05 11:44:29.718281	Concejal	\N
502	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-05 12:31:53.746398	2015-11-05 12:31:53.746398	Concejal	\N
503	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-05 12:31:53.75158	2015-11-05 12:31:53.75158	Concejal	\N
504	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-05 12:31:53.756163	2015-11-05 12:31:53.756163	Concejal	\N
505	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-05 12:31:53.760788	2015-11-05 12:31:53.760788	Concejal	\N
506	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-05 12:31:53.765182	2015-11-05 12:31:53.765182	Concejal	\N
507	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-05 12:31:53.769593	2015-11-05 12:31:53.769593	Concejal	\N
508	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-05 12:31:53.773887	2015-11-05 12:31:53.773887	Concejal	\N
509	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-05 12:38:28.89903	2015-11-05 12:38:28.89903	Concejal	\N
510	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-05 12:38:28.904299	2015-11-05 12:38:28.904299	Concejal	\N
511	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-05 12:38:28.909114	2015-11-05 12:38:28.909114	Concejal	\N
512	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-05 12:38:28.913671	2015-11-05 12:38:28.913671	Concejal	\N
513	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-05 12:38:28.918088	2015-11-05 12:38:28.918088	Concejal	\N
514	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-05 12:51:32.214938	2015-11-05 12:51:32.214938	Concejal	\N
515	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-05 12:51:32.220127	2015-11-05 12:51:32.220127	Concejal	\N
516	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-05 12:51:32.224791	2015-11-05 12:51:32.224791	Concejal	\N
517	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-05 12:51:32.229196	2015-11-05 12:51:32.229196	Concejal	\N
518	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-05 12:51:32.233587	2015-11-05 12:51:32.233587	Concejal	\N
519	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-05 12:51:32.237865	2015-11-05 12:51:32.237865	Concejal	\N
520	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-05 12:51:32.242135	2015-11-05 12:51:32.242135	Concejal	\N
521	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-05 12:57:49.974662	2015-11-05 12:57:49.974662	Concejal	\N
522	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-05 12:57:49.979998	2015-11-05 12:57:49.979998	Concejal	\N
523	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-05 12:57:49.98465	2015-11-05 12:57:49.98465	Concejal	\N
524	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-05 12:57:49.989234	2015-11-05 12:57:49.989234	Concejal	\N
525	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-05 12:57:49.993755	2015-11-05 12:57:49.993755	Concejal	\N
526	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-05 12:57:49.998109	2015-11-05 12:57:49.998109	Concejal	\N
527	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-05 12:57:50.002502	2015-11-05 12:57:50.002502	Concejal	\N
528	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-05 13:03:10.926627	2015-11-05 13:03:10.926627	Concejal	\N
529	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-05 13:03:10.93193	2015-11-05 13:03:10.93193	Concejal	\N
530	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-05 13:03:10.936634	2015-11-05 13:03:10.936634	Concejal	\N
531	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-05 13:03:10.94125	2015-11-05 13:03:10.94125	Concejal	\N
532	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-05 13:03:10.945757	2015-11-05 13:03:10.945757	Concejal	\N
533	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-05 13:03:10.950268	2015-11-05 13:03:10.950268	Concejal	\N
534	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-05 13:03:10.954614	2015-11-05 13:03:10.954614	Concejal	\N
535	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-05 13:43:04.511343	2015-11-05 13:43:04.511343	Concejal	\N
536	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-05 13:43:04.516596	2015-11-05 13:43:04.516596	Concejal	\N
537	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-05 13:43:04.521267	2015-11-05 13:43:04.521267	Concejal	\N
538	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-05 13:43:04.525956	2015-11-05 13:43:04.525956	Concejal	\N
539	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-05 13:43:04.530526	2015-11-05 13:43:04.530526	Concejal	\N
540	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-05 13:43:04.534937	2015-11-05 13:43:04.534937	Concejal	\N
541	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-05 13:43:04.53927	2015-11-05 13:43:04.53927	Concejal	\N
542	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-06 10:57:09.752835	2015-11-06 10:57:09.752835	Concejal	\N
543	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-06 10:57:09.758189	2015-11-06 10:57:09.758189	Concejal	\N
544	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-06 10:57:09.762972	2015-11-06 10:57:09.762972	Concejal	\N
545	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-06 10:57:09.767662	2015-11-06 10:57:09.767662	Concejal	\N
546	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-06 10:57:09.772199	2015-11-06 10:57:09.772199	Concejal	\N
547	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-06 11:10:18.98748	2015-11-06 11:10:18.98748	Concejal	\N
548	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-06 11:10:18.992696	2015-11-06 11:10:18.992696	Concejal	\N
549	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-06 11:10:18.997253	2015-11-06 11:10:18.997253	Concejal	\N
550	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-06 11:10:19.00175	2015-11-06 11:10:19.00175	Concejal	\N
551	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-06 11:10:19.006234	2015-11-06 11:10:19.006234	Concejal	\N
552	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-06 11:10:19.01066	2015-11-06 11:10:19.01066	Concejal	\N
553	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-06 11:10:19.014812	2015-11-06 11:10:19.014812	Concejal	\N
554	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-12 12:51:44.193755	2015-11-12 12:51:44.193755	Concejal	\N
555	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-12 12:51:44.199187	2015-11-12 12:51:44.199187	Concejal	\N
556	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-12 12:51:44.203961	2015-11-12 12:51:44.203961	Concejal	\N
557	Da Costa, Osvaldo	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-12 12:51:44.20868	2015-11-12 12:51:44.20868	Concejal	\N
558	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-12 12:54:09.326644	2015-11-12 12:54:09.326644	Concejal	\N
559	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-12 12:54:09.332152	2015-11-12 12:54:09.332152	Concejal	\N
560	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-12 12:54:09.337049	2015-11-12 12:54:09.337049	Concejal	\N
561	Da Costa, Osvaldo	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-12 12:54:09.341757	2015-11-12 12:54:09.341757	Concejal	\N
562	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-12 12:57:01.390094	2015-11-12 12:57:01.390094	Concejal	\N
563	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-12 12:57:01.395564	2015-11-12 12:57:01.395564	Concejal	\N
564	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-12 12:57:01.400479	2015-11-12 12:57:01.400479	Concejal	\N
565	Da Costa, Osvaldo	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-12 12:57:01.415902	2015-11-12 12:57:01.415902	Concejal	\N
566	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-12 13:00:44.97414	2015-11-12 13:00:44.97414	Concejal	\N
567	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-12 13:00:44.979765	2015-11-12 13:00:44.979765	Concejal	\N
568	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-12 13:00:44.984567	2015-11-12 13:00:44.984567	Concejal	\N
569	Da Costa, Osvaldo	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-12 13:00:44.989218	2015-11-12 13:00:44.989218	Concejal	\N
570	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-12 13:09:46.340155	2015-11-12 13:09:46.340155	Concejal	\N
571	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-12 13:09:46.345701	2015-11-12 13:09:46.345701	Concejal	\N
572	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-12 13:09:46.350513	2015-11-12 13:09:46.350513	Concejal	\N
573	Da Costa, Osvaldo	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-12 13:09:46.355185	2015-11-12 13:09:46.355185	Concejal	\N
574	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-12 13:49:38.77182	2015-11-12 13:49:38.77182	Concejal	\N
575	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-12 13:49:38.777364	2015-11-12 13:49:38.777364	Concejal	\N
576	David, Samantha	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-12 13:49:38.78233	2015-11-12 13:49:38.78233	Concejal	\N
577	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-12 13:49:38.787101	2015-11-12 13:49:38.787101	Concejal	\N
578	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-12 13:49:38.791686	2015-11-12 13:49:38.791686	Concejal	\N
579	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-12 13:53:35.974523	2015-11-12 13:53:35.974523	Concejal	\N
580	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-12 13:53:35.979689	2015-11-12 13:53:35.979689	Concejal	\N
581	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-12 13:53:35.984244	2015-11-12 13:53:35.984244	Concejal	\N
582	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-12 13:53:35.988782	2015-11-12 13:53:35.988782	Concejal	\N
583	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-12 13:53:35.99337	2015-11-12 13:53:35.99337	Concejal	\N
584	David, Samantha	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-12 13:53:35.997853	2015-11-12 13:53:35.997853	Concejal	\N
585	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-12 13:53:36.002351	2015-11-12 13:53:36.002351	Concejal	\N
586	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-12 13:53:36.006769	2015-11-12 13:53:36.006769	Concejal	\N
587	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-12 13:53:36.011024	2015-11-12 13:53:36.011024	Concejal	\N
588	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-12 13:53:36.015382	2015-11-12 13:53:36.015382	Concejal	\N
589	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-12 14:02:16.076364	2015-11-12 14:02:16.076364	Concejal	\N
590	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-12 14:02:16.081633	2015-11-12 14:02:16.081633	Concejal	\N
591	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-12 14:02:16.086292	2015-11-12 14:02:16.086292	Concejal	\N
592	David, Samantha	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-12 14:02:16.090958	2015-11-12 14:02:16.090958	Concejal	\N
593	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-12 14:02:16.095608	2015-11-12 14:02:16.095608	Concejal	\N
594	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-12 14:02:16.100182	2015-11-12 14:02:16.100182	Concejal	\N
595	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-12 14:02:16.104734	2015-11-12 14:02:16.104734	Concejal	\N
596	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-12 14:02:16.109229	2015-11-12 14:02:16.109229	Concejal	\N
597	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-12 14:02:16.113644	2015-11-12 14:02:16.113644	Concejal	\N
598	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-12 14:02:16.117964	2015-11-12 14:02:16.117964	Concejal	\N
599	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-12 14:09:50.066068	2015-11-12 14:09:50.066068	Concejal	\N
600	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-12 14:09:50.071337	2015-11-12 14:09:50.071337	Concejal	\N
601	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-12 14:09:50.07606	2015-11-12 14:09:50.07606	Concejal	\N
602	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-12 14:09:50.080691	2015-11-12 14:09:50.080691	Concejal	\N
603	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-12 14:09:50.085207	2015-11-12 14:09:50.085207	Concejal	\N
604	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-12 14:09:50.089633	2015-11-12 14:09:50.089633	Concejal	\N
605	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-12 14:09:50.094018	2015-11-12 14:09:50.094018	Concejal	\N
606	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-12 14:09:50.098415	2015-11-12 14:09:50.098415	Concejal	\N
607	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-12 14:13:30.832975	2015-11-12 14:13:30.832975	Concejal	\N
608	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-12 14:13:30.838382	2015-11-12 14:13:30.838382	Concejal	\N
609	Da Costa, Osvaldo	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-12 14:13:30.842995	2015-11-12 14:13:30.842995	Concejal	\N
610	David, Samantha	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-12 14:13:30.847569	2015-11-12 14:13:30.847569	Concejal	\N
611	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-12 14:13:30.852125	2015-11-12 14:13:30.852125	Concejal	\N
612	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-12 14:13:30.856678	2015-11-12 14:13:30.856678	Concejal	\N
613	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-12 14:13:30.861001	2015-11-12 14:13:30.861001	Concejal	\N
614	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-12 14:15:46.649842	2015-11-12 14:15:46.649842	Concejal	\N
615	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-12 14:15:46.655327	2015-11-12 14:15:46.655327	Concejal	\N
616	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-12 14:15:46.660033	2015-11-12 14:15:46.660033	Concejal	\N
617	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-12 14:15:46.66479	2015-11-12 14:15:46.66479	Concejal	\N
618	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-17 15:11:41.413357	2015-11-17 15:11:41.413357	Concejal	\N
619	Cabral, Maria del Carmen	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-17 15:11:41.418615	2015-11-17 15:11:41.418615	Concejal	\N
620	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-17 15:11:41.423256	2015-11-17 15:11:41.423256	Concejal	\N
621	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-17 15:11:41.427819	2015-11-17 15:11:41.427819	Concejal	\N
622	Da Costa, Osvaldo	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-17 15:11:41.432297	2015-11-17 15:11:41.432297	Concejal	\N
623	Oviedo, Adriana Miriam	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-18 15:25:59.856834	2015-11-18 15:25:59.856834	Concejal	\N
624	Yawni, Viviana Andrea	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-18 15:25:59.865658	2015-11-18 15:25:59.865658	Concejal	\N
625	Cabral, Maria del Carmen	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-18 15:25:59.870554	2015-11-18 15:25:59.870554	Concejal	\N
626	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-18 15:25:59.875151	2015-11-18 15:25:59.875151	Concejal	\N
627	Oviedo, Adriana Miriam	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-18 15:30:50.492645	2015-11-18 15:30:50.492645	Concejal	\N
628	Yawni, Viviana Andrea	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-18 15:30:50.501215	2015-11-18 15:30:50.501215	Concejal	\N
629	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-18 15:30:50.505772	2015-11-18 15:30:50.505772	Concejal	\N
630	Cabral, Maria del Carmen	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-18 15:30:50.510245	2015-11-18 15:30:50.510245	Concejal	\N
631	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-18 15:40:30.487065	2015-11-18 15:40:30.487065	Concejal	\N
632	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-18 15:40:30.492291	2015-11-18 15:40:30.492291	Concejal	\N
633	Cabral, Maria del Carmen	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-18 15:40:30.496878	2015-11-18 15:40:30.496878	Concejal	\N
634	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-18 15:40:30.501364	2015-11-18 15:40:30.501364	Concejal	\N
635	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-18 15:40:30.505849	2015-11-18 15:40:30.505849	Concejal	\N
636	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-18 15:40:30.510258	2015-11-18 15:40:30.510258	Concejal	\N
637	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-18 15:45:35.77312	2015-11-18 15:45:35.77312	Concejal	\N
638	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-18 15:45:35.778367	2015-11-18 15:45:35.778367	Concejal	\N
639	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-18 15:45:35.782945	2015-11-18 15:45:35.782945	Concejal	\N
640	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-18 15:45:35.78742	2015-11-18 15:45:35.78742	Concejal	\N
641	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-18 15:45:35.791962	2015-11-18 15:45:35.791962	Concejal	\N
642	Cabral, Maria del Carmen	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-18 15:45:35.796281	2015-11-18 15:45:35.796281	Concejal	\N
643	Oviedo, Adriana Miriam	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-18 15:52:22.591109	2015-11-18 15:52:22.591109	Concejal	\N
644	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-18 15:52:22.596454	2015-11-18 15:52:22.596454	Concejal	\N
645	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-18 15:52:22.601332	2015-11-18 15:52:22.601332	Concejal	\N
646	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-18 15:52:22.606435	2015-11-18 15:52:22.606435	Concejal	\N
647	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-18 15:52:22.611411	2015-11-18 15:52:22.611411	Concejal	\N
648	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-18 15:52:22.616067	2015-11-18 15:52:22.616067	Concejal	\N
649	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-18 15:52:22.62059	2015-11-18 15:52:22.62059	Concejal	\N
650	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-18 15:52:22.625218	2015-11-18 15:52:22.625218	Concejal	\N
651	Oviedo, Adriana Miriam	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-19 11:23:45.635782	2015-11-19 11:23:45.635782	Concejal	\N
652	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-19 11:23:45.641188	2015-11-19 11:23:45.641188	Concejal	\N
653	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-19 11:23:45.645766	2015-11-19 11:23:45.645766	Concejal	\N
654	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-19 11:23:45.650337	2015-11-19 11:23:45.650337	Concejal	\N
655	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-19 11:23:45.65483	2015-11-19 11:23:45.65483	Concejal	\N
656	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-19 11:23:45.659214	2015-11-19 11:23:45.659214	Concejal	\N
657	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-19 11:23:45.663552	2015-11-19 11:23:45.663552	Concejal	\N
658	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-19 11:23:45.667726	2015-11-19 11:23:45.667726	Concejal	\N
659	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-19 12:03:56.961963	2015-11-19 12:03:56.961963	Concejal	\N
660	Oviedo, Adriana Miriam	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-19 12:03:56.967181	2015-11-19 12:03:56.967181	Concejal	\N
661	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-19 12:03:56.971826	2015-11-19 12:03:56.971826	Concejal	\N
662	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-19 12:03:56.976313	2015-11-19 12:03:56.976313	Concejal	\N
663	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-19 12:03:56.980805	2015-11-19 12:03:56.980805	Concejal	\N
664	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-19 12:03:56.985066	2015-11-19 12:03:56.985066	Concejal	\N
665	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-19 12:03:56.989355	2015-11-19 12:03:56.989355	Concejal	\N
666	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-19 12:08:16.369403	2015-11-19 12:08:16.369403	Concejal	\N
667	Oviedo, Adriana Miriam	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-19 12:08:16.374523	2015-11-19 12:08:16.374523	Concejal	\N
668	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-19 12:08:16.379158	2015-11-19 12:08:16.379158	Concejal	\N
669	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-19 12:08:16.383761	2015-11-19 12:08:16.383761	Concejal	\N
670	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-19 12:08:16.388297	2015-11-19 12:08:16.388297	Concejal	\N
671	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-19 12:08:16.392919	2015-11-19 12:08:16.392919	Concejal	\N
672	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-19 12:08:16.39739	2015-11-19 12:08:16.39739	Concejal	\N
673	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-19 12:08:16.40201	2015-11-19 12:08:16.40201	Concejal	\N
674	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-19 12:14:03.976606	2015-11-19 12:14:03.976606	Concejal	\N
675	Oviedo, Adriana Miriam	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-19 12:14:03.982046	2015-11-19 12:14:03.982046	Concejal	\N
676	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-19 12:14:03.98684	2015-11-19 12:14:03.98684	Concejal	\N
677	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-19 12:14:03.991529	2015-11-19 12:14:03.991529	Concejal	\N
678	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-19 12:14:03.996101	2015-11-19 12:14:03.996101	Concejal	\N
679	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-19 12:14:04.00061	2015-11-19 12:14:04.00061	Concejal	\N
689	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-19 13:01:07.549683	2015-11-19 13:01:07.549683	Concejal	\N
690	Carranza, Martin	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-19 13:01:07.554421	2015-11-19 13:01:07.554421	Concejal	\N
691	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-19 13:01:07.558537	2015-11-19 13:01:07.558537	Concejal	\N
692	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-19 13:01:07.56263	2015-11-19 13:01:07.56263	Concejal	\N
693	Oviedo, Adriana Miriam	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-19 13:01:07.566692	2015-11-19 13:01:07.566692	Concejal	\N
694	Yawni, Viviana Andrea	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-19 13:01:07.570587	2015-11-19 13:01:07.570587	Concejal	\N
695	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-19 13:01:07.57449	2015-11-19 13:01:07.57449	Concejal	\N
696	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-19 13:01:07.578417	2015-11-19 13:01:07.578417	Concejal	\N
697	Cabral, Maria del Carmen	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-19 13:01:07.582403	2015-11-19 13:01:07.582403	Concejal	\N
680	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-19 12:25:54.09168	2015-11-19 12:25:54.09168	Concejal	\N
681	Carranza, Martin	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-19 12:25:54.09652	2015-11-19 12:25:54.09652	Concejal	\N
682	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-19 12:25:54.100666	2015-11-19 12:25:54.100666	Concejal	\N
683	Yawni, Viviana Andrea	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-19 12:25:54.104786	2015-11-19 12:25:54.104786	Concejal	\N
684	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-19 12:25:54.108858	2015-11-19 12:25:54.108858	Concejal	\N
685	Oviedo, Adriana Miriam	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-19 12:25:54.11319	2015-11-19 12:25:54.11319	Concejal	\N
686	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-19 12:25:54.117297	2015-11-19 12:25:54.117297	Concejal	\N
687	Cabral, Maria del Carmen	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-19 12:25:54.121368	2015-11-19 12:25:54.121368	Concejal	\N
688	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-19 12:25:54.12547	2015-11-19 12:25:54.12547	Concejal	\N
698	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-19 15:27:14.733886	2015-11-19 15:27:14.733886	Concejal	\N
699	Oviedo, Adriana Miriam	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-19 15:27:14.73919	2015-11-19 15:27:14.73919	Concejal	\N
700	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-19 15:27:14.743736	2015-11-19 15:27:14.743736	Concejal	\N
701	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-19 15:27:14.748283	2015-11-19 15:27:14.748283	Concejal	\N
702	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-19 15:27:14.752698	2015-11-19 15:27:14.752698	Concejal	\N
703	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-19 15:27:14.757003	2015-11-19 15:27:14.757003	Concejal	\N
704	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-19 15:31:48.575229	2015-11-19 15:31:48.575229	Concejal	\N
705	Oviedo, Adriana Miriam	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-19 15:31:48.580626	2015-11-19 15:31:48.580626	Concejal	\N
706	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-19 15:31:48.585478	2015-11-19 15:31:48.585478	Concejal	\N
707	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-19 15:31:48.590128	2015-11-19 15:31:48.590128	Concejal	\N
708	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-19 15:31:48.594693	2015-11-19 15:31:48.594693	Concejal	\N
709	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-19 15:31:48.599147	2015-11-19 15:31:48.599147	Concejal	\N
710	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-19 15:31:48.603451	2015-11-19 15:31:48.603451	Concejal	\N
711	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-19 15:31:48.607775	2015-11-19 15:31:48.607775	Concejal	\N
712	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-19 15:38:13.040502	2015-11-19 15:38:13.040502	Concejal	\N
713	Oviedo, Adriana Miriam	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-19 15:38:13.046061	2015-11-19 15:38:13.046061	Concejal	\N
714	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-19 15:38:13.050683	2015-11-19 15:38:13.050683	Concejal	\N
715	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-19 15:38:13.05525	2015-11-19 15:38:13.05525	Concejal	\N
716	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-19 15:38:13.059818	2015-11-19 15:38:13.059818	Concejal	\N
717	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-19 15:38:13.064392	2015-11-19 15:38:13.064392	Concejal	\N
718	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-19 15:38:13.069056	2015-11-19 15:38:13.069056	Concejal	\N
719	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-19 15:38:13.073535	2015-11-19 15:38:13.073535	Concejal	\N
720	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-26 10:59:03.500861	2015-11-26 10:59:03.500861	Concejal	\N
721	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-26 10:59:03.558444	2015-11-26 10:59:03.558444	Concejal	\N
722	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-26 10:59:03.563615	2015-11-26 10:59:03.563615	Concejal	\N
723	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-26 10:59:03.568526	2015-11-26 10:59:03.568526	Concejal	\N
724	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-26 10:59:03.573459	2015-11-26 10:59:03.573459	Concejal	\N
725	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-26 11:02:22.408897	2015-11-26 11:02:22.408897	Concejal	\N
726	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-26 11:02:22.414144	2015-11-26 11:02:22.414144	Concejal	\N
727	Cabral, Maria del Carmen	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-26 11:02:22.418619	2015-11-26 11:02:22.418619	Concejal	\N
728	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-26 11:02:22.423059	2015-11-26 11:02:22.423059	Concejal	\N
729	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-26 11:02:22.42756	2015-11-26 11:02:22.42756	Concejal	\N
730	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-26 11:02:22.431932	2015-11-26 11:02:22.431932	Concejal	\N
731	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-26 11:05:07.578612	2015-11-26 11:05:07.578612	Concejal	\N
732	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-26 11:05:07.584037	2015-11-26 11:05:07.584037	Concejal	\N
733	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-26 11:05:07.588835	2015-11-26 11:05:07.588835	Concejal	\N
734	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-26 11:05:07.593521	2015-11-26 11:05:07.593521	Concejal	\N
735	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-26 11:05:07.598045	2015-11-26 11:05:07.598045	Concejal	\N
736	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-26 11:08:37.540218	2015-11-26 11:08:37.540218	Concejal	\N
737	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-26 11:08:37.545683	2015-11-26 11:08:37.545683	Concejal	\N
738	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-26 11:08:37.550343	2015-11-26 11:08:37.550343	Concejal	\N
739	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-26 11:08:37.554837	2015-11-26 11:08:37.554837	Concejal	\N
740	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-26 11:08:37.55931	2015-11-26 11:08:37.55931	Concejal	\N
741	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-26 11:11:31.69812	2015-11-26 11:11:31.69812	Concejal	\N
742	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-26 11:11:31.703522	2015-11-26 11:11:31.703522	Concejal	\N
743	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-26 11:11:31.708179	2015-11-26 11:11:31.708179	Concejal	\N
744	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-26 11:11:31.712862	2015-11-26 11:11:31.712862	Concejal	\N
745	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-26 11:11:31.717388	2015-11-26 11:11:31.717388	Concejal	\N
746	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-26 11:14:42.270049	2015-11-26 11:14:42.270049	Concejal	\N
747	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-26 11:14:42.275341	2015-11-26 11:14:42.275341	Concejal	\N
748	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-26 11:14:42.279943	2015-11-26 11:14:42.279943	Concejal	\N
749	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-26 11:14:42.284507	2015-11-26 11:14:42.284507	Concejal	\N
750	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-26 11:14:42.288852	2015-11-26 11:14:42.288852	Concejal	\N
751	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-26 11:23:33.086306	2015-11-26 11:23:33.086306	Concejal	\N
752	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-26 11:23:33.091696	2015-11-26 11:23:33.091696	Concejal	\N
753	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-26 11:23:33.096519	2015-11-26 11:23:33.096519	Concejal	\N
754	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-26 11:23:33.101106	2015-11-26 11:23:33.101106	Concejal	\N
755	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-26 11:23:33.105613	2015-11-26 11:23:33.105613	Concejal	\N
756	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-26 11:40:53.286524	2015-11-26 11:40:53.286524	Concejal	\N
757	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-26 11:40:53.29587	2015-11-26 11:40:53.29587	Concejal	\N
758	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-26 11:40:53.300519	2015-11-26 11:40:53.300519	Concejal	\N
759	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-26 11:40:53.305038	2015-11-26 11:40:53.305038	Concejal	\N
760	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-26 11:40:53.309479	2015-11-26 11:40:53.309479	Concejal	\N
761	Oviedo, Adriana Miriam	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-26 11:40:53.313905	2015-11-26 11:40:53.313905	Concejal	\N
762	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-26 11:40:53.318193	2015-11-26 11:40:53.318193	Concejal	\N
763	David, Samantha	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-26 11:40:53.322356	2015-11-26 11:40:53.322356	Concejal	\N
764	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-26 11:40:53.326515	2015-11-26 11:40:53.326515	Concejal	\N
765	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-26 11:45:43.700494	2015-11-26 11:45:43.700494	Concejal	\N
766	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-26 11:45:43.705838	2015-11-26 11:45:43.705838	Concejal	\N
767	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-26 11:45:43.710527	2015-11-26 11:45:43.710527	Concejal	\N
768	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-26 11:45:43.715244	2015-11-26 11:45:43.715244	Concejal	\N
769	David, Samantha	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-26 11:45:43.731721	2015-11-26 11:45:43.731721	Concejal	\N
770	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-26 11:45:43.736356	2015-11-26 11:45:43.736356	Concejal	\N
771	Oviedo, Adriana Miriam	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-26 11:45:43.7408	2015-11-26 11:45:43.7408	Concejal	\N
772	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-26 11:45:43.745146	2015-11-26 11:45:43.745146	Concejal	\N
773	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-26 11:45:43.7495	2015-11-26 11:45:43.7495	Concejal	\N
774	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-26 11:53:52.557669	2015-11-26 11:53:52.557669	Concejal	\N
775	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-26 11:53:52.569906	2015-11-26 11:53:52.569906	Concejal	\N
776	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-26 11:53:52.574604	2015-11-26 11:53:52.574604	Concejal	\N
777	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-26 11:53:52.579344	2015-11-26 11:53:52.579344	Concejal	\N
778	Oviedo, Adriana Miriam	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-26 11:53:52.583763	2015-11-26 11:53:52.583763	Concejal	\N
779	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-26 11:53:52.588154	2015-11-26 11:53:52.588154	Concejal	\N
780	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-26 11:53:52.592575	2015-11-26 11:53:52.592575	Concejal	\N
781	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-26 11:53:52.596884	2015-11-26 11:53:52.596884	Concejal	\N
782	David, Samantha	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-26 11:53:52.601095	2015-11-26 11:53:52.601095	Concejal	\N
783	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-26 11:58:34.075561	2015-11-26 11:58:34.075561	Concejal	\N
784	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-26 11:58:34.080694	2015-11-26 11:58:34.080694	Concejal	\N
785	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-26 11:58:34.085324	2015-11-26 12:43:01.369145	Concejal	\N
806	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-03 13:50:09.476355	2015-12-03 13:50:09.476355	Concejal	\N
807	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-03 13:50:09.481513	2015-12-03 13:50:09.481513	Concejal	\N
808	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-03 13:50:09.486122	2015-12-03 13:50:09.486122	Concejal	\N
809	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-03 13:50:09.49072	2015-12-03 13:50:09.49072	Concejal	\N
810	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-03 13:50:09.495182	2015-12-03 13:50:09.495182	Concejal	\N
811	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-03 13:50:09.499651	2015-12-03 13:50:09.499651	Concejal	\N
812	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-03 13:50:09.504004	2015-12-03 13:50:09.504004	Concejal	\N
813	David, Samantha	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-03 13:50:09.508331	2015-12-03 13:50:09.508331	Concejal	\N
786	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-26 12:43:01.37176	2015-11-26 12:43:01.37176	Concejal	\N
787	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-26 12:43:01.376946	2015-11-26 12:43:01.376946	Concejal	\N
788	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-26 12:43:01.381513	2015-11-26 12:43:01.381513	Concejal	\N
789	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-26 12:43:01.385967	2015-11-26 12:43:01.385967	Concejal	\N
790	David, Samantha	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-26 12:43:01.390348	2015-11-26 12:43:01.390348	Concejal	\N
791	Oviedo, Adriana Miriam	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-26 12:43:01.394604	2015-11-26 12:43:01.394604	Concejal	\N
792	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-02 14:22:34.129654	2015-12-02 14:22:34.129654	Concejal	\N
793	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-02 14:22:34.134908	2015-12-02 14:22:34.134908	Concejal	\N
794	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-02 14:22:34.139591	2015-12-02 14:22:34.139591	Concejal	\N
795	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-02 14:22:34.144137	2015-12-02 14:22:34.144137	Concejal	\N
796	Oviedo, Adriana Miriam	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-03 13:38:02.556561	2015-12-03 13:38:02.556561	Concejal	\N
797	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-03 13:38:02.561776	2015-12-03 13:38:02.561776	Concejal	\N
798	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-03 13:38:02.566459	2015-12-03 13:38:02.566459	Concejal	\N
799	Yawni, Viviana Andrea	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-03 13:38:02.57108	2015-12-03 13:38:02.57108	Concejal	\N
800	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-03 13:44:39.775757	2015-12-03 13:44:39.775757	Concejal	\N
801	Oviedo, Adriana Miriam	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-03 13:44:39.781146	2015-12-03 13:44:39.781146	Concejal	\N
802	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-03 13:44:39.785793	2015-12-03 13:44:39.785793	Concejal	\N
803	Cabral, Maria del Carmen	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-03 13:44:39.790334	2015-12-03 13:44:39.790334	Concejal	\N
804	Yawni, Viviana Andrea	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-03 13:44:39.794837	2015-12-03 13:44:39.794837	Concejal	\N
805	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-03 13:44:39.799401	2015-12-03 13:44:39.799401	Concejal	\N
814	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-03 13:53:38.368515	2015-12-03 13:53:38.368515	Concejal	\N
815	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-03 13:53:38.3735	2015-12-03 13:53:38.3735	Concejal	\N
816	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-03 13:53:38.377955	2015-12-03 13:53:38.377955	Concejal	\N
817	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-03 13:53:38.382447	2015-12-03 13:53:38.382447	Concejal	\N
818	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-03 13:55:52.077039	2015-12-03 13:55:52.077039	Concejal	\N
819	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-03 13:55:52.082121	2015-12-03 13:55:52.082121	Concejal	\N
820	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-03 13:55:52.086762	2015-12-03 13:55:52.086762	Concejal	\N
821	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-03 13:55:52.091378	2015-12-03 13:55:52.091378	Concejal	\N
822	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-03 14:02:47.060398	2015-12-03 14:02:47.060398	Concejal	\N
823	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-03 14:02:47.065581	2015-12-03 14:02:47.065581	Concejal	\N
824	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-03 14:02:47.0702	2015-12-03 14:02:47.0702	Concejal	\N
825	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-03 14:02:47.074751	2015-12-03 14:02:47.074751	Concejal	\N
826	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-03 14:12:42.034727	2015-12-03 14:12:42.034727	Concejal	\N
827	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-03 14:12:42.039785	2015-12-03 14:12:42.039785	Concejal	\N
828	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-03 14:12:42.044388	2015-12-03 14:12:42.044388	Concejal	\N
829	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-03 14:12:42.048902	2015-12-03 14:12:42.048902	Concejal	\N
830	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-03 14:12:42.053288	2015-12-03 14:12:42.053288	Concejal	\N
831	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-03 14:12:42.057595	2015-12-03 14:12:42.057595	Concejal	\N
832	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-03 14:12:42.061863	2015-12-03 14:12:42.061863	Concejal	\N
833	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-03 14:12:42.065911	2015-12-03 14:12:42.065911	Concejal	\N
834	David, Samantha	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-03 14:12:42.069971	2015-12-03 14:12:42.069971	Concejal	\N
835	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-03 14:12:42.074042	2015-12-03 14:12:42.074042	Concejal	\N
836	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-03 14:18:22.437607	2015-12-03 14:18:22.437607	Concejal	\N
837	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-03 14:18:22.442782	2015-12-03 14:18:22.442782	Concejal	\N
838	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-03 14:18:22.447297	2015-12-03 14:18:22.447297	Concejal	\N
839	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-03 14:18:22.451777	2015-12-03 14:18:22.451777	Concejal	\N
840	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-03 14:18:22.456256	2015-12-03 14:18:22.456256	Concejal	\N
841	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-03 14:18:22.460663	2015-12-03 14:18:22.460663	Concejal	\N
842	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-03 14:18:22.464756	2015-12-03 14:18:22.464756	Concejal	\N
843	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-03 14:18:22.468755	2015-12-03 14:18:22.468755	Concejal	\N
845	David, Samantha	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-03 14:18:22.477402	2015-12-03 14:18:22.477402	Concejal	\N
846	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-03 14:18:22.481635	2015-12-03 14:18:22.481635	Concejal	\N
847	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-03 15:05:10.68478	2015-12-03 15:05:10.68478	Concejal	\N
848	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-03 15:05:10.690507	2015-12-03 15:05:10.690507	Concejal	\N
849	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-03 15:05:10.695338	2015-12-03 15:05:10.695338	Concejal	\N
850	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-03 15:05:10.700105	2015-12-03 15:05:10.700105	Concejal	\N
851	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-03 15:05:10.704784	2015-12-03 15:05:10.704784	Concejal	\N
852	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-03 15:05:10.709295	2015-12-03 15:05:10.709295	Concejal	\N
853	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-03 15:05:10.713779	2015-12-03 15:05:10.713779	Concejal	\N
854	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-03 15:05:10.717906	2015-12-03 15:05:10.717906	Concejal	\N
855	David, Samantha	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-03 15:05:10.721926	2015-12-03 15:05:10.721926	Concejal	\N
856	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-03 15:05:10.725966	2015-12-03 15:05:10.725966	Concejal	\N
857	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-03 15:12:16.687774	2015-12-03 15:12:16.687774	Concejal	\N
858	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-03 15:12:16.692812	2015-12-03 15:12:16.692812	Concejal	\N
859	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-03 15:12:16.697348	2015-12-03 15:12:16.697348	Concejal	\N
860	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-03 15:12:16.701974	2015-12-03 15:12:16.701974	Concejal	\N
861	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-03 15:12:16.706652	2015-12-03 15:12:16.706652	Concejal	\N
862	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-03 15:12:16.711473	2015-12-03 15:12:16.711473	Concejal	\N
863	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-03 15:12:16.716462	2015-12-03 15:12:16.716462	Concejal	\N
864	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-03 15:12:16.721034	2015-12-03 15:12:16.721034	Concejal	\N
865	David, Samantha	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-03 15:12:16.725466	2015-12-03 15:12:16.725466	Concejal	\N
866	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-03 15:12:16.72965	2015-12-03 15:12:16.72965	Concejal	\N
867	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-03 15:18:41.575073	2015-12-03 15:18:41.575073	Concejal	\N
868	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-03 15:18:41.580137	2015-12-03 15:18:41.580137	Concejal	\N
869	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-03 15:18:41.584718	2015-12-03 15:18:41.584718	Concejal	\N
870	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-03 15:18:41.589204	2015-12-03 15:18:41.589204	Concejal	\N
871	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-03 15:18:41.593611	2015-12-03 15:18:41.593611	Concejal	\N
872	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-03 15:18:41.597868	2015-12-03 15:18:41.597868	Concejal	\N
873	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-03 15:18:41.602015	2015-12-03 15:18:41.602015	Concejal	\N
874	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-03 15:18:41.606022	2015-12-03 15:18:41.606022	Concejal	\N
875	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-03 15:18:41.609954	2015-12-03 15:18:41.609954	Concejal	\N
876	David, Samantha	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-03 15:18:41.613882	2015-12-03 15:18:41.613882	Concejal	\N
877	Cabral, Maria del Carmen	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 11:03:18.302251	2015-12-10 11:03:18.302251	Concejal	\N
878	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 11:03:18.307557	2015-12-10 11:03:18.307557	Concejal	\N
879	Yawni, Viviana Andrea	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 11:03:18.312248	2015-12-10 11:03:18.312248	Concejal	\N
880	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 11:03:18.316955	2015-12-10 11:03:18.316955	Concejal	\N
881	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 11:03:18.321403	2015-12-10 11:03:18.321403	Concejal	\N
882	Cabral, Maria del Carmen	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 11:07:02.499011	2015-12-10 11:07:02.499011	Concejal	\N
883	Yawni, Viviana Andrea	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 11:07:02.504393	2015-12-10 11:07:02.504393	Concejal	\N
884	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 11:07:02.509097	2015-12-10 11:07:02.509097	Concejal	\N
885	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 11:07:02.513703	2015-12-10 11:07:02.513703	Concejal	\N
886	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 11:11:28.312117	2015-12-10 11:11:28.312117	Concejal	\N
887	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 11:11:28.317283	2015-12-10 11:11:28.317283	Concejal	\N
888	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 11:11:28.321845	2015-12-10 11:11:28.321845	Concejal	\N
889	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 11:11:28.326412	2015-12-10 11:11:28.326412	Concejal	\N
890	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 11:11:28.330909	2015-12-10 11:11:28.330909	Concejal	\N
891	Cabral, Maria del Carmen	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 11:11:28.335397	2015-12-10 11:11:28.335397	Concejal	\N
892	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 11:11:28.339875	2015-12-10 11:11:28.339875	Concejal	\N
893	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 11:11:28.344352	2015-12-10 11:11:28.344352	Concejal	\N
894	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 11:14:30.517576	2015-12-10 11:14:30.517576	Concejal	\N
895	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 11:14:30.522739	2015-12-10 11:14:30.522739	Concejal	\N
896	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 11:14:30.527507	2015-12-10 11:14:30.527507	Concejal	\N
897	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 11:14:30.532051	2015-12-10 11:14:30.532051	Concejal	\N
898	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 11:14:30.536523	2015-12-10 11:14:30.536523	Concejal	\N
899	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 11:14:30.540965	2015-12-10 11:14:30.540965	Concejal	\N
900	Cabral, Maria del Carmen	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 11:14:30.545239	2015-12-10 11:14:30.545239	Concejal	\N
901	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 11:14:30.54954	2015-12-10 11:14:30.54954	Concejal	\N
902	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 11:20:46.681334	2015-12-10 11:20:46.681334	Concejal	\N
903	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 11:20:46.686361	2015-12-10 11:20:46.686361	Concejal	\N
904	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 11:20:46.69084	2015-12-10 11:20:46.69084	Concejal	\N
905	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 11:20:46.695273	2015-12-10 11:20:46.695273	Concejal	\N
906	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 11:20:46.699507	2015-12-10 11:20:46.699507	Concejal	\N
907	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 11:20:46.703721	2015-12-10 11:20:46.703721	Concejal	\N
908	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 11:20:46.707882	2015-12-10 11:20:46.707882	Concejal	\N
909	Cabral, Maria del Carmen	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 11:20:46.712077	2015-12-10 11:20:46.712077	Concejal	\N
910	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 11:37:21.558413	2015-12-10 11:37:21.558413	Concejal	\N
911	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 11:37:21.563494	2015-12-10 11:37:21.563494	Concejal	\N
912	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 11:37:21.568043	2015-12-10 11:37:21.568043	Concejal	\N
913	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 11:37:21.572542	2015-12-10 11:37:21.572542	Concejal	\N
914	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 11:37:21.576897	2015-12-10 11:37:21.576897	Concejal	\N
915	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 11:37:21.581218	2015-12-10 11:37:21.581218	Concejal	\N
916	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 11:37:21.585518	2015-12-10 11:37:21.585518	Concejal	\N
917	Cabral, Maria del Carmen	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 11:37:21.589857	2015-12-10 11:37:21.589857	Concejal	\N
918	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 11:55:20.069816	2015-12-10 11:55:20.069816	Concejal	\N
919	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 11:55:20.075004	2015-12-10 11:55:20.075004	Concejal	\N
920	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 11:55:20.079552	2015-12-10 11:55:20.079552	Concejal	\N
921	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 11:55:20.084063	2015-12-10 11:55:20.084063	Concejal	\N
922	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 11:55:20.088488	2015-12-10 11:55:20.088488	Concejal	\N
923	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 11:55:20.09291	2015-12-10 11:55:20.09291	Concejal	\N
924	Cabral, Maria del Carmen	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 11:55:20.097411	2015-12-10 11:55:20.097411	Concejal	\N
925	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 11:55:20.101939	2015-12-10 11:55:20.101939	Concejal	\N
926	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 12:10:21.349309	2015-12-10 12:10:21.349309	Concejal	\N
927	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 12:10:21.35443	2015-12-10 12:10:21.35443	Concejal	\N
928	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 12:10:21.359087	2015-12-10 12:10:21.359087	Concejal	\N
929	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 12:10:21.363534	2015-12-10 12:10:21.363534	Concejal	\N
930	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 12:10:21.367914	2015-12-10 12:10:21.367914	Concejal	\N
931	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 12:10:21.372186	2015-12-10 12:10:21.372186	Concejal	\N
932	Cabral, Maria del Carmen	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 12:10:21.376465	2015-12-10 12:10:21.376465	Concejal	\N
933	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 12:10:21.380658	2015-12-10 12:10:21.380658	Concejal	\N
934	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 12:12:29.652256	2015-12-10 12:12:29.652256	Concejal	\N
935	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 12:12:29.657443	2015-12-10 12:12:29.657443	Concejal	\N
936	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 12:12:29.66213	2015-12-10 12:12:29.66213	Concejal	\N
937	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 12:25:41.413755	2015-12-10 12:25:41.413755	Concejal	\N
938	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 12:25:41.431076	2015-12-10 12:25:41.431076	Concejal	\N
939	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 12:25:41.435612	2015-12-10 12:25:41.435612	Concejal	\N
940	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 12:52:38.401474	2015-12-10 12:52:38.401474	Concejal	\N
941	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 12:52:38.406854	2015-12-10 12:52:38.406854	Concejal	\N
942	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 12:52:38.411578	2015-12-10 12:52:38.411578	Concejal	\N
943	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 12:54:44.729526	2015-12-10 12:54:44.729526	Concejal	\N
944	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 12:54:44.734511	2015-12-10 12:54:44.734511	Concejal	\N
945	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 12:54:44.739107	2015-12-10 12:54:44.739107	Concejal	\N
946	Carranza, Martin	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 13:16:37.965899	2015-12-10 13:16:37.965899	Concejal	\N
947	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 13:16:37.970972	2015-12-10 13:16:37.970972	Concejal	\N
948	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 13:16:37.97551	2015-12-10 13:16:37.97551	Concejal	\N
949	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 13:16:37.979988	2015-12-10 13:16:37.979988	Concejal	\N
950	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 13:16:37.984298	2015-12-10 13:16:37.984298	Concejal	\N
951	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 13:16:37.988565	2015-12-10 13:16:37.988565	Concejal	\N
952	Yawni, Viviana Andrea	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 13:16:37.992589	2015-12-10 13:16:37.992589	Concejal	\N
953	Cabral, Maria del Carmen	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 13:16:37.996579	2015-12-10 13:16:37.996579	Concejal	\N
954	Carranza, Martin	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 13:51:07.274046	2015-12-10 13:51:07.274046	Concejal	\N
955	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 13:51:07.279021	2015-12-10 13:51:07.279021	Concejal	\N
956	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 13:51:07.283472	2015-12-10 13:51:07.283472	Concejal	\N
957	Cabral, Maria del Carmen	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 13:51:07.287935	2015-12-10 13:51:07.287935	Concejal	\N
958	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 13:51:07.292149	2015-12-10 13:51:07.292149	Concejal	\N
959	Yawni, Viviana Andrea	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 13:51:07.296366	2015-12-10 13:51:07.296366	Concejal	\N
960	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 13:51:07.300335	2015-12-10 13:51:07.300335	Concejal	\N
961	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 13:51:07.304331	2015-12-10 13:51:07.304331	Concejal	\N
962	Carranza, Martin	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 14:37:23.222259	2015-12-10 14:37:23.222259	Concejal	\N
963	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 14:37:23.227056	2015-12-10 14:37:23.227056	Concejal	\N
964	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 14:37:23.231353	2015-12-10 14:37:23.231353	Concejal	\N
965	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 14:37:23.235749	2015-12-10 14:37:23.235749	Concejal	\N
966	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 14:37:23.240286	2015-12-10 14:37:23.240286	Concejal	\N
967	Cabral, Maria del Carmen	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 14:37:23.244695	2015-12-10 14:37:23.244695	Concejal	\N
968	Yawni, Viviana Andrea	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 14:37:23.249084	2015-12-10 14:37:23.249084	Concejal	\N
969	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 14:37:23.253501	2015-12-10 14:37:23.253501	Concejal	\N
973	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 14:43:38.718172	2015-12-10 14:43:38.718172	Concejal	\N
974	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 14:43:38.723434	2015-12-10 14:43:38.723434	Concejal	\N
975	Cabral, Maria del Carmen	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 14:43:38.728142	2015-12-10 14:43:38.728142	Concejal	\N
976	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 14:47:15.073199	2015-12-10 14:47:15.073199	Concejal	\N
977	Cabral, Maria del Carmen	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 14:47:15.078402	2015-12-10 14:47:15.078402	Concejal	\N
978	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 14:47:15.082954	2015-12-10 14:47:15.082954	Concejal	\N
979	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 15:00:26.909909	2015-12-10 15:00:26.909909	Concejal	\N
980	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 15:00:26.915037	2015-12-10 15:00:26.915037	Concejal	\N
981	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 15:00:26.919631	2015-12-10 15:00:26.919631	Concejal	\N
982	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 15:00:26.924087	2015-12-10 15:00:26.924087	Concejal	\N
970	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 14:41:40.477689	2015-12-10 14:41:40.477689	Concejal	\N
971	Cabral, Maria del Carmen	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 14:41:40.483037	2015-12-10 14:41:40.483037	Concejal	\N
972	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-10 14:41:40.487786	2015-12-10 14:41:40.487786	Concejal	\N
983	Carranza, Martin	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-15 16:12:42.928893	2015-12-15 16:12:42.928893	Concejal	\N
984	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-15 16:12:42.934052	2015-12-15 16:12:42.934052	Concejal	\N
985	Cabral, Maria del Carmen	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-15 16:12:42.938559	2015-12-15 16:12:42.938559	Concejal	\N
986	Scoppa, Eduardo Juan	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-15 16:12:42.943089	2015-12-15 16:12:42.943089	Concejal	\N
987	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-15 16:12:42.947582	2015-12-15 16:12:42.947582	Concejal	\N
988	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-15 16:12:42.951959	2015-12-15 16:12:42.951959	Concejal	\N
989	Da Costa, Osvaldo	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-15 16:12:42.95635	2015-12-15 16:12:42.95635	Concejal	\N
990	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-17 10:48:51.341133	2015-12-17 10:48:51.341133	Concejal	\N
991	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-17 10:48:51.346573	2015-12-17 10:48:51.346573	Concejal	\N
992	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-17 10:48:51.351305	2015-12-17 10:48:51.351305	Concejal	\N
993	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-17 10:53:17.840669	2015-12-17 10:53:17.840669	Concejal	\N
994	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-17 10:53:17.846012	2015-12-17 10:53:17.846012	Concejal	\N
995	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-17 10:53:17.85074	2015-12-17 10:53:17.85074	Concejal	\N
996		\N	\N	\N	\N	\N	\N	\N	\N	2015-12-17 10:53:17.855431	2015-12-17 10:53:17.855431	Concejal	\N
997	Da Costa, Osvaldo	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-17 10:58:21.939953	2015-12-17 10:58:21.939953	Concejal	\N
998	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-17 10:58:21.9451	2015-12-17 10:58:21.9451	Concejal	\N
999	Yawni, Viviana Andrea	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-17 10:58:21.949577	2015-12-17 10:58:21.949577	Concejal	\N
1000	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-17 10:58:21.954092	2015-12-17 10:58:21.954092	Concejal	\N
1001	Carranza, Martin	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-17 10:58:21.958499	2015-12-17 10:58:21.958499	Concejal	\N
1002	Scoppa, Eduardo Juan	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-17 10:58:21.962915	2015-12-17 10:58:21.962915	Concejal	\N
1003	Cabral, Maria del Carmen	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-17 10:58:21.967281	2015-12-17 10:58:21.967281	Concejal	\N
1004	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-17 10:58:21.971669	2015-12-17 10:58:21.971669	Concejal	\N
1005	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-17 10:58:21.97593	2015-12-17 10:58:21.97593	Concejal	\N
1006	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-17 11:02:20.380468	2015-12-17 11:02:20.380468	Concejal	\N
1007	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-17 11:02:20.385452	2015-12-17 11:02:20.385452	Concejal	\N
1008	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-17 11:02:20.389935	2015-12-17 11:02:20.389935	Concejal	\N
1009	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-17 11:02:20.394345	2015-12-17 11:02:20.394345	Concejal	\N
1010	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-17 11:02:20.398727	2015-12-17 11:02:20.398727	Concejal	\N
1011	Cabral, Maria del Carmen	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-17 11:02:20.403198	2015-12-17 11:02:20.403198	Concejal	\N
1012	Yawni, Viviana Andrea	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-17 11:02:20.407535	2015-12-17 11:02:20.407535	Concejal	\N
1013	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-17 11:05:52.390038	2015-12-17 11:05:52.390038	Concejal	\N
1014	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-17 11:05:52.395472	2015-12-17 11:05:52.395472	Concejal	\N
1015	Yawni, Viviana Andrea	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-17 11:05:52.400158	2015-12-17 11:05:52.400158	Concejal	\N
1016	Cabral, Maria del Carmen	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-17 11:05:52.404835	2015-12-17 11:05:52.404835	Concejal	\N
1017	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-17 11:19:04.827848	2015-12-17 11:19:04.827848	Concejal	\N
1018	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-17 11:19:04.83313	2015-12-17 11:19:04.83313	Concejal	\N
1019	Cabral, Maria del Carmen	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-17 11:19:04.837793	2015-12-17 11:19:04.837793	Concejal	\N
1020	Yawni, Viviana Andrea	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-17 11:19:04.842394	2015-12-17 11:19:04.842394	Concejal	\N
1021	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-17 11:28:19.975277	2015-12-17 11:28:19.975277	Concejal	\N
1022	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-17 11:28:19.980479	2015-12-17 11:28:19.980479	Concejal	\N
1023	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-17 11:28:19.985099	2015-12-17 11:28:19.985099	Concejal	\N
1024	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-17 11:28:19.989644	2015-12-17 11:28:19.989644	Concejal	\N
1025	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-17 11:34:02.708654	2015-12-17 11:34:02.708654	Concejal	\N
1026	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-17 11:34:02.714394	2015-12-17 11:34:02.714394	Concejal	\N
1027	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-17 11:34:02.719655	2015-12-17 11:34:02.719655	Concejal	\N
1028	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-17 11:34:02.724651	2015-12-17 11:34:02.724651	Concejal	\N
1029	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-17 11:39:28.569733	2015-12-17 11:39:28.569733	Concejal	\N
1030	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-17 11:39:28.57494	2015-12-17 11:39:28.57494	Concejal	\N
1031	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-17 11:39:28.579653	2015-12-17 11:39:28.579653	Concejal	\N
1032	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-17 11:39:28.584172	2015-12-17 11:39:28.584172	Concejal	\N
1033	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-17 11:43:43.12595	2015-12-17 11:43:43.12595	Concejal	\N
1034	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-17 11:43:43.131247	2015-12-17 11:43:43.131247	Concejal	\N
1035	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-17 11:43:43.135953	2015-12-17 11:43:43.135953	Concejal	\N
1036	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-17 11:43:43.140476	2015-12-17 11:43:43.140476	Concejal	\N
1037	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-17 11:47:23.538062	2015-12-17 11:47:23.538062	Concejal	\N
1038	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-17 11:47:23.543132	2015-12-17 11:47:23.543132	Concejal	\N
1039	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-17 11:47:23.54789	2015-12-17 11:47:23.54789	Concejal	\N
1040	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-17 11:47:23.552364	2015-12-17 11:47:23.552364	Concejal	\N
1041	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-17 12:03:37.454869	2015-12-17 12:03:37.454869	Concejal	\N
1042	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-17 12:03:37.460203	2015-12-17 12:03:37.460203	Concejal	\N
1043	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-17 12:03:37.464855	2015-12-17 12:03:37.464855	Concejal	\N
1044	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-17 12:03:37.469346	2015-12-17 12:03:37.469346	Concejal	\N
1045	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-17 12:13:10.328937	2015-12-17 12:13:10.328937	Concejal	\N
1046	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-17 12:13:10.334139	2015-12-17 12:13:10.334139	Concejal	\N
1047	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-17 12:13:10.338804	2015-12-17 12:13:10.338804	Concejal	\N
1049	Sirolesi, Silvia	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-17 12:15:20.459945	2015-12-17 12:15:20.459945	Concejal	\N
1050	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-17 12:16:50.291287	2015-12-17 12:16:50.291287	Concejal	\N
1051	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-17 12:16:50.296355	2015-12-17 12:16:50.296355	Concejal	\N
1052	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-17 12:16:50.300966	2015-12-17 12:16:50.300966	Concejal	\N
1053	Perez Da Janoveira, Maria Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-17 12:19:08.894082	2015-12-17 12:19:08.894082	Concejal	\N
1054	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-17 12:36:21.226581	2015-12-17 12:36:21.226581	Concejal	\N
1055	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-17 12:36:21.231655	2015-12-17 12:36:21.231655	Concejal	\N
1056	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-17 12:36:21.236119	2015-12-17 12:36:21.236119	Concejal	\N
1057	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-17 12:36:21.240593	2015-12-17 12:36:21.240593	Concejal	\N
1058	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-17 12:36:21.2451	2015-12-17 12:36:21.2451	Concejal	\N
1059	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-17 12:36:21.249555	2015-12-17 12:36:21.249555	Concejal	\N
1060	Perez Da Janoveira, Maria Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-17 12:36:21.253987	2015-12-17 12:36:21.253987	Concejal	\N
1061	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-17 12:43:14.041169	2015-12-17 12:43:14.041169	Concejal	\N
1062	Cabral, Maria del Carmen	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-17 12:43:14.046184	2015-12-17 12:43:14.046184	Concejal	\N
1063	Yawni, Viviana Andrea	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-17 12:43:14.050608	2015-12-17 12:43:14.050608	Concejal	\N
1064	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-17 12:43:14.054979	2015-12-17 12:43:14.054979	Concejal	\N
1065	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-17 12:43:14.059274	2015-12-17 12:43:14.059274	Concejal	\N
1066	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-17 12:43:14.063485	2015-12-17 12:43:14.063485	Concejal	\N
1067	Cabral, Maria del Carmen	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-18 15:12:11.531337	2015-12-18 15:12:11.531337	Concejal	\N
1068	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-18 15:12:11.536649	2015-12-18 15:12:11.536649	Concejal	\N
1069	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-18 15:12:11.541418	2015-12-18 15:12:11.541418	Concejal	\N
1070	Yawni, Viviana Andrea	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-18 15:12:11.546106	2015-12-18 15:12:11.546106	Concejal	\N
1071	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 10:33:58.166183	2015-12-21 10:33:58.166183	Concejal	\N
1072	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 10:33:58.171695	2015-12-21 10:33:58.171695	Concejal	\N
1073	Dova, Mauricio	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 10:33:58.176407	2015-12-21 10:33:58.176407	Concejal	\N
1074	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 10:33:58.181117	2015-12-21 10:33:58.181117	Concejal	\N
1075	Perez Da Janoveira, Maria Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 10:33:58.185715	2015-12-21 10:33:58.185715	Concejal	\N
1076	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 10:33:58.190221	2015-12-21 10:33:58.190221	Concejal	\N
1077	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 10:33:58.194713	2015-12-21 10:33:58.194713	Concejal	\N
1078	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 10:39:10.270031	2015-12-21 10:39:10.270031	Concejal	\N
1079	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 10:39:10.275285	2015-12-21 10:39:10.275285	Concejal	\N
1080	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 10:39:10.279786	2015-12-21 10:39:10.279786	Concejal	\N
1081	Cabral, Maria del Carmen	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 10:39:10.284258	2015-12-21 10:39:10.284258	Concejal	\N
1082	Perez Da Janoveira, Maria Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 10:39:10.288726	2015-12-21 10:39:10.288726	Concejal	\N
1083	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 10:39:10.292933	2015-12-21 10:39:10.292933	Concejal	\N
1084	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 10:39:10.297201	2015-12-21 10:39:10.297201	Concejal	\N
1085	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 10:45:42.632158	2015-12-21 10:45:42.632158	Concejal	\N
1086	Sirolesi, Silvia	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 10:45:42.637271	2015-12-21 10:45:42.637271	Concejal	\N
1087	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 10:45:42.641827	2015-12-21 10:45:42.641827	Concejal	\N
1088	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 10:45:42.64634	2015-12-21 10:45:42.64634	Concejal	\N
1089	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 10:45:42.650927	2015-12-21 10:45:42.650927	Concejal	\N
1090	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 10:45:42.655423	2015-12-21 10:45:42.655423	Concejal	\N
1091	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 10:45:42.659816	2015-12-21 10:45:42.659816	Concejal	\N
1092	Perez Da Janoveira, Maria Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 10:45:42.66426	2015-12-21 10:45:42.66426	Concejal	\N
1093	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 10:45:42.668505	2015-12-21 10:45:42.668505	Concejal	\N
1094	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 10:45:42.672719	2015-12-21 10:45:42.672719	Concejal	\N
1095	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 10:48:32.273989	2015-12-21 10:48:32.273989	Concejal	\N
1096	Cabral, Maria del Carmen	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 10:48:32.279222	2015-12-21 10:48:32.279222	Concejal	\N
1097	Da Costa, Osvaldo	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 10:48:32.283851	2015-12-21 10:48:32.283851	Concejal	\N
1098	Scoppa, Eduardo Juan	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 10:48:32.288515	2015-12-21 10:48:32.288515	Concejal	\N
1099	Perez Da Janoveira, Maria Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 10:48:32.29304	2015-12-21 10:48:32.29304	Concejal	\N
1116	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 11:01:52.237867	2015-12-21 11:01:52.237867	Concejal	\N
1117	Sirolesi, Silvia	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 11:01:52.243182	2015-12-21 11:01:52.243182	Concejal	\N
1118	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 11:01:52.247723	2015-12-21 11:01:52.247723	Concejal	\N
1119	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 11:01:52.252247	2015-12-21 11:01:52.252247	Concejal	\N
1120	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 11:01:52.256592	2015-12-21 11:01:52.256592	Concejal	\N
1121	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 11:01:52.260847	2015-12-21 11:01:52.260847	Concejal	\N
1122	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 11:01:52.264992	2015-12-21 11:01:52.264992	Concejal	\N
1123	Perez Da Janoveira, Maria Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 11:01:52.269066	2015-12-21 11:01:52.269066	Concejal	\N
1124	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 11:01:52.273048	2015-12-21 11:01:52.273048	Concejal	\N
1125	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 11:01:52.277125	2015-12-21 11:01:52.277125	Concejal	\N
1100	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 10:53:24.953589	2015-12-21 10:53:24.953589	Concejal	\N
1101	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 10:53:24.958661	2015-12-21 10:53:24.958661	Concejal	\N
1102	Sirolesi, Silvia	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 10:53:24.963127	2015-12-21 10:53:24.963127	Concejal	\N
1103	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 10:53:24.967627	2015-12-21 10:53:24.967627	Concejal	\N
1104	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 10:53:24.972073	2015-12-21 10:53:24.972073	Concejal	\N
1105	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 10:53:24.976432	2015-12-21 10:53:24.976432	Concejal	\N
1106	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 10:53:24.980761	2015-12-21 10:53:24.980761	Concejal	\N
1107	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 10:53:24.985013	2015-12-21 10:53:24.985013	Concejal	\N
1108	Perez Da Janoveira, Maria Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 10:53:24.989175	2015-12-21 10:53:24.989175	Concejal	\N
1109	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 10:53:24.993397	2015-12-21 10:53:24.993397	Concejal	\N
1110	Carranza, Martin	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 10:57:02.253415	2015-12-21 10:57:02.253415	Concejal	\N
1111	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 10:57:02.258563	2015-12-21 10:57:02.258563	Concejal	\N
1112	Cabral, Maria del Carmen	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 10:57:02.263164	2015-12-21 10:57:02.263164	Concejal	\N
1113	Yawni, Viviana Andrea	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 10:57:02.267768	2015-12-21 10:57:02.267768	Concejal	\N
1114	Da Costa, Osvaldo	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 10:57:02.272262	2015-12-21 10:57:02.272262	Concejal	\N
1115	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 10:57:02.276631	2015-12-21 10:57:02.276631	Concejal	\N
1126	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 11:34:18.816711	2015-12-21 11:34:18.816711	Concejal	\N
1127	Sirolesi, Silvia	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 11:34:18.82201	2015-12-21 11:34:18.82201	Concejal	\N
1128	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 11:34:18.826614	2015-12-21 11:34:18.826614	Concejal	\N
1129	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 11:34:18.831167	2015-12-21 11:34:18.831167	Concejal	\N
1130	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 11:34:18.8357	2015-12-21 11:34:18.8357	Concejal	\N
1131	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 11:34:18.840133	2015-12-21 11:34:18.840133	Concejal	\N
1132	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 11:34:18.844487	2015-12-21 11:34:18.844487	Concejal	\N
1133	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 11:34:18.848687	2015-12-21 11:34:18.848687	Concejal	\N
1134	Perez Da Janoveira, Maria Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 11:34:18.852914	2015-12-21 11:34:18.852914	Concejal	\N
1135	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 11:34:18.85707	2015-12-21 11:34:18.85707	Concejal	\N
1136	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 11:54:52.856138	2015-12-21 11:54:52.856138	Concejal	\N
1137	Sirolesi, Silvia	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 11:54:52.861494	2015-12-21 11:54:52.861494	Concejal	\N
1138	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 11:54:52.866184	2015-12-21 11:54:52.866184	Concejal	\N
1139	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 11:54:52.870872	2015-12-21 11:54:52.870872	Concejal	\N
1140	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 11:54:52.888728	2015-12-21 11:54:52.888728	Concejal	\N
1141	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 11:54:52.893108	2015-12-21 11:54:52.893108	Concejal	\N
1142	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 11:54:52.897506	2015-12-21 11:54:52.897506	Concejal	\N
1143	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 11:54:52.90169	2015-12-21 11:54:52.90169	Concejal	\N
1144	Perez Da Janoveira, Maria Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 11:54:52.905837	2015-12-21 11:54:52.905837	Concejal	\N
1145	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 11:54:52.909922	2015-12-21 11:54:52.909922	Concejal	\N
1146	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 12:00:59.383303	2015-12-21 12:00:59.383303	Concejal	\N
1147	Sirolesi, Silvia	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 12:00:59.388415	2015-12-21 12:00:59.388415	Concejal	\N
1148	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 12:00:59.393056	2015-12-21 12:00:59.393056	Concejal	\N
1149	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 12:00:59.397617	2015-12-21 12:00:59.397617	Concejal	\N
1150	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 12:00:59.402198	2015-12-21 12:00:59.402198	Concejal	\N
1151	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 12:00:59.406655	2015-12-21 12:00:59.406655	Concejal	\N
1152	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 12:00:59.410989	2015-12-21 12:00:59.410989	Concejal	\N
1153	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 12:00:59.415313	2015-12-21 12:00:59.415313	Concejal	\N
1154	Perez Da Janoveira, Maria Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 12:00:59.419629	2015-12-21 12:00:59.419629	Concejal	\N
1155	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 12:00:59.424025	2015-12-21 12:00:59.424025	Concejal	\N
1156	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 12:05:31.601279	2015-12-21 12:05:31.601279	Concejal	\N
1157	Scoppa, Eduardo Juan	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 12:05:31.607218	2015-12-21 12:05:31.607218	Concejal	\N
1158	Cabral, Maria del Carmen	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 12:05:31.612245	2015-12-21 12:05:31.612245	Concejal	\N
1159	Perez Da Janoveira, Maria Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 12:05:31.617151	2015-12-21 12:05:31.617151	Concejal	\N
1160	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 12:10:01.407601	2015-12-21 12:10:01.407601	Concejal	\N
1161	Sirolesi, Silvia	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 12:10:01.412986	2015-12-21 12:10:01.412986	Concejal	\N
1162	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 12:10:01.417491	2015-12-21 12:10:01.417491	Concejal	\N
1163	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 12:10:01.421886	2015-12-21 12:10:01.421886	Concejal	\N
1164	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 12:10:01.426241	2015-12-21 12:10:01.426241	Concejal	\N
1165	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 12:10:01.430862	2015-12-21 12:10:01.430862	Concejal	\N
1166	Perez Da Janoveira, Maria Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 12:10:01.436143	2015-12-21 12:10:01.436143	Concejal	\N
1167	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 12:10:01.441271	2015-12-21 12:10:01.441271	Concejal	\N
1168	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 12:10:01.446338	2015-12-21 12:10:01.446338	Concejal	\N
1169	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 12:10:01.451318	2015-12-21 12:10:01.451318	Concejal	\N
1170	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 12:15:25.165745	2015-12-21 12:15:25.165745	Concejal	\N
1171	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 12:15:25.171304	2015-12-21 12:15:25.171304	Concejal	\N
1172	Sirolesi, Silvia	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 12:15:25.176308	2015-12-21 12:15:25.176308	Concejal	\N
1173	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 12:15:25.181114	2015-12-21 12:15:25.181114	Concejal	\N
1174	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 12:15:25.185528	2015-12-21 12:15:25.185528	Concejal	\N
1175	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 12:15:25.190012	2015-12-21 12:15:25.190012	Concejal	\N
1176	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 12:15:25.194417	2015-12-21 12:15:25.194417	Concejal	\N
1177	Perez Da Janoveira, Maria Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 12:15:25.198978	2015-12-21 12:15:25.198978	Concejal	\N
1178	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 12:15:25.20321	2015-12-21 12:15:25.20321	Concejal	\N
1179	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 12:20:54.660195	2015-12-21 12:20:54.660195	Concejal	\N
1180	Sirolesi, Silvia	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 12:20:54.665296	2015-12-21 12:20:54.665296	Concejal	\N
1181	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 12:20:54.669851	2015-12-21 12:20:54.669851	Concejal	\N
1182	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 12:20:54.674443	2015-12-21 12:20:54.674443	Concejal	\N
1183	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 12:20:54.679009	2015-12-21 12:20:54.679009	Concejal	\N
1184	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 12:20:54.68379	2015-12-21 12:20:54.68379	Concejal	\N
1185	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 12:20:54.688264	2015-12-21 12:20:54.688264	Concejal	\N
1186	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 12:20:54.692596	2015-12-21 12:20:54.692596	Concejal	\N
1187	Perez Da Janoveira, Maria Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 12:20:54.697023	2015-12-21 12:20:54.697023	Concejal	\N
1188	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 12:20:54.701433	2015-12-21 12:20:54.701433	Concejal	\N
1189	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 12:25:38.419578	2015-12-21 12:25:38.419578	Concejal	\N
1190	Sirolesi, Silvia	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 12:25:38.424664	2015-12-21 12:25:38.424664	Concejal	\N
1191	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 12:25:38.429328	2015-12-21 12:25:38.429328	Concejal	\N
1192	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 12:25:38.434127	2015-12-21 12:25:38.434127	Concejal	\N
1193	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 12:25:38.438928	2015-12-21 12:25:38.438928	Concejal	\N
1194	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 12:25:38.443679	2015-12-21 12:25:38.443679	Concejal	\N
1195	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 12:33:07.127294	2015-12-21 12:33:07.127294	Concejal	\N
1196	Sirolesi, Silvia	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 12:33:07.132359	2015-12-21 12:33:07.132359	Concejal	\N
1197	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 12:33:07.137005	2015-12-21 12:33:07.137005	Concejal	\N
1198	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 12:33:07.141585	2015-12-21 12:33:07.141585	Concejal	\N
1199	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 12:33:07.14619	2015-12-21 12:33:07.14619	Concejal	\N
1200	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 12:33:07.150705	2015-12-21 12:33:07.150705	Concejal	\N
1201	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 12:33:07.154961	2015-12-21 12:33:07.154961	Concejal	\N
1202	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 12:33:07.159053	2015-12-21 12:33:07.159053	Concejal	\N
1203	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 12:33:07.163383	2015-12-21 12:33:07.163383	Concejal	\N
1204	Perez Da Janoveira, Maria Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 12:33:07.167732	2015-12-21 12:33:07.167732	Concejal	\N
1228	Cabral, Maria del Carmen	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 11:14:28.368892	2015-12-22 11:14:28.368892	Concejal	\N
1229	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 11:14:28.374038	2015-12-22 11:14:28.374038	Concejal	\N
1230	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 11:14:28.378568	2015-12-22 11:14:28.378568	Concejal	\N
1231	Yawni, Viviana Andrea	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 11:14:28.383113	2015-12-22 11:14:28.383113	Concejal	\N
1232	Cabral, Maria del Carmen	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 11:17:44.158487	2015-12-22 11:17:44.158487	Concejal	\N
1233	Yawni, Viviana Andrea	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 11:17:44.163717	2015-12-22 11:17:44.163717	Concejal	\N
1234	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 11:17:44.168432	2015-12-22 11:17:44.168432	Concejal	\N
1235	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 11:17:44.173119	2015-12-22 11:17:44.173119	Concejal	\N
1240	Carranza, Martin	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 11:32:58.986745	2015-12-22 11:32:58.986745	Concejal	\N
1241	Cabral, Maria del Carmen	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 11:32:58.99193	2015-12-22 11:32:58.99193	Concejal	\N
1242	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 11:32:58.996605	2015-12-22 11:32:58.996605	Concejal	\N
1243	Scoppa, Eduardo Juan	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 11:32:59.001153	2015-12-22 11:32:59.001153	Concejal	\N
1244	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 11:32:59.005678	2015-12-22 11:32:59.005678	Concejal	\N
1250	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 11:45:10.564275	2015-12-22 11:45:10.564275	Concejal	\N
1251	Sirolesi, Silvia	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 11:45:10.56948	2015-12-22 11:45:10.56948	Concejal	\N
1252	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 11:45:10.574298	2015-12-22 11:45:10.574298	Concejal	\N
1253	Yawni, Viviana Andrea	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 11:45:10.578965	2015-12-22 11:45:10.578965	Concejal	\N
1254	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 11:45:10.583495	2015-12-22 11:45:10.583495	Concejal	\N
1255	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 11:48:11.874579	2015-12-22 11:48:11.874579	Concejal	\N
1256	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 11:48:11.879513	2015-12-22 11:48:11.879513	Concejal	\N
1257	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 11:48:11.883965	2015-12-22 11:48:11.883965	Concejal	\N
1258	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 11:48:11.888468	2015-12-22 11:48:11.888468	Concejal	\N
1259	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 11:53:56.643258	2015-12-22 11:53:56.643258	Concejal	\N
1260	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 11:53:56.648442	2015-12-22 11:53:56.648442	Concejal	\N
1261	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 11:53:56.653204	2015-12-22 11:53:56.653204	Concejal	\N
1262	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 11:53:56.658007	2015-12-22 11:53:56.658007	Concejal	\N
1263	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 12:11:48.206693	2015-12-22 12:11:48.206693	Concejal	\N
1264	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 12:11:48.211719	2015-12-22 12:11:48.211719	Concejal	\N
1265	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 12:11:48.216164	2015-12-22 12:11:48.216164	Concejal	\N
1266	Sirolesi, Silvia	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 12:11:48.220685	2015-12-22 12:11:48.220685	Concejal	\N
1267	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 12:11:48.225142	2015-12-22 12:11:48.225142	Concejal	\N
1268	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 12:11:48.229636	2015-12-22 12:11:48.229636	Concejal	\N
1269	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 12:11:48.234074	2015-12-22 12:11:48.234074	Concejal	\N
1295	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 14:09:45.684956	2015-12-22 14:09:45.684956	Concejal	\N
1296	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 14:09:45.690024	2015-12-22 14:09:45.690024	Concejal	\N
1297	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 14:09:45.69463	2015-12-22 14:09:45.69463	Concejal	\N
1298	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 14:09:45.69912	2015-12-22 14:09:45.69912	Concejal	\N
1299	Perez Da Janoveira, Maria Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 14:09:45.703557	2015-12-22 14:09:45.703557	Concejal	\N
1205	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 12:37:35.286468	2015-12-21 12:37:35.286468	Concejal	\N
1206	Sirolesi, Silvia	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 12:37:35.291564	2015-12-21 12:37:35.291564	Concejal	\N
1207	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 12:37:35.296072	2015-12-21 12:37:35.296072	Concejal	\N
1208	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 12:37:35.300586	2015-12-21 12:37:35.300586	Concejal	\N
1209	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 12:37:35.305018	2015-12-21 12:37:35.305018	Concejal	\N
1210	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 12:37:35.309462	2015-12-21 12:37:35.309462	Concejal	\N
1211	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 12:37:35.313976	2015-12-21 12:37:35.313976	Concejal	\N
1212	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 12:37:35.318484	2015-12-21 12:37:35.318484	Concejal	\N
1213	Perez Da Janoveira, Maria Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 12:37:35.322844	2015-12-21 12:37:35.322844	Concejal	\N
1214	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 12:37:35.327343	2015-12-21 12:37:35.327343	Concejal	\N
1215	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 12:42:46.659372	2015-12-21 12:42:46.659372	Concejal	\N
1216	Sirolesi, Silvia	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 12:42:46.664362	2015-12-21 12:42:46.664362	Concejal	\N
1217	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 12:42:46.668841	2015-12-21 12:42:46.668841	Concejal	\N
1218	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 12:42:46.673302	2015-12-21 12:42:46.673302	Concejal	\N
1219	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 12:42:46.677628	2015-12-21 12:42:46.677628	Concejal	\N
1220	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 12:42:46.681973	2015-12-21 12:42:46.681973	Concejal	\N
1221	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 12:42:46.686253	2015-12-21 12:42:46.686253	Concejal	\N
1222	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 12:42:46.690561	2015-12-21 12:42:46.690561	Concejal	\N
1223	Perez Da Janoveira, Maria Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 12:42:46.694879	2015-12-21 12:42:46.694879	Concejal	\N
1224	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 12:42:46.699162	2015-12-21 12:42:46.699162	Concejal	\N
1225	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 12:50:41.249696	2015-12-21 12:50:41.249696	Concejal	\N
1226	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 12:50:41.254948	2015-12-21 12:50:41.254948	Concejal	\N
1227	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-21 12:50:41.259664	2015-12-21 12:50:41.259664	Concejal	\N
1236	Scoppa, Eduardo Juan	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 11:19:49.297926	2015-12-22 11:19:49.297926	Concejal	\N
1237	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 11:19:49.302966	2015-12-22 11:19:49.302966	Concejal	\N
1238	Cabral, Maria del Carmen	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 11:19:49.307674	2015-12-22 11:19:49.307674	Concejal	\N
1239	Carranza, Martin	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 11:19:49.312165	2015-12-22 11:19:49.312165	Concejal	\N
1245	Carranza, Martin	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 11:42:22.638908	2015-12-22 11:42:22.638908	Concejal	\N
1246	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 11:42:22.64428	2015-12-22 11:42:22.64428	Concejal	\N
1247	Scoppa, Eduardo Juan	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 11:42:22.649121	2015-12-22 11:42:22.649121	Concejal	\N
1248	Cabral, Maria del Carmen	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 11:42:22.653775	2015-12-22 11:42:22.653775	Concejal	\N
1249	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 11:42:22.65837	2015-12-22 11:42:22.65837	Concejal	\N
1270	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 12:20:03.232195	2015-12-22 12:20:03.232195	Concejal	\N
1271	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 12:20:03.236947	2015-12-22 12:20:03.236947	Concejal	\N
1272	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 12:20:03.241197	2015-12-22 12:20:03.241197	Concejal	\N
1273	Sirolesi, Silvia	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 12:20:03.245377	2015-12-22 12:20:03.245377	Concejal	\N
1274	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 12:20:03.249427	2015-12-22 12:20:03.249427	Concejal	\N
1275	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 12:20:03.253485	2015-12-22 12:20:03.253485	Concejal	\N
1276	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 12:20:03.257521	2015-12-22 12:20:03.257521	Concejal	\N
1277	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 12:44:53.283735	2015-12-22 12:44:53.283735	Concejal	\N
1278	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 12:44:53.288934	2015-12-22 12:44:53.288934	Concejal	\N
1280	Sirolesi, Silvia	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 12:44:53.298158	2015-12-22 12:44:53.298158	Concejal	\N
1281	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 12:44:53.302578	2015-12-22 12:44:53.302578	Concejal	\N
1282	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 12:44:53.3071	2015-12-22 12:44:53.3071	Concejal	\N
1279	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 12:44:53.293578	2015-12-22 12:49:37.193387	Concejal	\N
1283	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 14:02:21.435992	2015-12-22 14:02:21.435992	Concejal	\N
1284	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 14:02:21.44092	2015-12-22 14:02:21.44092	Concejal	\N
1285	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 14:02:21.445228	2015-12-22 14:02:21.445228	Concejal	\N
1286	Sirolesi, Silvia	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 14:02:21.449516	2015-12-22 14:02:21.449516	Concejal	\N
1287	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 14:02:21.453862	2015-12-22 14:02:21.453862	Concejal	\N
1288	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 14:02:21.458132	2015-12-22 14:02:21.458132	Concejal	\N
1289	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 14:02:21.462359	2015-12-22 14:02:21.462359	Concejal	\N
1290	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 14:06:51.529238	2015-12-22 14:06:51.529238	Concejal	\N
1291	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 14:06:51.534498	2015-12-22 14:06:51.534498	Concejal	\N
1292	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 14:06:51.53919	2015-12-22 14:06:51.53919	Concejal	\N
1293	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 14:06:51.543665	2015-12-22 14:06:51.543665	Concejal	\N
1294	Perez Da Janoveira, Maria Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 14:06:51.548137	2015-12-22 14:06:51.548137	Concejal	\N
1300	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 14:12:50.563443	2015-12-22 14:12:50.563443	Concejal	\N
1301	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 14:12:50.56878	2015-12-22 14:12:50.56878	Concejal	\N
1302	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 14:12:50.573457	2015-12-22 14:12:50.573457	Concejal	\N
1303	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 14:12:50.578051	2015-12-22 14:12:50.578051	Concejal	\N
1304	Perez Da Janoveira, Maria Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 14:12:50.582391	2015-12-22 14:12:50.582391	Concejal	\N
1305	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 14:21:18.391383	2015-12-22 14:21:18.391383	Concejal	\N
1306	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 14:21:18.396508	2015-12-22 14:21:18.396508	Concejal	\N
1307	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 14:21:18.401157	2015-12-22 14:21:18.401157	Concejal	\N
1308	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 14:21:18.405721	2015-12-22 14:21:18.405721	Concejal	\N
1309	Perez Da Janoveira, Maria Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 14:21:18.410171	2015-12-22 14:21:18.410171	Concejal	\N
1310	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 14:26:17.258214	2015-12-22 14:26:17.258214	Concejal	\N
1311	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 14:26:17.26371	2015-12-22 14:26:17.26371	Concejal	\N
1312	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 14:26:17.268361	2015-12-22 14:26:17.268361	Concejal	\N
1313	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 14:26:17.273017	2015-12-22 14:26:17.273017	Concejal	\N
1314	Perez Da Janoveira, Maria Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 14:26:17.277498	2015-12-22 14:26:17.277498	Concejal	\N
1315	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 14:37:08.259286	2015-12-22 14:37:08.259286	Concejal	\N
1316	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 14:37:08.264419	2015-12-22 14:37:08.264419	Concejal	\N
1317	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 14:37:08.269056	2015-12-22 14:37:08.269056	Concejal	\N
1318	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 14:37:08.273584	2015-12-22 14:37:08.273584	Concejal	\N
1319	Perez Da Janoveira, Maria Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 14:37:08.27803	2015-12-22 14:37:08.27803	Concejal	\N
1320	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 14:42:34.537806	2015-12-22 14:42:34.537806	Concejal	\N
1321	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 14:42:34.542924	2015-12-22 14:42:34.542924	Concejal	\N
1322	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 14:42:34.547528	2015-12-22 14:42:34.547528	Concejal	\N
1323	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 14:42:34.551987	2015-12-22 14:42:34.551987	Concejal	\N
1324	Perez Da Janoveira, Maria Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-22 14:42:34.556499	2015-12-22 14:42:34.556499	Concejal	\N
1325	Carranza, Martin	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-28 13:58:07.161979	2015-12-28 13:58:07.161979	Concejal	\N
1326	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-28 13:58:07.1672	2015-12-28 13:58:07.1672	Concejal	\N
1327	Sirolesi, Silvia	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-28 13:58:07.1719	2015-12-28 13:58:07.1719	Concejal	\N
1328	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-28 13:58:07.176417	2015-12-28 13:58:07.176417	Concejal	\N
1329	Cabral, Maria del Carmen	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-28 15:14:46.646191	2015-12-28 15:14:46.646191	Concejal	\N
1330	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-28 15:14:46.651572	2015-12-28 15:14:46.651572	Concejal	\N
1331	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-28 15:14:46.656268	2015-12-28 15:14:46.656268	Concejal	\N
1332	Yawni, Viviana Andrea	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-28 15:14:46.66088	2015-12-28 15:14:46.66088	Concejal	\N
1333	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-28 15:35:18.881839	2015-12-28 15:35:18.881839	Concejal	\N
1334	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-28 15:35:18.88696	2015-12-28 15:35:18.88696	Concejal	\N
1335	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-28 15:35:18.891626	2015-12-28 15:35:18.891626	Concejal	\N
1336	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-28 15:35:18.896151	2015-12-28 15:35:18.896151	Concejal	\N
1345	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-29 11:04:47.884637	2015-12-29 11:04:47.884637	Concejal	\N
1346	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-29 11:04:47.889751	2015-12-29 11:04:47.889751	Concejal	\N
1347	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-29 11:04:47.894325	2015-12-29 11:04:47.894325	Concejal	\N
1348	Cabral, Maria del Carmen	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-29 11:04:47.898879	2015-12-29 11:04:47.898879	Concejal	\N
1349	Yawni, Viviana Andrea	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-29 11:04:47.903391	2015-12-29 11:04:47.903391	Concejal	\N
1350	Sirolesi, Silvia	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-29 11:04:47.907851	2015-12-29 11:04:47.907851	Concejal	\N
1351	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-29 11:04:47.912247	2015-12-29 11:04:47.912247	Concejal	\N
1352	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-29 11:27:51.364255	2015-12-29 11:27:51.364255	Concejal	\N
1353	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-29 11:27:51.369496	2015-12-29 11:27:51.369496	Concejal	\N
1354	Yawni, Viviana Andrea	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-29 11:27:51.374116	2015-12-29 11:27:51.374116	Concejal	\N
1355	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-29 11:27:51.378614	2015-12-29 11:27:51.378614	Concejal	\N
1356	Cabral, Maria del Carmen	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-29 11:27:51.383173	2015-12-29 11:27:51.383173	Concejal	\N
1357	Sirolesi, Silvia	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-29 11:27:51.387657	2015-12-29 11:27:51.387657	Concejal	\N
1358	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-29 11:32:17.597522	2015-12-29 11:32:17.597522	Concejal	\N
1359	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-29 11:32:17.602667	2015-12-29 11:32:17.602667	Concejal	\N
1360	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-29 11:32:17.607392	2015-12-29 11:32:17.607392	Concejal	\N
1361	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-29 11:32:17.611972	2015-12-29 11:32:17.611972	Concejal	\N
1362	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-29 11:42:46.106453	2015-12-29 11:42:46.106453	Concejal	\N
1363	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-29 11:42:46.111814	2015-12-29 11:42:46.111814	Concejal	\N
1364	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-29 11:42:46.116511	2015-12-29 11:42:46.116511	Concejal	\N
1365	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-29 11:42:46.121167	2015-12-29 11:42:46.121167	Concejal	\N
1370	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-29 12:07:16.724454	2015-12-29 12:07:16.724454	Concejal	\N
1371	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-29 12:07:16.729688	2015-12-29 12:07:16.729688	Concejal	\N
1372	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-29 12:07:16.734222	2015-12-29 12:07:16.734222	Concejal	\N
1373	Sirolesi, Silvia	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-29 12:07:16.738717	2015-12-29 12:07:16.738717	Concejal	\N
1374	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-29 12:07:16.743305	2015-12-29 12:07:16.743305	Concejal	\N
1375	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-29 12:07:16.747791	2015-12-29 12:07:16.747791	Concejal	\N
1376	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-29 12:07:16.752189	2015-12-29 12:07:16.752189	Concejal	\N
1377	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-29 12:07:16.756596	2015-12-29 12:07:16.756596	Concejal	\N
1378	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-29 12:07:16.760892	2015-12-29 12:07:16.760892	Concejal	\N
1379	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-29 12:19:55.450537	2015-12-29 12:19:55.450537	Concejal	\N
1380	Sirolesi, Silvia	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-29 12:19:55.455674	2015-12-29 12:19:55.455674	Concejal	\N
1381	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-29 12:19:55.460212	2015-12-29 12:19:55.460212	Concejal	\N
1382	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-29 12:19:55.464729	2015-12-29 12:19:55.464729	Concejal	\N
1383	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-29 12:19:55.469237	2015-12-29 12:19:55.469237	Concejal	\N
1384	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-29 12:19:55.473598	2015-12-29 12:19:55.473598	Concejal	\N
1385	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-29 12:19:55.47803	2015-12-29 12:19:55.47803	Concejal	\N
1386	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-29 12:19:55.48251	2015-12-29 12:19:55.48251	Concejal	\N
1387	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-29 12:19:55.486993	2015-12-29 12:19:55.486993	Concejal	\N
1397	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-29 12:37:10.796632	2015-12-29 12:37:10.796632	Concejal	\N
1398	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-29 12:37:10.801709	2015-12-29 12:37:10.801709	Concejal	\N
1399	Sirolesi, Silvia	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-29 12:37:10.806303	2015-12-29 12:37:10.806303	Concejal	\N
1400	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-29 12:37:10.810749	2015-12-29 12:37:10.810749	Concejal	\N
1401	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-29 12:37:10.815246	2015-12-29 12:37:10.815246	Concejal	\N
1402	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-29 12:37:10.81967	2015-12-29 12:37:10.81967	Concejal	\N
1403	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-29 12:37:10.82416	2015-12-29 12:37:10.82416	Concejal	\N
1404	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-29 12:37:10.828547	2015-12-29 12:37:10.828547	Concejal	\N
1405	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-29 12:37:10.832726	2015-12-29 12:37:10.832726	Concejal	\N
1406	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-29 12:42:29.897686	2015-12-29 12:42:29.897686	Concejal	\N
1407	Cabral, Maria del Carmen	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-29 12:42:29.902836	2015-12-29 12:42:29.902836	Concejal	\N
1408	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-29 12:42:29.907306	2015-12-29 12:42:29.907306	Concejal	\N
1409	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-29 12:42:29.91175	2015-12-29 12:42:29.91175	Concejal	\N
1410	Sirolesi, Silvia	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-29 12:42:29.916205	2015-12-29 12:42:29.916205	Concejal	\N
1411	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-29 12:42:29.920529	2015-12-29 12:42:29.920529	Concejal	\N
1412	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-29 13:02:06.955405	2015-12-29 13:02:06.955405	Concejal	\N
1413	Sirolesi, Silvia	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-29 13:02:06.960551	2015-12-29 13:02:06.960551	Concejal	\N
1414	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-29 13:02:06.965247	2015-12-29 13:02:06.965247	Concejal	\N
1415	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-29 13:02:06.969752	2015-12-29 13:02:06.969752	Concejal	\N
1416	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-29 13:02:06.974208	2015-12-29 13:02:06.974208	Concejal	\N
1417	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-29 13:02:06.978518	2015-12-29 13:02:06.978518	Concejal	\N
1418	Cabral, Maria del Carmen	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-08 16:29:26.891841	2016-03-08 16:29:26.891841	Concejal	\N
1419	Yawni, Viviana Andrea	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-08 16:29:26.895205	2016-03-08 16:29:26.895205	Concejal	\N
1420	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-08 16:29:26.898051	2016-03-08 16:29:26.898051	Concejal	\N
1421	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-08 16:29:26.901022	2016-03-08 16:29:26.901022	Concejal	\N
1426	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-09 11:00:39.389037	2016-03-09 11:00:39.389037	Concejal	\N
1427	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-09 11:00:39.393804	2016-03-09 11:00:39.393804	Concejal	\N
1428	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-09 11:00:39.397758	2016-03-09 11:00:39.397758	Concejal	\N
1429	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-09 11:00:39.401735	2016-03-09 11:00:39.401735	Concejal	\N
1430	Perez Da Janoveira, Maria Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-09 11:00:39.405609	2016-03-09 11:00:39.405609	Concejal	\N
1431	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-09 11:22:49.132412	2016-03-09 11:22:49.132412	Concejal	\N
1432	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-09 11:22:49.135829	2016-03-09 11:22:49.135829	Concejal	\N
1433	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-09 11:22:49.13903	2016-03-09 11:22:49.13903	Concejal	\N
1434	Perez Da Janoveira, Maria Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-09 11:22:49.142031	2016-03-09 11:22:49.142031	Concejal	\N
1460	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 11:02:36.410011	2016-03-10 11:02:36.410011	Concejal	\N
1337	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-28 15:38:13.524664	2015-12-28 15:38:13.524664	Concejal	\N
1338	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-28 15:38:13.530026	2015-12-28 15:38:13.530026	Concejal	\N
1339	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-28 15:38:13.534635	2015-12-28 15:38:13.534635	Concejal	\N
1340	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-28 15:38:13.539303	2015-12-28 15:38:13.539303	Concejal	\N
1341	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-28 15:42:29.485417	2015-12-28 15:42:29.485417	Concejal	\N
1342	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-28 15:42:29.490677	2015-12-28 15:42:29.490677	Concejal	\N
1343	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-28 15:42:29.495329	2015-12-28 15:42:29.495329	Concejal	\N
1344	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-28 15:42:29.499994	2015-12-28 15:42:29.499994	Concejal	\N
1366	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-29 11:51:05.311132	2015-12-29 11:51:05.311132	Concejal	\N
1367	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-29 11:51:05.316309	2015-12-29 11:51:05.316309	Concejal	\N
1368	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-29 11:51:05.320939	2015-12-29 11:51:05.320939	Concejal	\N
1369	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-29 11:51:05.32553	2015-12-29 11:51:05.32553	Concejal	\N
1388	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-29 12:23:58.125112	2015-12-29 12:23:58.125112	Concejal	\N
1389	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-29 12:23:58.130137	2015-12-29 12:23:58.130137	Concejal	\N
1390	Sirolesi, Silvia	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-29 12:23:58.134618	2015-12-29 12:23:58.134618	Concejal	\N
1391	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-29 12:23:58.139009	2015-12-29 12:23:58.139009	Concejal	\N
1392	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-29 12:23:58.143366	2015-12-29 12:23:58.143366	Concejal	\N
1393	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-29 12:23:58.147513	2015-12-29 12:23:58.147513	Concejal	\N
1394	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-29 12:23:58.15173	2015-12-29 12:23:58.15173	Concejal	\N
1395	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-29 12:23:58.155798	2015-12-29 12:23:58.155798	Concejal	\N
1396	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2015-12-29 12:23:58.159781	2015-12-29 12:23:58.159781	Concejal	\N
1422	Cabral, Maria del Carmen	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-08 16:32:07.080364	2016-03-08 16:32:07.080364	Concejal	\N
1423	Yawni, Viviana Andrea	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-08 16:32:07.08398	2016-03-08 16:32:07.08398	Concejal	\N
1424	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-08 16:32:07.087083	2016-03-08 16:32:07.087083	Concejal	\N
1425	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-08 16:32:07.090157	2016-03-08 16:32:07.090157	Concejal	\N
1435	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 10:49:05.275562	2016-03-10 10:49:05.275562	Concejal	\N
1436	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 10:49:05.278972	2016-03-10 10:49:05.278972	Concejal	\N
1437	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 10:49:05.282087	2016-03-10 10:49:05.282087	Concejal	\N
1438	Perez Da Janoveira, Maria Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 10:49:05.285317	2016-03-10 10:49:05.285317	Concejal	\N
1439	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 10:49:05.288695	2016-03-10 10:49:05.288695	Concejal	\N
1440	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 10:49:05.291894	2016-03-10 10:49:05.291894	Concejal	\N
1441	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 10:49:05.294828	2016-03-10 10:49:05.294828	Concejal	\N
1442	Dova, Mauricio	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 10:49:05.297715	2016-03-10 10:49:05.297715	Concejal	\N
1443	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 10:51:53.685185	2016-03-10 10:51:53.685185	Concejal	\N
1444	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 10:51:53.688544	2016-03-10 10:51:53.688544	Concejal	\N
1445	Dova, Mauricio	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 10:51:53.691579	2016-03-10 10:51:53.691579	Concejal	\N
1446	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 10:51:53.694631	2016-03-10 10:51:53.694631	Concejal	\N
1447	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 10:51:53.697513	2016-03-10 10:51:53.697513	Concejal	\N
1448	Dova, Mauricio	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 10:56:19.688508	2016-03-10 10:56:19.688508	Concejal	\N
1449	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 10:56:19.691754	2016-03-10 10:56:19.691754	Concejal	\N
1450	Perez Da Janoveira, Maria Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 10:56:19.694554	2016-03-10 10:56:19.694554	Concejal	\N
1451	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 10:56:19.697278	2016-03-10 10:56:19.697278	Concejal	\N
1452	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 10:56:19.700146	2016-03-10 10:56:19.700146	Concejal	\N
1453	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 10:56:19.702957	2016-03-10 10:56:19.702957	Concejal	\N
1454	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 10:56:19.705679	2016-03-10 10:56:19.705679	Concejal	\N
1455	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 10:56:19.70827	2016-03-10 10:56:19.70827	Concejal	\N
1456	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 10:56:19.711342	2016-03-10 10:56:19.711342	Concejal	\N
1457	Sirolesi, Silvia	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 10:56:19.714184	2016-03-10 10:56:19.714184	Concejal	\N
1458	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 10:56:19.716991	2016-03-10 10:56:19.716991	Concejal	\N
1459	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 10:56:19.719767	2016-03-10 10:56:19.719767	Concejal	\N
1472	Dova, Mauricio	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 11:08:20.51329	2016-03-10 11:08:20.51329	Concejal	\N
1473	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 11:08:20.516615	2016-03-10 11:08:20.516615	Concejal	\N
1474	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 11:08:20.51945	2016-03-10 11:08:20.51945	Concejal	\N
1475	Perez Da Janoveira, Maria Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 11:08:20.522262	2016-03-10 11:08:20.522262	Concejal	\N
1476	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 11:08:20.525072	2016-03-10 11:08:20.525072	Concejal	\N
1477	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 11:08:20.527765	2016-03-10 11:08:20.527765	Concejal	\N
1478	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 11:08:20.530387	2016-03-10 11:08:20.530387	Concejal	\N
1479	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 11:08:20.532975	2016-03-10 11:08:20.532975	Concejal	\N
1480	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 11:08:20.535537	2016-03-10 11:08:20.535537	Concejal	\N
1481	Sirolesi, Silvia	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 11:08:20.538143	2016-03-10 11:08:20.538143	Concejal	\N
1482	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 11:08:20.540853	2016-03-10 11:08:20.540853	Concejal	\N
1461	Dova, Mauricio	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 11:02:36.41352	2016-03-10 11:02:36.41352	Concejal	\N
1462	Perez Da Janoveira, Maria Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 11:02:36.427115	2016-03-10 11:02:36.427115	Concejal	\N
1463	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 11:02:36.430064	2016-03-10 11:02:36.430064	Concejal	\N
1464	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 11:02:36.433147	2016-03-10 11:02:36.433147	Concejal	\N
1465	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 11:02:36.439796	2016-03-10 11:02:36.439796	Concejal	\N
1466	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 11:02:36.442926	2016-03-10 11:02:36.442926	Concejal	\N
1467	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 11:02:36.44582	2016-03-10 11:02:36.44582	Concejal	\N
1468	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 11:02:36.448517	2016-03-10 11:02:36.448517	Concejal	\N
1469	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 11:02:36.451142	2016-03-10 11:02:36.451142	Concejal	\N
1470	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 11:02:36.453807	2016-03-10 11:02:36.453807	Concejal	\N
1471	Sirolesi, Silvia	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 11:02:36.456422	2016-03-10 11:02:36.456422	Concejal	\N
1483	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 11:11:14.125225	2016-03-10 11:11:14.125225	Concejal	\N
1484	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 11:11:14.128257	2016-03-10 11:11:14.128257	Concejal	\N
1485	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 11:11:14.130967	2016-03-10 11:11:14.130967	Concejal	\N
1486	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 11:11:14.133657	2016-03-10 11:11:14.133657	Concejal	\N
1487	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 11:13:23.447367	2016-03-10 11:13:23.447367	Concejal	\N
1488	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 11:13:23.450768	2016-03-10 11:13:23.450768	Concejal	\N
1489	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 11:13:23.453628	2016-03-10 11:13:23.453628	Concejal	\N
1490	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 11:13:23.456486	2016-03-10 11:13:23.456486	Concejal	\N
1491	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 11:16:05.821743	2016-03-10 11:16:05.821743	Concejal	\N
1492	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 11:16:05.824779	2016-03-10 11:16:05.824779	Concejal	\N
1493	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 11:16:05.827608	2016-03-10 11:16:05.827608	Concejal	\N
1494	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 11:16:05.830401	2016-03-10 11:16:05.830401	Concejal	\N
1495	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 11:18:26.742939	2016-03-10 11:18:26.742939	Concejal	\N
1496	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 11:18:26.7461	2016-03-10 11:18:26.7461	Concejal	\N
1497	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 11:18:26.748949	2016-03-10 11:18:26.748949	Concejal	\N
1498	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 11:18:26.751792	2016-03-10 11:18:26.751792	Concejal	\N
1499	Perez Da Janoveira, Maria Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 11:18:26.754483	2016-03-10 11:18:26.754483	Concejal	\N
1500	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 11:54:40.408374	2016-03-10 11:54:40.408374	Concejal	\N
1501	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 11:54:40.411872	2016-03-10 11:54:40.411872	Concejal	\N
1502	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 11:54:40.414722	2016-03-10 11:54:40.414722	Concejal	\N
1503	Perez Da Janoveira, Maria Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 11:54:40.417483	2016-03-10 11:54:40.417483	Concejal	\N
1504	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 11:54:40.420267	2016-03-10 11:54:40.420267	Concejal	\N
1505	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 11:58:58.711346	2016-03-10 11:58:58.711346	Concejal	\N
1506	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 11:58:58.714485	2016-03-10 11:58:58.714485	Concejal	\N
1507	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 11:58:58.717154	2016-03-10 11:58:58.717154	Concejal	\N
1508	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 11:58:58.732246	2016-03-10 11:58:58.732246	Concejal	\N
1509	Perez Da Janoveira, Maria Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 11:58:58.73512	2016-03-10 11:58:58.73512	Concejal	\N
1510	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 12:13:30.479629	2016-03-10 12:13:30.479629	Concejal	\N
1511	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 12:13:30.48329	2016-03-10 12:13:30.48329	Concejal	\N
1512	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 12:13:30.486419	2016-03-10 12:13:30.486419	Concejal	\N
1513	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 12:13:30.489301	2016-03-10 12:13:30.489301	Concejal	\N
1514	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 12:17:26.543094	2016-03-10 12:17:26.543094	Concejal	\N
1515	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 12:17:26.546287	2016-03-10 12:17:26.546287	Concejal	\N
1516	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 12:17:26.549257	2016-03-10 12:17:26.549257	Concejal	\N
1517	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 12:17:26.552204	2016-03-10 12:17:26.552204	Concejal	\N
1518	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 12:21:23.194217	2016-03-10 12:21:23.194217	Concejal	\N
1519	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 12:21:23.197406	2016-03-10 12:21:23.197406	Concejal	\N
1520	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 12:21:23.200268	2016-03-10 12:21:23.200268	Concejal	\N
1521	Perez Da Janoveira, Maria Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 12:21:23.20302	2016-03-10 12:21:23.20302	Concejal	\N
1522	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 12:21:23.205819	2016-03-10 12:21:23.205819	Concejal	\N
1523	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 12:26:57.13268	2016-03-10 12:26:57.13268	Concejal	\N
1524	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 12:26:57.135968	2016-03-10 12:26:57.135968	Concejal	\N
1525	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 12:26:57.138892	2016-03-10 12:26:57.138892	Concejal	\N
1526	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 12:26:57.141805	2016-03-10 12:26:57.141805	Concejal	\N
1527	Perez Da Janoveira, Maria Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 12:26:57.144586	2016-03-10 12:26:57.144586	Concejal	\N
1528	Benedetto, Humberto	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 14:55:38.414264	2016-03-10 14:55:38.414264	Concejal	\N
1529	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 14:55:38.4173	2016-03-10 14:55:38.4173	Concejal	\N
1530	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 14:55:38.419984	2016-03-10 14:55:38.419984	Concejal	\N
1531	Perez Da Janoveira, Maria Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-10 14:55:38.435062	2016-03-10 14:55:38.435062	Concejal	\N
1532	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-16 13:32:59.978715	2016-03-16 13:32:59.978715	Concejal	\N
1533	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-16 13:32:59.982048	2016-03-16 13:32:59.982048	Concejal	\N
1534	Sirolesi, Silvia	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-16 13:32:59.985022	2016-03-16 13:32:59.985022	Concejal	\N
1535	Perez Da Janoveira, Maria Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-16 13:32:59.987955	2016-03-16 13:32:59.987955	Concejal	\N
1536	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-16 13:32:59.990836	2016-03-16 13:32:59.990836	Concejal	\N
1537	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-16 13:32:59.993712	2016-03-16 13:32:59.993712	Concejal	\N
1538	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-16 13:53:16.097617	2016-03-16 13:53:16.097617	Concejal	\N
1539	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-16 13:53:16.100976	2016-03-16 13:53:16.100976	Concejal	\N
1540	Perez Da Janoveira, Maria Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-16 13:53:16.103552	2016-03-16 13:53:16.103552	Concejal	\N
1541	Sirolesi, Silvia	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-16 13:53:16.106149	2016-03-16 13:53:16.106149	Concejal	\N
1542	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-16 13:53:16.108981	2016-03-16 13:53:16.108981	Concejal	\N
1543	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-16 13:53:16.111942	2016-03-16 13:53:16.111942	Concejal	\N
1544	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-16 15:18:57.10802	2016-03-16 15:18:57.10802	Concejal	\N
1545	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-16 15:18:57.111158	2016-03-16 15:18:57.111158	Concejal	\N
1546	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-16 15:18:57.11394	2016-03-16 15:18:57.11394	Concejal	\N
1547	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-16 15:18:57.116998	2016-03-16 15:18:57.116998	Concejal	\N
1548	Sirolesi, Silvia	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-16 15:18:57.119898	2016-03-16 15:18:57.119898	Concejal	\N
1549	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-16 15:35:54.273396	2016-03-16 15:35:54.273396	Concejal	\N
1550	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-16 15:35:54.277681	2016-03-16 15:35:54.277681	Concejal	\N
1551	Sirolesi, Silvia	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-16 15:35:54.280908	2016-03-16 15:35:54.280908	Concejal	\N
1552	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-16 15:35:54.284047	2016-03-16 15:35:54.284047	Concejal	\N
1553	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-16 15:35:54.286813	2016-03-16 15:35:54.286813	Concejal	\N
1554	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-16 15:41:40.208808	2016-03-16 15:41:40.208808	Concejal	\N
1555	Cabral, Maria del Carmen	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-16 15:41:40.21217	2016-03-16 15:41:40.21217	Concejal	\N
1556	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-16 15:41:40.215061	2016-03-16 15:41:40.215061	Concejal	\N
1557	Da Costa, Osvaldo	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-16 15:41:40.241025	2016-03-16 15:41:40.241025	Concejal	\N
1571	Cabral, Maria del Carmen	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-22 15:52:41.584908	2016-03-22 15:52:41.584908	Concejal	\N
1572	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-22 15:52:41.58867	2016-03-22 15:52:41.58867	Concejal	\N
1573	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-22 15:52:41.592154	2016-03-22 15:52:41.592154	Concejal	\N
1574	Yawni, Viviana Andrea	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-22 15:52:41.595387	2016-03-22 15:52:41.595387	Concejal	\N
1575	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-30 14:11:34.211012	2016-03-30 14:11:34.211012	Concejal	\N
1576	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-30 14:11:34.214106	2016-03-30 14:11:34.214106	Concejal	\N
1578	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-30 14:11:34.219708	2016-03-30 14:11:34.219708	Concejal	\N
1579	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-30 14:11:34.222512	2016-03-30 14:11:34.222512	Concejal	\N
1580		\N	\N	\N	\N	\N	\N	\N	\N	2016-03-30 14:14:34.773187	2016-03-30 14:14:34.773187	Concejal	\N
1581	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-30 14:33:27.498359	2016-03-30 14:33:27.498359	Concejal	\N
1582	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-30 14:33:27.501531	2016-03-30 14:33:27.501531	Concejal	\N
1583	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-30 14:33:27.504346	2016-03-30 14:33:27.504346	Concejal	\N
1584	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-30 14:33:27.507094	2016-03-30 14:33:27.507094	Concejal	\N
1585	Perez Da Janoveira, Maria Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-30 14:33:27.509759	2016-03-30 14:33:27.509759	Concejal	\N
1586	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-30 14:41:59.835156	2016-03-30 14:41:59.835156	Concejal	\N
1587	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-30 14:41:59.838264	2016-03-30 14:41:59.838264	Concejal	\N
1588	Perez Da Janoveira, Maria Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-30 14:41:59.841024	2016-03-30 14:41:59.841024	Concejal	\N
1589	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-30 14:41:59.843772	2016-03-30 14:41:59.843772	Concejal	\N
1590	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-30 14:41:59.84648	2016-03-30 14:41:59.84648	Concejal	\N
1620	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-31 11:56:56.929371	2016-03-31 11:56:56.929371	Concejal	\N
1621	Cabral, Maria del Carmen	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-31 11:56:56.933345	2016-03-31 11:56:56.933345	Concejal	\N
1622	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-31 11:56:56.936796	2016-03-31 11:56:56.936796	Concejal	\N
1623	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-31 11:56:56.940171	2016-03-31 11:56:56.940171	Concejal	\N
1624	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-31 11:56:56.943415	2016-03-31 11:56:56.943415	Concejal	\N
1625	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-31 11:56:56.946665	2016-03-31 11:56:56.946665	Concejal	\N
1642	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-05 11:20:47.896591	2016-04-05 11:20:47.896591	Concejal	\N
1643	Sirolesi, Silvia	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-05 11:20:47.899808	2016-04-05 11:20:47.899808	Concejal	\N
1644	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-05 11:20:47.902639	2016-04-05 11:20:47.902639	Concejal	\N
1645	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-05 11:20:47.905453	2016-04-05 11:20:47.905453	Concejal	\N
1646	Dova, Mauricio	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-05 11:20:47.908164	2016-04-05 11:20:47.908164	Concejal	\N
1647	Gasó, Carlos	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-05 11:20:47.91099	2016-04-05 11:20:47.91099	Concejal	\N
1648	Perez Da Janoveira, Maria Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-05 11:20:47.91358	2016-04-05 11:20:47.91358	Concejal	\N
1649	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-05 11:20:47.916204	2016-04-05 11:20:47.916204	Concejal	\N
1650	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-05 11:20:47.919026	2016-04-05 11:20:47.919026	Concejal	\N
1651	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-05 11:20:47.921789	2016-04-05 11:20:47.921789	Concejal	\N
1652	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-05 11:20:47.924478	2016-04-05 11:20:47.924478	Concejal	\N
1653	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-05 11:26:35.077877	2016-04-05 11:26:35.077877	Concejal	\N
1654	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-05 11:26:35.08098	2016-04-05 11:26:35.08098	Concejal	\N
1655	Gasó, Carlos	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-05 11:26:35.083819	2016-04-05 11:26:35.083819	Concejal	\N
1656	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-05 11:26:35.086652	2016-04-05 11:26:35.086652	Concejal	\N
1657	Perez Da Janoveira, Maria Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-05 11:26:35.089395	2016-04-05 11:26:35.089395	Concejal	\N
1658	Sirolesi, Silvia	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-05 11:26:35.092112	2016-04-05 11:26:35.092112	Concejal	\N
1659	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-05 11:26:35.094834	2016-04-05 11:26:35.094834	Concejal	\N
1660	Dova, Mauricio	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-05 11:26:35.097554	2016-04-05 11:26:35.097554	Concejal	\N
1661	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-05 11:26:35.100311	2016-04-05 11:26:35.100311	Concejal	\N
1662	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-05 11:31:15.152018	2016-04-05 11:31:15.152018	Concejal	\N
1663	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-05 11:31:15.155499	2016-04-05 11:31:15.155499	Concejal	\N
1664	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-05 11:31:15.15865	2016-04-05 11:31:15.15865	Concejal	\N
1665	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-05 11:31:15.161786	2016-04-05 11:31:15.161786	Concejal	\N
1666	Sirolesi, Silvia	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-05 11:31:15.164841	2016-04-05 11:31:15.164841	Concejal	\N
1667	Dova, Mauricio	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-05 11:31:15.167989	2016-04-05 11:31:15.167989	Concejal	\N
1668	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-05 11:31:15.186306	2016-04-05 11:31:15.186306	Concejal	\N
1669	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-05 11:31:15.189649	2016-04-05 11:31:15.189649	Concejal	\N
1670	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-05 11:31:15.19284	2016-04-05 11:31:15.19284	Concejal	\N
1671	Gasó, Carlos	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-05 11:31:15.195807	2016-04-05 11:31:15.195807	Concejal	\N
1672	Perez Da Janoveira, Maria Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-05 11:31:15.198728	2016-04-05 11:31:15.198728	Concejal	\N
1558	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-16 16:29:19.210019	2016-03-16 16:29:19.210019	Concejal	\N
1559	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-16 16:29:19.213461	2016-03-16 16:29:19.213461	Concejal	\N
1560	Cabral, Maria del Carmen	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-16 16:29:19.216336	2016-03-16 16:29:19.216336	Concejal	\N
1561	Yawni, Viviana Andrea	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-16 16:29:19.219139	2016-03-16 16:29:19.219139	Concejal	\N
1562	Yawni, Viviana Andrea	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-17 11:05:19.508172	2016-03-17 11:05:19.508172	Concejal	\N
1563	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-17 11:05:19.511377	2016-03-17 11:05:19.511377	Concejal	\N
1564	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-17 11:05:19.514134	2016-03-17 11:05:19.514134	Concejal	\N
1565	Cabral, Maria del Carmen	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-17 11:05:19.516885	2016-03-17 11:05:19.516885	Concejal	\N
1566	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-22 14:43:53.359696	2016-03-22 14:43:53.359696	Concejal	\N
1567	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-22 14:43:53.362954	2016-03-22 14:43:53.362954	Concejal	\N
1568	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-22 14:43:53.365742	2016-03-22 14:43:53.365742	Concejal	\N
1569	Da Costa, Osvaldo	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-22 14:43:53.368478	2016-03-22 14:43:53.368478	Concejal	\N
1570	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-22 14:43:53.371209	2016-03-22 14:43:53.371209	Concejal	\N
1591	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-30 14:48:12.236393	2016-03-30 14:48:12.236393	Concejal	\N
1592	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-30 14:48:12.240063	2016-03-30 14:48:12.240063	Concejal	\N
1593	Perez Da Janoveira, Maria Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-30 14:48:12.243087	2016-03-30 14:48:12.243087	Concejal	\N
1594	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-30 14:48:12.246078	2016-03-30 14:48:12.246078	Concejal	\N
1595	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-30 14:48:12.249193	2016-03-30 14:48:12.249193	Concejal	\N
1596		\N	\N	\N	\N	\N	\N	\N	\N	2016-03-30 14:48:12.252366	2016-03-30 14:48:12.252366	Concejal	\N
1597	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-30 14:56:33.660223	2016-03-30 14:56:33.660223	Concejal	\N
1598	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-30 14:56:33.663764	2016-03-30 14:56:33.663764	Concejal	\N
1599	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-30 14:56:33.666603	2016-03-30 14:56:33.666603	Concejal	\N
1600	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-30 14:56:33.669331	2016-03-30 14:56:33.669331	Concejal	\N
1601	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-30 15:56:31.211681	2016-03-30 15:56:31.211681	Concejal	\N
1602	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-30 15:56:31.215627	2016-03-30 15:56:31.215627	Concejal	\N
1603	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-30 15:56:31.219243	2016-03-30 15:56:31.219243	Concejal	\N
1604	Perez Da Janoveira, Maria Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-30 15:56:31.222658	2016-03-30 15:56:31.222658	Concejal	\N
1605	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-30 15:56:31.226151	2016-03-30 15:56:31.226151	Concejal	\N
1606	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-30 15:56:31.229439	2016-03-30 15:56:31.229439	Concejal	\N
1607	Da Costa, Osvaldo	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-30 15:56:31.232705	2016-03-30 15:56:31.232705	Concejal	\N
1608	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-30 15:56:31.235701	2016-03-30 15:56:31.235701	Concejal	\N
1609	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-30 16:00:11.348976	2016-03-30 16:00:11.348976	Concejal	\N
1610	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-30 16:00:11.352265	2016-03-30 16:00:11.352265	Concejal	\N
1611	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-30 16:00:11.355221	2016-03-30 16:00:11.355221	Concejal	\N
1612	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-30 16:00:11.357974	2016-03-30 16:00:11.357974	Concejal	\N
1613	Perez Da Janoveira, Maria Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-30 16:00:11.361073	2016-03-30 16:00:11.361073	Concejal	\N
1614	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-30 16:00:11.364177	2016-03-30 16:00:11.364177	Concejal	\N
1615	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-30 16:00:11.366831	2016-03-30 16:00:11.366831	Concejal	\N
1616	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-30 16:00:11.369364	2016-03-30 16:00:11.369364	Concejal	\N
1617	Sirolesi, Silvia	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-30 16:00:11.372185	2016-03-30 16:00:11.372185	Concejal	\N
1618	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-30 16:00:11.375084	2016-03-30 16:00:11.375084	Concejal	\N
1619	Gasó, Carlos	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-31 10:57:30.521848	2016-03-31 10:57:30.521848	Concejal	\N
1626	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-31 12:02:58.04719	2016-03-31 12:02:58.04719	Concejal	\N
1627	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-31 12:02:58.050409	2016-03-31 12:02:58.050409	Concejal	\N
1628	Dova, Mauricio	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-31 12:02:58.053231	2016-03-31 12:02:58.053231	Concejal	\N
1629	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-31 12:02:58.055833	2016-03-31 12:02:58.055833	Concejal	\N
1630	Perez Da Janoveira, Maria Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-31 12:02:58.058419	2016-03-31 12:02:58.058419	Concejal	\N
1631	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-31 12:02:58.060945	2016-03-31 12:02:58.060945	Concejal	\N
1632	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-31 12:02:58.063477	2016-03-31 12:02:58.063477	Concejal	\N
1633	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-31 12:02:58.06604	2016-03-31 12:02:58.06604	Concejal	\N
1634	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-31 12:02:58.068592	2016-03-31 12:02:58.068592	Concejal	\N
1635	Sirolesi, Silvia	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-31 12:02:58.071158	2016-03-31 12:02:58.071158	Concejal	\N
1636	Gasó, Carlos	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-31 12:02:58.07368	2016-03-31 12:02:58.07368	Concejal	\N
1637	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-31 12:18:26.494763	2016-03-31 12:18:26.494763	Concejal	\N
1638	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-31 12:18:26.497934	2016-03-31 12:18:26.497934	Concejal	\N
1639	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-31 12:18:26.500662	2016-03-31 12:18:26.500662	Concejal	\N
1640	Cabral, Maria del Carmen	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-31 12:18:26.503323	2016-03-31 12:18:26.503323	Concejal	\N
1641	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-31 12:18:26.505929	2016-03-31 12:18:26.505929	Concejal	\N
1673	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-05 11:35:26.208294	2016-04-05 11:35:26.208294	Concejal	\N
1674	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-05 11:35:26.22643	2016-04-05 11:35:26.22643	Concejal	\N
1675	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-05 11:35:26.23004	2016-04-05 11:35:26.23004	Concejal	\N
1676	Gasó, Carlos	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-05 11:35:26.233182	2016-04-05 11:35:26.233182	Concejal	\N
1677	Dova, Mauricio	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-05 11:35:26.235933	2016-04-05 11:35:26.235933	Concejal	\N
1678	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-05 11:35:26.238747	2016-04-05 11:35:26.238747	Concejal	\N
1679	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-05 11:35:26.241693	2016-04-05 11:35:26.241693	Concejal	\N
1680	Sirolesi, Silvia	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-05 11:35:26.244546	2016-04-05 11:35:26.244546	Concejal	\N
1681	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-05 11:35:26.247329	2016-04-05 11:35:26.247329	Concejal	\N
1682	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-05 11:35:26.250039	2016-04-05 11:35:26.250039	Concejal	\N
1683	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-05 11:54:22.1324	2016-04-05 11:54:22.1324	Concejal	\N
1684	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-05 11:54:22.135593	2016-04-05 11:54:22.135593	Concejal	\N
1685	Sirolesi, Silvia	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-05 11:54:22.13851	2016-04-05 11:54:22.13851	Concejal	\N
1686	Dova, Mauricio	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-05 11:54:22.141358	2016-04-05 11:54:22.141358	Concejal	\N
1687	Perez Da Janoveira, Maria Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-05 11:54:22.144392	2016-04-05 11:54:22.144392	Concejal	\N
1688	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-05 11:54:22.147446	2016-04-05 11:54:22.147446	Concejal	\N
1689	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-05 11:54:22.150331	2016-04-05 11:54:22.150331	Concejal	\N
1690	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-05 11:54:22.153048	2016-04-05 11:54:22.153048	Concejal	\N
1691	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-05 11:54:22.155844	2016-04-05 11:54:22.155844	Concejal	\N
1692	Gasó, Carlos	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-05 11:54:22.177088	2016-04-05 11:54:22.177088	Concejal	\N
1693	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-05 11:54:22.1986	2016-04-05 11:54:22.1986	Concejal	\N
1694	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-05 12:21:43.384175	2016-04-05 12:21:43.384175	Concejal	\N
1695	Gasó, Carlos	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-05 12:21:43.387558	2016-04-05 12:21:43.387558	Concejal	\N
1696	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-05 12:21:43.39045	2016-04-05 12:21:43.39045	Concejal	\N
1697	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-05 12:21:43.393302	2016-04-05 12:21:43.393302	Concejal	\N
1698	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-05 12:21:43.396048	2016-04-05 12:21:43.396048	Concejal	\N
1699	Perez Da Janoveira, Maria Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-05 12:21:43.398725	2016-04-05 12:21:43.398725	Concejal	\N
1700	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-05 12:21:43.408757	2016-04-05 12:21:43.408757	Concejal	\N
1701	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-05 12:21:43.411556	2016-04-05 12:21:43.411556	Concejal	\N
1702	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-05 12:21:43.414303	2016-04-05 12:21:43.414303	Concejal	\N
1703	Dova, Mauricio	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-05 12:21:43.416933	2016-04-05 12:21:43.416933	Concejal	\N
1704	Sirolesi, Silvia	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-05 12:21:43.419579	2016-04-05 12:21:43.419579	Concejal	\N
1705	Gasó, Carlos	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-05 12:26:19.853936	2016-04-05 12:26:19.853936	Concejal	\N
1706	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-05 12:26:19.857129	2016-04-05 12:26:19.857129	Concejal	\N
1707	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-05 12:26:19.860079	2016-04-05 12:26:19.860079	Concejal	\N
1708	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-05 12:26:19.862858	2016-04-05 12:26:19.862858	Concejal	\N
1709	Dova, Mauricio	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-05 12:26:19.865609	2016-04-05 12:26:19.865609	Concejal	\N
1710	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-05 12:26:19.868409	2016-04-05 12:26:19.868409	Concejal	\N
1711	Sirolesi, Silvia	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-05 12:26:19.871154	2016-04-05 12:26:19.871154	Concejal	\N
1712	Perez Da Janoveira, Maria Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-05 12:26:19.87383	2016-04-05 12:26:19.87383	Concejal	\N
1713	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-05 12:26:19.876535	2016-04-05 12:26:19.876535	Concejal	\N
1714	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-05 12:26:19.890506	2016-04-05 12:26:19.890506	Concejal	\N
1715	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-05 12:26:19.893215	2016-04-05 12:26:19.893215	Concejal	\N
1716	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-06 11:48:56.587047	2016-04-06 11:48:56.587047	Concejal	\N
1717	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-06 11:48:56.590328	2016-04-06 11:48:56.590328	Concejal	\N
1718	Gasó, Carlos	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-06 11:48:56.593395	2016-04-06 11:48:56.593395	Concejal	\N
1719	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-06 11:48:56.596596	2016-04-06 11:48:56.596596	Concejal	\N
1720	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-06 11:51:28.08748	2016-04-06 11:51:28.08748	Concejal	\N
1721	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-06 11:51:28.090579	2016-04-06 11:51:28.090579	Concejal	\N
1722	Gasó, Carlos	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-06 11:51:28.093405	2016-04-06 11:51:28.093405	Concejal	\N
1723	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-06 11:51:28.096112	2016-04-06 11:51:28.096112	Concejal	\N
1724	Bringas, Claudia	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-06 13:13:03.425769	2016-04-06 13:13:03.425769	Concejal	\N
1725	Da Costa, Osvaldo	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-06 13:14:17.222919	2016-04-06 13:14:17.222919	Concejal	\N
1726	Carranza, Martin	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-06 13:14:17.227014	2016-04-06 13:14:17.227014	Concejal	\N
1727	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-06 13:14:17.230614	2016-04-06 13:14:17.230614	Concejal	\N
1728	Perez Da Janoveira, Maria Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-06 13:14:17.23413	2016-04-06 13:14:17.23413	Concejal	\N
1729	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 10:51:02.634099	2016-04-07 10:51:02.634099	Concejal	\N
1730	Cabral, Maria del Carmen	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 10:51:02.637493	2016-04-07 10:51:02.637493	Concejal	\N
1731	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 10:51:02.640406	2016-04-07 10:51:02.640406	Concejal	\N
1732	Yawni, Viviana Andrea	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 10:51:02.643377	2016-04-07 10:51:02.643377	Concejal	\N
1733	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 10:55:55.124986	2016-04-07 10:55:55.124986	Concejal	\N
1734	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 10:55:55.128235	2016-04-07 10:55:55.128235	Concejal	\N
1735	Perez Da Janoveira, Maria Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 10:55:55.131162	2016-04-07 10:55:55.131162	Concejal	\N
1736	Dova, Mauricio	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 10:55:55.134108	2016-04-07 10:55:55.134108	Concejal	\N
1737	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 10:55:55.137033	2016-04-07 10:55:55.137033	Concejal	\N
1738	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 10:55:55.139868	2016-04-07 10:55:55.139868	Concejal	\N
1739	Gasó, Carlos	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 10:55:55.14256	2016-04-07 10:55:55.14256	Concejal	\N
1740	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 10:55:55.145156	2016-04-07 10:55:55.145156	Concejal	\N
1741	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 10:55:55.147775	2016-04-07 10:55:55.147775	Concejal	\N
1742	Sirolesi, Silvia	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 10:55:55.150348	2016-04-07 10:55:55.150348	Concejal	\N
1743	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 11:17:35.036341	2016-04-07 11:17:35.036341	Concejal	\N
1744	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 11:17:35.039719	2016-04-07 11:17:35.039719	Concejal	\N
1745	Sirolesi, Silvia	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 11:17:35.042631	2016-04-07 11:17:35.042631	Concejal	\N
1746	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 11:17:35.045312	2016-04-07 11:17:35.045312	Concejal	\N
1747	Cabral, Maria del Carmen	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 12:08:51.769341	2016-04-07 12:08:51.769341	Concejal	\N
1748	Da Costa, Osvaldo	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 12:08:51.773315	2016-04-07 12:08:51.773315	Concejal	\N
1749	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 12:08:51.77632	2016-04-07 12:08:51.77632	Concejal	\N
1750	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 12:08:51.779096	2016-04-07 12:08:51.779096	Concejal	\N
1751	Da Costa, Osvaldo	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 12:14:46.026751	2016-04-07 12:14:46.026751	Concejal	\N
1752	Cabral, Maria del Carmen	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 12:14:46.030391	2016-04-07 12:14:46.030391	Concejal	\N
1753	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 12:14:46.033567	2016-04-07 12:14:46.033567	Concejal	\N
1754	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 12:14:46.037136	2016-04-07 12:14:46.037136	Concejal	\N
1755	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 12:14:46.040244	2016-04-07 12:14:46.040244	Concejal	\N
1756	Cabral, Maria del Carmen	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 12:23:26.916361	2016-04-07 12:23:26.916361	Concejal	\N
1757	Da Costa, Osvaldo	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 12:23:26.919604	2016-04-07 12:23:26.919604	Concejal	\N
1758	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 12:23:26.922586	2016-04-07 12:23:26.922586	Concejal	\N
1759	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 12:23:26.925556	2016-04-07 12:23:26.925556	Concejal	\N
1760	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 12:23:26.928553	2016-04-07 12:23:26.928553	Concejal	\N
1761	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 12:34:12.714914	2016-04-07 12:34:12.714914	Concejal	\N
1762	Perez Da Janoveira, Maria Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 12:34:12.719029	2016-04-07 12:34:12.719029	Concejal	\N
1763	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 12:34:12.722727	2016-04-07 12:34:12.722727	Concejal	\N
1764	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 12:34:12.726267	2016-04-07 12:34:12.726267	Concejal	\N
1765	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 12:34:12.729294	2016-04-07 12:34:12.729294	Concejal	\N
1766	Dova, Mauricio	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 12:34:12.733593	2016-04-07 12:34:12.733593	Concejal	\N
1767	Sirolesi, Silvia	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 12:34:12.737231	2016-04-07 12:34:12.737231	Concejal	\N
1768	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 12:34:12.74033	2016-04-07 12:34:12.74033	Concejal	\N
1769	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 12:34:12.744563	2016-04-07 12:34:12.744563	Concejal	\N
1770	Gasó, Carlos	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 12:34:12.748125	2016-04-07 12:34:12.748125	Concejal	\N
1771	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 12:45:52.246914	2016-04-07 12:45:52.246914	Concejal	\N
1772	Perez Da Janoveira, Maria Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 12:45:52.250102	2016-04-07 12:45:52.250102	Concejal	\N
1773	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 12:45:52.252921	2016-04-07 12:45:52.252921	Concejal	\N
1774	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 12:45:52.255702	2016-04-07 12:45:52.255702	Concejal	\N
1775	Dova, Mauricio	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 12:45:52.258432	2016-04-07 12:45:52.258432	Concejal	\N
1776	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 12:45:52.261118	2016-04-07 12:45:52.261118	Concejal	\N
1777	Gasó, Carlos	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 12:45:52.263777	2016-04-07 12:45:52.263777	Concejal	\N
1778	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 12:45:52.266415	2016-04-07 12:45:52.266415	Concejal	\N
1779	Sirolesi, Silvia	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 12:45:52.269044	2016-04-07 12:45:52.269044	Concejal	\N
1780	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 13:05:08.836827	2016-04-07 13:05:08.836827	Concejal	\N
1781	Perez Da Janoveira, Maria Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 13:05:08.840188	2016-04-07 13:05:08.840188	Concejal	\N
1782	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 13:05:08.843473	2016-04-07 13:05:08.843473	Concejal	\N
1783	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 13:05:08.846265	2016-04-07 13:05:08.846265	Concejal	\N
1784	Dova, Mauricio	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 13:05:08.862208	2016-04-07 13:05:08.862208	Concejal	\N
1785	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 13:05:08.865193	2016-04-07 13:05:08.865193	Concejal	\N
1786	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 13:05:08.868119	2016-04-07 13:05:08.868119	Concejal	\N
1787	Sirolesi, Silvia	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 13:05:08.870879	2016-04-07 13:05:08.870879	Concejal	\N
1788	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 13:05:08.87364	2016-04-07 13:05:08.87364	Concejal	\N
1789	Gasó, Carlos	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 13:05:08.876372	2016-04-07 13:05:08.876372	Concejal	\N
1810	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 15:49:17.731885	2016-04-07 15:49:17.731885	Concejal	\N
1811	Perez Da Janoveira, Maria Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 15:49:17.735076	2016-04-07 15:49:17.735076	Concejal	\N
1812	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 15:49:17.737866	2016-04-07 15:49:17.737866	Concejal	\N
1813	Dova, Mauricio	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 15:49:17.740489	2016-04-07 15:49:17.740489	Concejal	\N
1814	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 15:49:17.743096	2016-04-07 15:49:17.743096	Concejal	\N
1815	Sirolesi, Silvia	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 15:49:17.745701	2016-04-07 15:49:17.745701	Concejal	\N
1816	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 15:49:17.748289	2016-04-07 15:49:17.748289	Concejal	\N
1817	Gasó, Carlos	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 15:49:17.750895	2016-04-07 15:49:17.750895	Concejal	\N
1818	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 15:49:17.753511	2016-04-07 15:49:17.753511	Concejal	\N
1836	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 16:00:25.187216	2016-04-07 16:00:25.187216	Concejal	\N
1837	Yawni, Viviana Andrea	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 16:00:25.190707	2016-04-07 16:00:25.190707	Concejal	\N
1838	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 16:00:25.193985	2016-04-07 16:00:25.193985	Concejal	\N
1839	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 16:00:25.197139	2016-04-07 16:00:25.197139	Concejal	\N
1840	Sirolesi, Silvia	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 16:00:25.200376	2016-04-07 16:00:25.200376	Concejal	\N
1841	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 16:00:25.203544	2016-04-07 16:00:25.203544	Concejal	\N
1842	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 16:02:49.114839	2016-04-07 16:02:49.114839	Concejal	\N
1843	Yawni, Viviana Andrea	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 16:02:49.118232	2016-04-07 16:02:49.118232	Concejal	\N
1844	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 16:02:49.121065	2016-04-07 16:02:49.121065	Concejal	\N
1845	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 16:02:49.132033	2016-04-07 16:02:49.132033	Concejal	\N
1846	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 16:02:49.135886	2016-04-07 16:02:49.135886	Concejal	\N
1847	Sirolesi, Silvia	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 16:02:49.139774	2016-04-07 16:02:49.139774	Concejal	\N
1848	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 16:04:40.140226	2016-04-07 16:04:40.140226	Concejal	\N
1849	Yawni, Viviana Andrea	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 16:04:40.143421	2016-04-07 16:04:40.143421	Concejal	\N
1850	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 16:04:40.146147	2016-04-07 16:04:40.146147	Concejal	\N
1851	Paulizzi, Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 16:04:40.148825	2016-04-07 16:04:40.148825	Concejal	\N
1852	Sirolesi, Silvia	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 16:04:40.151432	2016-04-07 16:04:40.151432	Concejal	\N
1853	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 16:04:40.154026	2016-04-07 16:04:40.154026	Concejal	\N
1863	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-13 14:32:49.560981	2016-04-13 14:32:49.560981	Concejal	\N
1864	Gasó, Carlos	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-13 14:32:49.564197	2016-04-13 14:32:49.564197	Concejal	\N
1865	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-13 14:32:49.567042	2016-04-13 14:32:49.567042	Concejal	\N
1866	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-13 14:32:49.569856	2016-04-13 14:32:49.569856	Concejal	\N
1867	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-13 14:32:49.572639	2016-04-13 14:32:49.572639	Concejal	\N
1868	Dova, Mauricio	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-13 14:32:49.575422	2016-04-13 14:32:49.575422	Concejal	\N
1869	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-13 14:32:49.578072	2016-04-13 14:32:49.578072	Concejal	\N
1870	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-13 14:32:49.580666	2016-04-13 14:32:49.580666	Concejal	\N
1871	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-13 14:32:49.583528	2016-04-13 14:32:49.583528	Concejal	\N
1872	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-13 14:36:26.584727	2016-04-13 14:36:26.584727	Concejal	\N
1873	Gasó, Carlos	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-13 14:36:26.587674	2016-04-13 14:36:26.587674	Concejal	\N
1874	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-13 14:36:26.590465	2016-04-13 14:36:26.590465	Concejal	\N
1875	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-13 14:36:26.59309	2016-04-13 14:36:26.59309	Concejal	\N
1876	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-13 14:36:26.595676	2016-04-13 14:36:26.595676	Concejal	\N
1877	Dova, Mauricio	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-13 14:36:26.598587	2016-04-13 14:36:26.598587	Concejal	\N
1878	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-13 14:36:26.601376	2016-04-13 14:36:26.601376	Concejal	\N
1879	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-13 14:36:26.604065	2016-04-13 14:36:26.604065	Concejal	\N
1880	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-13 14:36:26.606947	2016-04-13 14:36:26.606947	Concejal	\N
1881	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-13 14:40:37.413052	2016-04-13 14:40:37.413052	Concejal	\N
1882	Gasó, Carlos	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-13 14:40:37.416455	2016-04-13 14:40:37.416455	Concejal	\N
1883	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-13 14:40:37.419418	2016-04-13 14:40:37.419418	Concejal	\N
1884	Dova, Mauricio	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-13 14:40:37.422272	2016-04-13 14:40:37.422272	Concejal	\N
1885	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-13 14:40:37.425125	2016-04-13 14:40:37.425125	Concejal	\N
1886	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-13 14:40:37.42794	2016-04-13 14:40:37.42794	Concejal	\N
1887	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-13 14:40:37.430703	2016-04-13 14:40:37.430703	Concejal	\N
1888	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-13 14:40:37.433448	2016-04-13 14:40:37.433448	Concejal	\N
1889	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-13 14:40:37.436035	2016-04-13 14:40:37.436035	Concejal	\N
1790	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 13:13:19.890147	2016-04-07 13:13:19.890147	Concejal	\N
1791	Perez Da Janoveira, Maria Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 13:13:19.893838	2016-04-07 13:13:19.893838	Concejal	\N
1792	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 13:13:19.89662	2016-04-07 13:13:19.89662	Concejal	\N
1793	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 13:13:19.899417	2016-04-07 13:13:19.899417	Concejal	\N
1794	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 13:13:19.902393	2016-04-07 13:13:19.902393	Concejal	\N
1795	Dova, Mauricio	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 13:13:19.905349	2016-04-07 13:13:19.905349	Concejal	\N
1796	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 13:13:19.908128	2016-04-07 13:13:19.908128	Concejal	\N
1797	Sirolesi, Silvia	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 13:13:19.910852	2016-04-07 13:13:19.910852	Concejal	\N
1798	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 13:13:19.913589	2016-04-07 13:13:19.913589	Concejal	\N
1799	Gasó, Carlos	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 13:13:19.916494	2016-04-07 13:13:19.916494	Concejal	\N
1800	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 15:37:54.540014	2016-04-07 15:37:54.540014	Concejal	\N
1801	Perez Da Janoveira, Maria Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 15:37:54.543885	2016-04-07 15:37:54.543885	Concejal	\N
1802	Gasó, Carlos	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 15:37:54.547328	2016-04-07 15:37:54.547328	Concejal	\N
1803	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 15:37:54.550614	2016-04-07 15:37:54.550614	Concejal	\N
1804	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 15:37:54.554051	2016-04-07 15:37:54.554051	Concejal	\N
1805	Dova, Mauricio	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 15:37:54.557214	2016-04-07 15:37:54.557214	Concejal	\N
1806	Sirolesi, Silvia	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 15:37:54.560415	2016-04-07 15:37:54.560415	Concejal	\N
1807	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 15:37:54.563791	2016-04-07 15:37:54.563791	Concejal	\N
1808	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 15:37:54.567051	2016-04-07 15:37:54.567051	Concejal	\N
1809	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 15:37:54.570103	2016-04-07 15:37:54.570103	Concejal	\N
1819	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 15:55:50.693049	2016-04-07 15:55:50.693049	Concejal	\N
1820	Perez Da Janoveira, Maria Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 15:55:50.696352	2016-04-07 15:55:50.696352	Concejal	\N
1821	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 15:55:50.699639	2016-04-07 15:55:50.699639	Concejal	\N
1822	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 15:55:50.702663	2016-04-07 15:55:50.702663	Concejal	\N
1823	Dova, Mauricio	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 15:55:50.705451	2016-04-07 15:55:50.705451	Concejal	\N
1824	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 15:55:50.708201	2016-04-07 15:55:50.708201	Concejal	\N
1825	Gasó, Carlos	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 15:55:50.71084	2016-04-07 15:55:50.71084	Concejal	\N
1826	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 15:55:50.713445	2016-04-07 15:55:50.713445	Concejal	\N
1827	Sirolesi, Silvia	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 15:55:50.716033	2016-04-07 15:55:50.716033	Concejal	\N
1828	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 15:55:50.718614	2016-04-07 15:55:50.718614	Concejal	\N
1829	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 15:58:03.110244	2016-04-07 15:58:03.110244	Concejal	\N
1830	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 15:58:03.113168	2016-04-07 15:58:03.113168	Concejal	\N
1831	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 15:58:03.115878	2016-04-07 15:58:03.115878	Concejal	\N
1832	Sirolesi, Silvia	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 15:58:03.118536	2016-04-07 15:58:03.118536	Concejal	\N
1833	Perez Da Janoveira, Maria Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 15:58:03.121115	2016-04-07 15:58:03.121115	Concejal	\N
1834	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 15:58:03.12361	2016-04-07 15:58:03.12361	Concejal	\N
1835	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-07 15:58:03.126113	2016-04-07 15:58:03.126113	Concejal	\N
1854	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-13 14:23:40.668334	2016-04-13 14:23:40.668334	Concejal	\N
1855	Gasó, Carlos	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-13 14:23:40.672216	2016-04-13 14:23:40.672216	Concejal	\N
1856	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-13 14:23:40.675373	2016-04-13 14:23:40.675373	Concejal	\N
1857	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-13 14:23:40.678391	2016-04-13 14:23:40.678391	Concejal	\N
1858	Dova, Mauricio	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-13 14:23:40.681154	2016-04-13 14:23:40.681154	Concejal	\N
1859	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-13 14:23:40.683865	2016-04-13 14:23:40.683865	Concejal	\N
1860	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-13 14:23:40.686467	2016-04-13 14:23:40.686467	Concejal	\N
1861	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-13 14:23:40.689075	2016-04-13 14:23:40.689075	Concejal	\N
1862	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-13 14:23:40.691662	2016-04-13 14:23:40.691662	Concejal	\N
1890	Gasó, Carlos	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-14 10:44:24.322311	2016-04-14 10:44:24.322311	Concejal	\N
1891	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-14 10:44:24.325587	2016-04-14 10:44:24.325587	Concejal	\N
1892	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-14 10:44:24.328426	2016-04-14 10:44:24.328426	Concejal	\N
1893	Cabral, Maria del Carmen	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-14 10:44:24.331104	2016-04-14 10:44:24.331104	Concejal	\N
1894	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-14 10:44:24.333729	2016-04-14 10:44:24.333729	Concejal	\N
1895	Yawni, Viviana Andrea	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-14 10:44:24.336333	2016-04-14 10:44:24.336333	Concejal	\N
1896	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-14 10:49:18.157424	2016-04-14 10:49:18.157424	Concejal	\N
1897	Cabral, Maria del Carmen	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-14 10:49:18.160488	2016-04-14 10:49:18.160488	Concejal	\N
1898	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-14 10:49:18.16315	2016-04-14 10:49:18.16315	Concejal	\N
1899	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-14 10:49:18.172009	2016-04-14 10:49:18.172009	Concejal	\N
1900	Cabral, Maria del Carmen	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-14 10:54:16.449777	2016-04-14 10:54:16.449777	Concejal	\N
1901	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-14 10:54:16.453369	2016-04-14 10:54:16.453369	Concejal	\N
1902	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-14 10:54:16.456571	2016-04-14 10:54:16.456571	Concejal	\N
1903	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-14 10:54:16.459689	2016-04-14 10:54:16.459689	Concejal	\N
1904	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-14 10:58:40.101571	2016-04-14 10:58:40.101571	Concejal	\N
1905	Yawni, Viviana Andrea	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-14 10:58:40.104746	2016-04-14 10:58:40.104746	Concejal	\N
1906	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-14 10:58:40.107525	2016-04-14 10:58:40.107525	Concejal	\N
1907	Cabral, Maria del Carmen	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-14 10:58:40.110296	2016-04-14 10:58:40.110296	Concejal	\N
1908	Gasó, Carlos	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-14 11:19:15.375418	2016-04-14 11:19:15.375418	Concejal	\N
1909	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-14 11:19:15.378878	2016-04-14 11:19:15.378878	Concejal	\N
1910	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-14 11:19:15.38175	2016-04-14 11:19:15.38175	Concejal	\N
1911	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-14 11:19:15.384901	2016-04-14 11:19:15.384901	Concejal	\N
1912	Cabral, Maria del Carmen	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-14 11:19:15.387931	2016-04-14 11:19:15.387931	Concejal	\N
1913	Yawni, Viviana Andrea	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-14 11:19:15.390681	2016-04-14 11:19:15.390681	Concejal	\N
1914	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-14 11:23:55.185471	2016-04-14 11:23:55.185471	Concejal	\N
1915	Cabral, Maria del Carmen	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-14 11:23:55.189302	2016-04-14 11:23:55.189302	Concejal	\N
1916	Carranza, Martin	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-14 11:23:55.192637	2016-04-14 11:23:55.192637	Concejal	\N
1917	Perez Da Janoveira, Maria Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-14 11:23:55.195906	2016-04-14 11:23:55.195906	Concejal	\N
1918	Da Costa, Osvaldo	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-14 11:23:55.199098	2016-04-14 11:23:55.199098	Concejal	\N
1919	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-14 11:28:15.917841	2016-04-14 11:28:15.917841	Concejal	\N
1920	Cabral, Maria del Carmen	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-14 11:28:15.933984	2016-04-14 11:28:15.933984	Concejal	\N
1921	Carranza, Martin	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-14 11:28:15.937444	2016-04-14 11:28:15.937444	Concejal	\N
1922	Da Costa, Osvaldo	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-14 11:28:15.940739	2016-04-14 11:28:15.940739	Concejal	\N
1923	Perez Da Janoveira, Maria Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-14 11:28:15.943937	2016-04-14 11:28:15.943937	Concejal	\N
1924	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-14 11:32:11.47707	2016-04-14 11:32:11.47707	Concejal	\N
1925	Cabral, Maria del Carmen	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-14 11:32:11.479899	2016-04-14 11:32:11.479899	Concejal	\N
1926	Carranza, Martin	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-14 11:32:11.482698	2016-04-14 11:32:11.482698	Concejal	\N
1927	Da Costa, Osvaldo	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-14 11:32:11.485482	2016-04-14 11:32:11.485482	Concejal	\N
1928	Perez Da Janoveira, Maria Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-14 11:32:11.488478	2016-04-14 11:32:11.488478	Concejal	\N
1929	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-14 11:35:42.640827	2016-04-14 11:35:42.640827	Concejal	\N
1930	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-14 11:35:42.643994	2016-04-14 11:35:42.643994	Concejal	\N
1931	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-14 11:35:42.646889	2016-04-14 11:35:42.646889	Concejal	\N
1932	Gasó, Carlos	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-14 11:35:42.649795	2016-04-14 11:35:42.649795	Concejal	\N
1933	Perez Da Janoveira, Maria Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-14 11:35:42.652553	2016-04-14 11:35:42.652553	Concejal	\N
1934	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-14 11:54:17.889995	2016-04-14 11:54:17.889995	Concejal	\N
1935	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-14 11:54:17.893103	2016-04-14 11:54:17.893103	Concejal	\N
1936	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-14 11:54:17.895964	2016-04-14 11:54:17.895964	Concejal	\N
1937	Gasó, Carlos	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-14 11:54:17.898776	2016-04-14 11:54:17.898776	Concejal	\N
1938	Perez Da Janoveira, Maria Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-14 11:54:17.901521	2016-04-14 11:54:17.901521	Concejal	\N
1945	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-19 15:16:52.420066	2016-04-19 15:16:52.420066	Concejal	\N
1946	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-19 15:16:52.423172	2016-04-19 15:16:52.423172	Concejal	\N
1947	Cabral, Maria del Carmen	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-19 15:16:52.426356	2016-04-19 15:16:52.426356	Concejal	\N
1948	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-19 15:16:52.429447	2016-04-19 15:16:52.429447	Concejal	\N
1949	Yawni, Viviana Andrea	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-19 15:16:52.432314	2016-04-19 15:16:52.432314	Concejal	\N
1960	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-21 11:52:06.74229	2016-04-21 11:52:06.74229	Concejal	\N
1961	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-21 11:52:06.745695	2016-04-21 11:52:06.745695	Concejal	\N
1962	Gasó, Carlos	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-21 11:52:06.748425	2016-04-21 11:52:06.748425	Concejal	\N
1963	Perez Da Janoveira, Maria Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-21 11:52:06.751263	2016-04-21 11:52:06.751263	Concejal	\N
1964	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-21 11:52:06.754176	2016-04-21 11:52:06.754176	Concejal	\N
1965	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-21 11:52:06.75693	2016-04-21 11:52:06.75693	Concejal	\N
1966	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-21 11:52:06.759636	2016-04-21 11:52:06.759636	Concejal	\N
1967	Sirolesi, Silvia	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-21 11:52:06.762359	2016-04-21 11:52:06.762359	Concejal	\N
1968	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-21 11:52:06.765006	2016-04-21 11:52:06.765006	Concejal	\N
2014	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-21 15:28:00.234246	2016-04-21 15:28:00.234246	Concejal	\N
2015	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-21 15:28:00.237606	2016-04-21 15:28:00.237606	Concejal	\N
2016	Gasó, Carlos	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-21 15:28:00.240473	2016-04-21 15:28:00.240473	Concejal	\N
2017	Perez Da Janoveira, Maria Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-21 15:28:00.243299	2016-04-21 15:28:00.243299	Concejal	\N
2018	Dova, Mauricio	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-21 15:28:00.245988	2016-04-21 15:28:00.245988	Concejal	\N
2019	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-21 15:28:00.24874	2016-04-21 15:28:00.24874	Concejal	\N
2020	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-21 15:28:00.251451	2016-04-21 15:28:00.251451	Concejal	\N
2021	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-21 15:28:00.254064	2016-04-21 15:28:00.254064	Concejal	\N
2022	Sirolesi, Silvia	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-21 15:28:00.256629	2016-04-21 15:28:00.256629	Concejal	\N
2023	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-21 15:40:14.150963	2016-04-21 15:40:14.150963	Concejal	\N
2024	Gasó, Carlos	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-21 15:40:14.15442	2016-04-21 15:40:14.15442	Concejal	\N
2025	Natali, Guillermo Luis	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-21 15:40:14.157404	2016-04-21 15:40:14.157404	Concejal	\N
2026	Perez Da Janoveira, Maria Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-21 15:40:14.160015	2016-04-21 15:40:14.160015	Concejal	\N
2027	Dova, Mauricio	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-21 15:40:14.162767	2016-04-21 15:40:14.162767	Concejal	\N
2028	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-21 15:40:14.165807	2016-04-21 15:40:14.165807	Concejal	\N
2029	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-21 15:40:14.168816	2016-04-21 15:40:14.168816	Concejal	\N
2030	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-21 15:40:14.171737	2016-04-21 15:40:14.171737	Concejal	\N
2031	Sirolesi, Silvia	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-21 15:40:14.174833	2016-04-21 15:40:14.174833	Concejal	\N
2032	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-21 15:51:34.125678	2016-04-21 15:51:34.125678	Concejal	\N
2033	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-21 15:51:34.13005	2016-04-21 15:51:34.13005	Concejal	\N
2034	Gasó, Carlos	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-21 15:51:34.134004	2016-04-21 15:51:34.134004	Concejal	\N
2035	Perez Da Janoveira, Maria Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-21 15:51:34.13777	2016-04-21 15:51:34.13777	Concejal	\N
2036	Dova, Mauricio	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-21 15:51:34.141438	2016-04-21 15:51:34.141438	Concejal	\N
2037	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-21 15:51:34.145065	2016-04-21 15:51:34.145065	Concejal	\N
2038	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-21 15:51:34.149	2016-04-21 15:51:34.149	Concejal	\N
2039	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-21 15:51:34.152764	2016-04-21 15:51:34.152764	Concejal	\N
2040	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-21 15:51:34.156447	2016-04-21 15:51:34.156447	Concejal	\N
2041	Sirolesi, Silvia	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-21 15:51:34.159837	2016-04-21 15:51:34.159837	Concejal	\N
2046	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-27 15:49:33.818652	2016-04-27 15:49:33.818652	Concejal	\N
2047	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-27 15:49:33.823322	2016-04-27 15:49:33.823322	Concejal	\N
2048	Perez Da Janoveira, Maria Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-27 15:49:33.827412	2016-04-27 15:49:33.827412	Concejal	\N
2049	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-27 15:49:33.83149	2016-04-27 15:49:33.83149	Concejal	\N
2050	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-27 15:49:33.835486	2016-04-27 15:49:33.835486	Concejal	\N
2051	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-27 15:49:33.839484	2016-04-27 15:49:33.839484	Concejal	\N
2052	Gasó, Carlos	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-27 15:49:33.843326	2016-04-27 15:49:33.843326	Concejal	\N
2053	Dova, Mauricio	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-27 15:49:33.84698	2016-04-27 15:49:33.84698	Concejal	\N
2054	Sirolesi, Silvia	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-27 15:49:33.850667	2016-04-27 15:49:33.850667	Concejal	\N
2055	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-27 15:52:21.438658	2016-04-27 15:52:21.438658	Concejal	\N
2056	Gasó, Carlos	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-27 15:52:21.441822	2016-04-27 15:52:21.441822	Concejal	\N
2057	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-27 15:52:21.445006	2016-04-27 15:52:21.445006	Concejal	\N
2058	Perez Da Janoveira, Maria Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-27 15:52:21.447972	2016-04-27 15:52:21.447972	Concejal	\N
2059	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-27 15:52:21.450927	2016-04-27 15:52:21.450927	Concejal	\N
2060	Dova, Mauricio	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-27 15:52:21.453795	2016-04-27 15:52:21.453795	Concejal	\N
2061	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-27 15:52:21.456594	2016-04-27 15:52:21.456594	Concejal	\N
2062	Sirolesi, Silvia	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-27 15:52:21.459227	2016-04-27 15:52:21.459227	Concejal	\N
2063		\N	\N	\N	\N	\N	\N	\N	\N	2016-04-27 15:52:21.461863	2016-04-27 15:52:21.461863	Concejal	\N
2064	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-27 15:54:56.584889	2016-04-27 15:54:56.584889	Concejal	\N
2065	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-27 15:54:56.588856	2016-04-27 15:54:56.588856	Concejal	\N
2066	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-27 15:54:56.592744	2016-04-27 15:54:56.592744	Concejal	\N
2067	Perez Da Janoveira, Maria Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-27 15:54:56.596651	2016-04-27 15:54:56.596651	Concejal	\N
2068	Gasó, Carlos	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-27 15:54:56.600323	2016-04-27 15:54:56.600323	Concejal	\N
2069	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-27 15:54:56.60382	2016-04-27 15:54:56.60382	Concejal	\N
2070	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-27 15:54:56.607232	2016-04-27 15:54:56.607232	Concejal	\N
2071	Dova, Mauricio	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-27 15:54:56.610637	2016-04-27 15:54:56.610637	Concejal	\N
2072	Sirolesi, Silvia	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-27 15:54:56.614013	2016-04-27 15:54:56.614013	Concejal	\N
2096	Yawni, Viviana Andrea	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-28 11:09:25.575991	2016-04-28 11:09:25.575991	Concejal	\N
2097	Bringas, Claudia	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-28 11:09:25.580469	2016-04-28 11:09:25.580469	Concejal	\N
2098	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-28 11:09:25.58434	2016-04-28 11:09:25.58434	Concejal	\N
1939	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-14 12:00:46.140715	2016-04-14 12:00:46.140715	Concejal	\N
1940	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-14 12:00:46.14426	2016-04-14 12:00:46.14426	Concejal	\N
1941	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-14 12:00:46.147184	2016-04-14 12:00:46.147184	Concejal	\N
1942	Gasó, Carlos	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-14 12:00:46.150076	2016-04-14 12:00:46.150076	Concejal	\N
1943	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-14 12:00:46.152917	2016-04-14 12:00:46.152917	Concejal	\N
1944	Perez Da Janoveira, Maria Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-14 12:00:46.155807	2016-04-14 12:00:46.155807	Concejal	\N
1950	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-21 11:36:12.900185	2016-04-21 11:36:12.900185	Concejal	\N
1951	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-21 11:36:12.903323	2016-04-21 11:36:12.903323	Concejal	\N
1952	Gasó, Carlos	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-21 11:36:12.906093	2016-04-21 11:36:12.906093	Concejal	\N
1953	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-21 11:36:12.908774	2016-04-21 11:36:12.908774	Concejal	\N
1954	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-21 11:38:50.95128	2016-04-21 11:38:50.95128	Concejal	\N
1955	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-21 11:38:50.954977	2016-04-21 11:38:50.954977	Concejal	\N
1956	Gasó, Carlos	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-21 11:38:50.95838	2016-04-21 11:38:50.95838	Concejal	\N
1957	Perez Da Janoveira, Maria Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-21 11:38:50.961739	2016-04-21 11:38:50.961739	Concejal	\N
1958	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-21 11:38:50.964902	2016-04-21 11:38:50.964902	Concejal	\N
1959	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-21 11:38:50.968045	2016-04-21 11:38:50.968045	Concejal	\N
1969	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-21 13:42:17.159431	2016-04-21 13:42:17.159431	Concejal	\N
1970	Cabral, Maria del Carmen	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-21 13:42:17.162486	2016-04-21 13:42:17.162486	Concejal	\N
1971	Gasó, Carlos	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-21 13:42:17.165322	2016-04-21 13:42:17.165322	Concejal	\N
1972	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-21 13:42:17.168116	2016-04-21 13:42:17.168116	Concejal	\N
1973	Yawni, Viviana Andrea	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-21 13:42:17.170882	2016-04-21 13:42:17.170882	Concejal	\N
1974	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-21 13:42:17.174002	2016-04-21 13:42:17.174002	Concejal	\N
1975	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-21 14:01:34.181324	2016-04-21 14:10:47.502633	Concejal	\N
1976	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-21 14:10:47.504383	2016-04-21 14:10:47.504383	Concejal	\N
1977	Cabral, Maria del Carmen	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-21 14:10:47.507612	2016-04-21 14:10:47.507612	Concejal	\N
1978	Yawni, Viviana Andrea	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-21 14:10:47.510852	2016-04-21 14:10:47.510852	Concejal	\N
1979	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-21 14:39:16.601601	2016-04-21 14:39:16.601601	Concejal	\N
1980	Da Costa, Osvaldo	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-21 14:39:16.60507	2016-04-21 14:39:16.60507	Concejal	\N
1981	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-21 14:39:16.608263	2016-04-21 14:39:16.608263	Concejal	\N
1982	Dova, Mauricio	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-21 14:39:16.611487	2016-04-21 14:39:16.611487	Concejal	\N
1983	Cabral, Maria del Carmen	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-21 14:39:16.614483	2016-04-21 14:39:16.614483	Concejal	\N
1984	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-21 14:44:17.781834	2016-04-21 14:44:17.781834	Concejal	\N
1985	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-21 14:44:17.784968	2016-04-21 14:44:17.784968	Concejal	\N
1986	Gasó, Carlos	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-21 14:44:17.787823	2016-04-21 14:44:17.787823	Concejal	\N
1987	Perez Da Janoveira, Maria Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-21 14:44:17.790629	2016-04-21 14:44:17.790629	Concejal	\N
1988	Dova, Mauricio	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-21 14:44:17.793371	2016-04-21 14:44:17.793371	Concejal	\N
1989	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-21 14:44:17.796063	2016-04-21 14:44:17.796063	Concejal	\N
1990	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-21 14:44:17.798652	2016-04-21 14:44:17.798652	Concejal	\N
1991	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-21 14:44:17.801199	2016-04-21 14:44:17.801199	Concejal	\N
1992	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-21 14:44:17.803747	2016-04-21 14:44:17.803747	Concejal	\N
1993	Sirolesi, Silvia	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-21 14:44:17.806348	2016-04-21 14:44:17.806348	Concejal	\N
1994	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-21 14:50:52.129542	2016-04-21 14:50:52.129542	Concejal	\N
1995	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-21 14:50:52.133593	2016-04-21 14:50:52.133593	Concejal	\N
1996	Gasó, Carlos	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-21 14:50:52.137232	2016-04-21 14:50:52.137232	Concejal	\N
1997	Perez Da Janoveira, Maria Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-21 14:50:52.140716	2016-04-21 14:50:52.140716	Concejal	\N
1998	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-21 14:50:52.144017	2016-04-21 14:50:52.144017	Concejal	\N
1999	Dova, Mauricio	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-21 14:50:52.147304	2016-04-21 14:50:52.147304	Concejal	\N
2000	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-21 14:50:52.150521	2016-04-21 14:50:52.150521	Concejal	\N
2001	Sirolesi, Silvia	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-21 14:50:52.153779	2016-04-21 14:50:52.153779	Concejal	\N
2002	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-21 14:50:52.157162	2016-04-21 14:50:52.157162	Concejal	\N
2003	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-21 14:50:52.160583	2016-04-21 14:50:52.160583	Concejal	\N
2004	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-21 15:20:23.238322	2016-04-21 15:20:23.238322	Concejal	\N
2005	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-21 15:20:23.241875	2016-04-21 15:20:23.241875	Concejal	\N
2006	Gasó, Carlos	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-21 15:20:23.245093	2016-04-21 15:20:23.245093	Concejal	\N
2007	Perez Da Janoveira, Maria Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-21 15:20:23.248108	2016-04-21 15:20:23.248108	Concejal	\N
2008	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-21 15:20:23.251009	2016-04-21 15:20:23.251009	Concejal	\N
2009	Dova, Mauricio	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-21 15:20:23.253842	2016-04-21 15:20:23.253842	Concejal	\N
2010	Bergessio, Sara Dominga	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-21 15:20:23.256686	2016-04-21 15:20:23.256686	Concejal	\N
2011	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-21 15:20:23.259424	2016-04-21 15:20:23.259424	Concejal	\N
2012	Sirolesi, Silvia	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-21 15:20:23.262082	2016-04-21 15:20:23.262082	Concejal	\N
2013	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-21 15:20:23.264692	2016-04-21 15:20:23.264692	Concejal	\N
2043	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-27 14:32:24.327488	2016-04-27 14:32:24.327488	Concejal	\N
2044	Gasó, Carlos	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-27 14:32:24.330345	2016-04-27 14:32:24.330345	Concejal	\N
2073	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-27 15:57:48.228203	2016-04-27 15:57:48.228203	Concejal	\N
2074	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-27 15:57:48.231264	2016-04-27 15:57:48.231264	Concejal	\N
2075	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-27 15:57:48.234049	2016-04-27 15:57:48.234049	Concejal	\N
2076	Dova, Mauricio	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-27 15:57:48.236756	2016-04-27 15:57:48.236756	Concejal	\N
2077	Perez Da Janoveira, Maria Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-27 15:57:48.239614	2016-04-27 15:57:48.239614	Concejal	\N
2078	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-27 15:57:48.242448	2016-04-27 15:57:48.242448	Concejal	\N
2079	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-27 15:57:48.24517	2016-04-27 15:57:48.24517	Concejal	\N
2080	Gasó, Carlos	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-27 15:57:48.248252	2016-04-27 15:57:48.248252	Concejal	\N
2081	Sirolesi, Silvia	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-27 15:57:48.251278	2016-04-27 15:57:48.251278	Concejal	\N
2082	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-27 16:04:26.6716	2016-04-27 16:04:26.6716	Concejal	\N
2083	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-27 16:04:26.674915	2016-04-27 16:04:26.674915	Concejal	\N
2084	Miranda, Daniela 	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-27 16:04:26.677783	2016-04-27 16:04:26.677783	Concejal	\N
2085	Perez Da Janoveira, Maria Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-27 16:04:26.680536	2016-04-27 16:04:26.680536	Concejal	\N
2086	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-27 16:04:26.683215	2016-04-27 16:04:26.683215	Concejal	\N
2087	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-27 16:04:26.685785	2016-04-27 16:04:26.685785	Concejal	\N
2088	Dova, Mauricio	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-27 16:04:26.688329	2016-04-27 16:04:26.688329	Concejal	\N
2089	Sirolesi, Silvia	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-27 16:04:26.690888	2016-04-27 16:04:26.690888	Concejal	\N
2090	Gasó, Carlos	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-27 16:04:26.693362	2016-04-27 16:04:26.693362	Concejal	\N
2042	Sirolesi, Silvia	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-27 14:32:24.324078	2016-04-27 16:07:07.465356	Concejal	\N
2091	Dova, Mauricio	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-27 16:04:26.695857	2016-04-27 16:04:26.695857	Concejal	\N
2045	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-27 14:32:24.333171	2016-04-27 16:07:07.463883	Concejal	\N
2092	Yawni, Viviana Andrea	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-28 11:07:07.963679	2016-04-28 11:07:07.963679	Concejal	\N
2093	Bringas, Claudia	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-28 11:07:07.967256	2016-04-28 11:07:07.967256	Concejal	\N
2094	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-28 11:07:07.970567	2016-04-28 11:07:07.970567	Concejal	\N
2095	Carranza, Martin	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-28 11:07:07.973754	2016-04-28 11:07:07.973754	Concejal	\N
2104	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2016-05-05 10:40:48.738592	2016-05-05 10:40:48.738592	Concejal	\N
2105	Cabral, Maria del Carmen	\N	\N	\N	\N	\N	\N	\N	\N	2016-05-05 10:40:48.743077	2016-05-05 10:40:48.743077	Concejal	\N
2106	Yawni, Viviana Andrea	\N	\N	\N	\N	\N	\N	\N	\N	2016-05-05 10:40:48.746057	2016-05-05 10:40:48.746057	Concejal	\N
2107	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2016-05-05 10:40:48.748876	2016-05-05 10:40:48.748876	Concejal	\N
2108	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2016-05-05 10:43:55.309969	2016-05-05 10:43:55.309969	Concejal	\N
2109	Cabral, Maria del Carmen	\N	\N	\N	\N	\N	\N	\N	\N	2016-05-05 10:43:55.313979	2016-05-05 10:43:55.313979	Concejal	\N
2110	Yawni, Viviana Andrea	\N	\N	\N	\N	\N	\N	\N	\N	2016-05-05 10:43:55.317511	2016-05-05 10:43:55.317511	Concejal	\N
2111	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2016-05-05 10:43:55.321002	2016-05-05 10:43:55.321002	Concejal	\N
2112	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2016-05-05 10:47:58.066521	2016-05-05 10:47:58.066521	Concejal	\N
2113	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2016-05-05 10:47:58.069587	2016-05-05 10:47:58.069587	Concejal	\N
2114	Cabral, Maria del Carmen	\N	\N	\N	\N	\N	\N	\N	\N	2016-05-05 10:47:58.072465	2016-05-05 10:47:58.072465	Concejal	\N
2115	Yawni, Viviana Andrea	\N	\N	\N	\N	\N	\N	\N	\N	2016-05-05 10:47:58.075257	2016-05-05 10:47:58.075257	Concejal	\N
2120	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2016-05-05 11:00:15.876572	2016-05-05 11:00:15.876572	Concejal	\N
2121	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2016-05-05 11:00:15.881023	2016-05-05 11:00:15.881023	Concejal	\N
2122	Yawni, Viviana Andrea	\N	\N	\N	\N	\N	\N	\N	\N	2016-05-05 11:00:15.88501	2016-05-05 11:00:15.88501	Concejal	\N
2123	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2016-05-05 11:00:15.888685	2016-05-05 11:00:15.888685	Concejal	\N
2124	Cabral, Maria del Carmen	\N	\N	\N	\N	\N	\N	\N	\N	2016-05-05 11:00:15.892379	2016-05-05 11:00:15.892379	Concejal	\N
2125	Gasó, Carlos	\N	\N	\N	\N	\N	\N	\N	\N	2016-05-05 11:00:15.896402	2016-05-05 11:00:15.896402	Concejal	\N
2126	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2016-05-05 11:06:40.082746	2016-05-05 11:06:40.082746	Concejal	\N
2127	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2016-05-05 11:06:40.086148	2016-05-05 11:06:40.086148	Concejal	\N
2128	Gasó, Carlos	\N	\N	\N	\N	\N	\N	\N	\N	2016-05-05 11:06:40.089209	2016-05-05 11:06:40.089209	Concejal	\N
2129	Perez Da Janoveira, Maria Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2016-05-05 11:06:40.09225	2016-05-05 11:06:40.09225	Concejal	\N
2130	Dova, Mauricio	\N	\N	\N	\N	\N	\N	\N	\N	2016-05-05 11:06:40.095228	2016-05-05 11:06:40.095228	Concejal	\N
2131	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2016-05-05 11:06:40.098227	2016-05-05 11:06:40.098227	Concejal	\N
2132	Sirolesi, Silvia	\N	\N	\N	\N	\N	\N	\N	\N	2016-05-05 11:06:40.101238	2016-05-05 11:06:40.101238	Concejal	\N
2133	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2016-05-05 11:06:40.104203	2016-05-05 11:06:40.104203	Concejal	\N
2099	Carranza, Martin	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-28 11:09:25.587952	2016-04-28 11:09:25.587952	Concejal	\N
2100	Carranza, Martin	\N	\N	\N	\N	\N	\N	\N	\N	2016-05-04 14:15:23.575522	2016-05-04 14:15:23.575522	Concejal	\N
2101	Da Costa, Osvaldo	\N	\N	\N	\N	\N	\N	\N	\N	2016-05-04 14:15:23.579066	2016-05-04 14:15:23.579066	Concejal	\N
2102	Bringas, Claudia	\N	\N	\N	\N	\N	\N	\N	\N	2016-05-04 14:15:23.582443	2016-05-04 14:15:23.582443	Concejal	\N
2103	Perez Da Janoveira, Maria Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2016-05-04 14:15:23.585303	2016-05-04 14:15:23.585303	Concejal	\N
2116	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2016-05-05 10:50:32.6509	2016-05-05 10:50:32.6509	Concejal	\N
2117	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2016-05-05 10:50:32.654147	2016-05-05 10:50:32.654147	Concejal	\N
2118	Yawni, Viviana Andrea	\N	\N	\N	\N	\N	\N	\N	\N	2016-05-05 10:50:32.656998	2016-05-05 10:50:32.656998	Concejal	\N
2119	Cabral, Maria del Carmen	\N	\N	\N	\N	\N	\N	\N	\N	2016-05-05 10:50:32.659739	2016-05-05 10:50:32.659739	Concejal	\N
2134	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2016-05-05 11:30:37.243208	2016-05-05 11:30:37.243208	Concejal	\N
2135	Gasó, Carlos	\N	\N	\N	\N	\N	\N	\N	\N	2016-05-05 11:30:37.24672	2016-05-05 11:30:37.24672	Concejal	\N
2136	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2016-05-05 11:30:37.249753	2016-05-05 11:30:37.249753	Concejal	\N
2137	Perez Da Janoveira, Maria Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2016-05-05 11:30:37.252669	2016-05-05 11:30:37.252669	Concejal	\N
2138	Dova, Mauricio	\N	\N	\N	\N	\N	\N	\N	\N	2016-05-05 11:30:37.255521	2016-05-05 11:30:37.255521	Concejal	\N
2139	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2016-05-05 11:30:37.258362	2016-05-05 11:30:37.258362	Concejal	\N
2140	Sirolesi, Silvia	\N	\N	\N	\N	\N	\N	\N	\N	2016-05-05 11:30:37.261209	2016-05-05 11:30:37.261209	Concejal	\N
2141	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2016-05-05 11:30:37.263942	2016-05-05 11:30:37.263942	Concejal	\N
2142	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2016-05-05 12:03:16.053286	2016-05-05 12:03:16.053286	Concejal	\N
2143	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2016-05-05 12:03:16.056586	2016-05-05 12:03:16.056586	Concejal	\N
2144	Sirolesi, Silvia	\N	\N	\N	\N	\N	\N	\N	\N	2016-05-05 12:03:16.059542	2016-05-05 12:03:16.059542	Concejal	\N
2145	Cabral, Maria del Carmen	\N	\N	\N	\N	\N	\N	\N	\N	2016-05-05 12:03:16.062377	2016-05-05 12:03:16.062377	Concejal	\N
2146	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2016-05-05 12:03:16.065115	2016-05-05 12:03:16.065115	Concejal	\N
2147	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2016-05-05 12:03:16.068211	2016-05-05 12:03:16.068211	Concejal	\N
2148	Perez Da Janoveira, Maria Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2016-05-05 12:03:16.071193	2016-05-05 12:03:16.071193	Concejal	\N
2149	Gasó, Carlos	\N	\N	\N	\N	\N	\N	\N	\N	2016-05-05 12:07:28.909855	2016-05-05 12:07:28.909855	Concejal	\N
2150	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2016-05-05 12:07:28.912951	2016-05-05 12:07:28.912951	Concejal	\N
2151	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2016-05-05 12:07:28.915724	2016-05-05 12:07:28.915724	Concejal	\N
2152	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2016-05-05 12:07:28.918541	2016-05-05 12:07:28.918541	Concejal	\N
2153	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2016-05-05 12:12:56.958272	2016-05-05 12:12:56.958272	Concejal	\N
2154	Perez Da Janoveira, Maria Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2016-05-05 12:12:56.961592	2016-05-05 12:12:56.961592	Concejal	\N
2155	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2016-05-05 12:12:56.964373	2016-05-05 12:12:56.964373	Concejal	\N
2156	Pomiglio, Viviana Concepcion	\N	\N	\N	\N	\N	\N	\N	\N	2016-05-05 12:12:56.967251	2016-05-05 12:12:56.967251	Concejal	\N
2157	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2016-05-05 12:26:17.827498	2016-05-05 12:36:47.522981	Concejal	\N
2158	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2016-05-05 12:36:47.541945	2016-05-05 12:36:47.541945	Concejal	\N
2159	Gasó, Carlos	\N	\N	\N	\N	\N	\N	\N	\N	2016-05-05 12:36:47.545417	2016-05-05 12:36:47.545417	Concejal	\N
2160	Perez Da Janoveira, Maria Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2016-05-05 12:36:47.548202	2016-05-05 12:36:47.548202	Concejal	\N
2161	Dova, Mauricio	\N	\N	\N	\N	\N	\N	\N	\N	2016-05-05 12:36:47.551007	2016-05-05 12:36:47.551007	Concejal	\N
2162	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2016-05-05 12:36:47.553755	2016-05-05 12:36:47.553755	Concejal	\N
2163	Sirolesi, Silvia	\N	\N	\N	\N	\N	\N	\N	\N	2016-05-05 12:36:47.556446	2016-05-05 12:36:47.556446	Concejal	\N
2164	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2016-05-05 12:36:47.559197	2016-05-05 12:36:47.559197	Concejal	\N
2165	Cantoro, Olga Isabel	\N	\N	\N	\N	\N	\N	\N	\N	2016-05-05 12:43:25.196197	2016-05-05 12:43:25.196197	Concejal	\N
2166	Ontivero, Hipolito	\N	\N	\N	\N	\N	\N	\N	\N	2016-05-05 12:43:25.199495	2016-05-05 12:43:25.199495	Concejal	\N
2167	Gasó, Carlos	\N	\N	\N	\N	\N	\N	\N	\N	2016-05-05 12:43:25.202444	2016-05-05 12:43:25.202444	Concejal	\N
2168	Perez Da Janoveira, Maria Leticia	\N	\N	\N	\N	\N	\N	\N	\N	2016-05-05 12:43:25.205361	2016-05-05 12:43:25.205361	Concejal	\N
2169	Dova, Mauricio	\N	\N	\N	\N	\N	\N	\N	\N	2016-05-05 12:43:25.208222	2016-05-05 12:43:25.208222	Concejal	\N
2170	Barotti, Jose	\N	\N	\N	\N	\N	\N	\N	\N	2016-05-05 12:43:25.211061	2016-05-05 12:43:25.211061	Concejal	\N
2171	Varela, Francisco	\N	\N	\N	\N	\N	\N	\N	\N	2016-05-05 12:43:25.213851	2016-05-05 12:43:25.213851	Concejal	\N
2172	Sirolesi, Silvia	\N	\N	\N	\N	\N	\N	\N	\N	2016-05-05 12:43:25.216658	2016-05-05 12:43:25.216658	Concejal	\N
\.


--
-- Name: personas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('personas_id_seq', 2172, true);


--
-- Data for Name: personas_tramites; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY personas_tramites (persona_id, tramite_id) FROM stdin;
\.


--
-- Data for Name: relationship_concejals; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY relationship_concejals (id, suplente_id, titular_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: relationship_concejals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('relationship_concejals_id_seq', 1, false);


--
-- Data for Name: reparticion_oficials; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY reparticion_oficials (id, denominacion, created_at, updated_at) FROM stdin;
\.


--
-- Name: reparticion_oficials_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('reparticion_oficials_id_seq', 1, false);


--
-- Data for Name: rols; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY rols (id, tipo, created_at, updated_at) FROM stdin;
\.


--
-- Name: rols_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('rols_id_seq', 1, false);


--
-- Data for Name: rols_usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY rols_usuarios (usuario_id, rol_id) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY schema_migrations (version) FROM stdin;
20150624142727
20150624142848
20150625115116
20150625135933
20150625135954
20150625140337
20150625141615
20150625142554
20150625143213
20150625143804
20150630115051
20150630120135
20150630121309
20150630125432
20150630125925
20150630130314
20150630132040
20150630132922
20150630133448
20150702115912
20150702123022
20150702140218
20150702140427
20150702140530
20150703121851
20150703122511
20150706120739
20150706122456
20150706125112
20150706132758
20150706133446
20150706133837
20150706134226
20150706144756
20150707114556
20150707134821
20150708113948
20150708115919
20150708131117
20150708131645
20150708131822
20150708132820
20150708133146
20150708133357
20150708134012
20150710121642
20150710131603
20150710131704
20150710132506
20150710133256
20150710135149
20150710135219
20150710135225
20150710135235
20150710135756
20150710141910
20150710142258
20150710142628
20150710142800
20150710145515
20150713114921
20150713124024
20150713124910
20150713125920
20150713130534
20150713130847
20150713135130
20150713141525
20150713142416
20150713143138
20150713144402
20150713144728
20150713145814
20150714142603
20150716132317
20150720122528
20150721140053
20150727113450
20150727135058
20150730131643
20150803133924
20150804144542
20150804145657
20150807121245
20150810124203
20150811134127
20150812134043
20150813123639
20150820130728
20150824133559
20150914145919
20150914150542
20150918142357
20150921123909
20150922142608
\.


--
-- Data for Name: seccions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY seccions (id, nombre, created_at, updated_at) FROM stdin;
\.


--
-- Name: seccions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('seccions_id_seq', 1, false);


--
-- Data for Name: sesions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY sesions (id, nro, observacion, tipo1, tipo2, diario_de_sesion_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: sesions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sesions_id_seq', 1, false);


--
-- Data for Name: sub_seccions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY sub_seccions (id, nombre, seccion_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: sub_seccions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sub_seccions_id_seq', 1, false);


--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tags (id, nombre, created_at, updated_at) FROM stdin;
\.


--
-- Name: tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tags_id_seq', 1, false);


--
-- Data for Name: titulos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY titulos (id, nombre, libro_id, created_at, updated_at, orden) FROM stdin;
\.


--
-- Name: titulos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('titulos_id_seq', 1, false);


--
-- Data for Name: tramites; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tramites (id, nro_fojas, asunto, responsable, tipo_contribucion, condicion_contribuyente, observaciones, type, created_at, updated_at, expediente_id, destino, iniciador, domicilio, telefono, email, nro_exp, anio_exp, bis_exp, comision, concejales_firmantes, usuario, fecha) FROM stdin;
3554	3	Proyecto de Resolución en la que se Declara de Interés Cultural el evento TEDx Río Cuarto a realizarse el día 9 de Octubre en la Ciudad de Río Cuarto.	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 22696- Sesión nº 153- elevada a la comisión de cultura c/fecha de recibido el 25/09/2015	Peticion	2015-09-23 15:26:17.471084	2015-09-28 16:56:44.417939	\N		Cjal. Fco Varela				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3552	3	Eleva nota solicitando al secretario de Desarrollo Urbano, Obras y Servicios Públicos, Sr, Jorge Mendez, la intervencion del Registro Civil de Barrio Alberdi realizando los arreglos correspondientes.	\N	\N	\N	DEVOLUCIÓN -Nota convertida en Expediente Legislativo Nº 22697- incorporado en Sesión nº 153- elevada a la comisión de obras públicas y servicios públicos c/fecha de recibido el 25/09/2015	Peticion	2015-09-23 14:58:01.087586	2015-09-28 17:00:23.005671	\N		Cjal. Sara Bergessio				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3987	1	\N	\N	\N	\N		Despacho	2015-11-25 15:35:52.164351	2015-11-26 10:59:03.486705	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-11-25
3551	4	Solicita pasajes  (ida y vuelta) a ciudad de Cba por motivos de salud	\N	\N	\N		Peticion	2015-09-23 14:57:02.066534	2015-09-23 15:00:24.529944	\N		Rosa Catalina Rodriguez	Achalay 804	40358-4649175		\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
3567	1	\N	\N	\N	\N	Fecha de recepción: 23/09/2015	Despacho	2015-09-24 14:53:40.488393	2015-09-24 14:53:40.488393	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-09-23
3986	1	\N	\N	\N	\N		Despacho	2015-11-25 15:34:13.854625	2015-11-26 11:02:22.396842	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-11-25
3985	2	\N	\N	\N	\N		Despacho	2015-11-25 15:29:45.198703	2015-11-26 11:05:07.570817	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-11-25
3576	1	Informa sobre modificaciones en el personal	\N	\N	\N	Se hizo entrega de Original a Carina Candellero.	Peticion	2015-09-28 13:27:38.887915	2015-09-29 12:57:47.403483	\N		Concejal Mauricio Dova. Bloque Union por Cordoba. Frente Para La Victoria.				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
3570	15	Solicita Eximiciòn- Condonaciòn- Impuesto Patente- Inmobiliario 	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 22698, Sesión Nº 154 -Comisión de Economía -recibida por la comisión 2/10/2015	Condonacion	2015-09-25 11:10:35.935944	2015-10-05 12:44:35.288015	\N	\N	Murua Walter Ladislao	Mariquita Sanchez de Thompson 203	4621387 - 154183577		\N	\N	\N	\N	\N	rarias@entrada.com	\N
3555	4	Eleva nota solicitando dos pasajes de ida y vuelta a la ciudad de Córdoba para el Sr. Gustavo Victorio REARTES	\N	\N	\N		Peticion	2015-09-23 15:51:09.254338	2015-09-23 15:51:09.254338	\N		Cjal. Humberto Benedetto	Sarmiento 2904			\N	\N	\N	\N	\N	gfantino@entrada.com	\N
3553	16	Solicita Eximiciòn - Condonaciòn - Emos- Inmobiliario	\N	\N	\N		Condonacion	2015-09-23 15:13:23.271968	2015-09-23 16:33:59.237464	\N	\N	Pellegrini Norberto	Las Heras 1032	358 - 154115602		\N	\N	\N	\N	\N	mechenique@entrada.com	\N
3546	18	Envia informe solicitado por el Concejal Jorge Barotti ( Bloque Union por Cordoba- Frente por la Victoria, ( los mismos en referencia a los expedientes del Concejo Deliberante Nro 22302/2015, 22581/2015  22494/2015	\N	\N	\N		Peticion	2015-09-23 12:31:29.148911	2015-09-23 17:10:03.725267	\N	remitido al concejal barotti por el secretario del cuerpo 23/09/15	Jorge A. Mendez. Secretario de desarrollo Urbano Obras y Servicios Publicos				\N	\N	\N	\N	\N	gfantino@entrada.com	\N
3549	15	Solicita Eximiciòn  - Condonaciòn Impuesto Inmobiliario	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 22693- Sesión nº 153- elevada a la comisión de Economía  c/ fecha de recibido el 25/09/2015	Condonacion	2015-09-23 13:48:04.644619	2015-09-28 16:51:00.931141	\N	\N	Rosales Julio Cesar	Soler 2960	358- 155143880		\N	\N	\N	\N	\N	rarias@entrada.com	\N
3547	2	Proyecto de Resoluciòn en el que se aprueba el Convenio de Pasantias firmado con la UNRC	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 22691- Sesión nº 153- elevada a la comisión de Gobierno c/ fecha de recibido el 25/09/2015	Peticion	2015-09-23 13:25:45.289946	2015-09-28 16:39:47.09595	\N	Secretaria del Concejo Deliberante	DEM	Municipalidad de Rìo Cuarto			\N	\N	\N	\N	\N	rarias@entrada.com	\N
3548	2	Proyecto de Ordenanza en la que se desafecta el dominio Pùblico Municipal  afectandose al dominio privado la fracciòn de terreno consistente en un poligono delineado entre los puntos A, B, C , D  del plano anexo.\r\n  	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 22692- Sesión nº 153- elevada a la comisión de Planificación y Desarrollo sustentable  c/ fecha de recibido el 25/09/2015	Peticion	2015-09-23 13:30:03.224521	2015-09-28 16:48:37.643455	\N	Secretaria del Concejo Deliberante	DEM	Municipalidad de Rìo Cuarto 			\N	\N	\N	\N	\N	rarias@entrada.com	\N
3556	\N	\N	\N	\N	\N		Despacho	2015-09-24 12:16:09.500486	2015-09-24 12:16:09.500486	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	\N
3568	1	\N	\N	\N	\N	Fecha de recepción: 23/09/2015	Despacho	2015-09-24 14:54:15.905515	2015-09-24 14:55:22.290965	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-09-23
3557	\N	\N	\N	\N	\N		Despacho	2015-09-24 12:22:01.617626	2015-09-24 12:22:01.617626	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-09-23
3558	\N	\N	\N	\N	\N		Despacho	2015-09-24 12:39:15.752586	2015-09-24 12:39:15.752586	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	\N
3559	\N	\N	\N	\N	\N		Despacho	2015-09-24 12:40:58.810057	2015-09-24 12:44:53.520534	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-09-23
3560	6	Solicita Eximiciòn Impuesto Inmobiliario	\N	\N	\N		Condonacion	2015-09-24 12:49:15.473009	2015-09-24 13:09:58.090552	\N	\N	Bazan Iris Maria Julia	DIinkeldein 365	4623585		\N	\N	\N	\N	\N	mechenique@entrada.com	\N
3562	\N	\N	\N	\N	\N		Despacho	2015-09-24 13:28:38.360949	2015-09-24 13:32:37.751587	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-09-23
3563	\N	\N	\N	\N	\N		Despacho	2015-09-24 13:53:14.456278	2015-09-24 13:53:14.456278	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-09-23
3564	\N	\N	\N	\N	\N		Despacho	2015-09-24 14:13:03.909371	2015-09-24 14:13:03.909371	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-09-23
3565	1	\N	\N	\N	\N	Fecha de recepción: 23/09/2015	Despacho	2015-09-24 14:42:21.96323	2015-09-24 14:45:35.851998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-09-22
3566	1	\N	\N	\N	\N	Fecha de recepción: 23/09/2015	Despacho	2015-09-24 14:48:56.907484	2015-09-24 14:48:56.907484	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-09-22
3571	18	Solicitan Eximiciòn - Condonaciòn Inmobiliario Emos	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 22702, Sesión Nº 154 -Comisión de Economía -recibida por la comisión 2/10/2015	Condonacion	2015-09-25 12:37:19.3913	2015-10-05 12:56:18.70722	\N	\N	Ponce	Comisario Consigli 510	154268585		\N	\N	\N	\N	\N	rarias@entrada.com	\N
3569	39	Solicita Eximiciòn Condonaciòn - Emos  - Inmobiliario	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 22701, Sesión Nº 154 -Comisión de Economía -recibida por la comisión 2/10/2015	Condonacion	2015-09-24 15:01:28.044996	2015-10-05 12:47:31.729744	\N	\N	Chabaux Norma Aida	Pasaje Emilio Jautz 670	154361525		\N	\N	\N	\N	\N	rarias@entrada.com	\N
3573	11	Eximiciòn  Condonaciòn - Impuesto Inmobiliario 	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 22704, Sesión Nº 154 -Comisión de Economía -recibida por la comisión 2/10/2015	Condonacion	2015-09-25 14:13:18.403974	2015-10-05 12:57:53.479935	\N	\N	Molina Angela Esther	Pasaje Cervantes 486	358- 4630593		\N	\N	\N	\N	\N	rarias@entrada.com	\N
3574	10	Presidente EDECOM envia pedidos de Informe solicitado por el Concejal Josè Barotti 	\N	\N	\N	El Informe Ingreso por Mesa De Entrada\r\n	Peticion	2015-09-25 15:00:12.272635	2015-09-28 11:12:00.690804	\N	Mediante la Secretaria del Concejo se realiza un pase al Concejal Barotti	Sr. Oscar Artero Presidente de EDECOM 				\N	\N	\N	\N	\N	mechenique@entrada.com	\N
3575	22	Ord/ 1116/15 - 1135/15 - 1136/15 - 1137/15 - 1138/15 - 1139/15- 1140/15 - 1141/15 - 1142/15 - \r\nDecretos. 2967/15- 2969/15 - 3019/15 - 3023/15 - 3023/15 - 3030/15 - 3031/15 - 3032/15 - 3032/15 - 3033/15 - 3034/15 - 3035/15 - 3036/15 - 3037/15 - 3038/15 - 	\N	\N	\N		Peticion	2015-09-28 13:23:54.991173	2015-09-28 13:44:25.411034	\N	Informatica	DEM				\N	\N	\N	\N	\N	mechenique@entrada.com	\N
3577	1	Nota en la que se convoca a reunion el dia 29 de septienbre a las 11 hs. Designacion miembros Concejo de la Magistratura. Resolucion Nro 946/15	\N	\N	\N		Peticion	2015-09-28 14:02:04.171333	2015-09-28 14:07:15.407219	\N		Dr Herman Di Santo. Fiscal Municipal.				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
3550	3	Proyecto de Resolución mediante el cual se resuelve dirigirse a la Secretaria de Desarrollo Urbano, Obras Publicas y Vialidad para que disponga las medidas necesarias para el arreglo de vereda y rotura de pared en calle Sobremonte Nº 1497, domicilio correspondiente a la Sra. Hilda Alicia Pereyra.	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 22694- Sesión nº 153- elevada a la comisión de Obras Publicas c/fecha de recibido el 25/09/2015	Peticion	2015-09-23 13:59:14.684815	2015-09-28 16:53:22.293255	\N		Cjal. Maria del Carmen Cabral				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3583	\N	Solicita colaboracion economica para sonido en el encuentro que se realizara el dia viernes 16 de octubre a las 10 hs.	\N	\N	\N	Turno Tarde	Peticion	2015-09-28 22:02:07.568135	2015-09-28 22:02:07.568135	\N		Instituto Lanteriano La Merced. Nivel Superior. Lic Oste Silvina Claudia	Belisario Roldan 275	4661114- 154362204		\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
3582	1	Invitacion a sumarse a las actividades de celebracion del Festival Cultural por la Igualdad yla No Discriminacion, el dia 10 de octubre de 2015	\N	\N	\N	Nota dado de Baja por haber ingresado anteriormente con el nro 3528 del dìa 21/09 de mesa de Entrada.  Nro de Exp Legislativo 22678 	Peticion	2015-09-28 15:48:36.543678	2015-09-29 14:35:35.153378	\N		Mesa De La Diversidad	Rioja 151	0358-154863555. 0358155170287		\N	\N	\N	\N	\N	mechenique@entrada.com	\N
3580	11	Solicita ayuda economica para cubrir gastos de salud.	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 22706, Sesión Nº 154 -Comisión de Economía  Salud -recibida por las comisiones el 2/10/2015	Peticion	2015-09-28 14:31:55.710497	2015-10-05 13:02:42.408572	\N		Concejal Viviana Pomiglio Pomiglio. Bloque Rio Cuarto Para Todos	Pedro Goyena 215	tel 0358-4660068. cel 0358-154200097		\N	\N	\N	\N	\N	rarias@entrada.com	\N
3586	43	Eximiciòn Condonaciòn  - Inmobiliario	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 22709, Sesión Nº 154 -Comisión de Economía  -recibida por la comisión el 2/10/2015	Condonacion	2015-09-29 12:30:54.693587	2015-10-05 13:40:50.480606	\N	\N	Milos Lavich Vicenta Angela	Florencio Sanchez 1036	358 - 154161180		\N	\N	\N	\N	\N	rarias@entrada.com	\N
3720	1	Pedido Ayuda Económica para solventar gastos de viaje de Deporte realizado por Alumnos de Artes Marciales\r\nEl número de Celular pertenece al Sr Omar Olivieri 	\N	\N	\N	\r\nNota Convertida en Expediente Legislativo Nº 22788- Sesión 157 - Remitida a la Comisión de Economía y Presupuesto con fecha de 23/10/21015.	Peticion	2015-10-19 15:58:12.435906	2015-11-04 17:22:47.851365	\N	Secretaria del Concejo Deliberante	Biblioteca y Club Sportivo San Martin	Gaudard 508	358- 154246823		\N	\N	\N	\N	\N	rarias@entrada.com	\N
3756	1	Medicos del Hospital Central solicitan el Uso de la banca del Ciudadano para el dìa 29 del corriente mes  	\N	\N	\N	Expediente Legislativo Nº 22807, tratado en la sesión Nº 157	Peticion	2015-10-26 14:22:10.116292	2015-11-18 20:23:46.098551	\N	Secretaria del Concejo Deliberante	Equipo Interdisciplinario del Programa Integral de Celiaquia del Nuevo Hospital Rìo Cuarto				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3752	1	Solicitan Colaboraciòn para equipo de Audio	\N	\N	\N		Peticion	2015-10-23 15:02:57.016141	2015-10-23 15:06:40.64747	\N	Secretaria del Concejo Deliberante	Instituto Lanteriano La Merced	Belisario Roldan 275	358 - 4661114		\N	\N	\N	\N	\N	mechenique@entrada.com	\N
3766	2	\N	\N	\N	\N		Despacho	2015-10-28 13:28:34.624831	2015-10-28 13:38:20.935678	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-10-27
3754	7	Solicita dos pasajes Ida y vuelta a la ciudad de Buenos Aires por problemas de Salud ( 4 Pasajes )	\N	\N	\N		Peticion	2015-10-26 12:55:33.392637	2015-10-26 14:16:44.671716	\N	Contaduria Concejo Deliberante	Tisera Mirta Concepciòn	Liniers 1341	0358- 154830306		\N	\N	\N	\N	\N	mechenique@entrada.com	\N
3773	4	Proyecto de Resolucion. Declarar de interes Legislativo y Cultural la final Nacional del "World Latin Dance" a llevarse a cabo en la ciudad de Rio Cuarto del 4 al 6 de diciembre de 2015, con sede en Salon Fenix de esta ciudad.	\N	\N	\N	Expediente Legislativo Nº 22813, tratado en la sesión Nº 157	Peticion	2015-10-28 14:24:09.550198	2015-11-18 20:26:19.65038	\N		Presidente Concejo Deliberante    CLAUDIO MIRANDA				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3757	2	Proyecto. Modificaciòn Ordenanza 889/2014	\N	\N	\N	Expediente Legislativo Nº 22808, tratado en la sesión Nº 157	Peticion	2015-10-26 14:31:16.60631	2015-11-18 20:24:13.668288	\N	Secretaria del Concejo Deliberante	Concejal Viviana Pomiglio				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3776	3	Campeonato Argentino Sub 14 y Sub 18 de Bochas	\N	\N	\N	Expediente Legislativo Nº 22814, tratado en la sesión Nº 157	Peticion	2015-10-28 15:12:20.997391	2015-11-18 20:26:50.906969	\N		Presidente Concejo Deliberante    CLAUDIO MIRANDA				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3759	\N	Torneo de Voleibol, solicitan se Declare de Interes Legislativo y colaboraciòn 	\N	\N	\N		Peticion	2015-10-27 13:14:48.875861	2015-10-27 14:39:20.672878	\N	Secretaria del Concejo Deliberante	Newcom Ranqueles		0358- 154376647 - 0358- 155060715		\N	\N	\N	\N	\N	mechenique@entrada.com	\N
3765	2	\N	\N	\N	\N		Despacho	2015-10-28 13:25:57.024972	2015-10-28 14:32:41.052215	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-10-27
3767	1	\N	\N	\N	\N		Despacho	2015-10-28 13:45:22.813276	2015-10-28 14:39:49.546162	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-10-21
3768	2	\N	\N	\N	\N		Despacho	2015-10-28 13:50:42.716496	2015-10-28 14:44:16.334531	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-10-07
3777	9	Proyecto de Ordenanza por la que se modifica el Punto 4.8 del Plan Urbano de la ciudad de Rìo Cuarto - Ordenanza Nº 1082/11- en lo referido a los Clubes de Campo	\N	\N	\N	Expediente Legislativo Nº 22815, tratado en la sesión Nº 157	Peticion	2015-10-28 15:14:07.34409	2015-11-18 20:27:19.249001	\N	Secretaria del Concejo Deliberante	DEM				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3769	5	\N	\N	\N	\N		Despacho	2015-10-28 13:53:07.612601	2015-10-28 14:48:43.023533	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-10-28
3770	5	\N	\N	\N	\N		Despacho	2015-10-28 13:54:54.13392	2015-10-28 14:56:20.286298	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-10-28
3778	6	Proyecto de Ordenanza donde se otorga Personeria  Municipal a la Asociaciòn  Vecinal  Barrio Parque Alihuen  	\N	\N	\N	Expediente Legislativo Nº 22816, tratado en la sesión Nº 157	Peticion	2015-10-28 15:16:55.520117	2015-11-18 20:27:40.356033	\N	Secretaria del Concejo Deliberante	DEM				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3764	1	Solicita 1 pasaje de Ida hacia la Ciudad de Buenos Aires y 1 de Regreso a Rìo Cuarto	\N	\N	\N	Datos Personales: Leandro Ariel Plotinsky - DNI 26471157 - Castelli 90 - Piso 6 - Dpto F   	Peticion	2015-10-28 11:42:24.686221	2015-10-28 16:28:59.382663	\N	Contaduria Concejo Deliberante	Asociaciòn RioCuartense de Ajedrez	Alberdi 1028	No tenemos datos 		\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
3789	\N	\N	\N	\N	\N		Despacho	2015-10-28 16:30:15.10591	2015-10-29 11:15:59.989694	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-10-28
3784	1	\N	\N	\N	\N		Despacho	2015-10-28 15:53:12.257282	2015-10-29 11:51:27.931762	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-10-28
3783	1	\N	\N	\N	\N		Despacho	2015-10-28 15:42:42.359866	2015-10-29 11:54:09.923502	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-10-28
3782	\N	\N	\N	\N	\N		Despacho	2015-10-28 15:38:46.576876	2015-10-29 11:58:02.552721	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-09-29
3775	1	\N	\N	\N	\N		Despacho	2015-10-28 14:58:40.08415	2015-10-29 12:02:37.52202	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-10-28
3774	1	\N	\N	\N	\N		Despacho	2015-10-28 14:56:59.281082	2015-10-29 12:06:38.301666	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-10-28
3772	\N	\N	\N	\N	\N		Despacho	2015-10-28 13:57:33.298957	2015-10-29 12:26:38.484727	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-10-28
3771	\N	\N	\N	\N	\N		Despacho	2015-10-28 13:56:05.669879	2015-10-29 12:30:51.462246	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-10-28
3809	2	Nacimientos y Defunciones.	\N	\N	\N		Peticion	2015-11-03 14:51:02.225721	2015-11-03 14:57:28.960478	\N		Registro Civil Banda Norte	Avda Marcelo T. V. Alvear1120	0358-4671189/326/327		\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4867	2	\N	\N	\N	\N		Despacho	2016-05-04 15:30:48.421716	2016-05-05 11:00:15.866217	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-05-04
4870	1	\N	\N	\N	\N		Despacho	2016-05-04 15:36:58.877701	2016-05-05 12:07:28.905446	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-05-04
4868	1	\N	\N	\N	\N		Despacho	2016-05-04 15:33:30.399769	2016-05-05 12:40:03.644462	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-05-03
3587	5	Proyecto de Ordenanza Comisiòn de Economia y Presupuesto - Condonaciòn sobre Comercio e Industria a la Sra Cardozo Viviana Gladys	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 22712, Sesión Nº 154 -Comisión de Economía -recibida por la comisión el 2/10/2015	Peticion	2015-09-29 13:40:33.295306	2015-10-05 13:14:01.018356	\N		Concejal Benedetto - Cantoro - Pomiglio				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3609	1	Eleva nota solicitando un equipo de audio para el día viernes 2 de octubre del corriente para la realización de una procesión con San Francisco de Asís.-	\N	\N	\N		Peticion	2015-09-30 15:09:02.902146	2015-09-30 15:14:13.109538	\N		Graciela Cerutti de Poggi	Victor Hugo Nº 885	4627175		\N	\N	\N	\N	\N	gfantino@entrada.com	\N
3589	298	Proyecto de Ordenanza- Condonaciòn -Eximicion - Inmuebles y Cementerio	\N	\N	\N		Peticion	2015-09-29 13:43:27.177835	2015-09-29 15:28:13.714762	\N		Comisiòn de Economia y Presupuesto - Concejal Benededetto - Pomiglio - Barotti - Cantoro				\N	\N	\N	\N	\N	mechenique@entrada.com	\N
3545	3	Pedido de ayuda econòmica para poder concretar un viaje a la Ciudad Autònoma de Buenos Aires que tendrà lugar 21, 22 , y 23 de Octubre 	\N	\N	\N	nota que lleva tratamiento administrativo -ver c/ secretaria.	Peticion	2015-09-23 11:51:44.186532	2015-09-28 17:05:42.62605	\N		Estudiantes del Profesorado de Ciencias Jurìdicas, Politicas y Sociales de la UNRC	Pasaje Cafeto 2565	358 - 4123647		\N	\N	\N	\N	\N	rarias@entrada.com	\N
3584	47	Eximiciòn - Condonaciòn 	\N	\N	\N		Peticion	2015-09-29 11:55:44.448242	2015-09-29 12:10:49.916417	\N		Monte Guillermo Josè Enrique	Avenida Costanera 1050 - 2º Piso - Depart. C	358-154351825 - 4661708		\N	\N	\N	\N	\N	mechenique@entrada.com	\N
3592	16	Eximiciòn - Condonaciòn  Impuesto  Emos - Inmobiliario 	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 22714, Sesión Nº 154 -Comisión de Economía -recibida por la comisión el 2/10/2015	Condonacion	2015-09-29 14:15:41.837188	2015-10-05 13:43:08.892599	\N	\N	Gregorietti Raul Rufino	Leyes Obreras 178	358 - 4634005		\N	\N	\N	\N	\N	rarias@entrada.com	\N
3588	1	Informe de ausencia por participacion en XIV Encuentro Internacional de Derecho Ambiental el proximo miercoles 30 de septiembre.	\N	\N	\N		Peticion	2015-09-29 13:42:26.572156	2015-09-29 13:49:57.407215	\N		 Concejal Osvaldo Dacosta				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
3581	28	Con Caratula Nro 22705, Se le otorgo ayuda econòmica para afrontar gastos de salud 	\N	\N	\N		Peticion	2015-09-28 14:59:31.80429	2015-09-30 13:12:36.995817	\N		Miranda Rùben Moisès 				\N	\N	\N	\N	\N	mechenique@entrada.com	\N
3601	\N	Solicita ayuda economica para cubrir gastos de un dia y una noche en Sta Rosa de Calamuchita como viaje de egresados.	\N	\N	\N		Peticion	2015-09-30 13:05:57.388544	2015-09-30 13:24:33.905379	\N		Alumnos del Colegio IPEM Nº 27. ( Alejandra Andrada, madre responsable de la organizacion de eventos para recaudar fondos)	Maipu 775. Tercero A	0358-154254038		\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4858	1	\N	\N	\N	\N		Despacho	2016-05-04 15:11:22.958407	2016-05-05 10:50:32.645362	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-04-27
3603	1	Proyecto de Ordenanza .Nota recibida por Estudiantes de Ciencias Juridicas Solicitando ayuda Econòmica para realizar viaje a la ciudad de Buenos Aires	\N	\N	\N	Este pedido ingreso el dìa 23/09715 con Nº  de Mesa de Entrada 3545-\r\n-Nota convertida en Expediente Legislativo Nº 22719, Sesión Nº 154 -Comisión de Labor -recibida por la  comisión el 2/10/2015-	Peticion	2015-09-30 13:42:09.595014	2015-10-05 13:35:10.337037	\N		Concejal Humberto Benedetto				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3602	\N	Solicita pasaje por problemas de salud (ida y vuelta a ciudad de Cba)	\N	\N	\N		Peticion	2015-09-30 13:26:49.670437	2015-09-30 13:38:11.880742	\N		Oyola Patricia	Fray Cardarelli 134			\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
3585	10	Eximiciòn - Condonaciòn - Impuesto  Emos Inmobiliario	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 22710, Sesión Nº 154 -Comisión de Economía  -recibida por la comisión el 2/10/2015	Condonacion	2015-09-29 12:12:10.699188	2015-10-05 13:41:44.204511	\N	\N	Carrizo Mario Roque	Pedro Medrano 2483	358 - 154368260		\N	\N	\N	\N	\N	rarias@entrada.com	\N
3598	1	\N	\N	\N	\N		Despacho	2015-09-29 15:21:55.907434	2015-09-29 15:26:50.765752	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-09-29
3597	1	\N	\N	\N	\N		Despacho	2015-09-29 15:18:47.293324	2015-09-29 15:45:40.628045	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-09-29
3903	3	Solicita pasaje de ida iy vuelta a ciudad de Cordoba para la sra  Bibiana Valeria Montiel para presentarse en el Hospital San  Roque por motivos de salud.	\N	\N	\N		Peticion	2015-11-17 12:24:14.578432	2015-11-17 12:32:49.398515	\N		Cjal Martin Carranza		0358-154295513		\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
3595	3	Solicita se revea la resolucion Nº 774/14, como asi tambien la Nº 776/14, aprobads por el Concejo Deliberante de la cudad de Rio Cto que aun no se ha efectivizado.	\N	\N	\N		Peticion	2015-09-29 14:22:17.693434	2015-09-29 15:57:54.51345	\N		Laura Pilar Rodriguez. Ctro Educativo " Doctor Adolfo Alsina"	Avda Garibaldi 740	0358-4672920		\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
3591	2	Nota solicitando reveer la peticion de una nueva Sesion del Consejo Deliberante en el Ctro Educativo "Dr Adolfo Alsina"	\N	\N	\N		Peticion	2015-09-29 14:12:47.955922	2015-09-29 15:59:55.397462	\N		Laura Pilar Rodriguez. Ctro Educativo " Doctor Adolfo Alsina"	Avda Garibaldi 740	0358-4672920		\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
3593	1	Nota Solicitando una bandera de Ceremonias de la Pcia de Cordoba Cordoba	\N	\N	\N	EN DEVOLUCION	Peticion	2015-09-29 14:17:40.515134	2015-09-29 16:06:14.000398	\N		Laura Pilar Rodriguez. Ctro Educativo " Doctor Adolfo Alsina"	Avda Garibaldi 740	0358-4672920		\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
3590	251	Proyecto de Ordenanza  Condonaciones - Eximiciones Sobre Inmuebles y Automotor	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 22713, Sesión Nº 154 -Comisión de Economía -recibida por la comisión  el 2/10/2015	Peticion	2015-09-29 13:45:51.205406	2015-10-05 13:16:00.17163	\N	Secretaria del Concejo Deliberante	Comisiòn Economia y Presupuesto - Concejal  Benedetto - Barott i - Pomiglio - Cantoro				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3594	1	Solicita se le conceda una fecha y horario de visita a una reunion de comisiones para que puedan vivenciar el funcionamiento de la misma.	\N	\N	\N		Peticion	2015-09-29 14:21:47.935604	2015-09-29 16:14:18.829454	\N		Laura Pilar Rodriguez. Ctro Educativo " Doctor Adolfo Alsina"		0358-4672920		\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
3600	1	Formulan reclamo en referencia al acceso Sur de Rìo Cuarto	\N	\N	\N		Peticion	2015-09-30 11:51:54.951994	2015-09-30 11:58:07.81486	\N		Cooperativa de Trabajo para personas con Discapacidad "Todos Juntos"	Camino a Santa Flora ( Zona Autòdromo ) 	358- 154387139 - 4632141 - 4640930		\N	\N	\N	\N	\N	mechenique@entrada.com	\N
3608	3	Proyecto de Resolución en la que se destaca trayectoria del Sr. Carlos Guiglione por su labor en defensa de los derechos y el fortalecimiento de vínculos en la integración comunitaria a través del movimiento vecinalista.	\N	\N	\N		Peticion	2015-09-30 15:06:07.21531	2015-09-30 15:18:14.714598	\N		Cjal. Fco Varela y Cjal. H. Ontivero				\N	\N	\N	\N	\N	gfantino@entrada.com	\N
3607	1	\N	\N	\N	\N		Despacho	2015-09-30 15:02:01.590389	2015-09-30 15:26:54.403181	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-09-30
3578	2	Solicita ayuda economica  de $ 40000 (cuatro mil) y pasaje (ida y vuelta) en horario nocturno; desde ciudad de BS As a ntra ciudad y regreso. Tambien incorporar este evento en el programa que se llevara a cabo en el orden Municipal con el motivo de celebrar el nuevo aniversario de la ciudad de Rio Cuarto.	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 22707, Sesión Nº 154 -Comisión de Economía  Salud -recibida por las comisiones el 2/10/2015	Peticion	2015-09-28 14:17:59.584377	2015-10-05 13:03:37.309691	\N		Asociacion Riocuartense de Ajedrez	Alberdi 1028	0358-154011718		\N	\N	\N	\N	\N	rarias@entrada.com	\N
3606	5	\N	\N	\N	\N		Despacho	2015-09-30 14:58:06.151051	2015-09-30 16:10:39.008772	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-09-30
3605	1	\N	\N	\N	\N		Despacho	2015-09-30 14:54:55.120846	2015-09-30 16:07:45.48149	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-09-16
3604	1	\N	\N	\N	\N		Despacho	2015-09-30 14:51:42.825581	2015-09-30 16:03:53.497856	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-09-16
3612	\N	\N	\N	\N	\N		Despacho	2015-09-30 15:53:11.54092	2015-09-30 15:53:11.54092	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-09-30
3632	\N	Resolución 15217	\N	\N	\N	Nota convertida en expediente Legislativo Nº 22736- sesión Nº 155 - recibida por las comisiones de Economía -  -con fecha 9/10/2015	Peticion	2015-10-05 14:55:12.010918	2015-10-14 19:17:54.498583	\N		Secretaria de Economia				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3613	\N	\N	\N	\N	\N		Despacho	2015-09-30 16:13:57.137137	2015-09-30 16:13:57.137137	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	\N
3621	21	Proyecto de ordenanza otorgando el ciento por ciento (100%) de condonacion y eximicion de la deuda que mantiene en concepto de contribuciones que inciden sobre los inmuebles.	\N	\N	\N	Nota convertida en expediente Legislativo Nº 22729- sesión Nº 155 - recibida por la comisión  de Economía  -con fecha 9/10/2015	Peticion	2015-10-01 15:53:07.354143	2015-10-14 19:09:33.627112	\N		Consejal Jose Barotti		0358-154904447		\N	\N	\N	\N	\N	rarias@entrada.com	\N
3617	\N	\N	\N	\N	\N		Despacho	2015-09-30 16:19:17.385949	2015-10-01 14:33:46.512845	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-10-30
3620	6	Nomina de agentes que presentan irregularidades en la asistencia diaria al lugar de trabajo.	\N	\N	\N		Peticion	2015-10-01 14:49:37.517901	2015-10-01 14:53:26.139329	\N		Cra Libia Gonzalez. Subsecretaria de Recursos Humanos.				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
3616	\N	\N	\N	\N	\N		Despacho	2015-09-30 16:18:13.575954	2015-10-01 15:17:37.338238	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-10-30
3615	\N	\N	\N	\N	\N		Despacho	2015-09-30 16:17:18.813301	2015-10-01 15:35:53.752042	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-10-30
3614	\N	\N	\N	\N	\N		Despacho	2015-09-30 16:16:15.725786	2015-10-01 15:49:37.969502	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-09-30
3572	15	Solicita Eximiciòn Condonciòn - Impuesto Inmobiliario	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 22703, Sesión Nº 154 -Comisión de Economía -recibida por la comisión 2/10/2015	Condonacion	2015-09-25 14:00:07.626863	2015-10-05 12:57:15.128246	\N	\N	Fernandez Rosa	Pasaje Formosa 1473	358 - 154238150		\N	\N	\N	\N	\N	rarias@entrada.com	\N
3622	\N	Solicita pasaje a ciudad de Cba (ida y vuelta) por motivos de salud.	\N	\N	\N		Peticion	2015-10-02 12:56:36.543595	2015-10-02 13:18:09.002646	\N		Consejal Martin Carranza.( Bibiana Valeria Montiel)		0358-154295513		\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
3579	42	Resoluciòn  Nro 15206 - Rectificaciòn Presupuestarìa 	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 22708, Sesión Nº 154 -Comisión de Economía  -recibida por la comisión el 2/10/2015	Peticion	2015-09-28 14:19:03.701619	2015-10-05 13:05:19.52258	\N		Secretaria de Economia				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3761	2	Proyecto de resolucion. Solicita al Secretario de Desarrollo Urbano Obras y Servicios Publicos, Sr Jorge A. Mendez a traves del area que corresponda disponga la inmediata reparacion y/o arreglo para el correcto funcionamiento de los semaforos, que se encuentra en la interseccion Maipu y Roma.	\N	\N	\N	Expediente Legislativo Nº 22810, tratado en la sesión Nº 157	Peticion	2015-10-27 13:42:36.471896	2015-11-18 20:25:07.310529	\N		Cjal Leticia Pauluzzi ( Bloque Union Por Cba)				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3628	1	Solicita un tranporte con capacidad para 40 personas para poder participar del 15 festival de Bailarines y Musicos Especiales a realizarse el dia 14 y 15 del cte.\r\n\r\n\r\n	\N	\N	\N	Nota Convertida en Expediente Legislativo Nº 22758 -Sesión Nº 155 , Enviada a las comisiones de Economía - Cultura  , recibida el 9/10/2015.	Peticion	2015-10-05 13:02:25.481437	2015-10-14 19:53:07.481295	\N		Juntando Afectos Asociacion Civil	Trabajo y Prevision 930	0358-4640934/155076287		\N	\N	\N	\N	\N	rarias@entrada.com	\N
3623	4	Acuerdo de hemanamiento y cooperacion entre  la municipalidad de la ciudad de Rio Cto, Cordoba, Republica Argentina y la Municipalidad de la ciudad de Asuncion, Republica del Paraguay.	\N	\N	\N		Peticion	2015-10-02 13:30:31.065003	2015-10-02 14:47:44.019789	\N		Profesor Claudio Miranda Pte del Consejo Deliberante. Guillermo Natali Consejal  Presidente del Bloque UPC. Concejal Adriana Oviedo. Bloque Rio Cuarto para Todos.				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
3630	4	Resoluciòn. Declarar Personalidad Destacada de  Educaciòn al Sr. Hèctor Raùl Morales	\N	\N	\N	Nota convertida en expediente Legislativo Nº 22731- sesión Nº 155 - recibida por las comisiones de Gobierno -Cultura -con fecha 9/10/2015	Peticion	2015-10-05 13:35:00.851973	2015-10-14 19:11:24.925297	\N	Secretaria del Concejo Deliberante	Concejal Mauricio Dova				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3626	\N	El Presidente del Concejo hace entrega de libros traidos de su viaje de Asunciòn del Paraguay\r\nHistoria de la Junta Municipal de Asunciòn,Tomo 1 - Tomo 2\r\nLibro Verde de Asunciòn. \r\nUmbrales, Trapalanda\r\nEstos Libros se entregaran a Nerina Bertola para la Biblioteca del Concejo\r\n	\N	\N	\N		Peticion	2015-10-05 11:56:28.969778	2015-10-05 11:56:28.969778	\N	Biblioteca Del Concejo Deliberante	Presidente Concejo Deliberante    CLAUDIO MIRANDA	CONCEJO DELIBERANTE RIO CUARTO			\N	\N	\N	\N	\N	mechenique@entrada.com	\N
3561	11	Solicita Eximiciòn   Condonaciòn -  Inmobiliario	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 22700, Sesión Nº 154 -Comisión de Economía -recibida por la comisión 2/10/2015	Condonacion	2015-09-24 13:23:21.159073	2015-10-05 12:46:22.875567	\N	\N	Torres Herminia Mercedes	Coronel Dorrego 36	4646309		\N	\N	\N	\N	\N	rarias@entrada.com	\N
3596	11	Solicita Eximiciòn - Condonaciòn  Impuesto Cementerio 	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 22716, Sesión Nº 154 -Comisión de Economía -recibida por la comisión el 2/10/2015	Condonacion	2015-09-29 14:50:20.99393	2015-10-05 13:31:48.661229	\N	\N	Britos Mariela	Rio Limay - Casa 18	358 - 156014396		\N	\N	\N	\N	\N	rarias@entrada.com	\N
3599	5	Proyecto de Ordenanza en la que se Otorga a la señora Rosales Yesica Yanina domiciliada en calle Pje. Sanchez de Loria 1084 (Bº Alberdi), un aporte económico de $3.000 que sera destinado a solventar gastos de salud de su hijo	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 22717, Sesión Nº 154 -Comisión de Economía  Salud -recibida por las comisiones el 2/10/2015	Peticion	2015-09-29 15:53:33.340233	2015-10-05 13:32:52.44135	\N		Cjal. Daniela Miranda	Pje. Sanchez de Loria 1084 (Bº Alberdi) 			\N	\N	\N	\N	\N	rarias@entrada.com	\N
3611	2	Proyecto de ordenanza en el que se resuelve declarar de interes legislativo, comunitario y social las Jornadas "Operacion Vida" que realizara la Fundacio Rey de Reyes en ntra ciudad los dias 7, 8, y 9 de octubre de 2015.	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 22706, Sesión Nº 154 -Comisión de  Salud -recibida por la comisión  el 2/10/2015	Peticion	2015-09-30 15:40:19.931161	2015-10-05 13:36:42.652575	\N		Concejal Viviana Pomiglio. Concejal Maria Del Carmen Cabral.				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3610	3	Proyecto de Ordenanza en la que se convoca a oferta Pública para la adquisición por parte de la Municipalidad de Río Cuarto de lotes de terrenos para la continuidad del Programa Municipal "Mi lugar, mi sueño".	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 22722, Sesión Nº 154 -Comisión de Economía- Planificación , Desarrollo Sustentable. -recibida por las comisiones el 2/10/2015	Peticion	2015-09-30 15:36:25.330341	2015-10-05 13:38:21.002892	\N		Cjal. Eduardo Scopa				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3625	\N	Eleva nota solicitando ayuda económica destinada a gastos de salud de su hijo discapacitado.	\N	\N	\N	Nota convertida en expediente Legislativo Nº 22733- sesión Nº 155 - recibida por las comisiones de Economía - Salud -con fecha 9/10/2015	Peticion	2015-10-05 11:49:14.820009	2015-10-14 19:14:09.642206	\N		Noelia Elizabeth Marquez	Guemes 1800			\N	\N	\N	\N	\N	rarias@entrada.com	\N
3633	\N	Ordenanzas: 1132, 1144, 1145, 1145, 1147, 1148, 1149 y Decretos: 3034, 39, 40, 41, 42, 43, 45, 52, 53, 54, 55 del 2015	\N	\N	\N		Peticion	2015-10-05 14:55:44.32601	2015-10-05 14:55:44.32601	\N		DEM				\N	\N	\N	\N	\N	gfantino@entrada.com	\N
3634	\N	Resolucion Nª 15218	\N	\N	\N		Peticion	2015-10-05 15:00:36.725466	2015-10-05 15:12:34.303784	\N		Secretaria de Economia				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
3636	1	\N	\N	\N	\N		Despacho	2015-10-06 14:37:46.421284	2015-10-06 14:45:22.375168	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-10-06
3639	\N	\N	\N	\N	\N		Despacho	2015-10-06 15:01:29.487861	2015-10-06 15:01:29.487861	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	\N
3640	5	Eleva nota solicitando 2 (dos) pasajes ida y vuelta a la ciudad de Córdoba para la señora PEREYRA, Miriam Griselda domiciliada en calle Ranqueles 550, por razones de salud de su hijo.	\N	\N	\N		Peticion	2015-10-06 15:04:39.425277	2015-10-06 15:31:03.882878	\N		Cjal. Adriana Oviedo	Ranqueles 550			\N	\N	\N	\N	\N	gfantino@entrada.com	\N
3641	\N	\N	\N	\N	\N		Despacho	2015-10-06 15:04:47.048561	2015-10-06 16:12:41.791249	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-10-06
3642	\N	\N	\N	\N	\N		Despacho	2015-10-06 15:08:22.52191	2015-10-06 16:15:12.142077	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-10-06
3654	1	Oficio en la que solicita copia certificada de la Ordenanza Nº 896/15 a efectos de ser agregado a los autos caratulados "ALMIRON LEONARDO SILVIO C/ IVECOR SA Y OTRO - ORDINARIO - DESPIDO (EXP. 2040404)	\N	\N	\N		Peticion	2015-10-07 14:10:32.787813	2015-10-07 14:20:41.994267	\N		Gustavo Torasso	Sanit Remi 586	4633750		\N	\N	\N	\N	\N	gfantino@entrada.com	\N
3647	15	Proyecto de Ordenanza en la que se Otorga el ciento por ciento de Condonacion en Concepto de Contribuciones que inciden sobre los servicios sanitarios de agua y cloacas (EMOS).-	\N	\N	\N	Nota convertida en expediente Legislativo Nº 22741- sesión Nº 155 - recibida por la comisión de Economía  -con fecha 9/10/2015	Peticion	2015-10-06 15:23:01.700574	2015-10-14 19:21:41.314932	\N		Cjal. Samantha David, Cjal. Jose Barotti, Cjal Olga Cantoro, Cjal Humberto Benedetto, Cjal Francisco Varela				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3637	6	Proyecto de Resolucion en el que se otorga al Sr Ezequiel Michael Bravo un aporte economico por la suma de $ 2000 (dos mil) para afrontar gastos de salud.	\N	\N	\N	Nota convertida en expediente Legislativo Nº 22742- sesión Nº 155 - recibida por la comisión de Economía  - Salud -con fecha 9/10/2015	Peticion	2015-10-06 14:44:09.810172	2015-10-14 19:22:29.417466	\N		Consejal Mauricio Dova				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3646	\N	Proyecto de Ordenanza en la que se aprueban Condonaciones y Excimiciones sobre los Inmuebles 	\N	\N	\N	Nota convertida en expediente Legislativo Nº 22743- sesión Nº 155 - recibida por la comisión de Economía  -con fecha 9/10/2015	Peticion	2015-10-06 15:21:32.543766	2015-10-14 19:24:55.278382	\N		Comisiòn de Economia y Presupuesto. Cjal H. Benedetto, Cjal. Barotti, Cjal Samanta David Cjal. Geuna, Cjal. Cantoro y Cjal. Viviana Pomilio				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3648	\N	Proyecto de Ordenanza en la que se aprueba la Condonacion e Eximiciòn de la contribucion que incide sobre el inmueble y Automotores a diferentes contribuyentes de la Ciudad. 	\N	\N	\N	Nota convertida en expediente Legislativo Nº 22744- sesión Nº 155 - recibida por la comisión de Economía -con fecha 9/10/2015	Peticion	2015-10-06 15:23:51.847575	2015-10-14 19:25:59.305827	\N		Comisiòn de Economia y Presupuesto, Benedetto- Barotti - Cantoro - David - Varela - Pomiglio				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3651	\N	Proyecto de Ordenanza por el que sustituyen artículos de las ordenanzas Nros. 629/10, 910/10, 911/10 y 1194/11, relacionadas con el Régimen especial de venta de fracciones.	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 22747 - Sesión Nº 155 - Enviada a las Comisiones de Economía  - Planificación y Desarrollo Sustentable -recibida el 9/10/2015.	Peticion	2015-10-07 13:55:52.741452	2015-10-14 19:32:01.470847	\N		DEM				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3904	1	Solicita ayuda Economica para la realizaciòn de la Fiesta de Fin de Año que se ralizàra el dìa 28 de Noviembre	\N	\N	\N		Peticion	2015-11-17 13:19:21.47408	2015-11-17 13:33:43.698187	\N	Secretaria del Concejo Deliberante	ASOCIACIÒN TRABAJADORES DEL ESTADO	Cabrera 467	0358- 4622555 - 358 - 154269193 Contacto de Celular de la Sra Rafaela Alcoba Secretaria Adjunta		\N	\N	\N	\N	\N	mechenique@entrada.com	\N
3735	3	Solicita Pasajes ( dos, ida y vuelta a ciudad de Cba) por motivos de salud el 22 de octubre.	\N	\N	\N	( Sin datos)	Peticion	2015-10-21 15:15:58.12037	2015-10-21 16:00:35.130099	\N		Beatriz Maria Frasson.				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
3738	1	\N	\N	\N	\N		Despacho	2015-10-21 15:21:17.810536	2015-10-21 16:09:01.66966	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-10-14
3737	2	\N	\N	\N	\N		Despacho	2015-10-21 15:18:06.091813	2015-10-21 16:14:33.370763	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-10-21
3728	1	\N	\N	\N	\N		Despacho	2015-10-21 14:54:32.571747	2015-10-23 10:50:25.366828	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-10-21
3742	1	\N	\N	\N	\N		Despacho	2015-10-21 16:17:02.910054	2015-10-22 10:56:29.211563	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-10-21
3736	2	\N	\N	\N	\N		Despacho	2015-10-21 15:16:36.280977	2015-10-22 11:14:35.239466	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-10-21
3727	1	\N	\N	\N	\N		Despacho	2015-10-21 14:51:50.918836	2015-10-23 10:54:34.913666	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-10-21
3744	2	Solicita colaboracion para el festejo del dia de la madre para 60 (sesenta madres) el dia 24/10/2015	\N	\N	\N		Peticion	2015-10-22 11:40:28.462782	2015-10-22 11:59:54.024159	\N		Grupo Solidario Cadena de Favores. Monica Ortiz.	Pasaje Los Guaranies 465. Barrio Lomitas de Oro	0358- 4700177. cel 154323494	cadenasdefavores456@facebook.com	\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
3739	\N	Proyecto de Ordenanza para solicitar una ayuda economicac  viaje alumnos . Ctro Educativo Madre Teresa de Calcuta.	\N	\N	\N		Peticion	2015-10-21 15:23:03.059467	2015-10-22 13:04:05.524696	\N		Cejal Adriana Oviedo ( Bloque Rio Cuarto para todos)				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
3760	\N	Decretos:3064/15 - 3089/15 - 3090/15 -3091/15 - 3092/15 - 3093/15 - 3094/15 - 3095/15 - 3096/15 - 3102/15 \r\nOrdenanzas: 3150/15 -1158/15 -1159/15 - 1160/15 - 1161/15 - 1162/15 - 1163/15 - 1164/15- 1168/15 - 1175/15 - 1183/15 - 1184/15	\N	\N	\N		Peticion	2015-10-27 13:38:54.595622	2015-10-27 13:57:04.653911	\N	Arèa Informatica	DEM				\N	\N	\N	\N	\N	mechenique@entrada.com	\N
3755	5	Ayuda Economica por Problemas de Salud	\N	\N	\N	Expediente Legislativo Nº 22806, tratado en la sesión Nº 157	Peticion	2015-10-26 13:44:09.759017	2015-11-18 20:23:23.949913	\N	Secretaria del Concejo Deliberante	Gregotti Jesus Claudio Daniel	Nery Guerra 396	358- 154433842 - 358 - 155164358		\N	\N	\N	\N	\N	rarias@entrada.com	\N
3763	3	Proyecto de Ordenanza ante Reclamo de Vecinos Sector de la Escuela Racedo	\N	\N	\N	Expediente Legislativo Nº 22811, tratado en la sesión Nº 157	Peticion	2015-10-27 14:52:06.790565	2015-11-18 20:25:33.394969	\N	Secretaria del Concejo Deliberante	Concejal Eduardo Scoppa				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3758	3	Solicita 2 Pasajes de Ida y 2 de Regreso a la Ciudad de Còrdoba por problemas de Salud ( 4 Pasajes )	\N	\N	\N		Peticion	2015-10-27 13:05:05.60464	2015-10-27 13:10:23.395692	\N	Contaduria Concejo Deliberante	Arias Claudia Adriana	Jujuy 1620	0358- 154850279		\N	\N	\N	\N	\N	mechenique@entrada.com	\N
3781	4	Declarar de Interes Legislativo y Deportivo el "Torneo Nacional de NEWCON"  ( Voleibol adaptado para adultos mayores) los dias 14 y 15 de noviembre del cte año en instalaciones del Polideportivo Municipal nº 2 y Ctro 11.	\N	\N	\N	Expediente Legislativo Nº 22823, tratado en la sesión Nº 157	Peticion	2015-10-28 15:33:27.317318	2015-11-18 20:31:15.163892	\N		Presidente Concejo Deliberante    CLAUDIO MIRANDA				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3749	4	Convenio Marco de Colaboracion entre la Municipalidad de Rio Cuarto y la Camara de Almaceneros de Rio Cuarto.	\N	\N	\N	Expediente Legislativo Nº 22803, tratado en la sesión Nº 157	Peticion	2015-10-23 12:28:35.923081	2015-11-18 20:22:11.903633	\N		DEM 				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3812	1	Proyecto de Resoluciòn Solicita informe al Secretario de Salud, Deporte y Desarrollo Social Dr Gabriel Abrile	\N	\N	\N	Expediente Legislativo Nº 22842, tratado en Sesión Nº 159	Peticion	2015-11-03 15:18:49.406717	2015-11-18 20:44:21.294226	\N	Secretaria del Concejo Deliberante	Concejal Leticia Paulizzi				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3638	1	Listado de materiales para apoyoescolar y actividades ludicas aprobado en la sesion Nº 153 segun expediente Nº 22629	\N	\N	\N		Peticion	2015-10-06 15:01:10.315426	2015-10-06 15:13:47.002935	\N		Asociacion Civil La Cultural. Presidente Martin Fernandez	Rafael Obligado 246	0358-154312993		\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
3643	\N	\N	\N	\N	\N		Despacho	2015-10-06 15:11:16.129038	2015-10-06 16:21:00.823507	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-10-06
3644	\N	\N	\N	\N	\N		Despacho	2015-10-06 15:13:36.854251	2015-10-06 16:24:05.427554	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-10-06
3645	\N	\N	\N	\N	\N		Despacho	2015-10-06 15:16:24.556448	2015-10-06 16:27:10.83983	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-10-06
3655	1	Trabajadores Impectores de Transito	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 22749 - Sesión Nº 155 - Enviada a la Comisión de Gobierno -recibida el 9/10/2015.	Peticion	2015-10-07 14:19:41.307785	2015-10-14 19:35:14.182027	\N		ASOCIACIÒN TRABAJADORES DEL ESTADO.( Secretario Gral Federico Guiliani)	Cabrera 467	358- 4622555 - 154841330		\N	\N	\N	\N	\N	rarias@entrada.com	\N
3662	\N	\N	\N	\N	\N		Despacho	2015-10-07 15:01:00.493494	2015-10-07 15:35:14.420816	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-10-07
3653	1	Oficio en la que solicita copia certificada de la Ordenanza Nº 896/15 a efectos de ser agregado a los autos caratulados "CATANEO HUGO FABIAN C/ IVECOR SA Y OTRO - DESPIDO (EXP. 2039020)	\N	\N	\N		Peticion	2015-10-07 14:08:56.528049	2015-10-07 14:20:22.765711	\N		Gustavo Torasso	Sanit Remi 586	4633750		\N	\N	\N	\N	\N	gfantino@entrada.com	\N
3652	1	Oficio en la que solicita copia certificada de la Ordenanza Nº 896/15 a efectos de ser agregado a los autos caratulados "MIRANDA MIGUEL ANGEL C/ IVECOR SA Y OTRO - ORDINARIO (EXP. 2038703)	\N	\N	\N		Peticion	2015-10-07 14:07:17.00249	2015-10-07 14:21:03.307953	\N		Gustavo Torasso	Sanit Remi 586	4633750		\N	\N	\N	\N	\N	gfantino@entrada.com	\N
3650	\N	Proyecto de Ordenanza por el que se aprueban dos convenios suscriptos por el municipio y con la Asociación Civil Un Techo para Argentina\r\nc/ exp Administrativo DEM Nº 28369/2015.	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 22748 - Sesión Nº 155 - Enviada a las Comisiones de Gobierno - Salud -recibida el 9/10/2015.	Peticion	2015-10-07 13:52:02.723651	2015-10-14 19:34:07.710088	\N		DEM				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3673	6	Proyecto de Ordenanza en la que se establece un Régimen Extraordinario de Facilidades de Pago destinado a cancelar las obligaciones tributarias	\N	\N	\N	Nota Convertida en Expediente Legislativo Nº 22756 -Sesión Nº 155 , Enviada a la comisión de Economía , recibida  el 9/10/2015.	Peticion	2015-10-07 15:33:00.711438	2015-10-14 19:48:26.680138	\N		DEM				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3661	2	\N	\N	\N	\N		Despacho	2015-10-07 14:58:02.601263	2015-10-08 11:13:35.129005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-10-07
3659	2	\N	\N	\N	\N		Despacho	2015-10-07 14:55:08.37007	2015-10-07 15:38:40.252246	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-10-07
3660	3	Parte Diario DEFUNCIONES al 1º y 5º de Octubre del corriente	\N	\N	\N		Peticion	2015-10-07 14:57:47.172155	2015-10-07 15:02:17.727298	\N		Julia Flores (Jefa Seccional - Registro Civil Banda Norte)				\N	\N	\N	\N	\N	gfantino@entrada.com	\N
3663	\N	\N	\N	\N	\N		Despacho	2015-10-07 15:03:20.493114	2015-10-07 15:03:20.493114	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	\N
3657	5	Solicita ayuda para solventar gastos de salud y nesesidades basicas	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 22754 -Sesión Nº 155 - enviada a la Comisión de Economía - Salud -recibida el 9/10/2015	Peticion	2015-10-07 14:38:56.379048	2015-11-04 12:11:17.959056	\N		Cnsejal Leticia Pauluzzi. (sra Norma Mansilla)	Pje Santiago Drago 3134	358-154383309		\N	\N	\N	\N	\N	mechenique@entrada.com	\N
3678	1	Nota solicitando el uso del Hall del edificio del Consejo Deliberante durante los dias 9 al 13 de noviembre para realizar una muestra de los alumnos de la catedra ( Catedra de Urbanismo de la Facultad de Arquitectura de la ciudad de Mendoza)	\N	\N	\N	Se entrego copia a la Sra Nerina Bertola.	Peticion	2015-10-08 13:12:16.07078	2015-10-08 13:46:47.377307	\N		Arquitecto Alfredo Marinelli. (Catedra Urbanismo)	La Rioja 44	0358-154209026		\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
3679	19	Solicita Eximiciòn - Condonaciòn - Emos -  Inmobiliario del Sr Aguero Ramon Alfredo	\N	\N	\N	Nota convertida en Expediente Legislativo 22763 -Sesión Nº 156- remitido a la Comisión de Economía y Presupuesto con fecha 16/10/2015-	Peticion	2015-10-08 13:37:13.941089	2015-11-04 16:50:11.063885	\N	Secretaria del Concejo Deliberante	Concejal Samantha David	Leandro Alem 1034	358- 154908873 - 4663523		\N	\N	\N	\N	\N	rarias@entrada.com	\N
3724	1	Solicita ayuda Economica para participar de Campeonato de Malambo	\N	\N	\N	Nota Convertida en Expediente Legislativo Nº 22792- Sesión 157 - Remitida a las Comisiones de Desarrollo Humano, Educación y Cultura  Economía y Presupuesto - con fecha de 23/10/21015.	Peticion	2015-10-20 14:54:47.381613	2015-11-04 17:28:02.998455	\N	Secretaria del Concejo Deliberante	Quiroga Gonzalo Martin		358- 154328068		\N	\N	\N	\N	\N	rarias@entrada.com	\N
3658	17	Proyecto de Ordenanza otorgando condonación en concepto de Contribuciones que inciden sobre los Inmuebles a favor de la señora Hilda Simona Cardozo.	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 22753- Sesión Nº 155 - Enviada a la Comisión de economía -recibida el 9/10/2015.	Peticion	2015-10-07 14:52:27.719352	2015-10-14 19:43:11.549257	\N		Concejal Osvaldo Da Costa				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3675	\N	\N	\N	\N	\N		Despacho	2015-10-07 15:40:02.051515	2015-10-07 15:40:02.051515	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	\N
3670	3	Proyecto de Declaracion en la que se declara de interes legislativo y cultural el 15º Aniversario de la banda local NATURE a celebrarse el dia 16 de octubre del corriente en el Club El Sol	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 22751 - Sesión Nº 155 - Enviada a la Comisión de Cultura -recibida el 9/10/2015.	Peticion	2015-10-07 15:13:02.223464	2015-10-14 19:37:25.199432	\N		Cejal Martin Carranza				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3677	7	Solicita aporte economico de $ 3.070 (tres mil setenta pesos)  para compra de lentes recetados para su hija.	\N	\N	\N	Nota Convertida en Expediente Legislativo Nº 22759 -Sesión Nº 155 , Enviada a las comisiones de Economía - Salud , recibida el 9/10/2015.	Peticion	2015-10-07 15:56:17.522693	2015-10-14 19:54:11.434513	\N		Cejal Guillermo Natali  (Isaguirre Hugo Gustavo)	Rio Segundo 1928	0358-454300430		\N	\N	\N	\N	\N	rarias@entrada.com	\N
3671	2	\N	\N	\N	\N		Despacho	2015-10-07 15:13:06.245806	2015-10-08 12:17:01.397746	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-10-07
3649	\N	Adhesiòn a la ley de Talles	\N	\N	\N		Peticion	2015-10-07 13:48:18.96655	2015-10-19 11:55:11.406306	\N		Concejal Viviana Pomiglio				\N	\N	\N	\N	\N	mechenique@entrada.com	\N
3664	\N	\N	\N	\N	\N		Despacho	2015-10-07 15:04:57.80973	2015-10-07 16:15:40.159993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-10-07
3874	6	\N	\N	\N	\N		Despacho	2015-11-10 15:30:50.774549	2015-11-12 13:53:35.962393	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-11-10
3676	2	\N	\N	\N	\N		Despacho	2015-10-07 15:43:12.764444	2015-10-08 10:42:06.570176	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-10-06
3667	2	\N	\N	\N	\N		Despacho	2015-10-07 15:08:31.221275	2015-10-08 11:04:05.63712	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-10-07
3666	2	\N	\N	\N	\N		Despacho	2015-10-07 15:06:50.828546	2015-10-08 11:09:39.009988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-10-07
3668	1	\N	\N	\N	\N		Despacho	2015-10-07 15:11:30.408961	2015-10-08 12:50:14.59207	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-09-30
3876	5	\N	\N	\N	\N		Despacho	2015-11-10 15:33:22.470954	2015-11-12 14:02:16.063999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-11-10
3680	1	Solicita informe sobre Resolucion realizada con respecto a solicitud de condonacion correspondiente a dcilio en calle Malavia nroº 1042. Peticion iniciada el dia 23/07/1998 con Nª014566 de Mesa de Entrada, perteneciente a la sra Pomme Graciela Amalia.	\N	\N	\N		Peticion	2015-10-08 15:56:18.468298	2015-10-08 16:07:09.160823	\N		Pedro Daniel Miralles (OFICIO)	Montevideo 349	0358-4664437/ 154817322		\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
3681	\N	Libros donados para ser entregados a Presidencia Del Consejo y a los Bloques correspondientes.	\N	\N	\N		Peticion	2015-10-09 12:26:26.150145	2015-10-09 13:27:02.140796	\N	Biblioteca del Consejo Deliberante	Instituto Movilizador de Fondos Cooperativos				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
3690	4	Solicita Ayuda Econòmica para su Hija Natalia  Ayelèn Herrera quien padece de un Retraso Mental 	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 22770 -Sesión Nº 156 -Remitida a las Comisiones de Desarrollo Social, Salud y Deporte  - Economía y Presupuesto con fecha 16/10/2015.	Peticion	2015-10-13 12:45:34.973414	2015-11-04 16:57:51.540803	\N		Riviers Adriana Angèlica	Rio Quinto 728	0358- 154363572		\N	\N	\N	\N	\N	rarias@entrada.com	\N
3687	16	Proyecto de Ordenanza por el que se incrementa en Concepto de Honorarios a la  Dra. Claudia Valeria Gaitàn	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 22768- sesión 156 -Remitida a la Comisión de Economía y Presupuesto con fecha 16/10/2015	Peticion	2015-10-09 15:13:44.87318	2015-11-04 16:54:02.226555	\N		DEM				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3709	1	Solicitud del Uso de la Banca del Ciudadano	\N	\N	\N	Nota Convertida en Expediente Legislativo Nº 22778 -Sesión 156-Remitida a la comisión de Coordinación y Planificación de Labor, con fecha de recibido el 16/10/2015.	Peticion	2015-10-14 15:24:38.192868	2015-11-04 17:12:59.038977	\N		Colegio Italo Argentino Dante Alighieri	Lorenzo Suarez de Figueroa 2051 ( Altura Tejerina al 300 )	358 - 4627315		\N	\N	\N	\N	\N	rarias@entrada.com	\N
3685	3	RESOLUCIÒN  191/15-D, emanada del Directorio del EMOS, por la que se fija el coeficiente de aumento para el bimestre Septiembre/Octubre 2015	\N	\N	\N		Peticion	2015-10-09 15:07:30.616283	2015-10-09 15:40:40.114559	\N	Secretaria del Concejo Deliberante	DEM				\N	\N	\N	\N	\N	mechenique@entrada.com	\N
3695	1	Solicitud de Subsidio para Material Didàctico en Formaciòn Emprendedora	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 22772 Sesión 156- Remitida a las comisiones de Economía y Presupuesto - Cultura con fecha 16/10/2015.	Peticion	2015-10-14 13:34:34.622635	2015-11-04 17:03:11.166405	\N	Secretaria del Concejo Deliberante	Colegio Italo Argentino Dante Alighieri	Lorenzo Suarez de Figueroa 2051 ( Altura Tejerina al 300 )	358 - 4627315		\N	\N	\N	\N	\N	rarias@entrada.com	\N
3688	5	Solicita 2 Pasajes a la Ciudad de Còrdoba  de Ida y Vuelta para la Sra. Beatriz Frasson 	\N	\N	\N	No tenemos Domicilio ni Telef	Peticion	2015-10-09 15:48:13.684707	2015-10-09 15:48:13.684707	\N		Concejal Humberto Benedetto				\N	\N	\N	\N	\N	mechenique@entrada.com	\N
3684	\N	Proyecto de Ordenanza por la que se modifica la Ordenanza 1012/06 que dispone la adhesion de la municipalidad de Rio Cto al Programa Provincial Permanente de Prevencion y Control de Tabaquismo	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 22765- sesión 156 -Remitida a la  Comisión de Economía y Presupuesto con fecha 16/10/2015	Peticion	2015-10-09 15:07:12.234226	2015-11-04 16:51:59.383933	\N		DEM				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3710	2	Eleva nota solicitando un pasaje de ida y vuelta a Córdoba para el Señor Oscar O. Escudero, domiciliado en la calle Vicente Lopez 976 de la Ciudad de Río Cuarto.	\N	\N	\N		Peticion	2015-10-14 15:34:43.397891	2015-10-14 15:34:43.397891	\N		Cjal. Martin Carranza 	Vicente Lopez 976 (Barrio Alberdi).-			\N	\N	\N	\N	\N	gfantino@entrada.com	\N
3696	1	Solicitud de màs Infraestructura Sector Colegio: Pavimento y Cordòn Cuneta	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 22773 Sesión 156- Remitida a la comisión de  Obras Públicas y Vialidad con fecha 16/10/2015.	Peticion	2015-10-14 13:37:50.710658	2015-11-04 17:04:05.232699	\N	Secretaria del Concejo Deliberante	Colegio Italo Argentino Dante Alighieri	Lorenzo Suarez de Figueroa 2051 ( Altura Tejerina al 300 )	358 - 4627315		\N	\N	\N	\N	\N	rarias@entrada.com	\N
3698	1	"La Dante Emprende 2015" Solicitud de Reconocimiento de Interes Legislativo"	\N	\N	\N	Nota Convertida en Expediente Legislativo Nº 22775 -Sesión 156 - remitida a la Comisión de Desarrollo Humano, Educación y Cultura con fecha 16/10/2015.	Peticion	2015-10-14 13:43:45.776811	2015-11-04 17:07:23.150094	\N	Secretaria del Concejo Deliberante	Colegio Italo Argentino Dante Alighieri	Lorenzo Suarez de Figueroa 2051 ( Altura Tejerina al 300 )	358 - 4627315		\N	\N	\N	\N	\N	rarias@entrada.com	\N
3691	\N	Solicita Pasaje (ida y vuelta) ciudad de Cba para el 16 del cte por motivos de salud.	\N	\N	\N		Peticion	2015-10-13 13:38:58.837203	2015-10-13 13:50:45.52433	\N		Florencia Soledad Nasotti		0358-154110460		\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
3700	4	Proyecto de Resolucion. Declarar de interes educativo el festival de las aves 2015 que dara comienzo el dia miercoles 14 de octubre y declarar Octubre como mes de las aves a partir de 2015 en adelante.	\N	\N	\N	Nota Convertida en Expediente Legislativo Nº 22776 -Sesión 156 - Aprobado sobre Tablas con Resolución Nº 994/15.	Peticion	2015-10-14 14:13:50.250988	2015-11-04 17:09:07.731935	\N		Cjal Francisco Varela Geuna ( Bloque Rio Cuarto Para Todos)				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3692	2	Solicita pasaje (ida y vuelta) a ciudad de Cba para el dia 14 de octubre del cte por problemas de salud de su nieto.	\N	\N	\N		Peticion	2015-10-13 13:56:00.737752	2015-10-13 14:07:05.302649	\N		Maria Gladys Falcon	Amtartida Argentina 1041	0358-154244839		\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
3693	5	Solicita dos Pasajes a la cIudad de Còrdoba por razones de Salud para el Sr Fanor Burgos Acuña	\N	\N	\N		Peticion	2015-10-13 14:35:28.504388	2015-10-13 14:38:20.628242	\N	Contaduria Concejo Deliberante	Concejal Eduardo Scoppa	Felipe Neri Guerra 435 ( B.N )	358 - 4645598		\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4170	1	\N	\N	\N	\N		Despacho	2015-12-21 14:08:30.487538	2015-12-22 14:09:45.677677	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-21
3708	2	Proyecto de Resolucion  en el que se declara de interes cultural  la presentacion del libro " De Mujercitas y de Hombrecitos" del autor riocuartense Ruben Osvaldo Lucero, prevista para el sabado 7 de noviembre en el Salon Blanco de la Municipalidad de Rio Cuarto.	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 22777- Sesión 156- remitida a la Comisión de Desarrollo Humano, Educación y Cultura con fecha 16/10/2015.	Peticion	2015-10-14 14:38:26.051529	2015-11-04 17:10:41.806876	\N		Cjal Osvaldo Dacosta				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3706	1	\N	\N	\N	\N		Despacho	2015-10-14 14:29:48.579753	2015-10-14 16:08:17.627413	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-10-06
3878	4	\N	\N	\N	\N		Despacho	2015-11-10 15:35:53.281125	2015-11-12 14:09:50.053829	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-11-10
3701	2	\N	\N	\N	\N		Despacho	2015-10-14 14:15:20.370069	2015-10-14 15:43:17.905441	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-10-14
3699	1	\N	\N	\N	\N		Despacho	2015-10-14 14:13:43.866671	2015-10-14 15:16:14.357413	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-09-09
3702	1	\N	\N	\N	\N		Despacho	2015-10-14 14:17:03.228024	2015-10-14 15:47:40.894347	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-10-14
3703	1	\N	\N	\N	\N		Despacho	2015-10-14 14:19:14.191705	2015-10-14 15:52:02.467215	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-10-14
3704	1	\N	\N	\N	\N		Despacho	2015-10-14 14:25:03.22683	2015-10-14 15:55:38.465963	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-10-14
3705	1	\N	\N	\N	\N		Despacho	2015-10-14 14:26:55.473473	2015-10-14 16:02:44.939631	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-10-14
3618	5	Solicita ayuda economica por problemas diversos de salud	\N	\N	\N	Nota convertida en expediente Legislativo Nº 22727- sesión Nº 155 - recibida por las comisiones de Economía - Salud -con fecha 9/10/2015	Peticion	2015-09-30 22:09:01.733008	2015-10-14 19:06:34.606401	\N		Julio Humbrto Echenique	Mar Chiquita 621	0358-154874506		\N	\N	\N	\N	\N	rarias@entrada.com	\N
3619	\N	Proyecto de resolucion\r\nTema: Control, poda y extraccion de arboles secos: Plaza Emilio Jautz de calle Cabrera y Sadi Carnot, altura 500, 600 y 700.	\N	\N	\N	Nota convertida en expediente Legislativo Nº 22728- sesión Nº 155 - recibida por las comisión de servicios Públicos y Transporte con fecha 9/10/2015	Peticion	2015-10-01 12:21:46.416192	2015-10-14 19:08:20.626865	\N		Consejal Adriana Oviedo				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3629	8	Solicita ayuda economica para afrontar gastos por la compra de anteojos para su madre e hija.	\N	\N	\N	Nota convertida en expediente Legislativo Nº 22732- sesión Nº 155 - recibida por las comisiones de Economía - Salud -con fecha 9/10/2015	Peticion	2015-10-05 13:18:16.022647	2015-10-14 19:12:55.618658	\N		Viviana Gatica	Pasaje Baez 1435	0358-154283780		\N	\N	\N	\N	\N	rarias@entrada.com	\N
3627	8	Solicita ayuda economica para afrontar problemas de salud.	\N	\N	\N	Nota convertida en expediente Legislativo Nº 22734- sesión Nº 155 - recibida por las comisiones de Economía - Salud -con fecha 9/10/2015	Peticion	2015-10-05 12:21:48.333397	2015-10-14 19:15:34.054983	\N		Silvia Rosana Arias	Buenos Aires 463 PB	0358-154282851		\N	\N	\N	\N	\N	rarias@entrada.com	\N
3631	5	Convenio firmado con el Sindicato de Trabajadores Municipales Relacionado con la Construcciòn de Viviendas ubicadas en el Loteo denominado Mi Lugar Mi Sueño 3 Barrio Alberdi 	\N	\N	\N	Nota convertida en expediente Legislativo Nº 22735- sesión Nº 155 - recibida por la comisión de Gobierno -con fecha 9/10/2015	Peticion	2015-10-05 14:55:06.570024	2015-10-14 19:16:46.414331	\N		DEM				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3635	2	Proyecto de Resolucion en la que se solicita el mantenimiento de la plaza Martorelli y luminarias para el pasaje Martorelli al 300	\N	\N	\N	Nota convertida en expediente Legislativo Nº 22737- sesión Nº 155 - recibida por la comisión de Servicios Publico y Transporte -con fecha 9/10/2015	Peticion	2015-10-05 15:01:54.573529	2015-10-14 19:19:11.184471	\N		Cjal. José Barotti				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3624	\N	Nota solicitando intervenga ante la situacion que atraviesan para solucionar problematica expuesta en la misma.	\N	\N	\N	Nota convertida en expediente Legislativo Nº 22740- sesión Nº 155 - recibida por la comisión de Gobierno -con fecha 9/10/2015	Peticion	2015-10-02 14:22:59.092653	2015-10-14 19:20:32.1248	\N		Oscar Verna (Responsable de los vecinos firmantes en la nota)	Coronel Olmedo 2018. Depto 2 do C	0358-156003468		\N	\N	\N	\N	\N	rarias@entrada.com	\N
3672	16	Proyecto de Ordenanza en la que se designa con el nombre de JUAN SCARPACI al espacio verde que se encuentra en un sector del Barrio Tiro Federal.	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 22750 - Sesión Nº 155 - Enviada a la Comisión de Planificación y Desarrollo Sustentable -recibida el 9/10/2015.	Peticion	2015-10-07 15:15:27.255073	2015-10-14 19:36:24.071636	\N		Cjal. Martin Carranza 				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3674	3	Proyecto de Resolucion en la que solicita se declare de interés Legislativo el concierto a beneficio de la Orquesta Barrial a realizarse el día martes 13 de octubre en el teatro municipal	\N	\N	\N	Nota Convertida en Expediente Legislativo Nº 22757 -Sesión Nº 155 , Aprobada sobre Tablas con Resolución Nº 981/15.	Peticion	2015-10-07 15:38:01.902838	2015-10-14 19:51:41.649132	\N		Cjal. Sara Bergessio				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3669	7	Eleva nota solicitando una ayuda economica para el Sr. Sosa Norberto Felipe, domiciliado en calle Yapeyu 143, para solventar gastos de arreglos de herramientas de trabajo	\N	\N	\N	Nota Convertida en Expediente Legislativo Nº 22755 -Sesión Nº 155 , Enviada a las comisiones de Economía - Salud  , el 9/10/2015.	Peticion	2015-10-07 15:12:45.248796	2015-10-14 19:55:36.442122	\N		Cjal. Maria del Carmen Cabral		Yapeyu 143 		\N	\N	\N	\N	\N	rarias@entrada.com	\N
3879	3	Ayuda Economican por razones de Salud	\N	\N	\N	Expediente Legislativo Nº 22873, tratado en Sesión Nº 160	Peticion	2015-11-10 15:45:25.89589	2015-11-18 21:08:04.999715	\N		Pablo Gigena	Yamana 2392	358- 154325675		\N	\N	\N	\N	\N	rarias@entrada.com	\N
3730	2	\N	\N	\N	\N	Aprobado sesión N º157-Ord Nº 1190/15.	Despacho	2015-10-21 15:06:42.961521	2015-11-04 17:33:12.133858	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	rarias@entrada.com	2015-10-21
3715	6	Dos pasajes de Ida y Vuelta a la ciudad de Còrdoba	\N	\N	\N		Peticion	2015-10-15 15:37:47.031461	2015-10-15 15:37:47.031461	\N		Elena de Los Angeles Rodriguez	Sobremonte 3586	0358- 155165531		\N	\N	\N	\N	\N	mechenique@entrada.com	\N
3665	\N	Condonacion de deuda vinculada a contribucion sobre Inmuebles y EMOS a favor del sr Manuel Victor Figueroa Navarrete)	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 22752- Sesión Nº 155 - Enviada a la Comisión de economía -recibida el 9/10/2015.	Peticion	2015-10-07 15:05:23.813968	2015-10-19 13:21:12.597612	\N	Secretaria del Concejo Deliberante	Cejal Adriana Oviedo ( Bloque Rìo Cuarto Para Todos) 	Marcos Lloveras 1442	358- 155097514		\N	\N	\N	\N	\N	mechenique@entrada.com	\N
3722	1	Se Solicita ayuda Economica para la SubComisiòn  de Bochas,quien realiza dicho pedido es el Sr Jose Luis Martinez	\N	\N	\N	Nota Convertida en Expediente Legislativo Nº 22790- Sesión 157 - Remitida a las Comisiones de Desarrollo Social, Salud y Deporte- Economía y Presupuesto con fecha de 23/10/21015.	Peticion	2015-10-20 14:30:53.4495	2015-11-04 17:25:27.050494	\N	Secretaria del Concejo Deliberante	Club Sportivo Buena Vista SubComisiòn de Bochas	Dinkeldein Norte 204	4654119 -  Los nùmeros siguientes corresponden al lugar de trabajo desde las 7 hs a las 14:00 hs                   4676124 o 196 Recursos Humanos de La UNRC		\N	\N	\N	\N	\N	rarias@entrada.com	\N
3716	1	Nota requiriendo notificar a Directores y Subdirectores de los equipo de trabajo a su cargo  de Convocatoria a reunion solicitada por el sr secretario de Gobierno y Relaciones Institucionales, en el Salon Blanco de la Municipalidad el dia jueves 22 de octubre a las 8 y 30 hs.	\N	\N	\N		Peticion	2015-10-19 13:48:52.604021	2015-10-19 13:57:12.789594	\N		Subsecretaria de Recursos Humanos. ( Cra Libia Gonzales)	Pje La Concepcion 650	0358-4671831/145/147		\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
3717	3	Invitaciòn para el dia 4 de Diciembre donde brindarà una Conferencia "Los Catalanes en Argentina" . Quien realiza la invitaciòn es Matias Moreno Zamananillo, Subsecretario de Cultura	\N	\N	\N		Peticion	2015-10-19 14:25:55.853793	2015-10-19 14:40:40.187907	\N	Secretaria del Concejo Deliberante	Subsecretario de Cultura				\N	\N	\N	\N	\N	mechenique@entrada.com	\N
3725	1	\N	\N	\N	\N		Despacho	2015-10-21 12:46:21.839467	2015-10-21 12:57:29.698014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-10-21
3726	1	Solicita ayuda economica  de 5.000 ( cinco mil pesos) para cubrir gastos de comida y viajes internos de los 80 jovenes que vienen de otras provincias y otros paises e invita participar de la 2 da edicion de la Copa America de Clubes Internacional y Trabajo Social.	\N	\N	\N		Peticion	2015-10-21 14:23:11.852713	2015-10-21 14:52:34.924134	\N		Ctro Conviven Rio Cuarto Cordoba- Bs As: Romina Cuello. Adrian Biralick. Atletas de Cristo Argentino: Hector Master. Conectar Sport life Internacional: Alex Doblado.		0358-154324959. 0358-154382302. 011-1554519932. 011-1569956177 (Respectivamente)		\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
3729	1	\N	\N	\N	\N		Despacho	2015-10-21 14:56:48.937344	2015-10-21 15:06:00.414435	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-10-21
3740	1	\N	\N	\N	\N		Despacho	2015-10-21 15:23:48.973492	2015-10-21 16:04:15.236464	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-10-21
3743	1	\N	\N	\N	\N		Despacho	2015-10-21 16:18:55.073349	2015-10-22 10:59:00.886899	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-10-07
3734	2	\N	\N	\N	\N		Despacho	2015-10-21 15:13:52.480025	2015-10-22 11:37:02.37357	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-10-21
3733	2	\N	\N	\N	\N		Despacho	2015-10-21 15:11:15.921081	2015-10-22 11:52:38.552245	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-10-21
3731	2	\N	\N	\N	\N		Despacho	2015-10-21 15:09:05.575067	2015-10-22 12:35:05.82998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-10-21
3745	\N	Solicita un pasaje de colectivo (ida y vuelta) a la ciudad de Cba	\N	\N	\N		Peticion	2015-10-22 12:40:08.365763	2015-10-22 12:54:30.566372	\N						\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
3748	7	Proyecto de Ordenanza por la que se suspende por sesenta dias ( 60 dias) la aplicacion  de los articulos 18 y 31 de la Ordenanza Nº 783/01 en lo atinente a la implementacion  de la tarifa nocturna de hasta un 20% mayor  a la tarifa diurna.	\N	\N	\N	Dispositivo nº 30893	Peticion	2015-10-23 12:26:24.133168	2015-10-23 15:50:13.775052	\N	Secretaria del Concejo Deliberante	DEM 				\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4024	1	\N	\N	\N	\N		Despacho	2015-12-02 15:09:29.258814	2015-12-03 13:38:02.548735	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-02
3880	1	\N	\N	\N	\N		Despacho	2015-11-10 15:59:15.302639	2015-11-12 14:13:30.821034	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-11-10
4030	4	\N	\N	\N	\N		Despacho	2015-12-02 15:20:03.13773	2015-12-03 15:12:16.675886	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-02
3656	1	Solicita colaboracion para participar en el torneo Internacional de San Francisco Cordoba a realizarse el dia 13, 14 y 15 de noviembre del cte año.	\N	\N	\N	Figura como iniciador en el sistema  : Club Sportivo y Biblioteca Atenas –Sub Comisión de Voley.\r\nNota convertida en Expediente Legislativo Nº 22745 - Sesión Nº 155 - Enviada a las Comisiones de Economía -Salud -recibida el 9/10/2015.	Peticion	2015-10-07 14:23:13.318195	2015-10-14 19:56:27.491441	\N		Mario Panadero	Pedernera 647	0358-154399744		\N	\N	\N	\N	\N	rarias@entrada.com	\N
3707	1	\N	\N	\N	\N		Despacho	2015-10-14 14:31:29.263655	2015-10-15 10:57:52.111376	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-09-29
3747	1	Nota solicitando sea declarado de ineres Municipal el proyecto realizado por el Colegio Italo Argentino Dante Alighieri denominado " La Dante Emprende	\N	\N	\N	Expediente Legislativo Nº 22801, tratado en la sesión Nº 157	Peticion	2015-10-23 12:22:48.637143	2015-11-18 20:21:02.893594	\N		Sociedad Italiana S. M. "Porta Pia"	Colon 243	0358-154112205/ 4625382		\N	\N	\N	\N	\N	rarias@entrada.com	\N
3750	\N	Proyecto de Ordenanza. Reclamo de Vecinos de calle Rìo Pilcomayo , entre calles San Martìn y Gobernador Guzmàn	\N	\N	\N	Expediente Legislativo Nº 22805, tratado en la sesión Nº 157	Peticion	2015-10-23 14:03:15.767492	2015-11-18 20:23:00.964932	\N	Secretaria del Concejo Deliberante	Concejal Eduardo Scoppa				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3712	6	Proyecto de Declaraciòn. " Sexto Encuentro de pequeños y Jòvenes Bailarines Solidarios"	\N	\N	\N		Peticion	2015-10-15 12:45:29.867783	2015-10-15 12:50:59.423032	\N	Secretaria del Concejo Deliberante	Adriana Oviedo				\N	\N	\N	\N	\N	mechenique@entrada.com	\N
3779	4	Proyecto de Ordenanza por la que se aprueba convenio Urbanistico con la Asociaciòn Gremial de Empleados de Comercio 	\N	\N	\N	Expediente Legislativo Nº 22817, tratado en la sesión Nº 157	Peticion	2015-10-28 15:19:05.7437	2015-11-18 20:28:22.017567	\N	Secretaria del Concejo Deliberante	DEM				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3786	\N	Ayuda Economica para la compra de un Tensiometro Arenoide y Medicamentos para la hija de la Sra. Lopez Gisela Natali	\N	\N	\N	Expediente Legislativo Nº 22819, tratado en la sesión Nº 157	Peticion	2015-10-28 16:12:09.157177	2015-11-18 20:29:21.019634	\N		Concejal  Maria del Carmen Cabral		358 - 155092002		\N	\N	\N	\N	\N	rarias@entrada.com	\N
3792	3	Solicita 1 Pasaje de Ida y otro de Vuelta con destino a la ciudad de Buenos Aires por razones de Salud para el  Sr.Gabriel Ferraro   	\N	\N	\N		Peticion	2015-10-30 11:48:30.545765	2015-10-30 12:00:41.365243	\N	Contaduria Concejo Deliberante	Concejal Eduardo Scoppa				\N	\N	\N	\N	\N	mechenique@entrada.com	\N
3787	5	Proyecto de Resolucion por el cual se declara de interes Legislativo y cultural las "XX jornadas  Internacionales Interdisciplinarias y X el coloquio sobre etica del discurso" organizado por la fundacion ICALA, a realizarse los  dias 4,5,6 de noviembre de 2015, en la ciudad de Rio Cuarto.	\N	\N	\N	Expediente Legislativo Nº 22820, tratado en la sesión Nº 157	Peticion	2015-10-28 16:14:18.536294	2015-11-18 20:29:43.290221	\N	Secretaria del Concejo Deliberante	Cejal Maria del Carmen Cabral				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3788	14	 Proyecto de Ordenanza  por el que se solicita una a ayuda Economica a los fines de ser de ser destinados a cubrir el gasto por tratamiento de enfermedad de la srta  Camila Antonella Aguado.	\N	\N	\N	Expediente Legislativo Nº 22821, tratado en la sesión Nº 157	Peticion	2015-10-28 16:18:50.502388	2015-11-18 20:30:05.746084	\N	Secretaria del Concejo Deliberante	Cejal Maria del Carmen Cabral				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3785	1	Solicita Condonaciòn de Deudas de las siguientes nomemclaturas 06-1-042-014-00     06-1-042-015-00      06-1-042-016-00	\N	\N	\N	Ya habia tenido un ingreso anterior en junio pero no registra Nº de Expediente\r\n-Expediente Legislativo Nº 22822, tratado en la sesión Nº 157	Peticion	2015-10-28 16:03:56.24436	2015-11-18 20:30:32.373106	\N		Daniel  O Zabala	Laguna Blanca 1837/ 1841/1849/ 	358-154304391		\N	\N	\N	\N	\N	rarias@entrada.com	\N
3790	1	Solicita aporte Econòmico con destino a obras de Infraestructura del  Kartòdromo  del  Imperio	\N	\N	\N	Expediente Legislativo Nº 22828, tratado en la sesión Nº 158	Peticion	2015-10-29 15:33:53.432933	2015-11-18 20:33:41.935964	\N	Secretaria del Concejo Deliberante	Leticia Medina   - DNI 20080214	Josè Màrmol  ( N ) 229 	0358 - 155078946 - 154246001		\N	\N	\N	\N	\N	rarias@entrada.com	\N
3791	1	Solicita que se realice la nivelaciòn por calle Roma hasta el Canal paralelo a la Ruta A005	\N	\N	\N	Expediente Legislativo Nº 22829, tratado en la sesión Nº 158	Peticion	2015-10-30 11:31:34.378278	2015-11-18 20:34:08.977515	\N	Secretaria del Concejo Deliberante	Mirian Barrionuevo	Islas de Los Estados 451	0358 - 154840594 - 4648485		\N	\N	\N	\N	\N	rarias@entrada.com	\N
3753	3	Nacimientos y Defunciones	\N	\N	\N		Peticion	2015-10-23 15:40:26.21217	2015-10-29 15:49:24.538748	\N	Mesa de Entrada	Registro Civil de Banda Norte	Avenida Marcelo T de Alvear 1120	4671189 - 326/327		\N	\N	\N	\N	\N	mechenique@entrada.com	\N
3793	2	Invitaciòn a los Miembros del Concejo Deliberante de la Ciudad de Rìo Cuarto  La Conferencia  que Dictarà el Sr. Roberto Perez el dìa Viernes 13 de Noviembre del 2015 a las 20,30 horas en dicha Instituciòn 	\N	\N	\N	Expediente Legislativo Nº 22830, tratado en la sesión Nº 158	Peticion	2015-10-30 15:14:18.602447	2015-11-18 20:35:00.362586	\N		Autoridades del Colegio Bilingue  San Ignacio y la Asociaciòn Civil San Ignacio de Loyola 	Guardias Nacionales 1400	0358 - 4648484 - 4640802 - 4626272 - 4645017		\N	\N	\N	\N	\N	rarias@entrada.com	\N
3800	\N	Remite informe de Ejecucion Presupuestaria del tercer trimestre del año 2015, en virtud del cumplimiento  del articulo 171 Carta Organica Municipal.	\N	\N	\N	Expediente Legislativo Nº 22833, tratado en la sesión Nº 158	Peticion	2015-11-02 15:02:15.090914	2015-11-18 20:36:03.258002	\N		Cra Silvina Ison. Subsecretaria de Economia	Costitucion 988- Planta Alta	0358-4671136		\N	\N	\N	\N	\N	rarias@entrada.com	\N
3801	50	Proyecto de Ordenanza Solicitando Eximiciòn Condonaciòn del Impuesto de Emos a la Sra Semprino Nelida Herminia	\N	\N	\N	Expediente Legislativo Nº 22834, tratado en la sesión Nº 158	Peticion	2015-11-02 15:06:26.901696	2015-11-18 20:36:24.525276	\N		Concejal Ontivero				\N	\N	\N	\N	\N	rarias@entrada.com	\N
4031	4	Proyecto de Ordenanza. Correccion en el cobro de estacionamiento medido.	\N	\N	\N		Peticion	2015-12-02 15:20:39.610559	2015-12-02 17:40:31.502974	\N		Cjal Jose Barotti				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4041	6	Solicita dos Pasajes  de ida y dos pasajes de vuelta a ciudad de Cba por motivos de salud de su hijo. 	\N	\N	\N		Peticion	2015-12-03 13:10:27.898404	2015-12-03 13:27:43.803509	\N		Gisella Allende		0358-154369978		\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
3795	7	Modificaciones al  Còdigo Tributario Municipal - 48/96 (texto ordenado por Ord. Nº 718/ 14) por un lado y la Ordenanza Tarifaria Anual que Regirà para el   Fiscal 2016 Ejercicio -                 Tomo II  Anexos Otras Entidades del Sector Pùblico Municipal  ( Folios 33 )- Tomo IV  Modificaciones al Codigo Tibutario y Ordenanza Tarifaria ( Folios 96 )	\N	\N	\N		Peticion	2015-10-30 15:47:17.596918	2015-11-03 11:57:34.525277	\N	Secretaria del Concejo Deliberante	DEM				\N	\N	\N	\N	\N	mechenique@entrada.com	\N
3810	\N	Decretos 3103/15- 3109/15- 3110/15- 3111/15- 3112/15- 3119/15- 3120/15- 3121/15- 3122/15- 3123/15- 3124/15- 3125/15- 3126/15- 3127/15- 3128/15-   Ordenanzas.1157/15 - 1165/15 - 1173/ -15 - 1174/15- 1176/15 - 1177/15 - 1182/15 	\N	\N	\N		Peticion	2015-11-03 14:51:56.511364	2015-11-03 15:48:36.607425	\N	Informatica					\N	\N	\N	\N	\N	mechenique@entrada.com	\N
3877	1	Proyecto de Ordenanza. Otorgase al Sr Ochoa Juan Eduardo  un aporte economico de un mil pesos para solventar gastos de organizacion y difusion de evento de Voleibol para adultos mayores.	\N	\N	\N		Peticion	2015-11-10 15:34:20.777447	2015-11-10 16:01:02.225574	\N		Cejal Olga Ysabel Cantoro (Bloque Rio Cto Para Todos)				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4042	2	Resolucion 973/15	\N	\N	\N		Peticion	2015-12-03 14:42:38.03928	2015-12-03 15:41:20.386425	\N		Secretaria de Desarrollo Urbano, Obras y Servicios Publicos. Sr Jorge A. Mendez.				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
3798	5	LLamado a Concurso Cerrado de Antecedentes para la Cobertura de los Cargos de Promociòn por Carrera Administrativa de todos los Agentes de Planta Permanente\r\n	\N	\N	\N		Peticion	2015-11-02 13:14:52.35829	2015-11-02 13:29:05.115478	\N	Secretaria del Concejo Deliberante	Sub Secretaria de Recursos Humanos - Contadora Libia D Gonzalez				\N	\N	\N	\N	\N	mechenique@entrada.com	\N
3804	\N	Proyecto de Ordenanza otorgando condonación y eximición en concepto de contribuciones municipales a los señores Raúl Ángel Pérez, Graciela Oviedo, Silvia Lidia Noriega.	\N	\N	\N	Expediente Legislativo Nº 22836, tratado en Sesión Nº 159	Peticion	2015-11-02 15:58:31.31162	2015-11-18 20:40:20.473015	\N		Concejales Olga Cantoro, Humberto Benedetto -Bloque Río Cuarto para Todos, Mauricio Dova, José Barotti, Samantha David - Bloque Unión por Córdoba – Frente para la Victoria				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3905	10	Solicita pasaje de ida y vuelta para la sra Sarate Clara Lia, por turno el 18 de noviembre por motivos de salud.	\N	\N	\N		Peticion	2015-11-17 13:49:58.198954	2015-11-17 14:14:42.261885	\N		Cejal Daniela Miranda				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
3802	2	Proyecto de Resoluciòn: Declarar Personalidad Destacada de la Cultura al Señor Mario Massaccesi	\N	\N	\N		Peticion	2015-11-02 15:37:25.204526	2015-11-03 10:57:17.733583	\N	Secretaria del Concejo Deliberante	Concejales:Humberto Benedetto -Osvaldo Da Costa - Viviana Pomiglio - Guillermo Natali - Sara Bergesio - Francisco Varela Guena - Mauricio Dova - Hipolito Ontivero - Adriana Oviedo - Olga Isab  el Cantoro - Marìa Del Carmen Cabral - Martin Carranza - Viviana Andrea Yawny - Leticia Paulizzi         				\N	\N	\N	\N	\N	mechenique@entrada.com	\N
3807	2	Proyecto de ordenanza por la que de ADHIERE a la ciudad de Rio Cuarto a la ley Provincial Nº 10060/12 en relacion a la anti explotacion sexual y trata.	\N	\N	\N	Expediente Legislativo Nº 22838, tratado en Sesión Nº 159	Peticion	2015-11-03 13:43:22.671506	2015-11-18 20:41:49.241899	\N		Cejal Leticia Pauluzzi. Bloque Union Por Cordoba.				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3808	7	Ayuda Economica por problemas de Salud	\N	\N	\N	Expediente Legislativo Nº 22840, tratado en Sesión Nº 159	Peticion	2015-11-03 14:15:18.714016	2015-11-18 20:42:39.670287	\N	Secretaria del Concejo Deliberante	Carlos Aguilar	Rio Quinto 643	358 - 4637590  		\N	\N	\N	\N	\N	rarias@entrada.com	\N
3806	3	Proyecto de Ordenanza:: Nuevo Plan de la Ciudad de Rìo Cuarto,Modifiquese los siguientes apartados de la Ordenanza 1082/11	\N	\N	\N	Expediente Legislativo Nº 22839, tratado en Sesión Nº 159	Peticion	2015-11-03 12:46:26.849021	2015-11-18 20:42:17.035878	\N	Secretaria del Concejo Deliberante	Concejales. Scoppa Eduardo, Oviedo Adriana , Osvaldo Da Costa 				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3811	8	Informe elaborado por la Direcciòn General de Catastro relacionado con la Propiedad del Inmueble que se pretende ceder en Comodato por la Ordenanza Nº 1157/15	\N	\N	\N	Expediente Legislativo Nº 22841, tratado en Sesión Nº 159	Peticion	2015-11-03 14:53:49.717322	2015-11-18 20:43:54.194469	\N	Secretaria del Concejo Deliberante	DEM				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3796	\N	Presupuesto General de Gastos de la Administraciòn Municipal que Regirà para el ejercicio Fiscal 2016	\N	\N	\N	 Indice: Mensaje de Elevaciòn Proyecto de Presupuesto 2016-Folios 118\r\n Tomo 1,Ordenanza y Anexos Administraciòn General - \r\n Tomo 2, Anexos Otras Entidades del Sector Pùblico Municipal\r\n Tomo 3, Apertura Programatica , Politica Presupuestaria -Metas- Administraciòn Central Jurisdicciones 01 a 05- Folios 385\r\n Tomo 3, Apertura Programatica,  Politica Presupuestaria - Metas- Administraciòn Central Juridicciones   06 a 90 -Folios 328\r\n Tomo IV, Apertura Programatica, Politica Presupuestaria -Metas- Emos - IMV - Edecom ( Folios 33 )\r\n Tomo V, Apertura Programatica, Politica Presupuestaria - Metas - Otras Entidades del SPM - Fundaciones - Folios 206\r\n Tomo VI, Modificaciones al Codigo Tributario y Ordenanza Tarifaria (Folios 96)\r\n	Peticion	2015-10-30 16:08:52.275542	2015-11-04 11:32:49.965326	\N	Secretaria del Concejo Deliberante	DEM				\N	\N	\N	\N	\N	mechenique@entrada.com	\N
3803	4	Proyecto de Ordenanza : Ayuda Economica para el Sr. Roberto Domingo Franchella para cubrir gastos de Salud	\N	\N	\N	Expediente Legislativo Nº 22837, tratado en Sesión Nº 159	Peticion	2015-11-02 15:39:23.208533	2015-11-18 20:41:27.752188	\N	Secretaria del Concejo Deliberante	Concejal Benedett0	Republica Arabe Siria 248 - Banda Norte			\N	\N	\N	\N	\N	rarias@entrada.com	\N
3906	1	Solicita Exenciòn del Impuesto Municipal y del Servicio de Agua y Cloacas (EMOS) 2015.	\N	\N	\N	Expediente Legislativo Nº 22889, tratado en la sesión Nº 163.	Peticion	2015-11-17 13:57:35.06981	2015-11-18 20:00:47.012413	\N	Secretaria del Concejo Deliberante	Pertenece a Bomberos Voluntarios	Lamadrid 945	4621700 - 4645823		\N	\N	\N	\N	\N	rarias@entrada.com	\N
3762	1	Jornada de Actualizaciòn en Educaciòn de la Sexualidad Integral Inclusiva	\N	\N	\N	Expediente Legislativo Nº 22812, tratado en la sesión Nº 157	Peticion	2015-10-27 14:01:39.225325	2015-11-18 20:25:54.988139	\N	Secretaria del Concejo Deliberante	Centro De Educaciòn Sexual Integral		Cesi Rìo Cuarto:Profesora  Patricia MEnard 358-154016897   - Mesa de la Diversidad: Walter Torres 358 - 154863555		\N	\N	\N	\N	\N	rarias@entrada.com	\N
3780	2	Proyecto de Ordenanza en el que se otorga a la Instituciòn  Newcon  Ranqueles Rìo Cuarto de la ciudad de Rio Cuarto un aporte de pesos tres mil ( $3.000) para afrontar gastos inherentes al evento deportivo a realizarse el dìa 14 y 15 de noviembre del año 2015.	\N	\N	\N	Expediente Legislativo Nº 22818, tratado en la sesión Nº 157	Peticion	2015-10-28 15:29:10.046271	2015-11-18 20:28:51.102942	\N	Secretaria del Concejo Deliberante	Presidente Concejo Deliberante    CLAUDIO MIRANDA	FUNDEMUR	0358 - 154376647		\N	\N	\N	\N	\N	rarias@entrada.com	\N
3794	1	Solicitan se considere la posibilidad de declarar el evento del dìa Viernes 13 de Noviembre como un acontecimiento de Interès Educativo y Cultural \r\nConferencia "El Poder  Dictado por el sr.Roberto Perez	\N	\N	\N	Expediente Legislativo Nº 22830, tratado en la sesión Nº 158	Peticion	2015-10-30 15:22:14.358523	2015-11-18 20:34:48.009748	\N	Secretaria del Concejo Deliberante	Autoridades del Colegio Bilingue San Ignacio y La Asociaciòn Civil San Ignacio de Loyola	Guardias Nacionales 1400	0358- 4648484 - 4640802 - 4645017		\N	\N	\N	\N	\N	rarias@entrada.com	\N
3797	3	Proyecto de Ordenanza con Respecto al desalojo de Vendedores Ambulantes y pedido de Informe al Departamento Ejecutivo Municipal y al Presidente del Ente Descentralizado de Control Municipal ( Edecom ) 	\N	\N	\N	Expediente Legislativo Nº 22831, tratado en la sesión Nº 158	Peticion	2015-11-02 12:26:36.185975	2015-11-18 20:35:21.022715	\N	Secretaria del Concejo Deliberante	Concejal Mauricio Dova				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3799	3	Solicita Ayuda Economica,Tratamiento  por Problemas de Salud	\N	\N	\N	Expediente Legislativo Nº 22832, tratado en la sesión Nº 158	Peticion	2015-11-02 13:30:41.98232	2015-11-18 20:35:36.883101	\N	Secretaria del Concejo Deliberante	Nicolas Pajòn	Calle Mosconi 35	0358 - 154327274 - 4652680		\N	\N	\N	\N	\N	rarias@entrada.com	\N
3816	1	Solicita se Declare de "ciudadano Ilustre de Rìo Cuarto" al escritor local Lic. Humberto Aguilar "	\N	\N	\N		Peticion	2015-11-04 13:19:57.263092	2015-11-18 20:49:18.749542	\N	Secretaria del Concejo Deliberante	Luis Antonio Sanchez				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3805	1	Eleva nota en la que realiza reclamo sobre COTRECO	\N	\N	\N	Expediente Legislativo Nº 22859, tratado en Sesión Nº 159	Peticion	2015-11-02 21:51:20.982548	2015-11-18 21:00:01.51273	\N	Secretaria del Concejo Deliberante	Alfredo J. Bartellini	N. Laprida 786	0358-4634455/ 154288060		\N	\N	\N	\N	\N	rarias@entrada.com	\N
3813	4	Solicita dos pasajes de ida y vuelta a ciudad de Cordoba por razones de salud con caracter urgente, para el dia 4 de noviembre a nombre de la Sra Valeria Justribo.	\N	\N	\N		Peticion	2015-11-03 15:20:33.239275	2015-11-03 15:45:23.425006	\N		Cejal Olga Ysabel Cantoro		358-154.361.628 ( Gabriel Justribo)		\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
3840	2	\N	\N	\N	\N		Despacho	2015-11-04 16:09:45.787244	2015-11-05 12:51:32.202603	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-11-04
3815	5	Proyecto de Ordenanza: Crease el Presupuesto Participativo en la Ciudad de Rìo Cuarto	\N	\N	\N	Expediente Legislativo Nº 22844, tratado en Sesión Nº 159	Peticion	2015-11-04 11:50:06.623172	2015-11-18 20:47:59.609403	\N		Concejal Mauricio Dova				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3819	\N	Proyecto de Ordenanza en el que se solicita al secretario de Desarrollo Urbano, Obras y Servicios Publicos, proceda a realizar la instalacion de un retardador de velocidad en la calle Belisario Roldan al 400, previo estudio de factibilidad tecnica.	\N	\N	\N	Expediente Legislativo Nº 22848, tratado en Sesión Nº 159	Peticion	2015-11-04 15:08:29.39234	2015-11-18 20:52:41.298722	\N		Cejal Daniela Miranda.(Bloque UPC-FPV)				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3827	\N		\N	\N	\N	Expediente Legislativo Nº 22855, tratado en Sesión Nº 159	Peticion	2015-11-04 15:41:01.521063	2015-11-18 20:57:25.262906	\N		DEM				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3820	1	Proyecto de ordenanza en el que se solicita al secretario de Desarrollo Urbano, Obras y Servicios Publicos , proceda a realizar la instalacion de un retardador de velocidad en la calle Entre Rios al 400, previo estudio de factibilidad tecnica.	\N	\N	\N	Expediente Legislativo Nº 22849, tratado en Sesión Nº 159	Peticion	2015-11-04 15:10:37.280967	2015-11-18 20:53:12.194846	\N		Cejal Daniela Miranda. (Bloque Union Por Cordoba.Frente para la Victoria).				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3833	\N	Resolucion 15238	\N	\N	\N		Peticion	2015-11-04 15:55:54.429913	2015-11-04 16:03:32.351298	\N		Secretaria de Economia				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
3832	\N	Resolucion 15223	\N	\N	\N		Peticion	2015-11-04 15:54:03.774856	2015-11-04 16:04:04.752615	\N		Secretaria de Economia				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
3831	\N	Resolucion 15219	\N	\N	\N		Peticion	2015-11-04 15:51:31.466077	2015-11-04 16:07:22.179171	\N		Secretaria de Economia				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
3830	\N	Resolucion 15224	\N	\N	\N		Peticion	2015-11-04 15:49:24.740316	2015-11-04 16:07:40.231295	\N		Secretaria de Economia				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
3829	\N	Resolucion 15220	\N	\N	\N		Peticion	2015-11-04 15:47:27.200199	2015-11-04 16:07:56.930941	\N		Secretaria de Economia				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
3841	\N	\N	\N	\N	\N		Despacho	2015-11-04 16:11:11.545487	2015-11-05 12:57:49.962572	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-11-04
3843	2	\N	\N	\N	\N		Despacho	2015-11-04 16:13:52.116737	2015-11-05 13:03:10.91437	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-11-04
3683	2	Nota solicitando ayuda economica para adquirir un dispositivo denominado PLC. 	\N	\N	\N	Nota convertida en Expediente Legislativo 22762 -Sesión Nº 156-  Remitida a la Comisión de obras Publicas y Vialidad ,recibida 16 /10/15.	Peticion	2015-10-09 14:49:45.288863	2015-11-04 16:39:59.374915	\N		Directora IPEM Nº 203. Dr J.B. Dichiara. ( profesora Alejandra G. Alvarez)	Rivera Indarte 67	0358-154303098		\N	\N	\N	\N	\N	rarias@entrada.com	\N
3686	3	Concejo Consultivo de Prevenciòn y Asistencia de las Adicciones	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 22766- sesión 156 -Remitida a la Comisión de Desarrollo Social, Salud y Deporte con fecha 16/10/2015	Peticion	2015-10-09 15:10:50.853241	2015-11-04 16:52:58.111148	\N		DEM				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3694	5	Proyecto de ordenanza en el que la Sra Nancy Bustos solicita aporte económico por enfermedad.\r\n"Secretaria del concejal deja pendiente los datos faltantes (dirección y teléfono)"	\N	\N	\N	\r\nNota convertida en Expediente Legislativo Nº 22771 -Sesión Nº 156 -Remitida a las Comisiones de Desarrollo Social, Salud y Deporte  - Economía y Presupuesto con fecha 16/10/2015.	Peticion	2015-10-13 15:16:04.270628	2015-11-04 17:00:42.64002	\N		Concejal Martin Carranza.				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3697	1	Solicitud de Reconocimiento de Interes Cultural del Libro " la Inmigraciòn Italiana en el Sur de la Provincia de Còrdoba"\r\nPresidente y Representante Legal  Lic. Alberto G. Bartoccioni	\N	\N	\N	\r\nNota convertida en Expediente Legislativo Nº 22774- Sesión 156- Remitida a la comisión de Desarrollo Humano, Educación y Cultura con fecha 16/10/2015.	Peticion	2015-10-14 13:41:55.840071	2015-11-04 17:05:24.634525	\N	Secretaria del Concejo Deliberante	Colegio Italo Argentino Dante Alighieri	Lorenzo Suarez de Figueroa 2051 ( Altura Tejerina al 300 )	358 - 4627315		\N	\N	\N	\N	\N	rarias@entrada.com	\N
3847	2	\N	\N	\N	\N		Despacho	2015-11-04 16:32:46.938778	2015-11-05 11:10:35.341949	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-11-04
3835	2	\N	\N	\N	\N		Despacho	2015-11-04 16:00:47.534841	2015-11-05 12:31:53.73434	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	\N
3844	2	\N	\N	\N	\N		Despacho	2015-11-04 16:15:12.939712	2015-11-05 13:43:04.49882	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-11-04
3845	2	\N	\N	\N	\N		Despacho	2015-11-04 16:16:11.223044	2015-11-06 11:10:18.975496	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-11-04
3907	1	Solicitan en calidad de prèstamo  un equipo de Audio para el proximo dìa Viernes 11 de Diciembre de 2015	\N	\N	\N		Peticion	2015-11-17 14:51:07.258035	2015-11-17 14:57:59.487923	\N	Secretaria del Concejo Deliberante	Instituto San Francisco de Asis 	Victor Hugo 885	358 - 4627175		\N	\N	\N	\N	\N	mechenique@entrada.com	\N
3913	2	Proyecto de Ordenanza. Condonacion y Eximicion.	\N	\N	\N	Expediente Legislativo Nº 22893, tratado en la sesión Nº 163.	Peticion	2015-11-18 12:15:22.486716	2015-11-18 20:04:06.432785	\N		Consejales Francisco Varela Geuna. CjalViviana Pomiglio. Cjal Humberto Benedetto. Cjal Olga Ysabel Cantoro.. Cjal Jose Barotti..				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3912	\N	Proyecto de Ordenanza. Condonacion y Eximicion	\N	\N	\N	Expediente Legislativo Nº 22894, tratado en la sesión Nº 163.	Peticion	2015-11-18 12:12:55.706703	2015-11-18 20:04:34.943956	\N		Consejales Francisco Varela Geuna. CjalViviana Pomiglio. Cjal Humberto Benedetto. Cjal Olga Ysabel Cantoro.. Cjal Jose Barotti. Cjal Ontivero.				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3911	7	Proyecto de Ordenanza : Visto la situaciòn actual de tratamiento "Insuficiente" de los efluentes cloacales	\N	\N	\N	CONTIENE 7 FOJAS Y ANEXO DE 58 FOJAS.\r\nExpediente Legislativo Nº 22895, tratado en la sesión Nº 163.	Peticion	2015-11-18 12:03:58.120025	2015-11-18 20:05:04.378744	\N	Secretaria del Concejo Deliberante	Concejal Eduardo Scoppa				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3814	3	Proyecto de Resolucion en el que se resuelve EXPRESAR el beneplacito por la creacion del 3 de abril como el dia Personal de Casas Particulares, en conmemoracion a la fecha en que fue promulgada la  ley 26.844, en el año 2013	\N	\N	\N	Expediente Legislativo Nº 22843, tratado en Sesión Nº 159	Peticion	2015-11-03 15:51:48.140754	2015-11-18 20:47:26.275103	\N		Cejal Viviana Pomiglio. (Bloque Rio Cuarto Para Todos.)				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3818	\N	Proyecto	\N	\N	\N	Expediente Legislativo Nº 22847, tratado en Sesión Nº 159	Peticion	2015-11-04 15:08:22.603952	2015-11-18 20:51:09.046519	\N						\N	\N	\N	\N	\N	rarias@entrada.com	\N
3823	\N		\N	\N	\N	Expediente Legislativo Nº 22851, tratado en Sesión Nº 159	Peticion	2015-11-04 15:16:43.002379	2015-11-18 20:54:14.316314	\N		Varela y Da Costa				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3842	3	Proyecto de Ordenanza que tiene por objetivo cambiar el recorrido de la lineas 17 de colectivos extendiendolo. Ya que en la actualidad no cubre algunos sectores circundantes.	\N	\N	\N	Expediente Legislativo Nº 22857, tratado en Sesión Nº 159	Peticion	2015-11-04 16:11:58.705059	2015-11-18 20:59:41.346758	\N		DEM				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3914	2	Solicita Ayuda Econòmica para la Sra. Eva Lopez 	\N	\N	\N	\r\nExpediente Legislativo Nº 22892, tratado en la sesión Nº 163.	Peticion	2015-11-18 12:48:13.183237	2015-11-18 20:02:26.390011	\N	Secretaria del Concejo Deliberante	Concejal Mauricio Dova	Tucumàn 815	358- 154167066		\N	\N	\N	\N	\N	rarias@entrada.com	\N
3821	\N	al Secretario Desarrollo 	\N	\N	\N	Expediente Legislativo Nº 22850, tratado en Sesión Nº 159	Peticion	2015-11-04 15:11:32.297462	2015-11-18 20:53:48.270089	\N						\N	\N	\N	\N	\N	rarias@entrada.com	\N
3825	6	Ayuda Economica para la compra de Anteojos recetados,para la Sra	\N	\N	\N	Expediente Legislativo Nº 22853, tratado en Sesión Nº 159	Peticion	2015-11-04 15:31:23.374865	2015-11-18 20:56:15.859494	\N		Concejal Marìa del Carmen Cabral				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3723	6	Proyecto de Ordenanza  sobre reclamos de la Comunidad Educativa  Escuela Fhoterigham	\N	\N	\N	Nota Convertida en Expediente Legislativo Nº 22791- Sesión 157 - Remitida a las Comisiones de Obras Públicas y Vialidad- Planificación y Desarrollo Sustentable  con fecha de 23/10/21015.	Peticion	2015-10-20 14:43:31.918073	2015-11-04 17:27:01.767858	\N	Secretaria del Concejo Deliberante	Concejal Eduardo Scoppa				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3826	\N		\N	\N	\N	Expediente Legislativo Nº 22854, tratado en Sesión Nº 159	Peticion	2015-11-04 15:35:44.878457	2015-11-18 20:56:54.643054	\N		Conceal Barotti				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3824	3	Declarar de Interès Cultural y Educativo el 1 Encuentro de Arquitectura y Urbanismo de Rìo Cuarto	\N	\N	\N	Expediente Legislativo Nº 22852, tratado en Sesión Nº 159	Peticion	2015-11-04 15:19:12.085486	2015-11-18 20:55:39.896827	\N	Secretaria del Concejo Deliberante	Francisco Varela Geuna 				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3834	\N	Resolucion 15231	\N	\N	\N		Peticion	2015-11-04 15:58:19.835103	2015-11-04 16:02:57.84127	\N		Secretaria de Economia				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
3837	4	 Nota en la que solicita dos Pasajes (ida y vuelta) por motivos de salud para el dia 6 de noviembre-	\N	\N	\N		Peticion	2015-11-04 16:05:16.336971	2015-11-04 16:37:31.081568	\N		Ricardo Martin Campos				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
3682	1	Solicita Licencia sin goce de Sueldo desde el dìa 13 de Octubre de 2015 Hasta el domingo 25 de Octubre 	\N	\N	\N	Nota convertida en Expediente Legislativo 22761- Sesión Nº 156- Aprobado por Res Nº 993/15.	Peticion	2015-10-09 13:36:30.465063	2015-11-04 16:40:21.572973	\N		Concejal Humberto Benedetto				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3689	3	Proyecto de Ordenanza en el que se solicita taxis y remises locales cuenten con un sistema de posnet que permite "leer" tarjetas de credito o de cuentas-sueldo y debitar sumas de dinero para efectuar pagos.	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 22769 -Sesión Nº 156 -Remitida a la Comisión de Servicios Públicos y Transporte con fecha 16/10/2015	Peticion	2015-10-13 12:34:00.513804	2015-11-04 16:56:22.23927	\N		Concejal Mauricio Dova				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3714	\N	Dictàmenes en Disidencia	\N	\N	\N	Nota Convertida en Expediente Legislativo Nº 22783 -Sesión 157-Remitida a la comisión de Economía y Presupuesto , con fecha de recibido el 23/10/2015.	Peticion	2015-10-15 15:22:51.734926	2015-11-04 17:15:33.39462	\N	Secretaria del Concejo Deliberante	Tribunal De Cuentas				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3711	2	Solicita pedido de ayuda Economica	\N	\N	\N	Nota Convertida en Expediente Legislativo Nº 22784 -Sesión 157-Remitida a la comisión de Economía y Presupuesto -Desarrollo Social, Salud y Deporte , con fecha de recibido el 23/10/2015.	Peticion	2015-10-15 11:51:06.036276	2015-11-04 17:16:22.032923	\N		Yanina Nieto	Kennedy 503	358 -154834834		\N	\N	\N	\N	\N	rarias@entrada.com	\N
3713	1	Nota solicitando una computadora completa (Monitor, CPU, mouse) que puede ser usada.	\N	\N	\N	Nota Convertida en Expediente Legislativo Nº 22785 -Sesión 157-Remitida a la comisión de labor, con fecha de recibido el 23/10/2015.	Peticion	2015-10-15 14:08:57.548014	2015-11-04 17:17:15.671694	\N	Secretaria del Concejo Deliberante	Fundacion Pensando en Vos para la Inclusion Social. (Nelson Cisak)	Rivera Indarte 67	0358-154303098		\N	\N	\N	\N	\N	rarias@entrada.com	\N
3718	1	Cuerpos Diversos solicitan una Ayuda Económica  \r\nEl telefono que adjuntamos pertenece a Karen Guigues 	\N	\N	\N	Nota Convertida en Expediente Legislativo Nº 22786- Sesión 157 - Remitida a la Comisión de Economía y Presupuesto con fecha de 23/10/21015.	Peticion	2015-10-19 15:20:44.172152	2015-11-04 17:19:53.360304	\N	Secretaria del Concejo Deliberante	Colectivo Cuerpos Diversos	Av. Costanera Sur 1078 - Torre 6 - 1º Piso "A"	358 - 154280382		\N	\N	\N	\N	\N	rarias@entrada.com	\N
3719	4	Proyecto de Ordenanza por la que se crea el Plan Integral de Articulacion, Prevencion y asistencia de las adicciones, en el ambito de la Secretaria De la Cultura, Educacion y Desarrollo Humano.	\N	\N	\N	Nota Convertida en Expediente Legislativo Nº 22787- Sesión 157 - Remitida a la Comisión de Desarrollo Social, Salud y Deporte con fecha de 23/10/21015.	Peticion	2015-10-19 15:22:57.992062	2015-11-04 17:23:24.37096	\N		DEM				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3721	66	Solicita ayuda Economica  por Problemas de Salud	\N	\N	\N	Nota Convertida en Expediente Legislativo Nº 22789- Sesión 157 - Remitida a las Comisiones de Desarrollo Social, Salud y Deporte- Economía y Presupuesto con fecha de 23/10/21015.	Peticion	2015-10-20 11:40:21.28979	2015-11-04 17:24:52.236218	\N	Secretaria del Concejo Deliberante	Zulberti Adriana Marisa	Pasaje San Juan 2039 	358 - 154392529		\N	\N	\N	\N	\N	rarias@entrada.com	\N
3732	5	Proyecto de Resolucion. Declarar de Interes Legislativo la "5ta" Jornada Interdisciplinaria de Fauna Silvestre a realizarse ls dias 5,6, y 7 de noviembre del cte año en la universidad Nacional de Rio Cuarto \r\n	\N	\N	\N	Nota Convertida en Expediente Legislativo Nº 22794- Sesión 157 - Remitida a las Comisiones de Gobierno -  Economía y Presupuesto - con fecha de 23/10/21015.	Peticion	2015-10-21 15:09:23.044621	2015-11-04 17:28:59.464236	\N		Cjal Francisco Varela Geuna. Cjal Viviana Andrea Yawny.				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3741	6	Proyecto de ordenanza solicitando una ayuda economica de 2000 ( dos mil pesos) para atenuar la dificil situacion del Sr Raul O Azcurra\r\nResponsable (sra Teresa Estela Baez Azcurra)	\N	\N	\N	\r\nNota Convertida en Expediente Legislativo Nº 22796- Sesión 157 - Remitida a las Comisiones de Desarrollo Social, Salud y Deporte  -  Economía y Presupuesto - con fecha de 23/10/21015.	Peticion	2015-10-21 15:28:41.08585	2015-11-04 17:30:52.451426	\N		Cejal Adriana Oviedo	Ranqueles 650	0358-154231758		\N	\N	\N	\N	\N	rarias@entrada.com	\N
3846	\N	\N	\N	\N	\N		Despacho	2015-11-04 16:17:49.084559	2015-11-05 11:21:37.899359	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-11-04
3822	1	\N	\N	\N	\N		Despacho	2015-11-04 15:13:18.440098	2015-11-05 11:25:11.875356	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-11-04
3838	4	\N	\N	\N	\N		Despacho	2015-11-04 16:06:02.705692	2015-11-05 11:44:29.691034	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-11-04
3839	2	\N	\N	\N	\N		Despacho	2015-11-04 16:07:37.135692	2015-11-05 12:38:28.891457	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-11-04
3908	1	\N	\N	\N	\N		Despacho	2015-11-17 15:06:45.607278	2015-11-17 15:11:41.405812	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-11-17
3836	2	\N	\N	\N	\N		Despacho	2015-11-04 16:04:24.491422	2015-11-06 10:57:09.745009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-11-04
3817	4	Proyecto de Resoluciòn por el Cùal se Declara Personalidad destacada  de la Cultura al Sr. Abdòn Jiosè "Chito" Guzmàn	\N	\N	\N	Expediente Legislativo Nº 22846, tratado en Sesión Nº 159	Peticion	2015-11-04 14:31:55.560259	2015-11-18 20:49:42.28383	\N	Secretaria del Concejo Deliberante	Concejales Maria Del Carmen Cabral - Viviana C Pomiglio 				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3848	2	Nota solicitando una colaboracion a fin de solventar los gastos que ocasiona la fiesta de egreso de los alumnos del IPEM Nº 27 Dr Rene Favaloro, dada la dificil situacion en la que se encuentran.	\N	\N	\N	Expediente Legislativo Nº 22874, tratado en Sesión Nº 160	Peticion	2015-11-05 11:18:34.563083	2015-11-18 21:08:23.13274	\N		Cecilia Romero		0358-154301014		\N	\N	\N	\N	\N	rarias@entrada.com	\N
3849	1	Informa que el dìa 29 del mes de Diciembre en las Instalaciones del Centro Cultural " Viejo Mercado" la Productora Deportiva "El Potrero" realizarà la 12º Entrega de los Premios        "Abanderados Magazzine" 	\N	\N	\N		Peticion	2015-11-05 11:54:18.954387	2015-11-05 12:17:21.265962	\N	Secretaria del Concejo Deliberante	Edgardo Titarelli		358-156015390 - 358- 4633004		\N	\N	\N	\N	\N	mechenique@entrada.com	\N
3851	2	Solicita un pasaje de Rio Cuarto a Bs As para el sr Omar Abelardo Centeno para realizar tramites personales.	\N	\N	\N	CANCELADO.	Peticion	2015-11-05 12:55:32.727161	2015-11-05 13:23:04.886951	\N		Cejal Martin Carranza. ( CANCELADO)		0358-154839601 (Miguel Gonzales)		\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
3939	7	2 pasajes de ida y vuelta a la ciudad de Cba por problema de salud a la sra Estela Cardetti.	\N	\N	\N		Peticion	2015-11-19 15:50:54.439864	2015-11-19 16:05:01.261624	\N		Cjal Jose Barotti		0358-156029822		\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
3909	5	Proyecto de Ordenanza en el que se otorga al grupo Scout Nº 519 Nuestra Señora de Fatima un aporte economico de $ 3.000 (tres mil) destinado a solventar gastos de reparacion, mantenimiento y ampliacion       \r\ndel inmueble de la institucion.	\N	\N	\N	Expediente Legislativo Nº 22890, tratado en la sesión Nº 163.	Peticion	2015-11-17 15:06:46.677758	2015-11-18 20:01:19.775895	\N		Cjal Daniela Miranda	Moreno 1230	0358-154373237 ( Sr Velazquez Victor Armando Jefe del grupo)		\N	\N	\N	\N	\N	rarias@entrada.com	\N
3861	\N	Solicita 2 pasajes de Ida y 2 de Regreso a la ciudad de Còrdoba para control de su Hijo Garcia Vives Rodrigo Exequiel	\N	\N	\N		Peticion	2015-11-10 11:25:27.203181	2015-11-10 11:46:20.500514	\N	Contaduria Concejo Deliberante	Sra Yanina A Vives	Pje Atenas 1966			\N	\N	\N	\N	\N	mechenique@entrada.com	\N
3864	3	Solicita un pasaje (ida y vuelta) a ciudad de Cordoba por razones de salud.	\N	\N	\N		Peticion	2015-11-10 14:32:24.231724	2015-11-10 14:43:27.875122	\N		Horacio Rodrigo Romero				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
3868	1	\N	\N	\N	\N		Despacho	2015-11-10 15:14:22.107411	2015-11-12 12:51:44.185945	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-11-10
3869	\N	\N	\N	\N	\N		Despacho	2015-11-10 15:16:21.675456	2015-11-12 12:54:09.324292	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-11-10
3870	1	\N	\N	\N	\N		Despacho	2015-11-10 15:18:05.726873	2015-11-12 12:57:01.382261	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-11-10
3910	1	Solicitan Condonaciòn deuda de EMOS periodo 2014 y Eximiciòn del Periodo 2015\r\nDirector de la Instituciòn Omar Sposato	\N	\N	\N	Expediente Legislativo Nº 22891, tratado en la sesión Nº 163.	Peticion	2015-11-17 15:25:23.797391	2015-11-18 20:01:37.764615	\N	Secretaria del Concejo Deliberante	La Casa del Sur	Constituciòn 415	0358- 155067803		\N	\N	\N	\N	\N	rarias@entrada.com	\N
3871	2	\N	\N	\N	\N		Despacho	2015-11-10 15:19:36.472331	2015-11-12 13:01:38.791647	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-11-10
3850	2	Solicitan ayuda economica para poder solventar parte de los gastos que  genera poder participar en el Festival Nacional de Folklore en el mes de enero del proximo año.	\N	\N	\N	Expediente Legislativo Nº 22863, tratado en Sesión Nº 160\r\n\r\n\r\n	Peticion	2015-11-05 12:24:58.167851	2015-11-18 21:02:13.164749	\N		Juntando Afectos Asociacion Civil	Trabajo y Prevision 930	0358- 4640394/ 155075287		\N	\N	\N	\N	\N	rarias@entrada.com	\N
3853	1	Solicita que se elabore un proyecto de ordenanza en donde se coloque en el bufete el nombe del agente  Pablo Rosendo Uruiza (fallecido)en reconocimiento a sus 28 años años de servicio dentro del establecimiento.	\N	\N	\N	Expediente Legislativo Nº 22864, tratado en Sesión Nº 160	Peticion	2015-11-05 13:48:16.875991	2015-11-18 21:02:42.00249	\N		Quiroga Jorge Alberto	Calle Florencio Sanchez 247 PB. dEPTO " F" Brrio Trapalanda	0358-154112235/4727150		\N	\N	\N	\N	\N	rarias@entrada.com	\N
3862	\N	Proyecto de Resolucion. Solicita al secretario de Desarrollo Urbano, Obras y Servicios Publicos sr Jorge Mendez que comunique diariamente a traves de la pagina oficial de la Municipalidad de Rio Cto, del Consejo Deliberante y en los noticieros de los canales locales, las calles con acceso denegado y los desvios que en ella deban hacerse.\r\n	\N	\N	\N	Expediente Legislativo Nº 22867, tratado en Sesión Nº 160	Peticion	2015-11-10 13:17:41.960434	2015-11-18 21:04:06.164906	\N		Cejal  Leticia Pauluzzi ( Bloque Union por Cordoba)				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3865	4	Solicita ayuda Ecònomica para el Centro de Rehabilitaciòn San Francisco de Asis de 3000 pesos, la Sra Angela Fontan viene en Representaciòn de la Instituciòn	\N	\N	\N	Expediente Legislativo Nº 22869, tratado en Sesión Nº 160	Peticion	2015-11-10 14:46:25.068251	2015-11-18 21:04:47.242442	\N		Concejal Guillermo Natali				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3875	\N	Proyecto de OrdenanzaSolicitando ayuda economica de $2.000 (dos mil) pesos para el funcionamiento de la Asociacion civil "No Estaran Solos"	\N	\N	\N	Expediente Legislativo Nº 22872, tratado en Sesión Nº 160	Peticion	2015-11-10 15:32:00.098461	2015-11-18 21:07:10.146308	\N		Olga Ysabel Cantoro (Bloque Rio Cuarto Para Todos)	Calle Publica s/n ( Quintas Del Sur)	0358-4898751/154126265		\N	\N	\N	\N	\N	rarias@entrada.com	\N
3943	\N	Dictámenes en Disidencia desde 184/15 hasta 209/15 inclusive.	\N	\N	\N	Nota convertida en expediente Legislativo Nº 22905- SESIÓN nº 165.	Peticion	2015-11-20 14:37:56.536594	2015-11-24 16:37:59.502813	\N		Tribunal De Cuentas				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3938	86	Informe Año 2015 - 5 Copias	\N	\N	\N		Peticion	2015-11-19 13:19:19.811009	2015-11-19 14:43:00.802951	\N	Secretaria del Concejo Deliberante	Secretario de Cultura, Educaciòn y Desarrollo Humano -  Abogado Gustavo  V. Avila				\N	\N	\N	\N	\N	mechenique@entrada.com	\N
3959	2	Solicita porroga de las Sesiones Ordinarias Del Concejo Deliberante, desde el Dìa 1º de Diciembre hasta el 30 de Diciembre de 2015	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 22916- SESIÓN Nº 165.	Peticion	2015-11-24 13:26:03.541461	2015-11-24 16:45:53.903383	\N	Secretaria del Concejo Deliberante	Presidente Concejo Deliberante    CLAUDIO MIRANDA				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3946	\N		\N	\N	\N	Oficio: Usurpaciòn	Peticion	2015-11-20 15:36:01.223241	2015-11-20 15:39:27.558262	\N	Secretaria del Concejo Deliberante	Daniel Pedro Miralles				\N	\N	\N	\N	\N	mechenique@entrada.com	\N
3942	6	Nota referida sobre pedido de Banca al Ciudadano y diversos Reclamos del Sector	\N	\N	\N	Nota convertida en expediente Legislativo Nº 22909- SESIÓN nº 165	Peticion	2015-11-20 13:09:15.359736	2015-11-24 16:41:23.232423	\N	Secretaria del Concejo Deliberante	Asociaciòn Vecinal Barrio Golf 	Gobernador Guzman 1970	358- 4305956		\N	\N	\N	\N	\N	rarias@entrada.com	\N
3940	15	Informe Sobre modificaciones en los recorridos de ls distintas Lineas de Transporte Urbano Segùn lo dispuesto por el anexo 1 de la Ord/ 866/14\r\nEnviado por el Sr. Osvaldo Rubèn Pringles.	\N	\N	\N	Nota convertida en expediente Legislativo Nº 22904 - sesión 165-	Peticion	2015-11-20 12:42:00.835771	2015-11-24 16:37:03.292348	\N	Secretaria del Concejo Deliberante	Secretaria de Desarollo Urbano, Obras y Servicios Pùblicos -Subsecretaria de Transporte				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3937	\N	Colegio de profesionales de Servicio Social a fin de poner a su consideracion el proyecto de la ley de adhesion Provincial a la ley federal de trabajo Nº27072, sancionada en el Honorable Congreso de la Nacion el 10 de diciembre de 2014.	\N	\N	\N	Nota convertida en expediente Legislativo Nº 22902- SESIÓN nº 165.	Peticion	2015-11-19 12:16:07.567544	2015-11-24 16:36:30.713089	\N			Delegacion Rio Cuarto. Belgrano 17. 2ª piso. Oficina 5	0358-4643515		\N	\N	\N	\N	\N	rarias@entrada.com	\N
3944	\N	Proyecto de Ordenanza Solicitando Eximiciòn Condonaciòn Sobre el Inmueble para la siguiente constribuyente Sra Allione de Sposato	\N	\N	\N	\r\nNota convertida en expediente Legislativo Nº 22906- SESIÓN nº 165.	Peticion	2015-11-20 15:08:05.479915	2015-11-24 16:38:29.703372	\N	Secretaria del Concejo Deliberante	Concejal Hipolito Ontivero		358 - 154116732		\N	\N	\N	\N	\N	rarias@entrada.com	\N
3852	1		\N	\N	\N		Peticion	2015-11-05 13:08:22.662056	2015-11-05 13:16:33.367345	\N	Oficio que se le entrega al Secretario del Concejo	Oficio - Acevedo Ariel Angel c/  Ivecor SA y otro - Ordinario - Despido Exp 2032193  				\N	\N	\N	\N	\N	mechenique@entrada.com	\N
3856	5	Solicita ayuda economica para su Hija de 15 años de edad quien tuvo un accidente y fue sometida a cirugia de tibia.	\N	\N	\N	Expediente Legislativo Nº 22866, tratado en Sesión Nº 160	Peticion	2015-11-06 12:18:01.661971	2015-11-18 21:03:43.892151	\N		Maria Elvira Giles 	Bariloche 100.( Banda Norte)	0358-155622561		\N	\N	\N	\N	\N	rarias@entrada.com	\N
3867	1	Proyecto de Resolucion declarando de interes legislativo La Marcha de la Gorra a realizarse el jueves prox 20 de noviembre	\N	\N	\N	Expediente Legislativo Nº 22871, tratado en Sesión Nº 160	Peticion	2015-11-10 15:11:56.561716	2015-11-18 21:06:24.855871	\N		Concejal Daniela Miranda				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3863	1	Solicitan fondos para la realizaciòn de un Disco de Mùsica Folclòrica con Intèrpretes Locales, la ayuda economica que solicitan es de $ 5.500.-	\N	\N	\N	Expediente Legislativo Nº 22868, tratado en Sesión Nº 160	Peticion	2015-11-10 13:34:21.740891	2015-11-18 21:04:27.630449	\N	Secretaria del Concejo Deliberante	Chito Abdon Josè Guzman  ( Chito )	San Lorenzo 3220	358- 54298395 - 358 -54129831		\N	\N	\N	\N	\N	rarias@entrada.com	\N
3857	\N	Donaciòn de 5 libros Titulados La Inmigraciòn Italiana En El Sur De Còrdoba 1870 - 1920	\N	\N	\N		Peticion	2015-11-06 13:16:43.968052	2015-11-06 13:16:43.968052	\N	Biblioteca Del Concejo Deliberante	Sociedad Italiana de Socorros Mutuo				\N	\N	\N	\N	\N	mechenique@entrada.com	\N
3855	6	Solicita tres pasajes (ida y vuelta) a la ciudad de Cba para el dia 6 de noviembre para el sr Martin Gonzalo Quiroga , Gustavo Alfredo Quiroga, y Fabian Gonzalo Molina, Motiva el pedidola posibilidad de dar respuesta al expediente Nº 22792 solicitando aporte economico para asistir al campeonato nacional de malambo.	\N	\N	\N		Peticion	2015-11-05 14:59:51.490848	2015-11-06 13:24:19.738058	\N		Cejal Humberto Benedetto	Marcos LLovera 1920	0358-154328068		\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
3858	\N	Solicita 1 Pasaje de Ida y otro de Vuelta hacia la Ciudad de Còrdoba  	\N	\N	\N		Peticion	2015-11-06 13:18:34.730418	2015-11-06 13:45:07.594486	\N		Chaves Celia Melina - 28821177		358 - 1542209122		\N	\N	\N	\N	\N	mechenique@entrada.com	\N
3859	5	Solicita 2 (dos)  pasajes ida y vuelta a ciudad de Cordoba el dia 13 de noviembre del cte para la srta Cintia Yamila Garro por motivos de salud.	\N	\N	\N		Peticion	2015-11-06 13:52:41.075944	2015-11-06 14:16:04.655398	\N	Contaduria Concejo Deliberante	Cejal Eduardo Scoppa				\N	\N	\N	\N	\N	mechenique@entrada.com	\N
3854	4	Solicita una ayuda economica de $ 2.500 (dos mil quinientos) para solventar gastos de la estadia en Cba por motivios de salud.	\N	\N	\N	Expediente Legislativo Nº 22865, tratado en Sesión Nº 160	Peticion	2015-11-05 14:32:59.286347	2015-11-18 21:03:26.053759	\N		Claudia Adelina Alvarez	Yslas Malvinas 669- Brrio Alberdi	0358- 154269855		\N	\N	\N	\N	\N	rarias@entrada.com	\N
3860	1	Comunica que el dìa 06/11/15 estarè ausente durante la presentaciòn de Informes de los Secretarios del Departamento Ejecutivo Municipal, por encontrarme en la Ciudad de Còrdoba	\N	\N	\N		Peticion	2015-11-06 15:34:43.75787	2015-11-06 15:38:42.616257	\N	Secretaria del Concejo Deliberante	Concejal Samantha David				\N	\N	\N	\N	\N	mechenique@entrada.com	\N
3866	4	Solicita se Revea la Normativa vigente que prohibe el funcionamiento del Taller  donde se realizan trabajos de control Digital de Relojes Taximetros	\N	\N	\N	Expediente Legislativo Nº 22870, tratado en Sesión Nº 160	Peticion	2015-11-10 15:09:22.619206	2015-11-18 21:06:05.978815	\N	Secretaria del Concejo Deliberante	Olivera Daniel Angel	Congreso de Tucuman 258 - Las Higueras	154345076		\N	\N	\N	\N	\N	rarias@entrada.com	\N
3933	2	Proyecto Resolucion. Solicitar al Secretario de Desarrollo Urbano, Obras y Servicios Publicos, Sr Jorge A.Mendez, atento a factibilidades tecnicas y presupuestarias, la ejecucion de las obras de cordon cuneta y pavimento desde las calles Alejandro Aguado hasta Castelli y desde Maipu hsta Juan P. segundo.	\N	\N	\N	Expediente Legislativo Nº 22899, tratado en la sesión Nº 163.	Peticion	2015-11-18 14:47:59.468162	2015-11-18 20:08:46.564689	\N		Cjal Sara Bergesio				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3924	4	\N	\N	\N	\N		Despacho	2015-11-18 14:04:13.436645	2015-11-19 11:23:45.623383	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-11-18
3873	1	\N	\N	\N	\N		Despacho	2015-11-10 15:24:33.284204	2015-11-10 15:29:48.046347	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-11-10
3926	2	\N	\N	\N	\N		Despacho	2015-11-18 14:11:55.082617	2015-11-19 12:03:56.949848	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-11-18
3872	1	\N	\N	\N	\N		Despacho	2015-11-10 15:20:54.591869	2015-11-12 13:09:46.332268	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-11-10
3920	\N	\N	\N	\N	\N		Despacho	2015-11-18 13:55:01.202269	2015-11-18 13:55:01.202269	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	\N
3932	2	Proyecto de Ordenanza. Solicitar al secretario de Desarrollo Urbano, Obras y Servicios Publicos, Sr Jorge Mendez, arbitre los medios nesesarios para el cumplimiento de los sig articulos. Ordenar la restitucion y colocacion de nuevas luminarias en el barrio San Eduardo, en el sector comprendido entre calles Castelli y Alejandro Aguado. ordenar la correcta  poda de arboles pernnes en calle Gral Bustos, desde Castelli hasta Alejandro Aguado	\N	\N	\N	Expediente Legislativo Nº 22898, tratado en la sesión Nº 163.	Peticion	2015-11-18 14:45:33.568404	2015-11-18 20:08:24.067128	\N		Cjal Sara Bergesio.				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3934	2	Proyecto de Ordenanza. Solicitar al secretario de Desarrollo Urbano, Obras y Servicios Publicos, Sr Jorge A. Mendez, efectue de manera urgente el arreglo en todas las calles de tierra comprendidas dentro del Brrio San Eduardo, siendo esto: pasar la maquina, enarenar y realizar el riego diario de las mismas. Arbitre lo nesesario para que se efectue un cronograma para el  el riego diario de todas las calles.	\N	\N	\N	Expediente Legislativo Nº 22900, tratado en la sesión Nº 163.	Peticion	2015-11-18 14:50:03.114553	2015-11-18 20:09:15.465225	\N		Cjal Sara Bergesio				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3828	\N	Proyecto de Ordenanza por la que se aprueba el Convenio de Cooperaciòn suscripto con el Colegio Italo - Argentino  " Dante Alighieri"Firman: Juan Rubhen Jure -  Guillermo Mana	\N	\N	\N	Expediente Legislativo Nº 22856, tratado en sesión Nº 159	Peticion	2015-11-04 15:44:26.551559	2015-11-18 20:58:46.388351	\N	Secretaria del Concejo Deliberante	DEM Dante Alighieri				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3927	1	\N	\N	\N	\N		Despacho	2015-11-18 14:14:42.761459	2015-11-18 15:30:50.478651	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-11-18
3917	\N	\N	\N	\N	\N		Despacho	2015-11-18 13:39:52.740036	2015-11-18 15:40:30.461926	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-11-18
3916	1	\N	\N	\N	\N		Despacho	2015-11-18 13:34:00.062263	2015-11-18 15:45:35.760874	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-11-18
3921	4	\N	\N	\N	\N		Despacho	2015-11-18 13:58:13.436369	2015-11-18 15:52:22.578253	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-11-18
3923	5	\N	\N	\N	\N		Despacho	2015-11-18 14:02:37.386623	2015-11-19 12:08:16.357332	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-11-18
3919	3	\N	\N	\N	\N		Despacho	2015-11-18 13:51:08.856531	2015-11-19 12:14:03.96874	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-11-18
3930	1	\N	\N	\N	\N		Despacho	2015-11-18 14:26:02.036222	2015-11-19 13:01:07.500589	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-11-18
3931	1	\N	\N	\N	\N		Despacho	2015-11-18 14:27:41.898886	2015-11-19 13:07:44.481784	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-11-18
3918	4	\N	\N	\N	\N		Despacho	2015-11-18 13:48:53.753486	2015-11-19 15:27:14.725853	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-11-18
3925	4	\N	\N	\N	\N		Despacho	2015-11-18 14:06:09.222844	2015-11-19 15:31:48.562732	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-11-18
3947	2	Informe sobre el costo del Transporte local y tarifas.	\N	\N	\N	Nota convertida en expediente Legislativo Nº 22908- SESIÓN nº 165.	Peticion	2015-11-20 15:41:15.511734	2015-11-24 16:39:23.532573	\N		Sociedad Anònima Transporte Ciudad de Rìo  Cuarto	Indio Felipe Rosas 184	0358-4626452/4630104/122		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4167	1	\N	\N	\N	\N		Despacho	2015-12-21 14:03:57.663511	2015-12-22 14:26:17.250616	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-21
3885	11	Recurso Humanos, Notificando Tardanzas 	\N	\N	\N		Peticion	2015-11-12 13:12:06.711858	2015-11-12 13:39:56.771623	\N	Secretaria del Concejo Deliberante - Recursos Humanos del Concejo Deliberante	Libia Gonzalez				\N	\N	\N	\N	\N	mechenique@entrada.com	\N
3881	1	\N	\N	\N	\N		Despacho	2015-11-10 16:00:42.756415	2015-11-12 14:15:46.642059	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-11-10
3889	1	Oficio Expediente 2.277.381- Zarandon, Mauricio Ezequiel con la C/ Coop de trabajo  matenimiento de la ciudad limitada y otro.	\N	\N	\N		Peticion	2015-11-13 14:57:27.55824	2015-11-13 15:02:52.260214	\N		Claudia Luna Cufre. (Abogada)				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
3890	1	Programa Vinculaciòn Legislativa	\N	\N	\N		Peticion	2015-11-13 15:02:53.270415	2015-11-13 15:12:32.828547	\N	Secretaria del Concejo Deliberante	Natalia Ysaacson - Coordinadora Pedagògica - C.E.N.M.A  Nº 73 - Dr. A . Jauretche Anexo				\N	\N	\N	\N	\N	mechenique@entrada.com	\N
3957	2	" Muestra Fotògrafica" de  la Instituciòn  "Centro den Dìa Proyectar"	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 22913- SESIÓN Nº 165.	Peticion	2015-11-24 13:21:16.976133	2015-11-24 16:45:05.965256	\N	Secretaria del Concejo Deliberante	Presidente Concejo Deliberante Claudio Miranda " Muestra Fotogràfica"				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3928	2	\N	\N	\N	\N		Despacho	2015-11-18 14:15:36.947964	2015-11-18 15:25:59.84238	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-11-18
3897	10	Solicita ayuda con dos pasajes (ida y vuelta) a ciudad de Cordoba por problemas de salud.	\N	\N	\N		Peticion	2015-11-16 14:07:04.507699	2015-11-16 14:28:25.677128	\N		Amanda Nelida Ruiz	Pje Inti Huasi 272	0358-154383561		\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
3892	4	Solicita ayuda Ecònomica por problemas de Salud	\N	\N	\N	Expediente Legislativo Nº 22880, tratado en la sesión Nº 163.	Peticion	2015-11-13 16:08:41.724676	2015-11-18 19:56:58.684841	\N	Secretaria del Concejo Deliberante	Barrio Alejandra Noemi	Misiones 1271	358-154262266		\N	\N	\N	\N	\N	rarias@entrada.com	\N
3893	4	Proyecto de Ordenanza que tiene por objeto generar incorporacion en los regimes laborales vigentes en en el Estado Municipal, la figura de "licencia por violencia de genero" como forma adicional  de proteger a los agented del Estado Municipal que son victimas de este flagelo Social.	\N	\N	\N	Expediente Legislativo Nº 22881, tratado en la sesión Nº 163.	Peticion	2015-11-16 11:36:02.769512	2015-11-18 19:57:45.365906	\N		Cjal Viviana Pomiglio				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3894	1	Nota solicitando declarar ciudadana destacada a la sra Clelia de Boscatto.	\N	\N	\N	Expediente Legislativo Nº 22882, tratado en la sesión Nº 163.	Peticion	2015-11-16 12:28:12.894432	2015-11-18 19:58:07.421556	\N		Graciel Pacheco ( Tesorera). Viviana Bouvier (Presidente) Asociacion Vecinal Brrio Golf	Gobernador Guzman 1970	0358-4305956		\N	\N	\N	\N	\N	rarias@entrada.com	\N
3936	3	Proyecto de Ordenanza. Ordenar al Sr Jorge A. Mendez arbitre las medidas nesesarias para poner en marcha e implementar la revalorizacion de los espacios de los brrios en donde se puedan pistas saludables, juegos, iluminaciones etc. teniendo en cta los espacios situados entre calle pje Balzano, Luis Reinaudi, Remedios de Escalada y Paso de los Andes en brrio San Eduardo y el espacio situado en calle Fernando.	\N	\N	\N	Expediente Legislativo Nº 22897, tratado en la sesión Nº 163.	Peticion	2015-11-18 14:53:25.46227	2015-11-18 20:07:23.353024	\N		Cjal Sara Bergesio				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3882	3	Proyecto de Resolución. Adherir a la segunda marcha "Ni Una Menos" que se realizara en esta ciudad el dia 25 de noviembre. Coincidentemente con la Convocatoria Nacional.	\N	\N	\N	Expediente Legislativo Nº 22875, tratado en Sesión Nº 160	Peticion	2015-11-10 16:27:22.818452	2015-11-18 21:08:58.462473	\N		Cejal Biviana Pomiglio				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3929	\N	\N	\N	\N	\N		Despacho	2015-11-18 14:23:02.887427	2015-11-19 12:25:54.04278	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-11-18
3922	5	\N	\N	\N	\N		Despacho	2015-11-18 14:00:43.547075	2015-11-19 15:38:13.028232	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-11-18
3990	7	Solicita ayuda economica por problemas severos de salud que le impiden trabajar. Ademas solicita pasajes de colectivo.	\N	\N	\N		Peticion	2015-11-25 20:52:54.122321	2015-11-25 21:03:18.70554	\N		Guillermo Castro	Pasaje Elias Moyano 1476	0358-154320007		\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
3953	\N	Dectretos: 3117/15 - 3153/15 - 3154/15 - 3155/15 - 3156/15 - 3157/15 - 3158/15 - 3160/15 - 3161/15 - 3163/15 - 3164/15 - 3165/15 - 3180/15\r\nOrdenanzas: 1200/15 - 1203/15 - 1204/15 - 1205/15 - 1206/15 - 1207/15 - 1209/15 - 1210/15 - 1211/15 - 1212/15 - 1213/15 - 1214/15 - 1215/15 - 1216/15 - 1217/15 - 1219 /15  	\N	\N	\N		Peticion	2015-11-24 12:16:22.828295	2015-11-24 15:21:03.905827	\N	Informatica	 DEM - Decretos y Ordenanzas				\N	\N	\N	\N	\N	mechenique@entrada.com	\N
3955	1	Nota solicitando donacion de facturas y gaseosas para tombola a beneficio de equipo de futbol femenino.	\N	\N	\N		Peticion	2015-11-24 12:32:53.226604	2015-11-24 15:36:36.023748	\N		Las Mujeres del Barrio Padre Carlos Mugica	Pje Publico 2226	0358-4827916		\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
3951	2	Nota solicitando sea reconocida como ciudadana distinguida de la ciudad de Rio Cuarto a la Sra Clelia Sturniolo de Boscatto, avalando asi la solicitud efectuada oportunamente por la Comision Directiva de la Asociacion  Vecinal Golf.	\N	\N	\N	nota que se adjunta al Expediente Legislativo Nº 22882 .	Peticion	2015-11-23 20:48:15.632442	2015-11-24 16:33:35.352721	\N		Subsecretaria de Educacion. Profesora Andrea Suray Ontivero.( Directora Gral de Educacion)	Pje de la Concepcion 650. 1er piso.	0358-4671322		\N	\N	\N	\N	\N	rarias@entrada.com	\N
3956	4	Solicita Intervenciòn Municipal \r\nPropiedad declarada Edificio Històrico Municipal	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 22915- SESIÓN Nº 165.	Peticion	2015-11-24 12:46:12.271185	2015-11-24 16:45:41.025204	\N	Secretaria del Concejo Deliberante	Julio Ducuron	Bvad.Gral Roca 930	4648288		\N	\N	\N	\N	\N	rarias@entrada.com	\N
3962	4	Solicita Pasajes (dos de ida y dos de vuelta) para la sra Rosana Beatriz Gambero el dia 25 del cte por problemas de salud.	\N	\N	\N		Peticion	2015-11-24 16:03:14.828454	2015-11-24 16:03:14.828454	\N		Cjal Humberto Benedetto				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
3941	2	Proyecto de Ordenanza. Desafectase del dominio publico Municipal para ser afectado al dominio Privado del espacio verde ubicado en la manzana designada catastralmente como  C.06-S.02-M.014, con una superficie total de 5799,21 metros cuadrados.. Donase la fraccion de terreno descripta precedentemente a la Asociacion Civil de Permisionarios de Remises Unidos de Rio Cuarto, con destino a la construccion de la sede de la referida Asociacion.\r\n\r\nProyecto de Ordenanza Nº de fojas 2. Anexo Nº de fojas:36	\N	\N	\N	\r\nNota convertida en expediente Legislativo Nº 22903- SESIÓN nº 165.	Peticion	2015-11-20 13:00:16.156469	2015-11-24 16:36:50.322188	\N		DEM				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3945	\N	 Solicita ayuda economica por problemas de salud.	\N	\N	\N	Nota convertida en expediente Legislativo Nº 22907- SESIÓN nº 165.	Peticion	2015-11-20 15:30:59.279299	2015-11-24 16:39:08.007542	\N		Delgado Yamila Antonella	Leandro Alem 538	0358-155045847		\N	\N	\N	\N	\N	rarias@entrada.com	\N
3948	3	Solicita ayuda economica para instalacion de una panchera para su sosten y el de su flia.	\N	\N	\N	Nota convertida en expediente Legislativo Nº 22910- SESIÓN nº 165.	Peticion	2015-11-20 15:49:21.969779	2015-11-24 16:40:31.352498	\N		Lidia Calderon	130 vivienda. Carlos Mojica. Pje publico 2320	0358-155010624/154344463		\N	\N	\N	\N	\N	rarias@entrada.com	\N
3960	14	Proyecto de Ordenanza solicita Condonaciòn del Servicio de EMOS para el Sr.Benitez Vicente Emilio con Domicilio en Rafael Obligado 140	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 22917- SESIÓN Nº 165.	Peticion	2015-11-24 13:30:48.795739	2015-11-24 16:46:14.919543	\N	Secretaria del Concejo Deliberante	Concejal Guillermo Natali		358 - 154171288		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4173	7	\N	\N	\N	\N		Despacho	2015-12-21 14:30:40.289963	2015-12-22 12:44:53.271508	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-21
4166	1	\N	\N	\N	\N		Despacho	2015-12-21 14:02:38.581608	2015-12-22 14:37:08.251774	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-21
3898	\N	Decretos:3112/15 - 3129/15- 3133/15 - 3134/15 - 3139/15 - 3140/15 -  3141/15- 3142/15 - 3143/15 - \r\nOrdenanzas:1171/15- 1172/15- 1178/15- 1179/15-1180/15- 1181/15 - 1185/15- 1186/15- 1187/15- 1188/15- 1190/15- 1191/15- 1192/15- 1193/15- 1194/15- 1195/15- 1196/15- 1197/15- 1198/15- 1201/15	\N	\N	\N		Peticion	2015-11-16 14:18:09.064894	2015-11-16 14:37:39.837997	\N	Informatica	DEM				\N	\N	\N	\N	\N	mechenique@entrada.com	\N
3883	1	Eleva nota solicitando equipo de sonido para la realizacion del "II Encuentro de Bandas Escolares Musicales" a realizarse el dia 26 de noviembre de cte año en el horario de 9 a 16 hs.	\N	\N	\N	TURNO TARDE	Peticion	2015-11-10 22:03:12.969073	2015-11-10 22:12:59.130692	\N		Ipem Nº 28 "Villa De La Concepcion de Rio Cuarto.( Yvana Sayago Cord de I.P.E.M 28. Prof Elba Beatriz Sydor Directora I.P.E.M 28)	Venezuela 950	0358-4676805		\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
3884	\N	Nota informando los miembros que integran la comision especial de analisis, debate y formulacion del Marco general y proyecto Integral del Servicio de Higiene Urbana. Los Cejales miembros de la comision seran :Humberto Benedetto,Martin Carranza, Claudio Miranda y Francisco Varela Geuna.	\N	\N	\N		Peticion	2015-11-12 12:25:19.786477	2015-11-12 12:40:32.86481	\N		Cejal Martin Carranza (Bloque Rio Cuarto para todos)				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
3751	3	Fundamentos:  Situaciòn critica Cinturòn Verde	\N	\N	\N	Expediente Legislativo Nº 22804, tratado en la sesión Nº 157	Peticion	2015-10-23 14:05:46.269666	2015-11-18 20:22:38.479802	\N	Secretaria del Concejo Deliberante	Concejal Eduardo Scoppa				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3887	2	Solicita Pasaje 1 de Ida y otro de regreso para la Sra Silvia Urquiza a la Ciudad de Buenos Aires para participar de una Jornada de Judicializaciòn de la Discapacidad 	\N	\N	\N		Peticion	2015-11-12 15:20:16.730526	2015-11-12 15:26:25.878546	\N	Contaduria Concejo Deliberante	Concejal Maria del Carmen Cabral				\N	\N	\N	\N	\N	mechenique@entrada.com	\N
3891	11	Proyecto de Ordenanza en la que se solicita ua ayuda economica por problemas de salud para la sra Violeta Neomi Alvarez de la cantidad de $ 2000 ( dos mil)	\N	\N	\N	Expediente Legislativo Nº 22879, tratado en la sesión Nº 163.	Peticion	2015-11-13 15:18:02.037762	2015-11-18 19:56:14.437153	\N		Cjal Hipolito Ontivero. (Bloque Rio Cuarto Para Todos)	Corrientes 1083	0358-4338847		\N	\N	\N	\N	\N	rarias@entrada.com	\N
3888	1	Subsecretaria de Recursos Humanos Informa que el Dìa miercoles 25 de Noviembre a las 8:30hs se desarrollarà en el despacho de la Presidencian del Concejo el Concurso cerrado de antecedentes para la cobertura de cargos por carrera administrativa	\N	\N	\N		Peticion	2015-11-13 13:53:56.853806	2015-11-13 14:08:00.22633	\N	Recursos Humanos del Concejo Deliberante y Secretaria del Concejo Deliberante	Contadora Libia Gonzalez				\N	\N	\N	\N	\N	mechenique@entrada.com	\N
3895	1	Solicitan Reconocimiento o Distinciòn a los Sres. Ezequiel Pedrazza y Ramòn Amaya	\N	\N	\N		Peticion	2015-11-16 12:28:14.017612	2015-11-16 12:40:56.240995	\N	Secretaria del Concejo Deliberante	Comisiòn Directiva Vecinal Barrio Golf	Gobernador Guzman 1970	Cel 358  - 4305956		\N	\N	\N	\N	\N	mechenique@entrada.com	\N
3896	1	Solicitan la Banca del Ciudadano para el dÌa  26 de Noviembre del corriente en la Instituciòn	\N	\N	\N	Expediente Legislativo Nº 22883, tratado en la sesión Nº 163.	Peticion	2015-11-16 12:29:57.599452	2015-11-18 19:58:30.296994	\N	Secretaria del Concejo Deliberante	Asociaciòn Vecinal Barrio Golf 	Gobernador Guzmàn 1970	358 - 4305956		\N	\N	\N	\N	\N	rarias@entrada.com	\N
3899	3	Solicita ayuda economica para solventar gastos de salud.	\N	\N	\N	Expediente Legislativo Nº 22885, tratado en la sesión Nº 163.	Peticion	2015-11-16 14:34:54.11433	2015-11-18 19:59:06.886925	\N		Claudia Zabala	Rio Quinto 425	0358-154027817		\N	\N	\N	\N	\N	rarias@entrada.com	\N
3901	5	Dictamenes: Firmados por Osvaldo Còrdoba y Lucia Vogliotti	\N	\N	\N	Expediente Legislativo Nº 22886, tratado en la sesión Nº 163.	Peticion	2015-11-17 10:50:18.964233	2015-11-18 19:59:45.270578	\N	Secretaria del Concejo Deliberante	Tribunal De Cuentas				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3902	1	Solicita Subsidio de pesos 5.000 ($ 5000) para efectuar tareas de arreglo del sistema elèctrico	\N	\N	\N	Expediente Legislativo Nº 22888, tratado en la sesión Nº 163.	Peticion	2015-11-17 12:24:08.904461	2015-11-18 20:00:28.592005	\N	Secretaria del Concejo Deliberante	Vecinal Golf	Gobernador Guzmàn 1970	358- 4305956		\N	\N	\N	\N	\N	rarias@entrada.com	\N
3915	1	Proyecto Resolucion.Dirigirse al secretario Desarrollo Urbano Obras y Servicios Publicos:  Sr Jorge A. Mendez , a los fines de realizar el estudio de factibilidad tecnica para la realizacion de vallas y tribunas para los carnavales de Rio Cuarto 2016.	\N	\N	\N	Expediente Legislativo Nº 22896, tratado en la sesión Nº 163.	Peticion	2015-11-18 13:23:51.012212	2015-11-18 20:05:40.077792	\N		Cjal Leticia Pauluzzi.8 Bloque Union por Cordoba)				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3886	4	Proyecto de Ordenanza solicita Ayuda Economica para la Sra. Marisa Gomez DNI 14657891 con domicilio en Pje.Beethoven 42. Cel 	\N	\N	\N	Expediente Legislativo Nº 22878, tratado en la sesión Nº 163.	Peticion	2015-11-12 14:55:33.879146	2015-11-18 20:08:00.477169	\N		Concejal Martin Carranza				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3935	2	Proyecto de Ordenanza . Ordenar al secretario Jorge Alejandro Mendez la construccion de un refugio o garita en la interseccion de calles pasaje Balzano y Remedios de Escalada, las mismas situadas en el Brrio San Eduardo.	\N	\N	\N	Expediente Legislativo Nº 22901, tratado en la sesión Nº 163.	Peticion	2015-11-18 14:50:36.096003	2015-11-18 20:09:40.15941	\N	Secretaria del Concejo Deliberante	Concejal Sara Bergesio				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3746	1	Nota solicitando se declare de interes cultural la segunda edicion del libro " LA INMIGRACION ITALIANA EN EL SUR DE CORDOBA DESDE 1870-1820" de autoria de autoria del Lic. Roberto A. Lucero Moriconi"	\N	\N	\N	Expediente Legislativo Nº 22800, tratado en la sesión Nº 157	Peticion	2015-10-23 12:19:39.447122	2015-11-18 20:20:46.105037	\N		Sociedad Italiana de S. M " Porta Pia"	Colon 243	0358-154112205/ 4625382		\N	\N	\N	\N	\N	rarias@entrada.com	\N
3949	\N	Solicita 2 Pasajes de ida y vuelta a la ciudad de Cba para la sra Brito Juana Mirta por razones de salud.	\N	\N	\N		Peticion	2015-11-23 15:13:29.041677	2015-11-23 15:19:36.761121	\N		Cjal Samantha David				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
3950	1	Solicita Refuerzo de Sonido, para el dìa 1 de Diciembre de 2015 en Recinto Concejo Deliberante	\N	\N	\N		Peticion	2015-11-23 15:15:32.784624	2015-11-23 15:21:47.084628	\N	Secretaria del Concejo Deliberante	Abdòn Jose		358- 154298395		\N	\N	\N	\N	\N	mechenique@entrada.com	\N
3952	2	Proyecto de Ordenanza por la que se aprueba el Acta acuerdo de Transferencia de una Fracción de terreno ubicada en el Parque Industrial de Río Cuarto \r\n2 Folios Nota y 50 del Anexo	\N	\N	\N	Proyecto convertido en Expediente Legislativo Nº 22911 SESIÓN 165- EXP. ADMINISTRATIVO Nº 8919/2007.	Peticion	2015-11-24 12:10:58.063432	2015-11-24 16:43:30.376743	\N	Secretaria del Concejo Deliberante	DEM				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3954	7	Solicita ayuda economica para adquirir audifonos para su hijo Alexis Ulises Fernandez.	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 22912- SESIÓN Nº 165.	Peticion	2015-11-24 12:17:19.975335	2015-11-24 16:44:46.855118	\N		Cecilia Herrera	Rio Segundo 850	0358-4646659/ cel 0358-154325977		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4699	4	\N	\N	\N	\N		Despacho	2016-04-13 14:07:06.377515	2016-04-13 14:23:40.633378	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-04-13
3984	1	\N	\N	\N	\N		Despacho	2015-11-25 15:27:42.165825	2015-11-26 11:08:37.532808	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-11-25
4107	3	\N	\N	\N	\N		Despacho	2015-12-15 14:14:50.173491	2015-12-15 16:12:42.917068	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-03
3958	1	La Presidenta del Asilo San Josè Solicita ayuda Ecònomica para solventar gastos 	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 22914- SESIÓN Nº 165.	Peticion	2015-11-24 13:21:45.239283	2015-11-24 16:45:23.719835	\N	Secretaria del Concejo Deliberante	Ana Genre de Castellarini (Pte.Conf. Sta Rosa de Viterbo)	Avda Marcelo T. V. Alvear 1030. Rio Cuarto.	0358-4646770		\N	\N	\N	\N	\N	rarias@entrada.com	\N
3963	9	Solicita ayuda econòmica para solventar gastos de leche recetada 	\N	\N	\N		Peticion	2015-11-25 11:01:46.50387	2015-11-25 11:17:52.538975	\N	Secretaria del Concejo Deliberante	Torradi Cristian Ivan	Dinkeldein 576	358 - 154303167		\N	\N	\N	\N	\N	mechenique@entrada.com	\N
3975	\N	\N	\N	\N	\N		Despacho	2015-11-25 14:56:23.37164	2015-11-25 14:56:23.37164	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4698	5	\N	\N	\N	\N		Despacho	2016-04-13 14:05:49.204303	2016-04-13 14:32:49.553639	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-04-13
4697	4	\N	\N	\N	\N		Despacho	2016-04-13 14:04:25.288742	2016-04-13 14:36:26.57792	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-04-13
4696	5	\N	\N	\N	\N		Despacho	2016-04-13 14:02:17.448757	2016-04-13 14:40:37.405381	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-04-13
4799	2	Proyecto de Ordenanza: Aprobando pago a CISPREN concepto de redeterminaciòn  de precios - Circulo Sindical de la Prensa\r\nAnexo: 54 copias	\N	\N	\N	Expediente Legislativo Nº 23427- iniciado en Sesión Ordinaria Nº 183 de fecha 5/5/16	Peticion	2016-04-22 15:22:16.299716	2016-05-04 13:40:12.559162	\N	Secretaria del Concejo Deliberante	DEM - Juan Ruben Jure -  Cdora. Marìa Alicia Panza				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3980	5	Solicita 2 Pasajes de omnibus ( ida y vuelta) a ciudad de Cba  para la sra Dolores Andrea Leguizamon por motivos de salud.	\N	\N	\N		Peticion	2015-11-25 15:16:01.32075	2015-11-25 16:55:47.479816	\N		Cejal Gulillermo Natali				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
3977	32	Proyecto de Ordenanza. ceder en comodato un terreno público de dominio privado a la vecinal "las ferias".	\N	\N	\N	Nota convertida en expediente Legislativo Nº 22930- SESIÓN nº 165.	Peticion	2015-11-25 15:06:32.639248	2015-11-26 12:48:28.519114	\N		Concejal Martin Carranza				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3978	4	Proyecto de Resolucion S/ declaracion de Institucion destacada de la ciudad de Rio Cuarto a Uru Cure Rugby Club.	\N	\N	\N	Nota convertida en expediente Legislativo Nº 22931- SESIÓN nº 165.	Peticion	2015-11-25 15:08:14.941821	2015-11-26 12:48:48.871738	\N		Cejal Martin Carranza (Bloque Rio Cuarto para todos)				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3979	2	Resoluciòn: solicita el arreglo del alambrado perimetral que rodea al Dispensario Nº 7 ubicado en la calle Paso de los Andes 1225 	\N	\N	\N	Nota convertida en expediente Legislativo Nº 22932- SESIÓN nº 165.	Peticion	2015-11-25 15:10:19.710268	2015-11-26 12:49:09.106882	\N	Secretaria del Concejo Deliberante	Concejal Sara Bergesio				\N	\N	\N	\N	\N	rarias@entrada.com	\N
4700	4	Universidad Nacional de Rìo Cuarto -Resoluciòn Declarar de Interès Educativo y Municipal  "Diplomatura en Sociedad, Discursos y Sujetos Politicos"\r\n	\N	\N	\N	Convertido en Expte Legislativo Nº 23375 en Sesión Ordinaria  N 181 de fecha 14/4/2016	Peticion	2016-04-13 15:14:21.285151	2016-04-14 13:20:33.976433	\N	Secretaria del Concejo Deliberante	Concejal Leticia Paulizzi				\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4701	17	Proyecto de Ordenanza: Comision de Economia y Presupuesto para dar lecura y analizar los expedientes iniciados por diferentes instituciones de la ciudad, solicitando Condonacion y Eximicion de Impuestos.	\N	\N	\N	Convertido en Expte Legislativo Nº 23376 en Sesión Ordinaria  N 181 de fecha 14/4/2016	Peticion	2016-04-13 15:31:54.193985	2016-04-14 13:22:40.157115	\N		Cjal Leticia Perez. Cjal Barotti. Cjal Olga Cantoro. Cjal Viviana Pomiglio. Cjal Francisco Varela. Cjal Carlos Gaso.				\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4804	4	Solicita ayuda economica para el Sr- Lopez Aldo Roberto  a los fines de poder cubrir gastos relacionados al fallecimiento de su hijo	\N	\N	\N	Expediente Legislativo Nº 23430- iniciado en Sesión Ordinaria Nº 183 de fecha 5/5/16	Peticion	2016-04-25 14:12:12.102938	2016-05-04 13:41:31.039014	\N	Secretaria del Concejo Deliberante	Concejal Olga cantoro				\N	\N	\N	\N	\N	rarias@entrada.com	\N
4715	1	\N	\N	\N	\N		Despacho	2016-04-13 16:18:58.996102	2016-04-14 10:58:40.097302	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-04-13
4716	1	\N	\N	\N	\N		Despacho	2016-04-13 16:22:17.094158	2016-04-14 11:19:15.37078	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-04-06
4707	1	\N	\N	\N	\N		Despacho	2016-04-13 15:40:01.446365	2016-04-14 11:23:55.180078	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-04-12
4703	1	\N	\N	\N	\N		Despacho	2016-04-13 15:34:00.726438	2016-04-14 11:54:17.885627	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-04-13
4702	2	\N	\N	\N	\N		Despacho	2016-04-13 15:32:07.198961	2016-04-14 12:00:46.134416	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-04-12
4670	11	Eximicion- Condonacion Inmobiliario.	\N	\N	\N	Convertido en Expte Legislativo Nº 23354 en Sesión Ordinaria  Nº 181 de fecha 14/4/2016	Condonacion	2016-04-07 11:59:00.177853	2016-04-14 12:20:09.296445	\N	\N	Pereyra Dora Del Carmen	Leon Palliere 570	0358-154387804		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4693	1	En nombre de la Comisiòn Directiva  hacen llegar adhesiòn al proyecto de la regulaciòn de la actividad de los recuperadores Urbanos y el Reciclaje, asignado con el exp Nº 21946	\N	\N	\N	Firman Presidente:  Ricardo Angel Melappioni -  Secretario: Eduardo Julio Mugnaini Faiad\r\nConvertido en Expte Legislativo Nº 23358 en Sesión Ordinaria  N 181 de fecha 14/4/2016	Peticion	2016-04-12 11:30:03.967991	2016-04-14 12:40:22.095496	\N		Sociedad Italiana de Socorros Mutuo "Porta Pia"	Colon 243	358 .- 4625382		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4710	13	Proyecto. declaracion de Interes de Interes Cultural y Comunitario la presencia de la artista Mar Tarres en el marco de su funcion "Minas jodidas" en consonancia sobre su trabajo sobre la Inclusion y aceptacion  de los Cuerpos Diversos.	\N	\N	\N	Convertido en Expte Legislativo Nº 23377 en Sesión Ordinaria  N 181 de fecha 14/4/2016	Peticion	2016-04-13 15:45:08.813694	2016-04-14 13:23:08.375878	\N		Concejal Viviana Pomiglio				\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4718	2	Solicita pasajes (ida y vuelta) a ciudad de Bs As en calidad de control medico.	\N	\N	\N		Peticion	2016-04-14 13:06:30.130997	2016-04-14 13:15:01.313936	\N		Juan Jose Pinto	Colombia 1003	0358-154112894		\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4692	12	Proyecto de Ordenanza: Solicita ayuda ecònomica para cubrir gastos de salud al Sr. Sanchez Lucio Alberto DNI 23954552	\N	\N	\N	Convertido en Expte Legislativo Nº 23367 en Sesión Ordinaria  N 181 de fecha 14/4/2016	Peticion	2016-04-11 15:38:00.218879	2016-04-14 13:16:30.835087	\N	Secretaria del Concejo Deliberante	Conceja Josè Barotti	General Paz Norte 255	358 - 155091630		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4719	2	Solicita Pasajes (uno de ida y vuelta) a ciudad de Cordoba por motivos de salud.	\N	\N	\N		Peticion	2016-04-14 13:16:01.210345	2016-04-14 13:19:22.235014	\N		Pascuini Ivanna Lorena		0358-1548553-998		\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4704	3	Proyecto de Resolucion pedido informe obra publica 2016.	\N	\N	\N	Convertido en Expte Legislativo Nº 23373 en Sesión Ordinaria  N 181 de fecha 14/4/2016	Peticion	2016-04-13 15:34:01.201164	2016-04-14 13:19:56.327771	\N		Cjal Barotti				\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4813	2	Proyecto de Ordenanza: Abonese los servicios de desmalezado efectivamente prestados y no cobrados por las Asociaciones Vecinales "Barrio las Ferias" y "Centro Pueblo Alberdi" .	\N	\N	\N	Expediente Legislativo Nº 23438- iniciado en Sesión Ordinaria Nº 183 de fecha 5/5/16	Peticion	2016-04-27 12:29:34.013596	2016-05-04 13:44:16.020091	\N		DEM				\N	\N	\N	\N	\N	rarias@entrada.com	\N
4818	1	Solicita ayuda economica para viajar a ciudad de Cba para asistir al 5to encuentro Nacional de Estudiantes de Trabajo Social(ENETS Nª 5) los dias 6, 7y 8 de mayo del cte.	\N	\N	\N	Expediente Legislativo Nº 23439- iniciado en Sesión Ordinaria Nº 183 de fecha 5/5/16	Peticion	2016-04-27 13:29:24.39092	2016-05-04 13:44:36.447302	\N		ENET Nº 5	San Lorenzo 750	0358- 4302146		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4831	11	Eximicion- Condonacion Inmobiliario.	\N	\N	\N	Expediente Legislativo Nº 23442- iniciado en Sesión Ordinaria Nº 183 de fecha 5/5/16	Condonacion	2016-04-28 14:48:59.454342	2016-05-04 13:45:34.062832	\N	\N	Veliz Maria Cristina	Antonio del Valle 1444	0358- 154289361		\N	\N	\N	\N	\N	rarias@entrada.com	\N
3961	4	Proyecto de ordenanza.Otorgase a la sra Natalia Tissera una ayuda economica de $ 2.000  que sera abonado en unica cuota destinado a solventar gastos ocasionados por participacion patin artistico. " Fusion sobre Ruedas". Vcinal Roque Saenz Peña y San Pablo.	\N	\N	\N	Proyecto convertida en Expediente Legislativo Nº 22918- SESIÓN Nº 165.	Peticion	2015-11-24 14:36:03.058925	2015-11-24 16:46:43.372404	\N		Cejal  Olga Cantoro.				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3967	8	Prorecto de Ordenanza: Solicita ayuda econòmica  por razones de salud para  la Sra Andrada Adriana del Valle	\N	\N	\N	Nota convertida en expediente Legislativo Nº 22925- SESIÓN nº 165.	Peticion	2015-11-25 13:17:07.714194	2015-11-26 12:45:48.520906	\N	Secretaria del Concejo Deliberante	Concejal Viviana Pomiglio	Sebastian Vera 426	358- 154833203		\N	\N	\N	\N	\N	rarias@entrada.com	\N
3968	5	Proyecto de Ordenanza: Sra Beatriz Frasson solicita ayuda econòmica por razones de salud	\N	\N	\N	Nota convertida en expediente Legislativo Nº 22926- SESIÓN nº 165.	Peticion	2015-11-25 13:18:54.783274	2015-11-26 12:46:04.597636	\N	Secretaria del Concejo Deliberante	Concejal Viviana Pomiglio	Pedernera 428	4636345		\N	\N	\N	\N	\N	rarias@entrada.com	\N
3974	5	Proyecto de Ordenanza:la Sra Cintia Verònica Olmedo  solicita ayuda Econòmica por razones de salud 	\N	\N	\N	Nota convertida en expediente Legislativo Nº 22927- SESIÓN nº 165.	Peticion	2015-11-25 14:26:58.229596	2015-11-26 12:46:29.00727	\N	Secretaria del Concejo Deliberante	Concejal Marìa del Carmen Cabral	Pasaje  Gomez de Junco  1452	358 - 154899196		\N	\N	\N	\N	\N	rarias@entrada.com	\N
3973	9	Proyecto de Ordenanza. Otorgar al Sr Cristian Martin Ortiz un aporte economico de $2.000 (dos mil) para compra de materiales de construccion.	\N	\N	\N	Nota convertida en expediente Legislativo Nº 22928- SESIÓN nº 165.	Peticion	2015-11-25 14:15:43.906296	2015-11-26 12:46:50.306312	\N		Cjal Samantha David (Bloque UPC- FPV)	Honduras 510. Bda Norte	0358-154844937		\N	\N	\N	\N	\N	rarias@entrada.com	\N
3976	3	Proyecto de Resoluciòn: Declarando Visitante Ilustre de la Ciudad de Rìo Cuarto a la Sra. Alaniz Inès Teresita	\N	\N	\N	Nota convertida en expediente Legislativo Nº 22929- SESIÓN nº 165.	Peticion	2015-11-25 14:58:40.571494	2015-11-26 12:47:11.797517	\N	Secretaria del Concejo Deliberante	Concejal Viviana Pomiglio				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3964	1	Solicitan que se trate el pedido  de una Guarderia Municipal	\N	\N	\N		Peticion	2015-11-25 11:57:02.029627	2015-11-25 13:12:31.022667	\N	Secretaria del Concejo Deliberante	Asociaciòn Vecinal	Luis Rinaudi 2819	Cel. 358- 155079612		\N	\N	\N	\N	\N	mechenique@entrada.com	\N
3969	4	\N	\N	\N	\N		Despacho	2015-11-25 14:06:33.771473	2015-11-25 14:26:00.291436	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-11-25
4709	1	\N	\N	\N	\N		Despacho	2016-04-13 15:43:47.152557	2016-04-19 15:16:52.415378	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-04-13
4805	3	Solicita Eximiciòn - Condonaciòn Impuesto Emos Inmobiliario	\N	\N	\N	Expediente Legislativo Nº 23431- iniciado en Sesión Ordinaria Nº 183 de fecha 5/5/16	Peticion	2016-04-25 15:00:18.244166	2016-05-04 13:42:02.664481	\N	Secretaria del Concejo Deliberante	Liga Veteranos de Futbol " El Talar"	Rioja y 9 de Julio - Cancha Rìo Negro 1350	4625307 - 154019882 Junco Ricardo		\N	\N	\N	\N	\N	rarias@entrada.com	\N
3983	1	\N	\N	\N	\N		Despacho	2015-11-25 15:25:22.941473	2015-11-26 11:11:31.690388	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-11-25
3982	1	\N	\N	\N	\N		Despacho	2015-11-25 15:22:58.167499	2015-11-26 11:14:42.262461	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-11-25
3981	1	\N	\N	\N	\N		Despacho	2015-11-25 15:21:02.150372	2015-11-26 11:23:33.078641	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-11-25
3970	4	\N	\N	\N	\N		Despacho	2015-11-25 14:08:35.853085	2015-11-26 11:45:43.687739	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-11-25
3971	4	\N	\N	\N	\N		Despacho	2015-11-25 14:10:54.524235	2015-11-26 11:53:52.545464	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-11-25
3972	4	\N	\N	\N	\N		Despacho	2015-11-25 14:12:24.177776	2015-11-26 11:58:34.063629	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-11-25
3965	1	El Presidente de la Vecinal Sr. Hugo Palacios solicita la Banca Del Ciudadano	\N	\N	\N	Nota convertida en expediente Legislativo Nº 22921- SESIÓN nº 165.	Peticion	2015-11-25 12:00:47.043476	2015-11-26 12:43:54.780624	\N	Secretaria del Concejo Deliberante	Asociaciòn Vecinal  "San Eduardo" 	Luis Rinaudi 2819			\N	\N	\N	\N	\N	rarias@entrada.com	\N
3966	2	Solicita Banca del ciudadano para el dia jueves 3 de diciembre.	\N	\N	\N	Nota convertida en expediente Legislativo Nº 22924- SESIÓN nº 165.	Peticion	2015-11-25 12:32:33.227997	2015-11-26 12:45:31.307287	\N		Cejal Sara Bergessio ( Bloque UPC- FPv)				\N	\N	\N	\N	\N	rarias@entrada.com	\N
4714	1	\N	\N	\N	\N		Despacho	2016-04-13 16:09:17.154369	2016-04-14 10:44:24.315131	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-03-30
4713	2	\N	\N	\N	\N		Despacho	2016-04-13 15:54:14.58566	2016-04-14 10:49:18.153146	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-04-13
4712	2	\N	\N	\N	\N		Despacho	2016-04-13 15:51:45.072136	2016-04-14 10:54:16.444744	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-04-13
4708	1	\N	\N	\N	\N		Despacho	2016-04-13 15:41:37.044518	2016-04-14 11:28:15.91255	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-04-12
4706	1	\N	\N	\N	\N		Despacho	2016-04-13 15:38:21.236706	2016-04-14 11:32:11.472897	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-04-12
4705	1	\N	\N	\N	\N		Despacho	2016-04-13 15:36:06.000319	2016-04-14 11:35:42.633536	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-04-13
4717	5	Solicita Pasajes (dos de ida y dos de vuelta) a ciudad de Cordoba por motivos de salud de su hijo Gabriel Flores por motivos de salud.	\N	\N	\N		Peticion	2016-04-14 11:27:50.388323	2016-04-14 11:40:07.691868	\N		Maria Cristina Dasso		0358-154201865		\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4675	\N	Re,iten Proyecto de Ordenanza::Por el que se suspende la aplicaciòn del articulo 68ter de la Ordenanza Nº 783/01, desde el 1º de Abril y hasta el 30 de Junio de 2016	\N	\N	\N	Convertido en Expte Legislativo Nº 23351 en Sesión Ordinaria  N 181 de fecha 14/4/2016	Peticion	2016-04-07 13:30:58.054738	2016-04-14 12:34:32.711186	\N	Secretaria del Concejo Deliberante	DEM - Juan Ruben Jure - Jorge Alejandro Mendez - Cdora. Maria Alicia Panza				\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4695	1	Solicitan Banca del Ciudadano	\N	\N	\N	Convertido en Expte Legislativo Nº 23371 en Sesión Ordinaria  N 181 de fecha 14/4/2016	Peticion	2016-04-13 10:39:21.629705	2016-04-14 13:18:05.932088	\N	Secretaria del Concejo Deliberante	Club Sportivo y Biblioteca Atenas - Presidente Omar Armando Isaguirre - Tesorero: Ignacio 	Cabrera esquina Avenida Marconi	358 - 155611168 - 4660382		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4711	3	Proyecto. Declarar de interes Cultural y Educativo el 12ª Festival Latinoamericano de instalacion de Software Libre (Flisol) a realizarse el dia  23 de abril en la ciudad de Rio Cuarto.	\N	\N	\N	Convertido en Expte Legislativo Nº 23374 en Sesión Ordinaria  N 181 de fecha 14/4/2016	Peticion	2016-04-13 15:49:08.508008	2016-04-14 13:20:16.935133	\N		Cjal Daniela Miranda				\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4815	2	Proyecto de Ordenanza por la que se abona al abogado Antonio Maria Hernandez, los servicios prestados y no cobrados en su caracter de representante del Municipio en la causa judicial "CET  S.A.c/ Municipalidad de Rio Cuarto- Accion de Inscontitucionalidad". 	\N	\N	\N	Expediente Legislativo Nº 23434- iniciado en Sesión Ordinaria Nº 183 de fecha 5/5/16	Peticion	2016-04-27 12:37:06.502637	2016-05-04 13:42:54.677931	\N		DEM				\N	\N	\N	\N	\N	rarias@entrada.com	\N
4814	5	Proyecto de Ordenanza por la que se crea el Registro Municipal de Operador Fruti Horticola, en adelante R O.F.H, para la comercializacion de dichos productos, a traves del M.A.R.C (Mercado De Abasto de Rio Cuarto).	\N	\N	\N	Expediente Legislativo Nº 23436- iniciado en Sesión Ordinaria Nº 183 de fecha 5/5/16	Peticion	2016-04-27 12:33:59.50845	2016-05-04 13:43:39.276555	\N		DEM				\N	\N	\N	\N	\N	rarias@entrada.com	\N
4829	1	Informa sobre su renuncia.	\N	\N	\N	Expediente Legislativo Nº 23440- iniciado en Sesión Ordinaria Nº 183 de fecha 5/5/16	Peticion	2016-04-28 12:33:07.556083	2016-05-04 13:45:03.02694	\N		Cjal Humberto Benedetto				\N	\N	\N	\N	\N	rarias@entrada.com	\N
3988	6	Proyecto de Ordenanza. Otorguese al sr Gallardo Matias  la suma de $ 2.000 ( dos mil) destinados a cubrir gastos de salud.	\N	\N	\N	Nota convertida en expediente Legislativo Nº 22933- SESIÓN nº 165.	Peticion	2015-11-25 15:36:29.095635	2015-11-26 12:49:30.580894	\N		Cjales: Adriana Oviedo. Ysabel Cantoro. Maria del Carmen Cabral. Humberto Benedetto.		0358-154247537		\N	\N	\N	\N	\N	rarias@entrada.com	\N
3989	25	Proyecto de Ordenanza: por el que se modifican los Anexos I (Estructura Organica ), II ( Diagrama Estructura Orgànica) y III ( Misiones y Funciones de cada reparticiòn)	\N	\N	\N		Peticion	2015-11-25 15:45:45.005393	2015-11-26 16:17:00.930658	\N	Secretaria del Concejo Deliberante	DEM				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
3996	1	Nota solicitando la gestion de recursos materiales (portland, arena, mallas) dichos materiales son solicitados por la nesesidad de construir un playon Deportivo y posibilitar la implementacion de nuevas disciplinas en Casa del Sol.( Handball, basquet, tenis, etc).	\N	\N	\N		Peticion	2015-11-30 11:41:43.537487	2015-11-30 11:54:51.251717	\N		Casa del Sol ( Carlos Garay. Coordinador de Casa Del Sol.)	Eduardo Bas 650	0358-4671652		\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
3998	4	Proyecto de Ordenanza. Otorguese al Ctro Corazon perteneciente a la Asociacion Civil  "Ayuda a la Niñez" un aporte de $ 3.500 (tres mil quinientos) en cuota unica, destinada a solventar gastos que demande la mano de obra para poder pintar el Ctro Corazon.	\N	\N	\N		Peticion	2015-11-30 13:57:35.989074	2015-11-30 14:43:20.607261	\N		Cjal Leticia Pauluzzi ( Bloque Union Por Cba) Ctro Corazon ( Rene Emilia Merlini, Directora)	San Luis 370	0358-4641258- Cel 0358-4207299		\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
3999	34	Carrera Administrativa	\N	\N	\N		Peticion	2015-11-30 14:48:21.120092	2015-11-30 15:27:15.569399	\N	Secretaria del Concejo Deliberante	Libia Gonzalez - Recursos Humanos				\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4002	3	Solicita una ayuda economica de $ 3.000 (tres mil) para costear gastos de salud.	\N	\N	\N		Peticion	2015-11-30 16:15:17.337376	2015-11-30 16:18:40.655343	\N		Edith Maria Jose Yribarne	Avda España 430	0358- 153405830		\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4003	4	Solicita pasje de ida y vuelta de ciudad de Rio Cto a ciudad de Bs As y de ciudad de Bs As a Rio Cto con motivo de buscar la partida de nacimiento de su hijo para poder cobrar la Asignacion del mismo.	\N	\N	\N		Peticion	2015-12-01 13:32:20.153947	2015-12-01 13:32:42.896672	\N		Cristian Dionisio Coria	Costanera 743	0358-154263813		\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4009	1	Solicita el Uso del Recinto y Hall del Concejo Deliberante desde el Dìa 9 de Diciembre del 2015 para exponer obras Artisticas	\N	\N	\N		Peticion	2015-12-01 16:06:06.912486	2015-12-01 16:09:45.275493	\N	Responsable Area de Prensa: Nerina Bertola	Concejal Viviana Pomiglio				\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4010	4	Contratese Como  personal No Permanente Categoria 58 al Sr. Emanuel Fabio Reinoso para desempeñar funciones en el ambito del Concejo Deliberante	\N	\N	\N		Peticion	2015-12-01 16:30:07.266642	2015-12-01 16:30:07.266642	\N	Secretaria del Concejo Deliberante	Presidente Concejo Deliberante    CLAUDIO MIRANDA				\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4015	1	\N	\N	\N	\N		Despacho	2015-12-02 14:15:45.42731	2015-12-02 14:22:34.121895	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-02
4014	3	Proyecto de Ordenanza.Otorguese al Sr Juan Hildman (Representante legal de la Comunidad) un aporte economicode pesos quince mil ($15.000) para solventar gastos de la instalacion de baños. que seran entregados en una sola cuota	\N	\N	\N		Peticion	2015-12-02 14:15:16.338222	2015-12-02 14:40:56.13826	\N		Cjal Francisco Varela Geuna ( Bloque Rio Cuarto Para Todos)				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4694	2	Proyecto de Ordenanza: Por la que se abona a la Policia de la Provincia de Còrdoba - Departamental Rìo Cuarto los servicios de vigilancia\r\n	\N	\N	\N	Anexo Exp 33722 - Anexo 34033.\r\nConvertido en Expte Legislativo Nº 23372 en Sesión Ordinaria  N 181 de fecha 14/4/2016	Peticion	2016-04-12 15:24:50.713362	2016-04-14 13:19:28.782599	\N	Secretaria del Concejo Deliberante	DEM - Juan Ruben Jure - Ab. Ignacio Fernandez - Cdora. Maria Alicia Panza				\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4728	3	Resolucion 15373 -  Cajas Chicas	\N	\N	\N	expediente legislativo Nº 23384 iniciado en Sesión Ordinaria  Nº 182 de fecha  21/4/16	Peticion	2016-04-15 12:42:02.28453	2016-04-20 12:04:58.568815	\N	Secretaria del Concejo Deliberante	Secretaria de Economia				\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4724	3	Informa la designaciòn de la Sra Vèronica Lucia Pugliese Solivellas como Locador de Servicio DNI 34590751, domiciliada en Paul Grussac 459,  en reemplazo de la Sra Carolina Escalante	\N	\N	\N		Peticion	2016-04-14 14:57:29.663432	2016-04-14 15:06:36.013422	\N	Secretaria del Concejo Deliberante	Concejal Giuillermo Natalil				\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4721	8	Solicita Eximiciòn Impuesto Inmobiliario Año 2016	\N	\N	\N	expediente legislativo Nº 23394 iniciado en Sesión Ordinaria  Nº 182 de fecha  21/4/16	Condonacion	2016-04-14 13:45:14.653863	2016-04-20 12:00:40.180114	\N	\N	Escudero Presentaciòn	Tucumàn 1866	358 - 155045449		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4723	\N	Solicita Eximiciòn - Condonaciòn Impuesto Inmobiliario	\N	\N	\N	expediente legislativo Nº 23380 iniciado en Sesión Ordinaria  Nº 182 de fecha  21/4/16	Condonacion	2016-04-14 14:54:58.979402	2016-04-20 11:58:01.657266	\N	\N	Maldonado Maria Eugenia	Coronel Manuel 654	358- 154346718		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4730	4	Resolucion 15365\r\n	\N	\N	\N	expediente legislativo Nº 23386 iniciado en Sesión Ordinaria  Nº 182 de fecha  21/4/16	Peticion	2016-04-15 12:46:29.284118	2016-04-20 12:05:46.142329	\N		Secretaria de Economia				\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4738	8	Proyecto de Ordenanza: Solicita ayuda ecònomica para cubrir gastos de reparaciòn del techo de la Vivienda del Sr. Mario Eduardo Sosa	\N	\N	\N	expediente legislativo Nº 23393 iniciado en Sesión Ordinaria Nº 182 de fecha 21/4/16	Peticion	2016-04-18 13:20:40.407934	2016-04-20 12:08:52.708649	\N	Secretaria del Concejo Deliberante	Concejal Barotti	358 - 154183734			\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4739	1	Solicita ayuda economica de cinco mil pesos para afrontar los gastos por el dia del trabajador de prensa incluido el festejo del "Dia del Trabajador de la Prensa y la Comunicacion" en la seccional Rio Cuarto del CISPREN..	\N	\N	\N	expediente legislativo Nº 23395 iniciado en Sesión Ordinaria Nº 182 de fecha 21/4/16	Peticion	2016-04-18 13:22:34.16341	2016-04-20 12:09:46.203052	\N		Marta A. Maezo. (Secretaria General. Seccional Rio Cuarto)	Hipolito Yrigoyen 986	0358- 4624522/ 4629229		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4736	3	Solicita Pasaje (uno) ida y vuelta a ciudad de Cordoba el dia 19 de abril del cte para la sra Garro Sonia Ysabel por motivos de salud de su padre.	\N	\N	\N		Peticion	2016-04-18 13:15:10.499912	2016-04-18 13:21:07.362911	\N		Cjal Claudia Bringas				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4722	15	Solicita Eximiciòn - Condonaciòn Impuesto Inmobiliario	\N	\N	\N	expediente legislativo Nº 23379 iniciado en Sesión Ordinaria  Nº 182 de fecha  21/4/16	Condonacion	2016-04-14 14:47:17.165099	2016-04-20 11:57:34.351753	\N	\N	Caceres Hector Ricardo	Rio Nihuil 613	4620991		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4742	2	Proyecto de Ordenanza:La Secretaria de Vivienda de la Municipalidad de Rio Cuarto dar por saldadas una o mas cuotas mensuales de pago correspondiente  a los beneficiarios del "Plan Municipal de viviendas- Clase Media" de acuerdo al perjuicio ocasionado por algun tipo de defecto constructivo en la unidad habitacional recibida.	\N	\N	\N		Peticion	2016-04-18 15:14:24.63096	2016-04-18 15:46:56.070395	\N		Concejal Osvaldo Da Costa - Concejal Josè Barotti				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
3992	3	Nota en la que Solicita dos  Pasajes de ida y dos de vuelta (Rio Cuarto- Bs As) por motivos de salud.	\N	\N	\N		Peticion	2015-11-26 12:28:36.829724	2015-11-26 13:45:16.536153	\N		Mirta Concepcion Tissera	Liniers 1341. IPV. Brrio Alberdi.	0358-15430306		\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
3993	1	Solicita  tenga a bien considerar  la posibilidad de sesionar en las instalaciones del predio Mision de Vida.	\N	\N	\N		Peticion	2015-11-26 12:48:02.906106	2015-11-26 13:53:22.647372	\N		Pastor Raul Sassaroli. (Iglesia Mision de Vida)	Florencio Sanchez 411 (ex predio Uru Cure)			\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
3995	1	Solicita aporte economico de $5.000 (Cinco mil) para realizar arreglos varios en el Salon Social dedicados a mantener el lugar en condiciones.	\N	\N	\N		Peticion	2015-11-26 15:14:41.633342	2015-11-26 15:27:30.160424	\N		Hugo Palacios ( Pte de Vecinal San Eduardo)	Pje La Forgue 2974	0358-4650502		\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
3994	4	Ayuda Economica	\N	\N	\N		Peticion	2015-11-26 15:13:45.211357	2015-11-26 15:44:59.378361	\N	Secretaria del Concejo Deliberante	Marcos Sebastian Aguirre	Pje Pùblico 2257 - Banda Norte	4626108		\N	\N	\N	\N	\N	mechenique@entrada.com	\N
3991	2	Proyecto de Ordenanza por lo que se incorpora a la Ordenanza Nº 1137/15 - Ejecuciòn obra de Pavimentaciònde Calle Roma entre Ruta Nacional A 005y calle Comisario Consigli 	\N	\N	\N		Peticion	2015-11-26 11:59:00.103159	2015-11-30 10:54:17.074558	\N		DEM - Juan Ruben Jure - Jorge Alejandro Mendez 				\N	\N	\N	\N	\N	mechenique@entrada.com	\N
3900	2	Solicitan aumento de Tarifa  partir del primer dìa habil de Diciembre del 2015 el aumento de 17 pesos la bajada de bandera	\N	\N	\N	Expediente Legislativo Nº 22887, tratado en la sesión Nº 163.	Peticion	2015-11-16 15:54:23.396459	2015-11-30 11:28:54.579862	\N	Secretaria del Concejo Deliberante	Federaciòn Nacional de Sindicatos de Conductores de Taxis 	Marìa Olguin 1634	358- 156015822		\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4012	1	Nota elevada por padres que trabajan y organizan las catgorias de futbol infanto- juvenil solicitando pedido de sonido como colaboracion para organizacion de evento homenajeando a jugadores el 11 de diciembre a las 21 hs en la sede que poseen.	\N	\N	\N		Peticion	2015-12-02 12:53:55.646807	2015-12-02 13:21:53.537801	\N		Ctro Culrural Alberdi.( Secretaria: Vte Lopez 453. Campo de Deportes: Sarratea y Pedro Goyena. Brrio Alberdi)	Secretaria Vte Lopez 453. Campo de Deportes: Sarratea y Pedro Goyena. Brrio Alberdi)	0358-154843245 (Veronica Gonzales) 0358-4662195		\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4001	7	Solicita Pasajes para el dia 4 de noviembre para el sr Lujan Victor Osvaldo.	\N	\N	\N		Peticion	2015-11-30 15:12:30.224685	2015-11-30 15:18:18.324807	\N		Cejal Martin Carranza (Bloque Rio Cuarto para todos)		0358-4727377		\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4000	2	Proyecto de Ordenanza Modificar el articulo 60 de la Ordenanza 268/1985	\N	\N	\N		Peticion	2015-11-30 15:09:53.216657	2015-11-30 15:25:44.8534	\N	Secretaria del Concejo Deliberante	Concejal Osvaldo Da Costa				\N	\N	\N	\N	\N	mechenique@entrada.com	\N
3997	\N	Resolucion 15239 ( Folios 56 ) - 15254 (Folios 4) - 15255 ( Folios 85 ) 15264 ( Folios 36 )  ( Folios  15265 ( Folios 30 ) 15267 ( Folios 18 )	\N	\N	\N		Peticion	2015-11-30 13:24:08.081775	2015-11-30 16:17:09.67924	\N	Secretaria del Concejo Deliberante	Secretaria de Economia				\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4004	15	Solicita la Eximicion y Condonacion de la deuda que la Institucion  (sin fines de lucro) mantiene con la Municipalidad de Rio Cuarto y con el Emos.	\N	\N	\N		Peticion	2015-12-01 13:47:17.165468	2015-12-01 14:05:30.784935	\N		Sandra Vanina Nievas (Presidente Club Sportivo El SOL)	25 De Mayo 855	0358-154015478		\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4006	13	Nominas de los agentes que presentan irregularidades respecto a la asistencia diaria del lugar de trabajo.	\N	\N	\N		Peticion	2015-12-01 14:54:02.488256	2015-12-01 15:01:24.954	\N		Cra Libia Gonzalez. Subsecretaria de Recursos Humanos.				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4005	\N	Conurso Pùblico Cerrado Octubre 2015 para la cobertura de cargos de Carrera Administrativa Del Concurso Deliberante	\N	\N	\N		Peticion	2015-12-01 14:06:57.626337	2015-12-01 15:02:55.804196	\N	Secretaria del Concejo Deliberante	Secretaria De Gobierno - SubSecretaria Recursos Humanos				\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4008	4	Proyecto de Resolucion.Dirigirse  al Secretario de Desarrollo Urbano, Obras y Servicios Publicos, a efectos de solicitarle realizar el arreglo y acondicionamiento de las calles comprendidas entre Martin Quenon a Juan Jose Castelli y de Amado Nervo a Pje Juan Sebastian Bach de nuevo Brrio Bimaco, ciudad de Rio Cuarto.	\N	\N	\N		Peticion	2015-12-01 15:45:53.707386	2015-12-01 15:59:34.172124	\N		Cejal Samantha David ( Frente para la Victoria)				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4013	2	Solicitan se contemple la posibilidad de conceder un aporte Ecònomico para la compra de 150 juguetes 	\N	\N	\N		Peticion	2015-12-02 13:46:55.732769	2015-12-02 13:52:52.971793	\N	Secretaria del Concejo Deliberante	Asociaciòn Civil Amigos de la Vida	Yapeyù 989	358-4663426 - 358-4118813		\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4007	4	Resoluciòn: Dirigirse al Secretario de Desarrollo Urbano, Obras y Servicios Pùblicos, Sr. Jorge Mendez 	\N	\N	\N		Peticion	2015-12-01 15:44:38.380771	2015-12-01 16:27:11.360776	\N	Secretaria del Concejo Deliberante	Samantha David				\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4011	5	Proyecto de Ordenanza. Otorgase a la "Asociacion Civil Amigos de la Vida" un aporte economico de pesos Tes Mil ($3.000), destinado a solventar gastos para realizar el dia 22 de diciembre a las 20 y 30 Hs una cena para los niños de su Asociacion.	\N	\N	\N		Peticion	2015-12-02 12:20:43.586066	2015-12-02 12:45:59.26918	\N		Cjal Maria Del Carmen Cabral 				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4720	2	Nota solicitando la donacion de 10(diez) paquetes de galletitas "Diversion" para la realizacion de un te en el Centro de Jubilados y Pensionados Alberdi el dia 17 de abril a las 20 hs.	\N	\N	\N		Peticion	2016-04-14 13:24:43.249254	2016-04-14 14:28:42.745527	\N		Concejal Olga Cantoro				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4725	11	Solicita Eximicion Condonacion Inmobiliario.	\N	\N	\N	expediente legislativo Nº 23381 iniciado en Sesión Ordinaria  Nº 182 de fecha  21/4/16	Condonacion	2016-04-14 15:13:34.467302	2016-04-20 11:58:23.884844	\N	\N	Felipelli Antonio Enrique	Falucho 1215	358 - 154825470		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4734	26	Solicita Eximiciòn Impuesto Inmobiliario año 2016	\N	\N	\N	expediente legislativo Nº 23390 iniciado en Sesión Ordinaria  Nº 182 de fecha  21/4/16	Condonacion	2016-04-18 10:47:42.349505	2016-04-20 11:59:34.75781	\N	\N	Acosta Omar Roque	Amado Nervo 950	358 - 155047472		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4727	22	Resoluciòn: 15366	\N	\N	\N	expediente legislativo Nº 23383 iniciado en Sesión Ordinaria  Nº 182 de fecha  21/4/16	Peticion	2016-04-15 12:41:00.881293	2016-04-20 12:04:26.447762	\N	Secretaria del Concejo Deliberante	Secretaria de Economia				\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4729	46	Resolucion 15341	\N	\N	\N	expediente legislativo Nº 23385 iniciado en Sesión Ordinaria  Nº 182 de fecha  21/4/16	Peticion	2016-04-15 12:44:41.03355	2016-04-20 12:05:20.354098	\N		Secretaria de Economia				\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4735	10	Proyecto de Ordenanza: Solicita Condonacion y Eximicion los automotores acoplados y similares al sr Gustavo Javier Moran.	\N	\N	\N	expediente legislativo Nº 23391 iniciado en Sesión Ordinaria Nº 182 de fecha 21/4/16	Peticion	2016-04-18 12:29:48.46143	2016-04-20 12:08:31.228313	\N		Concejal Hipolito Ontivero	Lavalle 437. 1º Piso. Depto B.			\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4016	5	Solicita al Secretario de Desarrollo Urbano, Obras y Servicios Pùblicos, Sr. Jorge Mèndez	\N	\N	\N		Peticion	2015-12-02 14:18:24.201529	2015-12-02 14:29:54.466164	\N	Secretaria del Concejo Deliberante	Concejal Leticia Paulizzi				\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4040	10	Proyecto de Ordenanza. Ordenese al depto Ejecutivo Municipal para que arbitre los medios nesesarios para la reparacion y puesta en valor de la edificacion ubicada en la que fuera el "Galpon de maquinas" de la estacion del Ferrocarril Andino.	\N	\N	\N	Expediente 20764	Peticion	2015-12-02 16:05:34.733369	2015-12-02 18:01:36.997708	\N		Cejal Daniela Miranda				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4025	2	\N	\N	\N	\N		Despacho	2015-12-02 15:10:54.454874	2015-12-03 13:44:39.77347	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-02
4026	2	\N	\N	\N	\N		Despacho	2015-12-02 15:12:48.806434	2015-12-03 13:50:09.468619	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-02
4036	1	Renuncia	\N	\N	\N		Peticion	2015-12-02 15:45:42.331214	2015-12-02 15:45:42.331214	\N						\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4017	17	Proyect de Ordenanza. Abonar a la Cooperativa de Trabajo Compañeros de Oncativo Ltda, la suma total de pesos dos mil cien ($2.100 ) por ocho dias de servicio de desmalezado en la pista de conduccion localizada en Alberdi al 2.600, efectivamente prestados y no cobrados  en la primera quincena de diciembre de 2015.	\N	\N	\N	(Con Anexo)	Peticion	2015-12-02 14:43:24.78278	2015-12-02 15:46:21.394182	\N		DEM				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4035	1	\N	\N	\N	\N		Despacho	2015-12-02 15:32:56.235825	2015-12-03 13:53:38.361272	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-02
4019	15	Proyecto de Ordenanza.Abonar a la Cooperativa de Trabajo Union  y Fuerza LTDA. la suma de  pesos treinta y cuatro mil ochocientos cuarenta y seis con treinta y  nueve centavos. ( $ 34.846, 39) por 11 diasde servicios de mantenimiento d Espacios Verdes de recreacion publicos dentro del ejido la ciudad de Rio Cuarto, efectivamente prestados y no cobrados en la primera quincena de diciembre 2014.22980 CON ANEXO	\N	\N	\N		Peticion	2015-12-02 14:54:48.327726	2015-12-02 16:01:58.508467	\N		DEM				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4034	1	\N	\N	\N	\N		Despacho	2015-12-02 15:31:46.657356	2015-12-03 13:55:52.069626	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-02
4020	53	Condonacion y eximicion del cien por ciento, de la contribucion que incide sobre el inmueble, el impuesto por financiamiento de la obra publica y el F.O.D.I.S., hasta el 31 de diciembrede 2014. a los Sres Torasa ivar Jose y Diaz Uan Carlos.	\N	\N	\N		Peticion	2015-12-02 15:00:49.757638	2015-12-02 16:27:45.965573	\N		Concejal Humberto Benedetto (Bloque Rio Cuarto para Todos)				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4033	1	\N	\N	\N	\N		Despacho	2015-12-02 15:29:48.515982	2015-12-03 14:02:47.052786	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-02
4021	7	Proyecto de Ordenanza. Otorguese a la sra Maria Soledad Veron una ayuda economica destinada a cubrir los gastos del tratamiento de salud de su hijo	\N	\N	\N		Peticion	2015-12-02 15:04:09.594688	2015-12-02 17:17:28.645425	\N		Cjal Eduardo Scopa				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4022	1	Condonacion y eximicion del cien por cien a los sres a los sres Bernal Medardo y Barbura Ana.	\N	\N	\N		Peticion	2015-12-02 15:04:16.311872	2015-12-02 17:24:10.212204	\N		Cjaes Samantha David, Jose Barotti, Cantoro, Vibiana Pomiglio,				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4023	2	Proyecto de Ordenanza.Transfierase a la fundacion Social Rio Cuarto, la suma de pesos doscientos mil (200.000), destinados a la "Re-fundalizacion del ex ctro Educativo Domingo Faustino Sarmiento".	\N	\N	\N		Peticion	2015-12-02 15:06:26.490892	2015-12-02 17:29:11.962789	\N		Cejales: Cantoro, Pomiglio, Benedetto.				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4037	1	Proyecto de Resolucion. Dirigirse al secretario de Desarrollo Urbano, Obras y Servicios Publicos solicitandole que arbitre los medios nesesarios tendientes a dotar de servicios de cloacas al sector entre calles: Los Troperos al 900/ Entre Rios/ Yapeyu/ Juan Dias De Solis.	\N	\N	\N		Peticion	2015-12-02 15:59:23.644789	2015-12-02 17:46:21.981293	\N		Concejal Daniela Miranda				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4027	4	\N	\N	\N	\N		Despacho	2015-12-02 15:14:41.479596	2015-12-03 14:12:42.022853	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-02
4038	2	Otorguese una ayuda economicaal sr Marcelo Ceballos de dos mil pesos, destinado a solventar gastos que demande la participacion de un grupo de niños en el 48ª Festival Nacional De Malambo en la localidad de Laborde (Cba)	\N	\N	\N		Peticion	2015-12-02 16:01:11.141406	2015-12-02 17:51:31.548693	\N		Concejal Daniela Miranda				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4039	14	Proyecto de Ordenanza. Otorgar a la Sra Dominguez Silvia Beatriz un aporte economico de dos mil pesos destinados a solventar gastos de salud.	\N	\N	\N	Dominguez	Peticion	2015-12-02 16:03:07.365921	2015-12-02 17:55:12.8537	\N		Concejal Daniela Miranda				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4028	2	\N	\N	\N	\N		Despacho	2015-12-02 15:16:19.199942	2015-12-03 14:18:22.425661	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-02
4048	4	Resolucion 777/14	\N	\N	\N		Peticion	2015-12-03 14:48:43.428186	2015-12-03 15:04:20.845409	\N		Secretaria de Desarrollo Urbano, Obras y Servicios Publicos. Sr Jorge A. Mendez.				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4032	4	\N	\N	\N	\N		Despacho	2015-12-02 15:22:36.406018	2015-12-03 15:05:10.672012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-02
4029	5	\N	\N	\N	\N		Despacho	2015-12-02 15:17:57.107198	2015-12-03 15:18:41.563199	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-02
4047	2	Resolucion 832/15	\N	\N	\N		Peticion	2015-12-03 14:48:02.20719	2015-12-03 15:24:25.797379	\N		Secretaria de Desarrollo Urbano, Obras y Servicios Publicos. Sr Jorge A. Mendez.				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4046	2	 Secretario De Desarrollo Urbano,Obras y Servicios Pùblicos . Resoluciòn 815/15	\N	\N	\N		Peticion	2015-12-03 14:47:30.019982	2015-12-03 15:30:33.184471	\N	Secretaria del Concejo Deliberante	Secretaria de Desarollo Urbano, Obras y Servicios Pùblicos -Subsecretaria de Transporte				\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4045	2	Secretario de Desarrollo Urbano, Obras y Servicios Pùblicos. Resolucion 894/15	\N	\N	\N		Peticion	2015-12-03 14:46:36.106347	2015-12-03 15:36:10.776372	\N	Secretaria del Concejo Deliberante	Secretaria de Desarrollo Urbano, Obras y Servicios Publicos. Sr Jorge A. Mendez.				\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4054	8	P`royecto de Ordenanza: : Solicitan se autorize al DEM a contratar  Personal no permanente para desempeñar funciones en àreas del Municipio, se recattegoriza a agentes municipalesquen vienen cumpliendo funciones que exceden la categoria que detectan, adecuando a sus tareas la categoria y los emolumentos que perciben y se efectùan cambios de àreas 	\N	\N	\N		Peticion	2015-12-04 13:43:35.978306	2015-12-04 13:59:29.838512	\N	Secretaria del Concejo Deliberante	DEM - Juan Ruben Jure - Ab. Ignacio R. Fernandez - Cdora. Marìa Alicia Panza				\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4055	3	Solicita Pasaje (de ida y vuelta) a la ciudad de Cba por motivos de salud.	\N	\N	\N		Peticion	2015-12-04 14:15:18.0675	2015-12-04 14:21:20.124924	\N		Maria Aldana Salinas		0358-154831600		\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4056	2	Solicitan colaboraciòn del Municipio para la limpieza e iluminaciòn de baldios y calles terrenos ubicados en sobre la Avenida Argentina.	\N	\N	\N		Peticion	2015-12-04 14:26:01.560753	2015-12-04 14:34:53.34928	\N		Club Deportivo Juan Bautista Alberdi	Colombian 260			\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4049	14	Solicita ayuda economica dada su delicada situacion de salud.	\N	\N	\N	En su momento se ingreso el mismo pedido por la Cra. Maria Alicia Panza con Nº de Ingreso 4018 con fecha 02/12/15 el que queda sin efecto	Peticion	2015-12-03 15:08:41.914199	2015-12-09 12:01:33.411259	\N		Pablo Gaston Moyano	Rio Limay . Psaje publico 14	0358-4643512		\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4743	5	Solicita Pasajes (dos) ida y vuelta a ciudad de Cordoba para la sra Rosana Migliore y su esposo por temas de salud.	\N	\N	\N		Peticion	2016-04-18 15:21:26.931516	2016-04-18 15:39:03.593426	\N		Cjal Carlos Gaso				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4043	2	Resolucion 999/15	\N	\N	\N		Peticion	2015-12-03 14:44:33.285297	2015-12-03 15:38:44.726977	\N		Secretaria de Desarrollo Urbano, Obras y Servicios Publicos. Sr Jorge A. Mendez.				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4066	4	\N	\N	\N	\N		Despacho	2015-12-09 15:41:43.621423	2015-12-10 11:55:20.057828	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-10
4044	2	Resoluciòn 945/15	\N	\N	\N		Peticion	2015-12-03 14:45:47.541345	2015-12-03 15:43:57.835897	\N	Secretaria del Concejo Deliberante	Secretaria De Desarrollo Urbano, Obras y Servicios Pùblicos - Secretario JORGE A. MENDEZ				\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4065	4	\N	\N	\N	\N		Despacho	2015-12-09 15:39:57.52493	2015-12-10 12:10:21.337331	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-10
4051	2	Solicita ayuda economica para adquirir elementos que permitan equipar el gimnasio en el Polideportivo Nª 2	\N	\N	\N		Peticion	2015-12-04 12:35:57.066025	2015-12-04 13:15:08.10607	\N		Union de Padres de Atletas. Claudia Fessia (Presidente); 0358-154027360 (Vicepresidente)	Las Heras 332	0358- 154024984		\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4087	1	\N	\N	\N	\N		Despacho	2015-12-09 16:34:41.667202	2015-12-10 12:12:29.644811	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-09
4052	3	Proyecto de Ordenanza: Construcciòn de 1000  Viviendas - Plan Viviendas Clase Media - Epediente 7471 - S -  2012	\N	\N	\N		Peticion	2015-12-04 13:36:33.154245	2015-12-04 13:36:33.154245	\N	Secretaria del Concejo Deliberante	DEM - Juan Ruben Jure - Ing. Fabricio Pedruzzi - Cdora. Marìa Alicia Panza				\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4053	2	Proyecto de Ordenanza por la que se aprueba el Contrato de Comodato suscripto con la Vecinal Las Quintas	\N	\N	\N		Peticion	2015-12-04 13:41:03.59618	2015-12-04 13:49:11.31105	\N	Secretaria del Concejo Deliberante	DEM - Juan Ruben Jure - Ab. Ignacio Fernandez - Lic. Guillermo G. Mana				\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4050	4		\N	\N	\N	Proyecto de Ordenanza: por lo que se abona a las Asociaciones Vecinales por los Servicios de Desmalezado, efectivamente prestados y no cobrados durante el mes de Noviembre del corriente  Anexo consta de 284 copias	Peticion	2015-12-04 12:19:25.459772	2015-12-04 16:05:21.222054	\N	Secretaria del Concejo Deliberante	DEM - Juan Ruben Jure - Jorge Alejandro Mendez - Cdora. Marìa Alicia Panza				\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4057	1	Solicita  la posibilidad de cumplir con lo solicitado en el expediente 22212, cuyo iniciador fue Colegio La Merced.	\N	\N	\N		Peticion	2015-12-04 16:06:43.510697	2015-12-04 16:38:04.368113	\N		Walter Murua	Mariquita Sanchez de Tompson y Antartida Argentina	0358-4621387		\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4018	14	Solicita sibsidio por razones de salud para el sr Emanuel Moyano.quien padece una enfermedad mixta del tejido conectivo.. la suma es de 3.000 (tres mil)	\N	\N	\N	El Exp`pedido por la Cra. queda sin efecto y el Hermano del Sr. Moyano inicio nuevamente el pedido con el expediente Nº 40	Peticion	2015-12-02 14:50:48.927592	2015-12-09 12:14:35.221611	\N		Contadora Maria Alicia Panza. ( secretaria de Economia)				\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4058	304		\N	\N	\N	Proyecto de Ordenanza: Relacionado con la adjudicaciòn a sus ocupantes de las viviendas del Barrio relocalizado "Rio Limay "	Peticion	2015-12-04 16:27:30.445248	2015-12-09 12:38:32.655952	\N	Secretaria del Concejo Deliberante	DEM - Juan Ruben Jure - Ing. Fabricio Pedruzzi 				\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4085	1	\N	\N	\N	\N		Despacho	2015-12-09 16:32:05.295225	2015-12-10 12:25:41.40606	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-09
4076	\N	\N	\N	\N	\N		Despacho	2015-12-09 16:00:09.698623	2015-12-09 16:00:09.698623	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4086	\N	\N	\N	\N	\N		Despacho	2015-12-09 16:33:21.899216	2015-12-09 16:33:21.899216	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4062	2	apruebase el contrato suscripto ante la Municipalidad de la Ciudad de Rio Cuarto y el Fideicomiso Sur relacionado con la proroga de la locacion del inmueble ubicado en la calle Constitucion 988 de la ciudad de Rio Cuarto, en las condiciones establecidas en el Anexo unico de la presente.	\N	\N	\N	Anexo 33	Peticion	2015-12-09 15:15:10.067807	2015-12-09 16:53:36.385351	\N		DEM				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4075	2	\N	\N	\N	\N		Despacho	2015-12-09 15:58:30.741395	2015-12-10 11:03:18.294515	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-09
4074	1	\N	\N	\N	\N		Despacho	2015-12-09 15:56:22.385017	2015-12-10 11:07:02.491491	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-09
4069	4	\N	\N	\N	\N		Despacho	2015-12-09 15:49:14.284767	2015-12-10 11:14:30.505222	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-10
4067	2	\N	\N	\N	\N		Despacho	2015-12-09 15:43:13.924623	2015-12-10 11:37:21.54653	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-10
4084	1	\N	\N	\N	\N		Despacho	2015-12-09 16:29:55.711571	2015-12-10 12:52:38.393848	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-09
4083	1	\N	\N	\N	\N		Despacho	2015-12-09 16:28:30.194822	2015-12-10 12:54:44.722327	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-09
4082	2	\N	\N	\N	\N		Despacho	2015-12-09 16:27:15.535342	2015-12-10 13:16:37.920578	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-09
4081	2	\N	\N	\N	\N		Despacho	2015-12-09 16:26:01.426693	2015-12-10 13:51:07.241268	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-09
4088	1	Coordinador General Obras y Servicios Pùblicos - Municipalidad De Rìo Cuarto\r\nInforma que va hacer pùblico la Imprudente Contrataciòn de Servicios	\N	\N	\N		Peticion	2015-12-10 13:31:55.649161	2015-12-10 14:00:40.49444	\N	Secretaria del Concejo Deliberante	Claudio Walter Carranza				\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4834	8	Solicita Eximiciòn Impuesto Inmobiliario año 2016	\N	\N	\N	Expediente Legislativo Nº 23445- iniciado en Sesión Ordinaria Nº 183 de fecha 5/5/16	Condonacion	2016-04-29 11:40:04.567343	2016-05-04 13:46:38.693722	\N	\N	Luna Susana Margarita	Estado de Israel 2275	358 - 156013658		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4091	8	Solicita Pasaje ida y vuelta a ciudad de Cba por razones de salud de su nieta.	\N	\N	\N		Peticion	2015-12-10 15:03:09.956031	2015-12-10 15:15:54.056073	\N		Ana Maria Aguirre		0358-156018226		\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4089	1	Solicitan formalmente que se declare de interes Social Y Cultural  la actividad denominada " Quinta Edicion de la Bicicleteada por Pocho Lepratti. Por Memoria, Verdad y Justicia" en homenaje al militante social Claudio,( Pocho) Lepratti.	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 22990, tratado en la Sesión Nº 169 con fecha 17-12-2015.\r\nse modifico el iniciador -Comisión de coordinación y  Planificación de labor.	Peticion	2015-12-10 14:53:11.732202	2016-02-22 13:54:44.027657	\N		 CTA. Julia Giuliani		0358-155063371		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4093	2	Proyecto de Ordenanza:  Modifiquese el articulo 4º de la Ordenanza 1108/15	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 22988, tratado en la Sesión Nº 169 con fecha 17-12-2015.	Peticion	2015-12-10 15:27:12.280823	2016-02-22 13:53:04.504048	\N	Secretaria del Concejo Deliberante	Concejal Eduardo Scoppa				\N	\N	\N	\N	\N	rarias@entrada.com	\N
4095	\N	Solicita Pasajes- 1 de ida y otro de regreso a la ciudad de Còrdoba 	\N	\N	\N		Peticion	2015-12-10 16:16:27.117399	2015-12-10 16:21:22.138236	\N		Teresa Torres	Mosconi Este 179	358- 154295567		\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4096	\N	Solicita 2 Pasajes de Ida y 2 de Vuelta hacia la ciudad de Còrdoba para el Sr. Ramòn Eduardo Escudero por razones de salud	\N	\N	\N		Peticion	2015-12-11 12:43:32.272507	2015-12-11 12:59:44.357291	\N	Contaduria Concejo Deliberante	Concejal Jose Barotti		4660623		\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4094	6	Proyecto de Ordenanza: Homenaje y Recononocimiento a Docentes, Alumnos y Autoridades que formaron parte de la Universidad Nacional de Rio Cuarto Identificando con sus nombres  calles del Barrio Castelli 2	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 22987, tratado en la Sesión Nº 169 con fecha 17-12-2015.	Peticion	2015-12-10 15:40:41.315033	2016-02-22 13:52:22.649534	\N	Secretaria del Concejo Deliberante	Concejal Eduardo Scoppa-Da Costa Osvaldo - Olga Isabel Cantoro				\N	\N	\N	\N	\N	rarias@entrada.com	\N
4099	1	Solicita colaboraciòn de Juguetes,Pan Dulce, golosinas	\N	\N	\N		Peticion	2015-12-14 13:32:40.2778	2015-12-14 14:08:31.498625	\N	Secretaria del Concejo Deliberante	Asociaciòn Civil Sol  De Esperanza - Juan Carlos Pereyra	Las Delicias 1201 - Barrio Las Delicias	358 - 154229819		\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4059	\N	Decretos 3161/15 - 3162/15 - 3181/15 - 3182/15 - 3183/15 - 3184/15 - 3185/15 - 3188/15 - 3189/15 - 3190/15 - 3193/15 - 3194/15 - 3195/15 - 3196/15 - 3214/15 - 3215/15 - 3216/15 - 3217/15  Ordenanzas :1199/15, 1208/15, 1220/15, 1221/15, 1222/15, 1223/15, 1224/15, 1225/151226/15, 1227/15, 1228/15, 1229/15, 1230/15, 1231/15, 1232/15, 1233/15, 1234/15, 1235/15, 1236/15, 1237/15, 1238/15,1240/15.	\N	\N	\N		Peticion	2015-12-09 14:14:39.746283	2015-12-09 14:29:35.788139	\N	Informatica	DEM				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4060	3	Solicita ayuda econòmica para la compra de plantillas	\N	\N	\N		Peticion	2015-12-09 14:24:34.490498	2015-12-09 14:39:26.133963	\N	Secretaria del Concejo Deliberante	Gutierrez Nancy  Rosana	Dr.Carlos Rodriguez 1408 - Barrio San Josè de Calazanz	358-154388277 - 358 154220775		\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4061	3	Solicita pasaje de colectivo (ida y vuelta) a ciudad de Cba, para el dia 9 de diciembre del cte año, por razones de salud de su nieto.	\N	\N	\N		Peticion	2015-12-09 14:46:45.799098	2015-12-09 14:57:58.068732	\N		Cjal Humberto Benedetto				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4100	4	Proyecto de Ordenanza por lo que Sustituye el Anexo Ùnico de la Ordenanza Nº 193/96 que aprueba el Servicio Prestado por el Instituto Municipal de Previsiòn Social denominado Plan de Alta Complejidad - PAC-	\N	\N	\N	\r\nNota convertida en Expediente Legislativo Nº 22991, tratado en la Sesión Nº 169 con fecha 17-12-2015.	Peticion	2015-12-14 15:20:09.697832	2016-02-22 13:55:25.161535	\N	Secretaria del Concejo Deliberante	DEM - Juan Ruben Jure - Ab. Ignacio Fernandez -  				\N	\N	\N	\N	\N	rarias@entrada.com	\N
4744	1	Nota solicitando en representacion de GNC de la ciudad de Rio Cuarto, una reunion conjunta de caracter informativo, con el secretario de Desarrollo Urbano, Obras y Servicios Publicos a los fines de ampliar los conceptos detallados en la nota..	\N	\N	\N		Peticion	2016-04-18 16:25:44.488466	2016-04-19 11:20:00.928763	\N		La Comercial Gas S.A. ( Juan Ignacio Estivill.Presidente) La Barranca SRL (lic. Gerardo Mosso. Apoderado.), Eatacion de Servicio Golf S. A., GNC Alberdi S.A. (Horacio Pinasco)	Avda Marconi 650	0358-4623172		\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4064	1	proyecto de Ordenanza. Condonacion y Eximicion del cien por ciento	\N	\N	\N		Peticion	2015-12-09 15:30:36.352656	2015-12-09 16:28:57.145104	\N		Cjal Jose Barotti, Cjal Viviana Pomiglio, Cjal Cantoro, Cjal Benedetto.				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4070	1	Proyecto de Ordenanza en la que se otorga al Sr Vega Juan un aporte economico de dos mil pesos dedicado a solventar gastos de una investigacion sobre los pueblos originarios de la region, el pais y America.	\N	\N	\N		Peticion	2015-12-09 15:49:35.518628	2015-12-09 16:32:18.118754	\N		Cjal Daniela Miranda				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4745	4	Proyecto de Ordennaza: Otorgar a la sra Analia del Valle Amador un aporte economico de dos mil ($ 2.000) destinados a solventar gastos de primera nesesidad.	\N	\N	\N		Peticion	2016-04-19 11:47:28.510057	2016-04-19 12:03:58.031124	\N		Cjal Hipolito Ontivero				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4072	9	Proyecto de Ordenanza. Otorgar a la sra Basconcelo Claudia Amalia un aporte economico de dos mil pesos destinados a solventar gastos de salud.	\N	\N	\N		Peticion	2015-12-09 15:51:18.196383	2015-12-09 16:35:26.098631	\N		Cjal Daniela Miranda	Olegario Andrade 1459	0358-154902237		\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4073	8	Proyecto de Ordenanza. Condonose y eximase  de la contribucion que incide sobre el inmueble , el impuesto por financiamiento de la obra publica del FODIS hasta el 31 de diciembre del 2014	\N	\N	\N		Peticion	2015-12-09 15:52:47.250577	2015-12-09 16:40:34.900925	\N		Cjal Guillermo Natali				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4071	4	\N	\N	\N	\N		Despacho	2015-12-09 15:50:45.47853	2015-12-10 11:11:28.300275	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-09
4068	5	\N	\N	\N	\N		Despacho	2015-12-09 15:47:25.359889	2015-12-10 11:20:46.669507	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-10
4080	2	\N	\N	\N	\N		Despacho	2015-12-09 16:24:19.120237	2015-12-10 14:37:23.172434	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-09
4079	4	\N	\N	\N	\N		Despacho	2015-12-09 16:12:33.547604	2015-12-10 14:41:40.465534	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-09
4077	1	\N	\N	\N	\N		Despacho	2015-12-09 16:09:42.788283	2015-12-10 14:43:38.710763	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-09
4078	5	\N	\N	\N	\N		Despacho	2015-12-09 16:10:56.224709	2015-12-10 14:47:15.065843	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-09
4063	1	\N	\N	\N	\N		Despacho	2015-12-09 15:28:37.348843	2015-12-10 15:00:26.902514	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-09
4092	18	Solicita 2 Pasajes ( UNO DE IDA Y OTRO DE VUELTA) a ciudad de Cba para la sra Vanina Rita Vilchez por motivos de salud.	\N	\N	\N		Peticion	2015-12-10 15:11:34.000863	2015-12-10 15:29:51.419772	\N		Olga Ysabel Cantoro (Bloque Rio Cuarto Para Todos)				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4757	\N	aActa acuerdo aprobada por Ord nº 282/13	\N	\N	\N		Peticion	2016-04-19 16:01:23.133711	2016-04-19 16:01:23.133711	\N		DEM - Juan Ruben Jure - Ab. Ignacio Fernandez - Cdora. Maria Alicia Panza				\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4097	4	Nota facilitando informacion solicitada en el EXP: 30457 del año 2015 por el Bloque Union por Cordoba.	\N	\N	\N		Peticion	2015-12-11 13:30:49.377906	2015-12-11 13:38:38.923581	\N		Subsacretaria de Obras y Servicios Publicos . Sr Jorge Mendez.				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4098	1	Solicitan ayuda con el Sonido de un Evento Folckorico que se realizarà en el Seminario desde las 20Hs. hasta 00.00	\N	\N	\N		Peticion	2015-12-11 15:56:10.609543	2015-12-11 16:06:32.425139	\N	Secretaria del Concejo Deliberante	Seminario Mayor "Jesùs Buen Pastor"		358 - 4645783 -- 358- 154248705		\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4749	3	Solicitan ayuda de pasajes 1 de Ida y Vuelta hacia la Ciudad de Buenos Aires y 2 pasajes de Ida y Vuelta Hacia la Ciudad de Còrdoba	\N	\N	\N		Peticion	2016-04-19 13:00:47.046435	2016-04-19 14:13:00.373289	\N	Secretaria del Concejo Deliberante	Centro de Educaciòn  Sexual Integral -  Presidente Walter Torres	Rioja 151	358 - 154863555		\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4753	2	Solicita Pasajes (uno de ida y uno de vuelta) a ciudad de Bs As. para la Sra Alejandra Martini.	\N	\N	\N		Peticion	2016-04-19 14:19:49.456472	2016-04-19 14:54:08.748638	\N		Dra Alejandra Martini				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4755	7	Solicita ayuda ecònomica por razones de salud	\N	\N	\N		Peticion	2016-04-19 15:27:46.399125	2016-04-19 15:51:40.222863	\N	Secretaria del Concejo Deliberante	Garro Alberto F.	Avenida Kennedy 881	358 - 4235256		\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4756	2	Proyecto de Ordenanza por la que se autoriza al DEM a ceder en donacion a la Asociacion Atletica Estudiantes un terreno de  propiedad Municipal.	\N	\N	\N		Peticion	2016-04-19 15:59:52.568425	2016-04-21 11:51:18.674553	\N		DEM- 33725. Asociacion Atletica Estudiantes.				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4761	5	Se Modifique el Proyecto Ordenanza con fecha 7 de enero 2016, relacionados con la venta de los Inmuebles y/o derechos y acciones refereridos a los mismos	\N	\N	\N		Peticion	2016-04-19 16:15:47.309883	2016-04-20 11:00:26.112288	\N	Secretaria del Concejo Deliberante	DEM - Juan Ruben Jure - Ab. Ignacio Fernandez - Cdora. Maria Alicia Panza				\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4737	17	Solicita Eximiciòn Condonaciòn Impuesto Inmobilñiario	\N	\N	\N	expediente legislativo Nº 23392 iniciado en Sesión Ordinaria  Nº 182 de fecha  21/4/16	Condonacion	2016-04-18 13:16:14.414775	2016-04-20 12:00:14.377254	\N	\N	Gimenez Santiago	Rivadavia 66			\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4765	60	Organigrama 2016. Exp 34492. 	\N	\N	\N		Peticion	2016-04-19 16:23:29.280283	2016-04-20 16:48:21.91492	\N		EDECOM				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4103	4	Solicita ayuda Ecònomica quien tiene un hijo con problemas de salud	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 22994, Tratado en Sesión nº 169 con fecha 17/12/2015.	Peticion	2015-12-15 13:11:20.880151	2016-02-22 13:57:40.376181	\N	Secretaria del Concejo Deliberante	Montiel Bibiana	Fitz Roy 1070-Pasillo Interno	358-4295513		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4104	3	Solicita posibilidad de subsidio o pension para poder mantener a su flia ya que su situacion de salud se lo impide.	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 22995, Tratado en Sesión nº 169 con fecha 17/12/2015.	Peticion	2015-12-15 13:11:51.377195	2016-02-22 13:58:05.019854	\N		Sebastian Moyano	Estrada 58. (pasillo 4ta casa izquierda)	0358-154298439		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4105	1	Elevan Rendiciòn de Cuentas del Subsidio de Bomberos, Convenio Central de Alarma y Convenio Defensa Civil de todo el año 	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 22996, Tratado en Sesión nº 169 con fecha 17/12/2015.	Peticion	2015-12-15 13:47:17.97496	2016-02-22 13:58:30.555797	\N	Secretaria del Concejo Deliberante	Sociedad de Bomberos Voluntarios				\N	\N	\N	\N	\N	rarias@entrada.com	\N
4106	4	Solicita Ayuda Ecònomica para compra de Alimentos	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 22997, Tratado en Sesión nº 169 con fecha 17/12/2015.	Peticion	2015-12-15 13:58:51.476672	2016-02-22 13:58:53.7699	\N	Secretaria del Concejo Deliberante	Sandra Carina Maldonado Coria	Guemes 1835	358- 154012490		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4150	3	Proyecto de Ordenanza.por el cual se aprueba un cambio de regimen en los loteos Mi lugar Mi Sueño 2 y 3.	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 22999, Tratado en Sesión nº 169 con fecha 17/12/2015.	Peticion	2015-12-16 15:58:32.989368	2016-02-22 13:59:38.486937	\N		DEM (Pedruzzi, Cdora Alicia Panza, Juan Jure)				\N	\N	\N	\N	\N	rarias@entrada.com	\N
4750	3	Solicitan Auspicio y Declaraciòn de interès de las" 1ras Jornadas Riocuartenses de Sexualidades"	\N	\N	\N		Peticion	2016-04-19 13:02:16.305764	2016-04-19 13:55:48.552983	\N	Secretaria del Concejo Deliberante	Centro de Educaciòn Sexual Integral - Presidente Walter Torres	Rioja 151	358 - 154863555		\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4109	6	Solicita dos Pasajes (de ida y vuelta) a ciudad de Cba por motivos de salud.	\N	\N	\N		Peticion	2015-12-15 16:02:13.240408	2015-12-15 16:10:13.219102	\N		Cejal Maria del Carmen Cabral				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4747	3	Proyecto de Ordenanza: Crease en el ambito del Concejo Deliberante  de la Ciudad de Rio Cuarto la figura de Ombudsman Ambiental de la Ciudad de Rio Cuarto, que sera encargado de llevar adelante el control y la gestion ambiental en el ambito de la Municipalidad de Rio Cuarto.	\N	\N	\N		Peticion	2016-04-19 12:54:58.243093	2016-04-19 13:23:01.334822	\N		Cjal Viviana Yawny				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4115	1	\N	\N	\N	\N	Tambièn lo Firma la Concejal Leticia Perez	Despacho	2015-12-16 14:46:10.027755	2015-12-17 10:53:17.832444	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-16
4125	1	\N	\N	\N	\N	Tambièn Firmo la Concejal Leticia Perez 	Despacho	2015-12-16 15:03:07.01	2015-12-17 11:43:43.118226	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-16
4126	1	\N	\N	\N	\N	Tambèn Firmo la Concejal Leticia Perez	Despacho	2015-12-16 15:06:40.399674	2015-12-17 11:47:23.530642	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-09
4127	1	\N	\N	\N	\N	Tambièn firmo la Concejal Leticia Perez	Despacho	2015-12-16 15:07:55.942241	2015-12-17 12:03:37.447277	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-09
4128	1	\N	\N	\N	\N		Despacho	2015-12-16 15:09:12.805706	2015-12-17 12:13:10.321468	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-09
4134	1	\N	\N	\N	\N		Despacho	2015-12-16 15:18:56.655275	2015-12-18 15:12:11.523578	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-16
4151	4	\N	\N	\N	\N		Despacho	2015-12-16 15:59:21.409063	2015-12-21 11:54:52.843897	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-16
4152	7	\N	\N	\N	\N		Despacho	2015-12-16 16:01:22.027244	2015-12-21 12:00:59.37142	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-16
4149	5	\N	\N	\N	\N		Despacho	2015-12-16 15:57:48.163651	2015-12-21 12:20:54.648071	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-16
4147	6	\N	\N	\N	\N		Despacho	2015-12-16 15:52:31.204791	2015-12-21 12:37:35.274641	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-16
4148	5	\N	\N	\N	\N		Despacho	2015-12-16 15:54:18.900962	2015-12-21 12:42:46.647621	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-16
4101	24	Proyecto de Ordenanza por la que se Autoriza al DEM a contratar a los Sres. Josè Antonio DURIGUTTI y Juan Marìa ROSSONE para desempeñar funciones Ente Municipal De Obras Sanitarias. Asimismo se adjunta expediente administrativos Nros 31450-E-2015 y 31451-E-2015	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 22992, Tratado en Sesión nº 169 con fecha 17/12/2015.	Peticion	2015-12-14 15:22:59.956412	2016-02-22 13:56:53.981249	\N	Secretaria del Concejo Deliberante	DEM . Juan Ruben Jure - Ab. Ignacio R. Fernandez				\N	\N	\N	\N	\N	rarias@entrada.com	\N
4112	2	Proyecto de Ordenanza solicitando eximicion y condonacion de  impuesto sobre el inmueble a ciudadano de ntra ciudad.	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23005, Tratado en Sesión nº 169 con fecha 17/12/2015.\r\n	Peticion	2015-12-16 14:40:16.611424	2016-02-22 14:02:04.299615	\N		Cjal Humberto Benedetto, Pomiglio, Cantoro, Barotti y Leticia Perez				\N	\N	\N	\N	\N	rarias@entrada.com	\N
4116	1	Proyecto de Resoluciòn. sE DISPONE EL OTORGAMIENTO DE LA SOLICITUD DE EXIMICION CONDONACION INMOBILIARIO.	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23006, Tratado en Sesión nº 169 con fecha 17/12/2015.\r\n	Peticion	2015-12-16 14:48:21.27102	2016-02-22 14:02:23.484056	\N		Cjales Cantoro, Benedetto, Pomiglio, Barotti, Leticia Perez				\N	\N	\N	\N	\N	rarias@entrada.com	\N
4748	3	Proyecto de Ordenanza:Se encomienda al DEM que a traves de la Subsecretaria de Derechos Humanos, elabore un "Manual del lenguaje Administrativo no Sexista"	\N	\N	\N		Peticion	2016-04-19 12:58:25.842262	2016-04-19 13:29:10.535516	\N		Cjal Viviana Yawny				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4762	47	Presenta Proyecto de Organigrama de la Secretaria de Desarrollo Urbano Obras y Servicios Publico. Exp 33823	\N	\N	\N		Peticion	2016-04-19 16:20:21.929339	2016-04-20 16:34:54.08235	\N		Secretaria de Desarrollo Urbano, Obras y Servicios Publicos. 				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4752	1	Nota solicitando la suspension del requisito del ITV (Inspeccion Tecnica Vehicular) para los vehiculos que prestan el servicio de taxi en la ciudad de Rio Cuarto.	\N	\N	\N		Peticion	2016-04-19 13:42:47.781118	2016-04-19 13:55:03.602361	\N		Andrade Juan. Pte de Asociacion Taxistas Unidos de Rio Cuarto	Bvard Ameghino 1330	Miguel Angel Angelicola ( Vice Pte Asoc. Taxistas Unidos) 0358-154843894		\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4759	6	Convenio UTHGRA. Exp 34203. Anexo 11 folios.	\N	\N	\N		Peticion	2016-04-19 16:08:57.100626	2016-04-20 16:44:15.773235	\N		DEM				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4760	4	Reclaman restituyan al DEM Proyecto de Ordenanza que dio origen a las actuaciones del  Exp Legislativo  nº 23111 que obra en la Comisiòn de Servicios Pùblicos y Transporte  	\N	\N	\N		Peticion	2016-04-19 16:12:10.714054	2016-04-20 11:10:57.488313	\N	Secretaria del Concejo Deliberante	DEM - Juan Ruben Jure - Ab. Ignacio Fernandez - Cdora. Maria Alicia Panza				\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4731	21	Eximiciòn Condonaciòn Impuesto Inmobiliario	\N	\N	\N	expediente legislativo Nº 23387 iniciado en Sesión Ordinaria  Nº 182 de fecha  21/4/16	Condonacion	2016-04-15 13:10:13.614471	2016-04-20 11:58:56.378585	\N	\N	Gomez Sergio Alejandro	Antonio Saenz 2996	358 - 154830366 - 4700168		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4763	3	Creacion Area Boletin Oficial. Anexo 34489.	\N	\N	\N		Peticion	2016-04-19 16:20:44.411136	2016-04-20 16:51:01.214733	\N		DEM				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4108	\N	Solicitan el cambio de dos vidrios correspondientes al escritorio del Consejal Osvaldo Da Costa y el otro a la oficina de la presidencia de Bloque.	\N	\N	\N		Peticion	2015-12-15 15:40:23.07628	2015-12-15 15:48:53.299077	\N		Cjal Guillermo Natali				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4741	17	Solicita  Eximiciòn Condonaciòn Impuesto Inmibiliario	\N	\N	\N	expediente legislativo Nº 23397 iniciado en Sesión Ordinaria  Nº 182 de fecha  21/4/16	Condonacion	2016-04-18 14:15:16.014806	2016-04-20 12:01:22.257778	\N	\N	Torres Juan Guillermo	Humberto Mgnaini 1142	358 - 154174173 - 154238255		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4111	\N	Solicita 2 pasajes de Ida y 2 de Regreso hacia la ciudad de Còrdoba por razones de salud	\N	\N	\N		Peticion	2015-12-16 14:17:10.674997	2015-12-16 14:21:14.561213	\N	Contaduria Concejo Deliberante	Matìa Cecilia Giacardi 				\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4156	23	Proyect de Ordenanza. Otorguese a la Sra Parra Romero Ana Soledad un aporte economico de dos mil pesos.	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23000, Tratado en Sesión nº 169 con fecha 17/12/2015.	Peticion	2015-12-16 16:08:54.920428	2016-02-22 14:00:07.992533	\N		Cjal  Olga Cantoro		0358-154819490 /155600340		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4113	5	Proyecto de Ordenanza: Condonese el cien por ciento, de la contribucion que incide sobre el inmueble, el impuesto por financiamiento de la obra publica y el F.O.D.I.S, hasta el 31 de diciembre de 2012 2012 a la sra Claudia Noemi Menel.	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23004, Tratado en Sesión nº 169 con fecha 17/12/2015.\r\n	Peticion	2015-12-16 14:42:31.077905	2016-02-22 14:01:44.493966	\N		Cjales Olga Cantoro,  Humberto Benedetto, Viviana Pomiglio, Jose Barotti, Leticia Perez				\N	\N	\N	\N	\N	rarias@entrada.com	\N
4136	2	Proyecto de Ordenanza por la que se modifica la ordenanza Nº 530/09- RIO CUARTO CIUDAD NO EUTANASICA	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23002, Tratado en Sesión nº 169 con fecha 17/12/2015.\r\n	Peticion	2015-12-16 15:22:49.84283	2016-02-22 14:01:01.942168	\N		DEM ( Jorge Mendez, Ruben Jure,  Cdora Alicia Panza)				\N	\N	\N	\N	\N	rarias@entrada.com	\N
4114	1	\N	\N	\N	\N	Tambièn lo Firma la Concejal Leticia Perez	Despacho	2015-12-16 14:42:43.343336	2015-12-17 10:48:51.332904	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-16
4162	97	Pedido de Incremento de Tarifas sobre el Transporte Urbano	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23010, tratado en la Sesión Nº 170, con fecha 22/12/2015.	Peticion	2015-12-21 11:16:09.938159	2016-02-22 14:18:45.185564	\N	Secretaria del Concejo Deliberante	Sociedad Anònima Transporte Ciudad de Rìo  Cuarto	Indio Felipe Rosas 184	358-4626452 - 4626452 - 4630104 /112		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4132	1	Nota en la que Solicita bolson navideño para 50 niños en el Brrio Alberdi, casa solidaria en la que se realizara un festejo de navidad con los niños mas carenciados.	\N	\N	\N		Peticion	2015-12-16 15:16:01.620251	2015-12-16 15:21:25.385155	\N		Noelia Marquez	Guemes 1811	0358-154011831		\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4118	2	\N	\N	\N	\N	Tambièn lo Firma la Concejal Leticia Perez	Despacho	2015-12-16 14:50:15.557099	2015-12-17 10:58:21.92807	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-15
4119	1	\N	\N	\N	\N		Despacho	2015-12-16 14:51:32.755257	2015-12-17 11:02:20.358146	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-16
4120	1	\N	\N	\N	\N		Despacho	2015-12-16 14:52:54.570727	2015-12-17 11:05:52.382144	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-10-21
4157	1	Solicita Colaboraciòn para realizar Festejo Navideño en estas Fiestas	\N	\N	\N		Peticion	2015-12-16 16:42:25.089677	2015-12-16 16:42:25.089677	\N	Secretaria del Concejo Deliberante	Arnaldo Centeno	Rafael Obligado 1869			\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4117	5	Proyecto de Ordenanza: Otorgar al sr Ojeda Miguel Angel un subsidio de dos mil pesos para cubrir gastos de reparacion del techo de su vivienda.	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23003, Tratado en Sesión nº 169 con fecha 17/12/2015.\r\n	Peticion	2015-12-16 14:49:18.124715	2016-02-22 14:01:25.715299	\N		Cjal Jose Barotti		0358-154391822		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4121	1	\N	\N	\N	\N		Despacho	2015-12-16 14:54:18.336945	2015-12-17 11:19:04.820165	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-16
4122	1	\N	\N	\N	\N		Despacho	2015-12-16 14:55:51.673434	2015-12-17 11:28:19.967763	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-15
4123	1	\N	\N	\N	\N		Despacho	2015-12-16 14:57:23.89826	2015-12-17 11:34:02.700963	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-15
4124	1	\N	\N	\N	\N		Despacho	2015-12-16 14:59:30.619305	2015-12-17 11:39:28.562236	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-15
4129	1	\N	\N	\N	\N		Despacho	2015-12-16 15:11:07.443762	2015-12-17 12:16:50.283852	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-09
4130	2	\N	\N	\N	\N		Despacho	2015-12-16 15:13:35.353296	2015-12-17 12:32:13.366897	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-15
4131	1	\N	\N	\N	\N		Despacho	2015-12-16 15:15:43.483562	2015-12-17 12:36:21.214924	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-16
4133	1	\N	\N	\N	\N		Despacho	2015-12-16 15:17:20.036947	2015-12-17 12:43:14.02951	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-16
4160	\N	Decretos: 3221/15; 3222/15; 3223/15, 3224/15;3225/15; 3226/15; 3227/15; 3230/15; 3231/15; 3243/15; 3244/15; 3245/15;3246/15; 3247/15. Ordenanzas: 1239/15; 1241/15; 1242/15;1243/15; 1244/15; 1245/15; 1246/15; 1247/15;1248/15; 1249/15; 1251/15;1252/15; 1255/15; 1257/15; 1258/15; 1259/15; 1260/15;3191/15; 3219/15; 3220/15;	\N	\N	\N	DECRETOS QUE FALTAN· 3191/15,  3222/15, 3220/10.	Peticion	2015-12-18 14:42:19.591838	2015-12-18 15:06:58.478333	\N		DEM				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4159	2	Proyecto de Ordenanza: Abonese  por unica vez una compensacion economica a los agentes municipales del EDECOM , que efectivamente se encuentren prestando sus servicios los dias 25 de diciembre de 2015 y 1 de enero de 2016 , dentro del horario comprendido entre las 00.00 hs. a las 05.00 yhs., consistente en la suma de pesos novecientos por cada dia que cumplan las tareas.	\N	\N	\N		Peticion	2015-12-18 14:29:56.178022	2015-12-18 15:31:37.07908	\N		DEM				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4135	1	\N	\N	\N	\N		Despacho	2015-12-16 15:20:59.963157	2015-12-18 15:51:55.727364	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-15
4137	2	\N	\N	\N	\N		Despacho	2015-12-16 15:24:51.702049	2015-12-21 10:39:10.258013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-15
4139	5	\N	\N	\N	\N		Despacho	2015-12-16 15:30:37.659714	2015-12-21 10:45:42.620387	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-16
4140	2	\N	\N	\N	\N		Despacho	2015-12-16 15:33:11.230184	2015-12-21 10:48:32.266637	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-15
4141	5	\N	\N	\N	\N		Despacho	2015-12-16 15:39:03.012063	2015-12-21 10:53:24.941707	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-16
4142	1	\N	\N	\N	\N		Despacho	2015-12-16 15:41:37.675712	2015-12-21 10:57:02.241518	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-15
4143	5	\N	\N	\N	\N		Despacho	2015-12-16 15:44:09.840984	2015-12-21 11:01:52.226005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-16
4144	5	\N	\N	\N	\N		Despacho	2015-12-16 15:46:28.151446	2015-12-21 11:34:18.804725	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-16
4153	2	\N	\N	\N	\N		Despacho	2015-12-16 16:03:00.486925	2015-12-21 12:04:11.800767	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-15
4154	5	\N	\N	\N	\N		Despacho	2015-12-16 16:04:43.592069	2015-12-21 12:10:01.39574	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-16
4155	5	\N	\N	\N	\N		Despacho	2015-12-16 16:08:07.68787	2015-12-21 12:15:25.151776	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-16
4145	1	\N	\N	\N	\N		Despacho	2015-12-16 15:48:38.283723	2015-12-21 12:25:38.411998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-16
4146	3	\N	\N	\N	\N		Despacho	2015-12-16 15:50:19.508414	2015-12-21 12:33:07.115297	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-16
4163	1	Nota de Ctro Comunitario Un Nuevo Amanecer ( Fanny Perez) solicita la compra de 40 mts de friselina blanca y 40 mts de friselina roja para decorar la carroza de papa Noel para el dia 23 de diciembre	\N	\N	\N		Peticion	2015-12-21 12:39:29.921181	2015-12-21 12:39:29.921181	\N		Cejal Martin Carranza (Bloque Rio Cuarto para todos)	Carlos Rodriguez 2030	0358-154265706		\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4158	1	\N	\N	\N	\N		Despacho	2015-12-16 16:55:19.215438	2015-12-21 12:50:41.242142	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-09
4161	\N	30 Boletines  Oficiales 352 -  30 Boletines 353	\N	\N	\N		Peticion	2015-12-18 16:03:27.471931	2015-12-21 13:25:56.095311	\N	Archivo del Concejo					\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4176	\N	Remite informe del Ing. Civil Masuricio Biglione , en el cual se detalla la situacion estado-temporal de un bache ubicadoo en Trejo y Sanabria. Solicita que por su intermedio se le comunique a todo el plenario en especial al cejal Mauricio Dova.	\N	\N	\N		Peticion	2015-12-21 14:36:28.250172	2015-12-21 14:47:53.323706	\N		Jorge Mendez (Secretaria de Desarrollo Urbano, Obras y Servicios Publicos)				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4164	3	Solicita 2 Pasajes de ida y 2 de regreso a la ciudad de Cba por r5azones de salud para el Sr Carlos Alberto Fredes.	\N	\N	\N		Peticion	2015-12-21 12:46:19.234807	2015-12-21 15:24:11.273468	\N		Fredes Carlos Alberto				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4194	2	Proyecto de Ordenanza: Modificaciòn del artìculo 48º de  la Ordenanza Nº 783/01- Serviciode Transporte Pùblico y Radio Semipublico de autos de alquiler con chofer de la Ciudad de Rìo Cuarto  	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23021, tratado en la Sesión Nº 170, con fecha 22/12/2015.	Peticion	2015-12-21 16:52:02.206112	2016-02-22 14:28:34.604778	\N	Secretaria del Concejo Deliberante	Concejal Humberto Benedetto				\N	\N	\N	\N	\N	rarias@entrada.com	\N
4746	15	Solicita Eximiciòn Condonaciòn Impuesto Inmobiliario	\N	\N	\N	expediente legislativo Nº 23401 iniciado en Sesión Ordinaria  Nº 182 de fecha  21/4/16	Condonacion	2016-04-19 12:43:18.18048	2016-04-20 12:02:00.438769	\N	\N	Felipetti Gustavo Ariel 	Mariano Lopez Cobos 1035	358 - 156542259		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4726	10	Proyecto de Ordenanza: Por el que se aprueba el conveniotransaccional firmado con la Asociaciòn Vecinal Barrio Jardin,la Asociaciòn Pueblo Nuevo y la Asociaciòn Vecinal Las Delicias y la Asociaciòn Vecinal Barrio Paraiso	\N	\N	\N	expediente legislativo Nº 23382 iniciado en Sesión Ordinaria  Nº 182 de fecha  21/4/16	Peticion	2016-04-14 15:47:43.568179	2016-04-20 12:04:03.007729	\N	Secretaria del Concejo Deliberante	DEM - Juan Ruben Jure - Ab. Ignacio Fernandez - Cdora. Maria Alicia Panza				\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4732	6	Solicita ayuda economica urgente por razones de salud.	\N	\N	\N	expediente legislativo Nº 23388 iniciado en Sesión Ordinaria  Nº 182 de fecha  21/4/16	Peticion	2016-04-15 14:39:15.857448	2016-04-20 12:06:27.614718	\N	Secretaria del Concejo Deliberante	Miriam Veronica Smith	Dilkendein 3559	0359-8-15438791		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4733	40	Proyecto de Resoluciòn Declarando al Sr. Rubèn Pedraza Personalidad Destacadade Nuestra Ciudad	\N	\N	\N	\r\nexpediente legislativo Nº 23389 iniciado en Sesión Ordinaria Nº 182 de fecha 21/4/16	Peticion	2016-04-15 15:17:07.679171	2016-04-20 12:08:08.638348	\N	Secretaria del Concejo Deliberante	Concejales - Viviana Andrea  Yawny,  Maria del Carmen Cabral.- - Viviana Pomiglio - Carlos Josè Gaso - Martin Carranza				\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4195	4	\N	\N	\N	\N		Despacho	2015-12-21 16:53:29.508206	2015-12-22 11:14:28.361478	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-21
4196	1	\N	\N	\N	\N		Despacho	2015-12-21 16:55:17.204209	2015-12-22 11:17:44.150879	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-20
4192	1	\N	\N	\N	\N		Despacho	2015-12-21 16:15:00.187041	2015-12-22 11:19:49.290526	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-20
4193	3	\N	\N	\N	\N		Despacho	2015-12-21 16:16:20.773144	2015-12-22 11:32:58.97925	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-21
4191	1	\N	\N	\N	\N		Despacho	2015-12-21 16:13:18.94336	2015-12-22 11:42:22.63128	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-20
4175	5	\N	\N	\N	\N		Despacho	2015-12-21 14:33:15.694306	2015-12-22 12:11:48.19481	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-21
4174	7	\N	\N	\N	\N		Despacho	2015-12-21 14:32:10.858659	2015-12-22 12:20:03.220472	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-21
4172	5	\N	\N	\N	\N		Despacho	2015-12-21 14:29:17.327496	2015-12-22 14:02:21.413217	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-21
4171	1	\N	\N	\N	\N		Despacho	2015-12-21 14:09:43.729865	2015-12-22 14:06:51.52156	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-21
4766	66	Remiten Proyecto de Ordenanza: :Por el que se modifican las Ordenanzas Nros 336/13 - Organigrama del Personalde la Administracciòn Pùblica Municipal - y 163/12 - Organigrama del EDECOM	\N	\N	\N		Peticion	2016-04-19 16:26:47.688503	2016-04-20 12:52:32.981659	\N	Secretaria del Concejo Deliberante	DEM  - Juan Ruben Jure - Ab. Ignacio R. Fernandez - Cdora. Maria Alicia Panza   				\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4199	4	Solicita Pasaje (uno) de colectivo ida y vuelta a la ciudad de Cordoba, para la sra Frasson Beatriz Maria quien debe viajar por motivos d salud.	\N	\N	\N		Peticion	2015-12-22 15:28:58.772308	2015-12-22 15:50:29.64231	\N	Contaduria Concejo Deliberante	Cjal Humberto Benedetto				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4200	1	OFICIO. En los autos caratulados: PRUEBA DEL ACTOR EN AUTOS " LUCERO Julio Cesar c/Ybañez Aida Del Valle. Orddinario- Cuerpo de prueba del actor.	\N	\N	\N		Peticion	2015-12-22 15:29:31.386328	2015-12-22 15:59:38.360948	\N		PODER JUDICIAL		0358- 154015596 (Dr Juan Luis Gallafent)		\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4767	3	Proyecto de Ordenanza: Solicita Condonacion - Eximiciòn Imouesto Emos - Inmobiliario	\N	\N	\N		Peticion	2016-04-20 13:07:38.480602	2016-04-20 13:07:38.480602	\N		Presidente Concejo Deliberante    CLAUDIO MIRANDA				\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4201	4	Nota solicitando poder llevar a cabo una sesion del Concejo Deliberante de la ciudad de Rio Cuarto en la UNCRC o bien en la casa PEAM (Bv. Almafuerte 300), estableciendo su fecha dentro del cronograma de sesiones.	\N	\N	\N		Peticion	2015-12-23 13:39:32.601629	2015-12-23 13:51:56.726066	\N		Cjal Martin Carranza				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4180	2	Proyecto de Ordenanza por la que se abona a la odontologa Paola Vanina Falappa por los servicios que desempeña  como supervisora Odontologica en Cto de Salud efectivamente prestados y no cobrados. Surge este proyecto en virtud de un error administrativo que ha generado demoras en la remision del tramite.	\N	\N	\N	Anexo N! 32233. folios 28\r\n-Nota convertida en Expediente Legislativo Nº 23012, tratado en la Sesión Nº 170, con fecha 22/12/2015.	Peticion	2015-12-21 14:50:48.018243	2016-02-22 14:19:55.901338	\N		DEM ( Ignacio R. Fernandez,  Juan Jure)				\N	\N	\N	\N	\N	rarias@entrada.com	\N
4181	2	Proyecto de Ordenanza por la que se renueva la locacion de servicios de la Dra Paola Vanina Falappa.	\N	\N	\N	Expediente Nª 32231-S-2015\r\n-Nota convertida en Expediente Legislativo Nº 23016, tratado en la Sesión Nº 170, con fecha 22/12/2015.	Peticion	2015-12-21 14:52:59.807379	2016-02-22 14:25:02.191778	\N		DEM - Juan Ruben Jure - Ab. Ignacio Fernandez -  				\N	\N	\N	\N	\N	rarias@entrada.com	\N
4836	2	Nota solicitando por su intermedio eximicion del pago contribucion por recoleccion de residuos patogenos por motivos detallados en la nota.	\N	\N	\N	Expediente Legislativo Nº 23446- iniciado en Sesión Ordinaria Nº 183 de fecha 5/5/16	Peticion	2016-04-29 13:19:14.844804	2016-05-04 13:47:00.437262	\N		Marina Galuppo (Pte CO.C.A.E.N)	Buenos Aires 272	0358- 4630450		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4779	13	Solicito pasajes dos (ida y vuelta) a ciudad de Cba para la sra Lucrecia Arias por motivos de salud de su hijo.	\N	\N	\N		Peticion	2016-04-20 15:53:00.678771	2016-04-20 16:01:21.533672	\N		Cjal Maria Del Carmen Cabral 				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4769	6	Solicita dos pasajes de ida y vuelta (dos) a ciudad de Cordoba  para la sra Alicia Haidee Minhondo por tema de salud.	\N	\N	\N		Peticion	2016-04-20 13:22:46.897092	2016-04-20 14:44:24.782544	\N		Cjal Jose Barotti				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4771	1	\N	\N	\N	\N		Despacho	2016-04-20 14:23:23.894685	2016-04-21 14:01:34.176774	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-04-20
4770	1	Nota solicitando un movil de castracion que pueda llegar a los barrios donde los vecinos no pueden concurrir por distintos motivos al ctro de Castracion Municipal ubicado en el centro de la ciudad	\N	\N	\N	expediente legislativo Nº 23415- iniciado en Sesión Ordinaria Nº 182 de fecha 21/4/16-comisión Salud. 	Peticion	2016-04-20 14:06:52.864277	2016-05-04 13:23:56.443119	\N		Mariela Villegas (Docente). Cecilia Villegas.	Mariquita Sanchez de Thompson 1425	0358-154817033		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4754	\N	Solicita Eximiciòn - Condonaciòn Impuesto Inmobiliario	\N	\N	\N	expediente legislativo Nº 23407 iniciado en Sesión Ordinaria  Nº 182 de fecha  21/4/16	Condonacion	2016-04-19 14:38:39.271475	2016-04-20 12:02:48.100451	\N	\N	Bringas Juan Carlos	Soco Soco 1247	358 - 154326806- 156006318		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4184	37	Remite por su intermedio a los Ptes de todos los Bloques los dictamenes en Disidencia Nª 210/15 AL 226/15.	\N	\N	\N	Dictamenes en Disidencia\r\n-Nota convertida en Expediente Legislativo Nº 23013, tratado en la Sesión Nº 170, con fecha 22/12/2015.	Peticion	2015-12-21 15:13:10.514547	2016-02-22 14:20:37.817227	\N		Tribunal de Cuentas				\N	\N	\N	\N	\N	rarias@entrada.com	\N
4190	1	Nota solicitando se lleve a cabo durante el mes de abril del 2016 en Venezuel al 950  la Sesion Ordinaria que el Consejo Deliberante realiza en diferentes Instituciones dentro del programa "Vinculacion Legislativa"	\N	\N	\N		Peticion	2015-12-21 16:00:45.500729	2015-12-21 16:08:13.294901	\N		Beatriz Sydor. Directora Ipem Nª28	Venezuela 950	0358- 4676805		\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4188	7	Eximiase el cien por ciento de la Contribucion que incide sobre el Inmueble, el impuesto por financiamiento  de la Obra Publica  y el F.O.D.I.S. hasta el 31 de diciembre de 2015, a la sra Olga Marta Santini.	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23014, tratado en la Sesión Nº 170, con fecha 22/12/2015.	Peticion	2015-12-21 15:52:47.232033	2016-02-22 14:22:37.991211	\N		Cjales Olga Cantoro,  Humberto Benedetto,, Jose Barotti, Leticia Perez, Francisco Varella				\N	\N	\N	\N	\N	rarias@entrada.com	\N
4178	\N	Plan Urbano	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23015, tratado en la Sesión Nº 170, con fecha 22/12/2015.	Peticion	2015-12-21 14:47:23.061553	2016-02-22 14:23:00.714646	\N		DEM - Juan Ruben Jure - Ing Ricardo Racagni -  				\N	\N	\N	\N	\N	rarias@entrada.com	\N
4183	\N	Proyecto de Ordenanza por la que se sustituye el articulo 4º del Anexo I de la Ordenanza  Nº 530/14\r\nSe adjunta Exp. Ad Nº 32169-S-2015 	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23020, tratado en la Sesión Nº 170, con fecha 22/12/2015.	Peticion	2015-12-21 14:59:08.381036	2016-02-22 14:27:50.527161	\N	Secretaria del Concejo Deliberante	DEM - Juan Ruben Jure - Jorge Alejandro Mendez 				\N	\N	\N	\N	\N	rarias@entrada.com	\N
4202	5	Proyecto de Ordenanza. Otorgase a la sra Erreguerena Lorena la suma de dos mil pesos ($2.000) los que seran destinados a gastos de salud.	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23022, tratado en la Sesión Nº 171, con fecha 29/12/2015.	Peticion	2015-12-23 13:55:25.213992	2016-02-22 14:29:55.672621	\N		Cjal Viviana Pomiglio				\N	\N	\N	\N	\N	rarias@entrada.com	\N
4187	\N	Proyecto de Ordenanza: Otorgando a la Vecinal Gral Paz Condonaciòn sobre EMOS	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23018, tratado en la Sesión Nº 170, con fecha 22/12/2015.	Peticion	2015-12-21 15:50:51.73283	2016-02-22 14:27:06.104044	\N	Secretaria del Concejo Deliberante	Concejales Benedetto - Cantoro Olga Isabel - Francisco Varela				\N	\N	\N	\N	\N	rarias@entrada.com	\N
4220	3	\N	\N	\N	\N		Despacho	2015-12-28 16:33:07.979788	2016-04-01 13:49:56.036519	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	2015-12-28
4189	1	\N	\N	\N	\N		Despacho	2015-12-21 15:55:12.242422	2015-12-22 11:45:10.556334	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-21
4186	1	\N	\N	\N	\N		Despacho	2015-12-21 15:35:50.928777	2015-12-22 11:48:11.867509	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-21
4185	1	\N	\N	\N	\N		Despacho	2015-12-21 15:34:07.300327	2015-12-22 11:53:56.635691	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-21
4197	30	Boletines Oficiales	\N	\N	\N		Peticion	2015-12-22 12:07:18.535533	2015-12-22 12:07:18.535533	\N						\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4169	1	\N	\N	\N	\N		Despacho	2015-12-21 14:07:16.528114	2015-12-22 14:12:50.555736	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-21
4168	1	\N	\N	\N	\N		Despacho	2015-12-21 14:05:13.486732	2015-12-22 14:21:18.383666	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-21
4165	1	\N	\N	\N	\N		Despacho	2015-12-21 14:00:57.727307	2015-12-22 14:42:34.530284	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-21
4198	\N	Pasaje de Ida y Otro de Regreso a la Ciudad de Còrdoba para tratamiento de su beba quien tiene problemas de Salud	\N	\N	\N		Peticion	2015-12-22 14:47:50.329286	2015-12-22 15:04:26.526022	\N	Contaduria Concejo Deliberante	Sra. Celia Melina Chàves		358- 154209122		\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4206	1	\N	\N	\N	\N		Despacho	2015-12-28 14:50:21.979758	2015-12-28 15:14:46.643619	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-28
4203	1	Presenta Renuncia a su Cargo de Concejal por el Bloque Legislativo Encuentro Ciudadano	\N	\N	\N		Peticion	2015-12-23 15:32:04.451213	2015-12-23 15:40:55.402792	\N	Secretaria del Concejo Deliberante	Concejal Eduardo J. Scoppa				\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4204	1	\N	\N	\N	\N		Despacho	2015-12-28 13:58:07.153722	2015-12-28 13:58:07.153722	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-20
4207	1	\N	\N	\N	\N		Despacho	2015-12-28 15:15:54.752299	2015-12-28 15:15:54.752299	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-21
4210	1	\N	\N	\N	\N		Despacho	2015-12-28 15:20:39.63373	2015-12-28 15:35:18.874179	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-28
4209	1	\N	\N	\N	\N		Despacho	2015-12-28 15:19:29.059651	2015-12-28 15:38:13.516865	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-28
4208	1	\N	\N	\N	\N		Despacho	2015-12-28 15:17:48.21438	2015-12-28 15:42:29.477864	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-28
4211	7	Solicita un  pasaje de ida (Rio Cuarto- Bs As) y otro de vuelta (Bs As- Rio Cto) con fecha de salida 2 de enero de 2016 y fecha abierta de regreso, a nombre de Maria Estela Cresta quien debera presentarse en el Htal Garraham por problemas de salud de su hijo.	\N	\N	\N		Peticion	2015-12-28 15:29:56.234344	2015-12-28 16:11:29.742515	\N		Cjal Martin Carranza		0358-155090608		\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4212	1	\N	\N	\N	\N		Despacho	2015-12-28 15:47:20.568482	2015-12-29 11:04:47.87264	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-28
4213	1	\N	\N	\N	\N		Despacho	2015-12-28 15:50:05.972977	2015-12-29 11:27:51.352061	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-28
4214	1	\N	\N	\N	\N		Despacho	2015-12-28 15:51:35.786696	2015-12-29 11:32:17.590051	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-28
4215	1	\N	\N	\N	\N		Despacho	2015-12-28 15:53:13.3936	2015-12-29 11:42:46.098711	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-28
4216	1	\N	\N	\N	\N		Despacho	2015-12-28 15:55:17.136418	2015-12-29 11:51:05.303515	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-28
4222	4	\N	\N	\N	\N		Despacho	2015-12-28 16:36:37.557807	2015-12-29 12:07:16.712477	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-28
4221	4	\N	\N	\N	\N		Despacho	2015-12-28 16:34:56.911688	2015-12-29 12:19:55.438543	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-28
4219	5	\N	\N	\N	\N		Despacho	2015-12-28 16:31:19.177137	2015-12-29 12:37:10.784967	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-28
4217	2	\N	\N	\N	\N		Despacho	2015-12-28 16:27:46.034759	2015-12-29 12:42:29.885751	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-28
4218	1	\N	\N	\N	\N		Despacho	2015-12-28 16:29:08.20348	2015-12-29 13:02:06.947868	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2015-12-28
4223	4	Solicita dos pasajes (ida y vuelta) con destino a la ciudad de Cordoba para el sr Alejandro Ruben Ortiz y su sra hermana Adriana Josefa Ortiz por motivos de salud.	\N	\N	\N		Peticion	2015-12-29 13:02:02.605239	2015-12-29 13:11:50.776721	\N		Cjal Eduardo Scopa				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4224	1	Informa que entre los dìas desde el 4 y 15 de Enero de 2016 se encontrarà en la Localidad de Alpa Corral 	\N	\N	\N		Peticion	2015-12-29 13:09:21.398534	2015-12-29 13:12:04.082815	\N		Concejal Leticia Perez				\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4182	2	Proyecto de Ordenanza:en el que se prorroga la locacion de servicio de la Dra Claudia Valeria Gaitan por su servicio prestado en el programa "Rio Cuarto,Boca Sana, sonrisa para siempre"	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23017, tratado en la Sesión Nº 170, con fecha 22/12/2015.	Peticion	2015-12-21 14:55:47.861543	2016-02-22 14:25:41.256273	\N		DEM - Juan Ruben Jure - Ab. Ignacio Fernandez -  				\N	\N	\N	\N	\N	rarias@entrada.com	\N
4225	2	Solicita pasaje ida y vuelta a ciudad de Cba, con fecha abierta.	\N	\N	\N		Peticion	2015-12-29 14:36:16.463787	2015-12-29 14:41:53.947582	\N		Laura Alicia Herrera		0358-154019267		\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4250	10	Solicita Eximiciòn Impuesto Inmobiliario Año 2016	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23040, tratado en la Sesión Nº 174, con fecha  / /2016	Condonacion	2016-02-02 11:27:05.666131	2016-02-22 14:41:02.063635	\N	\N	Calderon Jorge Alberto	Jujuy 1419	358 - 154163038		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4251	9	Solicita Eximiciòn Impuesto Inmobiliario Año 2016	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23041, tratado en la Sesión Nº 174, con fecha  / /2016	Condonacion	2016-02-02 11:53:49.787758	2016-02-22 14:42:17.699254	\N	\N	Menardi Elda Anita	Isabel de Guevara 378	4626341		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4228	\N	Pasaje de Colectivo hacia la Ciudad de Còrdoba para la Sra Rosana Beatriz Gambero por razones de Salud, 1 Pasaje de Ida y otro de Regreso 	\N	\N	\N		Peticion	2016-01-11 13:02:41.364891	2016-01-11 13:08:38.425802	\N	Contaduria Concejo Deliberante	Concejal Humberto Benedetto				\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4229	11	Remite acta de la reunion realizada en fecha 14 de diciembre de 2015 con temas que nesesitan la intervencion de su Fiscalia.	\N	\N	\N		Peticion	2016-01-11 15:07:55.078185	2016-01-11 15:23:40.464729	\N		Consejo de Control Y Preservacion de Rio Cuarto  CO. PRESE.R.C.				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4236	\N	Proyecto de Ordenanza: Declarese la Emergencia Vial Urbana, en todo el ejido de la municipalidad de Rio Cuarto, por el termino de noventa (90) dias a partir de la aprobacion de la presente, a los fines de que se implemente un urgente y exaustivo plan de tareas para el arreglo, mantenimiento y mejoramiento de las calles de tierra de ntra ciudad.	\N	\N	\N		Peticion	2016-01-15 14:00:52.010421	2016-01-15 14:14:29.97539	\N		Cjales Pauluzzi, Bergessio, Dova				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4238	\N	Solicita dos pasajes de ida y vuelta a la ciudad de Cba para el sr Fredes Carlos Alberto por motivos de salud para el dia 26 de enero del cte año.	\N	\N	\N	ANULADO	Peticion	2016-01-22 12:21:20.158208	2016-01-22 13:26:28.396962	\N		Cjal Humberto Benedetto				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4240	\N	SOLICITA DOS PASAJES DE IDA A CIUDAD DE CBA Y DOS PASAJES DE REGRESO A RIO CUARTO, POR MOTIVOS DE SALUD.	\N	\N	\N		Peticion	2016-01-26 15:32:12.262207	2016-01-26 15:39:03.178917	\N		Cecilia Edith Sosa-Carlos Gustavo Garcia		0358-154330534		\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4253	11	Solicita Eximiciòn - Condonaciòn Cementerio del siguiente nicho. 1-15 - B - 00338- 1-	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23042, tratado en la Sesión Nº 174, con fecha  / /2016	Condonacion	2016-02-02 14:00:03.648055	2016-02-22 14:42:34.941337	\N	\N	Toledo Silvestra Noemi	Trejo y Sanabria 1029	358- 154360720		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4768	6	Resoluciòn: Declarar Organizaciòn destacada de la Cultura al Grupo "Juntos"	\N	\N	\N		Peticion	2016-04-20 13:15:41.161554	2016-04-20 13:15:41.161554	\N	Secretaria del Concejo Deliberante	Presidente Concejo Deliberante    CLAUDIO MIRANDA				\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4254	18	Solicita  Eximiciòn - Condonaciòn  Impuesto Inmobiliario	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23043, tratado en la Sesión Nº 174, con fecha  / /2016	Condonacion	2016-02-02 15:07:33.9677	2016-02-22 14:42:54.082257	\N	\N	Silvia Vilma Rodriguez	Ordoñez 705	358 - 154383327		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4843	1	Remite informe de ejecución presupuestaria del primer trimestre del año 2016\r\nAnexo.	\N	\N	\N	Expediente Legislativo Nº 23452- iniciado en Sesión Ordinaria Nº 183 de fecha 5/5/16	Peticion	2016-05-02 15:45:56.844876	2016-05-04 13:49:30.532494	\N		Cra Maria Alicia Panza.(Secretaria de Economia)				\N	\N	\N	\N	\N	rarias@entrada.com	\N
4226	10	Nota para dejar constancia de la situacion que ocurre en el Brrio Alberdi, ya que el terreno ubicado en las calles de referencias perteneciente a la Empresa Shell S. A. ya que el mismo ha sido usurpado hace doce años, tornandose la situacion muy complicada para las personas que viven en el Sector. Solicitan su intervencion como Organo Publico y Representativo de todos los ciudadanos .	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23026, tratado en la Sesión Nº 174, con fecha  / /2016	Peticion	2015-12-30 13:46:30.255857	2016-02-22 14:31:51.921965	\N		Vecinos de Barrio Alberdi Norte. (Referencia Gomez Natalia)	Islas Malvinas 	0358-154228556		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4242	7	Pedido de ayuda economica para poder afrontar distintos gastos de salud de su hija.	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23035, tratado en la Sesión Nº 174, con fecha  / /2016	Peticion	2016-01-28 13:04:21.260457	2016-02-22 14:38:20.275198	\N		Zulma Marcela Rivarola	Mariquita Sanchez de Thompson 820	0358-154864836		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4243	5	Proyecto de Ordenanza por la que se aprueban dos Convenios firmados con la Provincia de Còrdoba relacionado con el compromiso asumido por ambas Instituciones destinado al mejoramiento de la red Cloacas y del sistema de desagues pluviales de la Ciudad	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23036, tratado en la Sesión Nº 174, con fecha  / /2016	Peticion	2016-01-28 13:38:32.77316	2016-02-22 14:39:17.25441	\N		DEM - Juan Ruben Jure - Ab. Ignacio Fernandez - Cdora. Maria Alicia Panza				\N	\N	\N	\N	\N	rarias@entrada.com	\N
4247	4	Solicita ayuda economica para poder solventar distintos gastos que hacen al mantenimiento del hogar ya que se encuentra desocupada desde el mes septiembre.	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23038, tratado en la Sesión Nº 174, con fecha  / /2016	Peticion	2016-01-29 14:41:46.207231	2016-02-22 14:39:59.482138	\N		Adriana Mabel Romero	Cordoba 767	0358-154324307		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4249	36	Remite el informe de ejecucion presupuestaria del cuarto trimestre del año 2015.	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23039, tratado en la Sesión Nº 174, con fecha  / /2016	Peticion	2016-02-01 14:59:24.168689	2016-02-22 14:40:20.634482	\N		Secretaria de Economia (Cra Silvin Ison)				\N	\N	\N	\N	\N	rarias@entrada.com	\N
4778	4	Solicita un pasaje (ida y vuelta a Cordoba) para la sra Lidia Romina Rojas por motivos de salud de su madre 	\N	\N	\N		Peticion	2016-04-20 15:24:40.955654	2016-04-20 15:24:40.955654	\N		Cjal Carlos Gaso				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4764	11	Organigrama 2016. Nª 34493	\N	\N	\N		Peticion	2016-04-19 16:22:37.205843	2016-04-20 16:56:22.584732	\N		Secretaria de Cultura ,Educacion y Desarrollo Humano 				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4776	1	\N	\N	\N	\N		Despacho	2016-04-20 15:18:19.96063	2016-04-21 11:36:12.895627	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-04-20
4775	1	\N	\N	\N	\N		Despacho	2016-04-20 15:15:37.168684	2016-04-21 11:38:50.945859	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-04-20
4774	\N	\N	\N	\N	\N		Despacho	2016-04-20 15:13:37.696024	2016-04-21 11:52:06.740517	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-04-20
4773	\N	\N	\N	\N	\N		Despacho	2016-04-20 15:06:58.910011	2016-04-21 13:42:17.152432	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-04-20
4777	1	\N	\N	\N	\N		Despacho	2016-04-20 15:20:27.800051	2016-04-21 14:39:16.596809	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-04-20
4772	4	Proyecto de Resolucion: declarar de interes legislativo el "LXVI Congreso Nacional de la Federacion de Obreros y Empleados de Correos y Telecomunicaciones- FOECYT" que tendra lugar en Rio Cuarto los dias 27 al 29 de abril del cte año. 	\N	\N	\N	Expediente Legislativo Nº 23384- iniciado en Sesión Ordinaria Nº 182 de fecha 21/4/16	Peticion	2016-04-20 14:57:32.994257	2016-05-04 13:37:38.949177	\N		Cjal Hipolito Ontivero. Cjal Guillermo Natali.				\N	\N	\N	\N	\N	rarias@entrada.com	\N
4854	3	Proyecto de Resolucion: el Concejo Deliberante  de la ciudad de Rio Cuarto declara su beneplacito por el desarrollo de las actividades de la liga de sus tres categorias: Junior, Seniors y Maxi seniors.	\N	\N	\N		Peticion	2016-05-04 14:24:56.723654	2016-05-04 14:38:47.789125	\N		Osvaldo Dacosta				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4857	1	\N	\N	\N	\N		Despacho	2016-05-04 15:09:57.64771	2016-05-05 10:40:48.733977	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-05-03
4859	\N	\N	\N	\N	\N		Despacho	2016-05-04 15:12:40.90069	2016-05-05 10:47:58.062182	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-05-03
4230	\N	Ordenanzas: 1276/15- 1284/15- 1286/15-1287/15- 1288/15-1289/15-1291/15-1292/15-1293/15-1295/15-1297/15-1298/15-1299/15-1306/15-1308/15- 1342/15\r\n  Decretos:3307/16- 3308/16- 3324/16- 3325/16-3326/16-	\N	\N	\N		Peticion	2016-01-12 15:36:14.511715	2016-01-13 11:27:05.670907	\N	Informatica	DEM				\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4231	7	Solicita ayuda Economica para solventar gastos por razones de Salud	\N	\N	\N		Peticion	2016-01-13 13:49:49.686979	2016-01-13 14:11:36.231248	\N		Ramirez Josè Emilio	No tiene Domicilio Fijo	0358- 155130346		\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4239	1	Solicitan 2 (Dos) Colectivos para trasladar a los niños y sus padres para el Dìa 4 de Febrero del 2016	\N	\N	\N	Lo Firman la Lic. Robasti,Lucia  - Lic Farhat, Nydia\r\n-Nota convertida en Expediente Legislativo Nº 23033, tratado en la Sesión Nº 174, con fecha  / /2016	Peticion	2016-01-26 15:02:50.729933	2016-02-22 14:34:04.74668	\N		N.A.D.I.A - Nueva Asociaciòn Civil para la Prevencìon y Educaciòn  en Diabetes 	Hipolito Irigoyen 1364	0358 - 155607125		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4233	1	Informa que se ausentara de la ciudad de Rio Cuarto desde el 15 de enero de 2016 hasta el 31 del mismo mes y año.	\N	\N	\N		Peticion	2016-01-14 13:31:29.9127	2016-01-14 13:37:50.367964	\N		Cjal Guillermo Natali (Pte del Bloque UPC-FPV)				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4257	16	Solicita Eximiciòn Impuesto Inmobiliario Año 2016	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23045, tratado en la Sesión Nº 174, con fecha  / /2016	Condonacion	2016-02-03 13:14:32.346375	2016-02-22 14:43:29.459887	\N	\N	Ferreyra	Wenceslao Tejerina (Sur)	4627643		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4235	\N	Ordenanzas:1280/15 - 1285/15 - 1302/15 - 1303/15 - 1311/15 - 1312/15 - 1314/15 - 1315/15 - 1316/15 - 1316/15 - 1317/15 - 1318/15 - 1319/15 - 1321/15 - 1322/15 -1323/15 - 1324/15 -  1325/15 - 1330/15 - 1330/15 - 1335/15 - 1336/15 - 1337/15 - 1339/15 - 1340/15 - 1344/15 - \r\nDecretos: 3323/16 - 3307/15 - 3331/16 - 3332/16 - 3333/16 - 3334/16 - 3353/16 - 3354/16 - 3355/16   	\N	\N	\N		Peticion	2016-01-14 15:00:22.695996	2016-01-14 16:18:04.248787	\N	Informatica	DEM, - Juan Josè Jure - 				\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4237	3	Solicita 2 pasajes de ida y vuelta a la ciudad de Cordoba por motivos de salud de su nieta cuyo turno esta dado para 01 de febrero del cte.	\N	\N	\N		Peticion	2016-01-21 12:00:00.740676	2016-01-21 12:06:29.360631	\N		Nelida Palacios		0358-15428007		\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4234	4	Recursos Humanos - Ordenanza 1303/15- Modificar Ordenanza 516/13 -  	\N	\N	\N		Peticion	2016-01-14 14:58:35.552302	2016-01-25 12:15:01.877625	\N		DEM . Cra. Libia Gonzalez				\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4241	97	Solicita Urgente Ajuste De Tarifas	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23034,, tratado en la Sesión Nº 174, con fecha  / /2016	Peticion	2016-01-27 10:50:47.478092	2016-02-22 14:36:11.826415	\N		Sociedad Anònima Transporte Ciudad de Rìo  Cuarto	Indio Felipe Rosas 184 	0358 - 4626452 - 4630104 - 		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4258	16	Solicita Eximiciòn Impuesto Municipal Año 2016	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23047, tratado en la Sesión Nº 174, con fecha  / /2016	Condonacion	2016-02-04 12:15:57.057555	2016-02-22 14:44:11.133881	\N	\N	Cargaterra Humberto Angel	Florit 1314	4622476		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4255	18	Solicita Eximiciòn del Impuesto Inmobiliario Año 2016	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23044, tratado en la Sesión Nº 174, con fecha  / /2016	Condonacion	2016-02-03 11:18:02.143761	2016-02-22 14:43:12.891462	\N	\N	Gutierrez Martina Elisa	Dr Carlos Rodriguez 1486	4642401		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4245	\N	Solicita un pasaje de ida y vuelta aBs As. para el dia 1 de febrero para el sr German Palmizano quien debe presentarse a una entrevista laboral y carece de los medios para poder viajar.	\N	\N	\N		Peticion	2016-01-28 13:46:22.257161	2016-01-28 13:46:22.257161	\N		Cjal Humberto Benedetto				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4244	\N	 Ordenanzas: 1290/15 - 1307/15 - 1334/15 - 1329/15 - 1331/15 - 1332/15 - 1333/15 - 1320/15 - 1345/15  - 1268/15 - 1296/15 - 1300/15 - 1301/15 - \r\n  Decretos: 3367/16 - 3365/16 - 3364/16 - 3374/16 - 3375/16 - 3376/16 - 	\N	\N	\N		Peticion	2016-01-28 13:42:18.016912	2016-01-28 14:02:23.870191	\N	Informatica	DEM				\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4256	20	Solicita Eximiciòn - Condonaciòn-  Inmpuesto Inmobiliario	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23046, tratado en la Sesión Nº 174, con fecha  / /2016	Condonacion	2016-02-03 12:22:46.659288	2016-02-22 14:43:48.823876	\N	\N	Correa Graciela Liliana	San Luis 405	358- 154253464		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4248	1	Solicita Informe Anual de las Siguientes Secretarias: Secretaria de Vivienda - Secretaria de Economia - Secretaria de Obras y Servicios Pùblicos	\N	\N	\N		Peticion	2016-02-01 12:59:54.574669	2016-02-01 13:20:17.258546	\N		Concejal Mauricio Dova				\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4252	3	Solicita pasaje de ida y vuelta a ciudad de Cba para el dia miercoles  3 de ferero por moivos de salud.	\N	\N	\N		Peticion	2016-02-02 12:50:37.222963	2016-02-02 12:55:39.639944	\N		Liliana del Carmen Casiraghi				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4259	14	Solicita Eximiciòn - Condonaciòn Impuesto Inmobiliario	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23048, tratado en la Sesión Nº 174, con fecha  / /2016	Condonacion	2016-02-04 12:24:55.239027	2016-02-22 14:44:25.609859	\N	\N	Batistini Ana Rosa	Belisario Roldan 452	358- 156006318		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4261	11	Solicita Eximiciòn Año 2016 	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23050, tratado en la Sesión Nº 174, con fecha  / /2016	Condonacion	2016-02-04 13:35:32.603121	2016-02-22 14:45:30.459619	\N	\N	Maraschi Nilda Zulma 	Bernanrdo O`Higgins 2080	358- 154228854 - 4633211		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4263	12	Solicita Eximiciòn Impuesto Inmobiliario Año 2016	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23052, tratado en la Sesión Nº 174, con fecha  / /2016	Condonacion	2016-02-04 14:04:49.055909	2016-02-22 14:45:56.824221	\N	\N	Silva Mercedes Yolanda	Sobremonte 3326	4633070		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4265	13	Solicita Eximiciòn Año 2016. es presentada por nota y firmada por el Crio My. Rogelio Ferrario de Bomberos Voluntarios	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23054, tratado en la Sesión Nº 174, con fecha  / /2016	Peticion	2016-02-10 13:01:28.114477	2016-02-22 14:47:33.715334	\N	Secretaria del Concejo Deliberante	Cabo Sommaro Maria Virginia	Paso 375	358-155616754		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4266	11	Solicita Eximiciòn Año 2016	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23055, tratado en la Sesión Nº 174, con fecha  / /2016	Condonacion	2016-02-10 13:48:38.126749	2016-02-22 14:47:58.589495	\N	\N	Lerda Cesar Hernan	MNarìa Olguin 417	02657156782		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4227	1	Nota a fines de consultarlo sobre el proyecto Nacional e Internacional que presentara el que suscribe y el Ingeniero Juan Carlos Peña en el mes de junio del cte año sobre a viabilidad de su tratamiento.	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23094, tratado sesión 174, con fecha   /  / 2016	Peticion	2015-12-30 14:34:23.839711	2016-02-24 12:11:29.623134	\N		Jorge Ravagnani	Cuba 75 1ª Piso	0358-155042909		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4375	1	Solicita Pauta Publicitaria para un Programa especial	\N	\N	\N		Peticion	2016-03-01 15:07:57.754623	2016-03-01 15:13:27.818271	\N	Secretaria del Concejo Deliberante	Pablo Benitez		358- 154171288		\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4262	15	Solicita Eximiciòn Impuesto Inmobiliario Año 2016	\N	\N	\N		Condonacion	2016-02-04 14:00:34.594042	2016-02-04 15:05:22.823827	\N	\N	Silva Marìa Adela	Uniòn de los Argentinos 326 ( Este)	358- 154315870 - 4633070		\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4270	4	 El Sr Omar Gaston Rosso Solicita pasajes ( dos de ida y dos de vuelta) para acompañar a su hijo Tahiiel Olmos Rosso a realizarse un control oftalmologico para el dia 12 de febrero del cte	\N	\N	\N		Peticion	2016-02-11 14:09:39.928987	2016-02-11 15:50:35.242591	\N		Cjal Daniela Miranda				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4269	1	La nota  Nª105/16 mediante la cual se solicita el pago del articulo 31 establecido en la ordenanza 282/92 a la sra Arias Marcela Romina Soledad, legajo Nº 2734	\N	\N	\N		Peticion	2016-02-11 12:49:05.794769	2016-02-11 13:13:36.323044	\N		Recursos Humanos				\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4279	2	Reclamo de Vecinos de esta Ciudad para ser presentada ante la Empresa local. Tema .Recorridos Òmnibus	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23065, tratado en la Sesión Nº 174, con fecha  / /2016	Peticion	2016-02-15 10:59:59.74493	2016-02-22 15:00:58.349178	\N	Secretaria del Concejo Deliberante	Defensor Del Pueblo - Guillermo Luis de Rivas				\N	\N	\N	\N	\N	rarias@entrada.com	\N
4280	8	Solicita Eximiciòn Año 2016	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23066, tratado en la Sesión Nº 174, con fecha  / /2016	Condonacion	2016-02-15 11:52:34.114237	2016-02-22 15:01:18.049167	\N	\N	Villarreal Adelma Susana	Juan Cruz Varela 366	4623855		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4281	18	Solicita Eximiciòn -Condonaciòn Impuesto Inmobiliario	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23067, tratado en la Sesión Nº 174, con fecha  / /2016	Condonacion	2016-02-15 12:28:43.566861	2016-02-22 15:01:34.734819	\N	\N	Gonzalez Olga	Rìo Segundo 827	358 44119039		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4284	12	Solicita Eximiciòn Año 2016	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23070, tratado en la Sesión Nº 174, con fecha  / /2016	Condonacion	2016-02-15 13:50:51.644288	2016-02-22 15:02:35.697484	\N	\N	Diaz Gerardo	Liniers 1831	No Tiene		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4277	\N	30 Boletines Oficiales:  -Nº 357 - y 30 - Nº 358	\N	\N	\N		Peticion	2016-02-12 14:59:17.905915	2016-02-12 15:06:20.798413	\N	Archivo del Concejo	DEM				\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4758	2	Proyecto de Ordenanza: Por la que se otorga la suma  de 400.000 (CUATROSCIENTOS MIL PESOS) al Mercado de Abasto a fines de hacer frente alos daños sufridos a raiz del fenomeno climatico ocurrido en febrero de este año. Anexo Nº 3345	\N	\N	\N		Peticion	2016-04-19 16:06:09.74241	2016-04-20 17:05:41.221316	\N		DEM - Juan Ruben Jure - Ab. Ignacio Fernandez - Cdora. Maria Alicia Panza				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4291	15	Solicita Eximiciòn Año 2016	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23073, tratado en la Sesión Nº 174, con fecha  / /2016	Condonacion	2016-02-17 13:54:04.216856	2016-02-22 15:04:07.591194	\N	\N	Agliozzo Mirian Mabel	Martin de Pueyrredon 2405	358- 4754089		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4285	1	Nota solicitando  colaboracion en el area alimentaria: gaseosas, pan, facturas, alfajores y chorizos. Ademas de solicitar su presencia.	\N	\N	\N		Peticion	2016-02-15 14:44:54.269499	2016-02-15 14:44:54.269499	\N		Pastor Olmos	Coronel Moldes 370	0358- 154311437		\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4780	\N	Piden se considere fracciones de un loteo designado para espacio verde y poder designarlo para diez viviendas	\N	\N	\N		Peticion	2016-04-21 11:08:46.538155	2016-04-21 11:26:51.837068	\N	Secretaria del Concejo Deliberante	Cooperativa de Vivienda y Consumo "Guarniciòn Aerea Rio Cuarto" LTDA.	Baigorria 42 - Gral Paz 533 Dto. "A"	4626192		\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4296	\N	Proyecto de Ordenanza Nº 1082/ 11	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23076, tratado en la Sesión Nº 174, con fecha  / /2016	Peticion	2016-02-17 16:05:58.360147	2016-02-22 15:05:30.928864	\N	Secretaria del Concejo Deliberante	DEM - Juan Ruben Jure - Ing. Ricardo H. Racagni				\N	\N	\N	\N	\N	rarias@entrada.com	\N
4294	155	Resoluciòn 15282 - Rectificase el Presupuesto de Gastos Vigente 	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23077, tratado en la Sesión Nº 174, con fecha  / /2016	Peticion	2016-02-17 15:11:40.776411	2016-02-22 15:05:48.928572	\N	Secretaria del Concejo Deliberante	Secretaria de Economia				\N	\N	\N	\N	\N	rarias@entrada.com	\N
4303	12	Solicita Eximiciòn - Condonaciòn Impuesto Inmobiliario	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23081, tratado en la Sesión Nº 174, con fecha  / /2016	Condonacion	2016-02-18 14:37:38.934081	2016-02-22 15:07:09.895277	\N	\N	Rivero Lopez Dora Rosa	Santa Cruz 285	4309258		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4783	4	Proyecto de Ordenanza por la que se aprueba el acta acuerdo firmada entre el ente Municipal de Obras Sanitarias y el Sindicato Regional Rio Cuarto de Trabajadores de Obras Sanitarias que tiene como principal objetivo determinar un incremento salarial para el personal dependiente de la referida empresa.	\N	\N	\N		Peticion	2016-04-21 12:13:51.999818	2016-04-21 13:31:19.957807	\N		Trababjadores Obras Sanitarias				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4268	25	Solicita Eximiciòn Año 2016	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23057, tratado en la Sesión Nº 174, con fecha  / /2016	Condonacion	2016-02-11 12:42:46.291139	2016-02-22 14:50:52.225903	\N	\N	Castro Jessica Daiana	Yapeyù 873	358- 154392055		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4271	26	Solicita Eximiciòn Año 2016	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23058, tratado en la Sesión Nº 174, con fecha  / /2016	Condonacion	2016-02-11 14:29:47.976454	2016-02-22 14:53:28.226683	\N	\N	Robledo Justina Isabel	Capitan Cesar 651	No Tiene		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4272	20	Solicita  Eximiciòn Año2016	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23059, tratado en la Sesión Nº 174, con fecha  / /2016	Condonacion	2016-02-11 15:04:33.622934	2016-02-22 14:54:35.558043	\N	\N	Cordero Marìa Eva	Bombero Micheliza 528	4623349		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4274	16	Solicita Eximiciòn Año 2016	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23061, tratado en la Sesión Nº 174, con fecha  / /2016	Condonacion	2016-02-12 12:28:57.469545	2016-02-22 14:59:20.709809	\N	\N	Quevedo Aldo Adolfo	Leon Palliere 950	358- 154353431		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4276	16	Reclamo:Considera cobro excesivo de Emos	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23063, tratado en la Sesión Nº 174, con fecha  / /2016	Peticion	2016-02-12 13:37:01.224928	2016-02-22 15:00:20.332904	\N		Parramòn Carlos Ruben	Fotheringan 660	358- 155071834		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4782	\N	 Ordenanzas: 1352/16, 1349/16, 1348/16. Decretos: 3436/16, 3437/16, 3438/16, 3439/16, 3440/16, 3444/16, 3445/16, 3446/16, 3447/16, 3448/16, 3449/16, 3450/16, 3451/16, 3452/16, 3456/16, 3457/16, 3458/16, 3459/16, 3463/16, 3464/16, 3465/16, 3466/16, 3476/16, 3477/16, 3478/16, 3479/16, 3480/16, 3483/16, 3485/16, 3489/16, 3494/16, 3495/16, 3496/16, 3497/16, 3498/16, 3499/16, 3515/16, 3518/16, 3517/16, 3519/16, 3520/16, 3521/16, 3524/16, 3525/16, 3548/18, 3546/16, 3551/16.	\N	\N	\N		Peticion	2016-04-21 12:11:37.442157	2016-04-21 14:20:42.142675	\N						\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4784	\N	Ordenanzas: 1394/16, 1395/16, 1396/16, 1397/16, 1398/16, 1399/16, 1399/16, 1400/16, 1401/16, 1403/16, 1405/16, 1406/16. Decreta: 3564/16, 3565/16, 3566/16, 3567/16.	\N	\N	\N		Peticion	2016-04-21 14:02:18.565779	2016-04-21 14:28:12.839886	\N		DEM - Juan Ruben Jure - Ab. Ignacio Fernandez -  				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4788	\N	\N	\N	\N	\N		Despacho	2016-04-21 15:07:06.78534	2016-04-21 15:07:06.78534	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-04-19
4790	\N	\N	\N	\N	\N		Despacho	2016-04-21 15:28:00.216145	2016-04-21 15:28:00.216145	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-04-19
4791	\N	\N	\N	\N	\N		Despacho	2016-04-21 15:40:14.143453	2016-04-21 15:40:14.143453	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-04-19
4792	\N	\N	\N	\N	\N		Despacho	2016-04-21 15:51:34.123561	2016-04-21 15:51:34.123561	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-04-19
4781	12	Eximicion- Condonacion Inmobiliario	\N	\N	\N	Expediente Legislativo Nº 23420- iniciado en Sesión Ordinaria Nº 183 de fecha 5/5/16	Condonacion	2016-04-21 12:05:16.889373	2016-05-04 13:26:06.673054	\N	\N	Lliliana Dominga Emiliani	Comandante Balmaceda 141	0358-154190625		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4278	2	Solicita al Secretario de Planificaciòn y Desarrollo Sustentable , Ingeniero Ricardo Racagni	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23064, tratado en la Sesión Nº 174, con fecha  / /2016	Peticion	2016-02-12 15:25:29.658763	2016-02-22 15:00:35.508728	\N	Secretaria del Concejo Deliberante	Concejal Guillermo Natali				\N	\N	\N	\N	\N	rarias@entrada.com	\N
4282	10	Solicita Eximiciòn Año 2016	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23068, tratado en la Sesión Nº 174, con fecha  / /2016	Condonacion	2016-02-15 13:20:47.329561	2016-02-22 15:01:54.360338	\N	\N	Meringer Julio Hector	Pedro Medrano 2931	358-156023183		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4304	3	Asunto: Cronograma 2016 - Programa Vinculaciòn Legislativa	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23082, tratado en la Sesión Nº 174, con fecha  / /2016	Peticion	2016-02-18 15:10:29.457008	2016-02-22 15:07:52.142055	\N	Secretaria del Concejo Deliberante	Presidente Concejo Deliberante    CLAUDIO MIRANDA - Guillermo Natali - Dra. Claudia Bringas - Martìn Carranza				\N	\N	\N	\N	\N	rarias@entrada.com	\N
4283	10	Solicita Eximiciòn Año 2016	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23069, tratado en la Sesión Nº 174, con fecha  / /2016	Condonacion	2016-02-15 13:30:05.740268	2016-02-22 15:02:16.599877	\N	\N	Lucero Lucia Otilia	Pedro Nolazco Rodriguez 425	4648026		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4309	8	Solicita Eximiciòn Año 2016 Inmpuesto Inmobiliario	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23086, tratado en la Sesión Nº 174, con fecha  / /2016	Condonacion	2016-02-19 14:15:38.766556	2016-02-22 15:09:15.542002	\N	\N	Aruza Norma Gladys	Maipù 361	4644608		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4290	2	Nota solicitando la revision de la ordenanza Nº 576/09 y su encuadre de categorizacion del inmueble. (Adjunta nota enviada a EDECOM)	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23072, tratado en la Sesión Nº 174, con fecha  / /2016	Peticion	2016-02-16 15:00:17.531995	2016-02-22 15:03:37.091015	\N		Cnel de Arsenales Tomas D. Vazquez	Ruta Nº 8. Km 613	0358- 4166786. 0358- 4990320		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4287	\N	Solicita dos Pasajes de ida y vuelta a Bs As para la srta Mayra Ludmila Mercado y para su abuela en calidad de acompañante por graves problemas de salud.	\N	\N	\N		Peticion	2016-02-15 16:16:06.491781	2016-02-15 16:22:40.36038	\N		Cjal Cabral Maria Del Carmen				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4286	\N	Solicita pasajes	\N	\N	\N	ANULADO	Peticion	2016-02-15 15:35:59.038658	2016-02-15 16:26:22.907559	\N						\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4786	\N	\N	\N	\N	\N		Despacho	2016-04-21 14:44:17.774386	2016-04-21 14:44:17.774386	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-04-20
4310	\N	Solicita pasajes (dos de ida y dos de regreso) a ciudad de Cordoba para el menor Lucas Anselmi y su madre en calidad de acompañante, por problemas de salud.	\N	\N	\N		Peticion	2016-02-19 15:24:46.238705	2016-02-19 15:24:46.238705	\N		Maria del Carmen Cabral				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4292	7	Solicita Eximiciòn Impuesto Comercio e Industria Año 2016	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23074, tratado en la Sesión Nº 174, con fecha  / /2016	Condonacion	2016-02-17 14:58:11.203425	2016-02-22 15:04:25.847524	\N	\N	Gigena Carlos Alfredo	Lendro Alen 685	358 - 155085911		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4289	1	Solicita pasaje (cuatro) de ida y vuelta a ciudad de Cba para el dia 19 del cte. El motivo es un control oftalmologico para sus hijos.	\N	\N	\N		Peticion	2016-02-16 14:27:34.660124	2016-02-16 14:35:33.268373	\N		Gaston Omar Ozan				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4300	1	Solicitan un aumento en la tarifa para el primer dìa hàbil del mesde Marzo	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23078, tratado en la Sesión Nº 174, con fecha  / /2016	Peticion	2016-02-18 12:07:39.345332	2016-02-22 15:06:07.455705	\N	Secretaria del Concejo Deliberante	Taxistas  Autoconvocados	Presidente Peròn Oeste  1554	358 - 154024315		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4787	\N	\N	\N	\N	\N		Despacho	2016-04-21 14:50:52.119972	2016-04-21 14:50:52.119972	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-04-19
4299	75	ORDENANZAS: 282, 1302/15, 336/13,1284/15, 1302/15.\r\nDECRETOS: 447/2008	\N	\N	\N		Peticion	2016-02-18 12:06:02.392857	2016-02-19 12:05:45.065561	\N	Recursos Humanos Del Concejo Deliberante	Decretos y Ordenanzas - Recursos Humanos				\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4301	15	Solicita Eximiciòn- Condonaciòn Impuesto Inmobiliario	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23079, tratado en la Sesión Nº 174, con fecha  / /2016	Condonacion	2016-02-18 13:12:35.290594	2016-02-22 15:06:33.695476	\N	\N	Dominguez Marìa Del Carmen	Colombia 750	358- 155019038		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4306	18	Solicita Eximiciòn Impuesto Inmobiliario Año 2016	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23083, tratado en la Sesión Nº 174, con fecha  / /2016	Condonacion	2016-02-19 12:54:49.802503	2016-02-22 15:08:19.274155	\N	\N	Frontalini Alba Beatriz	Amado Nervo 859	4621242		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4295	\N	30 Boletines Oficiales Nº 359	\N	\N	\N		Peticion	2016-02-17 16:03:33.170943	2016-02-17 16:03:33.170943	\N	Archivo del Concejo	DEM				\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4298	\N	Solicita suministren informacion de todos aquellos agentes que considere debe cambiar de agrupamiento y no fueron considerados en el proseso realizado en el mes de diciembre.	\N	\N	\N		Peticion	2016-02-18 12:03:11.712434	2016-02-18 12:09:36.679687	\N		Recursos Humanos.( Cdora Libia Gonzalez)				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4308	13	Solicita Eximiciòn Año 2016 Impuesto Inmobiliario - Cementerio	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23085, tratado en la Sesión Nº 174, con fecha  / /2016	Condonacion	2016-02-19 13:49:53.481671	2016-02-22 15:08:54.890279	\N	\N	Aguilera Sergio Antonio	Hipolito Irigoyen 1253	4620871		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4297	2	Se fija nuevo cupo de horas extras en diferentes arèas a partir del mes de Febrero del 2016	\N	\N	\N		Peticion	2016-02-18 12:02:35.679791	2016-02-18 12:18:05.778704	\N	Secretaria del Concejo Deliberante	Decreto -Juan Ruben Jure - Ab. Ignacio R. Fernandez				\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4311	16	Solicita Eximiciòn año 2016 	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23087, tratado en la Sesión Nº 174, con fecha / /2016	Condonacion	2016-02-22 12:53:00.775849	2016-02-23 12:19:56.81851	\N	\N	Martinez Sabino	Concejal A.S.Oviedo 1243	4620753		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4305	\N	Solicita 2  Pasajes de Ida y 2 de regreso para la Sra. Claudia Rosana Gomez, por razones de Salud	\N	\N	\N		Peticion	2016-02-19 12:35:44.981831	2016-02-19 12:37:08.11879	\N	Contaduria Concejo Deliberante	Concejal  Guillermo Natali				\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4379	24	Solicita Eximiciòn Año 2016 Impuesto Inmobiliario	\N	\N	\N	convertida en Expediente Legislativo Nº 23146 ,tratada en sesión Nº 176, con fecha 10/3/2016	Condonacion	2016-03-02 13:31:15.899553	2016-04-01 11:14:34.837871	\N	\N	Montiel Graciela Gladys	Juan B Justo 	358 - 155099114		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4090	26	Somete a su consideracion y al Cuerpo Deliberativo un Proyecto de Ordenanza de prevencion y sancion de actos discriminatorios.	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 22989, tratado en la Sesión Nº 169 con fecha 17-12-2015.	Peticion	2015-12-10 15:02:51.103199	2016-02-22 13:53:26.0004	\N	Secretaria del Concejo Deliberante	Mesa de la Diversidad. Pte Walter Torres. 		0358-154863555/ 154909996		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4102	8	Proyecto de Ordenanza que tienen por objeto introducir modificaciones en distintos puntos del Plan de Ordenamiento Urbano de la Ciudad de Rio Cuarto aprobado por Ordenaza Nº 1082/11	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 22993, Tratado en Sesión nº 169 con fecha 17/12/2015.	Peticion	2015-12-15 11:50:46.086266	2016-02-22 13:57:16.556553	\N	Secretaria del Concejo Deliberante	DEM - Juan Ruben Jure - Ing. Ricardo H . Racagni - Cdora. Marìa Alicia Panza				\N	\N	\N	\N	\N	rarias@entrada.com	\N
4110	1	Proyecto: Solicita al secretario Desarrollo Urbano Obra y Servicios Publicos, Sr Jorge Mendez, se analize la posibilidad de ejecutar orden de cordon cuneta en la calle Salvador del 300 al 500	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 22998, Tratado en Sesión nº 169 con fecha 17/12/2015.	Peticion	2015-12-16 14:09:56.834932	2016-02-22 13:59:20.102244	\N		Cjal Leticia Pauluzzi ( Bloque Union Por Cba)				\N	\N	\N	\N	\N	rarias@entrada.com	\N
4179	3	Proyecto de ordenanza que tiene por objeto firmar un acta acuerdo EMOS; O.S.F.Fe..N.T.O.S; FENTOS.	\N	\N	\N	Anexo.Nota convertida en Expediente Legislativo Nº 23019, tratado en la Sesión Nº 170, con fecha 22/12/2015.	Peticion	2015-12-21 14:49:43.447829	2016-02-22 14:27:26.356128	\N		DEM - Juan Ruben Jure - Ab. Ignacio Fernandez -  				\N	\N	\N	\N	\N	rarias@entrada.com	\N
4232	32	Se remite Copia del Decreto Nº 3297/15 por el que se asigna al centro de Jubilados "Diputado Roberto Rodriguez" un espacio en el Edificio ubicado en el Inmueble conocido como Manzana 48	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23031, tratado en la Sesión Nº 174, con fecha  / /2016	Peticion	2016-01-13 15:56:57.581924	2016-02-22 14:33:35.096796	\N		DEM - Juan Ruben Jure -  Cdora. Marìa Alicia Panza				\N	\N	\N	\N	\N	rarias@entrada.com	\N
4246	1	Solicita  Condonaciòn - Eximiciòn del Comercio que posee en calle Buenos Aires 208 por lo que  le estarìan  reclamando a travès del Exp- Nº 0-18590  0-2014	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23037, tratado en la Sesión Nº 174, con fecha  / /2016	Peticion	2016-01-29 14:34:35.420065	2016-02-22 14:39:41.563161	\N		Sr. Cristian Ariel Oviedo	Buenos Aires 208	358-155623151 . 358- 155623149		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4264	4	Resoluciòn: Sobre Concurso Fotogràfico Carnavales de Rìo Cuarto " Amèrico Valverdis"	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23053, tratado en la Sesión Nº 174, con fecha  / /2016	Peticion	2016-02-05 15:23:57.82468	2016-02-22 14:46:44.729925	\N	Secretaria del Concejo Deliberante	Concejal Osvaldo Da Costa				\N	\N	\N	\N	\N	rarias@entrada.com	\N
4267	14	Solicita Eximiciòn Año 2016	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23056, tratado en la Sesión Nº 174, con fecha  / /2016	Condonacion	2016-02-11 12:41:51.887366	2016-02-22 14:50:37.633977	\N	\N	Cengia Silvia Teresa Pilar	General Enrique Mosconi 371	358- 154295782 - 4701059		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4288	94	Resoluciòn 15268 -VISTO: La necesidad de Rectificar el Gastos Vigente	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23071, tratado en la Sesión Nº 174, con fecha  / /2016	Peticion	2016-02-16 13:29:38.729461	2016-02-22 15:03:06.929007	\N	Secretaria del Concejo Deliberante	Secretarìa De Economia				\N	\N	\N	\N	\N	rarias@entrada.com	\N
4293	13	Resolucìon 15310 - Rectificaciòn del Presupuesto	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23075, tratado en la Sesión Nº 174, con fecha  / /2016	Peticion	2016-02-17 15:08:30.368225	2016-02-22 15:04:56.790428	\N	Secretaria del Concejo Deliberante	Secretarìa de Economia				\N	\N	\N	\N	\N	rarias@entrada.com	\N
4302	92	Dictamenes en Disidencia: Nº 210/15- y Nº 001/16 - 017/16	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23080, tratado en la Sesión Nº 174, con fecha  / /2016	Peticion	2016-02-18 14:03:32.388721	2016-02-22 15:06:50.920302	\N	Secretaria del Concejo Deliberante	Tribunal De Cuentas - Martìn Cantoro				\N	\N	\N	\N	\N	rarias@entrada.com	\N
4307	5	Solicita Eximiciòn - Condonaciòn Impuesto Cementerio	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23084, tratado en la Sesión Nº 174, con fecha  / /2016	Condonacion	2016-02-19 13:15:21.298514	2016-02-22 15:08:37.04361	\N	\N	Mansilla Juana Elisa	Republica de Pakistan 50 -  Barrio Sirio Libanes	4899598		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4803	12	Solicita Eximiciòn Condonaciòn Impuesto Inmobiliario	\N	\N	\N	Expediente Legislativo Nº 23429- iniciado en Sesión Ordinaria Nº 183 de fecha 5/5/16	Condonacion	2016-04-25 14:10:31.435732	2016-05-04 13:40:53.005982	\N	\N	Zamudio Nancy Gladys	De La Aloja 119	4651918		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4794	1	Solicita autorizacion en su caracter de presidente de la Asociacion protectora de animales APARC se autorize a dicha entidad a realizar el sorteo  del 23ª Concurso de Dibujo Infantil en el Hall del Concejo Deliberante el viernes 29 del cte a las 18 hs como parte de los actos que se efectuaran para festejar el Dia del Animal.	\N	\N	\N		Peticion	2016-04-22 11:43:48.5148	2016-04-22 12:47:16.854956	\N	Secretaria del Concejo Deliberante	Maria Elina Guevara. Presidente APARC	Paso 719	0358- 154118985		\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4313	2	Proyecto de Resoluciòn: Solicita al Ente Descentralizado de Control Municipal (EDECOM) informe en un pklazo de siete dìas hàbiles, si se ha controlado el reemp`lazo de las bolsas plàsticas que se entregan en los supermercados,Hipermercados y demàs Comercios de la Ciudad\r\n	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23089, tratado en la Sesión Nº 174, con fecha / /2016	Peticion	2016-02-22 13:49:00.357031	2016-02-23 12:20:48.058088	\N	Secretaria del Concejo Deliberante	Concejal Paulizzi Leticia				\N	\N	\N	\N	\N	rarias@entrada.com	\N
4315	5	Solicita Eximiciòn Año 2016 Impuesto Inmobiliario	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23090, tratado en la Sesión Nº 174, con fecha / /2016	Condonacion	2016-02-22 14:14:02.019754	2016-02-23 12:21:14.119693	\N	\N	De La Fuente Beatriz Victoria	Alejandro Sansi 1154	358- 155068510		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4316	3	Proyecto de Resoluciòn: Pedido de Informe Obra Pùblica Boulevar Roca 2016	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23091, tratado en la Sesión Nº 174, con fecha / /2016	Peticion	2016-02-22 14:15:53.903443	2016-02-23 12:21:42.391144	\N	Secretaria del Concejo Deliberante	Concejal Barotti Jose				\N	\N	\N	\N	\N	rarias@entrada.com	\N
4319	1	Proyecto De Ordenanza:Solicita ayuda Ecònomica para la Sra Karen Guigues	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23092, tratado en la Sesión Nº 174, con fecha / /2016	Peticion	2016-02-22 15:59:49.429426	2016-02-23 12:22:06.722996	\N	Secretaria del Concejo Deliberante	Concejal Humberto Benedetto				\N	\N	\N	\N	\N	rarias@entrada.com	\N
4321	7	Solicita Eximiciòn Impuesto Cementerio Año 2016	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23096, tratado sesión 174, con fecha   /  / 2016	Condonacion	2016-02-23 10:54:10.641298	2016-02-24 12:12:21.582689	\N	\N	Baez Juana Dina	General, Mosconi Este 167	358- 154188558		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4798	1	Solicita aporte economico con destino a obras de infraestructura en Kartodromo del Imperio.	\N	\N	\N	Expediente Legislativo Nº 23426- iniciado en Sesión Ordinaria Nº 183 de fecha 5/5/16	Peticion	2016-04-22 15:02:39.479535	2016-05-04 13:39:53.824352	\N		Fundacion Leticia Medina	Josè Marmol (N) 229	0358-1550789		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4789	10	Eximicion Inmobiliario.	\N	\N	\N	Expediente Legislativo Nº 23422- iniciado en Sesión Ordinaria Nº 183 de fecha 5/5/16	Condonacion	2016-04-21 15:10:52.994076	2016-05-04 13:38:08.102752	\N	\N	Moya Adrianita Ysabella	Cuba 158	0358- 154321657		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4795	23	Eximicion Inmobiliario	\N	\N	\N	Expediente Legislativo Nº 23424- iniciado en Sesión Ordinaria Nº 183 de fecha 5/5/16	Condonacion	2016-04-22 12:21:37.777213	2016-05-04 13:38:53.288027	\N	\N	Zonni Carlos Javier	Sobremonte 2159	358 - 154299001 -		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4800	2	Proyecto de Ordenanza:Por la que se sustituye el articulo 12º de la Ordenanza 155/96 - Organizaciòn y Funcionamiento de los Tribunales Administrativos Municipales de la Ciudad de Rìo Cuarto	\N	\N	\N	Expediente Legislativo Nº 23428- iniciado en Sesión Ordinaria Nº 183 de fecha 5/5/16	Peticion	2016-04-22 15:24:12.300342	2016-05-04 13:40:37.293072	\N	Secretaria del Concejo Deliberante	DEM - Juan Ruben Jure -  Cdora. Marìa Alicia Panza - Ab. Ignacio R . Fernandez				\N	\N	\N	\N	\N	rarias@entrada.com	\N
4138	2	P'royecto de Ordenanza por la que se abona a la Empresa Intercity la suma total de $43.656.,96, por el servicio de "Red Man para Centros de Salud Municipales", efectivamente prestados y no cobrados dte los meses de junio, julio y agosto del cte.\r\nAdjunta Exp 31889-S-2015	\N	\N	\N	\r\nNota convertida en Expediente Legislativo Nº 23001, Tratado en Sesión nº 169 con fecha 17/12/2015.\r\n	Peticion	2015-12-16 15:26:56.415782	2016-02-22 14:00:43.505027	\N		DEM (J Juan Jure, Cdora Alicia Panza)				\N	\N	\N	\N	\N	rarias@entrada.com	\N
4177	\N	Proyecto de Ordenanza por la que se abona a la sra Karina MercedesChacon y Ana Chacon la suma de cuarenta y seis mil novecientos noventa (46.990) a cada una por el servicios de comida al personal dependiente del Ministerio del Interior que estuvieron gestionando la entrega de D.N.I,  Pasaporte,etc. efectivamente prestados y no cobrados, durante el periodo comprendido entre el 14 y el 23 de mayo.	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23011, tratado en la Sesión Nº 170, con fecha 22/12/2015.	Peticion	2015-12-21 14:44:01.366049	2016-02-22 14:19:22.198444	\N		DEM - Juan Ruben Jure - Jorge Alejandro Mendez . Cra Alicia Panza.				\N	\N	\N	\N	\N	rarias@entrada.com	\N
4314	\N	Solicita pasajes de ida y vuelta  a la ciudad de Cba para el menor Axel Gabriel Flores de 18 años por problemas de salud.	\N	\N	\N		Peticion	2016-02-22 13:52:15.1881	2016-02-22 14:23:11.455517	\N		Maria Cristina Dasso				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4205	\N	Proyecto de Ordenanaza.Declarase al año comprendido entre el 1ª ero de enero y el 31 de diciembre de 2016 como el "AÑO DE BICENTENARIO DE LA DECLARACION DE LA INDEPENDENCIA NACIONAL" y "AÑO DELVIGESIMO ANIVERSARIO DE LA APROBACION DE LA CARTA ORGANICA MUNICIPAL DE LA CIUDAD DE RIO CUARTO"	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23023, tratado en la Sesión Nº 171, con fecha 29/12/2015.	Peticion	2015-12-28 14:29:18.121039	2016-02-22 14:30:27.154989	\N	Secretaria del Concejo Deliberante	Concejal Osvaldo Da Costa				\N	\N	\N	\N	\N	rarias@entrada.com	\N
4260	15	Solicita Eximiciòn Impuesto Inmobiliario Año 2016	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23049, tratado en la Sesión Nº 174, con fecha  / /2016	Condonacion	2016-02-04 12:56:07.796769	2016-02-22 14:44:52.110916	\N	\N	Villalon Miguel Angel	Echeverria 786	358- 156006972		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4273	10	Solicita ayuda economica para solventar diversos gastos debido a imposibilidad de trabajar por incapacidad.	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23060, tratado en la Sesión Nº 174, con fecha  / /2016	Peticion	2016-02-11 15:07:56.069645	2016-02-22 14:55:03.86452	\N		Miguel Armando Molina	Pje Sanchez de Gloria 997	0358- 124023577		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4275	2	Remite proyecto de ordenanza por la que se modifica el inciso a) del art 37º y los articulos 67º y 128º de la Ordenanza Nº 162/15 tarifa municipal año 2016.	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23062, tratado en la Sesión Nº 174, con fecha  / /2016	Peticion	2016-02-12 12:52:56.42454	2016-02-22 14:59:41.093637	\N		DEM				\N	\N	\N	\N	\N	rarias@entrada.com	\N
4317	13	Resolucion 15322	\N	\N	\N		Peticion	2016-02-22 15:49:17.236158	2016-02-22 16:07:22.649461	\N		Secretaria de Economia				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4322	2	Resoluciòn: Solicitarle a la Secretarìa de Vivienda informe a este cuerpo las razones hasta el presente no enviò un Proyecto de Ordenanza 	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23097, tratado sesión 174, con fecha   /  / 2016	Peticion	2016-02-23 12:05:06.499757	2016-02-24 12:12:56.290365	\N	Secretaria del Concejo Deliberante	Concejal Osvaldo Da Costa				\N	\N	\N	\N	\N	rarias@entrada.com	\N
4312	5	Solicita Condonaciòn Impuesto Emos	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23088, tratado en la Sesión Nº 174, con fecha / /2016	Condonacion	2016-02-22 13:11:32.101137	2016-02-23 12:20:26.244531	\N	\N	Club Social Y Deportivo Acciòn Juvenil	Hipolito Yrigoyen 935 - 41	358 - 4643246		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4320	1	Proyecto De Ordenanza: Solicita ayuda Ecònomica para el Sr. Mario Jorge Giubergia 	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23093, tratado en la Sesión Nº 174, con fecha / /2016	Peticion	2016-02-22 16:02:44.628215	2016-02-23 12:22:31.909533	\N	Secretaria del Concejo Deliberante	Cocejal Humberto Benedetto				\N	\N	\N	\N	\N	rarias@entrada.com	\N
4323	2	Decreto: Designase Provisoriamente como Director de Gestiòn de Programas del Instituto Municipal de la Vivienda al Sr. Roque  O .Amati 	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23098, tratado sesión 174, con fecha   /  / 2016	Peticion	2016-02-23 12:10:59.123275	2016-02-24 12:13:26.508518	\N	Secretaria del Concejo Deliberante	DEM - Juan Ruben Jure - Ab. Ignacio Fernandez -  				\N	\N	\N	\N	\N	rarias@entrada.com	\N
4325	18	Solicita Eximiciòn - Condonaciòn Impuesto Inmobiliario	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23099, tratado sesión 174, con fecha   /  / 2016	Condonacion	2016-02-23 13:26:24.98968	2016-02-24 12:15:05.556953	\N	\N	Andrada Marcela Alejandra	Ricardo Gutierrez 240	358 - 154365044		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4324	\N	Solicita Pasaje( de ida y vuelta) a ciudad de Cba por motivos de salud.	\N	\N	\N		Peticion	2016-02-23 13:16:04.258675	2016-02-23 13:24:12.605017	\N		Alba Liliana Imfeld		0358-155133184		\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4326	\N	Solicita Eximiciòn Impuesto Inmobiliario Año 2016	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23100, tratado sesión 174, con fecha   /  / 2016	Condonacion	2016-02-23 14:20:22.627853	2016-02-24 12:15:42.35947	\N	\N	Correa Maria del Carmen	Santa Cruz 810	4645829		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4797	20	Eximicion Condonacion Inmobiliario.	\N	\N	\N	Expediente Legislativo Nº 23425- iniciado en Sesión Ordinaria Nº 183 de fecha 5/5/16	Condonacion	2016-04-22 13:30:51.312148	2016-05-04 13:39:10.996213	\N	\N	Mendez Pedro Bernabe	Costa Rica 138	0358-4655364		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4335	8	Solicita Eximiciòn Año 2016 Inmpuesto Inmobiliario	\N	\N	\N	Nota Convertida en Expediente Legislativo Nº 23105, Tratado en sesión Nº 174, con fecha  /  /2016. 	Condonacion	2016-02-24 10:53:06.315574	2016-02-24 13:57:34.367748	\N	\N	Velez  Gladys Rosa 	Darragueira 2071	4623842		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4333	3	Proyecto de Ordenanza por la que se aprueba el Acuerdo de modificaciòn del contrato con la firma COTRECO S.A - Ord. Nº705/10-,\r\nAnexo. 9	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23111, tratada sesión Nº 174, con fecha   /  /2016	Peticion	2016-02-23 15:18:40.533713	2016-02-24 15:39:18.186984	\N	Secretaria del Concejo Deliberante	DEM - Juan Ruben Jure - Jorge Alejandro Mendez 				\N	\N	\N	\N	\N	rarias@entrada.com	\N
4331	3	Proyecto de Ordenanza por la que se aprueba la ejecuciòn de la obra "Señalizaciòn Horizontal en sectores de la ciudad (1º etapa)",\r\nAnexo. 4	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23109, tratada sesión Nº 174, con fecha   /  /2016	Peticion	2016-02-23 15:14:41.533148	2016-02-24 15:38:35.657493	\N	Secretaria del Concejo Deliberante	DEM - Juan Ruben Jure - Jorge Alejandro Mendez 				\N	\N	\N	\N	\N	rarias@entrada.com	\N
4330	6	Proyecto de Ordenanza por la que se aprueba la ejecuciòn de la obra "Repavimentaciòn Juan Manuel Fangio (2º etapa)",\r\nAnexo. 7	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23108, tratada sesión Nº 174, con fecha   /  /2016	Peticion	2016-02-23 15:12:03.191139	2016-02-24 15:37:11.453577	\N	Secretaria del Concejo Deliberante	DEM - Juan Ruben Jure - Jorge Alejandro Mendez 				\N	\N	\N	\N	\N	rarias@entrada.com	\N
4327	7	Solicita Eximiciòn Año 2016	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23101, tratado sesión 174, con fecha   /  / 2016	Condonacion	2016-02-23 14:26:29.283216	2016-03-04 15:37:20.081593	\N	\N	Martinez Rodolfo Hector	Capitan Manuel Prado 734	4469173		\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4318	21	Resolucion 15321	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23095, tratado sesión 174, con fecha   /  / 2016	Peticion	2016-02-22 15:53:09.413425	2016-02-24 12:11:59.757138	\N		Secretaria de Economia				\N	\N	\N	\N	\N	rarias@entrada.com	\N
4345	3	Proyecto de Resoluciòn pedido de Informe obra pùblica Infraestructura vial, elèctrica y de agua potable en loteos habitacionales Mi Lugar mi sueño 2,3,4	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23118, tratada sesión Nº 174, con fecha / /2016	Peticion	2016-02-24 15:26:24.848392	2016-02-25 11:32:41.388918	\N	Secretaria del Concejo Deliberante	Concejal Josè Barotti				\N	\N	\N	\N	\N	rarias@entrada.com	\N
4334	1	Solicitan se Interceda para que se les abone el Servicio de Desmalezado	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23102, tratado sesión 174, con fecha   /  / 2016	Peticion	2016-02-23 15:58:22.601836	2016-02-24 12:16:47.75887	\N	Secretaria del Concejo Deliberante	Asociaciòn Vecinal Castelli	Rene Favaloro 1469	358-156543086		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4354	13	Solicita Eximiciòn - Condonaciòn Impuesto Inmobiliario	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23123, tratado en Sesión Nº 174 con fecha /  /2016.	Condonacion	2016-02-26 12:39:04.60121	2016-02-26 14:14:25.189983	\N	\N	Ochoa Claudio Enrique	Guardias Nacionales  1271	358 - 154332858		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4329	3	Proyecto de Ordenanza por el que se abonan los servicios efectivamente prestados y no cobrados a las Cooperativas de Trabajo "Compañero de Oncativo", "Uniòn y Fuerza", "Estaciòn Terminal" y "Mantenimiento y Construcciòn Imperio del Sur Ltda".\r\nAnexo: 24	\N	\N	\N	Nota Convertida en Expediente Legislativo Nº 23103, Tratado en sesión Nº 174, con fecha  /  /2016. 	Peticion	2016-02-23 15:09:07.235883	2016-02-24 13:56:54.791055	\N	Secretaria del Concejo Deliberante	DEM - Juan Ruben Jure - Jorge Alejandro Mendez 				\N	\N	\N	\N	\N	rarias@entrada.com	\N
4351	\N	Decretos:3381/16 - 3382/16 - 3383/16 - 3384/16 - 3385/16- 3386/16 - 3387/16 - 3388/16- 3389/16- 3390/16- 3391/16 - 3392/16- 3393/16- 33/94- 3395/16- 3396/16 - 3397/16- 3398/16- 3399/16- 3400/16- 3401/16- 3402/16- 3403/16- 3404/16- 3405/16- 3406/16- 3407/16- 3408/16- 3409/16- 3410/16- 3411/16- 3412/16- 3413/16- 3414/16- 3415/16- 3416/16- 3417/16-  	\N	\N	\N		Peticion	2016-02-25 16:01:02.939965	2016-02-26 11:01:08.501981	\N	Informatica	DEM - Juan Ruben Jure - Ab. Ignacio Fernandez - Cdora. Maria Alicia Panza				\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4336	8	Solicita Eximiciòn Año 2016	\N	\N	\N	Nota Convertida en Expediente Legislativo Nº 23106, Tratado en sesión Nº 174, con fecha  /  /2016. 	Condonacion	2016-02-24 12:11:33.759919	2016-02-24 15:07:42.192474	\N	\N	Bravo  Hugo Eladio	Francisco Perito Moreno 2720			\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4353	\N	Solicita 1 pasaje de Ida y otro de regreso a la Ciudad de Còrdoba por razones de salud para la Sra.Aguero Verònica Luisa	\N	\N	\N		Peticion	2016-02-26 11:38:00.005619	2016-02-26 11:38:00.005619	\N	Contaduria Concejo Deliberante	Concejal Marìa del Carmen Cabral				\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4332	2	Proyecto de Ordenanza por la que se aprueban a partir del 1º de Noviembre de 2015 y por el termino de cinco (5) meses y quince (15) dìas,los Convenios suscritos, con las Asociaciones Vecinales: " Barrio Parque Alihuen", "Aero Village" y "Barrio Castelli 1, en funciòn de la facultad conferida por Ordenanza Nº 222/96\r\nAnexo.	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23110, tratada sesión Nº 174, con fecha   /  /2016	Peticion	2016-02-23 15:16:48.68027	2016-02-24 15:38:52.319403	\N	Secretaria del Concejo Deliberante	DEM - Juan Ruben Jure - Jorge Alejandro Mendez 				\N	\N	\N	\N	\N	rarias@entrada.com	\N
4337	7	Solicita Condonaciòn del Impuesto Inmobiliario del "Club Sportivo San Juan"	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23112, tratada sesión Nº 174, con fecha   /  /2016	Peticion	2016-02-24 12:14:53.806815	2016-02-24 15:39:37.215435	\N	Secretaria del Concejo Deliberante	Concejal Ontivero				\N	\N	\N	\N	\N	rarias@entrada.com	\N
4340	1	Autorizar. al Presidente del Concejo Deliberante a crear una partida presupuestaria especial de pesos ($25.000) destinada a la compra de ùtiles escolares	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23113, tratada sesión Nº 174, con fecha   /  /2016	Peticion	2016-02-24 13:48:52.938415	2016-02-29 15:19:36.094215	\N	Secretaria del Concejo Deliberante	Presidente Concejo Deliberante    CLAUDIO MIRANDA				\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4341	9	Solicita Eximiciòn - Condonaciòn Inmpuesto Inmobiliario	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23114, tratada sesión Nº 174, con fecha / /2016	Condonacion	2016-02-24 13:55:20.469244	2016-03-04 15:19:39.815728	\N	\N	Goso Angel Ruben	Ituzaingo 355	358-154302140 - 4629600		\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4339	\N	Solicita 2 pasajes de ida y 2 de regreso hacia la ciudad de Còrdoba por razones de salud	\N	\N	\N		Peticion	2016-02-24 13:38:25.451053	2016-02-24 15:56:52.280458	\N	Contaduria Concejo Deliberante	Buzzetti Martina Mirian	Rio Nihuil 735	4655178		\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4343	20	Solicita Eximiciòn Año 2016 Impuesto Inmobiliario	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23116, tratada sesión Nº 174, con fecha / /2016	Condonacion	2016-02-24 14:10:03.160521	2016-02-25 11:32:01.021937	\N	\N	Meloni Reinaldo Eduardo M.	Jaime Gil 180	358- 154199532 - 4625562		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4348	16	Solicita Eximiciòn Impuesto Inmobiliario Año 2016	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23120, tratada en Sesión Nº 174, con fecha  /  / 2016.	Condonacion	2016-02-25 13:13:51.08814	2016-02-26 11:57:04.374854	\N	\N	Saldaño Lucero Mirta Gladys	Pte. Peròn Oeste 1970	4797523		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4350	26	Solicita Eximiciòn Impuesto Inmobiliario Año 2016	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23121, tratada en Sesión Nº 174, con fecha  /  / 2016.	Condonacion	2016-02-25 14:23:20.240139	2016-02-26 11:57:32.797874	\N	\N	Bermani Franca Gabriela	Esteban Gazcòn 2422	4648580		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4355	7	Solicita dos pasajes (ida y vuelta) a ciudad de Cba para su nieta  Sharon Giselle Tobares Montiel por motivos de salud.	\N	\N	\N		Peticion	2016-02-26 12:47:20.037298	2016-02-26 12:57:32.81807	\N		Ana Maria Aguirre		0358- 156018226		\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4361	\N	Proyecto de Resolucion: Declarar de Interes legislativo y Educativo EL "Septimo Coloquio Nacional de Filosofia: Despues del Sujeto: Teorias/ Barras/ Institucionales/ Luchas y Resistencias" Organizado por la Facultad de CIencias Humanas de la Universidad Nacional de Rio Cuarto durante los dias 13, 14 y 15 de abril de 2016.	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23124 ,tratada en sesión Nº 174, con fecha  /  /2016.	Peticion	2016-02-26 15:04:07.415323	2016-02-29 12:33:56.447291	\N		Cjal eticia Perez (Bloque UPC- FPV)				\N	\N	\N	\N	\N	rarias@entrada.com	\N
4357	1	Solicita ayuda con utiles escolares para los niños de la copa de leche de muy bajos recursos de Brrio Padre Carlos Mujica	\N	\N	\N	Gisella Carranza, Belen Moreno, Bengolea Ana, Garay Natalia, Martinez Angelica	Peticion	2016-02-26 13:25:07.750731	2016-02-26 14:00:14.370411	\N		Fernanda Moreno	Brrio Padre Carlos Mujica	0358-4827916 (Sergio Rodriguez)		\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4362	3	Solicita un aporte ecònomico para el Profesor Guillermo Ricca quien participara del "vii Coloquio	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23125 ,tratada en sesión Nº 174, con fecha  /  /2016.	Peticion	2016-02-26 15:05:49.131687	2016-02-29 12:33:37.868279	\N		Concejal Leticia Perez				\N	\N	\N	\N	\N	rarias@entrada.com	\N
4360	6	Solicita Eximiciòn Año 2016 Impuesto Inmobiliario	\N	\N	\N	Ingreso Creado como Peticiòn y pertenece a Eximiciòn	Peticion	2016-02-26 14:43:38.934763	2016-02-29 13:03:56.860613	\N	Secretaria del Concejo Deliberante	Quiñonez Juan Antonio	Laprida 942	358 -155484651		\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4358	\N	Solicita Eximiciòn - Condonaciòn Impuesto Inmobiliario  y Patente	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23134 ,tratada en sesión Nº 174, con fecha  /  /2016.	Condonacion	2016-02-26 14:28:37.677393	2016-02-29 12:37:31.815823	\N	\N	Muñoz Daniela Alejandra	Los Alerces 528 - Banda Norte 	358- 154263554		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4328	3	Proyecto de Ordenanza por el que se abonan los servicios efectivamente prestados y no cobrados a las Asociaciones Vecinales"Villa Dalcar"  "11 de Noviembre", "Josè y Mariano Cabral", "Intendente Mòjica", "Barrio Comarca Norte", "Barrio Fènix".\r\nAnexo Copias.23	\N	\N	\N	Nota Convertida en Expediente Legislativo Nº 23104, Tratado en sesión Nº 174, con fecha  /  /2016. 	Peticion	2016-02-23 15:04:01.046012	2016-02-24 13:57:13.03873	\N	Secretaria del Concejo Deliberante	DEM - Juan Ruben Jure - Jorge Alejandro Mendez 				\N	\N	\N	\N	\N	rarias@entrada.com	\N
4338	3	Solicita aporte ecònomico para la Sra Natalia Vanina Bianchini  	\N	\N	\N	Nota Convertida en Expediente Legislativo Nº 23107, Tratado en sesión Nº 174, con fecha  /  /2016. 	Peticion	2016-02-24 12:45:26.394774	2016-02-24 13:58:07.094002	\N	Secretaria del Concejo Deliberante	Concejal  Mauricio Dova				\N	\N	\N	\N	\N	rarias@entrada.com	\N
4409	32	Solicita Eximiciòn Condonaciòn Impuesto Inmobiliario	\N	\N	\N	convertida en Expediente Legislativo Nº 23193 ,tratada en sesión Nº 176, con fecha 10/3/2016	Condonacion	2016-03-08 12:47:58.999424	2016-04-01 11:48:06.125681	\N	\N	Centeno Arnaldo	Rafael Obligado1869	358 - 154100222		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4342	10	Solicita Eximiciòn - Condonaciòn Impuesto Inmobiliario	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23115, tratada sesión Nº 174, con fecha / /2016	Condonacion	2016-02-24 13:58:44.511721	2016-02-25 11:31:47.256902	\N	\N	Suarez Susana Dolores	Adelia Maria 414	358- 154384423		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4344	20	Solicita Eximiciòn Condonaciòn Inmpuesto Inmobiliario	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23117, tratada sesión Nº 174, con fecha / /2016	Condonacion	2016-02-24 14:36:17.758046	2016-02-25 11:32:22.717729	\N	\N	Seimandi Maria Eugenia	Venezuela 527	358- 154282975		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4346	1	Informa que a partir del dìa 25 de Febrero del 2016 se designa a la Srta- Siragvegna Rebeca perteneciente a la Cooperativa "Sol del Imperio" LLtda. Comenzara a prestar el servicio mantenimiento, higiene y desinfecciòn en las dependencias del Concejo Deliberante	\N	\N	\N		Peticion	2016-02-25 11:59:08.619497	2016-02-25 12:16:30.164983	\N	Secretaria del Concejo Deliberante	Secretaria de Desarrollo Social - Lic. Clara Cocco				\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4366	4	Proyecto de Ordenanza. solicita aporte econòmico para la Biblioteca Popular "Evaristo Segat"	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23131,tratada en sesión Nº 174, con fecha  /  /2016.	Peticion	2016-02-26 15:42:49.711583	2016-02-29 12:30:22.23104	\N	Secretaria del Concejo Deliberante	Concejal Varela Geuna - V. Solicitaiviana Andrea Yawny				\N	\N	\N	\N	\N	rarias@entrada.com	\N
4349	2	Respuesta de Edecom a la solicitud de la Concejal Viviana Pomiglio sobre Bloquera Norte - Desde Mesa de Entrada se realiza pase a la Concejal	\N	\N	\N		Peticion	2016-02-25 13:37:45.362814	2016-02-25 15:17:38.164647	\N	Concejal Viviana Pomiglio	EDECOM - Dr.Artero Oscar 				\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4347	1	Solicitan Eximiciòn del Servicio de Agua y Cloacas del año 2016	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23119, tratada en Sesión Nº 174, con fecha  /  / 2016.	Peticion	2016-02-25 12:23:10.54072	2016-02-26 11:56:37.650459	\N	Secretaria del Concejo Deliberante	Biblioteca Popular Domingo F. Sarmiento	Belisario Roldan 201	358 - 155075505		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4352	5	Solicita ayuda ecònomica por razones de salud	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23122, tratado en Sesión Nº 174 con fecha /  /2016.	Peticion	2016-02-26 11:17:35.916144	2016-02-26 14:13:39.9359	\N	Secretaria del Concejo Deliberante	Echenique Humberto Jesùs	Rìo Quinto 653	358-154295406 - 4640589		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4363	2	Proyecto de Resolucion: Solicitar a Emos, que informe de manera detallada en un plazo de 5 dias la actual situacion de la planta elevadora de liquidos cloacales ubicada entre calles Laguna Blanca y Colombia, incluidos los aspectos referidos a su funcionamiento.	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23130, tratada en sesión Nº 174, con fecha  /  /2016.	Peticion	2016-02-26 15:06:47.300961	2016-02-29 12:30:50.851768	\N		Cjal  Leticia Perez (Bloque UPC- FPV)				\N	\N	\N	\N	\N	rarias@entrada.com	\N
4356	20	Solicita Eximiciòn Impuesto Inmobiliario Año 2016	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23128 ,tratada en sesión Nº 174, con fecha  /  /2016.	Condonacion	2016-02-26 13:20:18.170442	2016-02-29 12:32:31.191517	\N	\N	Maldonado Victorio Antonio	Sucre 375	358- 154268110		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4365	4	Solicita al Secretario Desarrollo Urbano Obra y Servicios Pùblicos, Sr. Jorge Mendez, analice la posibilidad de ejecutar obras de cordòn cuneta en la calle Yaravi del 300  al 400 	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23127 ,tratada en sesión Nº 174, con fecha  /  /2016.	Peticion	2016-02-26 15:27:54.559491	2016-02-29 12:32:49.212237	\N	Secretaria del Concejo Deliberante	Concejal Leticia Paulizzi				\N	\N	\N	\N	\N	rarias@entrada.com	\N
4364	2	Proyecto de Ordenanza. Modifiquese el articulo 9º de la Ordenanza 530/14	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23126 ,tratada en sesión Nº 174, con fecha  /  /2016.	Peticion	2016-02-26 15:07:35.78731	2016-02-29 12:33:17.776203	\N	Secretaria del Concejo Deliberante	Concejal Leticia Perez				\N	\N	\N	\N	\N	rarias@entrada.com	\N
4359	12	Solicita ayuda economica por graves problemas de salud de su nieta Aixa Agata Pagliaro.	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23133,tratada en sesión Nº 174, con fecha  /  /2016.	Peticion	2016-02-26 14:40:27.70104	2016-02-29 12:29:21.108091	\N		Daniela Alejandra Muñoz	Pje Los Alerces 528- Bda Norte	0358-154263554		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4367	8	Solicitar al Secretario de Desarrollo Urbano, Obras y Servicios Pùblicos informe . Sobre cantidad de tarjetas magnèticas en las oficinas de la empresa de Transporte Pùblico de pasajeros - Destino Final del dinero que no se le devuelve al usuario,  	\N	\N	\N	Nota convertida en Expediente Legislativo Nº 23132, ,tratada en sesión Nº 174, con fecha  /  /2016.	Peticion	2016-02-26 16:11:19.640272	2016-02-29 12:30:01.405099	\N	Secretaria del Concejo Deliberante	Concejal Daniela Miranda				\N	\N	\N	\N	\N	rarias@entrada.com	\N
4373	25	Solicita Eximiciòn Año 2016 Impuesto Inmobiliario	\N	\N	\N	convertida en Expediente Legislativo Nº 23138 ,tratada en sesión Nº 176, con fecha 10/3/2016	Condonacion	2016-03-01 13:06:49.874814	2016-04-01 11:09:40.903884	\N	\N	Ledesma Alba Del Valle	Lanin 620	4650689		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4372	16	Solicita Eximiciòn Impuesto Inmobiliario Año 2016	\N	\N	\N	convertida en Expediente Legislativo Nº 23139 ,tratada en sesión Nº 176, con fecha 10/3/2016	Condonacion	2016-03-01 12:35:04.020594	2016-04-01 11:10:55.051381	\N	\N	Morlhiere Hector	Miguel Juarez Celman 423	4634470		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4370	5	Solicita Eximiciòn Impuesto Cementerio 	\N	\N	\N	convertida en Expediente Legislativo Nº 23141,tratada en sesión Nº 176, con fecha 10/3/2016	Condonacion	2016-03-01 11:34:12.876732	2016-04-01 11:11:46.711684	\N	\N	Silva Marìa Adela	Uniòn de los Argentinos 326 ( Este)	358- 154315870		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4371	22	Solicita Eximiciòn Año 2016 Impuesto Inmobiliario	\N	\N	\N	convertida en Expediente Legislativo Nº 23140 ,tratada en sesión Nº 176, con fecha 10/3/2016	Condonacion	2016-03-01 11:50:36.765045	2016-04-01 11:11:19.296154	\N	\N	Di Mico Roberto Jorge	Saavedra 60	4646239		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4380	2	Resoluciòn Solicitar al Secretario de Desarrollo Urbano Obras y Servicios Pùblicos, Sr. Jorge Mendez, informe de como se utilizaron los fondos recaudados con venta de inmuebles	\N	\N	\N	Nota Convertida en Expediente Legislativo Nº 23147, Tratado en sesión Nº 176, con fecha 10/3 /2016.	Peticion	2016-03-02 13:54:50.136773	2016-03-31 16:11:03.405787	\N	Secretaria del Concejo Deliberante	Concejal Leticia Paulizzi - Leticia Perez - Mauricio Dova - Sara Bergesio				\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4387	2	Solicita al Secretario de Desarrollo Urbano, Obras y Servicios Pùblicos. Sr. Jorge Alejandro Mendez\r\na- Recorrido actual y horario de la firma COTRECO S.A\r\nb- Fecha en que se realizò el ùltimo arreglo de las calles.\r\nc- Estado actual del alumbrado pùblico	\N	\N	\N	 Convertida en Expediente Legislativo Nº 23152, Tratado en sesión Nº 176, con fecha 10/3 /2016.	Peticion	2016-03-03 14:50:34.182825	2016-03-31 16:12:06.981533	\N	Secretaria del Concejo Deliberante	Concejal Leticia Paulizzi				\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4396	1	Solicita 5.000 pesos de  ayuda ecònomica que seràn destinados a copa de leche, Escuela Bliblica, y otras actividades que se realizan en el lugar	\N	\N	\N	convertida en Expediente Legislativo Nº 23159 ,tratada en sesión Nº 176, con fecha 10/3/2016	Peticion	2016-03-04 15:43:50.210456	2016-04-01 11:55:42.319924	\N	Secretaria del Concejo Deliberante	Pastor Sergio y Josè Olmos	Coronel Moldes 370	0358 - 154311437		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4378	7	Solicita Eximiciòn Impuesto Inmobiliario Año 2016	\N	\N	\N	convertida en Expediente Legislativo Nº 23145 ,tratada en sesión Nº 176, con fecha 10/3/2016	Condonacion	2016-03-02 13:21:39.286669	2016-04-01 11:13:13.090542	\N	\N	Sarandon Siveria Generosa	Almirante Bronw 1326	358 - 154178084		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4400	14	Solicita Eximiciòn - Condonaciòn  Impuesto Inmobiliario	\N	\N	\N	convertida en Expediente Legislativo Nº 23162 ,tratada en sesión Nº 176, con fecha 10/3/2016	Condonacion	2016-03-07 12:47:37.117873	2016-04-01 11:25:06.003801	\N	\N	Villagra Marìa Cristina	Francisco Muñiz 888	No Tiene		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4405	1	proyecto de Resolucion: convocar con caracter de urgencia a convocar a concurrir al Concejo Deliberante al sr Racagni Ricardo, secretario de Planificacion y Desarrollo Sustentable, al sr Subsecretario de Promocion Social Parodi Gomzalo, y al sr Fiscal Municipal Hernan Di Santo a fin de bindar informacion de la actual situacion que tiene en velo a 300 flias de Brrio Oncativo tas recibir una orden de desalojo.	\N	\N	\N	 Convertida en Expediente Legislativo Nº 23166, Tratado en sesión Nº 176, con fecha 10/3 /2016.	Peticion	2016-03-07 15:22:47.258184	2016-03-31 16:13:59.462167	\N		Cjales Guillermo Natali, Daniela Miranda, Jose Barotti (Bloque Union Por Cba)- Frente para La Victoria)				\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4402	26	Solicita Eximiciòn - Condonaciòn Impuesto Inmobiliario	\N	\N	\N	convertida en Expediente Legislativo Nº 23164 ,tratada en sesión Nº 176, con fecha 10/3/2016	Condonacion	2016-03-07 14:14:35.730453	2016-04-01 11:29:38.473958	\N	\N	Calderon Placer	Pedro Zanni  847	4628687		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4407	15	Solicita Eximiciòn - Condonaciòn  Impuesto Inmobiliario	\N	\N	\N	convertida en Expediente Legislativo Nº 23170 ,tratada en sesión Nº 176, con fecha 10/3/2016	Condonacion	2016-03-07 16:17:05.849194	2016-04-01 11:30:12.364809	\N	\N	Sanchez Guillermo Alejandro	Edison 302	358 - 155600778		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4382	15	Solicita Eximiciòn - Condonaciòn - Impuesto Inmobiliario	\N	\N	\N	convertida en Expediente Legislativo Nº 23148 ,tratada en sesión Nº 176, con fecha 10/3/2016	Condonacion	2016-03-03 11:46:15.504253	2016-04-01 11:15:29.449525	\N	\N	Simone Susana Erminda	Los Alerces 350	358 - 154834062		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4391	10	Solicita ayuda ecònomica por razones de salud	\N	\N	\N	convertida en Expediente Legislativo Nº 23155 ,tratada en sesión Nº 176, con fecha 10/3/2016	Peticion	2016-03-04 13:04:34.437726	2016-04-01 11:54:08.54651	\N	Secretaria del Concejo Deliberante	Pereyra  Norma Matilde	Pasaje Trapalandra 1528	358 - 154171505		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4740	3	Solicita ayuda ecònomica para la compra de un Nebulizador	\N	\N	\N	Falta direcciòn y Tel para agregar- Mario Navarro\r\nexpediente legislativo Nº 23396 iniciado en Sesión Ordinaria Nº 182 de fecha 21/4/16	Peticion	2016-04-18 13:48:57.838653	2016-04-25 12:35:37.897186	\N	Secretaria del Concejo Deliberante	Gimenez Lidia Diolinda	Capayanes 2360	358 - 4841580		\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4406	\N	Resoluciòn: Declarar de Interès Legislativo la tarea que desarrolla la "Orquesta Barrial" en la Ciudad de Rìo Cuarto	\N	\N	\N	 Convertida en Expediente Legislativo Nº 23167, Tratado en sesión Nº 176, con fecha 10/3 /2016.	Peticion	2016-03-07 15:36:49.37661	2016-03-31 16:14:23.025131	\N	Secretaria del Concejo Deliberante	Concejal Viviana Yawny				\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4392	\N	Decretos - 3418/16 - 3419/16 - 3420/16 - 3421/16- 3422/16 -3424/16 - 3425/16 - 3426/16 - \r\nOrdenanzas: 1350/16 - 1351/16 - \r\nAnexo III - Plan de cuentas Patrimonial	\N	\N	\N		Peticion	2016-03-04 13:15:08.11614	2016-03-04 14:58:55.067501	\N	Informatica	DEM - Juan Ruben Jure - Ab. Ignacio Fernandez - Cdora. Maria Alicia Panza				\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4802	\N	Decretos: 3552 \r\nOrdenandas:1378 /16 - 1379/16 -1380/16 -1381/16 -1382/16 - 1383/16 - 1384/16 - 1385/16 - 1386/16 - 1387/16 - 1388/16 - 1389/16 - 1390/16 - 1391/16 - 1392/16 - 1402/16 - 1404/16	\N	\N	\N		Peticion	2016-04-25 12:56:05.022727	2016-04-25 15:36:26.834305	\N	Informatica	DEM - Decretos y Ordenanzas				\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4383	11	Solicita Eximiciòn Impuesto Patente 	\N	\N	\N	convertida en Expediente Legislativo Nº 23149 ,tratada en sesión Nº 176, con fecha 10/3/2016	Condonacion	2016-03-03 13:38:32.399605	2016-04-01 11:15:58.710428	\N	\N	Gonzalez Josè Angel	Dr. Carlos Rodriguez 1462	4637966		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4389	8	Solicita Eximiciòn Año 2016 Impuesto Inmobiliario	\N	\N	\N	convertida en Expediente Legislativo Nº 23154 ,tratada en sesión Nº 176, con fecha 10/3/2016	Condonacion	2016-03-04 12:41:45.760742	2016-04-01 11:20:46.752625	\N	\N	Restovich Ruben Dario	Juan B Justo 1220	358 - 154125900		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4393	\N	Solicita Eximiciòn - Condonaciòn Impuesto Inmobiliario y Patente	\N	\N	\N	convertida en Expediente Legislativo Nº 23156 ,tratada en sesión Nº 176, con fecha 10/3/2016	Condonacion	2016-03-04 14:01:02.508138	2016-04-01 11:21:56.702161	\N	\N	Arguello Miguel Angel	Jujuy 1927	4628044		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4398	10	Solicita EXimiciòn Impuesto Inmobiliario Año 2016	\N	\N	\N	convertida en Expediente Legislativo Nº 23160 ,tratada en sesión Nº 176, con fecha 10/3/2016	Condonacion	2016-03-07 12:02:12.211258	2016-04-01 11:23:33.085668	\N	\N	Gerumine Marìa Gladys	Hipolito Yrigoyen 2250	4623471		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4376	2	Anexo 33557- 1 - 3 Copias  y 1 mapa original - 2016 -Proyecto de Ordenanza por la que se aprueba la Carta de Intenciòn suscripta con la Asociaciòn Mutual del Sindicato Ùnico de Recolectores de Residuos y Barrido de Còrdoba (A.M.S.U.R.R.BA.C)	\N	\N	\N	El mapa de anexo no pudo fotocopiarse\r\nNota Convertida en Expediente Legislativo Nº 23143, Tratado en sesión Nº 176, con fecha 10/3 /2016.	Peticion	2016-03-02 11:41:14.641153	2016-03-31 16:08:10.115956	\N	Secretaria del Concejo Deliberante	DEM - Juan Ruben Jure- Ing. Fabricio A. Pedruzzi . Cdora. Maria Alicia Panza - Instituto Municipal de la Vivienda - 				\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4381	\N	Solicitan pedido de utiles escolares para los niños y jovenes que asisten al Ctro Comunitario Quena del sector Avda Argentina (Conchancharaba)	\N	\N	\N	Otras firmas de las madres (Imelda Cerezo, Mailen Lucero, GisellaOrtis, Alicia Figueroa )	Peticion	2016-03-02 15:25:17.731329	2016-03-02 15:40:27.507959	\N		Cintia Conde (Responsable) Ctro Comunitario Quena.	Avda Argentina 669	0358-4834931		\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4390	9	Eximiciòn Año 2016 - Impuesto Inmobiliario - Cementerio	\N	\N	\N	convertida en Expediente Legislativo Nº 23153 ,tratada en sesión Nº 176, con fecha 10/3/2016	Condonacion	2016-03-04 12:56:45.758435	2016-04-01 11:17:32.070724	\N	\N	Villafañe Sergio	Leandro Alen 615	358 - 154164765		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4385	12	Solicita Eximiciòn - Condonaciòn -  Impuesto Inmobiliario	\N	\N	\N	convertida en Expediente Legislativo Nº 23151 ,tratada en sesión Nº 176, con fecha 10/3/2016	Condonacion	2016-03-03 14:26:37.185316	2016-04-01 11:17:05.061976	\N	\N	Toledo Alicia Isabel	Florencio Sanchez 215 1º Piso - Cuerpo 3	4848338		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4386	\N	Solicita 2 pasajes de ida y 2 de regreso a ciudad de Cba por motivos de salud de su hijo Thiago Cuello.	\N	\N	\N		Peticion	2016-03-03 14:48:43.793912	2016-03-03 15:25:54.487402	\N	Contaduria Concejo Deliberante	Tapia Noemi Susana				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4388	\N	Solicita 1 pasaje de Ida y 1 de regreso hacia la ciudad de Còrdoba por razones de salud	\N	\N	\N		Peticion	2016-03-03 15:55:54.48687	2016-03-03 15:55:54.48687	\N		Romina Romero				\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4394	16	Solicita Eximiciòn Año 2016 Impuesto Inmobiliario	\N	\N	\N	convertida en Expediente Legislativo Nº 23157 ,tratada en sesión Nº 176, con fecha 10/3/2016	Condonacion	2016-03-04 14:12:58.880277	2016-04-01 11:22:15.192402	\N	\N	Scarmagnane Juan Carlos	Pasje Cafeto 2625	4644511		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4399	9	Solicita Eximiciòn -Condonaciòn Impuesto Emos Inmobiliario	\N	\N	\N	convertida en Expediente Legislativo Nº 23161 ,tratada en sesión Nº 176, con fecha 10/3/2016	Condonacion	2016-03-07 12:20:01.816544	2016-04-01 11:24:28.077145	\N	\N	Escudero Carlos Dante	Estado de Israel 2369	358 - 154836468 - 4700806		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4401	13	Solicita Eximiciòn - Condonaciòn Impuesto Inmobiliario	\N	\N	\N	convertida en Expediente Legislativo Nº 23163 ,tratada en sesión Nº 176, con fecha 10/3/2016	Condonacion	2016-03-07 13:53:35.294779	2016-04-01 11:28:57.0027	\N	\N	Rodriguez Glays Noemi	Pasaje Guillermo Montes 1157	358 - 154299174		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4417	5	Proyecto de Ordenanza: Solicita se otorgue ayuda ecònomica a la Sra.Mariana Rosa Fria que serà destinado a afrontar gastos de primer orden.	\N	\N	\N	 Convertida en Expediente Legislativo Nº 23173, Tratado en sesión Nº 176, con fecha 10/3 /2016.	Peticion	2016-03-08 13:35:37.813864	2016-03-31 16:23:31.68431	\N	Secretaria del Concejo Deliberante	Mauricio Dova				\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4427	12	Eximicion Condonacion Inmobiliario.	\N	\N	\N	convertida en Expediente Legislativo Nº 23180 ,tratada en sesión Nº 176, con fecha 10/3/2016	Condonacion	2016-03-08 14:28:42.015463	2016-04-01 11:32:28.341338	\N	\N	Escudero Oscar Osvaldo	Vicente Lopez	4727377		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4410	\N	Solicita Eximiciòn Condonaciòn Impuesto Inmobiliario	\N	\N	\N	convertida en Expediente Legislativo Nº 23194 ,tratada en sesión Nº 176, con fecha 10/3/2016	Condonacion	2016-03-08 13:04:16.999732	2016-04-01 11:48:36.751013	\N	\N	Benitez Jorge de San Ramòn	Arturo M Bas 1927	358 - 154907972		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4404	9	Proyecto de Ordenanza : Solicita ayuda ecònomica los que seràn destinados al Sr. Oscar Alfonso por razones de salud	\N	\N	\N	 Convertida en Expediente Legislativo Nº 23169, Tratado en sesión Nº 176, con fecha 10/3 /2016.	Peticion	2016-03-07 15:11:00.215956	2016-03-31 16:14:59.79849	\N	Secretaria del Concejo Deliberante	Concejal Viviana C. Pomiglio		358 - 154287216		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4424	2	Resoluciòn.:Solicitar al Secretario de Desarrollo Urbano, Obras y Servicios Pùblicos, Sr. Jorge Mendez  arbitre los medios necesarios para que se renueven los carteles de señalizaciòn  de de la mencionada parada de Colectivos ubicada en calle Pizzarro 57	\N	\N	\N	 Convertida en Expediente Legislativo Nº 23175, Tratado en sesión Nº 176, con fecha 10/3 /2016.	Peticion	2016-03-08 14:04:54.472241	2016-03-31 16:29:38.901044	\N	Secretaria del Concejo Deliberante	Concejal Sara Bergesio				\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4426	1	Proyecto. Declara de interes  cultural y Educativo el libro " Cronica Militante de una lucha Colectiva" Memorias de la Universidad Nacional de Rio Cuarto, del autor Juan Muzzolon.	\N	\N	\N	 Convertida en Expediente Legislativo Nº 23176, Tratado en sesión Nº 176, con fecha 10/3 /2016.	Peticion	2016-03-08 14:16:03.590598	2016-03-31 16:30:28.116817	\N		Cjal Daniela Miranda				\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4429	3	Proyecto de Resolucion pedido informe modificacion de contrato con Cotreco S.A.(ALUMBRADO PUBLICO)	\N	\N	\N	 Convertida en Expediente Legislativo Nº 23189, Tratado en sesión Nº 176, con fecha 10/3 /2016.	Peticion	2016-03-08 14:52:51.917421	2016-03-31 16:40:30.267976	\N		Cjal Jose Barotti				\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4425	6	Proyecto de Ordenanza por el que se otorga a la sra Carrizo Maria Alejandra un aporte economico de pesos un mil (1.000) destinados a solventar gastos de salud.	\N	\N	\N	 Convertida en Expediente Legislativo Nº 23179, Tratado en sesión Nº 176, con fecha 10/3 /2016.	Peticion	2016-03-08 14:14:05.594619	2016-03-31 16:32:40.153444	\N		Cjal Daniela Miranda				\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4418	5	Proyecto de Ordenanza: Solicita Condonaciòn EMOS  A.R.C.I..D	\N	\N	\N	 Convertida en Expediente Legislativo Nº 23187, Tratado en sesión Nº 176, con fecha 10/3 /2016.	Peticion	2016-03-08 13:38:53.426273	2016-03-31 16:38:11.67986	\N	Secretaria del Concejo Deliberante	Concejal Hipolito Ontivero				\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4411	2	Solicita una ayuda economica urgente por ser madre solltera de dos hijos y no tener para alquiler ni solventar sus gastos basicos.	\N	\N	\N		Peticion	2016-03-08 13:23:34.998002	2016-03-08 14:46:10.536344	\N		Analia Ponce	Ituzaingo 1359	0358-154843687		\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4413	2	Proyecto de Ordenanza:Solicita Otorgar al Sr. Gabriel Eduardo Reina un aporte ecònomico que seràn destinados al ervento "Futuros Locales"	\N	\N	\N	 Convertida en Expediente Legislativo Nº 23184, Tratado en sesión Nº 176, con fecha 10/3 /2016.	Peticion	2016-03-08 13:25:49.078701	2016-03-31 16:34:37.469447	\N	Secretaria del Concejo Deliberante	Concejal Mauricio Dova				\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4420	\N	\N	\N	\N	\N	convertido en Expte Legislativo Nº 23181 Sesión Ordinaria 176 de fecha 10-3-16	Despacho	2016-03-08 13:52:49.222787	2016-04-01 13:51:57.957216	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	2016-03-08
4421	3	\N	\N	\N	\N	convertido en Expte Legislativo Nº 23182 Sesión Ordinaria 176 de fecha 10-3-16	Despacho	2016-03-08 13:54:36.173759	2016-04-01 13:53:10.194271	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	2016-03-08
4422	\N	\N	\N	\N	\N	convertido en Expte Legislativo Nº 23183 Sesión Ordinaria 176 de fecha 10-3-16	Despacho	2016-03-08 13:56:54.761474	2016-04-01 13:54:31.200287	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4432	9	Solicita Eximiciòn - Condonaciòn Impuesto Immobiliario	\N	\N	\N		Condonacion	2016-03-08 15:19:22.981829	2016-03-08 15:57:21.663284	\N	\N	Iglesias Omar Lorenzo	Azopardo 333	4660082		\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4431	\N	\N	\N	\N	\N		Despacho	2016-03-08 15:04:06.268087	2016-03-08 16:29:26.890385	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-03-03
4430	\N	\N	\N	\N	\N		Despacho	2016-03-08 15:01:05.07911	2016-03-08 16:32:07.078734	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-03-03
4415	1	Declarar de Interes General el evento de artes marciales denominado "Futuros Locales"	\N	\N	\N	 Convertida en Expediente Legislativo Nº 23186, Tratado en sesión Nº 176, con fecha 10/3 /2016.	Peticion	2016-03-08 13:31:46.719925	2016-03-31 16:35:27.577297	\N	Secretaria del Concejo Deliberante	Concejal Mauricio Dova				\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4433	4	Exp 23191 -Proyecto de Ordenanza disponiendo de manera excepcional y por Ùnica vez la conformaciòn de la Junta Electoral Municipal	\N	\N	\N		Peticion	2016-03-09 10:30:08.78818	2016-03-09 10:54:14.765669	\N	Secretaria del Concejo Deliberante	DEM - Juan Ruben Jure - Ab. Ignacio Fernandez - Cdora. Maria Alicia Panza				\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4439	2	Resoluciòn 014/16-D, emanada del Directorio del EMOS - Còdigo Tributario Municipal	\N	\N	\N	Convertida en Expediente Legislativo Nº 23208, Tratado en sesión Nº 176, con fecha 10/3 /2016.	Peticion	2016-03-09 13:38:51.671514	2016-03-31 16:44:44.428732	\N	Secretaria del Concejo Deliberante	DEM - Juan Ruben Jure - Jorge Alejandro Mendez - Cdora. Maria Alicia Panza				\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4440	\N	\N	\N	\N	\N		Despacho	2016-03-09 13:47:18.737245	2016-03-10 10:56:19.680991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-03-07
4450	\N	\N	\N	\N	\N		Despacho	2016-03-09 14:39:17.83896	2016-03-10 11:13:23.442078	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-03-09
4458	\N	\N	\N	\N	\N		Despacho	2016-03-09 15:21:05.992016	2016-03-10 11:18:26.738461	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-03-09
4448	\N	\N	\N	\N	\N		Despacho	2016-03-09 14:35:59.439833	2016-03-10 11:58:58.706751	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-03-09
4454	\N	\N	\N	\N	\N		Despacho	2016-03-09 14:47:02.241529	2016-03-10 12:13:30.474771	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-03-09
4446	\N	\N	\N	\N	\N		Despacho	2016-03-09 14:32:12.944396	2016-03-10 12:21:23.189637	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-03-09
4449	\N	\N	\N	\N	\N		Despacho	2016-03-09 14:37:36.889524	2016-03-10 12:26:57.128146	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-03-09
4419	17	Solicita Eximiciòn impuesto Inmobiliario Año 2016	\N	\N	\N	convertida en Expediente Legislativo Nº 23195 ,tratada en sesión Nº 176, con fecha 10/3/2016	Condonacion	2016-03-08 13:48:00.621283	2016-04-01 11:49:21.701654	\N	\N	Olmedo Roberto	Capayanes 2307 - Jardin Norte	358 - 155106991		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4751	4	Solicita ayuda economica de $4.700 (cuatro mil setecientos) para poder comprar un material de recubrimiento interior y exterior de un carrito que usa para poder producir productos de panificacion y asi solventar la economia fliar. adjunta presupuesto.	\N	\N	\N		Peticion	2016-04-19 13:32:17.708246	2016-04-25 16:07:27.92675	\N	Secretaria del Concejo Deliberante	Daniel Gutierrez Sosa	Dr Carlos Rodriguez 1408	0358-154388277		\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4806	1	Nota solicitando sonido para la realizacion del evento programado para el dia 21 de mayo a las 21 hs.	\N	\N	\N		Peticion	2016-04-26 12:28:53.324534	2016-04-26 13:01:35.151819	\N		Juntando Afectos. Asociacion Civil.	Trabajo y Prevision 930	0358-155075287		\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4470	1	Solicita 1 Pasaje de Ida y 1 de Regreso hacia la Ciudad de Còrdoba para llevar a su hija por razones de salud	\N	\N	\N		Peticion	2016-03-11 14:44:08.858008	2016-03-11 16:00:07.807889	\N	Secretaria del Concejo Deliberante	Barrionuevo  Lorena Barrionuevo		358 - 154209275		\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4423	2	Proyecto de Resolucion, Solicitar a la Secretaria de Desarrollo Urbano, Obras y Servicios Publicos, sr Jorge Mendez, y por su intrmedio a quien corresponda: arreglo de alumbrado publico en las calles Humahuaca del 0 al 100, Cordoba del 200 al 300. retiro inmediato del vehiculo existente en la calle Humahuaca del 0 al 100. Reparacion de la calle Humahuaca del 0 al 100.	\N	\N	\N	 Convertida en Expediente Legislativo Nº 23174, Tratado en sesión Nº 176, con fecha 10/3 /2016.	Peticion	2016-03-08 14:03:16.205032	2016-03-31 16:23:56.654559	\N		Cjal Leticia Pauluzzi ( Bloque Union Por Cba)				\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4414	2	Proyecto de Ordenanza:Solicitar al Secretario Desarrollo Urbano, Obras y Servicios Pùblicos. tenga a bien proceder a la inmediata intervenciòn y arreglo de la calle denominada Pasaje Señorita Cejas a la altura del 900 	\N	\N	\N	 Convertida en Expediente Legislativo Nº 23185, Tratado en sesión Nº 176, con fecha 10/3 /2016.	Peticion	2016-03-08 13:28:30.823325	2016-03-31 16:35:02.212811	\N	Secretaria del Concejo Deliberante	Concejal Mauricio Dova				\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4443	2	Solicita ayuda ecònomica que les permita solventar gastos que son parte de un evento a realizarse el dìa 22 de Mayo 2016	\N	\N	\N	convertido en Expte Legislativo Nº 23203 Sesión Ordinaria 176 de fecha 10-3-16	Peticion	2016-03-09 14:07:28.627323	2016-04-01 13:59:18.970607	\N	Secretaria del Concejo Deliberante	Sr Dario Allende - Escuela de Taekwondo  I.T.F Miong - Chon		 358 -155081905 - 358 - 155607516		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4468	19	Solicita Eximiciòn Año 2016 Impuesto Inmobiliario	\N	\N	\N	convertida en Expediente Legislativo Nº 23215 ,tratada en sesión Nº 177, con fecha 17/3/2016	Condonacion	2016-03-11 13:07:09.104081	2016-04-04 11:17:48.461131	\N	\N	DelBorgo Mariana del Valle	Liniers 1936	358 - 155603495		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4467	9	Solicita Eximiciòn - Condonaciòn Impuesto Inmobiliario	\N	\N	\N	convertida en Expediente Legislativo Nº 23216 ,tratada en sesión Nº 177, con fecha 17/3/2016	Condonacion	2016-03-11 12:47:27.312076	2016-04-04 11:18:06.788459	\N	\N	Leyes Ricardo Alberto	Pte. Jhon Kennedy  563	358 - 154237148		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4464	10	Solicita Eximiciòn - Condonaciòn - Impuesto Inmobiliario	\N	\N	\N	convertida en Expediente Legislativo Nº 23219 ,tratada en sesión Nº 177, con fecha 17/3/2016	Condonacion	2016-03-11 12:27:17.800353	2016-04-04 11:19:47.772787	\N	\N	Tapia Ester Lucinda	Anibal Ponce 494	358- 154316911 - 4664526		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4808	14	Solicita Eximiciòn Impuesto Patente	\N	\N	\N	Expediente Legislativo Nº 23433- iniciado en Sesión Ordinaria Nº 183 de fecha 5/5/16	Condonacion	2016-04-26 15:39:41.262935	2016-05-04 13:42:38.707879	\N	\N	Porreca Andrea Noemi	Trabajo y Previsiòn 831	358 -156023351		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4809	3	Solicita pasaje (uno ida y vuelta a ciudad de Bs As) en calidad de Vice presidenta de la "Asociacion Civil Regional Amateur de Hockey sobre cesped y pistas del Sur de Cba.	\N	\N	\N		Peticion	2016-04-26 15:46:30.521883	2016-04-26 15:46:30.521883	\N		Alejandra Martini				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4810	10	Solicita dos pasajes (ida y vuelta) a ciudad de Cordoba para la sra Barrionuevo Norma Mabel por problemas de salud.	\N	\N	\N		Peticion	2016-04-27 11:32:24.382645	2016-04-27 12:00:51.510372	\N		Cjal Olga Ysabel Cantoro				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4811	43	Solicita ayuda economica por delicados problemas de salud de su marido quien fue herido de arma blanca y debio someterse a multiples cirugias.	\N	\N	\N	Expediente Legislativo Nº 23435- iniciado en Sesión Ordinaria Nº 183 de fecha 5/5/16	Peticion	2016-04-27 11:36:11.952856	2016-05-04 13:43:20.428128	\N		Baro Ana Laura	Cuba 540	0358-4852193		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4819	11	Solicita Eximiciòn - Condonaciòn Impuesto Inmobiliario	\N	\N	\N	Expediente Legislativo Nº 23437- iniciado en Sesión Ordinaria Nº 183 de fecha 5/5/16	Condonacion	2016-04-27 13:39:27.616844	2016-05-04 13:43:59.277812	\N	\N	Arcostanzo Marcela Alejandra	Francisco Zarco 1134	358 - 155045622		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4820	2	\N	\N	\N	\N		Despacho	2016-04-27 14:21:59.185001	2016-04-27 16:07:07.459034	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-04-27
4807	18	Solicita Eximiciòn Condonaciòn Impuesto Inmobiliario	\N	\N	\N	Expediente Legislativo Nº 23432- iniciado en Sesión Ordinaria Nº 183 de fecha 5/5/16	Condonacion	2016-04-26 13:04:14.741755	2016-05-04 13:42:23.443803	\N	\N	Agis Marta Noemi	Vicecomodoro Marambio 110 116	358- 4385689		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4434	2	Exp-  23192 Proyecto de Ordenanza contratando en forma directa los servicios Profesionales del Cdor. Roberto Darìo Garcia para que se desempeñe en la Junta Electoral Municipal	\N	\N	\N		Peticion	2016-03-09 10:37:02.170609	2016-03-09 10:51:06.366288	\N	Secretaria del Concejo Deliberante	DEM - Juan Ruben Jure - Ab. Ignacio Fernandez - Cdora. Maria Alicia Panza				\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4462	26	Solicita Eximiciòn - Condonaciòn Impuesto Inmobiliario	\N	\N	\N	convertida en Expediente Legislativo Nº 23212 ,tratada en sesión Nº 177, con fecha 17/3/2016	Condonacion	2016-03-10 14:08:02.253157	2016-04-01 14:05:17.663721	\N	\N	Schmndt Teresa	Olegario Andrade 152	358 - 154025505		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4438	2	Proyecto de Ordenanza por la que se contrata a la Lic. en Psicologia Ana Carolina Roffe para que se desempeñe dentro del Sistema de Salud Municipal\r\nAnexo 27 copias-	\N	\N	\N	Convertida en Expediente Legislativo Nº 23209, Tratado en sesión Nº 176, con fecha 10/3 /2016.	Peticion	2016-03-09 13:36:05.312239	2016-03-31 16:45:18.217851	\N	Secretaria del Concejo Deliberante	DEM - Juan Ruben Jure -  Cdora. Marìa Alicia Panza - Dr. Gabriel Abrile				\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4435	17	Solicita Eximiciòn - Condonaciòn  Impuesto Inmobiliario	\N	\N	\N	convertida en Expediente Legislativo Nº 23204 ,tratada en sesión Nº 176, con fecha 10/3/2016	Condonacion	2016-03-09 11:43:00.161916	2016-04-01 11:51:23.72382	\N	\N	Ferrero Roberto Josè	Liniers 275	358 - 154868600		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4444	\N	Solicitan se trate Exp. 22815 iniciado en el Departamento Ejecutivo Municipal, y se raklize un pase urgente a la Comisiòn de Planificaciòn  y Desarrollo Sustentable	\N	\N	\N		Peticion	2016-03-09 14:28:49.591242	2016-03-09 14:28:49.591242	\N		A la Comisiòn de Labor - Firmado por Vecinos				\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4459	11	Solicitan adjuntar al  Exp 22828/15 la Resoluciòn de personeria Juridica y Estatuto Social de Fundaciòn KDI - Kartodromo del Imperio	\N	\N	\N		Peticion	2016-03-09 15:25:09.464667	2016-03-09 15:54:53.876107	\N	Secretaria del Concejo Deliberante	Fundaciòn KDI	Bv. Circunvalaciòn Oeste s/n - Domicilio postal Josè Màrmol Norte 229			\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4460	15	Solicita Eximiciòn Condonaciòn Impuesto Inmobiliario	\N	\N	\N	convertida en Expediente Legislativo Nº 23213 ,tratada en sesión Nº 177, con fecha 17/3/2016	Condonacion	2016-03-10 12:39:00.067812	2016-04-04 11:16:47.419796	\N	\N	Gomez Juan Carlos	Tristan Burgos 512	358 - 155064529		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4457	1	Proyecto de Ordenanza. Modificase el articulo Nº 1 de la ordenanza 1090/15	\N	\N	\N		Peticion	2016-03-09 15:13:54.325734	2016-03-09 16:28:30.484767	\N		Comisiòn de Economia y Presupuesto				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4455	\N	\N	\N	\N	\N		Despacho	2016-03-09 14:49:21.97135	2016-03-10 10:49:05.267733	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-03-09
4456	\N	\N	\N	\N	\N		Despacho	2016-03-09 14:52:10.652677	2016-03-10 10:51:53.680385	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-03-09
4441	\N	\N	\N	\N	\N		Despacho	2016-03-09 13:49:25.600771	2016-03-10 11:02:36.402262	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-03-07
4442	\N	\N	\N	\N	\N		Despacho	2016-03-09 13:51:27.954743	2016-03-10 11:08:20.505808	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-03-07
4451	\N	\N	\N	\N	\N		Despacho	2016-03-09 14:41:45.40407	2016-03-10 11:11:14.120976	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-03-09
4452	\N	\N	\N	\N	\N		Despacho	2016-03-09 14:43:26.171664	2016-03-10 11:16:05.817274	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-03-09
4447	\N	\N	\N	\N	\N		Despacho	2016-03-09 14:34:17.315334	2016-03-10 11:54:40.403103	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-03-09
4453	\N	\N	\N	\N	\N		Despacho	2016-03-09 14:45:09.044467	2016-03-10 12:17:26.538329	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-03-09
4472	1	Pasaje de  Ida y Otro de Regreso a la Ciudad de Còrdoba por razones de salud 	\N	\N	\N		Peticion	2016-03-11 15:11:20.5808	2016-03-11 15:54:45.886995	\N	Contaduria Concejo Deliberante	Pinto Juan Josè	Colombia 1003			\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4461	\N	30 Boletines Oficiales Nº 356	\N	\N	\N		Peticion	2016-03-10 13:06:21.226768	2016-03-10 13:06:21.226768	\N	Archivo del Concejo	DEM				\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4475	21	Solicita Eximiciòn Año 2016 Impuesto Inmobiliario	\N	\N	\N	convertida en Expediente Legislativo Nº 23223 ,tratada en sesión Nº 177, con fecha 17/3/2016	Condonacion	2016-03-14 12:10:39.264883	2016-04-04 11:23:14.362895	\N	\N	Gagliardo Silvia Esther	Maipù 1209	No Tiene		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4465	15	Solicita Eximiciòn - Condonaciòn I,puesto Inmobiliario	\N	\N	\N	convertida en Expediente Legislativo Nº 23214 ,tratada en sesión Nº 177, con fecha 17/3/2016	Condonacion	2016-03-11 12:32:03.051281	2016-04-04 11:17:15.811243	\N	\N	Gomez Eba Zenobia Eulalia	Vicente Lopez y Planes 565	358 - 155004964		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4445	\N	\N	\N	\N	\N		Despacho	2016-03-09 14:30:34.056328	2016-03-10 14:55:38.409763	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-03-09
4812	14	Solicita pasaje (uno) de ida y vuelta a ciudad de Bs As para la sra Silvina Nonino para el dia 2 de mayo del cte por motivos de salud.	\N	\N	\N		Peticion	2016-04-27 12:25:00.132356	2016-04-27 12:27:36.858194	\N		Cejal Guillermo Natali				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4466	17	Solicita Eximiciòn Condonaciòn Impuesto Inmobiliario	\N	\N	\N	convertida en Expediente Legislativo Nº 23218 ,tratada en sesión Nº 177, con fecha 17/3/2016	Condonacion	2016-03-11 12:41:32.566404	2016-04-04 11:19:04.158515	\N	\N	Rodriguez Maria Graciela 	Tomas Manuel Anchorena 658	358 - 154245650		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4473	11	Solicita Eximiciòn Año 2016	\N	\N	\N	convertida en Expediente Legislativo Nº 23220 ,tratada en sesión Nº 177, con fecha 17/3/2016	Condonacion	2016-03-11 15:45:30.242827	2016-04-04 11:20:56.576636	\N	\N	Chanique Patricia Alejandra	Neuquen 1082	4655049		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4474	\N	Solicita 1 pasaje de Ida y otro de Regreso hacia la Ciudad de Buenos Aires por razones de Salud	\N	\N	\N		Peticion	2016-03-14 11:49:25.501846	2016-03-14 12:05:15.933359	\N	Contaduria Concejo Deliberante	Sra. Gabriela Eulalia Aguirre		4701050		\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4476	8	Solicita Eximiciòn Impuesto Inmobiliario Año 2016	\N	\N	\N	convertida en Expediente Legislativo Nº 23224 ,tratada en sesión Nº 177, con fecha 17/3/2016	Condonacion	2016-03-14 12:58:41.488496	2016-04-04 11:24:10.436381	\N	\N	Tejada Teresa Nancy	Bolivia 312	358 - 154862690		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4482	18	Solicita Eximiciòn - Condonaciòn Impuesto Inmobiliario	\N	\N	\N	convertida en Expediente Legislativo Nº 23228 ,tratada en sesión Nº 177, con fecha 17/3/2016	Condonacion	2016-03-14 14:21:45.290068	2016-04-04 11:25:51.814953	\N	\N	De Haes Mario	Dinkeldein 3200	4701069		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4477	7	Solicita ayuda economica para la compra de nebulizador para uso de sus cuatro hijos.	\N	\N	\N		Peticion	2016-03-14 13:17:43.084628	2016-03-14 13:45:15.986801	\N		Andrea Gonzales	Leandro Alem 1096	0358-154854747		\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4484	1	Solicitan la Reparaciòn del Monumento a las victimas RioCuartenses del Terrorismo de Estado, ubicado en la esquina de Sobremonte y Pedernera	\N	\N	\N		Peticion	2016-03-14 14:39:57.200451	2016-03-14 14:46:22.251768	\N	Secretaria del Concejo Deliberante	Multisectorial Por los Derechos Humanos		358 - 155140363 - 358 - 154680280		\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4436	2	Proyecto de Ordenanza por el que se Exime y Condona los Impuestos correspondientes a la Contribuciòn sobre los Inmuebles donde funciona la copa de leche" Rinconcito de los Olvidados"	\N	\N	\N	 Convertida en Expediente Legislativo Nº 23205, Tratado en sesión Nº 176, con fecha 10/3 /2016.	Peticion	2016-03-09 13:24:09.156135	2016-03-31 16:42:03.747498	\N	Secretaria del Concejo Deliberante	DEM - Juan Ruben Jure -  Cdora. Marìa Alicia Panza				\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4481	\N	 Ordenanzas:  1347/16 - 1354/16 - 3430/16- 3431/16- 3432/16- Decretos 3433/16, 3434/16, 3435/16, 3436/16, 3437/16, 3440/16, 344/16, 3445/16, 3446/16, 3448/16,3449/16.	\N	\N	\N		Peticion	2016-03-14 14:16:18.584748	2016-03-14 15:57:05.581268	\N		DEM				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4492	8	Proyecto de Ordenanza: Solicita ayuda ecònomica destinados a la Sra. Noemi Falcòn para afrontar gastos varios 	\N	\N	\N	convertida en Expediente Legislativo Nº 23240 ,tratada en sesión Nº 177, con fecha 17/3/2016	Peticion	2016-03-15 14:09:49.470432	2016-04-04 11:45:19.320355	\N	Secretaria del Concejo Deliberante	Concejal Leticia Paulizzi	Antartida Argentina 1075	358 - 156020693		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4491	6	Proyecto de Ordenanza : Solicita  ayuda ecònomica destinados a la Sra. Ivana Moya para afrontar gastos de primera necesidad 	\N	\N	\N	convertida en Expediente Legislativo Nº 23239 ,tratada en sesión Nº 177, con fecha 17/3/2016	Peticion	2016-03-15 14:06:51.820464	2016-04-04 11:46:14.228291	\N	Secretaria del Concejo Deliberante	Concejal Leticia Paulizzi	Antartida Argentina 1041	358 - 155105724		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4816	2	Solicita tres (3) pasajes a Piedra del Aguila, Neuquen para la sra Maria Rosa Lucero y su flia.	\N	\N	\N		Peticion	2016-04-27 13:10:28.130629	2016-04-27 13:19:43.682013	\N		Guillermo Luis De Rivas. Defensor Del Pueblo				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4506	4	Proyecto de Resolución: por el cùal se solicita instar a los partidos politicos que participen en las elecciones  de Intendente; Concejales y Tribunos de Cuenta de la Ciudad de Rìo Cuarto a que demuestren el origen de los fondos de sus respectivas campañas Electorales tanto en las eleccciones generales como en sus procesos internos de selecciòn de Candidatos	\N	\N	\N	convertida en Expediente Legislativo Nº 23244 ,tratada en sesión Nº 177, con fecha 17/3/2016	Peticion	2016-03-16 14:46:30.144915	2016-04-04 11:50:20.849142	\N	Secretaria del Concejo Deliberante	Concejal Maria del Carmen Cabral  - Concejal Carlos Josè Gaso				\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4507	\N	Solicita ayuda economica por motivos de salud.	\N	\N	\N	convertida en Expediente Legislativo Nº 23246 ,tratada en sesión Nº 177, con fecha 17/3/2016	Peticion	2016-03-16 15:05:31.476294	2016-04-04 11:51:56.889576	\N		Pedro Arballo	Simon Borardo 950	0358-4700586		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4524	9	Solicita ayuda economica por salud de su hija de un año y dos meses de edad.	\N	\N	\N	convertida en Expediente Legislativo Nº 23260 ,tratada en sesión Nº 178, con fecha 23/3/2016	Peticion	2016-03-17 14:01:39.35055	2016-04-06 11:16:27.1732	\N		Agostina del Rosario Carena	11 de noviembre 1245	tel 4727490. Cel 0358-155622436		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4498	\N	Solicita ayuda economica por problema de salud.	\N	\N	\N	convertida en Expediente Legislativo Nº 23242 ,tratada en sesión Nº 177, con fecha 17/3/2016	Peticion	2016-03-15 16:07:55.293851	2016-04-04 12:33:53.830123	\N		Eduardo Jose Mansilla	Pedernera 317	0358-154843114		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4500	\N	Solicita 2 Pasajes de Ida y 2 de Regreso hacia la Ciudad de Còrdoba  parala Sra Silvina Andrea Colombo y su hijo Santiago  Eugenio Ouin	\N	\N	\N		Peticion	2016-03-16 12:56:04.890928	2016-03-16 12:56:04.890928	\N	Contaduria Concejo Deliberante	Concejal Guillermo Natali				\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4502	2	\N	\N	\N	\N		Despacho	2016-03-16 13:26:22.253864	2016-03-16 13:53:16.095886	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-03-16
4511	6	Proyecto de Ordenanza: Otorguese a la sra  Luciana Yvana Petroff un aporte economico de 2.200 pesos para la compra de cristales organicos.\r\n	\N	\N	\N	convertida en Expediente Legislativo Nº 23250 ,tratada en sesión Nº 177, con fecha 17/3/2016	Peticion	2016-03-16 15:28:57.788191	2016-04-04 11:56:03.781221	\N		Cjal Daniela Miranda				\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4516	\N	Solicita Pasajes dos de ida y dos de vuelta a Ciudad de Cba por problemas de salud de su hijo.	\N	\N	\N		Peticion	2016-03-16 15:48:55.565488	2016-03-16 15:57:09.046388	\N		Maria Cristina Dasso	Lopez de Vega1521 Bda Norte)	0358-154201865		\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4533	\N	Solicita Pasajes (ida y vuelta) a la ciudad de Cba por motivos de salud.	\N	\N	\N		Peticion	2016-03-18 12:35:43.154886	2016-03-18 12:48:01.055552	\N		Florencio Antonio Maidana.		0358-4680146		\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4522	31	Solicita Eximiciòn - Condonaciòn Impuesto Inmobiliario	\N	\N	\N	convertida en Expediente Legislativo Nº 23258 ,tratada en sesión Nº 178, con fecha 23/3/2016	Condonacion	2016-03-17 12:36:02.453375	2016-04-04 15:32:03.048037	\N	\N	Firmapaz Miguel Angel	Tomas Guido 371	4647812		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4531	12	Eximicion-Condonacion Emos, inmobiliario, cementerio.	\N	\N	\N	convertida en Expediente Legislativo Nº 23266 ,tratada en sesión Nº 178, con fecha 23/3/2016	Condonacion	2016-03-17 16:07:16.135813	2016-04-04 16:08:54.378353	\N	\N	Maldonado Yolanda	Pje Atenas 714	0358-154112809		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4515	1	\N	\N	\N	\N		Despacho	2016-03-16 15:47:52.703407	2016-03-17 11:05:19.506887	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-03-16
4497	1	Solicita ayuda ecònomica	\N	\N	\N	el dia 06/04/2016  se le informa a la Biblioteca que dicho pedido deberà realizarlo en la misma Municipalidad para solicitar Subsidio mensual	Peticion	2016-03-15 15:14:34.789546	2016-04-06 14:07:32.489564	\N	Secretaria del Concejo Deliberante	Biblioteca Popular Mariano Moreno	Sobremonte 1079 / 1081	358 - 4646835		\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4534	2	Copia de la Resolucion Nº 1/16 de la Subsecretaria de Recursos Humanos, solicitando notifique el contenido de la misma a todo el  personal Municipal que de Ud. depende.	\N	\N	\N		Peticion	2016-03-18 13:59:05.758619	2016-03-18 15:08:12.58657	\N		Graciela Lunardi (Subdirectora Gral Interina) Subse cretaria de Recursos Humanos.				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4479	11	Solicita Eximiciòn - Condonaciòn Impuesto Inmobiliario	\N	\N	\N	convertida en Expediente Legislativo Nº 23226 ,tratada en sesión Nº 177, con fecha 17/3/2016	Condonacion	2016-03-14 14:06:51.020175	2016-04-04 11:24:57.933055	\N	\N	Ojeda Maria Ines	Almirante Bronw 1087	358 - 155146722		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4489	21	Solicita Eximiciòn - Condonaciòn Impuesto Inmobiliario	\N	\N	\N	convertida en Expediente Legislativo Nº 23236 ,tratada en sesión Nº 177, con fecha 17/3/2016	Condonacion	2016-03-15 13:47:49.975293	2016-04-04 11:32:36.735284	\N	\N	Caseros Eduardo Raùl	Las Heras 669	358 - 154861282		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4490	7	Solicita ayuda economica por motivos de salud graves de su padre.	\N	\N	\N	convertida en Expediente Legislativo Nº 23235 ,tratada en sesión Nº 177, con fecha 17/3/2016	Peticion	2016-03-15 14:00:16.878614	2016-04-04 11:40:33.598856	\N		Veronica del Valle Ponce	Pje Publico 2265- Carlos Mojica. 130 viviendas.	0358-154344463		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4494	1	Considere la designacion del Subdirector Gral de Transito y Transporte EDECOM y Subdirector Gral de Transito y Relaciones con la Comunidad EDECOM.	\N	\N	\N	convertida en Expediente Legislativo Nº 23238 ,tratada en sesión Nº 177, con fecha 17/3/2016	Peticion	2016-03-15 14:44:05.065464	2016-04-04 11:41:36.911147	\N		Asociacion Trabajadores del Estado (Javier Murua Secretario Gremial A.T.E.), Walter Avalos Secretario Gral A.T.E., Rafaela Claudia Alcoba Secretaria Gral Adjunta A.T.E.)	Cabrera 467	0358-4622555		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4822	5	\N	\N	\N	\N		Despacho	2016-04-27 15:30:02.12708	2016-04-27 15:57:48.221225	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-04-26
4817	1	Solicitan Condonaciòn cuotas correspondientes a Plan de Vivienda Municipal	\N	\N	\N	Expediente Legislativo Nº 23451- iniciado en Sesión Ordinaria Nº 183 de fecha 5/5/16	Peticion	2016-04-27 13:19:00.389088	2016-05-04 13:49:00.277325	\N	Secretaria del Concejo Deliberante	Vecinos Plan de Viviendas Guarniciòn Aèrea 	Apastamas 2076	358. 156007617		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4487	5	Solicita ayuda economica por problemas de salud.	\N	\N	\N	convertida en Expediente Legislativo Nº 23234 ,tratada en sesión Nº 177, con fecha 17/3/2016	Peticion	2016-03-15 12:30:53.442959	2016-04-04 11:39:24.139401	\N		Sheila Bravo	Guatemala 123	0358-154247568		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4825	4	\N	\N	\N	\N		Despacho	2016-04-27 15:35:16.294711	2016-04-27 15:49:33.807947	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-04-26
4495	14	Proyecto de Ordenanza solicitando ayuda ecònomica destinados al Sr. Rodriguez Claudio	\N	\N	\N	convertida en Expediente Legislativo Nº 23237 ,tratada en sesión Nº 177, con fecha 17/3/2016	Peticion	2016-03-15 14:46:23.511375	2016-04-04 11:41:09.572258	\N	Secretaria del Concejo Deliberante	Concejal Carlos Josè Gazzo		358 - 156015853		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4493	18	Solicita Eximiciòn - Condonaciòn Impuesto Inmobiliario	\N	\N	\N	convertida en Expediente Legislativo Nº 23241 ,tratada en sesión Nº 177, con fecha 17/3/2016	Condonacion	2016-03-15 14:14:37.131833	2016-04-04 11:33:26.59644	\N	\N	Bufrini Jorge Carlos	Matias Nolasco 387	4632263		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4521	18	Solicita Eximiciòn . Condonaciòn  Impuesto  Inmobiliario - EMOS	\N	\N	\N	convertida en Expediente Legislativo Nº 23257 ,tratada en sesión Nº 178, con fecha 23/3/2016	Condonacion	2016-03-17 11:46:25.591279	2016-04-04 15:31:12.336086	\N	\N	Rocha Magdalena del Valle	Manuel Sarfield 307	358 - 154283780		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4517	1	\N	\N	\N	\N		Despacho	2016-03-16 15:52:24.588284	2016-03-16 16:29:19.204526	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-03-16
4509	\N	Proyecto de Ordenanza	\N	\N	\N	convertida en Expediente Legislativo Nº 23248 ,tratada en sesión Nº 177, con fecha 17/3/2016	Peticion	2016-03-16 15:20:42.466663	2016-04-04 11:55:01.69786	\N	Secretaria del Concejo Deliberante	DEM - Juan Ruben Jure - Ab. Ignacio Fernandez - Cdora. Maria Alicia Panza				\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4514	8	Solicita ayuda economica para su hijo Axel Gabriel Flores por motivos de salud.	\N	\N	\N	convertida en Expediente Legislativo Nº 23245 ,tratada en sesión Nº 177, con fecha 17/3/2016	Peticion	2016-03-16 15:43:46.021932	2016-04-04 11:51:19.9244	\N		Marìa Cristina Dasso	Lopez de Vega 1521	0358-154201865		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4518	\N	Proyecto de Ordenanza: Sobre Multiplicaciòn de los Microbasurales 	\N	\N	\N	convertida en Expediente Legislativo Nº 23252 ,tratada en sesión Nº 177, con fecha 17/3/2016	Peticion	2016-03-16 15:58:55.586064	2016-04-04 12:28:01.450532	\N		Concejal Leticia Perez				\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4510	13	Proyecto de Ordenanza: otorgar ala sra Figueroa Silvina del Carmen un porte economico de dos mil pesos que seran destinados a cubrir gastos de primera nesesidad.	\N	\N	\N	convertida en Expediente Legislativo Nº 23249 ,tratada en sesión Nº 177, con fecha 17/3/2016	Peticion	2016-03-16 15:27:47.612174	2016-04-04 11:55:28.068834	\N		Cjal Daniela Miranda				\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4496	13	Solicita Eximiciòn Condonaciòn Impuesto Inmobiliario	\N	\N	\N	convertida en Expediente Legislativo Nº 23243 ,tratada en sesión Nº 177, con fecha 17/3/2016	Condonacion	2016-03-15 15:09:18.461982	2016-04-04 11:34:03.28802	\N	\N	Tozzelli Haydee Marìa 	Sanchez de Bustamente 2829	358 - 154349513		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4499	3	Remiten copia del Acuerdo Nº1 36/2016, dictado por esta càmara Federal de Apelaciones, para su conocimiento y a sus efectos	\N	\N	\N		Peticion	2016-03-15 16:13:45.082592	2016-03-15 16:13:45.082592	\N	Secretaria del Concejo Deliberante	Poder Judicial de la Naciòn				\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4503	2	\N	\N	\N	\N		Despacho	2016-03-16 13:27:52.83781	2016-03-16 13:32:59.973666	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-03-16
4501	\N	Solicita 1 Pasaje de Ida  hacia la Ciudad de Buenos Aires  al  Sr. Vera Juan  Carlos  por  razones de Salud	\N	\N	\N		Peticion	2016-03-16 13:07:52.266712	2016-03-16 14:53:00.898108	\N		Concejal Daniela Miranda				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4821	4	\N	\N	\N	\N		Despacho	2016-04-27 15:28:23.140948	2016-04-27 16:04:26.664069	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-04-26
4526	12	Solicita Eximiciòn - Condonaciòn  Impuesto Inmobiliario	\N	\N	\N	convertida en Expediente Legislativo Nº 23262 ,tratada en sesión Nº 178, con fecha 23/3/2016	Condonacion	2016-03-17 14:29:16.535807	2016-04-04 16:06:44.00312	\N	\N	Utrilla Nancy Gladys	Dinkeldein 2212	358 - 4122458		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4512	2	Declaraciòn: Repudio al golpe de Estado del 24 de Marzo de 1976	\N	\N	\N	convertida en Expediente Legislativo Nº 23251 ,tratada en sesión Nº 177, con fecha 17/3/2016	Peticion	2016-03-16 15:29:45.215015	2016-04-04 12:27:33.444418	\N	Secretaria del Concejo Deliberante	Cocejal Francisco  Varela Geuna  - Concejal  Viviana  Andrea Yawny				\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4513	1	\N	\N	\N	\N		Despacho	2016-03-16 15:31:49.631606	2016-03-16 15:41:40.184742	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-03-16
4519	\N	Solicita ayuda economica por salud de su hijo.	\N	\N	\N	convertida en Expediente Legislativo Nº 23253 ,tratada en sesión Nº 177, con fecha 17/3/2016	Peticion	2016-03-16 16:16:50.589949	2016-04-04 12:28:51.587734	\N		Ivana Lorena Pascuini 8Claudio Miranda)	Dr Carlos Rodriguez 1340			\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4504	1	\N	\N	\N	\N		Despacho	2016-03-16 14:33:57.691078	2016-03-17 11:09:14.893255	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-03-15
4505	1	\N	\N	\N	\N		Despacho	2016-03-16 14:35:44.080742	2016-03-17 11:11:04.306461	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-03-15
4520	13	Solicita Eximiciòn Impuesto Inmobiliario año 2016	\N	\N	\N	convertida en Expediente Legislativo Nº 23256 ,tratada en sesión Nº 178, con fecha 23/3/2016	Condonacion	2016-03-17 11:27:34.49761	2016-04-04 15:26:44.551712	\N	\N	Rigo Pedro Bartolomé	Carlos Gardel 1279	358 - 4629476		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4525	17	Eximiciòn - Condonaciòn Impuesto Inmobiliario	\N	\N	\N	convertida en Expediente Legislativo Nº 23261 ,tratada en sesión Nº 178, con fecha 23/3/2016	Condonacion	2016-03-17 14:19:49.855707	2016-04-04 16:06:04.622292	\N	\N	Zapata Rosa de las Mercedes	Once de Noviembre 647	358 -154110945		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4562	23	Solicitan Eximiciòn Condonaciòn Impuesto de EMOS 	\N	\N	\N	convertida en Expediente Legislativo Nº 23291 ,tratada en sesión Nº 179, con fecha 31/3/2016	Peticion	2016-03-28 12:40:56.370444	2016-04-06 13:47:23.64098	\N	Secretaria del Concejo Deliberante	Asociaciòn Jubilados Pensionados y Retirados Justicialistas Rìo Cuarto	General Paz 337	4635771		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4528	13	Solicita eximicion Inmobiliario	\N	\N	\N	convertida en Expediente Legislativo Nº 23264 ,tratada en sesión Nº 178, con fecha 23/3/2016	Condonacion	2016-03-17 15:21:40.564414	2016-04-04 16:08:06.253062	\N	\N	Tognetti Mirtha Eve	Rivadavia 970	4651794		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4527	9	Eximiciòn - Condonaciòn  Impuesto Inmobiliario	\N	\N	\N	convertida en Expediente Legislativo Nº 23263 ,tratada en sesión Nº 178, con fecha 23/3/2016	Condonacion	2016-03-17 15:12:16.380404	2016-04-04 16:07:34.962539	\N	\N	Gonzalez Adolfo	Aristobulo del Valle 345	No Tiene		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4529	1	Solicita ayuda de cualquier indole para realizar una Tombola a beneficio para una madre soltera.	\N	\N	\N		Peticion	2016-03-17 15:25:26.245734	2016-03-17 15:25:26.245734	\N		Veronica Ponce. Lidia Coldero y madres del barrio	Pje Publico 2320. 130 viviendas. Bda Norte.	0358-154344463		\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4826	2	\N	\N	\N	\N		Despacho	2016-04-27 16:10:13.351449	2016-04-28 11:07:07.95847	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-04-27
4827	\N	\N	\N	\N	\N		Despacho	2016-04-27 16:11:30.71102	2016-04-28 11:09:25.569514	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-04-27
4561	\N	30 Boletines Oficiales Nº 355	\N	\N	\N		Peticion	2016-03-28 11:50:21.502353	2016-03-28 11:57:39.788562	\N	Archivo del Concejo	DEM				\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4563	2	Solicita Pasaje (ida y vuelta) a ciudad de Bs As para participar del encuentro "Asociacion Argentina de X fragil" dirigida a flias que padecen este sintoma.	\N	\N	\N		Peticion	2016-03-28 15:18:02.13025	2016-03-28 15:25:48.733013	\N		Sandra Cesarone		0358-154126676		\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4538	6	Solicita ayuda ecònomica  para solventar gastos de salud 	\N	\N	\N	convertida en Expediente Legislativo Nº 23270 ,tratada en sesión Nº 178, con fecha 23/3/2016	Peticion	2016-03-21 12:20:35.776903	2016-04-06 11:20:14.532213	\N		Cerioni Paola Alejandra	Pasje Primera Junta 923 - Barrio Buena Vista	358 - 154222935		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4543	1	Renuncian a donaciòn efectuada por la Municipalidad la "Parroquia Marìa Madre de la Iglesia y San Pantaleon"	\N	\N	\N	convertida en Expediente Legislativo Nº 23281 ,tratada en sesión Nº 178, con fecha 23/3/2016	Peticion	2016-03-22 11:33:00.562241	2016-04-06 11:28:18.580618	\N	Secretaria del Concejo Deliberante	Obispado Villa de la Concepciòn - Monseñor Adolfo A-. Uriona	Buenos Aires 261			\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4535	8	Solicita ayuda economica para su marido por problemas de salud	\N	\N	\N	convertida en Expediente Legislativo Nº 23268 ,tratada en sesión Nº 178, con fecha 23/3/2016	Peticion	2016-03-18 14:00:30.836698	2016-04-06 11:18:49.115293	\N		Graciela Ysabel Torres	Pje Pedro Gallo 523- Brrio Alberdi-	0358-155148224		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4551	2	Proyecto de Ordenanza::Por el que se aprueba el Convenio firmado entre la Municipalidad de Rìo Cuarto, la empresa "San Ignacio de Loyola S.A"  y el  Automovil Club Rìo Cuarto\r\nAnexo.43 Copias	\N	\N	\N	convertida en Expediente Legislativo Nº 23283 ,tratada en sesión Nº 178, con fecha 23/3/2016	Peticion	2016-03-22 14:27:04.252006	2016-04-06 11:29:12.102185	\N	Secretaria del Concejo Deliberante	DEM - Juan Ruben Jure - Ab. Ignacio Fernandez - Cdora. Maria Alicia Panza				\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4824	\N	\N	\N	\N	\N		Despacho	2016-04-27 15:33:05.247595	2016-04-27 15:52:21.431262	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-04-26
4544	8	Solicita Eximiciòn Año 2016 Impuesto Inmobiliario	\N	\N	\N	convertida en Expediente Legislativo Nº 23274 ,tratada en sesión Nº 178, con fecha 23/3/2016	Condonacion	2016-03-22 12:18:40.059174	2016-04-06 11:01:34.500312	\N	\N	Debia Haydee Josefa 	Comisario Consigli 419 - 439	358 -  156014550		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4542	\N	Acta de acuerdo Municipalidad de Rìo Cuarto, Sindicato Trabajadores Municiples	\N	\N	\N	convertida en Expediente Legislativo Nº 23273 ,tratada en sesión Nº 178, con fecha 23/3/2016	Peticion	2016-03-21 15:55:30.363541	2016-04-06 11:21:00.681539	\N	Secretaria del Concejo Deliberante	DEM - Juan Ruben Jure - Ab. Ignacio Fernandez - Cdora. Maria Alicia Panza				\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4540	\N	Solicita 2 Pasajes de Ida y 2 de Regreso a la Ciudad de Ciudad de Còrdoba destinados a la Sra. Perez Nelida Noemi a los fines de llevar a su hijo a control por razones de salud 	\N	\N	\N		Peticion	2016-03-21 13:59:28.470984	2016-03-21 14:31:27.843022	\N	Contaduria Concejo Deliberante	Concejal Maria del Carmen Cabral	Manuel  Estrada  Norte 425			\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4536	3	Proyecto de Ordenanza:por el que se modifican puntos del plan Urbano de la ciudad de Rio Cuarto- Ord Nº 1082/11.	\N	\N	\N	Adjunta  expediente Administrativo Nº 33673-S-2016\r\n\r\nconvertida en Expediente Legislativo Nº 23280 ,tratada en sesión Nº 178, con fecha 23/3/2016	Peticion	2016-03-18 15:32:16.873687	2016-04-06 11:26:34.01358	\N		DEM				\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4555	\N	Proyecto de Ordenanza: Solicita ayuda ecònomica a la Sra. Castañeda Andrea por razones de salud	\N	\N	\N	convertida en Expediente Legislativo Nº 23279 ,tratada en sesión Nº 178, con fecha 23/3/2016	Peticion	2016-03-22 15:56:31.200422	2016-04-06 11:26:02.05204	\N	Secretaria del Concejo Deliberante	Concejal Osvaldo Da Costa		358 - 154855662 - 4646918		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4545	12	Solicita Eximiciòn Condonaciòn Impuesto Inmobiliario	\N	\N	\N	convertida en Expediente Legislativo Nº 23275 ,tratada en sesión Nº 178, con fecha 23/3/2016	Condonacion	2016-03-22 12:32:38.980316	2016-04-06 11:02:01.423146	\N	\N	Sierra Ines Francisca	Aristobulo Del Valle 390	4640252		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4823	5	\N	\N	\N	\N		Despacho	2016-04-27 15:31:29.244048	2016-04-27 15:54:56.575096	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-04-26
4553	1	\N	\N	\N	\N		Despacho	2016-03-22 15:36:28.066897	2016-03-22 15:49:50.496183	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-03-16
4554	15	Eximicici`on - Condonaciòn Impuesto Inmobiliario	\N	\N	\N	convertida en Expediente Legislativo Nº 23285 ,tratada en sesión Nº 178, con fecha 23/3/2016	Condonacion	2016-03-22 15:42:29.990953	2016-04-06 11:13:49.13671	\N	\N	Alfonso Marta Adelaida	Còrdoba 675	4647407		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4541	3	Proyecto de Resoluciòn: Convocar en los tèrminos del articulo 7º de la Ordenanza Nº 764/2001 a Audiencia Pùblica 	\N	\N	\N	convertida en Expediente Legislativo Nº 23272 ,tratada en sesión Nº 178, con fecha 23/3/2016	Peticion	2016-03-21 14:51:47.470838	2016-04-06 11:20:44.683962	\N	Secretaria del Concejo Deliberante	Concejal Osvaldo Da Costa - Concejal Josè Barotti				\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4550	5	Proyecto de Ordenanza por el que se aprueba el Convenio Fondo Complementario de Obras Inraestructuras para Municipios, Comunas y Comunidades Regionales suscripto con el Ministerio de Gobierno de la Pcia de Cordoba.	\N	\N	\N	convertida en Expediente Legislativo Nº 23282 ,tratada en sesión Nº 178, con fecha 23/3/2016	Peticion	2016-03-22 14:24:51.411614	2016-04-06 11:28:44.904956	\N		DEM (Ing Racagni,Cdora Alicia Panza, Juan Jure)				\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4549	1	\N	\N	\N	\N		Despacho	2016-03-22 14:20:36.816354	2016-03-22 14:20:36.816354	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-03-22
4552	2	Proyecto de Ordenanza: Concursos de precios - del articulo 2º de la Ordenanza  Nº 847/94 y modificatorias - Carta de Autorizaciones-	\N	\N	\N	convertida en Expediente Legislativo Nº 23284 ,tratada en sesión Nº 178, con fecha 23/3/2016	Peticion	2016-03-22 15:10:06.215534	2016-04-06 11:30:12.397149	\N	Secretaria del Concejo Deliberante	DEM - Juan Ruben Jure - Ab. Ignacio Fernandez - Cdora. Maria Alicia Panza				\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4556	12	Solicita  Eximiciòn - Condonaciòn  Impuesto Inmobiliario	\N	\N	\N	convertida en Expediente Legislativo Nº 23287 ,tratada en sesión Nº 179, con fecha 31/3/2016	Condonacion	2016-03-23 13:26:48.649429	2016-04-06 12:38:55.863364	\N	\N	Garay Maria Esther	Gumersindo Alonso 821	4630571		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4564	9	Solicita Eximiciòn - Condonaciòn  Impuesto Inmobiliario	\N	\N	\N	convertida en Expediente Legislativo Nº 23292 ,tratada en sesión Nº 179, con fecha 31/3/2016	Condonacion	2016-03-29 11:32:08.815858	2016-04-06 12:41:31.259283	\N	\N	Heredia Laura Daniela	Pje. Pascual Ramirez 3166	358 - 154199438		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4557	7	Proyecto que tiene por objeto otorgar una ayuda economica a la sra Silvana Gambero para poder afrontar gastos que genera la afecion de su hijo celiaco	\N	\N	\N	convertida en Expediente Legislativo Nº 23288 ,tratada en sesión Nº 179, con fecha 31/3/2016	Peticion	2016-03-23 13:46:42.562244	2016-04-06 13:03:06.031263	\N		Concejal Viviana Pomiglio				\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4559	\N	Proyecto de Ordenanza: Por la que se Contrata a la Lic-en Kinesiologia Silvana del Carmen Gonzalez para que se desempeñe dentro del sistema de Salud Municipal 	\N	\N	\N	convertida en Expediente Legislativo Nº 23290 ,tratada en sesión Nº 179, con fecha 31/3/2016	Peticion	2016-03-23 15:02:14.026873	2016-04-06 13:08:23.894114	\N	Secretaria del Concejo Deliberante	DEM - Juan Ruben Jure - Ab. Ignacio Fernandez - Cdora. Maria Alicia Panza				\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4560	\N	El Concejal solicita 2 Pasajes de Ida y 2 de Regreso a la Ciudad de Còrdoba por razones de salud a la Sra. Olguin Fanny Emilia	\N	\N	\N		Peticion	2016-03-23 16:00:00.520134	2016-03-23 16:06:29.261756	\N	Contaduria Concejo Deliberante	Concejal Carlos Josè Gaso				\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4565	3	Solicita pasajes (dos, ida y vuelta a Cordoba) para el dia 30 de marzo por motivos de salud.	\N	\N	\N		Peticion	2016-03-29 12:21:55.279195	2016-03-29 12:30:24.073796	\N		Moya Veronica Alejandra				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4596	2	\N	\N	\N	\N		Despacho	2016-03-30 15:08:06.439074	2016-04-05 11:26:35.07082	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-04-29
4568	2	Informa que desde esta secretaria se hace un llamado de atencion al agente, Re Agustin.	\N	\N	\N		Peticion	2016-03-29 13:29:02.317628	2016-03-29 13:34:48.033065	\N		Subsecretaria de Recursos Humanos ( Cdora Libia Gonzales)				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4577	1	Solicita apoya al proyecto Generando Salud. puntualmente solicita apoyo especificamente la instalacion deCircuitos Aerobicos.	\N	\N	\N	convertida en Expediente Legislativo Nº 23303 ,tratada en sesión Nº 179, con fecha 31/3/2016	Peticion	2016-03-29 14:52:42.550682	2016-04-06 13:30:57.677394	\N		Iglesia Mision de Vida (Pastor Raul Sassaroli)	FLorencio Sanchez 400 ( ex predio Uru Cure)	0358-4672920		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4580	2	Solicitan declarar "Interes Municipal" el Proyecto de Creaciòn del Colegio San Pablo	\N	\N	\N	convertida en Expediente Legislativo Nº 23306 ,tratada en sesión Nº 179, con fecha 31/3/2016	Peticion	2016-03-29 14:57:25.384438	2016-04-06 13:33:07.433526	\N	Secretaria del Concejo Deliberante	Iglesia Misiòn Vida - Prof. Ruth Sassaroli de Caudana	calle 3 - nro 564 -Barrio Universidad	358 - 4196283		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4598	10	Proyecto de Ordenanza: Otorgar a la sra Dayana Russo un aporte economico de un mil quinientos pesos para solventar gastos de salud de su hijo.	\N	\N	\N	convertida en Expediente Legislativo Nº 23311 ,tratada en sesión Nº 179, con fecha 31/3/2016	Peticion	2016-03-30 15:09:54.106921	2016-04-06 13:36:25.952147	\N		Cjal Daniela Miranda				\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4594	2	\N	\N	\N	\N		Despacho	2016-03-30 15:04:46.187204	2016-04-05 11:35:26.20107	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-04-29
4604	5	Proyecto de Resolucion: Solicita al Sr Secretario de Desarrollo Obras y Servicios Publicos que tome las medidas nesesarias, a traves del area correspondiente, para realizar tareas de Mantenimiento y proceda a la colocacion de lo expuesto en el Proyecto.	\N	\N	\N	convertida en Expediente Legislativo Nº 23312 ,tratada en sesión Nº 179, con fecha 31/3/2016	Peticion	2016-03-30 15:39:34.420678	2016-04-06 13:36:57.659705	\N		Concejal Leticia Perez (Bloque U.P.C.- F.P.V.)				\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4606	9	Proyecto de Ordenanza: Otorgase a la sra Pereyra Nilda Noemi un aporte economico de dos mil pesos que sera destinado a solventar gastos de salud.	\N	\N	\N	convertida en Expediente Legislativo Nº 23313 ,tratada en sesión Nº 179, con fecha 31/3/2016	Peticion	2016-03-30 16:18:37.769071	2016-04-06 13:37:29.068745	\N		Cjal Maria Del Carmen Cabral 				\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4828	\N	Solicita 2 pasajes de Ida y 2 de regreso hacia la ciudad de Còrdoba por razones de salud  Para la Sra Margarita Noemi Maccagno	\N	\N	\N		Peticion	2016-04-28 10:47:42.112497	2016-04-28 11:02:48.423219	\N	Contaduria Concejo Deliberante	Concejal Guillermo Natali				\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4830	9	Eximicion-Condonacion Inmobiliario.	\N	\N	\N	Expediente Legislativo Nº 23441- iniciado en Sesión Ordinaria Nº 183 de fecha 5/5/16	Condonacion	2016-04-28 12:42:36.403341	2016-05-04 13:45:19.358281	\N	\N	Martinez Ramon Antonio	Aconquija 3342 (Brrio Ciudad Nueva)	0358-156542050		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4585	\N	Solicita pasajes (dos) de ida y vuelta a la ciudad de Cordoba para el menor Agustin Vega para una prueba atletica.	\N	\N	\N		Peticion	2016-03-30 13:58:12.32323	2016-03-30 13:58:12.32323	\N		Cejal Maria del Carmen Cabral				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4589	1	\N	\N	\N	\N	Firmo tambièn el Concejal Carlos Gaso	Despacho	2016-03-30 14:05:35.305995	2016-03-30 14:56:33.654981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-03-30
4603	1	\N	\N	\N	\N	Firma tambièn Concejal Carlos Gaso	Despacho	2016-03-30 15:26:07.454939	2016-03-30 15:56:31.202548	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-03-30
4601	4	\N	\N	\N	\N		Despacho	2016-03-30 15:13:10.1605	2016-03-30 16:00:11.341882	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-03-29
4591	5	\N	\N	\N	\N		Despacho	2016-03-30 14:58:54.022857	2016-04-05 12:26:19.845698	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-04-29
4599	4	\N	\N	\N	\N		Despacho	2016-03-30 15:11:32.338064	2016-03-31 12:02:58.039016	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-03-29
4605	1	\N	\N	\N	\N		Despacho	2016-03-30 16:09:10.731254	2016-03-31 12:18:26.487888	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-03-30
4566	12	Eximicion Inmobiliario.	\N	\N	\N	convertida en Expediente Legislativo Nº 23293 ,tratada en sesión Nº 179, con fecha 31/3/2016	Condonacion	2016-03-29 12:46:32.087535	2016-04-06 12:44:05.864688	\N	\N	Ojeda Alba Rosa	Gral Jose Garibaldi 437	4648184		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4567	11	Solicita Eximiciòn - Condonaciòn Impuesto Inmobiliario	\N	\N	\N	convertida en Expediente Legislativo Nº 23294 ,tratada en sesión Nº 179, con fecha 31/3/2016	Condonacion	2016-03-29 13:08:31.854801	2016-04-06 12:45:00.855122	\N	\N	Luna  Luis Gregorio	Josè de San Martìn 2204			\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4569	15	Solicita Eximiciòn Impuesto Inmobiliario Año 2016	\N	\N	\N	convertida en Expediente Legislativo Nº 23300 ,tratada en sesión Nº 179, con fecha 31/3/2016	Condonacion	2016-03-29 13:35:49.946345	2016-04-06 12:56:44.218519	\N	\N	Giachero  Eduardo  Daniel 	25 de Mayo 675	358 - 154314888		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4582	13	Solicita Eximiciòn - Condonaciòn Impuesto Inmobiliario	\N	\N	\N	convertida en Expediente Legislativo Nº 23307 ,tratada en sesión Nº 179, con fecha 31/3/2016	Condonacion	2016-03-30 12:04:50.591967	2016-04-06 13:00:27.726975	\N	\N	Oviedo Luis Ignacio	Pasaje Chubut 510	358 - 154347176		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4571	1	Solicitan Banca del Ciudaddano	\N	\N	\N	convertida en Expediente Legislativo Nº 23296 ,tratada en sesión Nº 179, con fecha 31/3/2016	Peticion	2016-03-29 14:41:40.181361	2016-04-06 13:26:00.119783	\N	Secretaria del Concejo Deliberante	Iglesia Mision de Vida (Pastor Raul Sassaroli)	FLorencio Sanchez 400 ( ex predio Uru Cure)	0358-4223279		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4573	\N	De Interes Comunitario Proyecto RENACER	\N	\N	\N	convertida en Expediente Legislativo Nº 23298 ,tratada en sesión Nº 179, con fecha 31/3/2016	Peticion	2016-03-29 14:46:25.225848	2016-04-06 13:28:00.926639	\N		Iglesia Mision de Vida 	FLorencio Sanchez 400 ( ex predio Uru Cure)	TEL de contactos: Directora Silvia Celucci y Vicedirectora Laura Rodriguez: 4672113- 4654947 respectivamente		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4575	1	Solicita atender la problematica de inseguridad de los vecinos de Brrio Trapalanda.	\N	\N	\N	convertida en Expediente Legislativo Nº 23301 ,tratada en sesión Nº 179, con fecha 31/3/2016	Peticion	2016-03-29 14:49:53.30603	2016-04-06 13:29:51.163065	\N		Iglesia Mision de Vida (Pastor Raul Sassaroli)	FLorencio Sanchez 400 ( ex predio Uru Cure)	0358-4672920		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4832	1	Solicita ayuda ecònomica por razones de salud	\N	\N	\N	Expediente Legislativo Nº 23443- iniciado en Sesión Ordinaria Nº 183 de fecha 5/5/16	Peticion	2016-04-28 14:59:48.131436	2016-05-04 13:45:59.379022	\N	Secretaria del Concejo Deliberante	Fernandez Claudia Karina	Anibal Ponce 1195	358 - 4387849		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4833	\N	Solicita Eximiciòn Impuesto Inmobiliario año 2016	\N	\N	\N	Expediente Legislativo Nº 23444- iniciado en Sesión Ordinaria Nº 183 de fecha 5/5/16	Condonacion	2016-04-28 15:05:05.082948	2016-05-04 13:46:18.531115	\N	\N	Arce Nelida Gladys	Mozart 520	4620153		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4835	4	Solicita un pasaje (ida y vuelta) a ciudad de Cordoba por motivos de salud urgentes.	\N	\N	\N		Peticion	2016-04-29 13:13:43.526121	2016-04-29 14:29:47.310852	\N		Paola Cerioni Alejandra				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4574	1	Considere posibilidad de solicitar peticiones expresadas en la nota a la Empresa de Transporte Publico SATRC	\N	\N	\N	convertida en Expediente Legislativo Nº 23299 ,tratada en sesión Nº 179, con fecha 31/3/2016	Peticion	2016-03-29 14:47:57.017708	2016-04-06 13:29:11.688701	\N		Iglesia Mision de Vida (Pastor Raul Sassaroli)	FLorencio Sanchez 400 ( ex predio Uru Cure)	0358-4223279		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4607	9	Solicita Eximicion Impuesto Inmobiliario año 2016	\N	\N	\N	convertida en Expediente Legislativo Nº 23328 ,tratado en sesión Nº 180, con fecha 07/04/2016	Condonacion	2016-03-31 10:52:49.550367	2016-04-06 16:35:25.056609	\N	\N	Carpinetto Gladys Antonia	Costa Rica 957	358 - 155089720		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4579	1	Solcitan a la empresa Cotreco un contenedor	\N	\N	\N	convertida en Expediente Legislativo Nº 23305 ,tratada en sesión Nº 179, con fecha 31/3/2016	Peticion	2016-03-29 14:56:16.290343	2016-04-06 13:31:43.226111	\N	Secretaria del Concejo Deliberante	Iglesia Misiòn Vida - Pastor Raùl  Sassaroli	Florencio Sanchez 400  ( Ex- predio URU CURE )	358 - 4223279		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4576	1	Solicita la posibilidad de realizar la obra veredas sobre calles Florencio Sanchez al 400 y Colombia al 700	\N	\N	\N	convertida en Expediente Legislativo Nº 23302 ,tratada en sesión Nº 179, con fecha 31/3/2016	Peticion	2016-03-29 14:51:14.123879	2016-04-06 13:30:21.571246	\N		Iglesia Mision de Vida (Pastor Raul Sassaroli)	FLorencio Sanchez 400 ( ex predio Uru Cure)	0358-4672920		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4584	7	Solicita ayuda economica o pension para poder costear medicamento de una enfermedad que no tiene cura.	\N	\N	\N	convertida en Expediente Legislativo Nº 23309 ,tratada en sesión Nº 179, con fecha 31/3/2016	Peticion	2016-03-30 13:23:59.288209	2016-04-06 13:35:26.655707	\N		Aguirre Dario	Costa Rica 848 (Brrio Balacco)	0358-156541535		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4600	3	Proyecto de Ordenanza otorgando al sr Daniel Sosa un aporte economico de un mil pesos que sera destinado a solventar gastos que demande un proyecto de investigacion sobre  sobre pueblos originarios de la region, el pais y America.	\N	\N	\N	convertida en Expediente Legislativo Nº 23310 ,tratada en sesión Nº 179, con fecha 31/3/2016	Peticion	2016-03-30 15:11:44.711331	2016-04-06 13:36:00.636343	\N		Cjal Daniela Miranda				\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4581	5	Solicita se inicie expediente administrativo referido a la renuncia efectueda por el Obispado Villa de la Concepciòn del Rìo Cuarto - Anexo exp 34192 	\N	\N	\N		Peticion	2016-03-29 15:11:20.323627	2016-03-29 15:58:49.170615	\N	Secretaria del Concejo Deliberante	Dr. Javier Peruchin- Director del Àrea de Protecciòn y Gestiòn Juridica del Patrimonio Inmobiliario Municipal				\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4583	\N	Solicita 1 Pasaje de Ida y 1 de regreso hacia la Ciudad de Buenos Aires	\N	\N	\N		Peticion	2016-03-30 12:17:14.705832	2016-03-30 12:27:29.582412	\N	Contaduria Concejo Deliberante	Urbino Josè Gregorio	IPV Alberdi -  Edificio B rojo  - Dep 71	358 - 154376735		\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4610	2	Resoluciòn: Declarar de Interes General " 1º Maratòn y caminata del dìa del Trabajador" de Rìo Cuarto a realizarse el dìa 8 de Mayo del 2016	\N	\N	\N	convertida en Expediente Legislativo Nº 23314 ,tratada en sesión Nº 179, con fecha 31/3/2016	Peticion	2016-03-31 12:53:12.590955	2016-04-06 13:38:27.923131	\N	Secretaria del Concejo Deliberante	Concejal Martìn Carranza				\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4586	1	\N	\N	\N	\N	Esta la firma del Concejal Gaso	Despacho	2016-03-30 13:58:51.936263	2016-03-30 14:34:42.5306	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-03-30
4590	1	\N	\N	\N	\N	Esta la Firma del Concejal Gaso	Despacho	2016-03-30 14:06:48.37458	2016-03-30 14:36:40.165726	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-03-30
4587	1	\N	\N	\N	\N	Firma tambièn Concejal Gaso	Despacho	2016-03-30 14:01:40.270103	2016-03-30 14:41:59.830588	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-03-30
4588	1	\N	\N	\N	\N	Firma tambièn Concejal  Carlos Gaso	Despacho	2016-03-30 14:03:59.252893	2016-03-30 14:48:12.231281	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-03-30
4615	9	Solicita Eximiciòn Impuesto Inmobiliario año 2016	\N	\N	\N	convertida en Expediente Legislativo Nº 23323 ,tratado en sesión Nº 180, con fecha 07/04/2016	Condonacion	2016-03-31 14:26:04.823436	2016-04-06 16:32:10.259323	\N	\N	Garay Gustavo Oscar	Santa Rosa 659	4634554		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4602	1	\N	\N	\N	\N		Despacho	2016-03-30 15:15:22.55055	2016-03-31 11:56:56.911475	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-03-30
4612	\N	Solicita 1 pasaje de Ida y 1 de Regreso Hacia la Ciudad de Cordoba por razones de Salud al Sr. Rodrigo aguilera	\N	\N	\N		Peticion	2016-03-31 13:13:47.02758	2016-03-31 13:17:36.741391	\N	Contaduria Concejo Deliberante	Concejal Martin Carranza				\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4614	13	Solicita eximiciòn - Condonaciòn Impuesto Inmobiliario	\N	\N	\N	convertida en Expediente Legislativo Nº 23324 ,tratado en sesión Nº 180, con fecha 07/04/2016	Condonacion	2016-03-31 14:20:01.873965	2016-04-06 16:32:47.822393	\N	\N	Bonino Analia Natalia	Victor Hugo 1501	358 - 156549410		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4613	18	Solicita Eximiciòn Impuesto Inmobiliario año 2016	\N	\N	\N	convertida en Expediente Legislativo Nº 23325 ,tratado en sesión Nº 180, con fecha 07/04/2016	Condonacion	2016-03-31 13:45:11.96007	2016-04-06 16:33:10.289493	\N	\N	Vazquez Juan Carlos	Nicaragua 335	4651160		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4609	\N	Eximiciòn - Condonaciòn Impuesto  Inmobiliario - Emos	\N	\N	\N	convertida en Expediente Legislativo Nº 23326 ,tratado en sesión Nº 180, con fecha 07/04/2016	Condonacion	2016-03-31 12:19:07.014649	2016-04-06 16:34:25.321232	\N	\N	Principe Ruben Roque	Sthepenson 2138	4646879		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4597	4	\N	\N	\N	\N		Despacho	2016-03-30 15:09:38.736535	2016-04-05 11:20:47.869145	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-04-29
4369	1	Propuesta de Integraciòn de la Nueva Junta Electoral Municipal\r\n	\N	\N	\N	Nota Convertida en Expediente Legislativo Nº 23136, Tratado en sesión Nº 176, con fecha 10/3 /2016.	Peticion	2016-02-29 16:33:45.586707	2016-03-31 16:04:59.678458	\N	Secretaria del Concejo Deliberante	Frente de la Gente (Fregen)	Cabrera 756	4626004		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4374	2	Proyecto de Ordenanza por la que se aprueba la entrega de ejemplares de una edicion especial de la Carta Organica Municipal a los convencionales e Instituciones representativas de la ciudad con motivo de cumplirse en el vigesimo Aniversario de la sancion de ley Fundamental de Rio Cuarto.	\N	\N	\N	Nota Convertida en Expediente Legislativo Nº 23137, Tratado en sesión Nº 176, con fecha 10/3 /2016.	Peticion	2016-03-01 14:25:16.693939	2016-03-31 16:05:42.433559	\N		DEM				\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4595	4	\N	\N	\N	\N		Despacho	2016-03-30 15:06:37.587362	2016-04-05 11:31:15.143731	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-04-29
4593	5	\N	\N	\N	\N		Despacho	2016-03-30 15:02:44.97257	2016-04-05 11:54:22.124923	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-04-29
4592	5	\N	\N	\N	\N		Despacho	2016-03-30 15:00:49.66143	2016-04-05 12:21:43.3766	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-04-29
4570	\N	Eximiciòn - Condonaciòn - E4ximiciòn	\N	\N	\N	convertida en Expediente Legislativo Nº 23295 ,tratada en sesión Nº 179, con fecha 31/3/2016	Condonacion	2016-03-29 14:18:07.770763	2016-04-06 12:45:24.457141	\N	\N	Ledesma Rosana Liliana	Chile 1040	358 - 154332876 - 4629322		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4377	2	Anexo 33550 -  5 copias -Proyecto de Ordenanza por el que se aprueba el Convenio de Capacitaciòn y Formaciòn suscripto con el Instituto Superior Cervantes	\N	\N	\N	Convertida en Expediente Legislativo Nº 23144, Tratado en sesión Nº 176, con fecha 10/3 /2016.	Peticion	2016-03-02 11:44:41.087092	2016-03-31 16:09:27.361588	\N	Secretaria del Concejo Deliberante	DEM - Juan Ruben Jure - Ab. Ignacio R. Fernandez - Cdora. Marìa Alicia Panza - SubSecretaria de Recursos Humanos Departamento Capacitaciòn				\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4437	2	Proyecto de Ordenanza por la que se incrementa a partir del 25 de Enero del corriente en la suma de pesos mil quinientos ($1.500) en concepto de Honorarios al Dr. Santiago Andres Castillo	\N	\N	\N	Convertida en Expediente Legislativo Nº 23206, Tratado en sesión Nº 176, con fecha 10/3 /2016.	Peticion	2016-03-09 13:31:47.434206	2016-03-31 16:43:57.29057	\N	Secretaria del Concejo Deliberante	DEM - Juan Ruben Jure -  Cdora. Marìa Alicia Panza - Dr. Gabriel Abrile				\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4368	14	Solicita Eximiciòn Año 2016 Impuesto Inmobiliario	\N	\N	\N	convertida en Expediente Legislativo Nº 23142 ,tratada en sesión Nº 176, con fecha 10/3/2016	Condonacion	2016-02-29 12:50:51.232116	2016-04-01 11:12:19.756558	\N	\N	Luna Ilda Elba 	Marcos Lloveras 1150	358- 155480249		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4408	16	Solicita Eximiciòn Condonaciòn Impuesto Inmobiliario	\N	\N	\N	convertida en Expediente Legislativo Nº 23171 ,tratada en sesión Nº 176, con fecha 10/3/2016	Condonacion	2016-03-08 11:45:05.594912	2016-04-01 11:30:33.930975	\N	\N	Gallo Juan Josè	Sobremonte 1976	4648120 (Celiz)		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4403	\N	Solicita ayuda ecònomica para la niña Zoe Valentina Ramirez Batet	\N	\N	\N	convertida en Expediente Legislativo Nº 23168 ,tratada en sesión Nº 176, con fecha 10/3/2016	Peticion	2016-03-07 14:58:37.7474	2016-04-01 11:56:30.023411	\N		Claudio Miranda	Francisco Muñiz 925 (Bda Norte)			\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4620	\N	Solicita 1 Pasaje Hacia la Ciudad de Buenos Aires a la Sra Blanca Azucena Centeno	\N	\N	\N		Peticion	2016-04-01 12:37:21.549047	2016-04-01 12:59:51.902918	\N	Contaduria Concejo Deliberante	Concejal Martin Carranza				\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4841	16	Solicita Eximiciòn -Condonaciòn Impuesto Inmobiliario	\N	\N	\N	Expediente Legislativo Nº 23450- iniciado en Sesión Ordinaria Nº 183 de fecha 5/5/16	Condonacion	2016-05-02 13:39:50.509812	2016-05-04 13:48:42.52721	\N	\N	Arrieta Rosa	Misiones 540	358- 154163452 - 4640524		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4623	12	Resoluciòn: 15335	\N	\N	\N		Peticion	2016-04-01 14:16:30.861839	2016-04-01 15:04:20.503375	\N	Secretaria del Concejo Deliberante	Secretaria de Economia				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4478	10	Solicita Eximiciòn - Condonaciòn Impuesto Inmobiliario	\N	\N	\N	convertida en Expediente Legislativo Nº 23225 ,tratada en sesión Nº 177, con fecha 17/3/2016	Condonacion	2016-03-14 13:21:01.968218	2016-04-04 11:24:31.540668	\N	\N	Vuelva Vicenta Margarita	Emeric Vidal 580 - Banda Norte	No Tiene		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4483	21	Solicita Eximiciòn - Condonaciòn Impuesto Emos	\N	\N	\N	convertida en Expediente Legislativo Nº 23227 ,tratada en sesión Nº 177, con fecha 17/3/2016	Condonacion	2016-03-14 14:30:20.793057	2016-04-04 11:25:23.568992	\N	\N	Caseros Eduardo Raùl	Las Heras 669	358 - 154861282		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4485	18	Solicita Eximiciòn Año 2016	\N	\N	\N	convertida en Expediente Legislativo Nº 23285 ,tratada en sesión Nº 177, con fecha 17/3/2016	Condonacion	2016-03-14 15:06:03.212628	2016-04-04 11:27:33.133811	\N	\N	Zarate Jorge Humberto	Juana Fernandez 3328	4641372		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4488	9	Solicita Eximiciòn Impuesto Inmobiliario Año 2016	\N	\N	\N	convertida en Expediente Legislativo Nº 23232 ,tratada en sesión Nº 177, con fecha 17/3/2016	Condonacion	2016-03-15 12:53:14.630375	2016-04-04 11:31:40.220014	\N	\N	Andrada Manuela Mari	Estados Unidos 638	358 - 154119100		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4622	28	Eximicion Inmobiliario	\N	\N	\N	convertida en Expediente Legislativo Nº 23218 ,tratado en sesión Nº 180, con fecha 07/04/2016	Condonacion	2016-04-01 13:49:15.048136	2016-04-06 16:05:26.433972	\N	\N	Villalòn Gladys Esther	Ituzaingo 1354	0358- 4624159		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4621	18	Solicita Eximiciòn-  Condonaciòn Impuesto Inmobiliario	\N	\N	\N	convertida en Expediente Legislativo Nº 23319 ,tratado en sesión Nº 180, con fecha 07/04/2016	Condonacion	2016-04-01 12:46:18.019227	2016-04-06 16:23:04.286438	\N	\N	Rodriguez Maria Elena	Fray Luis Beltran 528	358 - 154183088		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4619	13	Solicita Eximiciòn Año 2016 sobre el Impuesto de Emos e Inmobiliario 	\N	\N	\N	convertida en Expediente Legislativo Nº 23320 ,tratado en sesión Nº 180, con fecha 07/04/2016	Condonacion	2016-04-01 11:18:12.690344	2016-04-06 16:30:28.474444	\N	\N	Oberto Roberto Aldo	Santa Fè 1498	4623999		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4618	16	Solicita Eximiciòn Impuesto Inmobiliario año 2016	\N	\N	\N	convertida en Expediente Legislativo Nº 23322 ,tratado en sesión Nº 180, con fecha 07/04/2016	Condonacion	2016-03-31 15:24:29.640337	2016-04-06 16:31:44.719014	\N	\N	Puig Juana Nelida	Mariquita Sanchez de Thompson 269	358 - 154380235		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4840	\N	Modificaciones  del Proyecto de Organigrama de la Direcciòn General de Vialidad, de la Secretaria de Desarrollo Urbano,Obras y Servicios Pùblicos	\N	\N	\N		Peticion	2016-05-02 12:30:34.037759	2016-05-02 13:09:46.53988	\N	Secretaria del Concejo Deliberante	Walter Carranza - Para adjuntar al expediente 34406-C-16				\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4845	6	Proyecto de Ordenanza por la que se otorga a la sra Liliana Andrea Gigena un aporte economico de $ 2.000 (dos mil) para solventar gastos de mantenimiento de su hogar.	\N	\N	\N	Expediente Legislativo Nº 23453- iniciado en Sesión Ordinaria Nº 183 de fecha 5/5/16	Peticion	2016-05-03 13:42:24.303062	2016-05-04 13:50:07.561149	\N		Lic Martin Carranza				\N	\N	\N	\N	\N	rarias@entrada.com	\N
4842	1	Solicita pasaje (uno) ida y vuelta a ciudad de Cordoba para el dia de hoy por motivos de salud.	\N	\N	\N		Peticion	2016-05-02 15:27:14.442326	2016-05-02 15:39:35.366917	\N		Laura Ybañez				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4844	1	Solicitan Autorizaciòn para realizar una visita de vuestra escuela a la Instituciòn del Concejo Deliberante	\N	\N	\N		Peticion	2016-05-03 13:39:27.40962	2016-05-03 14:00:45.669443	\N	Secretaria del Concejo Deliberante	Centro Educativo Provincia de Santa Cruz	Santa Fè y Uruguay	358 - 4751666		\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4848	15	Solicita Eximiciòn -Condonaciòn Impuesto Sobre Cementerio	\N	\N	\N	Expediente Legislativo Nº 23455- iniciado en Sesión Ordinaria Nº 183 de fecha 5/5/16	Condonacion	2016-05-03 14:30:08.870364	2016-05-04 13:54:47.523945	\N	\N	Rodriguez Claudio Daniel	O`Hoggins 2268	358 - 154199008		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4849	\N	Decretos:2921/15, 2989/15, 3296/15, 3297/15,3298/16.\r\nOrdenanzas:1058/15, 1066/15, 1073/15.	\N	\N	\N		Peticion	2016-05-04 12:15:41.010491	2016-05-04 12:28:51.263803	\N		DEM				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4837	19	Solicita Eximiciòn Condonaciòn Impuesto Inmobiliario	\N	\N	\N	Expediente Legislativo Nº 23447- iniciado en Sesión Ordinaria Nº 183 de fecha 5/5/16	Condonacion	2016-04-29 14:14:02.062259	2016-05-04 13:47:23.067495	\N	\N	Alaniz Maria Ines	Roberto Payro 860 - 869	358 - 154386234		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4839	21	Solicita Eximiciòn Condonaciòn Impuesto Inmobiliario	\N	\N	\N	Expediente Legislativo Nº 23449- iniciado en Sesión Ordinaria Nº 183 de fecha 5/5/16	Condonacion	2016-04-29 15:05:36.999683	2016-05-04 13:48:19.34203	\N	\N	Calderon Nilda Beatriz	Roma 2072	4629917		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4397	17	Proyecto de Ordenanza: "Asociaciòn Civil la pista ACLAP" Solicita ayuda ecònomica 	\N	\N	\N	 Convertida en Expediente Legislativo Nº 23165, Tratado en sesión Nº 176, con fecha 10/3 /2016.	Peticion	2016-03-07 11:01:50.031442	2016-03-31 16:13:14.28784	\N	Secretaria del Concejo Deliberante	Concejal Humberto Benedetto - Concejal  Olga Cantoro				\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4412	1	Solicita un incremento en la tarifa. Modifiacion del articulo 18 de la Ordenanza Municipal 783/01.	\N	\N	\N	 Convertida en Expediente Legislativo Nº 23172, Tratado en sesión Nº 176, con fecha 10/3 /2016.	Peticion	2016-03-08 13:24:29.517349	2016-03-31 16:19:29.89427	\N		Juan Andrada.Pte Asociacion de taxistas Unidos de Rio Cto	Bvard Ameghino 1342	cel  0358-154843894 ( Vice Pte Miguel Angelicola)		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4416	1	Proyecto de Resoluciòn: Solicitar al Secretario de Desarrollo Urbano,Obras y Servicios Pùblicos tenga a bien proceder a la inmediata colocaciòn  de un "retardador de velocidad",Estados Uniidos y  Jujuy	\N	\N	\N	 Convertida en Expediente Legislativo Nº 23178, Tratado en sesión Nº 176, con fecha 10/3 /2016.	Peticion	2016-03-08 13:34:17.47082	2016-03-31 16:31:20.403892	\N	Secretaria del Concejo Deliberante	Concejal Mauricio Dova				\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4384	16	Solicita-  Eximiciòn - Condonaciòn-  Eximiciòn - Condonaciòn Impuesto Inmobiliario	\N	\N	\N	convertida en Expediente Legislativo Nº 23150 ,tratada en sesión Nº 176, con fecha 10/3/2016	Condonacion	2016-03-03 14:04:27.1669	2016-04-01 11:16:29.871814	\N	\N	Di Cola Ana Marìa	Maria Olguin 972	358- 154124475		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4395	17	Solicita Eximiciòn Año 2016 Impuesto Inmobiliario	\N	\N	\N	convertida en Expediente Legislativo Nº 23158 ,tratada en sesión Nº 176, con fecha 10/3/2016	Condonacion	2016-03-04 14:25:06.904091	2016-04-01 11:22:47.980275	\N	\N	Cocco Jorgelina Fabiana	Sobremonte 222	358 - 154195871		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4428	4	Solicita ayuda ecònomica por razones de salud	\N	\N	\N	convertido en Expte Legislativo Nº 23188 Sesión Ordinaria 176 de fecha 10-3-16	Peticion	2016-03-08 14:46:41.617443	2016-04-01 13:56:19.73008	\N	Secretaria del Concejo Deliberante	Jofre Ernesto Virginio 	Constituciòn 965	358 - 154024201		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4625	\N	Resoluciòn: 15329	\N	\N	\N		Peticion	2016-04-01 14:20:25.82391	2016-04-01 14:31:57.31881	\N	Secretaria del Concejo Deliberante	Secretaria de Ecònomia				\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4624	\N	Resolucion  15336	\N	\N	\N		Peticion	2016-04-01 14:19:23.131766	2016-04-01 15:29:40.576401	\N		Secretaria de Economia				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4469	13	Solicita Eximiciòn  - Condonaciòn Impuesto Inmobiliario	\N	\N	\N	convertida en Expediente Legislativo Nº 23217 ,tratada en sesión Nº 177, con fecha 17/3/2016	Condonacion	2016-03-11 14:38:48.632539	2016-04-04 11:18:39.130151	\N	\N	Valenzuela Susana del Rosario	Chiclana 1273	358 - 155627910		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4471	13	Solicita Eximiciòn -Condonaciòn Impuesto Inmobiliario	\N	\N	\N	convertida en Expediente Legislativo Nº 23221 ,tratada en sesión Nº 177, con fecha 17/3/2016	Condonacion	2016-03-11 14:51:14.78159	2016-04-04 11:22:14.138773	\N	\N	Sotteli Pablo Maximo	Blas Parera 859	4620509		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4463	1	Solicitan se arbitre para convocar a las distintas instituciones vinculadas al tema de las modificaciones al plan urbano en virtud del pròximo tratamiento del Exp 22815 ingresado por el Departamento Ejecutivo Municipal 	\N	\N	\N	convertida en Expediente Legislativo Nº 23222 ,tratada en sesión Nº 177, con fecha 17/3/2016	Peticion	2016-03-10 15:15:51.273998	2016-04-04 11:35:55.361286	\N	Secretaria del Concejo Deliberante	Colegio de Arquitectos de la Provincia de Còrdoba	Colòn 420	358 - 4635742		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4486	3	Presenta Anteproyecto para que èste Concejo realice una Sesiòn especial por la Conmemoraciòn  de los 20 años de la Carta Orgànica Municipal de la Ciudad de Rìo Cuarto ( 27/03/ 2016) 	\N	\N	\N	convertida en Expediente Legislativo Nº 23233 ,tratada en sesión Nº 177, con fecha 17/3/2016	Peticion	2016-03-15 12:07:19.102919	2016-04-04 11:38:58.629443	\N	Secretaria del Concejo Deliberante	Presidenta Frente de la Gente ( FREGEN) ) Baños Paulina Susana	Maipù 1471 - Depart 9	358 - 155076238		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4508	2	Proyecto de Resolucion:Solicita al Secretario de Desarrollo Urbano, Obras y Servicios Publicos, Jorge Mendez que arbitre los medios nesesarios para que la empresa Consesionaria de los Servicios de Higiene Urbana de la Ciudad de Rio Cuarto COTRECO S.A.  cumplimente con los articulos establecidos en el articulo 2 de la ordenanza 1724/08	\N	\N	\N	convertida en Expediente Legislativo Nº 23247 ,tratada en sesión Nº 177, con fecha 17/3/2016	Peticion	2016-03-16 15:12:19.792744	2016-04-04 11:54:32.116078	\N		Cjal Francisco Varela Geuna ( Bloque Rio Cuarto Para Todos)				\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4630	30	Solicita Eximiciòn - Condonaciòn Impuesto Inmobiliario	\N	\N	\N	convertida en Expediente Legislativo Nº 23334 ,tratado en sesión Nº 180, con fecha 07/04/2016	Condonacion	2016-04-04 14:10:54.815065	2016-04-06 16:36:53.476248	\N	\N	Juarez Rosa Olga	Marcos Llloveras 1343	358 - 154368089		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4629	3	Solicita un aumento urgente en la tarifa del taxi correspondiente a un 40% en bajada de bandera ( 22 pesos) y de un 20% para los 100 metros e igual en los 30 segundos ( un peso), tambien aumento en la tarifa nocturna.	\N	\N	\N	Adjuntan nota de 16 de noviembre y reclama no fue respondido el expediente 22887.\r\n\r\nconvertida en Expediente Legislativo Nº 23332 ,tratado en sesión Nº 180, con fecha 07/04/2016	Peticion	2016-04-04 13:28:24.231452	2016-04-06 16:41:03.053577	\N		Federacion Nacional de Sindicatos de Conductores de taxis ( Gustavo H. Dominguez- Guillermo R. Manenti)	Peron Oeste 1554	 Manenti 0358-154320155. Dominguez 0358-156015822		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4838	2	Nota efectuando Reclamo.	\N	\N	\N	Expediente Legislativo Nº 23448- iniciado en Sesión Ordinaria Nº 183 de fecha 5/5/16	Peticion	2016-04-29 14:42:49.752596	2016-05-04 13:48:02.823926	\N		Amara Francisco. (Ferretería el Oficio)	Bv Roca 868	358 - 4329784		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4631	2	Sindicato Empleadas de Casas Particulares solicitan apoyo ecònomico para festejos en el Primer Aniversario de las empleadas de Casas de Familia	\N	\N	\N	Convertida en Expediente Legislativo Nº 23333 ,tratado en sesión Nº 180, con fecha 07/04/2016	Peticion	2016-04-04 14:40:37.984124	2016-04-06 16:41:52.752602	\N	Secretaria del Concejo Deliberante	SIN.PE.CAF - Delegada Georgina Castro		358 - 154370911		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4480	1	Decreto:3449/16 Convocase al Cuerpo Electoral Municipal de la Ciudad de Rìo Cuarto a participar de elecciones ordinarias el dìa domingo doce (12) de Junio del 2016 desde las 8 de la mañana y hasta las 18 (horas)	\N	\N	\N	convertida en Expediente Legislativo Nº 23231 ,tratada en sesión Nº 177, con fecha 17/3/2016	Peticion	2016-03-14 14:13:57.154988	2016-04-04 15:07:59.270508	\N	Secretaria del Concejo Deliberante	DEM - Juan Ruben Jure - Ab. Ignacio Fernandez -  				\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4616	2	Proyecto de Ordenanza:: Solicitan se modifiquen diferentes articulos de " Regimen Municipal de Partidos Politicos"	\N	\N	\N	convertida en Expediente Legislativo Nº 23316 ,tratada en sesión Nº 179, con fecha 31/3/2016	Peticion	2016-03-31 14:49:41.153426	2016-04-06 13:43:54.245775	\N	Secretaria del Concejo Deliberante	Concejal Guillermo Natali				\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4626	10	Eximicion Impuesto  Inmobiliario año 2016.	\N	\N	\N	convertida en Expediente Legislativo Nº 23329 ,tratado en sesión Nº 180, con fecha 07/04/2016	Condonacion	2016-04-04 11:49:46.580835	2016-04-06 16:35:55.260694	\N	\N	Kissling Herberto  Ernesto	Gobernador Guzman 1122	0358- 4640180		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4530	12	Solicita Eximiciòn - Condonaciòn  Impuesto Inmobiliario	\N	\N	\N	convertida en Expediente Legislativo Nº 23265 ,tratada en sesión Nº 178, con fecha 23/3/2016	Condonacion	2016-03-17 15:51:54.101131	2016-04-04 16:08:25.497457	\N	\N	Muñoz Mirtha Gladys	Paso de los Andes 414			\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4539	12	Solicita Eximiciòn -  Condonaciòn Impuesto Inmobiliario	\N	\N	\N	convertida en Expediente Legislativo Nº 23271 ,tratada en sesión Nº 178, con fecha 23/3/2016	Condonacion	2016-03-21 12:45:08.466551	2016-04-04 16:09:29.259113	\N	\N	Moya Concepciòn Jesùs	Nayor Juan de Dios Lopez 260 - Esquina Elias Moyano	358 - 155175779		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4632	\N	Proyecto de Ordenanza:Solicita ayuda ecònomica  por razones de salud a la Sra. Massaroni Amanda Magdalena 	\N	\N	\N	Convertida en Expediente Legislativo Nº 23335 ,tratado en sesión Nº 180, con fecha 07/04/2016	Peticion	2016-04-04 15:24:57.312793	2016-04-06 16:42:27.87464	\N	Secretaria del Concejo Deliberante	Concejal Olga Cantoro				\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4633	8	Proyecto d Ordenanza: otorguese a la sra Monica Figueroa un aporte economico de dos mil pesos (2.000) destinados a solventar gastos de salud de su hijo.	\N	\N	\N	Convertida en Expediente Legislativo Nº 23339 ,tratado en sesión Nº 180, con fecha 07/04/2016	Peticion	2016-04-04 15:49:00.889742	2016-04-06 16:46:53.81284	\N		Concejal Olga Cantoro	Ombu 2412 (Bimaco)	0358-4752082/ 154207501		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4641	2	Solicita se declare de Interes Municipal al 2do Encuentro de Redes Culturalles de Corredor Sur de la Pcia de Cba a realizarse en Rio Cto los dias 21, 22,23 y 24 de abril de 2016.	\N	\N	\N	Convertida en Expediente Legislativo Nº 23344 ,tratado en sesión Nº 180, con fecha 07/04/2016	Peticion	2016-04-05 14:56:36.030113	2016-04-06 16:53:03.867578	\N		Subsecretaria de Cultura. Subsecretario de Cultura (Matias Zamanillo)	Constitucion 947 (Planta Alta)	0358-4671205/206/207		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4652	\N	\N	\N	\N	\N		Despacho	2016-04-06 15:22:54.047204	2016-04-07 10:51:02.629475	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-04-06
4638	2	Solicitan  Declaraciòn de Interes Municipal el Congreso "Pensando Rìo Cuarto" 	\N	\N	\N	Convertida en Expediente Legislativo Nº 23341 ,tratado en sesión Nº 180, con fecha 07/04/2016	Peticion	2016-04-05 14:19:02.62489	2016-04-06 16:50:15.689726	\N	Secretaria del Concejo Deliberante	Fundaciòn Rìo Cuarto	Paseo de la Rivera - 8º piso - Av Mugnaini esq. Sobremonte	358 - 154851309 - 4210333		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4643	2	Sobre Peticiòn presentada por el Sr.Hector Antonio Rodriguez sobre Oblea de Remis por Exp Legislativo Nº 22600/2015  	\N	\N	\N		Peticion	2016-04-05 16:18:09.664457	2016-04-05 16:26:20.037806	\N	Secretaria del Concejo Deliberante	SubSecretaria de Transporte - Osvaldo Pringles		4671419		\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4547	15	Soicita Eximiciòn - Condonaciòn Impuesto Inmobiliario	\N	\N	\N	convertida en Expediente Legislativo Nº 23278 ,tratada en sesión Nº 178, con fecha 23/3/2016	Condonacion	2016-03-22 13:09:39.600498	2016-04-06 11:04:16.299184	\N	\N	Dub Claudia Marìa	Aliaga 851	358 - 154182523		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4537	2	Proyecto de Ordenanza por el que se desafecta como servicio comunitario y se afecta de libre disponibilidad el lote designado catastralmente como  CO4-SO1-M332-P5, ubicada en Intendente Daguerre Nº 1700 del Pque Industrial de la ciudad de Rio Cuarto.	\N	\N	\N	ANEXO Nº 33625\r\n\r\nconvertida en Expediente Legislativo Nº 23267 ,tratada en sesión Nº 178, con fecha 23/3/2016	Peticion	2016-03-18 15:34:54.607291	2016-04-06 11:17:09.006575	\N		DEM 				\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4548	4	Solicita ayuda ecònomica para destinar a la adquisiciòn de lentes recetados	\N	\N	\N	convertida en Expediente Legislativo Nº 23277 ,tratada en sesión Nº 178, con fecha 23/3/2016	Peticion	2016-03-22 13:49:50.118501	2016-04-06 12:34:23.905144	\N	Secretaria del Concejo Deliberante	Gonzalez Javier Orlando	Adelia Maria y Sancchez de Loria	358 - 155000373		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4646	1	\N	\N	\N	\N	Este Despacho fuè entregado por Secretaria	Despacho	2016-04-06 13:14:17.216521	2016-04-06 13:14:17.216521	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-03-30
4634	2	Proyecto de Ordenanza por el que se recategoiza a agentes de diferentes reparticiones. Se adjunta Expediente administratrivo Nº 34243-S- 2016	\N	\N	\N	Convertida en Expediente Legislativo Nº 23336 ,tratado en sesión Nº 180, con fecha 07/04/2016	Peticion	2016-04-05 12:07:34.193934	2016-04-06 16:42:59.192374	\N		DEM				\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4648	2	Proyecto de Ordenanza:Solicita se modifique la Ordenanza 1182/15 debido a un error de tipeo a nombre del Sr. Julio Massucco	\N	\N	\N		Peticion	2016-04-06 13:44:11.009943	2016-04-06 14:39:33.008921	\N	Secretaria del Concejo Deliberante	Concejal Olga Cantoro				\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4608	9	Solicita Eximiciòn Impuesto Inmobiliario año 2016	\N	\N	\N	convertida en Expediente Legislativo Nº 23327 ,tratado en sesión Nº 180, con fecha 07/04/2016	Condonacion	2016-03-31 11:42:42.794374	2016-04-06 16:35:03.370852	\N	\N	Jaime Linder Rene	Juan Bialet Masse 28	358 - 154293516 - 4797660		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4636	14	Solicita Eximiciòn-  Condonaciòn Impuesto Inmobiliario	\N	\N	\N	convertida en Expediente Legislativo Nº 23338 ,tratado en sesión Nº 180, con fecha 07/04/2016	Condonacion	2016-04-05 13:30:55.939971	2016-04-06 16:37:47.421451	\N	\N	Pelliccia Felix Fernando	Pedro Nolazco Rodriguez 455	4640454		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4635	\N	Proyecto de Ordenanza otorgando un aporte económico a la Sra Claudia Adelina Alvarez destinado a solventar gastos de primera necesidad	\N	\N	\N	\r\nConvertida en Expediente Legislativo Nº 23337 ,tratado en sesión Nº 180, con fecha 07/04/2016	Peticion	2016-04-05 12:53:10.036129	2016-04-06 16:45:14.377382	\N		Concejal Claudia Bringas		358 - 154269855		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4637	\N	Solicita la Banca del ciudadano para el dia 7 de abril de 2016 en ocasion de la visita de la Iglesia "Mision de vida" en el marco del proyecto vinculacion Legislativa.	\N	\N	\N	Convertida en Expediente Legislativo Nº 23340 ,tratado en sesión Nº 180, con fecha 07/04/2016	Peticion	2016-04-05 14:06:41.650781	2016-04-06 16:48:25.159907	\N		 Asoc. Vecinal La Agustina.  Jose Rivas.  Dr Carlos Rang 	Brasil 764	0358-154112338/ 0358-154019414		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4642	6	Solicita ayuda ecònomica  para la compra de un par de lentes a su hijo Figueroa Buscarol Sol Milagros del Mar	\N	\N	\N	Convertida en Expediente Legislativo Nº 23342 ,tratado en sesión Nº 180, con fecha 07/04/2016	Peticion	2016-04-05 15:03:43.587502	2016-04-06 16:51:33.846455	\N	Secretaria del Concejo Deliberante	Figueroa Hèrnan	Jaime Gil 661	358 - 155041798 - 4620381		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4657	4	\N	\N	\N	\N		Despacho	2016-04-06 15:48:15.097387	2016-04-07 10:55:55.116928	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-04-06
4668	1	\N	\N	\N	\N		Despacho	2016-04-06 16:06:35.871553	2016-04-07 11:58:21.987505	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-04-06
4659	4	\N	\N	\N	\N		Despacho	2016-04-06 15:52:16.876019	2016-04-07 15:49:17.724383	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-04-06
4656	1	\N	\N	\N	\N		Despacho	2016-04-06 15:45:56.552702	2016-04-07 15:58:03.105976	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-04-06
4654	1	\N	\N	\N	\N		Despacho	2016-04-06 15:34:58.774515	2016-04-07 16:02:49.091713	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-04-06
4846	8	Solicita se le otorgue un aporte ecònomica para la Sra Karina Silvana Lopez destinados a solventar gastos de lentes  de su hijo	\N	\N	\N	Expediente Legislativo Nº 23454- iniciado en Sesión Ordinaria Nº 183 de fecha 5/5/16	Peticion	2016-05-03 13:52:05.594662	2016-05-04 13:50:23.589386	\N	Secretaria del Concejo Deliberante	Concejal Leticia Perez	Ruben Dario 338	358 - 4909182		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4640	\N	Ordenanzas: 1166/151169/15,1202/15,1253/15, 1262/15, 1262/15, 1263/15,1304/15, 1305/151310/15, Decretos:2990/15, 2991/15, 2992/15, 2993/15, 2994/15, 2995/15, 2996/15, 2997/15,2998/15, 2999/15, 3011/15, 3011/15, 3012/15,3015/15, 3016/15,3017/15,3021/15,3022/15,3081/15,3138/15, 3151/15, 3261/15, 3294/15, 3296/15.	\N	\N	\N		Peticion	2016-04-05 14:54:54.335951	2016-04-05 20:17:26.106817	\N	Informatica	DEM				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4546	9	Solicita Eximiciòn - Condonaciòn Impuesto Inmobiliario	\N	\N	\N	convertida en Expediente Legislativo Nº 23276 ,tratada en sesión Nº 178, con fecha 23/3/2016	Condonacion	2016-03-22 12:59:37.826632	2016-04-06 11:03:35.853915	\N	\N	Mendez Dora Isabel	Simòn Gorordo 1047	358 - 154115049		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4523	2	Solicita ayuda economica para poder asistir al mundial de Montenbaik Enduro world Series ya que fue aceptado para poder realizar esta competencia.	\N	\N	\N	convertida en Expediente Legislativo Nº 23259 ,tratada en sesión Nº 178, con fecha 23/3/2016	Peticion	2016-03-17 13:16:24.490074	2016-04-06 11:15:51.938844	\N		Nicolas Ruben Olmedo	Lopoldo Lugones 2179	0358-4621464. Cel 0358-154386991		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4532	\N	Proyecto de resolucion. Solicitar al secretario de salud, deportes y desarrollo Social, Gabriel Abrile y el subsecretario de Desarrollo Social, Gonzalo Parodi, que en un termino no mayor a tres dias, desde la aprobacion de la resolucion, informen en forma detallada a cerca de imagenes de publico conocimiento en la que se observa un vehiculo que presuntamente esta afectado al area de Desarrollo Social transportando material de campaña de uno de los pre candidatos de la U.C. R.	\N	\N	\N	convertida en Expediente Legislativo Nº 23269 ,tratada en sesión Nº 178, con fecha 23/3/2016	Peticion	2016-03-18 12:25:20.158901	2016-04-06 11:19:27.847402	\N		Cejal Sara Bergessio, Cejal Mauricio Dova, Cejal Leticia Pauluzzi, Cejal Leticia Perez				\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4645	1	\N	\N	\N	\N		Despacho	2016-04-06 11:43:46.457371	2016-04-06 11:48:56.582528	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-04-06
4644	1	\N	\N	\N	\N		Despacho	2016-04-06 11:41:58.028048	2016-04-06 11:51:28.082995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-04-06
4558	\N	Proyecto de Ordenanza: Por la que se incrementa a partir del 15 de Marzo del corriente mes en la suma de pesos ($ 1400.00) en concepto de honorarios a la Lic. en Psicologia Marìa Virginia Funes	\N	\N	\N	convertida en Expediente Legislativo Nº 23289 ,tratada en sesión Nº 179, con fecha 31/3/2016	Peticion	2016-03-23 14:59:47.246495	2016-04-06 13:03:56.677643	\N	Secretaria del Concejo Deliberante	DEM - Juan Ruben Jure -  Cdora. Marìa Alicia Panza				\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4572	1	Problematicas de Jardin Norte	\N	\N	\N	convertida en Expediente Legislativo Nº 23297 ,tratada en sesión Nº 179, con fecha 31/3/2016	Peticion	2016-03-29 14:43:29.922365	2016-04-06 13:27:24.202585	\N	Secretaria del Concejo Deliberante	Iglesia Mision de Vida (Pastor Raul Sassaroli)	FLorencio Sanchez 400 ( ex predio Uru Cure)	0358-4223279		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4578	1	Solicitan tengan a bien atender la problematica de la basura  mediante el Proyecto "Barrio Limpio, Barrio Sano"	\N	\N	\N	convertida en Expediente Legislativo Nº 23304 ,tratada en sesión Nº 179, con fecha 31/3/2016	Peticion	2016-03-29 14:54:05.425197	2016-04-06 13:31:20.711369	\N	Secretaria del Concejo Deliberante	Iglesia Misiòn Vida - Pastor Raùl  Sassaroli	Florencio Sanchez 400  ( Ex- predio URU CURE )	358 - 4223279		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4611	2	Proyecto de Ordenanza: solicitan aporte ecònomico que serà destinado a solventar los gastos que demande la premiaciòn de la 1ª Maratòn y caminata del dìa del Trababjador	\N	\N	\N	convertida en Expediente Legislativo Nº 23315 ,tratada en sesión Nº 179, con fecha 31/3/2016	Peticion	2016-03-31 12:55:39.135143	2016-04-06 13:39:19.953466	\N	Secretaria del Concejo Deliberante	Concejal Martin Carranza				\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4649	13	Proyecto de Ordenanza: otorguese a la sra Zapata, Nelly Eduarda  un aporte economico para afrontar gastos de primera nesesidad.	\N	\N	\N		Peticion	2016-04-06 13:48:49.450412	2016-04-06 14:44:38.162187	\N		Cjal Leticia Pauluzzi 				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4651	2	Proyecto de Resolucion de Interes Legislativo el XXV Congreso Argentino de la Ciencia Del Suelo- "Ordenamiento Territorial: Un desafio para la Ciencia del Suelo".	\N	\N	\N		Peticion	2016-04-06 15:20:09.565928	2016-04-06 15:42:05.048238	\N		Concejal Josè Barotti				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4647	20	Eximicion Inmobiliario	\N	\N	\N		Condonacion	2016-04-06 13:19:53.789722	2016-04-06 15:49:46.119185	\N	\N	Rodriguez Antonio	Mariquita Sanchez de Thompson 327	No tiene		\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4650	15	Eximicion- Condonacion Inmobiliario.	\N	\N	\N		Condonacion	2016-04-06 15:14:41.442279	2016-04-06 15:50:19.783209	\N	\N	Villegas Langina Reimunda	Anibal Ponce 1256	0358- 154182569		\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4627	58	Dictamenes en Disidencia: 043/16 - 042/16 - 041/16 - 040/16 - 039/16 - 038/16- 037/16 - 036/16 - 035/16 - -034/16 - 033/16 - 032/16 - 031/16 - 030/16 - 029/16 - 028/16 - 027/16 - 026/16 - 025/16 -  024/16 - 023/16 - 022/16 - 021/16 - 020/16 - 019/16 - 018/16	\N	\N	\N	convertida en Expediente Legislativo Nº 23330 ,tratado en sesión Nº 180, con fecha 07/04/2016	Peticion	2016-04-04 12:33:02.374739	2016-04-06 16:40:33.044641	\N	Secretaria del Concejo Deliberante	Tribunal de Cuentas - Aroldo Arguello				\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4663	13	Eximicion- Condonacion Emos- Inmobiliario.	\N	\N	\N		Condonacion	2016-04-06 15:58:09.151412	2016-04-06 16:06:42.865944	\N	\N	Alfonso Oscar Antonio	Fray Justo Santa Maria De Oro 926	0358-154182569		\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4628	9	Solicita Eximiciòn . Condonaciòn Impuesto Inmobiliario 	\N	\N	\N	convertida en Expediente Legislativo Nº 23331 ,tratado en sesión Nº 180, con fecha 07/04/2016	Condonacion	2016-04-04 13:07:52.317986	2016-04-06 16:36:26.650027	\N	\N	Vilchez Marìa Cristina	Rio Colorado 558	358 - 5099776		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4617	2	Proyecto de Ordenanza: Por la que se Contratan los servicios Profesionales del Cdor. Marcelo Antonio Ristorto y de la Arq.  Silvina Andrea Martin Garcia para que se desempeñen en el àmbito del EMOS\r\nAnexo: Copias	\N	\N	\N	convertida en Expediente Legislativo Nº 23321 ,tratado en sesión Nº 180, con fecha 07/04/2016	Peticion	2016-03-31 15:20:26.041323	2016-04-06 16:39:56.333373	\N	Secretaria del Concejo Deliberante	DEM - Juan Ruben Jure - Ab. Ignacio Fernandez - Cdora. Maria Alicia Panza				\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4669	3	\N	\N	\N	\N	Dicho Despacho fue recibido y firmado por el Secretario del Concejo	Despacho	2016-04-06 16:08:25.155255	2016-04-07 11:17:35.034816	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-04-04
4667	1	\N	\N	\N	\N		Despacho	2016-04-06 16:05:22.751743	2016-04-07 12:14:46.021518	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-04-06
4666	2	\N	\N	\N	\N		Despacho	2016-04-06 16:03:09.285596	2016-04-07 12:23:26.9116	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-04-06
4665	4	\N	\N	\N	\N		Despacho	2016-04-06 16:01:09.03962	2016-04-07 12:34:12.709362	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-04-06
4662	4	\N	\N	\N	\N		Despacho	2016-04-06 15:57:32.055232	2016-04-07 13:05:08.828906	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-04-06
4664	4	\N	\N	\N	\N		Despacho	2016-04-06 15:59:38.333873	2016-04-07 12:45:52.239452	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-04-06
4672	7	Solicita pasajes uno (Ida y vuelta) a ciudad de Bs As por motivos de salud.	\N	\N	\N		Peticion	2016-04-07 12:15:04.024277	2016-04-07 12:50:05.983143	\N		Mirta Tissera				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4661	4	\N	\N	\N	\N		Despacho	2016-04-06 15:55:45.776986	2016-04-07 13:13:19.87245	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-04-06
4660	4	\N	\N	\N	\N		Despacho	2016-04-06 15:54:01.816013	2016-04-07 15:37:54.53103	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-04-06
4658	4	\N	\N	\N	\N		Despacho	2016-04-06 15:50:22.787783	2016-04-07 15:55:50.685871	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-04-06
4655	1	\N	\N	\N	\N		Despacho	2016-04-06 15:36:58.620206	2016-04-07 16:00:25.182262	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-04-06
4653	1	\N	\N	\N	\N		Despacho	2016-04-06 15:33:17.127627	2016-04-07 16:04:40.13546	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-04-06
4639	1	Nota solicitando se declare de interes Municipal, al evento Cultural Furtivo II Almacen de Arte.	\N	\N	\N	Convertida en Expediente Legislativo Nº 23343 ,tratado en sesión Nº 180, con fecha 07/04/2016	Peticion	2016-04-05 14:53:46.687703	2016-04-06 16:52:28.635258	\N		Subsacretaria de de Cultura. Matias Zamanillo (Subsecretario de Cultura)	Constitucion 947 (Planta Alta)	0358-4671205/206/207		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4674	15	Eximicion- Condonacion Inmobiliario	\N	\N	\N	Convertido en Expte Legislativo Nº 23353 en Sesión Ordinaria  N 181 de fecha 14/4/2016	Condonacion	2016-04-07 13:19:11.882887	2016-04-14 12:18:12.663302	\N	\N	Ana Maria Blanc	Belisario Roldan 1120	0358-154842561		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4673	6	Solicita dos pasajes a ciudad de Bs As para la niña Milagros Teves y su padre Ariel Horacio Teves.	\N	\N	\N		Peticion	2016-04-07 12:16:46.649802	2016-04-07 12:21:59.278585	\N		Cjal Carlos Gaso				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4671	10	Se le otorga a Maria Alejandra Saliva dos pasajes de ida y vuelta a Bs As por motivos de salud.	\N	\N	\N		Peticion	2016-04-07 12:11:18.147465	2016-04-07 12:47:08.162304	\N		Cjal Cabral Maria Del Carmen				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4679	1	Trasmiten preocupaciòn de los Asociados por el elevado costo de la tasa de recolecciòn de residuos patògenos	\N	\N	\N	Convertido en Expte Legislativo Nº 23357 en Sesión Ordinaria  N 181 de fecha 14/4/2016	Peticion	2016-04-08 12:16:33.981667	2016-04-14 12:39:40.931075	\N	Secretaria del Concejo Deliberante	Centro de Bioquimicos Regional  de Rìo Cuarto	Sobremonte 1069	358 - 4647172		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4691	9	Solicita ayuda economica por motivos de salud.	\N	\N	\N	Convertido en Expte Legislativo Nº 23368 en Sesión Ordinaria  N 181 de fecha 14/4/2016	Peticion	2016-04-11 14:50:57.244566	2016-04-14 13:17:01.081561	\N		Flavia Ayelen Olmos	11 de noviembre 845	0358-154367467		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4677	3	Solicita ayuda economica con el fin de llevar a competir a su hijo al campeonato Mundial De Biciross que se realizara en la ciudad de Medellin, Colombia.	\N	\N	\N	Convertido en Expte Legislativo Nº 23359 en Sesión Ordinaria  N 181 de fecha 14/4/2016	Peticion	2016-04-07 15:42:46.270313	2016-04-14 12:45:56.383294	\N		Pablo Pomilio	Juan B. Justo 548	0358-154237257		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4678	\N	Solicitan pasaje a la Ciudad de Buenos Aires, lo cùal se le otorga 1 pasaje de Ida y 1 de Regreso al Sñor Ivar Josè Torassa - 16635227	\N	\N	\N		Peticion	2016-04-08 12:03:45.088772	2016-04-08 12:50:54.383165	\N	Contaduria Concejo Deliberante	Agrupacion de Veteranos Continentales Afectados a Malvinas	Dinkeldein 2200 - Casa 11 A - 	358 - 155077204 - 4624638		\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4688	1	Solicita la instalacion de un semaforo en calle Almafuerte al 300, ya que no solamente esr que permita a los adultos mayores cruzar la calle con toda seguridad, ya que no solamente estan borradas las sendas peatonales sino que no hay ninguna demarcacion que prevenga a los conductores la circulacion de adultos mayores.	\N	\N	\N	Convertido en Expte Legislativo Nº 23362 en Sesión Ordinaria  N 181 de fecha 14/4/2016	Peticion	2016-04-11 13:07:25.06738	2016-04-14 12:48:16.19434	\N		Gabriela Muller (Subsecretaria de extension Area Adultos Mayores Coordinadora PEAM. UNCR)	Almafuerte 300 ( Esquina Vcte Lopez)	0358- 46210212		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4682	18	Solicita Eximiciòn - Condonaciòn Impuesto Inmobiliario	\N	\N	\N	Convertido en Expte Legislativo Nº 23360 en Sesión Ordinaria  N 181 de fecha 14/4/2016	Condonacion	2016-04-08 14:53:18.762922	2016-04-14 12:21:01.942609	\N	\N	Guzman Adriana Alicia	Gobernador Lopez 681	358 - 154852335		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4684	9	Proyecto de Ordenanza: Por la que se Aprueba  la carta intenciòn  firmada con el Banco Ciudad de Buenos Airesy los dirigentes de los Clubes Urù Cure, Asociaciòn Atletica Banda Norte y Club Deportivo Rìo Cuarto de esta Ciudad	\N	\N	\N	Convertido en Expte Legislativo Nº 23365 en Sesión Ordinaria  N 181 de fecha 14/4/2016	Peticion	2016-04-11 12:17:17.323502	2016-04-14 13:07:26.079371	\N	Secretaria del Concejo Deliberante	DEM - Juan Ruben Jure - Ab. Ignacio Fernandez - Cdora. Maria Alicia Panza				\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4690	2	Comunica extension de su licencia sin goce de sueldo hasta el dia 27 de abril de 2016 inclusive. Adjunta Acta Convocatoria de la proxima sesion del Parlasur.	\N	\N	\N	Convertido en Expte Legislativo Nº 23369 en Sesión Ordinaria  N 181 de fecha 14/4/2016	Peticion	2016-04-11 14:46:07.863605	2016-04-14 13:17:22.201189	\N		 Ing..Humberto Benedetto				\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4801	7	Proyecto de Ordenanza: Solicita ayuda ecònomica para la Sra. Pereyra Claudia Vanina por razones de salud de su Hijo	\N	\N	\N	Expediente Legislativo Nº 23418- iniciado en Sesión Ordinaria Nº 183 de fecha 5/5/16	Peticion	2016-04-25 12:45:38.89336	2016-05-04 13:25:17.101405	\N	Secretaria del Concejo Deliberante	Concejal  Mauricio Dova				\N	\N	\N	\N	\N	rarias@entrada.com	\N
4785	15	Eximicion- Condonacion Inmobiliario.\r\n\r\nLlamar antes de ir.	\N	\N	\N	\r\nExpediente Legislativo Nº 23421- iniciado en Sesión Ordinaria Nº 183 de fecha 5/5/16	Condonacion	2016-04-21 14:15:22.795283	2016-05-04 13:26:42.938036	\N	\N	Vilma Nori Bombillani	Lavalle 735	0358- 4634982		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4686	12	Eximicion Inmobiliario	\N	\N	\N	Convertido en Expte Legislativo Nº 23363 en Sesión Ordinaria  N 181 de fecha 14/4/2016	Condonacion	2016-04-11 12:50:10.897656	2016-04-14 12:22:25.872972	\N	\N	Leon Ferrada Manuel Rosalindo	Gral Miguel de Molina 957	0358-154026977		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4793	2	Proyecto de Ordenaza por el que se modifica los anexos I (Estructura Organica), II (Diagama estructura Organica) y III (Misiones y Funciones), de la ordenanza 336/13.	\N	\N	\N	Expediente Legislativo Nº 23423- iniciado en Sesión Ordinaria Nº 183 de fecha 5/5/16	Peticion	2016-04-21 16:03:01.998325	2016-05-04 13:38:34.129851	\N		DEM - Juan Ruben Jure - Ab. Ignacio Fernandez - Cdora. Maria Alicia Panza				\N	\N	\N	\N	\N	rarias@entrada.com	\N
4847	\N	Direcciòn General de Zoonosis, la Divisiòn de castraciones de Caninos y Felinos,solicitan incorporar  en el Organigrama sobre exp nº 23412	\N	\N	\N	Nota convertida en Circuito  Nº 1 - 23412- (-DEL Expediente Legislativo Nº 23412)- iniciado en Sesión Ordinaria Nº 183 de fecha 5/5/16	Peticion	2016-05-03 14:19:51.244042	2016-05-04 13:52:19.401519	\N	Secretaria del Concejo Deliberante	EDECOM - Dr.Artero Oscar 				\N	\N	\N	\N	\N	rarias@entrada.com	\N
4676	\N	Decreto Nº 3510/16,el referido decreto tiene por objeto la adhesiòn nº 1244/98del Poder Ejecutivo Nacional que establece un beneficio mensual para el personal que acredite la condiciòn de ex combatiente en las acciones bèlicas	\N	\N	\N	Convertido en Expte Legislativo Nº 23352 en Sesión Ordinaria  N 181 de fecha 14/4/2016	Peticion	2016-04-07 13:32:50.701337	2016-04-14 12:35:16.962323	\N	Secretaria del Concejo Deliberante	DEM - Juan Ruben Jure - Ab. Ignacio Fernandez -  				\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4681	1	Ponen en conocimiento que desde el Departamento de Educaciòn Fisica de nuestra Institituciòn estàn organizando la 7º Ediciòn de la Maratòn de los Coligios Secundarios y tambièn Solicitan ayuda ecònomica mencionan igual a la del año pasado de $ 7000	\N	\N	\N	Convertido en Expte Legislativo Nº 23355 en Sesión Ordinaria  N 181 de fecha 14/4/2016	Peticion	2016-04-08 14:17:13.964378	2016-04-14 12:36:15.44955	\N	Secretaria del Concejo Deliberante	Maraton de Colegios Secundarios - Colegio Hispano Argentino	Fotheringan 60	358 - 4646329		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4680	4	Poyecto de Ordenanza s/ apertura del padron Civico Municipal de Extranjeros.	\N	\N	\N	Convertido en Expte Legislativo Nº 23356 en Sesión Ordinaria  N 181 de fecha 14/4/2016	Peticion	2016-04-08 13:16:12.180735	2016-04-14 12:36:36.436964	\N		Cejal Viviana Pomiglio. (Bloque Rio Cuarto Para Todos.)				\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4851	1	\N	\N	\N	\N		Despacho	2016-05-04 13:25:32.269849	2016-05-04 14:15:23.556515	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-05-02
4856	5	Proyecto de Ordenanza: Otorguese a la sra Moreno Susana Gabriela un aporte economico de pesos un mil ($1.000) destinados a solventar gastos de salud.	\N	\N	\N		Peticion	2016-05-04 15:07:40.475393	2016-05-04 16:33:41.186122	\N		Cjal Daniela Miranda				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4860	\N	\N	\N	\N	\N		Despacho	2016-05-04 15:14:08.239279	2016-05-05 10:43:55.304259	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-05-03
4866	4	\N	\N	\N	\N		Despacho	2016-05-04 15:27:30.232391	2016-05-05 11:06:40.074606	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-05-04
4685	7	Solicita Eximiciòn año 2016 Impuesto Inmobiliario	\N	\N	\N	Convertido en Expte Legislativo Nº 23364 en Sesión Ordinaria  N 181 de fecha 14/4/2016	Condonacion	2016-04-11 12:43:40.101372	2016-04-14 12:23:32.019151	\N	\N	Sandoval Ema Etelvina	Segurola 1646	358 - 154907484		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4865	1	\N	\N	\N	\N		Despacho	2016-05-04 15:26:07.080715	2016-05-05 11:30:37.235037	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-05-04
4687	15	Solicita ayuda  ecònomica por razones de saludpara su hijo Chesta Lautaro Valentin	\N	\N	\N	Convertido en Expte Legislativo Nº 23361 en Sesión Ordinaria  N 181 de fecha 14/4/2016	Peticion	2016-04-11 13:03:29.98017	2016-04-14 13:06:48.425213	\N	Secretaria del Concejo Deliberante	Aguirre Cecilia Bibiana	Maipù 2617	358 - 154368813		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4683	7	Proyecto de Ordenanza: Por la que se revoca la donaciòn de un terreno a la Parroquia  Marìa Madre de la Iglesia y San Pantaleòn efectuada por Ordenanza Nº 1383/11	\N	\N	\N	Convertido en Expte Legislativo Nº 23366 en Sesión Ordinaria  N 181 de fecha 14/4/2016	Peticion	2016-04-11 12:13:35.75277	2016-04-14 13:13:05.498202	\N	Secretaria del Concejo Deliberante	DEM - Juan Ruben Jure - Ab. Ignacio Fernandez - Cdora. Maria Alicia Panza				\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4689	2	Nota en referencia a la propuesta presentada de modificacion del punto 4.8 del Plan Urbano Municipal.	\N	\N	\N	Convertido en Expte Legislativo Nº 23370 en Sesión Ordinaria  N 181 de fecha 14/4/2016	Peticion	2016-04-11 14:38:35.796506	2016-04-14 13:17:44.827104	\N		Prof. Roberto Luis Rovere (RECTOR U.N.C.R)		0358-4676148		\N	\N	\N	\N	\N	sanchezlilianamaria@admin.com	\N
4796	4	Eximiciòn - Condonaciòn Impuesto Cementerio	\N	\N	\N	Expediente Legislativo Nº 23419- iniciado en Sesión Ordinaria Nº 183 de fecha 5/5/16	Condonacion	2016-04-22 12:40:41.569457	2016-05-04 13:25:42.325184	\N	\N	Bustos Maria Magdalena	Mercedario 1656	358 437411		\N	\N	\N	\N	\N	rarias@entrada.com	\N
4850	10	Proyecto de Ordenanza; Solicita Eximiciòn - Condonaciòn Impuesto sobre los Inmuebles a la Sra Sutil de Juan Primitiva	\N	\N	\N		Peticion	2016-05-04 13:00:03.758531	2016-05-04 13:35:44.947407	\N	Secretaria del Concejo Deliberante	Concejal Barotti Jose	Mariquita Sanchez de Thopson 650	358 - 4385350		\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4853	3	proyecto de Ordenanza: Solicita ayuda ecònomica destinada a la Sra Lazarte Veronica destinados afrontar gastos de primera necesidad	\N	\N	\N		Peticion	2016-05-04 13:38:43.524758	2016-05-04 13:53:06.151988	\N	Secretaria del Concejo Deliberante	Concejal Guillermo Natali	Entre Rìos 935	358 - 154398373		\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4852	2	Proyecto de Ordenanza por la que se otorga a la sra Clara Patricia Fernandez, un terreno de propiedad Municipal.	\N	\N	\N	Anexo 9400- S-2013. 47 fojas	Peticion	2016-05-04 13:30:47.935298	2016-05-04 14:46:51.38513	\N		DEM				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4873	2	Proyecto de Resolucion: Otorgase a la Coordinacion del Torneo de Hockey sobre Cesped un aporte economico de pesos tres mil ($ 3.000) para afrontar gastos inherentes.	\N	\N	\N		Peticion	2016-05-04 15:58:13.045744	2016-05-04 16:08:55.0804	\N		Cjal Martin Carranza, Cjal Prof. Claudio Miranda				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4872	2	Proyecto de Resolucion: Declarar de Interes Legislativo y Deportivo el Campeonato Regional de Clubes B, Centro Cuyo que se realizara en las Instalaciones del Polideportivo Municipal Nª 2 de la ciudad de Rio Cuarto a celebrarse el 26 de abril al 2 de mayo de 2016.	\N	\N	\N		Peticion	2016-05-04 15:50:17.87441	2016-05-04 16:14:29.912601	\N		Cjal Martin Carranza ,Cjal Prof. Claudio Miranda				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4871	2	Proyecto de Resolucion: Declarar de inters Legislativo la actividad "Encuentro Provincial de Cooperativas de Cartoneros y Recicladores".	\N	\N	\N		Peticion	2016-05-04 15:38:52.904836	2016-05-04 16:18:33.398563	\N		Cjal Francisco Varela Geuna ( Bloque Rio Cuarto Para Todos), Cjal Osvaldo Da Costa, Cjal Leticia Perez, Cjal Jose Barotti.				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4855	5	Proyecto de Ordenanza: Otorgar a la Sra Paola Casas un aporte economico de mil pesos (Un mil) destinados a solventar gastos de salud.	\N	\N	\N		Peticion	2016-05-04 15:04:21.947121	2016-05-04 16:29:50.151075	\N		Cjal Daniela Miranda				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4861	1	\N	\N	\N	\N		Despacho	2016-05-04 15:20:52.051431	2016-05-05 12:03:16.046183	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-05-04
4869	1	\N	\N	\N	\N		Despacho	2016-05-04 15:35:05.916104	2016-05-05 12:12:56.953458	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-05-04
4862	5	\N	\N	\N	\N		Despacho	2016-05-04 15:22:22.163938	2016-05-05 12:26:17.820589	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-05-04
4864	5	\N	\N	\N	\N		Despacho	2016-05-04 15:24:57.214725	2016-05-05 12:43:25.18878	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mechenique@entrada.com	2016-05-04
4875	11	Solicita Eximiciòn Impuesto Inmobiliario año 2016	\N	\N	\N		Condonacion	2016-05-05 11:51:58.51429	2016-05-05 12:51:02.869571	\N	\N	Gauna Luisa Elsa	Lago Lacar 2262	358- 4282460 - 4621952		\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4877	7	Solicita Eximiciòn Impuesto Inmobiliario año 2016	\N	\N	\N		Condonacion	2016-05-05 13:14:59.269308	2016-05-05 13:18:15.224864	\N	\N	Torres Teresa	Guayaquil 485	358 - 4281357		\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4876	\N	Decretos:3299/16 - 3306/16 - 3307/16 - 3308/16 - 3323/16 - 3324/16 - 3325/16 - 3326/16 - 3334/16 - 3353/16 - 3354/16 - 3355/16 - 3364/16 - 3365/16 - 3367/16 - 3374/16 - 3375/16 - 3376/16 - 3381/16 - 3382/16 - 3383/16 - 3384/16 - 3385/15 -3386/16 - 3387/16 - 3388/16 - 3389/16 - 3390/16 - 3391/16 - 3392/16 - 3393/16 - 3394/16 - 3395/16 - 3396/16 - - 3397/16 - 3398/16 - 3399/16 - 3400/16 - 3401/16 - 3402/16 - 3403/16 - 3404/16 - 3405/16 - 3406/16 - 3407/16 - 3408/16 - 3409/16 - 3410/16  - 3411/16 - 3412/16 - 3413/16 - 3414/16 - 3415/16 - 3416/16 - 3417/16 - 3418/16 - 3419/16 - 3421/16  -   3422/16 - 3423/16 - 3424/16 - -3425/16 - 3426/16 - 3429/16 - 3430/16 - 3431/16 - 3432/16 - 3434/16 - 3435/16 - 3590/16 - 3591/16 - 3592/16 - 3593/16 - 3594/16 - 3595/16 -  Ordenanzas:1414/16 - 1419/16 - 1420/16 - 1421/16 - 1422/16 - 1423/16 - 	\N	\N	\N		Peticion	2016-05-05 12:27:02.00838	2016-05-05 14:41:35.450503	\N	Informatica	DEM				\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4883	10	Eximiciòn Condonaciòn Impuesto Inmobiliario	\N	\N	\N		Condonacion	2016-05-06 11:44:57.953586	2016-05-06 14:07:15.249468	\N	\N	Carreras Victor	Marcos Lloveras 1245	358 - 5016827		\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4879	14	Solicita Eximiciòn Condonaciòn Impuesto Inmobiliario	\N	\N	\N		Condonacion	2016-05-05 14:48:45.950092	2016-05-05 14:57:42.819765	\N	\N	Palacio Sandra Noemi	Jose Biassi 927	358 - 5149647		\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4880	28	Solicita Eximiciòn Condonaciòn Impuesto Inmobiliario	\N	\N	\N		Condonacion	2016-05-05 15:09:34.554983	2016-05-05 15:19:17.807478	\N	\N	Heredia Juan Domingo	Entre Rios 1256	358 - 154306755		\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4881	17	Solicita Eximiciòn  Condonaciòn Impuesto Inmobiliario	\N	\N	\N		Condonacion	2016-05-05 15:30:20.487293	2016-05-05 15:42:50.475469	\N	\N	Heredia Juan Domingo	Entre Rios 336 - D	358 -155134861		\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4878	13	Solicita Eximiciòn Condonaciòn Impuesto Inmobiliario	\N	\N	\N		Condonacion	2016-05-05 14:01:09.320454	2016-05-05 15:45:56.745224	\N	\N	Palacios Jose Osvaldo	Maipù 3021	358 - 5149647		\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4863	4	Nota solicitando solicitando incorporar la presente solicitud al expediente Legislativo Nº 23412.	\N	\N	\N	Se da aviso al sr Ernesto Segre que tiene que ingresar dicha nota primero por despacho, se hace devoluciòn de ella misma	Peticion	2016-05-04 15:23:41.799269	2016-05-06 11:11:16.569418	\N		Direccion Gral De  higiene Urbana y Espacios Verdes (Dr Ernesto M. Segre).	Colombres 1600	0358-4671332		\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4882	2	Solicita pasaje (uno) ida y vuelta a ciudad de Cordoba para el sr Nicolas Rojo para participar en el foro de jovenes Emprendedores en dicha ciudad.	\N	\N	\N		Peticion	2016-05-06 11:40:19.335566	2016-05-06 11:40:19.335566	\N		Cjal Olga Ysabel Cantoro				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4884	9	Solicita Eximicipon Impuesto Inmobiliario año 2016	\N	\N	\N		Condonacion	2016-05-06 12:00:21.110994	2016-05-06 12:02:18.656875	\N	\N	Rodriguez Rafael 	Libertador Gral San Martin	358 -156020270		\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4886	2	Solicita pasaje (ida y vuelta) a Cordoba para el sr Rodriguez Dario Ezequiel por motivos personales.	\N	\N	\N		Peticion	2016-05-06 13:47:04.406709	2016-05-06 13:57:02.779757	\N		CJal Martin Carranza				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4885	6	Propone un Proyecto de Ordenanza a los fines de regularizar un problema que se a generado en zona ampliada dentro del ejido municipal\r\nanexo de mapas 7	\N	\N	\N		Peticion	2016-05-06 13:37:18.536826	2016-05-06 16:02:52.009297	\N	Secretaria del Concejo Deliberante	Nadal Javier Enrique	Alberdi 1386	0358 - 154198114		\N	\N	\N	\N	\N	mechenique@entrada.com	\N
4887	\N	Dictamenes en Disidencia:087/16, 086/16, 085/15, 084/16, 083/16, 082/16, 081/16, 080/16, 079/16, 077/16, 076/16,075/16, 074/16, 073/16, 072/16071/16, 070/16, 069/16,068/16, 068/16, 067/16,066/16,065/16, 064/16, 063/16, 062/16, 061/16, 060/16, 058/16, 057/16, 056/16, 055/16,054/16,  053/15, 052/16, 051/16, 050/16,049/16, 048/16, 047/16, 046/15, 045/16, 044/16.	\N	\N	\N		Peticion	2016-05-06 15:24:02.076854	2016-05-06 15:43:23.934335	\N		Tribunal de Cuentas.Martin Cantoro.				\N	\N	\N	\N	\N	mbaudino@entrada.com	\N
4874	5	Proyecto de Ordenanza: Otorgar al sr Alan Williams Rodriguez un aporte economico de tres mil pesos ($3.000) destinados a solventar gastos  que demanda su actividad deportiva.	\N	\N	\N		Peticion	2016-05-04 16:00:54.046876	2016-05-06 16:05:47.043993	\N		Concejal Martin Carranza	Avenida MarconiI 1131	358 - 154900184		\N	\N	\N	\N	\N	mechenique@entrada.com	\N
\.


--
-- Name: tramites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tramites_id_seq', 4887, true);


--
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY usuarios (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, persona_id) FROM stdin;
\.


--
-- Name: usuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('usuarios_id_seq', 1, false);


--
-- Name: acumulas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY acumulas
    ADD CONSTRAINT acumulas_pkey PRIMARY KEY (id);


--
-- Name: adjunta_fisicamentes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY adjunta_fisicamentes
    ADD CONSTRAINT adjunta_fisicamentes_pkey PRIMARY KEY (id);


--
-- Name: admin_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY admin_users
    ADD CONSTRAINT admin_users_pkey PRIMARY KEY (id);


--
-- Name: bloques_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY bloques
    ADD CONSTRAINT bloques_pkey PRIMARY KEY (id);


--
-- Name: boletin_oficials_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY boletin_oficials
    ADD CONSTRAINT boletin_oficials_pkey PRIMARY KEY (id);


--
-- Name: capitulos_normas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY capitulos_normas
    ADD CONSTRAINT capitulos_normas_pkey PRIMARY KEY (id);


--
-- Name: capitulos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY capitulos
    ADD CONSTRAINT capitulos_pkey PRIMARY KEY (id);


--
-- Name: circuito_ordens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY circuito_ordens
    ADD CONSTRAINT circuito_ordens_pkey PRIMARY KEY (id);


--
-- Name: circuitos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY circuitos
    ADD CONSTRAINT circuitos_pkey PRIMARY KEY (id);


--
-- Name: clasificacions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY clasificacions
    ADD CONSTRAINT clasificacions_pkey PRIMARY KEY (id);


--
-- Name: comisions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY comisions
    ADD CONSTRAINT comisions_pkey PRIMARY KEY (id);


--
-- Name: dependencia_municipals_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY dependencia_municipals
    ADD CONSTRAINT dependencia_municipals_pkey PRIMARY KEY (id);


--
-- Name: destinos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY destinos
    ADD CONSTRAINT destinos_pkey PRIMARY KEY (id);


--
-- Name: diario_de_sesions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY diario_de_sesions
    ADD CONSTRAINT diario_de_sesions_pkey PRIMARY KEY (id);


--
-- Name: digestos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY digestos
    ADD CONSTRAINT digestos_pkey PRIMARY KEY (id);


--
-- Name: documentacion_presentadas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY documentacion_presentadas
    ADD CONSTRAINT documentacion_presentadas_pkey PRIMARY KEY (id);


--
-- Name: estado_expedientes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY estado_expedientes
    ADD CONSTRAINT estado_expedientes_pkey PRIMARY KEY (id);


--
-- Name: estado_tramites_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY estado_tramites
    ADD CONSTRAINT estado_tramites_pkey PRIMARY KEY (id);


--
-- Name: expediente_administrativos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY expediente_administrativos
    ADD CONSTRAINT expediente_administrativos_pkey PRIMARY KEY (id);


--
-- Name: expedientes_despachos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY expedientes_despachos
    ADD CONSTRAINT expedientes_despachos_pkey PRIMARY KEY (id);


--
-- Name: expedientes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY expedientes
    ADD CONSTRAINT expedientes_pkey PRIMARY KEY (id);


--
-- Name: libros_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY libros
    ADD CONSTRAINT libros_pkey PRIMARY KEY (id);


--
-- Name: modifica_relationships_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY modifica_relationships
    ADD CONSTRAINT modifica_relationships_pkey PRIMARY KEY (id);


--
-- Name: normas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY normas
    ADD CONSTRAINT normas_pkey PRIMARY KEY (id);


--
-- Name: orden_del_dia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY orden_del_dia
    ADD CONSTRAINT orden_del_dia_pkey PRIMARY KEY (id);


--
-- Name: otra_publicacions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY otra_publicacions
    ADD CONSTRAINT otra_publicacions_pkey PRIMARY KEY (id);


--
-- Name: periodos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY periodos
    ADD CONSTRAINT periodos_pkey PRIMARY KEY (id);


--
-- Name: personas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY personas
    ADD CONSTRAINT personas_pkey PRIMARY KEY (id);


--
-- Name: relationship_concejals_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY relationship_concejals
    ADD CONSTRAINT relationship_concejals_pkey PRIMARY KEY (id);


--
-- Name: reparticion_oficials_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY reparticion_oficials
    ADD CONSTRAINT reparticion_oficials_pkey PRIMARY KEY (id);


--
-- Name: rols_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY rols
    ADD CONSTRAINT rols_pkey PRIMARY KEY (id);


--
-- Name: seccions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY seccions
    ADD CONSTRAINT seccions_pkey PRIMARY KEY (id);


--
-- Name: sesions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sesions
    ADD CONSTRAINT sesions_pkey PRIMARY KEY (id);


--
-- Name: sub_seccions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sub_seccions
    ADD CONSTRAINT sub_seccions_pkey PRIMARY KEY (id);


--
-- Name: tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- Name: titulos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY titulos
    ADD CONSTRAINT titulos_pkey PRIMARY KEY (id);


--
-- Name: tramites_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tramites
    ADD CONSTRAINT tramites_pkey PRIMARY KEY (id);


--
-- Name: usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);


--
-- Name: index_acumulas_on_acumula_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_acumulas_on_acumula_id ON acumulas USING btree (acumula_id);


--
-- Name: index_acumulas_on_acumulado_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_acumulas_on_acumulado_id ON acumulas USING btree (acumulado_id);


--
-- Name: index_adjunta_fisicamentes_on_adjunta_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_adjunta_fisicamentes_on_adjunta_id ON adjunta_fisicamentes USING btree (adjunta_id);


--
-- Name: index_adjunta_fisicamentes_on_adjuntado_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_adjunta_fisicamentes_on_adjuntado_id ON adjunta_fisicamentes USING btree (adjuntado_id);


--
-- Name: index_admin_users_on_email; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX index_admin_users_on_email ON admin_users USING btree (email);


--
-- Name: index_admin_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX index_admin_users_on_reset_password_token ON admin_users USING btree (reset_password_token);


--
-- Name: index_bloque_periodos_on_bloque_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_bloque_periodos_on_bloque_id ON bloque_periodos USING btree (bloque_id);


--
-- Name: index_bloque_periodos_on_periodo_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_bloque_periodos_on_periodo_id ON bloque_periodos USING btree (periodo_id);


--
-- Name: index_bloques_tramites_on_bloque_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_bloques_tramites_on_bloque_id ON bloques_tramites USING btree (bloque_id);


--
-- Name: index_bloques_tramites_on_tramite_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_bloques_tramites_on_tramite_id ON bloques_tramites USING btree (tramite_id);


--
-- Name: index_boletin_oficials_normas_on_boletin_oficial_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_boletin_oficials_normas_on_boletin_oficial_id ON boletin_oficials_normas USING btree (boletin_oficial_id);


--
-- Name: index_boletin_oficials_normas_on_norma_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_boletin_oficials_normas_on_norma_id ON boletin_oficials_normas USING btree (norma_id);


--
-- Name: index_capitulos_normas_on_capitulo_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_capitulos_normas_on_capitulo_id ON capitulos_normas USING btree (capitulo_id);


--
-- Name: index_capitulos_normas_on_norma_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_capitulos_normas_on_norma_id ON capitulos_normas USING btree (norma_id);


--
-- Name: index_circuito_ordens_on_circuito_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_circuito_ordens_on_circuito_id ON circuito_ordens USING btree (circuito_id);


--
-- Name: index_circuito_ordens_on_orden_del_dia_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_circuito_ordens_on_orden_del_dia_id ON circuito_ordens USING btree (orden_del_dia_id);


--
-- Name: index_circuitos_normas_on_circuito_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_circuitos_normas_on_circuito_id ON circuitos_normas USING btree (circuito_id);


--
-- Name: index_circuitos_normas_on_norma_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_circuitos_normas_on_norma_id ON circuitos_normas USING btree (norma_id);


--
-- Name: index_circuitos_on_expediente_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_circuitos_on_expediente_id ON circuitos USING btree (expediente_id);


--
-- Name: index_circuitos_on_tramite_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_circuitos_on_tramite_id ON circuitos USING btree (tramite_id);


--
-- Name: index_clasificacions_normas_on_clasificacion_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_clasificacions_normas_on_clasificacion_id ON clasificacions_normas USING btree (clasificacion_id);


--
-- Name: index_clasificacions_normas_on_norma_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_clasificacions_normas_on_norma_id ON clasificacions_normas USING btree (norma_id);


--
-- Name: index_comisions_despachos_on_comision_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_comisions_despachos_on_comision_id ON comisions_despachos USING btree (comision_id);


--
-- Name: index_comisions_despachos_on_despacho_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_comisions_despachos_on_despacho_id ON comisions_despachos USING btree (despacho_id);


--
-- Name: index_comisions_periodos_on_comision_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_comisions_periodos_on_comision_id ON comisions_periodos USING btree (comision_id);


--
-- Name: index_comisions_periodos_on_periodo_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_comisions_periodos_on_periodo_id ON comisions_periodos USING btree (periodo_id);


--
-- Name: index_comisions_personas_on_comision_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_comisions_personas_on_comision_id ON comisions_personas USING btree (comision_id);


--
-- Name: index_comisions_personas_on_concejal_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_comisions_personas_on_concejal_id ON comisions_personas USING btree (concejal_id);


--
-- Name: index_comisions_tramites_on_comision_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_comisions_tramites_on_comision_id ON comisions_tramites USING btree (comision_id);


--
-- Name: index_comisions_tramites_on_tramite_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_comisions_tramites_on_tramite_id ON comisions_tramites USING btree (tramite_id);


--
-- Name: index_despachos_concejals_on_concejal_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_despachos_concejals_on_concejal_id ON despachos_concejals USING btree (concejal_id);


--
-- Name: index_despachos_concejals_on_despacho_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_despachos_concejals_on_despacho_id ON despachos_concejals USING btree (despacho_id);


--
-- Name: index_documentacion_presentadas_on_condonacion_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_documentacion_presentadas_on_condonacion_id ON documentacion_presentadas USING btree (condonacion_id);


--
-- Name: index_estado_expedientes_on_circuito_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_estado_expedientes_on_circuito_id ON estado_expedientes USING btree (circuito_id);


--
-- Name: index_estado_expedientes_on_ref_type_and_ref_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_estado_expedientes_on_ref_type_and_ref_id ON estado_expedientes USING btree (ref_type, ref_id);


--
-- Name: index_estado_tramites_on_ref_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_estado_tramites_on_ref_id ON estado_tramites USING btree (ref_id);


--
-- Name: index_estado_tramites_on_tramite_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_estado_tramites_on_tramite_id ON estado_tramites USING btree (tramite_id);


--
-- Name: index_expediente_administrativos_on_expediente_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_expediente_administrativos_on_expediente_id ON expediente_administrativos USING btree (expediente_id);


--
-- Name: index_expedientes_despachos_on_despacho_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_expedientes_despachos_on_despacho_id ON expedientes_despachos USING btree (despacho_id);


--
-- Name: index_expedientes_despachos_on_expediente_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_expedientes_despachos_on_expediente_id ON expedientes_despachos USING btree (expediente_id);


--
-- Name: index_expedientes_tags_on_expediente_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_expedientes_tags_on_expediente_id ON expedientes_tags USING btree (expediente_id);


--
-- Name: index_expedientes_tags_on_tag_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_expedientes_tags_on_tag_id ON expedientes_tags USING btree (tag_id);


--
-- Name: index_modifica_relationships_on_me_modifica_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_modifica_relationships_on_me_modifica_id ON modifica_relationships USING btree (me_modifica_id);


--
-- Name: index_modifica_relationships_on_modifica_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_modifica_relationships_on_modifica_id ON modifica_relationships USING btree (modifica_id);


--
-- Name: index_normas_on_expediente_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_normas_on_expediente_id ON normas USING btree (expediente_id);


--
-- Name: index_normas_otra_publicacions_on_norma_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_normas_otra_publicacions_on_norma_id ON normas_otra_publicacions USING btree (norma_id);


--
-- Name: index_normas_otra_publicacions_on_otra_publicacion_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_normas_otra_publicacions_on_otra_publicacion_id ON normas_otra_publicacions USING btree (otra_publicacion_id);


--
-- Name: index_normas_tags_on_norma_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_normas_tags_on_norma_id ON normas_tags USING btree (norma_id);


--
-- Name: index_normas_tags_on_tag_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_normas_tags_on_tag_id ON normas_tags USING btree (tag_id);


--
-- Name: index_orden_del_dia_on_sesion_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_orden_del_dia_on_sesion_id ON orden_del_dia USING btree (sesion_id);


--
-- Name: index_orden_del_dia_seccions_on_orden_del_dia_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_orden_del_dia_seccions_on_orden_del_dia_id ON orden_del_dia_seccions USING btree (orden_del_dia_id);


--
-- Name: index_orden_del_dia_seccions_on_seccion_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_orden_del_dia_seccions_on_seccion_id ON orden_del_dia_seccions USING btree (seccion_id);


--
-- Name: index_periodos_personas_on_concejal_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_periodos_personas_on_concejal_id ON periodos_personas USING btree (concejal_id);


--
-- Name: index_periodos_personas_on_periodo_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_periodos_personas_on_periodo_id ON periodos_personas USING btree (periodo_id);


--
-- Name: index_personas_on_bloque_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_personas_on_bloque_id ON personas USING btree (bloque_id);


--
-- Name: index_personas_tramites_on_persona_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_personas_tramites_on_persona_id ON personas_tramites USING btree (persona_id);


--
-- Name: index_personas_tramites_on_tramite_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_personas_tramites_on_tramite_id ON personas_tramites USING btree (tramite_id);


--
-- Name: index_relationship_concejals_on_suplente_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_relationship_concejals_on_suplente_id ON relationship_concejals USING btree (suplente_id);


--
-- Name: index_relationship_concejals_on_titular_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_relationship_concejals_on_titular_id ON relationship_concejals USING btree (titular_id);


--
-- Name: index_rols_usuarios_on_rol_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_rols_usuarios_on_rol_id ON rols_usuarios USING btree (rol_id);


--
-- Name: index_rols_usuarios_on_usuario_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_rols_usuarios_on_usuario_id ON rols_usuarios USING btree (usuario_id);


--
-- Name: index_sesions_on_diario_de_sesion_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_sesions_on_diario_de_sesion_id ON sesions USING btree (diario_de_sesion_id);


--
-- Name: index_sub_seccions_on_seccion_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_sub_seccions_on_seccion_id ON sub_seccions USING btree (seccion_id);


--
-- Name: index_tramites_on_expediente_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_tramites_on_expediente_id ON tramites USING btree (expediente_id);


--
-- Name: index_usuarios_on_email; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX index_usuarios_on_email ON usuarios USING btree (email);


--
-- Name: index_usuarios_on_persona_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_usuarios_on_persona_id ON usuarios USING btree (persona_id);


--
-- Name: index_usuarios_on_reset_password_token; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX index_usuarios_on_reset_password_token ON usuarios USING btree (reset_password_token);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


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

