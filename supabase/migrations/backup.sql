--
-- PostgreSQL database cluster dump
--

\restrict p91hHMVrl2vbom2korSJlmNQiDkKPBqWScgYAhMkBtZvkORFjUG4CuniogIGEry

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE anon;
ALTER ROLE anon WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB NOLOGIN NOREPLICATION NOBYPASSRLS;
CREATE ROLE authenticated;
ALTER ROLE authenticated WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB NOLOGIN NOREPLICATION NOBYPASSRLS;
CREATE ROLE authenticator;
ALTER ROLE authenticator WITH NOSUPERUSER NOINHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS;
CREATE ROLE dashboard_user;
ALTER ROLE dashboard_user WITH NOSUPERUSER INHERIT CREATEROLE CREATEDB NOLOGIN REPLICATION NOBYPASSRLS;
CREATE ROLE pgbouncer;
ALTER ROLE pgbouncer WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS;
CREATE ROLE postgres;
ALTER ROLE postgres WITH NOSUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS;
CREATE ROLE service_role;
ALTER ROLE service_role WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB NOLOGIN NOREPLICATION BYPASSRLS;
CREATE ROLE supabase_admin;
ALTER ROLE supabase_admin WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS;
CREATE ROLE supabase_auth_admin;
ALTER ROLE supabase_auth_admin WITH NOSUPERUSER NOINHERIT CREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS;
CREATE ROLE supabase_etl_admin;
ALTER ROLE supabase_etl_admin WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN REPLICATION NOBYPASSRLS;
CREATE ROLE supabase_read_only_user;
ALTER ROLE supabase_read_only_user WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION BYPASSRLS;
CREATE ROLE supabase_realtime_admin;
ALTER ROLE supabase_realtime_admin WITH NOSUPERUSER NOINHERIT NOCREATEROLE NOCREATEDB NOLOGIN NOREPLICATION NOBYPASSRLS;
CREATE ROLE supabase_replication_admin;
ALTER ROLE supabase_replication_admin WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN REPLICATION NOBYPASSRLS;
CREATE ROLE supabase_storage_admin;
ALTER ROLE supabase_storage_admin WITH NOSUPERUSER NOINHERIT CREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS;

--
-- User Configurations
--

--
-- User Config "anon"
--

ALTER ROLE anon SET statement_timeout TO '3s';

--
-- User Config "authenticated"
--

ALTER ROLE authenticated SET statement_timeout TO '8s';

--
-- User Config "authenticator"
--

ALTER ROLE authenticator SET session_preload_libraries TO 'safeupdate';
ALTER ROLE authenticator SET statement_timeout TO '8s';
ALTER ROLE authenticator SET lock_timeout TO '8s';

--
-- User Config "postgres"
--

ALTER ROLE postgres SET search_path TO E'\\$user', 'public', 'extensions';

--
-- User Config "supabase_admin"
--

ALTER ROLE supabase_admin SET search_path TO '$user', 'public', 'auth', 'extensions';
ALTER ROLE supabase_admin SET log_statement TO 'none';

--
-- User Config "supabase_auth_admin"
--

ALTER ROLE supabase_auth_admin SET search_path TO 'auth';
ALTER ROLE supabase_auth_admin SET idle_in_transaction_session_timeout TO '60000';
ALTER ROLE supabase_auth_admin SET log_statement TO 'none';

--
-- User Config "supabase_read_only_user"
--

ALTER ROLE supabase_read_only_user SET default_transaction_read_only TO 'on';

--
-- User Config "supabase_storage_admin"
--

ALTER ROLE supabase_storage_admin SET search_path TO 'storage';
ALTER ROLE supabase_storage_admin SET log_statement TO 'none';


--
-- Role memberships
--

GRANT anon TO authenticator WITH INHERIT FALSE GRANTED BY supabase_admin;
GRANT anon TO postgres WITH ADMIN OPTION, INHERIT TRUE GRANTED BY supabase_admin;
GRANT authenticated TO authenticator WITH INHERIT FALSE GRANTED BY supabase_admin;
GRANT authenticated TO postgres WITH ADMIN OPTION, INHERIT TRUE GRANTED BY supabase_admin;
GRANT authenticator TO postgres WITH ADMIN OPTION, INHERIT TRUE GRANTED BY supabase_admin;
GRANT authenticator TO supabase_storage_admin WITH INHERIT FALSE GRANTED BY supabase_admin;
GRANT pg_create_subscription TO postgres WITH ADMIN OPTION, INHERIT TRUE GRANTED BY supabase_admin;
GRANT pg_monitor TO postgres WITH ADMIN OPTION, INHERIT TRUE GRANTED BY supabase_admin;
GRANT pg_monitor TO supabase_etl_admin WITH INHERIT TRUE GRANTED BY supabase_admin;
GRANT pg_monitor TO supabase_read_only_user WITH INHERIT TRUE GRANTED BY supabase_admin;
GRANT pg_read_all_data TO postgres WITH ADMIN OPTION, INHERIT TRUE GRANTED BY supabase_admin;
GRANT pg_read_all_data TO supabase_etl_admin WITH INHERIT TRUE GRANTED BY supabase_admin;
GRANT pg_read_all_data TO supabase_read_only_user WITH INHERIT TRUE GRANTED BY supabase_admin;
GRANT pg_signal_backend TO postgres WITH ADMIN OPTION, INHERIT TRUE GRANTED BY supabase_admin;
GRANT service_role TO authenticator WITH INHERIT FALSE GRANTED BY supabase_admin;
GRANT service_role TO postgres WITH ADMIN OPTION, INHERIT TRUE GRANTED BY supabase_admin;
GRANT supabase_realtime_admin TO postgres WITH INHERIT TRUE GRANTED BY supabase_admin;






\unrestrict p91hHMVrl2vbom2korSJlmNQiDkKPBqWScgYAhMkBtZvkORFjUG4CuniogIGEry

--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

\restrict BFP7eo2092yBUOnLtTikkXW3K1nYs2ynY6nOqiSiuxRAIcsR3TQ3JT9YMGayJAG

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.7 (Debian 17.7-3.pgdg12+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- PostgreSQL database dump complete
--

\unrestrict BFP7eo2092yBUOnLtTikkXW3K1nYs2ynY6nOqiSiuxRAIcsR3TQ3JT9YMGayJAG

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

\restrict qcN9ImLwPXPXZMY0bxi2R1NHseC6vDdiaGkGRCoPpgMSubOsxRO1d4sY9QJL416

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.7 (Debian 17.7-3.pgdg12+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: auth; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA auth;


ALTER SCHEMA auth OWNER TO supabase_admin;

--
-- Name: extensions; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA extensions;


ALTER SCHEMA extensions OWNER TO postgres;

--
-- Name: graphql; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA graphql;


ALTER SCHEMA graphql OWNER TO supabase_admin;

--
-- Name: graphql_public; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA graphql_public;


ALTER SCHEMA graphql_public OWNER TO supabase_admin;

--
-- Name: pgbouncer; Type: SCHEMA; Schema: -; Owner: pgbouncer
--

CREATE SCHEMA pgbouncer;


ALTER SCHEMA pgbouncer OWNER TO pgbouncer;

--
-- Name: realtime; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA realtime;


ALTER SCHEMA realtime OWNER TO supabase_admin;

--
-- Name: storage; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA storage;


ALTER SCHEMA storage OWNER TO supabase_admin;

--
-- Name: supabase_migrations; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA supabase_migrations;


ALTER SCHEMA supabase_migrations OWNER TO postgres;

--
-- Name: vault; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA vault;


ALTER SCHEMA vault OWNER TO supabase_admin;

--
-- Name: pg_graphql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_graphql WITH SCHEMA graphql;


--
-- Name: EXTENSION pg_graphql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_graphql IS 'pg_graphql: GraphQL support';


--
-- Name: pg_stat_statements; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_stat_statements WITH SCHEMA extensions;


--
-- Name: EXTENSION pg_stat_statements; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_stat_statements IS 'track planning and execution statistics of all SQL statements executed';


--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA extensions;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- Name: supabase_vault; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS supabase_vault WITH SCHEMA vault;


--
-- Name: EXTENSION supabase_vault; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION supabase_vault IS 'Supabase Vault Extension';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA extensions;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- Name: aal_level; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.aal_level AS ENUM (
    'aal1',
    'aal2',
    'aal3'
);


ALTER TYPE auth.aal_level OWNER TO supabase_auth_admin;

--
-- Name: code_challenge_method; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.code_challenge_method AS ENUM (
    's256',
    'plain'
);


ALTER TYPE auth.code_challenge_method OWNER TO supabase_auth_admin;

--
-- Name: factor_status; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.factor_status AS ENUM (
    'unverified',
    'verified'
);


ALTER TYPE auth.factor_status OWNER TO supabase_auth_admin;

--
-- Name: factor_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.factor_type AS ENUM (
    'totp',
    'webauthn',
    'phone'
);


ALTER TYPE auth.factor_type OWNER TO supabase_auth_admin;

--
-- Name: oauth_authorization_status; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.oauth_authorization_status AS ENUM (
    'pending',
    'approved',
    'denied',
    'expired'
);


ALTER TYPE auth.oauth_authorization_status OWNER TO supabase_auth_admin;

--
-- Name: oauth_client_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.oauth_client_type AS ENUM (
    'public',
    'confidential'
);


ALTER TYPE auth.oauth_client_type OWNER TO supabase_auth_admin;

--
-- Name: oauth_registration_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.oauth_registration_type AS ENUM (
    'dynamic',
    'manual'
);


ALTER TYPE auth.oauth_registration_type OWNER TO supabase_auth_admin;

--
-- Name: oauth_response_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.oauth_response_type AS ENUM (
    'code'
);


ALTER TYPE auth.oauth_response_type OWNER TO supabase_auth_admin;

--
-- Name: one_time_token_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.one_time_token_type AS ENUM (
    'confirmation_token',
    'reauthentication_token',
    'recovery_token',
    'email_change_token_new',
    'email_change_token_current',
    'phone_change_token'
);


ALTER TYPE auth.one_time_token_type OWNER TO supabase_auth_admin;

--
-- Name: action; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.action AS ENUM (
    'INSERT',
    'UPDATE',
    'DELETE',
    'TRUNCATE',
    'ERROR'
);


ALTER TYPE realtime.action OWNER TO supabase_admin;

--
-- Name: equality_op; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.equality_op AS ENUM (
    'eq',
    'neq',
    'lt',
    'lte',
    'gt',
    'gte',
    'in'
);


ALTER TYPE realtime.equality_op OWNER TO supabase_admin;

--
-- Name: user_defined_filter; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.user_defined_filter AS (
	column_name text,
	op realtime.equality_op,
	value text
);


ALTER TYPE realtime.user_defined_filter OWNER TO supabase_admin;

--
-- Name: wal_column; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.wal_column AS (
	name text,
	type_name text,
	type_oid oid,
	value jsonb,
	is_pkey boolean,
	is_selectable boolean
);


ALTER TYPE realtime.wal_column OWNER TO supabase_admin;

--
-- Name: wal_rls; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.wal_rls AS (
	wal jsonb,
	is_rls_enabled boolean,
	subscription_ids uuid[],
	errors text[]
);


ALTER TYPE realtime.wal_rls OWNER TO supabase_admin;

--
-- Name: buckettype; Type: TYPE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TYPE storage.buckettype AS ENUM (
    'STANDARD',
    'ANALYTICS',
    'VECTOR'
);


ALTER TYPE storage.buckettype OWNER TO supabase_storage_admin;

--
-- Name: email(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.email() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.email', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'email')
  )::text
$$;


ALTER FUNCTION auth.email() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION email(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.email() IS 'Deprecated. Use auth.jwt() -> ''email'' instead.';


--
-- Name: jwt(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.jwt() RETURNS jsonb
    LANGUAGE sql STABLE
    AS $$
  select 
    coalesce(
        nullif(current_setting('request.jwt.claim', true), ''),
        nullif(current_setting('request.jwt.claims', true), '')
    )::jsonb
$$;


ALTER FUNCTION auth.jwt() OWNER TO supabase_auth_admin;

--
-- Name: role(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.role() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.role', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'role')
  )::text
$$;


ALTER FUNCTION auth.role() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION role(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.role() IS 'Deprecated. Use auth.jwt() -> ''role'' instead.';


--
-- Name: uid(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.uid() RETURNS uuid
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.sub', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'sub')
  )::uuid
$$;


ALTER FUNCTION auth.uid() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION uid(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.uid() IS 'Deprecated. Use auth.jwt() -> ''sub'' instead.';


--
-- Name: grant_pg_cron_access(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.grant_pg_cron_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS (
    SELECT
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_cron'
  )
  THEN
    grant usage on schema cron to postgres with grant option;

    alter default privileges in schema cron grant all on tables to postgres with grant option;
    alter default privileges in schema cron grant all on functions to postgres with grant option;
    alter default privileges in schema cron grant all on sequences to postgres with grant option;

    alter default privileges for user supabase_admin in schema cron grant all
        on sequences to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on tables to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on functions to postgres with grant option;

    grant all privileges on all tables in schema cron to postgres with grant option;
    revoke all on table cron.job from postgres;
    grant select on table cron.job to postgres with grant option;
  END IF;
END;
$$;


ALTER FUNCTION extensions.grant_pg_cron_access() OWNER TO supabase_admin;

--
-- Name: FUNCTION grant_pg_cron_access(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.grant_pg_cron_access() IS 'Grants access to pg_cron';


--
-- Name: grant_pg_graphql_access(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.grant_pg_graphql_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
DECLARE
    func_is_graphql_resolve bool;
BEGIN
    func_is_graphql_resolve = (
        SELECT n.proname = 'resolve'
        FROM pg_event_trigger_ddl_commands() AS ev
        LEFT JOIN pg_catalog.pg_proc AS n
        ON ev.objid = n.oid
    );

    IF func_is_graphql_resolve
    THEN
        -- Update public wrapper to pass all arguments through to the pg_graphql resolve func
        DROP FUNCTION IF EXISTS graphql_public.graphql;
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language sql
        as $$
            select graphql.resolve(
                query := query,
                variables := coalesce(variables, '{}'),
                "operationName" := "operationName",
                extensions := extensions
            );
        $$;

        -- This hook executes when `graphql.resolve` is created. That is not necessarily the last
        -- function in the extension so we need to grant permissions on existing entities AND
        -- update default permissions to any others that are created after `graphql.resolve`
        grant usage on schema graphql to postgres, anon, authenticated, service_role;
        grant select on all tables in schema graphql to postgres, anon, authenticated, service_role;
        grant execute on all functions in schema graphql to postgres, anon, authenticated, service_role;
        grant all on all sequences in schema graphql to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on tables to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on functions to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on sequences to postgres, anon, authenticated, service_role;

        -- Allow postgres role to allow granting usage on graphql and graphql_public schemas to custom roles
        grant usage on schema graphql_public to postgres with grant option;
        grant usage on schema graphql to postgres with grant option;
    END IF;

END;
$_$;


ALTER FUNCTION extensions.grant_pg_graphql_access() OWNER TO supabase_admin;

--
-- Name: FUNCTION grant_pg_graphql_access(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.grant_pg_graphql_access() IS 'Grants access to pg_graphql';


--
-- Name: grant_pg_net_access(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.grant_pg_net_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS (
    SELECT 1
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_net'
  )
  THEN
    IF NOT EXISTS (
      SELECT 1
      FROM pg_roles
      WHERE rolname = 'supabase_functions_admin'
    )
    THEN
      CREATE USER supabase_functions_admin NOINHERIT CREATEROLE LOGIN NOREPLICATION;
    END IF;

    GRANT USAGE ON SCHEMA net TO supabase_functions_admin, postgres, anon, authenticated, service_role;

    IF EXISTS (
      SELECT FROM pg_extension
      WHERE extname = 'pg_net'
      -- all versions in use on existing projects as of 2025-02-20
      -- version 0.12.0 onwards don't need these applied
      AND extversion IN ('0.2', '0.6', '0.7', '0.7.1', '0.8', '0.10.0', '0.11.0')
    ) THEN
      ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;
      ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;

      ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;
      ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;

      REVOKE ALL ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;
      REVOKE ALL ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;

      GRANT EXECUTE ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
      GRANT EXECUTE ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
    END IF;
  END IF;
END;
$$;


ALTER FUNCTION extensions.grant_pg_net_access() OWNER TO supabase_admin;

--
-- Name: FUNCTION grant_pg_net_access(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.grant_pg_net_access() IS 'Grants access to pg_net';


--
-- Name: pgrst_ddl_watch(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.pgrst_ddl_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  cmd record;
BEGIN
  FOR cmd IN SELECT * FROM pg_event_trigger_ddl_commands()
  LOOP
    IF cmd.command_tag IN (
      'CREATE SCHEMA', 'ALTER SCHEMA'
    , 'CREATE TABLE', 'CREATE TABLE AS', 'SELECT INTO', 'ALTER TABLE'
    , 'CREATE FOREIGN TABLE', 'ALTER FOREIGN TABLE'
    , 'CREATE VIEW', 'ALTER VIEW'
    , 'CREATE MATERIALIZED VIEW', 'ALTER MATERIALIZED VIEW'
    , 'CREATE FUNCTION', 'ALTER FUNCTION'
    , 'CREATE TRIGGER'
    , 'CREATE TYPE', 'ALTER TYPE'
    , 'CREATE RULE'
    , 'COMMENT'
    )
    -- don't notify in case of CREATE TEMP table or other objects created on pg_temp
    AND cmd.schema_name is distinct from 'pg_temp'
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


ALTER FUNCTION extensions.pgrst_ddl_watch() OWNER TO supabase_admin;

--
-- Name: pgrst_drop_watch(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.pgrst_drop_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  obj record;
BEGIN
  FOR obj IN SELECT * FROM pg_event_trigger_dropped_objects()
  LOOP
    IF obj.object_type IN (
      'schema'
    , 'table'
    , 'foreign table'
    , 'view'
    , 'materialized view'
    , 'function'
    , 'trigger'
    , 'type'
    , 'rule'
    )
    AND obj.is_temporary IS false -- no pg_temp objects
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


ALTER FUNCTION extensions.pgrst_drop_watch() OWNER TO supabase_admin;

--
-- Name: set_graphql_placeholder(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.set_graphql_placeholder() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
    DECLARE
    graphql_is_dropped bool;
    BEGIN
    graphql_is_dropped = (
        SELECT ev.schema_name = 'graphql_public'
        FROM pg_event_trigger_dropped_objects() AS ev
        WHERE ev.schema_name = 'graphql_public'
    );

    IF graphql_is_dropped
    THEN
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language plpgsql
        as $$
            DECLARE
                server_version float;
            BEGIN
                server_version = (SELECT (SPLIT_PART((select version()), ' ', 2))::float);

                IF server_version >= 14 THEN
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql extension is not enabled.'
                            )
                        )
                    );
                ELSE
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql is only available on projects running Postgres 14 onwards.'
                            )
                        )
                    );
                END IF;
            END;
        $$;
    END IF;

    END;
$_$;


ALTER FUNCTION extensions.set_graphql_placeholder() OWNER TO supabase_admin;

--
-- Name: FUNCTION set_graphql_placeholder(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.set_graphql_placeholder() IS 'Reintroduces placeholder function for graphql_public.graphql';


--
-- Name: get_auth(text); Type: FUNCTION; Schema: pgbouncer; Owner: supabase_admin
--

CREATE FUNCTION pgbouncer.get_auth(p_usename text) RETURNS TABLE(username text, password text)
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO ''
    AS $_$
  BEGIN
      RAISE DEBUG 'PgBouncer auth request: %', p_usename;

      RETURN QUERY
      SELECT
          rolname::text,
          CASE WHEN rolvaliduntil < now()
              THEN null
              ELSE rolpassword::text
          END
      FROM pg_authid
      WHERE rolname=$1 and rolcanlogin;
  END;
  $_$;


ALTER FUNCTION pgbouncer.get_auth(p_usename text) OWNER TO supabase_admin;

--
-- Name: handle_new_user(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.handle_new_user() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
begin
  insert into public.profiles (id, email, name, role, plan, level, xp)
  values (
    new.id,
    new.email,
    new.raw_user_meta_data->>'name', -- Extract name from metadata
    'user',
    'free',
    1,
    0
  );
  return new;
end;
$$;


ALTER FUNCTION public.handle_new_user() OWNER TO postgres;

--
-- Name: apply_rls(jsonb, integer); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer DEFAULT (1024 * 1024)) RETURNS SETOF realtime.wal_rls
    LANGUAGE plpgsql
    AS $$
declare
-- Regclass of the table e.g. public.notes
entity_ regclass = (quote_ident(wal ->> 'schema') || '.' || quote_ident(wal ->> 'table'))::regclass;

-- I, U, D, T: insert, update ...
action realtime.action = (
    case wal ->> 'action'
        when 'I' then 'INSERT'
        when 'U' then 'UPDATE'
        when 'D' then 'DELETE'
        else 'ERROR'
    end
);

-- Is row level security enabled for the table
is_rls_enabled bool = relrowsecurity from pg_class where oid = entity_;

subscriptions realtime.subscription[] = array_agg(subs)
    from
        realtime.subscription subs
    where
        subs.entity = entity_;

-- Subscription vars
roles regrole[] = array_agg(distinct us.claims_role::text)
    from
        unnest(subscriptions) us;

working_role regrole;
claimed_role regrole;
claims jsonb;

subscription_id uuid;
subscription_has_access bool;
visible_to_subscription_ids uuid[] = '{}';

-- structured info for wal's columns
columns realtime.wal_column[];
-- previous identity values for update/delete
old_columns realtime.wal_column[];

error_record_exceeds_max_size boolean = octet_length(wal::text) > max_record_bytes;

-- Primary jsonb output for record
output jsonb;

begin
perform set_config('role', null, true);

columns =
    array_agg(
        (
            x->>'name',
            x->>'type',
            x->>'typeoid',
            realtime.cast(
                (x->'value') #>> '{}',
                coalesce(
                    (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                    (x->>'type')::regtype
                )
            ),
            (pks ->> 'name') is not null,
            true
        )::realtime.wal_column
    )
    from
        jsonb_array_elements(wal -> 'columns') x
        left join jsonb_array_elements(wal -> 'pk') pks
            on (x ->> 'name') = (pks ->> 'name');

old_columns =
    array_agg(
        (
            x->>'name',
            x->>'type',
            x->>'typeoid',
            realtime.cast(
                (x->'value') #>> '{}',
                coalesce(
                    (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                    (x->>'type')::regtype
                )
            ),
            (pks ->> 'name') is not null,
            true
        )::realtime.wal_column
    )
    from
        jsonb_array_elements(wal -> 'identity') x
        left join jsonb_array_elements(wal -> 'pk') pks
            on (x ->> 'name') = (pks ->> 'name');

for working_role in select * from unnest(roles) loop

    -- Update `is_selectable` for columns and old_columns
    columns =
        array_agg(
            (
                c.name,
                c.type_name,
                c.type_oid,
                c.value,
                c.is_pkey,
                pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
            )::realtime.wal_column
        )
        from
            unnest(columns) c;

    old_columns =
            array_agg(
                (
                    c.name,
                    c.type_name,
                    c.type_oid,
                    c.value,
                    c.is_pkey,
                    pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
                )::realtime.wal_column
            )
            from
                unnest(old_columns) c;

    if action <> 'DELETE' and count(1) = 0 from unnest(columns) c where c.is_pkey then
        return next (
            jsonb_build_object(
                'schema', wal ->> 'schema',
                'table', wal ->> 'table',
                'type', action
            ),
            is_rls_enabled,
            -- subscriptions is already filtered by entity
            (select array_agg(s.subscription_id) from unnest(subscriptions) as s where claims_role = working_role),
            array['Error 400: Bad Request, no primary key']
        )::realtime.wal_rls;

    -- The claims role does not have SELECT permission to the primary key of entity
    elsif action <> 'DELETE' and sum(c.is_selectable::int) <> count(1) from unnest(columns) c where c.is_pkey then
        return next (
            jsonb_build_object(
                'schema', wal ->> 'schema',
                'table', wal ->> 'table',
                'type', action
            ),
            is_rls_enabled,
            (select array_agg(s.subscription_id) from unnest(subscriptions) as s where claims_role = working_role),
            array['Error 401: Unauthorized']
        )::realtime.wal_rls;

    else
        output = jsonb_build_object(
            'schema', wal ->> 'schema',
            'table', wal ->> 'table',
            'type', action,
            'commit_timestamp', to_char(
                ((wal ->> 'timestamp')::timestamptz at time zone 'utc'),
                'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"'
            ),
            'columns', (
                select
                    jsonb_agg(
                        jsonb_build_object(
                            'name', pa.attname,
                            'type', pt.typname
                        )
                        order by pa.attnum asc
                    )
                from
                    pg_attribute pa
                    join pg_type pt
                        on pa.atttypid = pt.oid
                where
                    attrelid = entity_
                    and attnum > 0
                    and pg_catalog.has_column_privilege(working_role, entity_, pa.attname, 'SELECT')
            )
        )
        -- Add "record" key for insert and update
        || case
            when action in ('INSERT', 'UPDATE') then
                jsonb_build_object(
                    'record',
                    (
                        select
                            jsonb_object_agg(
                                -- if unchanged toast, get column name and value from old record
                                coalesce((c).name, (oc).name),
                                case
                                    when (c).name is null then (oc).value
                                    else (c).value
                                end
                            )
                        from
                            unnest(columns) c
                            full outer join unnest(old_columns) oc
                                on (c).name = (oc).name
                        where
                            coalesce((c).is_selectable, (oc).is_selectable)
                            and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                    )
                )
            else '{}'::jsonb
        end
        -- Add "old_record" key for update and delete
        || case
            when action = 'UPDATE' then
                jsonb_build_object(
                        'old_record',
                        (
                            select jsonb_object_agg((c).name, (c).value)
                            from unnest(old_columns) c
                            where
                                (c).is_selectable
                                and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                        )
                    )
            when action = 'DELETE' then
                jsonb_build_object(
                    'old_record',
                    (
                        select jsonb_object_agg((c).name, (c).value)
                        from unnest(old_columns) c
                        where
                            (c).is_selectable
                            and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                            and ( not is_rls_enabled or (c).is_pkey ) -- if RLS enabled, we can't secure deletes so filter to pkey
                    )
                )
            else '{}'::jsonb
        end;

        -- Create the prepared statement
        if is_rls_enabled and action <> 'DELETE' then
            if (select 1 from pg_prepared_statements where name = 'walrus_rls_stmt' limit 1) > 0 then
                deallocate walrus_rls_stmt;
            end if;
            execute realtime.build_prepared_statement_sql('walrus_rls_stmt', entity_, columns);
        end if;

        visible_to_subscription_ids = '{}';

        for subscription_id, claims in (
                select
                    subs.subscription_id,
                    subs.claims
                from
                    unnest(subscriptions) subs
                where
                    subs.entity = entity_
                    and subs.claims_role = working_role
                    and (
                        realtime.is_visible_through_filters(columns, subs.filters)
                        or (
                          action = 'DELETE'
                          and realtime.is_visible_through_filters(old_columns, subs.filters)
                        )
                    )
        ) loop

            if not is_rls_enabled or action = 'DELETE' then
                visible_to_subscription_ids = visible_to_subscription_ids || subscription_id;
            else
                -- Check if RLS allows the role to see the record
                perform
                    -- Trim leading and trailing quotes from working_role because set_config
                    -- doesn't recognize the role as valid if they are included
                    set_config('role', trim(both '"' from working_role::text), true),
                    set_config('request.jwt.claims', claims::text, true);

                execute 'execute walrus_rls_stmt' into subscription_has_access;

                if subscription_has_access then
                    visible_to_subscription_ids = visible_to_subscription_ids || subscription_id;
                end if;
            end if;
        end loop;

        perform set_config('role', null, true);

        return next (
            output,
            is_rls_enabled,
            visible_to_subscription_ids,
            case
                when error_record_exceeds_max_size then array['Error 413: Payload Too Large']
                else '{}'
            end
        )::realtime.wal_rls;

    end if;
end loop;

perform set_config('role', null, true);
end;
$$;


ALTER FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) OWNER TO supabase_admin;

--
-- Name: broadcast_changes(text, text, text, text, text, record, record, text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text DEFAULT 'ROW'::text) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
    -- Declare a variable to hold the JSONB representation of the row
    row_data jsonb := '{}'::jsonb;
BEGIN
    IF level = 'STATEMENT' THEN
        RAISE EXCEPTION 'function can only be triggered for each row, not for each statement';
    END IF;
    -- Check the operation type and handle accordingly
    IF operation = 'INSERT' OR operation = 'UPDATE' OR operation = 'DELETE' THEN
        row_data := jsonb_build_object('old_record', OLD, 'record', NEW, 'operation', operation, 'table', table_name, 'schema', table_schema);
        PERFORM realtime.send (row_data, event_name, topic_name);
    ELSE
        RAISE EXCEPTION 'Unexpected operation type: %', operation;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        RAISE EXCEPTION 'Failed to process the row: %', SQLERRM;
END;

$$;


ALTER FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) OWNER TO supabase_admin;

--
-- Name: build_prepared_statement_sql(text, regclass, realtime.wal_column[]); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) RETURNS text
    LANGUAGE sql
    AS $$
      /*
      Builds a sql string that, if executed, creates a prepared statement to
      tests retrive a row from *entity* by its primary key columns.
      Example
          select realtime.build_prepared_statement_sql('public.notes', '{"id"}'::text[], '{"bigint"}'::text[])
      */
          select
      'prepare ' || prepared_statement_name || ' as
          select
              exists(
                  select
                      1
                  from
                      ' || entity || '
                  where
                      ' || string_agg(quote_ident(pkc.name) || '=' || quote_nullable(pkc.value #>> '{}') , ' and ') || '
              )'
          from
              unnest(columns) pkc
          where
              pkc.is_pkey
          group by
              entity
      $$;


ALTER FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) OWNER TO supabase_admin;

--
-- Name: cast(text, regtype); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime."cast"(val text, type_ regtype) RETURNS jsonb
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    declare
      res jsonb;
    begin
      execute format('select to_jsonb(%L::'|| type_::text || ')', val)  into res;
      return res;
    end
    $$;


ALTER FUNCTION realtime."cast"(val text, type_ regtype) OWNER TO supabase_admin;

--
-- Name: check_equality_op(realtime.equality_op, regtype, text, text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) RETURNS boolean
    LANGUAGE plpgsql IMMUTABLE
    AS $$
      /*
      Casts *val_1* and *val_2* as type *type_* and check the *op* condition for truthiness
      */
      declare
          op_symbol text = (
              case
                  when op = 'eq' then '='
                  when op = 'neq' then '!='
                  when op = 'lt' then '<'
                  when op = 'lte' then '<='
                  when op = 'gt' then '>'
                  when op = 'gte' then '>='
                  when op = 'in' then '= any'
                  else 'UNKNOWN OP'
              end
          );
          res boolean;
      begin
          execute format(
              'select %L::'|| type_::text || ' ' || op_symbol
              || ' ( %L::'
              || (
                  case
                      when op = 'in' then type_::text || '[]'
                      else type_::text end
              )
              || ')', val_1, val_2) into res;
          return res;
      end;
      $$;


ALTER FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) OWNER TO supabase_admin;

--
-- Name: is_visible_through_filters(realtime.wal_column[], realtime.user_defined_filter[]); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$
    /*
    Should the record be visible (true) or filtered out (false) after *filters* are applied
    */
        select
            -- Default to allowed when no filters present
            $2 is null -- no filters. this should not happen because subscriptions has a default
            or array_length($2, 1) is null -- array length of an empty array is null
            or bool_and(
                coalesce(
                    realtime.check_equality_op(
                        op:=f.op,
                        type_:=coalesce(
                            col.type_oid::regtype, -- null when wal2json version <= 2.4
                            col.type_name::regtype
                        ),
                        -- cast jsonb to text
                        val_1:=col.value #>> '{}',
                        val_2:=f.value
                    ),
                    false -- if null, filter does not match
                )
            )
        from
            unnest(filters) f
            join unnest(columns) col
                on f.column_name = col.name;
    $_$;


ALTER FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) OWNER TO supabase_admin;

--
-- Name: list_changes(name, name, integer, integer); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) RETURNS SETOF realtime.wal_rls
    LANGUAGE sql
    SET log_min_messages TO 'fatal'
    AS $$
      with pub as (
        select
          concat_ws(
            ',',
            case when bool_or(pubinsert) then 'insert' else null end,
            case when bool_or(pubupdate) then 'update' else null end,
            case when bool_or(pubdelete) then 'delete' else null end
          ) as w2j_actions,
          coalesce(
            string_agg(
              realtime.quote_wal2json(format('%I.%I', schemaname, tablename)::regclass),
              ','
            ) filter (where ppt.tablename is not null and ppt.tablename not like '% %'),
            ''
          ) w2j_add_tables
        from
          pg_publication pp
          left join pg_publication_tables ppt
            on pp.pubname = ppt.pubname
        where
          pp.pubname = publication
        group by
          pp.pubname
        limit 1
      ),
      w2j as (
        select
          x.*, pub.w2j_add_tables
        from
          pub,
          pg_logical_slot_get_changes(
            slot_name, null, max_changes,
            'include-pk', 'true',
            'include-transaction', 'false',
            'include-timestamp', 'true',
            'include-type-oids', 'true',
            'format-version', '2',
            'actions', pub.w2j_actions,
            'add-tables', pub.w2j_add_tables
          ) x
      )
      select
        xyz.wal,
        xyz.is_rls_enabled,
        xyz.subscription_ids,
        xyz.errors
      from
        w2j,
        realtime.apply_rls(
          wal := w2j.data::jsonb,
          max_record_bytes := max_record_bytes
        ) xyz(wal, is_rls_enabled, subscription_ids, errors)
      where
        w2j.w2j_add_tables <> ''
        and xyz.subscription_ids[1] is not null
    $$;


ALTER FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) OWNER TO supabase_admin;

--
-- Name: quote_wal2json(regclass); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.quote_wal2json(entity regclass) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $$
      select
        (
          select string_agg('' || ch,'')
          from unnest(string_to_array(nsp.nspname::text, null)) with ordinality x(ch, idx)
          where
            not (x.idx = 1 and x.ch = '"')
            and not (
              x.idx = array_length(string_to_array(nsp.nspname::text, null), 1)
              and x.ch = '"'
            )
        )
        || '.'
        || (
          select string_agg('' || ch,'')
          from unnest(string_to_array(pc.relname::text, null)) with ordinality x(ch, idx)
          where
            not (x.idx = 1 and x.ch = '"')
            and not (
              x.idx = array_length(string_to_array(nsp.nspname::text, null), 1)
              and x.ch = '"'
            )
          )
      from
        pg_class pc
        join pg_namespace nsp
          on pc.relnamespace = nsp.oid
      where
        pc.oid = entity
    $$;


ALTER FUNCTION realtime.quote_wal2json(entity regclass) OWNER TO supabase_admin;

--
-- Name: send(jsonb, text, text, boolean); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean DEFAULT true) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  generated_id uuid;
  final_payload jsonb;
BEGIN
  BEGIN
    -- Generate a new UUID for the id
    generated_id := gen_random_uuid();

    -- Check if payload has an 'id' key, if not, add the generated UUID
    IF payload ? 'id' THEN
      final_payload := payload;
    ELSE
      final_payload := jsonb_set(payload, '{id}', to_jsonb(generated_id));
    END IF;

    -- Set the topic configuration
    EXECUTE format('SET LOCAL realtime.topic TO %L', topic);

    -- Attempt to insert the message
    INSERT INTO realtime.messages (id, payload, event, topic, private, extension)
    VALUES (generated_id, final_payload, event, topic, private, 'broadcast');
  EXCEPTION
    WHEN OTHERS THEN
      -- Capture and notify the error
      RAISE WARNING 'ErrorSendingBroadcastMessage: %', SQLERRM;
  END;
END;
$$;


ALTER FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) OWNER TO supabase_admin;

--
-- Name: subscription_check_filters(); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.subscription_check_filters() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    /*
    Validates that the user defined filters for a subscription:
    - refer to valid columns that the claimed role may access
    - values are coercable to the correct column type
    */
    declare
        col_names text[] = coalesce(
                array_agg(c.column_name order by c.ordinal_position),
                '{}'::text[]
            )
            from
                information_schema.columns c
            where
                format('%I.%I', c.table_schema, c.table_name)::regclass = new.entity
                and pg_catalog.has_column_privilege(
                    (new.claims ->> 'role'),
                    format('%I.%I', c.table_schema, c.table_name)::regclass,
                    c.column_name,
                    'SELECT'
                );
        filter realtime.user_defined_filter;
        col_type regtype;

        in_val jsonb;
    begin
        for filter in select * from unnest(new.filters) loop
            -- Filtered column is valid
            if not filter.column_name = any(col_names) then
                raise exception 'invalid column for filter %', filter.column_name;
            end if;

            -- Type is sanitized and safe for string interpolation
            col_type = (
                select atttypid::regtype
                from pg_catalog.pg_attribute
                where attrelid = new.entity
                      and attname = filter.column_name
            );
            if col_type is null then
                raise exception 'failed to lookup type for column %', filter.column_name;
            end if;

            -- Set maximum number of entries for in filter
            if filter.op = 'in'::realtime.equality_op then
                in_val = realtime.cast(filter.value, (col_type::text || '[]')::regtype);
                if coalesce(jsonb_array_length(in_val), 0) > 100 then
                    raise exception 'too many values for `in` filter. Maximum 100';
                end if;
            else
                -- raises an exception if value is not coercable to type
                perform realtime.cast(filter.value, col_type);
            end if;

        end loop;

        -- Apply consistent order to filters so the unique constraint on
        -- (subscription_id, entity, filters) can't be tricked by a different filter order
        new.filters = coalesce(
            array_agg(f order by f.column_name, f.op, f.value),
            '{}'
        ) from unnest(new.filters) f;

        return new;
    end;
    $$;


ALTER FUNCTION realtime.subscription_check_filters() OWNER TO supabase_admin;

--
-- Name: to_regrole(text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.to_regrole(role_name text) RETURNS regrole
    LANGUAGE sql IMMUTABLE
    AS $$ select role_name::regrole $$;


ALTER FUNCTION realtime.to_regrole(role_name text) OWNER TO supabase_admin;

--
-- Name: topic(); Type: FUNCTION; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE FUNCTION realtime.topic() RETURNS text
    LANGUAGE sql STABLE
    AS $$
select nullif(current_setting('realtime.topic', true), '')::text;
$$;


ALTER FUNCTION realtime.topic() OWNER TO supabase_realtime_admin;

--
-- Name: add_prefixes(text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.add_prefixes(_bucket_id text, _name text) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    prefixes text[];
BEGIN
    prefixes := "storage"."get_prefixes"("_name");

    IF array_length(prefixes, 1) > 0 THEN
        INSERT INTO storage.prefixes (name, bucket_id)
        SELECT UNNEST(prefixes) as name, "_bucket_id" ON CONFLICT DO NOTHING;
    END IF;
END;
$$;


ALTER FUNCTION storage.add_prefixes(_bucket_id text, _name text) OWNER TO supabase_storage_admin;

--
-- Name: can_insert_object(text, text, uuid, jsonb); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO "storage"."objects" ("bucket_id", "name", "owner", "metadata") VALUES (bucketid, name, owner, metadata);
  -- hack to rollback the successful insert
  RAISE sqlstate 'PT200' using
  message = 'ROLLBACK',
  detail = 'rollback successful insert';
END
$$;


ALTER FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) OWNER TO supabase_storage_admin;

--
-- Name: delete_leaf_prefixes(text[], text[]); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.delete_leaf_prefixes(bucket_ids text[], names text[]) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    v_rows_deleted integer;
BEGIN
    LOOP
        WITH candidates AS (
            SELECT DISTINCT
                t.bucket_id,
                unnest(storage.get_prefixes(t.name)) AS name
            FROM unnest(bucket_ids, names) AS t(bucket_id, name)
        ),
        uniq AS (
             SELECT
                 bucket_id,
                 name,
                 storage.get_level(name) AS level
             FROM candidates
             WHERE name <> ''
             GROUP BY bucket_id, name
        ),
        leaf AS (
             SELECT
                 p.bucket_id,
                 p.name,
                 p.level
             FROM storage.prefixes AS p
                  JOIN uniq AS u
                       ON u.bucket_id = p.bucket_id
                           AND u.name = p.name
                           AND u.level = p.level
             WHERE NOT EXISTS (
                 SELECT 1
                 FROM storage.objects AS o
                 WHERE o.bucket_id = p.bucket_id
                   AND o.level = p.level + 1
                   AND o.name COLLATE "C" LIKE p.name || '/%'
             )
             AND NOT EXISTS (
                 SELECT 1
                 FROM storage.prefixes AS c
                 WHERE c.bucket_id = p.bucket_id
                   AND c.level = p.level + 1
                   AND c.name COLLATE "C" LIKE p.name || '/%'
             )
        )
        DELETE
        FROM storage.prefixes AS p
            USING leaf AS l
        WHERE p.bucket_id = l.bucket_id
          AND p.name = l.name
          AND p.level = l.level;

        GET DIAGNOSTICS v_rows_deleted = ROW_COUNT;
        EXIT WHEN v_rows_deleted = 0;
    END LOOP;
END;
$$;


ALTER FUNCTION storage.delete_leaf_prefixes(bucket_ids text[], names text[]) OWNER TO supabase_storage_admin;

--
-- Name: delete_prefix(text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.delete_prefix(_bucket_id text, _name text) RETURNS boolean
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
BEGIN
    -- Check if we can delete the prefix
    IF EXISTS(
        SELECT FROM "storage"."prefixes"
        WHERE "prefixes"."bucket_id" = "_bucket_id"
          AND level = "storage"."get_level"("_name") + 1
          AND "prefixes"."name" COLLATE "C" LIKE "_name" || '/%'
        LIMIT 1
    )
    OR EXISTS(
        SELECT FROM "storage"."objects"
        WHERE "objects"."bucket_id" = "_bucket_id"
          AND "storage"."get_level"("objects"."name") = "storage"."get_level"("_name") + 1
          AND "objects"."name" COLLATE "C" LIKE "_name" || '/%'
        LIMIT 1
    ) THEN
    -- There are sub-objects, skip deletion
    RETURN false;
    ELSE
        DELETE FROM "storage"."prefixes"
        WHERE "prefixes"."bucket_id" = "_bucket_id"
          AND level = "storage"."get_level"("_name")
          AND "prefixes"."name" = "_name";
        RETURN true;
    END IF;
END;
$$;


ALTER FUNCTION storage.delete_prefix(_bucket_id text, _name text) OWNER TO supabase_storage_admin;

--
-- Name: delete_prefix_hierarchy_trigger(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.delete_prefix_hierarchy_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    prefix text;
BEGIN
    prefix := "storage"."get_prefix"(OLD."name");

    IF coalesce(prefix, '') != '' THEN
        PERFORM "storage"."delete_prefix"(OLD."bucket_id", prefix);
    END IF;

    RETURN OLD;
END;
$$;


ALTER FUNCTION storage.delete_prefix_hierarchy_trigger() OWNER TO supabase_storage_admin;

--
-- Name: enforce_bucket_name_length(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.enforce_bucket_name_length() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
    if length(new.name) > 100 then
        raise exception 'bucket name "%" is too long (% characters). Max is 100.', new.name, length(new.name);
    end if;
    return new;
end;
$$;


ALTER FUNCTION storage.enforce_bucket_name_length() OWNER TO supabase_storage_admin;

--
-- Name: extension(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.extension(name text) RETURNS text
    LANGUAGE plpgsql IMMUTABLE
    AS $$
DECLARE
    _parts text[];
    _filename text;
BEGIN
    SELECT string_to_array(name, '/') INTO _parts;
    SELECT _parts[array_length(_parts,1)] INTO _filename;
    RETURN reverse(split_part(reverse(_filename), '.', 1));
END
$$;


ALTER FUNCTION storage.extension(name text) OWNER TO supabase_storage_admin;

--
-- Name: filename(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.filename(name text) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
_parts text[];
BEGIN
	select string_to_array(name, '/') into _parts;
	return _parts[array_length(_parts,1)];
END
$$;


ALTER FUNCTION storage.filename(name text) OWNER TO supabase_storage_admin;

--
-- Name: foldername(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.foldername(name text) RETURNS text[]
    LANGUAGE plpgsql IMMUTABLE
    AS $$
DECLARE
    _parts text[];
BEGIN
    -- Split on "/" to get path segments
    SELECT string_to_array(name, '/') INTO _parts;
    -- Return everything except the last segment
    RETURN _parts[1 : array_length(_parts,1) - 1];
END
$$;


ALTER FUNCTION storage.foldername(name text) OWNER TO supabase_storage_admin;

--
-- Name: get_level(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_level(name text) RETURNS integer
    LANGUAGE sql IMMUTABLE STRICT
    AS $$
SELECT array_length(string_to_array("name", '/'), 1);
$$;


ALTER FUNCTION storage.get_level(name text) OWNER TO supabase_storage_admin;

--
-- Name: get_prefix(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_prefix(name text) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
SELECT
    CASE WHEN strpos("name", '/') > 0 THEN
             regexp_replace("name", '[\/]{1}[^\/]+\/?$', '')
         ELSE
             ''
        END;
$_$;


ALTER FUNCTION storage.get_prefix(name text) OWNER TO supabase_storage_admin;

--
-- Name: get_prefixes(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_prefixes(name text) RETURNS text[]
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $$
DECLARE
    parts text[];
    prefixes text[];
    prefix text;
BEGIN
    -- Split the name into parts by '/'
    parts := string_to_array("name", '/');
    prefixes := '{}';

    -- Construct the prefixes, stopping one level below the last part
    FOR i IN 1..array_length(parts, 1) - 1 LOOP
            prefix := array_to_string(parts[1:i], '/');
            prefixes := array_append(prefixes, prefix);
    END LOOP;

    RETURN prefixes;
END;
$$;


ALTER FUNCTION storage.get_prefixes(name text) OWNER TO supabase_storage_admin;

--
-- Name: get_size_by_bucket(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_size_by_bucket() RETURNS TABLE(size bigint, bucket_id text)
    LANGUAGE plpgsql STABLE
    AS $$
BEGIN
    return query
        select sum((metadata->>'size')::bigint) as size, obj.bucket_id
        from "storage".objects as obj
        group by obj.bucket_id;
END
$$;


ALTER FUNCTION storage.get_size_by_bucket() OWNER TO supabase_storage_admin;

--
-- Name: list_multipart_uploads_with_delimiter(text, text, text, integer, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, next_key_token text DEFAULT ''::text, next_upload_token text DEFAULT ''::text) RETURNS TABLE(key text, id text, created_at timestamp with time zone)
    LANGUAGE plpgsql
    AS $_$
BEGIN
    RETURN QUERY EXECUTE
        'SELECT DISTINCT ON(key COLLATE "C") * from (
            SELECT
                CASE
                    WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                        substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1)))
                    ELSE
                        key
                END AS key, id, created_at
            FROM
                storage.s3_multipart_uploads
            WHERE
                bucket_id = $5 AND
                key ILIKE $1 || ''%'' AND
                CASE
                    WHEN $4 != '''' AND $6 = '''' THEN
                        CASE
                            WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                                substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1))) COLLATE "C" > $4
                            ELSE
                                key COLLATE "C" > $4
                            END
                    ELSE
                        true
                END AND
                CASE
                    WHEN $6 != '''' THEN
                        id COLLATE "C" > $6
                    ELSE
                        true
                    END
            ORDER BY
                key COLLATE "C" ASC, created_at ASC) as e order by key COLLATE "C" LIMIT $3'
        USING prefix_param, delimiter_param, max_keys, next_key_token, bucket_id, next_upload_token;
END;
$_$;


ALTER FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, next_key_token text, next_upload_token text) OWNER TO supabase_storage_admin;

--
-- Name: list_objects_with_delimiter(text, text, text, integer, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.list_objects_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, start_after text DEFAULT ''::text, next_token text DEFAULT ''::text) RETURNS TABLE(name text, id uuid, metadata jsonb, updated_at timestamp with time zone)
    LANGUAGE plpgsql
    AS $_$
BEGIN
    RETURN QUERY EXECUTE
        'SELECT DISTINCT ON(name COLLATE "C") * from (
            SELECT
                CASE
                    WHEN position($2 IN substring(name from length($1) + 1)) > 0 THEN
                        substring(name from 1 for length($1) + position($2 IN substring(name from length($1) + 1)))
                    ELSE
                        name
                END AS name, id, metadata, updated_at
            FROM
                storage.objects
            WHERE
                bucket_id = $5 AND
                name ILIKE $1 || ''%'' AND
                CASE
                    WHEN $6 != '''' THEN
                    name COLLATE "C" > $6
                ELSE true END
                AND CASE
                    WHEN $4 != '''' THEN
                        CASE
                            WHEN position($2 IN substring(name from length($1) + 1)) > 0 THEN
                                substring(name from 1 for length($1) + position($2 IN substring(name from length($1) + 1))) COLLATE "C" > $4
                            ELSE
                                name COLLATE "C" > $4
                            END
                    ELSE
                        true
                END
            ORDER BY
                name COLLATE "C" ASC) as e order by name COLLATE "C" LIMIT $3'
        USING prefix_param, delimiter_param, max_keys, next_token, bucket_id, start_after;
END;
$_$;


ALTER FUNCTION storage.list_objects_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, start_after text, next_token text) OWNER TO supabase_storage_admin;

--
-- Name: lock_top_prefixes(text[], text[]); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.lock_top_prefixes(bucket_ids text[], names text[]) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    v_bucket text;
    v_top text;
BEGIN
    FOR v_bucket, v_top IN
        SELECT DISTINCT t.bucket_id,
            split_part(t.name, '/', 1) AS top
        FROM unnest(bucket_ids, names) AS t(bucket_id, name)
        WHERE t.name <> ''
        ORDER BY 1, 2
        LOOP
            PERFORM pg_advisory_xact_lock(hashtextextended(v_bucket || '/' || v_top, 0));
        END LOOP;
END;
$$;


ALTER FUNCTION storage.lock_top_prefixes(bucket_ids text[], names text[]) OWNER TO supabase_storage_admin;

--
-- Name: objects_delete_cleanup(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.objects_delete_cleanup() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    v_bucket_ids text[];
    v_names      text[];
BEGIN
    IF current_setting('storage.gc.prefixes', true) = '1' THEN
        RETURN NULL;
    END IF;

    PERFORM set_config('storage.gc.prefixes', '1', true);

    SELECT COALESCE(array_agg(d.bucket_id), '{}'),
           COALESCE(array_agg(d.name), '{}')
    INTO v_bucket_ids, v_names
    FROM deleted AS d
    WHERE d.name <> '';

    PERFORM storage.lock_top_prefixes(v_bucket_ids, v_names);
    PERFORM storage.delete_leaf_prefixes(v_bucket_ids, v_names);

    RETURN NULL;
END;
$$;


ALTER FUNCTION storage.objects_delete_cleanup() OWNER TO supabase_storage_admin;

--
-- Name: objects_insert_prefix_trigger(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.objects_insert_prefix_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    PERFORM "storage"."add_prefixes"(NEW."bucket_id", NEW."name");
    NEW.level := "storage"."get_level"(NEW."name");

    RETURN NEW;
END;
$$;


ALTER FUNCTION storage.objects_insert_prefix_trigger() OWNER TO supabase_storage_admin;

--
-- Name: objects_update_cleanup(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.objects_update_cleanup() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    -- NEW - OLD (destinations to create prefixes for)
    v_add_bucket_ids text[];
    v_add_names      text[];

    -- OLD - NEW (sources to prune)
    v_src_bucket_ids text[];
    v_src_names      text[];
BEGIN
    IF TG_OP <> 'UPDATE' THEN
        RETURN NULL;
    END IF;

    -- 1) Compute NEW−OLD (added paths) and OLD−NEW (moved-away paths)
    WITH added AS (
        SELECT n.bucket_id, n.name
        FROM new_rows n
        WHERE n.name <> '' AND position('/' in n.name) > 0
        EXCEPT
        SELECT o.bucket_id, o.name FROM old_rows o WHERE o.name <> ''
    ),
    moved AS (
         SELECT o.bucket_id, o.name
         FROM old_rows o
         WHERE o.name <> ''
         EXCEPT
         SELECT n.bucket_id, n.name FROM new_rows n WHERE n.name <> ''
    )
    SELECT
        -- arrays for ADDED (dest) in stable order
        COALESCE( (SELECT array_agg(a.bucket_id ORDER BY a.bucket_id, a.name) FROM added a), '{}' ),
        COALESCE( (SELECT array_agg(a.name      ORDER BY a.bucket_id, a.name) FROM added a), '{}' ),
        -- arrays for MOVED (src) in stable order
        COALESCE( (SELECT array_agg(m.bucket_id ORDER BY m.bucket_id, m.name) FROM moved m), '{}' ),
        COALESCE( (SELECT array_agg(m.name      ORDER BY m.bucket_id, m.name) FROM moved m), '{}' )
    INTO v_add_bucket_ids, v_add_names, v_src_bucket_ids, v_src_names;

    -- Nothing to do?
    IF (array_length(v_add_bucket_ids, 1) IS NULL) AND (array_length(v_src_bucket_ids, 1) IS NULL) THEN
        RETURN NULL;
    END IF;

    -- 2) Take per-(bucket, top) locks: ALL prefixes in consistent global order to prevent deadlocks
    DECLARE
        v_all_bucket_ids text[];
        v_all_names text[];
    BEGIN
        -- Combine source and destination arrays for consistent lock ordering
        v_all_bucket_ids := COALESCE(v_src_bucket_ids, '{}') || COALESCE(v_add_bucket_ids, '{}');
        v_all_names := COALESCE(v_src_names, '{}') || COALESCE(v_add_names, '{}');

        -- Single lock call ensures consistent global ordering across all transactions
        IF array_length(v_all_bucket_ids, 1) IS NOT NULL THEN
            PERFORM storage.lock_top_prefixes(v_all_bucket_ids, v_all_names);
        END IF;
    END;

    -- 3) Create destination prefixes (NEW−OLD) BEFORE pruning sources
    IF array_length(v_add_bucket_ids, 1) IS NOT NULL THEN
        WITH candidates AS (
            SELECT DISTINCT t.bucket_id, unnest(storage.get_prefixes(t.name)) AS name
            FROM unnest(v_add_bucket_ids, v_add_names) AS t(bucket_id, name)
            WHERE name <> ''
        )
        INSERT INTO storage.prefixes (bucket_id, name)
        SELECT c.bucket_id, c.name
        FROM candidates c
        ON CONFLICT DO NOTHING;
    END IF;

    -- 4) Prune source prefixes bottom-up for OLD−NEW
    IF array_length(v_src_bucket_ids, 1) IS NOT NULL THEN
        -- re-entrancy guard so DELETE on prefixes won't recurse
        IF current_setting('storage.gc.prefixes', true) <> '1' THEN
            PERFORM set_config('storage.gc.prefixes', '1', true);
        END IF;

        PERFORM storage.delete_leaf_prefixes(v_src_bucket_ids, v_src_names);
    END IF;

    RETURN NULL;
END;
$$;


ALTER FUNCTION storage.objects_update_cleanup() OWNER TO supabase_storage_admin;

--
-- Name: objects_update_level_trigger(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.objects_update_level_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    -- Ensure this is an update operation and the name has changed
    IF TG_OP = 'UPDATE' AND (NEW."name" <> OLD."name" OR NEW."bucket_id" <> OLD."bucket_id") THEN
        -- Set the new level
        NEW."level" := "storage"."get_level"(NEW."name");
    END IF;
    RETURN NEW;
END;
$$;


ALTER FUNCTION storage.objects_update_level_trigger() OWNER TO supabase_storage_admin;

--
-- Name: objects_update_prefix_trigger(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.objects_update_prefix_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    old_prefixes TEXT[];
BEGIN
    -- Ensure this is an update operation and the name has changed
    IF TG_OP = 'UPDATE' AND (NEW."name" <> OLD."name" OR NEW."bucket_id" <> OLD."bucket_id") THEN
        -- Retrieve old prefixes
        old_prefixes := "storage"."get_prefixes"(OLD."name");

        -- Remove old prefixes that are only used by this object
        WITH all_prefixes as (
            SELECT unnest(old_prefixes) as prefix
        ),
        can_delete_prefixes as (
             SELECT prefix
             FROM all_prefixes
             WHERE NOT EXISTS (
                 SELECT 1 FROM "storage"."objects"
                 WHERE "bucket_id" = OLD."bucket_id"
                   AND "name" <> OLD."name"
                   AND "name" LIKE (prefix || '%')
             )
         )
        DELETE FROM "storage"."prefixes" WHERE name IN (SELECT prefix FROM can_delete_prefixes);

        -- Add new prefixes
        PERFORM "storage"."add_prefixes"(NEW."bucket_id", NEW."name");
    END IF;
    -- Set the new level
    NEW."level" := "storage"."get_level"(NEW."name");

    RETURN NEW;
END;
$$;


ALTER FUNCTION storage.objects_update_prefix_trigger() OWNER TO supabase_storage_admin;

--
-- Name: operation(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.operation() RETURNS text
    LANGUAGE plpgsql STABLE
    AS $$
BEGIN
    RETURN current_setting('storage.operation', true);
END;
$$;


ALTER FUNCTION storage.operation() OWNER TO supabase_storage_admin;

--
-- Name: prefixes_delete_cleanup(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.prefixes_delete_cleanup() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    v_bucket_ids text[];
    v_names      text[];
BEGIN
    IF current_setting('storage.gc.prefixes', true) = '1' THEN
        RETURN NULL;
    END IF;

    PERFORM set_config('storage.gc.prefixes', '1', true);

    SELECT COALESCE(array_agg(d.bucket_id), '{}'),
           COALESCE(array_agg(d.name), '{}')
    INTO v_bucket_ids, v_names
    FROM deleted AS d
    WHERE d.name <> '';

    PERFORM storage.lock_top_prefixes(v_bucket_ids, v_names);
    PERFORM storage.delete_leaf_prefixes(v_bucket_ids, v_names);

    RETURN NULL;
END;
$$;


ALTER FUNCTION storage.prefixes_delete_cleanup() OWNER TO supabase_storage_admin;

--
-- Name: prefixes_insert_trigger(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.prefixes_insert_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    PERFORM "storage"."add_prefixes"(NEW."bucket_id", NEW."name");
    RETURN NEW;
END;
$$;


ALTER FUNCTION storage.prefixes_insert_trigger() OWNER TO supabase_storage_admin;

--
-- Name: search(text, text, integer, integer, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search(prefix text, bucketname text, limits integer DEFAULT 100, levels integer DEFAULT 1, offsets integer DEFAULT 0, search text DEFAULT ''::text, sortcolumn text DEFAULT 'name'::text, sortorder text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql
    AS $$
declare
    can_bypass_rls BOOLEAN;
begin
    SELECT rolbypassrls
    INTO can_bypass_rls
    FROM pg_roles
    WHERE rolname = coalesce(nullif(current_setting('role', true), 'none'), current_user);

    IF can_bypass_rls THEN
        RETURN QUERY SELECT * FROM storage.search_v1_optimised(prefix, bucketname, limits, levels, offsets, search, sortcolumn, sortorder);
    ELSE
        RETURN QUERY SELECT * FROM storage.search_legacy_v1(prefix, bucketname, limits, levels, offsets, search, sortcolumn, sortorder);
    END IF;
end;
$$;


ALTER FUNCTION storage.search(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text) OWNER TO supabase_storage_admin;

--
-- Name: search_legacy_v1(text, text, integer, integer, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search_legacy_v1(prefix text, bucketname text, limits integer DEFAULT 100, levels integer DEFAULT 1, offsets integer DEFAULT 0, search text DEFAULT ''::text, sortcolumn text DEFAULT 'name'::text, sortorder text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
declare
    v_order_by text;
    v_sort_order text;
begin
    case
        when sortcolumn = 'name' then
            v_order_by = 'name';
        when sortcolumn = 'updated_at' then
            v_order_by = 'updated_at';
        when sortcolumn = 'created_at' then
            v_order_by = 'created_at';
        when sortcolumn = 'last_accessed_at' then
            v_order_by = 'last_accessed_at';
        else
            v_order_by = 'name';
        end case;

    case
        when sortorder = 'asc' then
            v_sort_order = 'asc';
        when sortorder = 'desc' then
            v_sort_order = 'desc';
        else
            v_sort_order = 'asc';
        end case;

    v_order_by = v_order_by || ' ' || v_sort_order;

    return query execute
        'with folders as (
           select path_tokens[$1] as folder
           from storage.objects
             where objects.name ilike $2 || $3 || ''%''
               and bucket_id = $4
               and array_length(objects.path_tokens, 1) <> $1
           group by folder
           order by folder ' || v_sort_order || '
     )
     (select folder as "name",
            null as id,
            null as updated_at,
            null as created_at,
            null as last_accessed_at,
            null as metadata from folders)
     union all
     (select path_tokens[$1] as "name",
            id,
            updated_at,
            created_at,
            last_accessed_at,
            metadata
     from storage.objects
     where objects.name ilike $2 || $3 || ''%''
       and bucket_id = $4
       and array_length(objects.path_tokens, 1) = $1
     order by ' || v_order_by || ')
     limit $5
     offset $6' using levels, prefix, search, bucketname, limits, offsets;
end;
$_$;


ALTER FUNCTION storage.search_legacy_v1(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text) OWNER TO supabase_storage_admin;

--
-- Name: search_v1_optimised(text, text, integer, integer, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search_v1_optimised(prefix text, bucketname text, limits integer DEFAULT 100, levels integer DEFAULT 1, offsets integer DEFAULT 0, search text DEFAULT ''::text, sortcolumn text DEFAULT 'name'::text, sortorder text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
declare
    v_order_by text;
    v_sort_order text;
begin
    case
        when sortcolumn = 'name' then
            v_order_by = 'name';
        when sortcolumn = 'updated_at' then
            v_order_by = 'updated_at';
        when sortcolumn = 'created_at' then
            v_order_by = 'created_at';
        when sortcolumn = 'last_accessed_at' then
            v_order_by = 'last_accessed_at';
        else
            v_order_by = 'name';
        end case;

    case
        when sortorder = 'asc' then
            v_sort_order = 'asc';
        when sortorder = 'desc' then
            v_sort_order = 'desc';
        else
            v_sort_order = 'asc';
        end case;

    v_order_by = v_order_by || ' ' || v_sort_order;

    return query execute
        'with folders as (
           select (string_to_array(name, ''/''))[level] as name
           from storage.prefixes
             where lower(prefixes.name) like lower($2 || $3) || ''%''
               and bucket_id = $4
               and level = $1
           order by name ' || v_sort_order || '
     )
     (select name,
            null as id,
            null as updated_at,
            null as created_at,
            null as last_accessed_at,
            null as metadata from folders)
     union all
     (select path_tokens[level] as "name",
            id,
            updated_at,
            created_at,
            last_accessed_at,
            metadata
     from storage.objects
     where lower(objects.name) like lower($2 || $3) || ''%''
       and bucket_id = $4
       and level = $1
     order by ' || v_order_by || ')
     limit $5
     offset $6' using levels, prefix, search, bucketname, limits, offsets;
end;
$_$;


ALTER FUNCTION storage.search_v1_optimised(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text) OWNER TO supabase_storage_admin;

--
-- Name: search_v2(text, text, integer, integer, text, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search_v2(prefix text, bucket_name text, limits integer DEFAULT 100, levels integer DEFAULT 1, start_after text DEFAULT ''::text, sort_order text DEFAULT 'asc'::text, sort_column text DEFAULT 'name'::text, sort_column_after text DEFAULT ''::text) RETURNS TABLE(key text, name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
DECLARE
    sort_col text;
    sort_ord text;
    cursor_op text;
    cursor_expr text;
    sort_expr text;
BEGIN
    -- Validate sort_order
    sort_ord := lower(sort_order);
    IF sort_ord NOT IN ('asc', 'desc') THEN
        sort_ord := 'asc';
    END IF;

    -- Determine cursor comparison operator
    IF sort_ord = 'asc' THEN
        cursor_op := '>';
    ELSE
        cursor_op := '<';
    END IF;
    
    sort_col := lower(sort_column);
    -- Validate sort column  
    IF sort_col IN ('updated_at', 'created_at') THEN
        cursor_expr := format(
            '($5 = '''' OR ROW(date_trunc(''milliseconds'', %I), name COLLATE "C") %s ROW(COALESCE(NULLIF($6, '''')::timestamptz, ''epoch''::timestamptz), $5))',
            sort_col, cursor_op
        );
        sort_expr := format(
            'COALESCE(date_trunc(''milliseconds'', %I), ''epoch''::timestamptz) %s, name COLLATE "C" %s',
            sort_col, sort_ord, sort_ord
        );
    ELSE
        cursor_expr := format('($5 = '''' OR name COLLATE "C" %s $5)', cursor_op);
        sort_expr := format('name COLLATE "C" %s', sort_ord);
    END IF;

    RETURN QUERY EXECUTE format(
        $sql$
        SELECT * FROM (
            (
                SELECT
                    split_part(name, '/', $4) AS key,
                    name,
                    NULL::uuid AS id,
                    updated_at,
                    created_at,
                    NULL::timestamptz AS last_accessed_at,
                    NULL::jsonb AS metadata
                FROM storage.prefixes
                WHERE name COLLATE "C" LIKE $1 || '%%'
                    AND bucket_id = $2
                    AND level = $4
                    AND %s
                ORDER BY %s
                LIMIT $3
            )
            UNION ALL
            (
                SELECT
                    split_part(name, '/', $4) AS key,
                    name,
                    id,
                    updated_at,
                    created_at,
                    last_accessed_at,
                    metadata
                FROM storage.objects
                WHERE name COLLATE "C" LIKE $1 || '%%'
                    AND bucket_id = $2
                    AND level = $4
                    AND %s
                ORDER BY %s
                LIMIT $3
            )
        ) obj
        ORDER BY %s
        LIMIT $3
        $sql$,
        cursor_expr,    -- prefixes WHERE
        sort_expr,      -- prefixes ORDER BY
        cursor_expr,    -- objects WHERE
        sort_expr,      -- objects ORDER BY
        sort_expr       -- final ORDER BY
    )
    USING prefix, bucket_name, limits, levels, start_after, sort_column_after;
END;
$_$;


ALTER FUNCTION storage.search_v2(prefix text, bucket_name text, limits integer, levels integer, start_after text, sort_order text, sort_column text, sort_column_after text) OWNER TO supabase_storage_admin;

--
-- Name: update_updated_at_column(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.update_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW; 
END;
$$;


ALTER FUNCTION storage.update_updated_at_column() OWNER TO supabase_storage_admin;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: audit_log_entries; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.audit_log_entries (
    instance_id uuid,
    id uuid NOT NULL,
    payload json,
    created_at timestamp with time zone,
    ip_address character varying(64) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE auth.audit_log_entries OWNER TO supabase_auth_admin;

--
-- Name: TABLE audit_log_entries; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.audit_log_entries IS 'Auth: Audit trail for user actions.';


--
-- Name: flow_state; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.flow_state (
    id uuid NOT NULL,
    user_id uuid,
    auth_code text NOT NULL,
    code_challenge_method auth.code_challenge_method NOT NULL,
    code_challenge text NOT NULL,
    provider_type text NOT NULL,
    provider_access_token text,
    provider_refresh_token text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    authentication_method text NOT NULL,
    auth_code_issued_at timestamp with time zone
);


ALTER TABLE auth.flow_state OWNER TO supabase_auth_admin;

--
-- Name: TABLE flow_state; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.flow_state IS 'stores metadata for pkce logins';


--
-- Name: identities; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.identities (
    provider_id text NOT NULL,
    user_id uuid NOT NULL,
    identity_data jsonb NOT NULL,
    provider text NOT NULL,
    last_sign_in_at timestamp with time zone,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    email text GENERATED ALWAYS AS (lower((identity_data ->> 'email'::text))) STORED,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE auth.identities OWNER TO supabase_auth_admin;

--
-- Name: TABLE identities; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.identities IS 'Auth: Stores identities associated to a user.';


--
-- Name: COLUMN identities.email; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.identities.email IS 'Auth: Email is a generated column that references the optional email property in the identity_data';


--
-- Name: instances; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.instances (
    id uuid NOT NULL,
    uuid uuid,
    raw_base_config text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE auth.instances OWNER TO supabase_auth_admin;

--
-- Name: TABLE instances; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.instances IS 'Auth: Manages users across multiple sites.';


--
-- Name: mfa_amr_claims; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_amr_claims (
    session_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    authentication_method text NOT NULL,
    id uuid NOT NULL
);


ALTER TABLE auth.mfa_amr_claims OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_amr_claims; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_amr_claims IS 'auth: stores authenticator method reference claims for multi factor authentication';


--
-- Name: mfa_challenges; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_challenges (
    id uuid NOT NULL,
    factor_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    verified_at timestamp with time zone,
    ip_address inet NOT NULL,
    otp_code text,
    web_authn_session_data jsonb
);


ALTER TABLE auth.mfa_challenges OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_challenges; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_challenges IS 'auth: stores metadata about challenge requests made';


--
-- Name: mfa_factors; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_factors (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    friendly_name text,
    factor_type auth.factor_type NOT NULL,
    status auth.factor_status NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    secret text,
    phone text,
    last_challenged_at timestamp with time zone,
    web_authn_credential jsonb,
    web_authn_aaguid uuid,
    last_webauthn_challenge_data jsonb
);


ALTER TABLE auth.mfa_factors OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_factors; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_factors IS 'auth: stores metadata about factors';


--
-- Name: COLUMN mfa_factors.last_webauthn_challenge_data; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.mfa_factors.last_webauthn_challenge_data IS 'Stores the latest WebAuthn challenge data including attestation/assertion for customer verification';


--
-- Name: oauth_authorizations; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.oauth_authorizations (
    id uuid NOT NULL,
    authorization_id text NOT NULL,
    client_id uuid NOT NULL,
    user_id uuid,
    redirect_uri text NOT NULL,
    scope text NOT NULL,
    state text,
    resource text,
    code_challenge text,
    code_challenge_method auth.code_challenge_method,
    response_type auth.oauth_response_type DEFAULT 'code'::auth.oauth_response_type NOT NULL,
    status auth.oauth_authorization_status DEFAULT 'pending'::auth.oauth_authorization_status NOT NULL,
    authorization_code text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    expires_at timestamp with time zone DEFAULT (now() + '00:03:00'::interval) NOT NULL,
    approved_at timestamp with time zone,
    nonce text,
    CONSTRAINT oauth_authorizations_authorization_code_length CHECK ((char_length(authorization_code) <= 255)),
    CONSTRAINT oauth_authorizations_code_challenge_length CHECK ((char_length(code_challenge) <= 128)),
    CONSTRAINT oauth_authorizations_expires_at_future CHECK ((expires_at > created_at)),
    CONSTRAINT oauth_authorizations_nonce_length CHECK ((char_length(nonce) <= 255)),
    CONSTRAINT oauth_authorizations_redirect_uri_length CHECK ((char_length(redirect_uri) <= 2048)),
    CONSTRAINT oauth_authorizations_resource_length CHECK ((char_length(resource) <= 2048)),
    CONSTRAINT oauth_authorizations_scope_length CHECK ((char_length(scope) <= 4096)),
    CONSTRAINT oauth_authorizations_state_length CHECK ((char_length(state) <= 4096))
);


ALTER TABLE auth.oauth_authorizations OWNER TO supabase_auth_admin;

--
-- Name: oauth_client_states; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.oauth_client_states (
    id uuid NOT NULL,
    provider_type text NOT NULL,
    code_verifier text,
    created_at timestamp with time zone NOT NULL
);


ALTER TABLE auth.oauth_client_states OWNER TO supabase_auth_admin;

--
-- Name: TABLE oauth_client_states; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.oauth_client_states IS 'Stores OAuth states for third-party provider authentication flows where Supabase acts as the OAuth client.';


--
-- Name: oauth_clients; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.oauth_clients (
    id uuid NOT NULL,
    client_secret_hash text,
    registration_type auth.oauth_registration_type NOT NULL,
    redirect_uris text NOT NULL,
    grant_types text NOT NULL,
    client_name text,
    client_uri text,
    logo_uri text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    client_type auth.oauth_client_type DEFAULT 'confidential'::auth.oauth_client_type NOT NULL,
    CONSTRAINT oauth_clients_client_name_length CHECK ((char_length(client_name) <= 1024)),
    CONSTRAINT oauth_clients_client_uri_length CHECK ((char_length(client_uri) <= 2048)),
    CONSTRAINT oauth_clients_logo_uri_length CHECK ((char_length(logo_uri) <= 2048))
);


ALTER TABLE auth.oauth_clients OWNER TO supabase_auth_admin;

--
-- Name: oauth_consents; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.oauth_consents (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    client_id uuid NOT NULL,
    scopes text NOT NULL,
    granted_at timestamp with time zone DEFAULT now() NOT NULL,
    revoked_at timestamp with time zone,
    CONSTRAINT oauth_consents_revoked_after_granted CHECK (((revoked_at IS NULL) OR (revoked_at >= granted_at))),
    CONSTRAINT oauth_consents_scopes_length CHECK ((char_length(scopes) <= 2048)),
    CONSTRAINT oauth_consents_scopes_not_empty CHECK ((char_length(TRIM(BOTH FROM scopes)) > 0))
);


ALTER TABLE auth.oauth_consents OWNER TO supabase_auth_admin;

--
-- Name: one_time_tokens; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.one_time_tokens (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    token_type auth.one_time_token_type NOT NULL,
    token_hash text NOT NULL,
    relates_to text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    CONSTRAINT one_time_tokens_token_hash_check CHECK ((char_length(token_hash) > 0))
);


ALTER TABLE auth.one_time_tokens OWNER TO supabase_auth_admin;

--
-- Name: refresh_tokens; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.refresh_tokens (
    instance_id uuid,
    id bigint NOT NULL,
    token character varying(255),
    user_id character varying(255),
    revoked boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    parent character varying(255),
    session_id uuid
);


ALTER TABLE auth.refresh_tokens OWNER TO supabase_auth_admin;

--
-- Name: TABLE refresh_tokens; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.refresh_tokens IS 'Auth: Store of tokens used to refresh JWT tokens once they expire.';


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE; Schema: auth; Owner: supabase_auth_admin
--

CREATE SEQUENCE auth.refresh_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE auth.refresh_tokens_id_seq OWNER TO supabase_auth_admin;

--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: auth; Owner: supabase_auth_admin
--

ALTER SEQUENCE auth.refresh_tokens_id_seq OWNED BY auth.refresh_tokens.id;


--
-- Name: saml_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.saml_providers (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    entity_id text NOT NULL,
    metadata_xml text NOT NULL,
    metadata_url text,
    attribute_mapping jsonb,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    name_id_format text,
    CONSTRAINT "entity_id not empty" CHECK ((char_length(entity_id) > 0)),
    CONSTRAINT "metadata_url not empty" CHECK (((metadata_url = NULL::text) OR (char_length(metadata_url) > 0))),
    CONSTRAINT "metadata_xml not empty" CHECK ((char_length(metadata_xml) > 0))
);


ALTER TABLE auth.saml_providers OWNER TO supabase_auth_admin;

--
-- Name: TABLE saml_providers; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.saml_providers IS 'Auth: Manages SAML Identity Provider connections.';


--
-- Name: saml_relay_states; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.saml_relay_states (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    request_id text NOT NULL,
    for_email text,
    redirect_to text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    flow_state_id uuid,
    CONSTRAINT "request_id not empty" CHECK ((char_length(request_id) > 0))
);


ALTER TABLE auth.saml_relay_states OWNER TO supabase_auth_admin;

--
-- Name: TABLE saml_relay_states; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.saml_relay_states IS 'Auth: Contains SAML Relay State information for each Service Provider initiated login.';


--
-- Name: schema_migrations; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE auth.schema_migrations OWNER TO supabase_auth_admin;

--
-- Name: TABLE schema_migrations; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.schema_migrations IS 'Auth: Manages updates to the auth system.';


--
-- Name: sessions; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sessions (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    factor_id uuid,
    aal auth.aal_level,
    not_after timestamp with time zone,
    refreshed_at timestamp without time zone,
    user_agent text,
    ip inet,
    tag text,
    oauth_client_id uuid,
    refresh_token_hmac_key text,
    refresh_token_counter bigint,
    scopes text,
    CONSTRAINT sessions_scopes_length CHECK ((char_length(scopes) <= 4096))
);


ALTER TABLE auth.sessions OWNER TO supabase_auth_admin;

--
-- Name: TABLE sessions; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sessions IS 'Auth: Stores session data associated to a user.';


--
-- Name: COLUMN sessions.not_after; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sessions.not_after IS 'Auth: Not after is a nullable column that contains a timestamp after which the session should be regarded as expired.';


--
-- Name: COLUMN sessions.refresh_token_hmac_key; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sessions.refresh_token_hmac_key IS 'Holds a HMAC-SHA256 key used to sign refresh tokens for this session.';


--
-- Name: COLUMN sessions.refresh_token_counter; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sessions.refresh_token_counter IS 'Holds the ID (counter) of the last issued refresh token.';


--
-- Name: sso_domains; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sso_domains (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    domain text NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    CONSTRAINT "domain not empty" CHECK ((char_length(domain) > 0))
);


ALTER TABLE auth.sso_domains OWNER TO supabase_auth_admin;

--
-- Name: TABLE sso_domains; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sso_domains IS 'Auth: Manages SSO email address domain mapping to an SSO Identity Provider.';


--
-- Name: sso_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sso_providers (
    id uuid NOT NULL,
    resource_id text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    disabled boolean,
    CONSTRAINT "resource_id not empty" CHECK (((resource_id = NULL::text) OR (char_length(resource_id) > 0)))
);


ALTER TABLE auth.sso_providers OWNER TO supabase_auth_admin;

--
-- Name: TABLE sso_providers; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sso_providers IS 'Auth: Manages SSO identity provider information; see saml_providers for SAML.';


--
-- Name: COLUMN sso_providers.resource_id; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sso_providers.resource_id IS 'Auth: Uniquely identifies a SSO provider according to a user-chosen resource ID (case insensitive), useful in infrastructure as code.';


--
-- Name: users; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.users (
    instance_id uuid,
    id uuid NOT NULL,
    aud character varying(255),
    role character varying(255),
    email character varying(255),
    encrypted_password character varying(255),
    email_confirmed_at timestamp with time zone,
    invited_at timestamp with time zone,
    confirmation_token character varying(255),
    confirmation_sent_at timestamp with time zone,
    recovery_token character varying(255),
    recovery_sent_at timestamp with time zone,
    email_change_token_new character varying(255),
    email_change character varying(255),
    email_change_sent_at timestamp with time zone,
    last_sign_in_at timestamp with time zone,
    raw_app_meta_data jsonb,
    raw_user_meta_data jsonb,
    is_super_admin boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    phone text DEFAULT NULL::character varying,
    phone_confirmed_at timestamp with time zone,
    phone_change text DEFAULT ''::character varying,
    phone_change_token character varying(255) DEFAULT ''::character varying,
    phone_change_sent_at timestamp with time zone,
    confirmed_at timestamp with time zone GENERATED ALWAYS AS (LEAST(email_confirmed_at, phone_confirmed_at)) STORED,
    email_change_token_current character varying(255) DEFAULT ''::character varying,
    email_change_confirm_status smallint DEFAULT 0,
    banned_until timestamp with time zone,
    reauthentication_token character varying(255) DEFAULT ''::character varying,
    reauthentication_sent_at timestamp with time zone,
    is_sso_user boolean DEFAULT false NOT NULL,
    deleted_at timestamp with time zone,
    is_anonymous boolean DEFAULT false NOT NULL,
    CONSTRAINT users_email_change_confirm_status_check CHECK (((email_change_confirm_status >= 0) AND (email_change_confirm_status <= 2)))
);


ALTER TABLE auth.users OWNER TO supabase_auth_admin;

--
-- Name: TABLE users; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.users IS 'Auth: Stores user login data within a secure schema.';


--
-- Name: COLUMN users.is_sso_user; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.users.is_sso_user IS 'Auth: Set this column to true when the account comes from SSO. These accounts can have duplicate emails.';


--
-- Name: app_settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_settings (
    key text NOT NULL,
    value jsonb NOT NULL,
    description text,
    updated_at timestamp with time zone DEFAULT now(),
    updated_by uuid
);


ALTER TABLE public.app_settings OWNER TO postgres;

--
-- Name: bookmarks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bookmarks (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid NOT NULL,
    question_id uuid NOT NULL,
    created_at timestamp with time zone DEFAULT timezone('utc'::text, now()) NOT NULL
);


ALTER TABLE public.bookmarks OWNER TO postgres;

--
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    name text NOT NULL,
    description text,
    image_url text,
    slug text,
    "order" integer DEFAULT 0,
    created_at timestamp with time zone DEFAULT timezone('utc'::text, now()) NOT NULL
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- Name: exam_attempts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.exam_attempts (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid NOT NULL,
    started_at timestamp with time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    completed_at timestamp with time zone,
    score integer,
    total_questions integer,
    is_completed boolean DEFAULT false,
    category_id uuid,
    exam_year integer,
    mode text DEFAULT 'practice'::text,
    time_remaining integer
);


ALTER TABLE public.exam_attempts OWNER TO postgres;

--
-- Name: heart_logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.heart_logs (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    sender_id uuid NOT NULL,
    receiver_id uuid NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.heart_logs OWNER TO postgres;

--
-- Name: question_attempts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.question_attempts (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid NOT NULL,
    question_id uuid NOT NULL,
    attempt_id uuid,
    option_id uuid,
    is_correct boolean NOT NULL,
    created_at timestamp with time zone DEFAULT timezone('utc'::text, now()) NOT NULL
);


ALTER TABLE public.question_attempts OWNER TO postgres;

--
-- Name: latest_question_attempts; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.latest_question_attempts WITH (security_invoker='true') AS
 SELECT DISTINCT ON (user_id, question_id) user_id,
    question_id,
    is_correct,
    created_at
   FROM public.question_attempts
  ORDER BY user_id, question_id, created_at DESC;


ALTER VIEW public.latest_question_attempts OWNER TO postgres;

--
-- Name: profiles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.profiles (
    id uuid NOT NULL,
    updated_at timestamp with time zone,
    email text,
    role text DEFAULT 'user'::text,
    plan text DEFAULT 'free'::text,
    level integer DEFAULT 1,
    xp integer DEFAULT 0,
    name text,
    created_at timestamp with time zone DEFAULT now(),
    is_pro boolean DEFAULT false,
    avatar_url text,
    hearts integer DEFAULT 7 NOT NULL,
    last_heart_regenerated_at timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT username_length CHECK ((char_length(email) >= 3))
);


ALTER TABLE public.profiles OWNER TO postgres;

--
-- Name: leaderboard; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.leaderboard AS
 SELECT id AS user_id,
    name,
    avatar_url,
    xp,
    level,
    plan
   FROM public.profiles
  WHERE (name IS NOT NULL)
  ORDER BY xp DESC;


ALTER VIEW public.leaderboard OWNER TO postgres;

--
-- Name: notifications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notifications (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid NOT NULL,
    title text NOT NULL,
    message text NOT NULL,
    type text DEFAULT 'info'::text,
    is_read boolean DEFAULT false,
    created_at timestamp with time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    CONSTRAINT notifications_type_check CHECK ((type = ANY (ARRAY['info'::text, 'success'::text, 'warning'::text, 'achievement'::text])))
);


ALTER TABLE public.notifications OWNER TO postgres;

--
-- Name: options; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.options (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    question_id uuid NOT NULL,
    content text NOT NULL,
    is_correct boolean DEFAULT false,
    "order" integer DEFAULT 0
);


ALTER TABLE public.options OWNER TO postgres;

--
-- Name: questions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.questions (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    category_id uuid NOT NULL,
    content text NOT NULL,
    explanation text,
    image_url text,
    difficulty integer DEFAULT 1,
    question_type text DEFAULT 'multiple_choice'::text,
    created_at timestamp with time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    updated_at timestamp with time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    exam_year integer,
    question_number integer
);


ALTER TABLE public.questions OWNER TO postgres;

--
-- Name: COLUMN questions.exam_year; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.questions.exam_year IS 'The year of the exam (e.g., 2024 or 38)';


--
-- Name: COLUMN questions.question_number; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.questions.question_number IS 'The question number in the exam';


--
-- Name: subscriptions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subscriptions (
    id text NOT NULL,
    user_id uuid NOT NULL,
    status text,
    price_id text,
    current_period_end timestamp with time zone,
    cancel_at_period_end boolean DEFAULT false,
    created_at timestamp with time zone DEFAULT timezone('utc'::text, now())
);


ALTER TABLE public.subscriptions OWNER TO postgres;

--
-- Name: user_answers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_answers (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    attempt_id uuid NOT NULL,
    question_id uuid NOT NULL,
    selected_option_id uuid,
    is_correct boolean,
    created_at timestamp with time zone DEFAULT timezone('utc'::text, now()) NOT NULL
);


ALTER TABLE public.user_answers OWNER TO postgres;

--
-- Name: messages; Type: TABLE; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE TABLE realtime.messages (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
)
PARTITION BY RANGE (inserted_at);


ALTER TABLE realtime.messages OWNER TO supabase_realtime_admin;

--
-- Name: schema_migrations; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.schema_migrations (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);


ALTER TABLE realtime.schema_migrations OWNER TO supabase_admin;

--
-- Name: subscription; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.subscription (
    id bigint NOT NULL,
    subscription_id uuid NOT NULL,
    entity regclass NOT NULL,
    filters realtime.user_defined_filter[] DEFAULT '{}'::realtime.user_defined_filter[] NOT NULL,
    claims jsonb NOT NULL,
    claims_role regrole GENERATED ALWAYS AS (realtime.to_regrole((claims ->> 'role'::text))) STORED NOT NULL,
    created_at timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL
);


ALTER TABLE realtime.subscription OWNER TO supabase_admin;

--
-- Name: subscription_id_seq; Type: SEQUENCE; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE realtime.subscription ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME realtime.subscription_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: buckets; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.buckets (
    id text NOT NULL,
    name text NOT NULL,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    public boolean DEFAULT false,
    avif_autodetection boolean DEFAULT false,
    file_size_limit bigint,
    allowed_mime_types text[],
    owner_id text,
    type storage.buckettype DEFAULT 'STANDARD'::storage.buckettype NOT NULL
);


ALTER TABLE storage.buckets OWNER TO supabase_storage_admin;

--
-- Name: COLUMN buckets.owner; Type: COMMENT; Schema: storage; Owner: supabase_storage_admin
--

COMMENT ON COLUMN storage.buckets.owner IS 'Field is deprecated, use owner_id instead';


--
-- Name: buckets_analytics; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.buckets_analytics (
    name text NOT NULL,
    type storage.buckettype DEFAULT 'ANALYTICS'::storage.buckettype NOT NULL,
    format text DEFAULT 'ICEBERG'::text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE storage.buckets_analytics OWNER TO supabase_storage_admin;

--
-- Name: buckets_vectors; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.buckets_vectors (
    id text NOT NULL,
    type storage.buckettype DEFAULT 'VECTOR'::storage.buckettype NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE storage.buckets_vectors OWNER TO supabase_storage_admin;

--
-- Name: migrations; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.migrations (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    hash character varying(40) NOT NULL,
    executed_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE storage.migrations OWNER TO supabase_storage_admin;

--
-- Name: objects; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.objects (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    bucket_id text,
    name text,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    last_accessed_at timestamp with time zone DEFAULT now(),
    metadata jsonb,
    path_tokens text[] GENERATED ALWAYS AS (string_to_array(name, '/'::text)) STORED,
    version text,
    owner_id text,
    user_metadata jsonb,
    level integer
);


ALTER TABLE storage.objects OWNER TO supabase_storage_admin;

--
-- Name: COLUMN objects.owner; Type: COMMENT; Schema: storage; Owner: supabase_storage_admin
--

COMMENT ON COLUMN storage.objects.owner IS 'Field is deprecated, use owner_id instead';


--
-- Name: prefixes; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.prefixes (
    bucket_id text NOT NULL,
    name text NOT NULL COLLATE pg_catalog."C",
    level integer GENERATED ALWAYS AS (storage.get_level(name)) STORED NOT NULL,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE storage.prefixes OWNER TO supabase_storage_admin;

--
-- Name: s3_multipart_uploads; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.s3_multipart_uploads (
    id text NOT NULL,
    in_progress_size bigint DEFAULT 0 NOT NULL,
    upload_signature text NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    version text NOT NULL,
    owner_id text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    user_metadata jsonb
);


ALTER TABLE storage.s3_multipart_uploads OWNER TO supabase_storage_admin;

--
-- Name: s3_multipart_uploads_parts; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.s3_multipart_uploads_parts (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    upload_id text NOT NULL,
    size bigint DEFAULT 0 NOT NULL,
    part_number integer NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    etag text NOT NULL,
    owner_id text,
    version text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE storage.s3_multipart_uploads_parts OWNER TO supabase_storage_admin;

--
-- Name: vector_indexes; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.vector_indexes (
    id text DEFAULT gen_random_uuid() NOT NULL,
    name text NOT NULL COLLATE pg_catalog."C",
    bucket_id text NOT NULL,
    data_type text NOT NULL,
    dimension integer NOT NULL,
    distance_metric text NOT NULL,
    metadata_configuration jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE storage.vector_indexes OWNER TO supabase_storage_admin;

--
-- Name: schema_migrations; Type: TABLE; Schema: supabase_migrations; Owner: postgres
--

CREATE TABLE supabase_migrations.schema_migrations (
    version text NOT NULL,
    statements text[],
    name text,
    created_by text,
    idempotency_key text,
    rollback text[]
);


ALTER TABLE supabase_migrations.schema_migrations OWNER TO postgres;

--
-- Name: refresh_tokens id; Type: DEFAULT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens ALTER COLUMN id SET DEFAULT nextval('auth.refresh_tokens_id_seq'::regclass);


--
-- Data for Name: audit_log_entries; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.audit_log_entries (instance_id, id, payload, created_at, ip_address) FROM stdin;
\.


--
-- Data for Name: flow_state; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.flow_state (id, user_id, auth_code, code_challenge_method, code_challenge, provider_type, provider_access_token, provider_refresh_token, created_at, updated_at, authentication_method, auth_code_issued_at) FROM stdin;
\.


--
-- Data for Name: identities; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id) FROM stdin;
e6f91dd5-c493-4cc1-81f0-5a385ac79ddf	e6f91dd5-c493-4cc1-81f0-5a385ac79ddf	{"sub": "e6f91dd5-c493-4cc1-81f0-5a385ac79ddf", "email": "toshitachi.0001@gmail.com", "email_verified": false, "phone_verified": false}	email	2025-12-24 05:34:03.485058+00	2025-12-24 05:34:03.485109+00	2025-12-24 05:34:03.485109+00	48fcf87f-165d-449f-9d23-7042b87c1965
e86eb131-b8c0-4545-95ae-4e471a46e0eb	e86eb131-b8c0-4545-95ae-4e471a46e0eb	{"sub": "e86eb131-b8c0-4545-95ae-4e471a46e0eb", "email": "admin@kaneiquest.com", "email_verified": false, "phone_verified": false}	email	2025-12-24 05:46:38.685174+00	2025-12-24 05:46:38.685224+00	2025-12-24 05:46:38.685224+00	e484aaf7-3027-4958-a7de-ecf11ea8b55d
aa5af9ff-5511-4b63-84e0-5fe48a4c1f6e	aa5af9ff-5511-4b63-84e0-5fe48a4c1f6e	{"sub": "aa5af9ff-5511-4b63-84e0-5fe48a4c1f6e", "email": "pro@kaneiquest.com", "email_verified": false, "phone_verified": false}	email	2025-12-24 05:46:38.982934+00	2025-12-24 05:46:38.98356+00	2025-12-24 05:46:38.98356+00	37370bfd-9e84-4ebb-9f18-6999f2f9e5f4
3b49f450-4a8e-4c42-849d-4d17f4cf18bc	3b49f450-4a8e-4c42-849d-4d17f4cf18bc	{"sub": "3b49f450-4a8e-4c42-849d-4d17f4cf18bc", "email": "free@kaneiquest.com", "email_verified": false, "phone_verified": false}	email	2025-12-24 05:46:39.276594+00	2025-12-24 05:46:39.276639+00	2025-12-24 05:46:39.276639+00	44c30ce8-d5d4-44c1-a8ac-e65d128c3ea0
\.


--
-- Data for Name: instances; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.instances (id, uuid, raw_base_config, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: mfa_amr_claims; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_amr_claims (session_id, created_at, updated_at, authentication_method, id) FROM stdin;
d65e5a82-9c37-4254-b3fe-efe32c199ad2	2025-12-24 05:46:39.288189+00	2025-12-24 05:46:39.288189+00	password	057b4f14-1ad7-4f56-8869-1d068243948e
b06418f2-f2a2-4dfb-8e88-54b28fb75560	2025-12-25 09:24:32.115492+00	2025-12-25 09:24:32.115492+00	password	e9d8a066-42c0-417a-8192-ae9d2db776d6
a80db649-7052-4cbd-991c-52aa9e228df7	2025-12-27 00:28:11.3654+00	2025-12-27 00:28:11.3654+00	password	459dee1a-2ab2-44fd-978c-28202c83cba5
48919295-34ad-4240-802e-755a25926f85	2025-12-27 00:47:07.522685+00	2025-12-27 00:47:07.522685+00	password	5500fb03-23ac-4114-aec7-b84edd57a713
e6b63d93-c625-4704-b6f1-3d7bca2afa13	2026-01-01 06:25:21.049861+00	2026-01-01 06:25:21.049861+00	password	b05799a5-1802-453d-8c6d-9d7c526b0b0d
aec6846b-f75e-4704-8416-e24582d15d6d	2026-01-01 06:25:36.169975+00	2026-01-01 06:25:36.169975+00	password	4151095f-bf0f-4661-9ef8-dcddbcc44d43
\.


--
-- Data for Name: mfa_challenges; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_challenges (id, factor_id, created_at, verified_at, ip_address, otp_code, web_authn_session_data) FROM stdin;
\.


--
-- Data for Name: mfa_factors; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_factors (id, user_id, friendly_name, factor_type, status, created_at, updated_at, secret, phone, last_challenged_at, web_authn_credential, web_authn_aaguid, last_webauthn_challenge_data) FROM stdin;
\.


--
-- Data for Name: oauth_authorizations; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.oauth_authorizations (id, authorization_id, client_id, user_id, redirect_uri, scope, state, resource, code_challenge, code_challenge_method, response_type, status, authorization_code, created_at, expires_at, approved_at, nonce) FROM stdin;
\.


--
-- Data for Name: oauth_client_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.oauth_client_states (id, provider_type, code_verifier, created_at) FROM stdin;
\.


--
-- Data for Name: oauth_clients; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.oauth_clients (id, client_secret_hash, registration_type, redirect_uris, grant_types, client_name, client_uri, logo_uri, created_at, updated_at, deleted_at, client_type) FROM stdin;
\.


--
-- Data for Name: oauth_consents; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.oauth_consents (id, user_id, client_id, scopes, granted_at, revoked_at) FROM stdin;
\.


--
-- Data for Name: one_time_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.one_time_tokens (id, user_id, token_type, token_hash, relates_to, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.refresh_tokens (instance_id, id, token, user_id, revoked, created_at, updated_at, parent, session_id) FROM stdin;
00000000-0000-0000-0000-000000000000	5	ipnzdjqnnvqr	3b49f450-4a8e-4c42-849d-4d17f4cf18bc	f	2025-12-24 05:46:39.286966+00	2025-12-24 05:46:39.286966+00	\N	d65e5a82-9c37-4254-b3fe-efe32c199ad2
00000000-0000-0000-0000-000000000000	17	7osiuu3bd3ew	e86eb131-b8c0-4545-95ae-4e471a46e0eb	f	2025-12-25 09:24:32.114267+00	2025-12-25 09:24:32.114267+00	\N	b06418f2-f2a2-4dfb-8e88-54b28fb75560
00000000-0000-0000-0000-000000000000	32	rhfyz5qnzlhj	e6f91dd5-c493-4cc1-81f0-5a385ac79ddf	f	2025-12-27 00:47:07.5069+00	2025-12-27 00:47:07.5069+00	\N	48919295-34ad-4240-802e-755a25926f85
00000000-0000-0000-0000-000000000000	31	fdgkbu7flih5	e6f91dd5-c493-4cc1-81f0-5a385ac79ddf	t	2025-12-27 00:28:11.36366+00	2025-12-27 01:26:32.491915+00	\N	a80db649-7052-4cbd-991c-52aa9e228df7
00000000-0000-0000-0000-000000000000	33	v7vcigcwrf4n	e6f91dd5-c493-4cc1-81f0-5a385ac79ddf	t	2025-12-27 01:26:32.531458+00	2025-12-27 02:24:51.523652+00	fdgkbu7flih5	a80db649-7052-4cbd-991c-52aa9e228df7
00000000-0000-0000-0000-000000000000	34	vmh3iofg453m	e6f91dd5-c493-4cc1-81f0-5a385ac79ddf	t	2025-12-27 02:24:51.5576+00	2025-12-27 03:22:52.528688+00	v7vcigcwrf4n	a80db649-7052-4cbd-991c-52aa9e228df7
00000000-0000-0000-0000-000000000000	35	3wkxble4pwso	e6f91dd5-c493-4cc1-81f0-5a385ac79ddf	f	2025-12-27 03:22:52.573549+00	2025-12-27 03:22:52.573549+00	vmh3iofg453m	a80db649-7052-4cbd-991c-52aa9e228df7
00000000-0000-0000-0000-000000000000	36	cm2v75of56fx	e6f91dd5-c493-4cc1-81f0-5a385ac79ddf	f	2026-01-01 06:25:21.000698+00	2026-01-01 06:25:21.000698+00	\N	e6b63d93-c625-4704-b6f1-3d7bca2afa13
00000000-0000-0000-0000-000000000000	37	dx6idmycp52r	e6f91dd5-c493-4cc1-81f0-5a385ac79ddf	f	2026-01-01 06:25:36.167984+00	2026-01-01 06:25:36.167984+00	\N	aec6846b-f75e-4704-8416-e24582d15d6d
\.


--
-- Data for Name: saml_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.saml_providers (id, sso_provider_id, entity_id, metadata_xml, metadata_url, attribute_mapping, created_at, updated_at, name_id_format) FROM stdin;
\.


--
-- Data for Name: saml_relay_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.saml_relay_states (id, sso_provider_id, request_id, for_email, redirect_to, created_at, updated_at, flow_state_id) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.schema_migrations (version) FROM stdin;
20171026211738
20171026211808
20171026211834
20180103212743
20180108183307
20180119214651
20180125194653
00
20210710035447
20210722035447
20210730183235
20210909172000
20210927181326
20211122151130
20211124214934
20211202183645
20220114185221
20220114185340
20220224000811
20220323170000
20220429102000
20220531120530
20220614074223
20220811173540
20221003041349
20221003041400
20221011041400
20221020193600
20221021073300
20221021082433
20221027105023
20221114143122
20221114143410
20221125140132
20221208132122
20221215195500
20221215195800
20221215195900
20230116124310
20230116124412
20230131181311
20230322519590
20230402418590
20230411005111
20230508135423
20230523124323
20230818113222
20230914180801
20231027141322
20231114161723
20231117164230
20240115144230
20240214120130
20240306115329
20240314092811
20240427152123
20240612123726
20240729123726
20240802193726
20240806073726
20241009103726
20250717082212
20250731150234
20250804100000
20250901200500
20250903112500
20250904133000
20250925093508
20251007112900
20251104100000
20251111201300
20251201000000
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sessions (id, user_id, created_at, updated_at, factor_id, aal, not_after, refreshed_at, user_agent, ip, tag, oauth_client_id, refresh_token_hmac_key, refresh_token_counter, scopes) FROM stdin;
d65e5a82-9c37-4254-b3fe-efe32c199ad2	3b49f450-4a8e-4c42-849d-4d17f4cf18bc	2025-12-24 05:46:39.284265+00	2025-12-24 05:46:39.284265+00	\N	aal1	\N	\N	node	221.113.123.247	\N	\N	\N	\N	\N
b06418f2-f2a2-4dfb-8e88-54b28fb75560	e86eb131-b8c0-4545-95ae-4e471a46e0eb	2025-12-25 09:24:32.11277+00	2025-12-25 09:24:32.11277+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:146.0) Gecko/20100101 Firefox/146.0	153.240.136.128	\N	\N	\N	\N	\N
48919295-34ad-4240-802e-755a25926f85	e6f91dd5-c493-4cc1-81f0-5a385ac79ddf	2025-12-27 00:47:07.489787+00	2025-12-27 00:47:07.489787+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:146.0) Gecko/20100101 Firefox/146.0	133.32.216.96	\N	\N	\N	\N	\N
a80db649-7052-4cbd-991c-52aa9e228df7	e6f91dd5-c493-4cc1-81f0-5a385ac79ddf	2025-12-27 00:28:11.361589+00	2025-12-27 03:22:52.626747+00	\N	aal1	\N	2025-12-27 03:22:52.62664	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:146.0) Gecko/20100101 Firefox/146.0	133.32.216.96	\N	\N	\N	\N	\N
e6b63d93-c625-4704-b6f1-3d7bca2afa13	e6f91dd5-c493-4cc1-81f0-5a385ac79ddf	2026-01-01 06:25:20.951417+00	2026-01-01 06:25:20.951417+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:146.0) Gecko/20100101 Firefox/146.0	153.240.136.128	\N	\N	\N	\N	\N
aec6846b-f75e-4704-8416-e24582d15d6d	e6f91dd5-c493-4cc1-81f0-5a385ac79ddf	2026-01-01 06:25:36.166237+00	2026-01-01 06:25:36.166237+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:146.0) Gecko/20100101 Firefox/146.0	153.240.136.128	\N	\N	\N	\N	\N
\.


--
-- Data for Name: sso_domains; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sso_domains (id, sso_provider_id, domain, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: sso_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sso_providers (id, resource_id, created_at, updated_at, disabled) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, invited_at, confirmation_token, confirmation_sent_at, recovery_token, recovery_sent_at, email_change_token_new, email_change, email_change_sent_at, last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at, phone, phone_confirmed_at, phone_change, phone_change_token, phone_change_sent_at, email_change_token_current, email_change_confirm_status, banned_until, reauthentication_token, reauthentication_sent_at, is_sso_user, deleted_at, is_anonymous) FROM stdin;
00000000-0000-0000-0000-000000000000	e6f91dd5-c493-4cc1-81f0-5a385ac79ddf	authenticated	authenticated	toshitachi.0001@gmail.com	$2a$10$Ro1kbWxI1ULWLP10meJEcebmUgZvuFsw4.AR2G19MPsSLoGuElvVa	2025-12-24 05:34:03.488484+00	\N		\N		\N			\N	2026-01-01 06:25:36.166126+00	{"provider": "email", "providers": ["email"]}	{"sub": "e6f91dd5-c493-4cc1-81f0-5a385ac79ddf", "email": "toshitachi.0001@gmail.com", "email_verified": true, "phone_verified": false}	\N	2025-12-24 05:34:03.463991+00	2026-01-01 06:25:36.169608+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	aa5af9ff-5511-4b63-84e0-5fe48a4c1f6e	authenticated	authenticated	pro@kaneiquest.com	$2a$10$OVgVqpP/WVqyRA3CTP1GZeXrEUlPSezV0ZfUBs2sr6clcAzHxg4ia	2025-12-24 05:46:38.986308+00	\N		\N		\N			\N	2025-12-26 14:36:42.090686+00	{"provider": "email", "providers": ["email"]}	{"sub": "aa5af9ff-5511-4b63-84e0-5fe48a4c1f6e", "email": "pro@kaneiquest.com", "email_verified": true, "phone_verified": false}	\N	2025-12-24 05:46:38.977441+00	2025-12-26 22:21:25.612432+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	e86eb131-b8c0-4545-95ae-4e471a46e0eb	authenticated	authenticated	admin@kaneiquest.com	$2a$10$CKOPyhUyqFvvukpmj8zXW.gobmA/trMGAWGNM7rQ/T5l9WiZ55SJu	2025-12-24 05:46:38.688405+00	\N		\N		\N			\N	2025-12-25 09:24:32.112668+00	{"provider": "email", "providers": ["email"]}	{"sub": "e86eb131-b8c0-4545-95ae-4e471a46e0eb", "email": "admin@kaneiquest.com", "email_verified": true, "phone_verified": false}	\N	2025-12-24 05:46:38.665988+00	2025-12-25 09:24:32.115187+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	3b49f450-4a8e-4c42-849d-4d17f4cf18bc	authenticated	authenticated	free@kaneiquest.com	$2a$10$YOWhY1WkD76EBhI0kGPN3eGNkCiR/fafSSef6tSIrYp6Lau6caN1q	2025-12-24 05:46:39.281042+00	\N		\N		\N			\N	2025-12-24 05:46:39.284183+00	{"provider": "email", "providers": ["email"]}	{"sub": "3b49f450-4a8e-4c42-849d-4d17f4cf18bc", "email": "free@kaneiquest.com", "email_verified": true, "phone_verified": false}	\N	2025-12-24 05:46:39.272817+00	2025-12-24 05:46:39.287894+00	\N	\N			\N		0	\N		\N	f	\N	f
\.


--
-- Data for Name: app_settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_settings (key, value, description, updated_at, updated_by) FROM stdin;
maintenance_mode	false	System-wide maintenance mode	2025-12-24 06:12:41.794655+00	\N
announcement	{"active": true, "message": "ただいまメンテナンス"}	Global announcement banner	2025-12-24 06:12:41.794655+00	\N
\.


--
-- Data for Name: bookmarks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bookmarks (id, user_id, question_id, created_at) FROM stdin;
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (id, name, description, image_url, slug, "order", created_at) FROM stdin;
09bec7da-f775-4c39-af84-db223f99e8d9	人体の構造と機能	解剖生理学や生化学など、人体の基礎的な構造と機能に関する分野	\N	structure-and-function	1	2025-12-24 05:39:10.385653+00
6474ce53-0e9c-4dea-a9fd-f5f7caeeb3ea	臨床栄養学	傷病者の栄養管理、栄養食事療法に関する分野	\N	clinical-nutrition	2	2025-12-24 05:39:10.385653+00
e421604c-b58f-4a5b-a8cc-5c1d81d878d4	食品学	食品の成分、物性、加工、保存に関する分野	\N	food-science	3	2025-12-24 05:39:10.385653+00
f4ca171f-01a2-4e89-b873-3f888857f082	公衆栄養学	地域や集団を対象とした栄養活動に関する分野	\N	public-health-nutrition	4	2025-12-24 05:39:10.385653+00
2a4257c6-2021-4dea-84e4-490609c4751c	給食経営管理論	特定多数人に食事を提供する施設の管理・運営に関する分野	\N	food-service-management	5	2025-12-24 05:39:10.385653+00
f8c8d2ad-31c1-453e-8b00-a3c300bbea26	社会・環境と健康	\N	\N	social-environmental-health	0	2025-12-25 06:59:57.759407+00
0f2a5d89-8bf9-4084-a143-d19bd5ed5a42	基礎栄養学	\N	\N	basic-nutrition	0	2025-12-25 06:59:57.759407+00
36a6b088-bd68-4ced-81ba-c7e26915021e	応用栄養学	\N	\N	applied-nutrition	0	2025-12-25 06:59:57.759407+00
269bf20c-94cd-499f-ae93-db36bbfd2aa6	栄養教育論	\N	\N	nutrition-education	0	2025-12-25 06:59:57.759407+00
0d3d707c-079c-4b81-aee7-0da4fffe5507	応用力試験	\N	\N	applied-exam	0	2025-12-25 06:59:57.759407+00
\.


--
-- Data for Name: exam_attempts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.exam_attempts (id, user_id, started_at, completed_at, score, total_questions, is_completed, category_id, exam_year, mode, time_remaining) FROM stdin;
40a2b1d9-d99f-4281-84db-54ac4441b96b	aa5af9ff-5511-4b63-84e0-5fe48a4c1f6e	2025-12-25 09:16:04.230007+00	\N	0	20	f	\N	39	practice	\N
dbc9dc7c-74ad-418b-b0cc-7cd729d51c68	aa5af9ff-5511-4b63-84e0-5fe48a4c1f6e	2025-12-25 09:16:04.23001+00	\N	0	20	f	\N	39	practice	\N
12fbb303-e7d5-414d-9545-cef0f3fa097c	aa5af9ff-5511-4b63-84e0-5fe48a4c1f6e	2025-12-25 09:17:01.074492+00	\N	0	20	f	\N	39	practice	\N
6358f127-6a2d-4223-a3e3-e233f9e932ff	aa5af9ff-5511-4b63-84e0-5fe48a4c1f6e	2025-12-25 09:17:01.075751+00	2025-12-25 09:18:27.526+00	6	20	t	\N	39	practice	\N
e6c1117d-904e-44a4-b121-c4f8ebd3a8f4	aa5af9ff-5511-4b63-84e0-5fe48a4c1f6e	2025-12-25 09:18:53.768149+00	\N	0	20	f	\N	39	practice	\N
f40c6269-2f1b-4020-aa8e-3a6ad2538e1e	aa5af9ff-5511-4b63-84e0-5fe48a4c1f6e	2025-12-25 09:18:53.77195+00	\N	0	20	f	\N	39	practice	\N
98391a30-5968-483d-a3ea-bfe20e8f155e	aa5af9ff-5511-4b63-84e0-5fe48a4c1f6e	2025-12-25 09:24:25.320591+00	\N	0	20	f	\N	39	practice	\N
6764db81-0c3a-4163-baae-1102f5dc9a69	aa5af9ff-5511-4b63-84e0-5fe48a4c1f6e	2025-12-25 09:24:25.328359+00	\N	0	20	f	\N	39	practice	\N
bd0daff4-36d5-4df7-b1ba-7172b87cad43	aa5af9ff-5511-4b63-84e0-5fe48a4c1f6e	2025-12-26 14:50:23.900797+00	\N	0	10	f	e421604c-b58f-4a5b-a8cc-5c1d81d878d4	\N	practice	\N
cb5eee34-5c28-4233-82d1-9a9bab5228c8	aa5af9ff-5511-4b63-84e0-5fe48a4c1f6e	2025-12-26 14:50:23.90061+00	\N	0	10	f	e421604c-b58f-4a5b-a8cc-5c1d81d878d4	\N	practice	\N
9040eb04-3c89-4c1b-9483-2d43c9117450	e6f91dd5-c493-4cc1-81f0-5a385ac79ddf	2025-12-27 01:46:44.806147+00	\N	0	10	f	f8c8d2ad-31c1-453e-8b00-a3c300bbea26	\N	practice	\N
8a3b17cd-8741-4de7-844a-c6ae57214927	e6f91dd5-c493-4cc1-81f0-5a385ac79ddf	2025-12-27 01:46:44.806148+00	\N	0	10	f	f8c8d2ad-31c1-453e-8b00-a3c300bbea26	\N	practice	\N
b96d9f71-66e3-440f-bedb-ac323eda5a3d	e6f91dd5-c493-4cc1-81f0-5a385ac79ddf	2025-12-27 01:48:47.176437+00	\N	0	10	f	\N	\N	practice	\N
69d30f8e-7f67-4cb8-a1fc-b9578041869c	e6f91dd5-c493-4cc1-81f0-5a385ac79ddf	2025-12-27 01:48:47.181319+00	2025-12-27 01:49:22.931+00	4	10	t	\N	\N	practice	\N
65fe7c2b-0e8d-4ed2-9be1-5022984f5013	e6f91dd5-c493-4cc1-81f0-5a385ac79ddf	2026-01-01 06:26:23.85201+00	\N	0	80	f	\N	39	practice	\N
cf5375d0-0cb1-41a5-a167-733d06b9630f	e6f91dd5-c493-4cc1-81f0-5a385ac79ddf	2026-01-01 06:26:23.850358+00	\N	0	80	f	\N	39	practice	\N
\.


--
-- Data for Name: heart_logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.heart_logs (id, sender_id, receiver_id, created_at) FROM stdin;
\.


--
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.notifications (id, user_id, title, message, type, is_read, created_at) FROM stdin;
43e3c729-4798-4abb-b653-df5baca565a6	3b49f450-4a8e-4c42-849d-4d17f4cf18bc	アップデートのお知らせ	通知機能が実装されました！これからはここにお知らせが届きます。	info	f	2025-12-26 14:54:31.552046+00
\.


--
-- Data for Name: options; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.options (id, question_id, content, is_correct, "order") FROM stdin;
6b3a55df-ccd1-4fa2-9014-987f59ccc6ef	54260d54-7b68-4a2c-a3e9-d8abeb9b7cee	一次予防は、発症前期において行われる。	f	1
88a2d46c-7fe9-4472-ad23-65c643d1ebe8	54260d54-7b68-4a2c-a3e9-d8abeb9b7cee	一次予防の例に、がん患者への就労支援がある。	f	2
db15cff2-2af1-471b-9e98-236c8baff819	54260d54-7b68-4a2c-a3e9-d8abeb9b7cee	二次予防は、感受性期において行われる。	f	3
5a36826f-a0d3-412d-a2a8-66c19f749b25	54260d54-7b68-4a2c-a3e9-d8abeb9b7cee	二次予防の例に、予防接種がある。	f	4
d67a80a2-3dba-4639-bbb6-0167109c10fc	54260d54-7b68-4a2c-a3e9-d8abeb9b7cee	三次予防の例に、腎不全患者への人工透析がある。	t	5
6e22999b-37c9-4533-b367-b2185fc493fa	c1d0c438-5860-4b23-997e-c8bbc999bcff	0. 010	f	1
5489d281-3b99-429b-b7e9-71089948575b	c1d0c438-5860-4b23-997e-c8bbc999bcff	0. 020	f	2
79ea4bb5-5ab1-4f97-83f0-0b9dab9b548a	c1d0c438-5860-4b23-997e-c8bbc999bcff	0. 050	f	3
138ebaa9-b8f8-4522-a240-d72f0fe0ce85	c1d0c438-5860-4b23-997e-c8bbc999bcff	0. 100	f	4
8042749c-e8f8-41ed-b94e-5d70a4c90e72	c1d0c438-5860-4b23-997e-c8bbc999bcff	0. 200	t	5
d576d2f7-06d5-4abc-8392-0aa7e9f8e178	da3d8592-0748-4c4e-b063-89c0a157d232	３年に1回実施されている。	f	1
2294dd9c-8f96-4e47-adc9-f2e0bc774b8f	da3d8592-0748-4c4e-b063-89c0a157d232	調査対象は、層化無作為抽出法により選定する。	f	2
23dba9c2-4118-4510-9d76-a837db416115	da3d8592-0748-4c4e-b063-89c0a157d232	調査対象は、日本国内に普段住んでいる外国人を含まない。	f	3
688cb79a-5b91-4397-8d79-341fd9b7b947	da3d8592-0748-4c4e-b063-89c0a157d232	調査項目は、「医療機関への受診の状況」を含む。	f	4
04e71f95-531a-4f5f-a6f8-ce0cef9739fd	da3d8592-0748-4c4e-b063-89c0a157d232	調査結果をもとに、将来人口推計を行う。 1	t	5
38f66a8e-c348-40fd-8e6c-00601246752b	647bda88-c6a1-4fb5-969e-a276bde8e9be	A 地域の老年人口割合は、B 地域よりも高い。	f	1
c010b5a8-55f2-48ff-a91c-1a2dbaa9f626	647bda88-c6a1-4fb5-969e-a276bde8e9be	A 地域の粗死亡率は、B 地域よりも高い。	f	2
02d79d88-2c6b-454e-951d-564f45277a30	647bda88-c6a1-4fb5-969e-a276bde8e9be	A 地域の死亡数は、期待死亡数と同じである。	f	3
16f9cdbc-0e07-4a4a-933e-5b541f53a63d	647bda88-c6a1-4fb5-969e-a276bde8e9be	A 地域の期待死亡数は、B 地域の期待死亡数よりも多い。	f	4
ac674fb4-c8a3-410d-9358-f7e19462213f	647bda88-c6a1-4fb5-969e-a276bde8e9be	A 地域の標準化死亡比は、B 地域の標準化死亡比よりも高い。 表 A地域およびB地域の年齢階級別人口、基準集団の年齢階級別死亡率 年齢階級 A 地域 人口（人） B 地域 人口（人） 基準集団 死亡率（人口1万対） 0～14 歳240,00090,0002 15～64 歳900,000500,00020 合計1,440,000990,000 2	t	5
0aa61235-2695-4491-8678-1c34d7431df3	c0d7aafa-fd93-4ec9-bed1-4fa71fa07107	敏感度	f	1
06e9cb60-7b11-480f-ab01-70c8853d33f5	c0d7aafa-fd93-4ec9-bed1-4fa71fa07107	特異度	f	2
36d1e0b7-a2d1-4efd-9daa-5ab9654b7d63	c0d7aafa-fd93-4ec9-bed1-4fa71fa07107	偽陽性率	f	3
245fd420-dab6-45ba-b729-71a0a3ef5d42	c0d7aafa-fd93-4ec9-bed1-4fa71fa07107	陽性反応的中度	t	4
a2f7eee4-55aa-4ee2-b721-ebf9b7fd965b	c0d7aafa-fd93-4ec9-bed1-4fa71fa07107	陰性反応的中度 表 集団Aと集団Bのスクリーニング結果と疾病状況 スクリーニング試験 集団 A集団 B 疾病あり（人）疾病なし（人）疾病あり（人）疾病なし（人） 陽性255025050 陰性545050450	f	5
c70a9023-0b7c-4bb0-bf1b-6aca21f44176	eff68343-e98e-4b63-b1d6-d3ac0fc8e936	研究計画書の研究倫理審査は、この食品会社の役員会議で行われる。	f	1
21897f25-6513-46e3-80a2-2bcf3185503a	eff68343-e98e-4b63-b1d6-d3ac0fc8e936	委託先の大学の研究者は、研究対象者に研究内容を説明し研究参加の同意を 得る。	t	2
bfd6c208-0628-49e6-ac4b-3142b53ffdab	eff68343-e98e-4b63-b1d6-d3ac0fc8e936	研究計画は、販売しようとする食品の利潤最大化を最優先に作成する。	f	3
8056b80b-9f10-4cf5-b817-fdece3a8df6d	eff68343-e98e-4b63-b1d6-d3ac0fc8e936	この委託研究に従事しない食品会社の社員は、研究の利益相反を開示する。	f	4
31377604-db93-4899-bf7f-6271a9c8905a	eff68343-e98e-4b63-b1d6-d3ac0fc8e936	委託先の大学の研究者は、売り上げ状況のモニタリング調査を行う。 3	f	5
67ba87e5-a74e-444b-a177-4ac139d6f24c	c16f2e85-e3fc-439f-b594-258b9e0860a2	健康日本 21（第二次）の最終評価において、「運動習慣者の割合の増加」は「目 標値に達した」と評価された。	f	1
007e5385-84d0-4cd3-93c7-01bc1719317e	c16f2e85-e3fc-439f-b594-258b9e0860a2	健康日本 21（第二次）の最終評価において、「生活習慣病のリスクを高める量 を飲酒している者の割合の減少」は「目標値に達した」と評価された。	f	2
58b96deb-b7b1-4a54-a220-be5ccbda1e07	c16f2e85-e3fc-439f-b594-258b9e0860a2	健康日本 21（第三次）では、休養・睡眠に関する指標として、具体的な睡眠 時間は設定されていない。	f	3
f6ad9592-8986-4819-a941-232fa99f7650	c16f2e85-e3fc-439f-b594-258b9e0860a2	健康づくりのための睡眠ガイド 2023 では、高齢者の床上時間は8時間以上 にならないことが目安とされている。	t	4
27ffad9e-5ca9-4f10-ada6-d6d7f039b263	c16f2e85-e3fc-439f-b594-258b9e0860a2	ブリンクマン指数は、「1日の喫煙本数」に「喫煙開始年齢」を乗じた値であ る。	f	5
eb6cfe5f-7efc-4a22-97ed-cdb143f6a4bc	527aefbf-aa0f-44c9-9e91-ba8fa023f26f	対象者を 18 歳未満、18～64 歳、65 歳以上で区切って、推奨事項が示されて いる。	f	1
c02e7894-e4ec-4cc6-939a-27960caddac5	527aefbf-aa0f-44c9-9e91-ba8fa023f26f	「座位行動」という概念が取り入れられた。	t	2
dfec47f0-7df6-4644-8ed0-6f519370b3a0	527aefbf-aa0f-44c9-9e91-ba8fa023f26f	「高齢者」の運動として、筋力トレーニングは推奨されていない。	f	3
c8e55db0-6fa3-4a4d-a08e-67071317ee20	527aefbf-aa0f-44c9-9e91-ba8fa023f26f	「高齢者」の身体活動として、強度は問わず、1日 40 分以上行うことが推奨 されている。	f	4
82692e83-6ff1-458f-8988-7eed24437834	527aefbf-aa0f-44c9-9e91-ba8fa023f26f	「身体を動かす時間が少ないこども」において推奨されている身体活動の強度 は、5メッツ以上である。 4	f	5
a31b2a61-f72f-4940-8d9e-6feaacff5757	6ee2c855-b424-4c5a-9052-b7421d1da018	フッ化物の歯面塗布の主な目的は、歯周病の予防である。	f	1
330b282c-8859-4e28-86f9-1999af90f15d	6ee2c855-b424-4c5a-9052-b7421d1da018	シーラントの主な目的は、歯周病の予防である。	f	2
cd12670b-5c53-4c7f-ba41-76bbed552358	6ee2c855-b424-4c5a-9052-b7421d1da018	糖尿病は、歯周病のリスク因子である。	t	3
8d4591ec-9d54-40e3-87ac-310072c476a9	6ee2c855-b424-4c5a-9052-b7421d1da018	直近5年間の学校保健統計調査によると、小学生におけるむし歯（う歯）の被 患率は、増加傾向である。	f	4
eef7089e-0af9-4208-94af-d3f683e6a6a9	6ee2c855-b424-4c5a-9052-b7421d1da018	直近5年間の学校保健統計調査によると、中学生における被患率が最も高い のは、むし歯（う歯）である。	f	5
8437445c-a2f3-4f7e-bcb6-b5ca6d3513da	1db20b72-881f-43f0-911a-a6493077e5d3	胃がん検診の対象年齢は、60 歳以上である。	f	1
461a8c11-163e-4b9a-bae7-8b33b7617c4c	1db20b72-881f-43f0-911a-a6493077e5d3	子宮頸がん検診の対象年齢は、40 歳以上である。	f	2
676ab92e-f002-4226-8f00-7b48df174774	1db20b72-881f-43f0-911a-a6493077e5d3	乳がん検診の検査方法として、触診が推奨されている。	f	3
d7582039-3b1e-4f71-b808-b287243958e9	1db20b72-881f-43f0-911a-a6493077e5d3	大腸がん検診の検査方法として、内視鏡検査が推奨されている。	f	4
e0575dee-b49f-4554-bcd0-d429cf68531a	1db20b72-881f-43f0-911a-a6493077e5d3	肺がん検診の受診間隔は、1年に1回が推奨されている。	t	5
ee312173-0a51-49f1-91bc-c3a738cdf2e3	a0da28aa-d5bd-4c05-bc6a-5a8f875a73f3	麻疹	f	1
b020f2be-db87-4c3f-a90f-f1c6c7b750c8	a0da28aa-d5bd-4c05-bc6a-5a8f875a73f3	風疹	f	2
6eb68a04-b1e2-45d2-aa19-b7d0b169a116	a0da28aa-d5bd-4c05-bc6a-5a8f875a73f3	ポリオ（急性灰白髄炎）	f	3
949667a1-fa63-4f0a-b473-4c0b46abea44	a0da28aa-d5bd-4c05-bc6a-5a8f875a73f3	マラリア	t	4
4af703db-6c0b-4434-8c75-5a4a0e261b5b	a0da28aa-d5bd-4c05-bc6a-5a8f875a73f3	B 型肝炎 5	f	5
c82a5775-56c4-4475-af26-e5bd24c3867a	ed9dca4f-debf-444a-b798-b9e907a23eb0	発病の機構が明らかでない。	f	1
e56d7178-bd0f-4428-8f30-57d235f67c8a	ed9dca4f-debf-444a-b798-b9e907a23eb0	治療方法が確立していない。	f	2
7624cb2e-9806-4e3d-a515-bd61403a7268	ed9dca4f-debf-444a-b798-b9e907a23eb0	希少な疾病である。	f	3
905e09e1-9ee2-42b8-b047-c00797662ec3	ed9dca4f-debf-444a-b798-b9e907a23eb0	致命率が高い。	t	4
08749d14-b08b-4ac9-aef0-67c918a9f20d	ed9dca4f-debf-444a-b798-b9e907a23eb0	長期にわたり療養を必要とする。	f	5
fe0b07af-d4a6-4bfa-b340-4b53bd9eeabb	738d6595-8e7c-43b7-83ac-74966451bbfc	社会保険	f	1
95dd94ca-33c0-4986-ad23-508c443c57c7	738d6595-8e7c-43b7-83ac-74966451bbfc	恩給	f	2
de3d3645-349e-44c4-8ac1-fa53c3effd3a	738d6595-8e7c-43b7-83ac-74966451bbfc	公的扶助	t	3
0a0f0852-b2b6-4daf-97fa-34f64466f625	738d6595-8e7c-43b7-83ac-74966451bbfc	保健医療・公衆衛生	f	4
3c1c739a-e557-4c88-a55e-39b063bde60a	738d6595-8e7c-43b7-83ac-74966451bbfc	社会福祉	f	5
45811dc4-2f9a-4e1d-a918-55f499f429f4	5db3c62a-3baa-40a1-8320-7e91a680fa24	市町村は、設置しなければならない。	f	1
5556461b-8a32-42cd-8ec7-df188618ff64	5db3c62a-3baa-40a1-8320-7e91a680fa24	センター長は、原則として医師でなければならない。	f	2
b3da9e1c-35f1-4085-bf35-30353a579c7b	5db3c62a-3baa-40a1-8320-7e91a680fa24	食品衛生の監視を行う。	f	3
6347992b-d734-4adc-85cc-d9ea44383c5d	5db3c62a-3baa-40a1-8320-7e91a680fa24	住民の健康相談を担う。	t	4
e7b364af-7264-4ea3-a2bc-e3b71687bc62	5db3c62a-3baa-40a1-8320-7e91a680fa24	地域における健康危機管理の拠点となる。 6	f	5
d9914da1-b599-428a-8b17-929cf5c7cff0	9c0e9b3b-a83e-454a-a8ca-f0b0e1f7cee8	根拠法は、健康増進法である。	f	1
12b67b49-c367-4305-ace2-22bc04419236	9c0e9b3b-a83e-454a-a8ca-f0b0e1f7cee8	75 歳以上の被保険者は、対象とならない。	t	2
c8c8d970-c46c-439c-9ad3-09b1e65760bd	9c0e9b3b-a83e-454a-a8ca-f0b0e1f7cee8	保険者は、降圧薬を服薬中の者を、特定保健指導の対象としなければならな い。	f	3
47238218-1383-4227-907b-c3e4022d5125	9c0e9b3b-a83e-454a-a8ca-f0b0e1f7cee8	採血は、空腹時に限定されている。	f	4
6160555f-6ddf-4f7f-a6d3-edb60db264c3	9c0e9b3b-a83e-454a-a8ca-f0b0e1f7cee8	腹囲が 90 cm で喫煙習慣がある 50 歳男性の場合、1つの追加リスクがある と動機付け支援の対象となる。	f	5
f91260f6-737d-4f01-be69-6fac1cbb2a17	83345644-10be-4680-a7ea-b9a9001cb528	直近の国民生活基礎調査（大規模調査年）によると、要介護者となった原因と して最も多いのは、年齢にかかわらず脳卒中である。	f	1
8f12d173-94ce-461d-974e-3316888205cf	83345644-10be-4680-a7ea-b9a9001cb528	介護保険制度における保険給付の財源は、全額が被保険者から徴収した保険 料である。	f	2
91f09e10-d624-4daa-9c7e-96ae4dcec7b7	83345644-10be-4680-a7ea-b9a9001cb528	介護保険制度における予防給付サービスは、要介護者が対象である。	f	3
e2810e4d-9333-4d88-b9b0-d00250123d06	83345644-10be-4680-a7ea-b9a9001cb528	介護老人保健施設では、医学的管理は行われない。	f	4
fbfb5f15-9023-45de-a089-c9d8fb4c7685	83345644-10be-4680-a7ea-b9a9001cb528	地域包括支援センターの業務には、権利擁護に関する業務が含まれている。	t	5
13ab1136-9411-4f1d-b29a-e79e70ef0b2c	09868cfe-c3dd-4130-8f95-4abccc183334	血小板には、核が存在する。	f	1
5415da14-480e-4930-aabf-7a3930c885a8	09868cfe-c3dd-4130-8f95-4abccc183334	細胞外のナトリウムイオン濃度は、細胞内より低い。	f	2
46f17a1e-a320-4801-8173-e7cc86ee228d	09868cfe-c3dd-4130-8f95-4abccc183334	全ての細胞は、1つの受精卵から発生する。	t	3
b41290f0-4089-49c3-b2c9-ea889711e679	09868cfe-c3dd-4130-8f95-4abccc183334	細胞周期の S 期では、染色体が形成される。	f	4
89a24bcb-e982-41ff-8731-65b6c661a8d0	09868cfe-c3dd-4130-8f95-4abccc183334	マクロファージは、リンパ球から分化する。 7	f	5
beb73bab-b671-42ae-bccc-d1085fbd78fd	3623d8f1-fc81-4dc7-af6e-23385e7579c2	アミノ酸は、両性化合物である。	t	1
d8c4bc47-e0aa-4285-ae4e-7f9406ac781f	3623d8f1-fc81-4dc7-af6e-23385e7579c2	たんぱく質の二次構造は、ジスルフィド結合により形成される。	f	2
98c2dd12-e995-499b-be27-2a49d930fd97	3623d8f1-fc81-4dc7-af6e-23385e7579c2	たんぱく質は、プロテアソームにより折りたたまれる。	f	3
e246f8e3-888e-415a-a8a5-0f64ee9e470e	3623d8f1-fc81-4dc7-af6e-23385e7579c2	フルクトースは、アルデヒド基をもつ。	f	4
8a295952-7e39-48e2-8203-ee11f9657dd9	3623d8f1-fc81-4dc7-af6e-23385e7579c2	でんぷんは、β ─ 1,4 グリコシド結合をもつ。	f	5
4f19e38b-dddf-4f13-a5db-3b7c96e7c0a4	203ce4e0-53b0-4375-a37d-062cc521296a	AMP は、分子内に高エネルギー結合をもつ。	f	1
f009adab-2680-47e0-8fff-bbac95fc0fe1	203ce4e0-53b0-4375-a37d-062cc521296a	ホスホエノールピルビン酸は、高エネルギー化合物である。	t	2
e01f12da-7442-4199-9989-8eba05c20ae8	203ce4e0-53b0-4375-a37d-062cc521296a	電子伝達系は、ミトコンドリアの外膜にある。	f	3
d03a88da-494c-4b4e-9d27-10b933516dec	203ce4e0-53b0-4375-a37d-062cc521296a	電子伝達系の電子受容体は、窒素分子である。	f	4
ca95f643-d528-4d9d-8652-aff135cf5764	203ce4e0-53b0-4375-a37d-062cc521296a	脱共役たんぱく質（UCP）による熱産生は、ATP の合成を伴う。	f	5
9c6ac0c7-59b3-435a-a60f-7177be7191f6	14dbf186-0887-4b9f-a4a6-855f693ac19f	ビタミン B 1 は、アミノ基転移反応の補酵素である。	f	1
b5b454ae-84bf-4c82-b41f-2c3f820fb4ff	14dbf186-0887-4b9f-a4a6-855f693ac19f	尿素回路は、腎臓に存在する。	f	2
bdd94bc9-034a-432b-9d83-74b3c0298911	14dbf186-0887-4b9f-a4a6-855f693ac19f	セロトニンは、トリプトファンから合成される。	t	3
03cad647-bf10-4291-83e9-cdcc5d30db42	14dbf186-0887-4b9f-a4a6-855f693ac19f	糖新生は、小胞体で行われる。	f	4
5db241fd-27cf-4782-8d8b-c570b03e9ff6	14dbf186-0887-4b9f-a4a6-855f693ac19f	脂肪酸の合成は、ミトコンドリアで行われる。 8	f	5
09d9510f-95ed-4ce6-973a-284a8fbacd22	4191e2e7-5081-4591-bde1-20b34401158a	一次予防は、発症前期において行われる。	f	1
89d27fb6-8118-4311-b240-41df26ec8a00	4191e2e7-5081-4591-bde1-20b34401158a	一次予防の例に、がん患者への就労支援がある。	f	2
ddbbcdf9-80e9-4c91-b736-a77e314364f3	4191e2e7-5081-4591-bde1-20b34401158a	二次予防は、感受性期において行われる。	f	3
2c1dd852-4916-4479-aea8-5c23bc20209a	4191e2e7-5081-4591-bde1-20b34401158a	二次予防の例に、予防接種がある。	f	4
9d34ec66-52f3-4825-b028-e17660bdc0cc	4191e2e7-5081-4591-bde1-20b34401158a	三次予防の例に、腎不全患者への人工透析がある。	t	5
672923bd-63d5-498a-8018-dfb79f5f1a4c	b20abc83-bf36-4c4e-a8a1-899a26ccc474	0. 010	f	1
e90a4685-7d99-4b0e-b596-a058e5520210	b20abc83-bf36-4c4e-a8a1-899a26ccc474	0. 020	f	2
5d13d768-c99f-4796-9a3b-56a60f287d05	b20abc83-bf36-4c4e-a8a1-899a26ccc474	0. 050	f	3
556ec931-9370-404c-9de6-1d0b9cdcd206	b20abc83-bf36-4c4e-a8a1-899a26ccc474	0. 100	f	4
6dbfda54-17a0-4f0c-b912-e5da174d1dc7	b20abc83-bf36-4c4e-a8a1-899a26ccc474	0. 200	t	5
f8790cda-1470-4225-8fb2-e7f50a376d68	4f7452b1-3b4a-4dc6-a444-6fdf0c615bba	３年に1回実施されている。	f	1
332c68fd-b248-40fe-bffc-ba2c82a9d8f3	4f7452b1-3b4a-4dc6-a444-6fdf0c615bba	調査対象は、層化無作為抽出法により選定する。	f	2
dee7bbbe-9a30-4874-8f78-391ce1de79b1	4f7452b1-3b4a-4dc6-a444-6fdf0c615bba	調査対象は、日本国内に普段住んでいる外国人を含まない。	f	3
e1f6f404-a945-4689-b734-7652414c2477	4f7452b1-3b4a-4dc6-a444-6fdf0c615bba	調査項目は、「医療機関への受診の状況」を含む。	f	4
14991fc2-9c8c-410c-8862-0189ad1375a9	4f7452b1-3b4a-4dc6-a444-6fdf0c615bba	調査結果をもとに、将来人口推計を行う。 1	t	5
d6e90a26-b281-4a46-a36b-6d4426e40721	1bfcf8d2-79a8-4496-b3c1-afc8a985b27e	A 地域の老年人口割合は、B 地域よりも高い。	f	1
af5e8292-1919-427e-a82d-b7ba89f3a4bb	1bfcf8d2-79a8-4496-b3c1-afc8a985b27e	A 地域の粗死亡率は、B 地域よりも高い。	f	2
228adc99-4875-431f-a99f-2fa03401a462	1bfcf8d2-79a8-4496-b3c1-afc8a985b27e	A 地域の死亡数は、期待死亡数と同じである。	f	3
0f111063-8ab5-48a9-bd88-f7f2fe5af9b5	1bfcf8d2-79a8-4496-b3c1-afc8a985b27e	A 地域の期待死亡数は、B 地域の期待死亡数よりも多い。	f	4
89f6bf5c-de46-4123-a99f-17411fd209dd	1bfcf8d2-79a8-4496-b3c1-afc8a985b27e	A 地域の標準化死亡比は、B 地域の標準化死亡比よりも高い。 表 A地域およびB地域の年齢階級別人口、基準集団の年齢階級別死亡率 年齢階級 A 地域 人口（人） B 地域 人口（人） 基準集団 死亡率（人口1万対） 0～14 歳240,00090,0002 15～64 歳900,000500,00020 合計1,440,000990,000 2	t	5
e1b24b84-85fe-480d-a8e6-b5de828bab8f	c52411af-37aa-42c4-aaa2-97e25d035aa0	敏感度	f	1
532c7f44-f379-4aff-92fd-435b09a64748	c52411af-37aa-42c4-aaa2-97e25d035aa0	特異度	f	2
f2aa4e9d-8263-4fd6-b82e-1f5e319bc5fd	c52411af-37aa-42c4-aaa2-97e25d035aa0	偽陽性率	f	3
c1ac302f-e4fd-4ef5-967a-10bb6f20dcf3	c52411af-37aa-42c4-aaa2-97e25d035aa0	陽性反応的中度	t	4
e29082b3-9d14-4d07-b1a2-25de973ada42	c52411af-37aa-42c4-aaa2-97e25d035aa0	陰性反応的中度 表 集団Aと集団Bのスクリーニング結果と疾病状況 スクリーニング試験 集団 A集団 B 疾病あり（人）疾病なし（人）疾病あり（人）疾病なし（人） 陽性255025050 陰性545050450	f	5
731ae430-0b2c-498b-8754-37cd877dbc5f	b047b4a4-887c-4dbc-987a-d91e88b838fa	研究計画書の研究倫理審査は、この食品会社の役員会議で行われる。	f	1
2dbb6c9b-0867-4932-98e1-3c6e4d0ec7fd	b047b4a4-887c-4dbc-987a-d91e88b838fa	委託先の大学の研究者は、研究対象者に研究内容を説明し研究参加の同意を 得る。	t	2
98c6afb7-1e6f-4043-8c63-58477baa0cf0	b047b4a4-887c-4dbc-987a-d91e88b838fa	研究計画は、販売しようとする食品の利潤最大化を最優先に作成する。	f	3
f864c2f2-e886-40b2-90e3-a0fbbe761246	b047b4a4-887c-4dbc-987a-d91e88b838fa	この委託研究に従事しない食品会社の社員は、研究の利益相反を開示する。	f	4
a9c6bfdc-f4f4-491f-9ce5-8d69282aeb44	b047b4a4-887c-4dbc-987a-d91e88b838fa	委託先の大学の研究者は、売り上げ状況のモニタリング調査を行う。 3	f	5
de30f0b1-08fc-4c2f-9d06-f0711cc10767	ffcf4e4f-ce6c-4bb9-9e58-ec5d5f6a40c6	健康日本 21（第二次）の最終評価において、「運動習慣者の割合の増加」は「目 標値に達した」と評価された。	f	1
41e0867f-4425-4fe7-99cb-3bb2a35f8371	ffcf4e4f-ce6c-4bb9-9e58-ec5d5f6a40c6	健康日本 21（第二次）の最終評価において、「生活習慣病のリスクを高める量 を飲酒している者の割合の減少」は「目標値に達した」と評価された。	f	2
fe2b9959-5696-452d-9145-f26429d913fb	ffcf4e4f-ce6c-4bb9-9e58-ec5d5f6a40c6	健康日本 21（第三次）では、休養・睡眠に関する指標として、具体的な睡眠 時間は設定されていない。	f	3
ea46585d-7f94-4da3-935a-8d04ba494042	ffcf4e4f-ce6c-4bb9-9e58-ec5d5f6a40c6	健康づくりのための睡眠ガイド 2023 では、高齢者の床上時間は8時間以上 にならないことが目安とされている。	t	4
7ccf154e-cf44-4337-b780-7df8cbc52b50	ffcf4e4f-ce6c-4bb9-9e58-ec5d5f6a40c6	ブリンクマン指数は、「1日の喫煙本数」に「喫煙開始年齢」を乗じた値であ る。	f	5
88e3e9ab-c4cc-46c3-99a2-29b9415f0b91	da76dc57-a0ea-44de-9b6d-fdc4d0c39d14	対象者を 18 歳未満、18～64 歳、65 歳以上で区切って、推奨事項が示されて いる。	f	1
2227ccef-5943-4f8b-b83c-32ffb645d2e5	da76dc57-a0ea-44de-9b6d-fdc4d0c39d14	「座位行動」という概念が取り入れられた。	t	2
a628e01a-1a89-4beb-87da-48fec1e2f1ca	da76dc57-a0ea-44de-9b6d-fdc4d0c39d14	「高齢者」の運動として、筋力トレーニングは推奨されていない。	f	3
568d9d85-c758-49bc-9382-c268ab5423fd	da76dc57-a0ea-44de-9b6d-fdc4d0c39d14	「高齢者」の身体活動として、強度は問わず、1日 40 分以上行うことが推奨 されている。	f	4
5746e082-de93-4ea2-b25b-99b08b065d66	da76dc57-a0ea-44de-9b6d-fdc4d0c39d14	「身体を動かす時間が少ないこども」において推奨されている身体活動の強度 は、5メッツ以上である。 4	f	5
9e9c551d-777f-4749-a8f6-d088ae21d7a4	202c6f1e-85de-4e47-97a9-6b2a5bdb8f79	フッ化物の歯面塗布の主な目的は、歯周病の予防である。	f	1
09db9a92-5556-462a-b4bd-810a3ffaa04f	202c6f1e-85de-4e47-97a9-6b2a5bdb8f79	シーラントの主な目的は、歯周病の予防である。	f	2
23b28483-05cf-4bfd-9b1e-175b1e9b4b7e	202c6f1e-85de-4e47-97a9-6b2a5bdb8f79	糖尿病は、歯周病のリスク因子である。	t	3
6202273e-e86b-480d-a9bd-87c1f3bdd638	202c6f1e-85de-4e47-97a9-6b2a5bdb8f79	直近5年間の学校保健統計調査によると、小学生におけるむし歯（う歯）の被 患率は、増加傾向である。	f	4
20c917da-abc2-4df7-b6fa-70d2e96a6954	202c6f1e-85de-4e47-97a9-6b2a5bdb8f79	直近5年間の学校保健統計調査によると、中学生における被患率が最も高い のは、むし歯（う歯）である。	f	5
e39db713-3379-4209-a7fa-a4d08018668f	3d759f34-f5d3-494d-be2a-0add50158a1b	胃がん検診の対象年齢は、60 歳以上である。	f	1
b4879b3f-ecf7-4f90-a790-2dd9961c5f78	3d759f34-f5d3-494d-be2a-0add50158a1b	子宮頸がん検診の対象年齢は、40 歳以上である。	f	2
b9924759-5a13-4d1d-bb4b-7d64d5efa3b0	3d759f34-f5d3-494d-be2a-0add50158a1b	乳がん検診の検査方法として、触診が推奨されている。	f	3
1b2bb77c-a49e-4c52-845d-073dd4559927	3d759f34-f5d3-494d-be2a-0add50158a1b	大腸がん検診の検査方法として、内視鏡検査が推奨されている。	f	4
c63f56ac-e333-48cc-bffc-da2ab9102106	3d759f34-f5d3-494d-be2a-0add50158a1b	肺がん検診の受診間隔は、1年に1回が推奨されている。	t	5
29d8f47a-264a-4056-a6d4-90ab83167ac6	81a76e5c-c830-4d40-b14c-c9beb00d5ce8	麻疹	f	1
f5ec4563-d3ed-4fd8-b911-a6558aaa6f55	81a76e5c-c830-4d40-b14c-c9beb00d5ce8	風疹	f	2
7c6fc6af-43f3-4b58-8fec-ebdb1660c135	81a76e5c-c830-4d40-b14c-c9beb00d5ce8	ポリオ（急性灰白髄炎）	f	3
56812089-6fa0-4422-b76b-d067d40677da	81a76e5c-c830-4d40-b14c-c9beb00d5ce8	マラリア	t	4
f4c9fdb6-1fd1-4bfb-87ab-0d16fe60b0f7	81a76e5c-c830-4d40-b14c-c9beb00d5ce8	B 型肝炎 5	f	5
55ea0382-3159-403a-a5fe-7aaa2afd87ad	715abb18-5fce-4563-8f87-f52d3b19043a	発病の機構が明らかでない。	f	1
946351e1-5b8f-4076-94a2-b91be1c3e9a9	715abb18-5fce-4563-8f87-f52d3b19043a	治療方法が確立していない。	f	2
e5bba10f-9131-4c42-a81c-892cbab882fb	715abb18-5fce-4563-8f87-f52d3b19043a	希少な疾病である。	f	3
9a633a3d-c107-4690-9ebf-7b05701c1166	715abb18-5fce-4563-8f87-f52d3b19043a	致命率が高い。	t	4
0065563d-f5cc-4f76-92d3-0056ef5f81d9	715abb18-5fce-4563-8f87-f52d3b19043a	長期にわたり療養を必要とする。	f	5
d547afe6-12b6-4960-9bbf-3f22730c2b42	2e5d0f70-d06a-4752-ade0-da981e77cf4f	社会保険	f	1
4db03a10-907a-4fa1-ba11-c8fb60f3f809	2e5d0f70-d06a-4752-ade0-da981e77cf4f	恩給	f	2
d4c2907c-5f98-443f-a932-ee38206ef424	2e5d0f70-d06a-4752-ade0-da981e77cf4f	公的扶助	t	3
75ca08d3-c7cf-48c9-81a2-231d184269a0	2e5d0f70-d06a-4752-ade0-da981e77cf4f	保健医療・公衆衛生	f	4
ed7ac846-e76b-4f9f-8d92-ce2258c35590	2e5d0f70-d06a-4752-ade0-da981e77cf4f	社会福祉	f	5
0b594863-75c0-4ca2-ad68-b0da77b8450e	489f66e6-113a-4552-9630-d33aa4192414	市町村は、設置しなければならない。	f	1
203c9751-b6dd-4329-8a51-dffec02a2165	489f66e6-113a-4552-9630-d33aa4192414	センター長は、原則として医師でなければならない。	f	2
df613413-7fb7-43c7-bd49-ee79a3ba3abe	489f66e6-113a-4552-9630-d33aa4192414	食品衛生の監視を行う。	f	3
0c764278-13fe-432d-bb83-25a224cd8f56	489f66e6-113a-4552-9630-d33aa4192414	住民の健康相談を担う。	t	4
a0d3c2fa-fe73-41a7-8e24-5aa39f8e247e	489f66e6-113a-4552-9630-d33aa4192414	地域における健康危機管理の拠点となる。 6	f	5
58829b53-e5a9-4d9c-bc0b-8028f37fa915	d631148c-8066-414d-9d8f-c49d8aab6f0f	根拠法は、健康増進法である。	f	1
457b4e11-5232-4efd-9928-e1f82dfd1b10	d631148c-8066-414d-9d8f-c49d8aab6f0f	75 歳以上の被保険者は、対象とならない。	t	2
482459e5-9ba1-4fd2-a359-56cd7e40b896	d631148c-8066-414d-9d8f-c49d8aab6f0f	保険者は、降圧薬を服薬中の者を、特定保健指導の対象としなければならな い。	f	3
fea29391-8da0-4b97-bccb-fe1e98e7d8b3	d631148c-8066-414d-9d8f-c49d8aab6f0f	採血は、空腹時に限定されている。	f	4
8f5d3a71-9be9-49a3-80d7-b43af9d0a869	d631148c-8066-414d-9d8f-c49d8aab6f0f	腹囲が 90 cm で喫煙習慣がある 50 歳男性の場合、1つの追加リスクがある と動機付け支援の対象となる。	f	5
5e0a1a95-933f-4520-ab80-7482005d29bf	73e68e5d-f28a-4c52-83b7-9c9472d4e85c	直近の国民生活基礎調査（大規模調査年）によると、要介護者となった原因と して最も多いのは、年齢にかかわらず脳卒中である。	f	1
0a925f1a-7cae-4c26-a066-6e548a83ffc0	73e68e5d-f28a-4c52-83b7-9c9472d4e85c	介護保険制度における保険給付の財源は、全額が被保険者から徴収した保険 料である。	f	2
984188e9-551a-4b18-937c-669a78fe0f36	73e68e5d-f28a-4c52-83b7-9c9472d4e85c	介護保険制度における予防給付サービスは、要介護者が対象である。	f	3
9aefe7bd-de33-4590-b706-f4a0e810d65a	73e68e5d-f28a-4c52-83b7-9c9472d4e85c	介護老人保健施設では、医学的管理は行われない。	f	4
2f78058e-5c25-40d1-88e5-4a458ff9a3b8	73e68e5d-f28a-4c52-83b7-9c9472d4e85c	地域包括支援センターの業務には、権利擁護に関する業務が含まれている。	t	5
56edcb47-241b-4234-8e01-7b04d149446b	84623e9a-d156-475c-8644-6d95a3149e22	血小板には、核が存在する。	f	1
a6be4145-b18f-40d0-83b1-f100691c9be7	84623e9a-d156-475c-8644-6d95a3149e22	細胞外のナトリウムイオン濃度は、細胞内より低い。	f	2
00d71948-ecba-4c14-ace3-3869a7d3c84d	84623e9a-d156-475c-8644-6d95a3149e22	全ての細胞は、1つの受精卵から発生する。	t	3
4d6f4706-3e8a-4892-aa8c-bd5e1adce3fc	84623e9a-d156-475c-8644-6d95a3149e22	細胞周期の S 期では、染色体が形成される。	f	4
b69f6c1d-3518-46ed-9d4a-3ad340e5fd37	84623e9a-d156-475c-8644-6d95a3149e22	マクロファージは、リンパ球から分化する。 7	f	5
d02f59cf-70c8-4b1d-abba-917f22821861	db3a6010-e06b-42ca-8d50-56a28e23aef7	アミノ酸は、両性化合物である。	t	1
574d9948-6829-4abe-9dd5-5d61ec277d8c	db3a6010-e06b-42ca-8d50-56a28e23aef7	たんぱく質の二次構造は、ジスルフィド結合により形成される。	f	2
f35072d6-6331-485d-a65e-9116455b79a0	db3a6010-e06b-42ca-8d50-56a28e23aef7	たんぱく質は、プロテアソームにより折りたたまれる。	f	3
14e87085-5113-4718-8e5b-1925b0574caa	db3a6010-e06b-42ca-8d50-56a28e23aef7	フルクトースは、アルデヒド基をもつ。	f	4
c95ecf74-6bd6-4b93-8c20-05c028682357	db3a6010-e06b-42ca-8d50-56a28e23aef7	でんぷんは、β ─ 1,4 グリコシド結合をもつ。	f	5
4f6caf66-d98a-451d-bfb8-77fef7edd76d	2c4cc6f1-2389-4cde-a8c8-9cf9b5904669	AMP は、分子内に高エネルギー結合をもつ。	f	1
238db5f6-3d64-4956-8b15-a7337ab20203	2c4cc6f1-2389-4cde-a8c8-9cf9b5904669	ホスホエノールピルビン酸は、高エネルギー化合物である。	t	2
7f14aae4-280e-4059-9623-7e7237991a2d	2c4cc6f1-2389-4cde-a8c8-9cf9b5904669	電子伝達系は、ミトコンドリアの外膜にある。	f	3
ce7581dc-5f24-4f20-8d08-dee34a732ee4	2c4cc6f1-2389-4cde-a8c8-9cf9b5904669	電子伝達系の電子受容体は、窒素分子である。	f	4
ca4f609e-58eb-46b3-aecc-b80bf7eb45dc	2c4cc6f1-2389-4cde-a8c8-9cf9b5904669	脱共役たんぱく質（UCP）による熱産生は、ATP の合成を伴う。	f	5
5d04fdcd-b1ab-4254-a920-c55081d1e895	35055d3d-6e04-4f77-a2aa-43f2daba486b	ビタミン B 1 は、アミノ基転移反応の補酵素である。	f	1
bd1e8f0e-32b3-4d54-8dd5-7de5cf1aa41d	35055d3d-6e04-4f77-a2aa-43f2daba486b	尿素回路は、腎臓に存在する。	f	2
50ced14c-8fcc-43db-beee-c3e3db92030c	35055d3d-6e04-4f77-a2aa-43f2daba486b	セロトニンは、トリプトファンから合成される。	t	3
92974552-176f-4717-8db1-bc371884c08a	35055d3d-6e04-4f77-a2aa-43f2daba486b	糖新生は、小胞体で行われる。	f	4
e1f8103a-e7eb-4d99-ba11-ef47ca48388e	35055d3d-6e04-4f77-a2aa-43f2daba486b	脂肪酸の合成は、ミトコンドリアで行われる。 8	f	5
e31848ed-18f3-4aa5-9363-07f298d10757	aaa2dde6-5876-4951-ad2b-5fe9e54c855f	過換気症候群では、呼吸性アシドーシスになる。	f	1
c60425dc-a396-4f87-9cc5-5ed652831888	aaa2dde6-5876-4951-ad2b-5fe9e54c855f	COPD では、呼吸性アルカローシスになる。	f	2
1642e6d7-0cef-452b-b2a6-8506e84b85cf	aaa2dde6-5876-4951-ad2b-5fe9e54c855f	大量の嘔吐では、代謝性アシドーシスになる。	f	3
411b0502-da95-4831-8674-65fb3bc690b4	aaa2dde6-5876-4951-ad2b-5fe9e54c855f	原発性アルドステロン症では、代謝性アシドーシスになる。	f	4
c6619f52-9569-4e19-9fb7-66c7feccd1e0	aaa2dde6-5876-4951-ad2b-5fe9e54c855f	腎不全では、代謝性アシドーシスになる。	t	5
8dc2cb1c-8499-483b-91f0-491ab9f16980	29c35e0c-f09c-4ee3-ba52-36d8708b6fb0	テロメアは、細胞分裂を繰り返すと長くなる。	f	1
1d652138-bf86-40c4-9f12-d7c41c8cdf66	29c35e0c-f09c-4ee3-ba52-36d8708b6fb0	肉芽組織は、線維芽細胞に富んでいる。	t	2
36c400ed-08fc-41e1-bad8-2b0ef9d01cc7	29c35e0c-f09c-4ee3-ba52-36d8708b6fb0	良性腫瘍は、悪性腫瘍に比べて細胞の分化度が低い。	f	3
6110751d-12d0-496f-b8d3-8d2d03cb5bae	29c35e0c-f09c-4ee3-ba52-36d8708b6fb0	上皮性の悪性腫瘍は、肉腫と呼ばれる。	f	4
76751d57-2d73-44ad-a98f-230e29d8eb05	29c35e0c-f09c-4ee3-ba52-36d8708b6fb0	脳死では、自発呼吸がみられる。	f	5
a54e92f0-693f-4725-9aab-2b8538535de2	35e4126d-3fa9-4754-9f34-99afce2f48c5	動脈血ガス分析検査では、pH が測定される。	t	1
f11274f6-efef-43eb-b012-1792e921f1cf	35e4126d-3fa9-4754-9f34-99afce2f48c5	ビリルビンは、血清たんぱく質である。	f	2
2d96ba9e-ebca-4399-92f9-043f580cf3df	35e4126d-3fa9-4754-9f34-99afce2f48c5	心電図の QRS 波は、心房の興奮を反映している。	f	3
bb8acd78-18ea-480d-bb78-f646f5a3a1f6	35e4126d-3fa9-4754-9f34-99afce2f48c5	スパイロメトリは、経皮的酸素飽和度を調べる検査である。	f	4
7d6a5333-1669-4c4c-93af-a7de2a5c41b1	35e4126d-3fa9-4754-9f34-99afce2f48c5	CT（コンピューター断層撮影）は、磁気を利用する検査である。	f	5
73649466-cac6-4aae-a066-dab272da2e08	0d3c9d54-c77b-49ec-b6c5-e85c5fa5e65f	発熱の患者に対する解熱鎮痛薬の投与は、原因療法である。	f	1
4d194798-08fb-4d6a-86ce-dda1deb93275	0d3c9d54-c77b-49ec-b6c5-e85c5fa5e65f	細菌性肺炎に対する抗菌薬の投与は、対症療法である。	f	2
7bc8286d-252e-4c99-9e5a-0a3aa1b71a29	0d3c9d54-c77b-49ec-b6c5-e85c5fa5e65f	リハビリテーションは、根治療法である。	f	3
486c871b-8656-4bb5-9661-d4b153f960d0	0d3c9d54-c77b-49ec-b6c5-e85c5fa5e65f	輸血療法は、血液浄化療法である。	f	4
49b74030-ba4d-4787-b6ed-142f86589017	0d3c9d54-c77b-49ec-b6c5-e85c5fa5e65f	iPS 細胞（人工多能性幹細胞）の使用は、再生医療である。 9	t	5
c34bc30b-65bc-4bc3-bf91-64d73cbcc716	5a8700e8-fd6b-46fc-bc0d-2128284ecca2	インスリンは、リポたんぱく質リパーゼ活性を低下させる。	f	1
43839742-d84b-4d2e-82f7-f86b7fc484b2	5a8700e8-fd6b-46fc-bc0d-2128284ecca2	リポたんぱく質リパーゼの異常では、高キロミクロン血症をきたす。	t	2
020bee09-3831-4fc6-9dba-99dd63587efe	5a8700e8-fd6b-46fc-bc0d-2128284ecca2	家族性高コレステロール血症は、グルコース ─ 6 ─ ホスファターゼの欠損に よって起こる。	f	3
5bd05eb7-1312-4ce2-8014-f9601f516d05	5a8700e8-fd6b-46fc-bc0d-2128284ecca2	ネフローゼ症候群の診断基準では、脂質異常症が必須条件である。	f	4
4a78477e-d46e-4ee1-bfc2-a7cd35f143b8	5a8700e8-fd6b-46fc-bc0d-2128284ecca2	著明な高コレステロール血症では、急性膵炎を起こす。	f	5
2cd810b6-a41d-4f29-b6ad-e3cea7b5f683	32c48180-1086-410b-8ef1-26d9f80752f3	嚥下時には、軟口蓋が気管を塞ぐ。	f	1
66af1d61-55f8-4e11-9d57-b4bfd838148d	32c48180-1086-410b-8ef1-26d9f80752f3	内因子は、主細胞から分泌される。	f	2
54b7a43d-bedc-4287-900a-26faa583233f	32c48180-1086-410b-8ef1-26d9f80752f3	胆汁は、総胆管を経て胆嚢に運ばれる。	f	3
05b84844-7245-4a49-b389-3b71c3339586	32c48180-1086-410b-8ef1-26d9f80752f3	オッディ（Oddi）括約筋が弛緩すると、胆汁が十二指腸に排出される。	t	4
863205f3-3043-4eeb-9e94-463c167e2d57	32c48180-1086-410b-8ef1-26d9f80752f3	大腸粘膜には、輪状ヒダがある。	f	5
d47b4ff5-c2c1-4f75-97ca-3bd3a81c3ee1	942434e6-c815-4fb5-b55a-cfb30b15a9c6	A 型肝炎は、血液感染が最も多い。	f	1
d910d417-0780-42e8-9806-0a805050f7be	942434e6-c815-4fb5-b55a-cfb30b15a9c6	B 型肝炎ウイルスは、RNA ウイルスである。	f	2
32756378-6f47-429e-9a41-f3539dcb620b	942434e6-c815-4fb5-b55a-cfb30b15a9c6	肝硬変では、プロトロンビン時間が短縮する。	f	3
26365212-ac36-4ebc-98ae-de107801c00e	942434e6-c815-4fb5-b55a-cfb30b15a9c6	肝硬変では、血中コリンエステラーゼ値が上昇する。	f	4
380fafb9-75f4-4cc8-bf73-05c98d4547ed	942434e6-c815-4fb5-b55a-cfb30b15a9c6	NASH では、肝の線維化がみられる。	t	5
de5882d3-0ffe-4a79-b179-c7a21e2be9f4	83f4c68c-1feb-4621-8b69-6118b6af5f20	心臓血管中枢は、中脳にある。	f	1
1cc8ab02-d5b4-45ac-81c6-b5e596718306	83f4c68c-1feb-4621-8b69-6118b6af5f20	肺動脈は、肺と左心房をつなぐ。	f	2
b5bdf685-6341-49b3-8d7d-e4c853a2fe62	83f4c68c-1feb-4621-8b69-6118b6af5f20	心室の収縮期では、僧帽弁は閉鎖する。	t	3
caa0fe27-1dd3-4561-8764-96c89a288f62	83f4c68c-1feb-4621-8b69-6118b6af5f20	動脈は、内膜と外膜の2層からなる。	f	4
9cf70174-4404-46ec-8983-e9eee1d5850d	83f4c68c-1feb-4621-8b69-6118b6af5f20	副交感神経の興奮により、心拍数は増加する。 10	f	5
8b111c43-ddc7-4c58-8152-39ad88009ccf	e475b330-fd90-4969-a723-f52d217c0b5e	心室細動では、心拍出量が増加する。	f	1
8251fba5-debe-4b72-8c1f-0765f945c736	e475b330-fd90-4969-a723-f52d217c0b5e	深部静脈血栓症では、急性肺塞栓を起こす。	t	2
44fc5939-99a6-483e-86f4-2b86752c308f	e475b330-fd90-4969-a723-f52d217c0b5e	右心不全では、肺うっ血がみられる。	f	3
2800bd17-d543-438d-bd58-0b9c0c39ab4a	e475b330-fd90-4969-a723-f52d217c0b5e	心不全では、血中 BNP（脳性ナトリウム利尿ペプチド）値が低下する。	f	4
fb5459c4-5435-407e-83b9-8baf93e0cf2a	e475b330-fd90-4969-a723-f52d217c0b5e	重度の貧血では、低心拍出性心不全がみられる。	f	5
67e1afdb-8ca2-4802-824c-a5a9680dae96	ac95c5b0-aa5c-4257-8714-16ca0f1b8ed0	1個の腎臓には、約1万個のネフロンがある。	f	1
7693e573-1b64-435a-9c60-23190176f0fa	ac95c5b0-aa5c-4257-8714-16ca0f1b8ed0	ヘンレ係蹄は、遠位尿細管と集合管との間に存在する。	f	2
36035300-e746-44f2-8b43-2b3be5dbcea0	ac95c5b0-aa5c-4257-8714-16ca0f1b8ed0	近位尿細管では、グルコースが再吸収される。	t	3
87d9a868-2950-496b-b165-46f4e9c85ba8	ac95c5b0-aa5c-4257-8714-16ca0f1b8ed0	健常成人の1日当たりの糸球体濾過量は、約 1. 5 L である。	f	4
ec10b225-657e-4b67-b3fd-0836deeba34b	ac95c5b0-aa5c-4257-8714-16ca0f1b8ed0	健常成人の尿比重は、1. 100 以上に調節されている。	f	5
1ac85793-b267-46d8-9a38-f73a4334e99e	3bb5ac4a-7d48-4e6d-8c6b-9d2a1f50a88e	高齢者に多い。	f	1
f0b03d4f-6099-44b1-8422-a1f474c0ef4a	3bb5ac4a-7d48-4e6d-8c6b-9d2a1f50a88e	感染後1～３日で発症する。	f	2
440ceb7b-b87d-4380-914c-671d390791da	3bb5ac4a-7d48-4e6d-8c6b-9d2a1f50a88e	高血圧を引き起こす。	t	3
e88b006f-cd13-4f73-bf77-5704ef283d1b	3bb5ac4a-7d48-4e6d-8c6b-9d2a1f50a88e	血清中の補体価は上昇する。	f	4
89406859-c157-4f0e-b2b6-46a158939cc3	3bb5ac4a-7d48-4e6d-8c6b-9d2a1f50a88e	半数以上は慢性化する。	f	5
1e5d07d3-dfa8-496f-8939-3af9ed29ae70	970d8720-1be9-47eb-acd2-3a45b9ce74b6	バセドウ病では、血中 LDL コレステロール値が上昇する。	f	1
52b7c01a-ce40-4dc0-b27e-981de826b577	970d8720-1be9-47eb-acd2-3a45b9ce74b6	バセドウ病では、血中甲状腺刺激ホルモン（TSH）値が上昇する。	f	2
4db5cc2d-d64c-4897-8385-960e40c3e80d	970d8720-1be9-47eb-acd2-3a45b9ce74b6	橋本病では、基礎代謝が亢進する。	f	3
2503ca4a-8d10-4ddd-994b-fe04345bf1ad	970d8720-1be9-47eb-acd2-3a45b9ce74b6	副甲状腺機能亢進症では、腎臓におけるカルシウム再吸収が抑制される。	f	4
967a2576-9d0b-4555-9b0b-ee7894e3f7ba	970d8720-1be9-47eb-acd2-3a45b9ce74b6	副甲状腺機能低下症では、テタニーが起こる。 11	t	5
707de7ad-5c8d-4561-9998-ca09b503209e	d0fee863-1e6e-47a1-80f0-fdaf5c895ead	主な責任病巣は側頭葉である。	f	1
cf0a36c5-ffad-47ca-9dd2-331d1f4564c7	d0fee863-1e6e-47a1-80f0-fdaf5c895ead	脳内のドーパミンが増加している。	f	2
3bef06f8-4c3e-469e-b4a8-a28b09563e40	d0fee863-1e6e-47a1-80f0-fdaf5c895ead	まだら認知症がみられる。	f	3
7d1dd1d3-14fb-4a3c-963b-bd421058df90	d0fee863-1e6e-47a1-80f0-fdaf5c895ead	四肢の筋肉は弛緩する。	f	4
7016d35f-98d1-4214-bbdc-8667f31e5686	d0fee863-1e6e-47a1-80f0-fdaf5c895ead	便秘をきたす。	t	5
3d575162-ee91-4733-84e5-6ecd229276ac	f7e4e390-e643-4e55-86c9-37fe625b5ee7	呼吸中枢は、大脳皮質に存在する。	f	1
c1706935-aae0-45eb-9ac6-8ad202039821	f7e4e390-e643-4e55-86c9-37fe625b5ee7	気管支平滑筋は、副交感神経の興奮で弛緩する。	f	2
b1f997c2-9fbe-4ec5-a79f-61e1890373ce	f7e4e390-e643-4e55-86c9-37fe625b5ee7	横隔膜は、吸気時に収縮する。	t	3
33eb3a34-aeef-4958-9ce4-e1e2fb1ff507	f7e4e390-e643-4e55-86c9-37fe625b5ee7	内呼吸は、肺胞で行われるガス交換である。	f	4
4e24a996-0588-4440-95ce-6bd93b27da7c	f7e4e390-e643-4e55-86c9-37fe625b5ee7	肺活量は、1回換気量と残気量の和である。	f	5
efbe7c9d-9d5d-4075-bb81-29b5e32c93a7	bca763a3-0fb4-41c5-9af8-728018fbbdc4	COPD に対する治療には、在宅酸素療法がある。	t	1
3a7c5872-503c-4f32-abc9-0685505cfdfc	bca763a3-0fb4-41c5-9af8-728018fbbdc4	気管支喘息では、発作時に気道が拡張する。	f	2
73865e2f-1ba2-4621-9d02-f2d371474509	bca763a3-0fb4-41c5-9af8-728018fbbdc4	肺結核に対する予防接種には、ツベルクリン反応がある。	f	3
5f421121-bbcd-46bb-ae8d-0ae2cd7fe005	bca763a3-0fb4-41c5-9af8-728018fbbdc4	マイコプラズマ肺炎は、ウイルス性肺炎である。	f	4
dc008898-a00b-4326-96f2-69866f0c9bc5	bca763a3-0fb4-41c5-9af8-728018fbbdc4	クリプトコッカス肺炎は、細菌性肺炎である。	f	5
29cb9220-5cfd-42e4-921b-fc106a97c38b	b0b15fb8-de69-45ae-b896-72057ff239db	細胞は円柱形である。	f	1
91d51429-246b-4edd-ab19-d43796273247	b0b15fb8-de69-45ae-b896-72057ff239db	横紋が観察される。	f	2
36eeaca6-23e0-42cf-a41a-f55fc0c554d2	b0b15fb8-de69-45ae-b896-72057ff239db	介在板が観察される。	f	3
522cacab-358c-43f9-9228-4a6b28cdef1c	b0b15fb8-de69-45ae-b896-72057ff239db	骨に付着する。	f	4
240adaeb-0d68-4764-ba04-7d67336d9a70	b0b15fb8-de69-45ae-b896-72057ff239db	不随意筋である。 12	t	5
25456aae-e8c9-4af8-ad14-ca29aceb63d9	af3be147-8e27-4e2a-bda9-e6c74e949d33	男性に多い。	f	1
c000ebf4-d492-410f-93f7-d24f835c9156	af3be147-8e27-4e2a-bda9-e6c74e949d33	類骨が増加する。	f	2
92f251b4-d314-48b4-a243-a5de203cc383	af3be147-8e27-4e2a-bda9-e6c74e949d33	脆弱性骨折がない時の診断基準は、骨密度が若年成人平均値（YAM）の 60％ 未満である。	f	3
e6ff3ffe-d83a-4419-8a68-0caf13d054bb	af3be147-8e27-4e2a-bda9-e6c74e949d33	小児に発症した骨粗鬆症をくる病という。	f	4
b12c5ccb-28ce-4ac9-8734-67c44d7947d1	af3be147-8e27-4e2a-bda9-e6c74e949d33	糖質コルチコイド過剰により発症する。	t	5
fdaf5296-8e58-48d0-89e0-949a834fac35	f858328e-1766-4856-92b5-8ed961dc992d	50 g 経口ブドウ糖負荷試験で診断する。	f	1
46148e80-b6a7-43d9-ba4c-6eb14e5c93fd	f858328e-1766-4856-92b5-8ed961dc992d	空腹時血糖値 150 mg/dL で HbA1c 6. 5％ の場合、妊娠糖尿病と診断でき る。	f	2
8e607141-90e9-4024-8053-1a2cfbad5771	f858328e-1766-4856-92b5-8ed961dc992d	妊娠 20 週以降には、耐糖能は改善する。	f	3
77843654-4ec6-405e-97ce-22ef36208202	f858328e-1766-4856-92b5-8ed961dc992d	将来の2型糖尿病発症リスクである。	t	4
a874064a-1e0e-494e-b82e-8a81bfc3f494	f858328e-1766-4856-92b5-8ed961dc992d	経口血糖降下薬を使用する。	f	5
a9bb874e-63aa-49a8-aee2-e0954a3aeb4c	f1cde9f7-0d1d-47bb-9612-6d4fbcb7da83	ヒトのヘモグロビンは、2本のグロビンからなる二量体である。	f	1
45f60722-ba05-4801-8eca-5f2176621414	f1cde9f7-0d1d-47bb-9612-6d4fbcb7da83	ヘモグロビンと酸素の親和性は、ヘモグロビンと一酸化炭素の親和性よりも 高い。	f	2
7f2aa996-0bfe-4e7f-862c-ee06bff09343	f1cde9f7-0d1d-47bb-9612-6d4fbcb7da83	還元ヘモグロビン濃度が上昇すると、チアノーゼが出現する。	t	3
4d088a3a-a637-4214-b418-1863518de61a	f1cde9f7-0d1d-47bb-9612-6d4fbcb7da83	エリスロポエチンは、白血球の成熟を促す。	f	4
06e44ba9-b157-4b31-ac05-9c3ac7caacd2	f1cde9f7-0d1d-47bb-9612-6d4fbcb7da83	プラスミンは、凝固因子である。 13	f	5
0a932944-7739-4f26-ba2b-8cd449e6e956	0e693547-56bf-4fb0-a963-d00faf80913c	鉄欠乏性貧血では、血清フェリチン値が上昇する。	f	1
cc5a3dc8-5364-48ec-bfc7-3d3dfad9e148	0e693547-56bf-4fb0-a963-d00faf80913c	再生不良性貧血では、骨髄の過形成がみられる。	f	2
f82be66e-c228-4207-8b4f-5c3dd5906f2d	0e693547-56bf-4fb0-a963-d00faf80913c	溶血性貧血では、血中の網赤血球が減少する。	f	3
ffa5a82a-d557-4675-ba4b-7413d5b4d6da	0e693547-56bf-4fb0-a963-d00faf80913c	血友病 A は、第IX因子の異常である。	f	4
75dc665a-8f9f-43d9-b439-0f40e7dabd93	0e693547-56bf-4fb0-a963-d00faf80913c	特発性血小板減少性紫斑病（ITP）では、抗血小板抗体が認められる。	t	5
62e77f99-d3b4-4151-8f46-18fc0f8b1814	7582b1ed-2acc-4b84-9660-f42170080d5e	発症のピーク年齢は、60 歳以上である。	f	1
58343db7-9fc5-4231-97a1-3a0f67cae909	7582b1ed-2acc-4b84-9660-f42170080d5e	男性に多い。	f	2
bd638d05-2fec-48c8-8c0b-fd41e5c9b33d	7582b1ed-2acc-4b84-9660-f42170080d5e	滑膜の炎症が生じる。	t	3
1681cf10-ff2b-4ffc-9230-391db0ad2f7e	7582b1ed-2acc-4b84-9660-f42170080d5e	関節炎症状は、片側の関節に好発する。	f	4
9e8d634c-b4ba-453d-8800-5e00e32e1252	7582b1ed-2acc-4b84-9660-f42170080d5e	自己抗体は、陰性である。	f	5
a2fd0a50-5470-4c1f-92c3-80080c27529f	f0cba206-86d4-47ef-9471-849b22bafcdb	日和見感染とは、感染しても症状が現れない場合をいう。	f	1
7711be0a-e516-4720-acc5-5ed9a6c3f7e3	f0cba206-86d4-47ef-9471-849b22bafcdb	ブドウ球菌は、グラム陰性菌である。	f	2
8140c364-a1bf-4e55-9ef6-b182001e44dc	f0cba206-86d4-47ef-9471-849b22bafcdb	帯状疱疹の病原体は、単純ヘルペスウイルスである。	f	3
84b04beb-9998-4ec3-a692-00100880f6ee	f0cba206-86d4-47ef-9471-849b22bafcdb	劇症型溶連菌感染症は、再興感染症である。	t	4
2ec82fb5-0452-4cd5-b9a8-86ad48309812	f0cba206-86d4-47ef-9471-849b22bafcdb	発疹チフスの病原体は、クラミジアである。	f	5
343233a6-4a25-43b4-9528-3a98749125c6	ffd163c1-6067-4d9d-a7f8-a2cb1a4f35c0	なす果皮のナスニンは、カロテノイド色素である。	f	1
3c5e393f-7b1a-40aa-acfe-09105919c5d1	ffd163c1-6067-4d9d-a7f8-a2cb1a4f35c0	とうがらしの辛み成分は、イソチオシアネートである。	f	2
3ab2be86-8517-4314-9c83-ee6547dcf93e	ffd163c1-6067-4d9d-a7f8-a2cb1a4f35c0	ほうれんそうのあく成分は、ホモゲンチジン酸である。	f	3
22b2f7d1-ffd7-4996-b6f6-34189ca5f502	ffd163c1-6067-4d9d-a7f8-a2cb1a4f35c0	ブロッコリー（花序・ゆで）の可食部 100 g 当たりのビタミン C 含量は、だ いこん（根・皮なし・生）より多い。	t	4
a6a49696-3251-4719-85f2-7f3d343325e6	ffd163c1-6067-4d9d-a7f8-a2cb1a4f35c0	にんじん（根・皮なし・生）の可食部 100 g 当たりのカルシウム含量は、こま つな（葉・生）より多い。 14	f	5
cfb879e3-71b4-44a3-87fb-eaee34f9dd1a	b663ed03-d361-4e39-9e9c-993fcf7caa74	干ししいたけの香りの主成分は、ヌートカトンである。	f	1
0a22a7a6-d70b-4bfb-b323-847ad7d6cbb3	b663ed03-d361-4e39-9e9c-993fcf7caa74	まつたけの香りの主成分は、ノナジエノールである。	f	2
96afc229-d59d-464a-96f9-dbc4fdaa6922	b663ed03-d361-4e39-9e9c-993fcf7caa74	きくらげは、7 ─ デヒドロコレステロールを含む。	f	3
6c0ce163-60e1-4402-9512-49c0088fbb53	b663ed03-d361-4e39-9e9c-993fcf7caa74	傘が7割程度開いた肉厚の干ししいたけを、どんこ（冬菇）という。	t	4
8a578860-0518-41b8-9613-45b99513b659	b663ed03-d361-4e39-9e9c-993fcf7caa74	トリュフは、コナラなどの原木で栽培される。	f	5
fac4750e-48fd-4fc0-b5cf-6bc588fa5459	a13d7a1b-7a08-4429-bf5c-f8c216ef60e9	と畜後、グリコーゲンが嫌気的に分解されることで、pH が上昇する。	f	1
4d7756ca-50c1-40e1-8fdf-9b0a1124723e	a13d7a1b-7a08-4429-bf5c-f8c216ef60e9	鶏肉の0～4°C における最大死後硬直期までの時間は、牛肉より長い。	f	2
58b886cb-3a42-4f82-86b8-309b50d0be69	a13d7a1b-7a08-4429-bf5c-f8c216ef60e9	と畜後、アクトミオシンが形成されると、肉質は軟化する。	f	3
202819f1-4a20-456b-adbe-f4fb65997c5d	a13d7a1b-7a08-4429-bf5c-f8c216ef60e9	熟成中に ATP が増加することで、うま味が増す。	f	4
ec3019b5-5059-4844-b6b8-9986d93b3d03	a13d7a1b-7a08-4429-bf5c-f8c216ef60e9	メトミオグロビンにおけるヘム中の鉄イオンは、３価である。	t	5
d05cc066-38eb-4c61-89a6-2541e16e6075	e2059677-3a82-4f6f-a7fb-c80d436e376c	サフラワー油は、ヒマワリの種子を原料として製造される。	f	1
136a3506-3ea4-4d9d-affc-4a450ceb1dee	e2059677-3a82-4f6f-a7fb-c80d436e376c	バターのリノール酸含量は、とうもろこし油より多い。	f	2
ef776846-e356-442b-9433-a19b4d8ee101	e2059677-3a82-4f6f-a7fb-c80d436e376c	えごま油のα ─ リノレン酸含量は、ごま油より多い。	t	3
920d14c7-506b-4bbd-92a8-b39dc25f5151	e2059677-3a82-4f6f-a7fb-c80d436e376c	カカオ脂のヨウ素価は、オリーブ油より大きい。	f	4
5883835e-3a4f-4566-abc9-b58bdffb5d36	e2059677-3a82-4f6f-a7fb-c80d436e376c	米ぬか油のけん化価は、パーム油より大きい。 15	f	5
bc0b1947-c2b1-4e17-8681-401bc698728a	8280d5b8-bb29-4afa-9831-61d89748d0e8	サーデンペプチドによる血圧の降下消化管内	f	1
06676a83-1439-4ca5-bd9b-da662b52b144	8280d5b8-bb29-4afa-9831-61d89748d0e8	大豆イソフラボンによる骨の健康維持消化管内	f	2
87c83a92-8fed-400d-af43-90017fd0eb4a	8280d5b8-bb29-4afa-9831-61d89748d0e8	難消化性デキストリンによる血糖値上昇の抑制標的組織	f	3
b0c007eb-4668-4be7-b95c-f29d8425b158	8280d5b8-bb29-4afa-9831-61d89748d0e8	EPA による血中中性脂肪の減少標的組織	t	4
b2c94549-4272-47b4-948f-5aed55aa851e	8280d5b8-bb29-4afa-9831-61d89748d0e8	CPP（カゼインホスホペプチド）によるカルシウムの吸収促進 標的組織	f	5
2dd40642-b9bd-435f-917d-958b32f2ca52	1535dd34-f264-4dbd-97e2-baf207d8205a	キシリトールの低う蝕作用再石灰化の促進	f	1
2f960ee5-3a55-4383-8aee-f0c5a0948f32	1535dd34-f264-4dbd-97e2-baf207d8205a	難消化性オリゴ糖の整腸作用 プロバイオティクスとしての作用	f	2
e6634829-0a4d-4040-a572-83119cb0f0c7	1535dd34-f264-4dbd-97e2-baf207d8205a	中鎖脂肪酸の体脂肪低蓄積性 脂肪組織でのβ酸化関連酵素の活性化	f	3
84a486aa-d5db-4361-b775-59aa630cbfe8	1535dd34-f264-4dbd-97e2-baf207d8205a	キトサンの血中コレステロー ル低下作用 胆汁酸の再吸収抑制	t	4
0531d768-e786-46a9-910c-3e36179644ed	1535dd34-f264-4dbd-97e2-baf207d8205a	γ ─ アミノ酪酸（GABA）の降 圧作用 アンジオテンシン変換酵素の阻害	f	5
bc2212df-ee2c-4254-bf55-a056a559497b	13343b87-69fb-435f-9a03-c8e241c1819f	食品中の生菌数が 10 ３ 個/g を超えると、初期腐敗と判定される。	f	1
0c1c28af-7611-4bc8-bcea-3220d7fd1f73	13343b87-69fb-435f-9a03-c8e241c1819f	トリメチルアミンは、肉類における初期腐敗の指標である。	f	2
beab3838-5365-4d99-b316-f623d73745a5	13343b87-69fb-435f-9a03-c8e241c1819f	ヘテロサイクリックアミンは、非酵素的褐変により生成する。	f	3
fa0f2524-e115-44f6-baa0-10d8753883c8	13343b87-69fb-435f-9a03-c8e241c1819f	油脂の自動酸化は、不飽和脂肪酸から水素原子が脱離することで開始する。	t	4
d0df9fbd-cb85-4fe5-9f43-ad72a61c2bae	13343b87-69fb-435f-9a03-c8e241c1819f	K 値は、ATP 関連化合物の酵素的分解が進むと低下する。 17	f	5
ef576304-561b-41a9-9f64-609883629066	a5cd8af7-2ac5-4853-bfb3-87e009e3ef9f	テトロドトキシンは、煮沸処理により無毒化される。	f	1
3b57195c-1503-467d-9cb1-3f34790861f0	a5cd8af7-2ac5-4853-bfb3-87e009e3ef9f	トリカブトによる食中毒の原因物質は、リコリンである。	f	2
749d3146-2cd9-4e16-bbdc-501492b9b861	a5cd8af7-2ac5-4853-bfb3-87e009e3ef9f	じゃがいもによる食中毒の原因物質は、リナマリンである。	f	3
39c55deb-3fb8-410a-b597-0f1c0a6f35a9	a5cd8af7-2ac5-4853-bfb3-87e009e3ef9f	イヌサフランによる食中毒の原因物質は、イルジン S である。	f	4
9593e96e-47aa-4887-baec-1d2f382d9b74	a5cd8af7-2ac5-4853-bfb3-87e009e3ef9f	シガテラ中毒の主症状は、ドライアイスセンセーションである。	t	5
5c0a9a7b-c93c-428b-b9c6-d5c48f78eed0	d098dbf2-7482-4982-92fa-a7b24b6c887a	カンピロバクターによる食中毒の潜伏期間は、12 時間程度である。	f	1
fafedc61-d5c1-4e2d-98a7-389cb95736d9	d098dbf2-7482-4982-92fa-a7b24b6c887a	腸管出血性大腸菌は、芽胞を形成する。	f	2
7ff0886f-39d3-4bc9-a2a6-bd1024a56e75	d098dbf2-7482-4982-92fa-a7b24b6c887a	黄色ブドウ球菌の毒素は、煮沸処理では無毒化されない。	t	3
0c0de028-8f77-4069-945c-612767a1d4fa	d098dbf2-7482-4982-92fa-a7b24b6c887a	リステリア属菌による食中毒の主症状は、神経麻痺である。	f	4
47824bd7-29aa-45f9-b9ed-fbec4089c2aa	d098dbf2-7482-4982-92fa-a7b24b6c887a	ノロウイルスは、ヒトを介した二次感染はない。	f	5
b37e0abd-37cc-4800-b989-ad77cb419d1b	54df3f94-4160-4d72-b74e-b52ea4de209c	Campylobacter jejuni 魚介類	f	1
7cbd1baa-c0b5-4520-b311-a4f112f6857e	54df3f94-4160-4d72-b74e-b52ea4de209c	Clostridium perfringens カレーライス	t	2
344a18a7-9491-4d2f-bc4c-a3a0c6260a3a	54df3f94-4160-4d72-b74e-b52ea4de209c	Salmonella enterica serovar Enteritidis二枚貝	f	3
78f1f175-341b-4189-88a8-91fc2c083bc6	54df3f94-4160-4d72-b74e-b52ea4de209c	Staphylococcus aureusはちみつ	f	4
66a3e609-0721-4f9f-8233-1995ef868c75	54df3f94-4160-4d72-b74e-b52ea4de209c	Vibrio parahaemolyticus鶏卵 18	f	5
debf5e14-9896-46f2-a9ba-3bbff6e55116	81392a3e-328c-4131-b023-f87793759390	アフラトキシン M1は、主に落花生から検出される。	f	1
54047c20-199b-4b7c-8c38-03ab50a60b95	81392a3e-328c-4131-b023-f87793759390	パツリンは、主に米から検出される。	f	2
0c918c11-1508-4d38-a9bc-82d214ba4272	81392a3e-328c-4131-b023-f87793759390	ベンゾ［a］ピレンは、主に果物から検出される。	f	3
c97cf2d1-c2c4-457c-867c-2d25ed877638	81392a3e-328c-4131-b023-f87793759390	異常プリオンは、牛の扁桃に蓄積しやすい。	t	4
3d367323-282c-464d-ba89-b8b6504d73ee	81392a3e-328c-4131-b023-f87793759390	セシウム 137 は、主に骨に沈着する。	f	5
7e7dbf30-7200-429b-936c-08a342d1901a	601b36be-4c3b-4730-880e-30986e4d381f	無毒性量は、ヒトへの試験をもとに設定される。	f	1
42ad553d-99e4-44a7-b16e-4997b12ee9fb	601b36be-4c3b-4730-880e-30986e4d381f	亜硝酸ナトリウムは、着色料として使用される。	f	2
0104fa43-9179-4eed-94e5-5f452534c16f	601b36be-4c3b-4730-880e-30986e4d381f	ソルビン酸カリウムは、酸化防止剤として使用される。	f	3
1aec28d9-6f28-4b84-bf7b-8ae9394989ff	601b36be-4c3b-4730-880e-30986e4d381f	オルトフェニルフェノールは、防かび剤として使用される。	t	4
db004aab-5d52-4468-9381-b3b0fbd9fc80	601b36be-4c3b-4730-880e-30986e4d381f	甘味料は、一括名での表示が可能である。	f	5
b4aa52e8-0536-4973-9236-c67a5db4b014	c70a48c9-f35a-42e5-be10-e9325aece631	たんぱく質 カールフィッシャー法	f	1
421ffffd-8d1d-4031-abe0-10663f294186	c70a48c9-f35a-42e5-be10-e9325aece631	脂質原子吸光光度法	f	2
7081e2ab-31db-41bf-8cbb-ede58b22ee7d	c70a48c9-f35a-42e5-be10-e9325aece631	炭水化物ジエチルエーテルによるソックスレー抽出法	f	3
bb489cfb-3e0b-405b-aefe-b6fde0412f34	c70a48c9-f35a-42e5-be10-e9325aece631	食物繊維プロスキー法	t	4
6050172e-455e-4d54-9ca6-4d225491692e	c70a48c9-f35a-42e5-be10-e9325aece631	ナトリウムケルダール法	f	5
5e55020f-78fc-4a5e-bea0-f3547ef138ca	c6bb2e3e-4e86-43bc-b657-144734695d87	脂質は、補給ができる旨の表示に関する基準値がある。	f	1
eaf540fc-1570-4a3e-818a-2cc6beca8eed	c6bb2e3e-4e86-43bc-b657-144734695d87	不飽和脂肪酸の量は、表示が推奨されている。	f	2
c6b9793a-7e1d-445a-ad92-bf242c8e0a64	c6bb2e3e-4e86-43bc-b657-144734695d87	食塩を使用していない場合は、ナトリウムの含有量にかかわらず食塩相当量 を「0」と表示できる。	f	3
0705ea60-9ecf-42cd-ab13-34bb3b18d38e	c6bb2e3e-4e86-43bc-b657-144734695d87	「甘さひかえめ」は、糖類が低減された旨の表示ではない。	t	4
9d4e53df-d704-43c7-836e-bf813c988789	c6bb2e3e-4e86-43bc-b657-144734695d87	大豆を原材料に含む場合は、アレルゲンとしての表示が義務づけられている。 19	f	5
6c031799-9f0e-4971-bde8-6a04d7c7e068	4cc951e3-ba0f-49a9-862a-ee26b4adcfb6	ビタミン B 1 腸管でのカルシウムの吸収を促進し、骨の形成を助け る栄養素です。	f	1
ffa19e21-3c39-4033-a63c-3667a0711294	4cc951e3-ba0f-49a9-862a-ee26b4adcfb6	ビタミン C 抗酸化作用により、体内の脂質を酸化から守り、細胞 の健康維持を助ける栄養素です。	f	2
b3fb4128-2c0a-45a5-8e50-19a49d06358a	4cc951e3-ba0f-49a9-862a-ee26b4adcfb6	ビタミン D 炭水化物からのエネルギー産生と皮膚や粘膜の健康維 持を助ける栄養素です。	f	3
dfb54d31-95ff-4873-b3f1-70796e2b56fa	4cc951e3-ba0f-49a9-862a-ee26b4adcfb6	ビタミン E 皮膚や粘膜の健康維持を助けるとともに、抗酸化作用 を持つ栄養素です。	f	4
772c5bb3-2222-402c-9d84-15c14d257a68	4cc951e3-ba0f-49a9-862a-ee26b4adcfb6	ビタミン K 正常な血液凝固能を維持する栄養素です。	t	5
e2d6a959-ce83-474f-a7a2-c99baf6260f8	09e25c37-5c85-4263-9ccd-f72ffea16280	授乳婦用に開発された加工食品は、対象に含まれる。	t	1
f8fac3fb-499f-420a-941c-0668ebef3ed5	09e25c37-5c85-4263-9ccd-f72ffea16280	サプリメント形状の加工食品は、対象に含まれる。	f	2
1b46cff4-305d-4c98-8c51-7a8bc8e66475	09e25c37-5c85-4263-9ccd-f72ffea16280	安全性および機能性の根拠に関する情報は、消費者庁のウェブサイトで確認 することができる。	f	3
9d64293a-5968-42a2-8d46-a3a0b413dc34	09e25c37-5c85-4263-9ccd-f72ffea16280	体調に異変を感じた際は、速やかに摂取を中止し、医師に相談する。	f	4
c4636f70-7aa9-408c-b72a-797fd6bfd66c	09e25c37-5c85-4263-9ccd-f72ffea16280	容器包装に、「食生活は、主食、主菜、副菜を基本に、食事のバランスを。」 と表示しなくてはならない。	f	5
c34b3230-9944-460b-8346-a75ead7fc417	80d26701-afdb-4d09-944d-d9cd3852f205	ブランチングは、紅茶製造における茶葉の発酵に用いられる。	f	1
6977133b-9048-428d-8d03-51281928c07c	80d26701-afdb-4d09-944d-d9cd3852f205	電気透析は、食塩の製造に用いられる。	t	2
32a34a3f-1e45-4813-8916-feff18575fa3	80d26701-afdb-4d09-944d-d9cd3852f205	噴霧乾燥は、するめの製造に用いられる。	f	3
1f9928d8-f5ec-4aa1-99a4-5cda66d515cc	80d26701-afdb-4d09-944d-d9cd3852f205	逆浸透は、ビール製造における酵母の除去に用いられる。	f	4
12096a48-5025-4c67-a13e-a7deab74db44	80d26701-afdb-4d09-944d-d9cd3852f205	水素添加は、バターの製造に用いられる。 20	f	5
\.


--
-- Data for Name: profiles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.profiles (id, updated_at, email, role, plan, level, xp, name, created_at, is_pro, avatar_url, hearts, last_heart_regenerated_at) FROM stdin;
3b49f450-4a8e-4c42-849d-4d17f4cf18bc	\N	free@kaneiquest.com	user	free	1	0	\N	2025-12-24 05:56:33.846343+00	f	\N	7	2025-12-27 01:44:18.385663+00
e86eb131-b8c0-4545-95ae-4e471a46e0eb	\N	admin@kaneiquest.com	admin	free	1	0	\N	2025-12-24 05:56:33.846343+00	f	\N	7	2025-12-27 01:44:18.385663+00
aa5af9ff-5511-4b63-84e0-5fe48a4c1f6e	\N	pro@kaneiquest.com	user	pro	1	80	\N	2025-12-24 05:56:33.846343+00	f	\N	7	2025-12-27 01:44:18.385663+00
e6f91dd5-c493-4cc1-81f0-5a385ac79ddf	\N	toshitachi.0001@gmail.com	user	free	1	60	トシキ	2025-12-24 05:56:33.846343+00	f	\N	7	2026-01-01 06:41:20.905+00
\.


--
-- Data for Name: question_attempts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.question_attempts (id, user_id, question_id, attempt_id, option_id, is_correct, created_at) FROM stdin;
e2293d46-fb33-4c28-8f29-852c63096ed7	e6f91dd5-c493-4cc1-81f0-5a385ac79ddf	54260d54-7b68-4a2c-a3e9-d8abeb9b7cee	cf5375d0-0cb1-41a5-a167-733d06b9630f	6b3a55df-ccd1-4fa2-9014-987f59ccc6ef	f	2026-01-01 06:26:26.6166+00
e9f7d3cd-8f38-4855-8faf-87656789833a	e6f91dd5-c493-4cc1-81f0-5a385ac79ddf	4191e2e7-5081-4591-bde1-20b34401158a	cf5375d0-0cb1-41a5-a167-733d06b9630f	2c1dd852-4916-4479-aea8-5c23bc20209a	f	2026-01-01 06:26:30.264212+00
c0d7232d-9495-4669-ab75-9003c89f0d3b	e6f91dd5-c493-4cc1-81f0-5a385ac79ddf	c1d0c438-5860-4b23-997e-c8bbc999bcff	cf5375d0-0cb1-41a5-a167-733d06b9630f	138ebaa9-b8f8-4522-a240-d72f0fe0ce85	f	2026-01-01 06:26:33.403985+00
45cfb80e-f7c4-4eff-bbda-46a9e59651c5	e6f91dd5-c493-4cc1-81f0-5a385ac79ddf	b20abc83-bf36-4c4e-a8a1-899a26ccc474	cf5375d0-0cb1-41a5-a167-733d06b9630f	e90a4685-7d99-4b0e-b596-a058e5520210	f	2026-01-01 06:26:36.904251+00
329a5961-4881-4d7c-ab46-963249b8f2b4	e6f91dd5-c493-4cc1-81f0-5a385ac79ddf	da3d8592-0748-4c4e-b063-89c0a157d232	cf5375d0-0cb1-41a5-a167-733d06b9630f	688cb79a-5b91-4397-8d79-341fd9b7b947	f	2026-01-01 06:26:41.773602+00
\.


--
-- Data for Name: questions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.questions (id, category_id, content, explanation, image_url, difficulty, question_type, created_at, updated_at, exam_year, question_number) FROM stdin;
54260d54-7b68-4a2c-a3e9-d8abeb9b7cee	f8c8d2ad-31c1-453e-8b00-a3c300bbea26	疾病の自然史と予防手段の適用段階に関する記述である。 最も適当なのはどれか。1つ選べ。	\N	\N	2	multiple_choice	2025-12-25 09:08:02.152345+00	2025-12-25 09:08:02.152345+00	39	1
c1d0c438-5860-4b23-997e-c8bbc999bcff	f8c8d2ad-31c1-453e-8b00-a3c300bbea26	ある地域で採取した水道水の塩化物イオンの濃度は 7.090mg/L（塩素の原子 量 : 35. 45）であった。この水道水の塩化物イオン濃度（mmol/L）として、最も適当 なのはどれか。1つ選べ。	\N	\N	2	multiple_choice	2025-12-25 09:08:02.152345+00	2025-12-25 09:08:02.152345+00	39	2
da3d8592-0748-4c4e-b063-89c0a157d232	f8c8d2ad-31c1-453e-8b00-a3c300bbea26	わが国の国勢調査に関する記述である。最も適当なのはどれか。1つ選べ。	\N	\N	2	multiple_choice	2025-12-25 09:08:02.152345+00	2025-12-25 09:08:02.152345+00	39	3
647bda88-c6a1-4fb5-969e-a276bde8e9be	f8c8d2ad-31c1-453e-8b00-a3c300bbea26	A 地域および B 地域の年齢階級別人口と、基準集団の年齢階級別死亡率を表に 示す。A 地域の死亡数は 12,000 人、B 地域の死亡数は 12,000 人であった。標準化 死亡比は、表中の基準集団を 100 とする。A 地域と B 地域の比較に関して、この 表から読み取れる内容の記述である。最も適当なのはどれか。1つ選べ。 65 歳以上300,000400,000300	\N	\N	2	multiple_choice	2025-12-25 09:08:02.152345+00	2025-12-25 09:08:02.152345+00	39	4
c0d7aafa-fd93-4ec9-bed1-4fa71fa07107	f8c8d2ad-31c1-453e-8b00-a3c300bbea26	集団 A と集団 B のスクリーニング結果を比較した（表）。集団 B の方が高い指標 として、最も適当なのはどれか。1つ選べ。	\N	\N	2	multiple_choice	2025-12-25 09:08:02.152345+00	2025-12-25 09:08:02.152345+00	39	5
eff68343-e98e-4b63-b1d6-d3ac0fc8e936	f8c8d2ad-31c1-453e-8b00-a3c300bbea26	ある食品会社は、食品成分 A に血糖値を下げる機能があるかを確認する研究を 大学に委託し、機能性表示食品として販売することを企画した。人を対象とした研 究を実施する上で、最も適当なのはどれか。1つ選べ。	\N	\N	2	multiple_choice	2025-12-25 09:08:02.152345+00	2025-12-25 09:08:02.152345+00	39	6
c16f2e85-e3fc-439f-b594-258b9e0860a2	f8c8d2ad-31c1-453e-8b00-a3c300bbea26	生活習慣（ライフスタイル）の評価と対策に関する記述である。 最も適当なのはどれか。1つ選べ。	\N	\N	2	multiple_choice	2025-12-25 09:08:02.152345+00	2025-12-25 09:08:02.152345+00	39	7
527aefbf-aa0f-44c9-9e91-ba8fa023f26f	f8c8d2ad-31c1-453e-8b00-a3c300bbea26	「健康づくりのための身体活動・運動ガイド 2023」に関する記述である。 最も適当なのはどれか。1つ選べ。	\N	\N	2	multiple_choice	2025-12-25 09:08:02.152345+00	2025-12-25 09:08:02.152345+00	39	8
6ee2c855-b424-4c5a-9052-b7421d1da018	f8c8d2ad-31c1-453e-8b00-a3c300bbea26	歯科口腔保健および学校保健に関する記述である。 最も適当なのはどれか。1つ選べ。	\N	\N	2	multiple_choice	2025-12-25 09:08:02.152345+00	2025-12-25 09:08:02.152345+00	39	9
1db20b72-881f-43f0-911a-a6493077e5d3	f8c8d2ad-31c1-453e-8b00-a3c300bbea26	健康増進法に基づき市町村が行う、対策型がん検診に関する記述である。 最も適当なのはどれか。1つ選べ。	\N	\N	2	multiple_choice	2025-12-25 09:08:02.152345+00	2025-12-25 09:08:02.152345+00	39	10
a0da28aa-d5bd-4c05-bc6a-5a8f875a73f3	f8c8d2ad-31c1-453e-8b00-a3c300bbea26	地球温暖化に伴い、流行地域の拡大が懸念されている感染症として、最も適当な のはどれか。1つ選べ。	\N	\N	2	multiple_choice	2025-12-25 09:08:55.17273+00	2025-12-25 09:08:55.17273+00	39	11
ed9dca4f-debf-444a-b798-b9e907a23eb0	f8c8d2ad-31c1-453e-8b00-a3c300bbea26	難病の患者に対する医療等に関する法律（難病法）における、難病の定義に関する 記述である。誤っているのはどれか。1つ選べ。	\N	\N	2	multiple_choice	2025-12-25 09:08:55.17273+00	2025-12-25 09:08:55.17273+00	39	12
738d6595-8e7c-43b7-83ac-74966451bbfc	f8c8d2ad-31c1-453e-8b00-a3c300bbea26	わが国の社会保障制度を構成するもののうち、生活保護が該当するものとして、 最も適当なのはどれか。1つ選べ。	\N	\N	2	multiple_choice	2025-12-25 09:08:55.17273+00	2025-12-25 09:08:55.17273+00	39	13
5db3c62a-3baa-40a1-8320-7e91a680fa24	f8c8d2ad-31c1-453e-8b00-a3c300bbea26	市町村保健センターに関する記述である。最も適当なのはどれか。1つ選べ。	\N	\N	2	multiple_choice	2025-12-25 09:08:55.17273+00	2025-12-25 09:08:55.17273+00	39	14
9c0e9b3b-a83e-454a-a8ca-f0b0e1f7cee8	f8c8d2ad-31c1-453e-8b00-a3c300bbea26	特定健康診査・特定保健指導に関する記述である。 最も適当なのはどれか。1つ選べ。	\N	\N	2	multiple_choice	2025-12-25 09:08:55.17273+00	2025-12-25 09:08:55.17273+00	39	15
83345644-10be-4680-a7ea-b9a9001cb528	f8c8d2ad-31c1-453e-8b00-a3c300bbea26	高齢者の介護に関する記述である。最も適当なのはどれか。1つ選べ。	\N	\N	2	multiple_choice	2025-12-25 09:08:55.17273+00	2025-12-25 09:08:55.17273+00	39	16
09868cfe-c3dd-4130-8f95-4abccc183334	09bec7da-f775-4c39-af84-db223f99e8d9	人体を構成する細胞に関する記述である。最も適当なのはどれか。1つ選べ。	\N	\N	2	multiple_choice	2025-12-25 09:08:55.17273+00	2025-12-25 09:08:55.17273+00	39	17
3623d8f1-fc81-4dc7-af6e-23385e7579c2	09bec7da-f775-4c39-af84-db223f99e8d9	アミノ酸・たんぱく質・糖質に関する記述である。 最も適当なのはどれか。1つ選べ。	\N	\N	2	multiple_choice	2025-12-25 09:08:55.17273+00	2025-12-25 09:08:55.17273+00	39	18
203ce4e0-53b0-4375-a37d-062cc521296a	09bec7da-f775-4c39-af84-db223f99e8d9	生体エネルギー源と代謝に関する記述である。 最も適当なのはどれか。1つ選べ。	\N	\N	2	multiple_choice	2025-12-25 09:08:55.17273+00	2025-12-25 09:08:55.17273+00	39	19
14dbf186-0887-4b9f-a4a6-855f693ac19f	09bec7da-f775-4c39-af84-db223f99e8d9	アミノ酸・糖質・脂質の代謝に関する記述である。 最も適当なのはどれか。1つ選べ。	\N	\N	2	multiple_choice	2025-12-25 09:08:55.17273+00	2025-12-25 09:08:55.17273+00	39	20
4191e2e7-5081-4591-bde1-20b34401158a	f8c8d2ad-31c1-453e-8b00-a3c300bbea26	疾病の自然史と予防手段の適用段階に関する記述である。 最も適当なのはどれか。1つ選べ。	\N	\N	2	multiple_choice	2025-12-25 09:10:28.469435+00	2025-12-25 09:10:28.469435+00	39	1
b20abc83-bf36-4c4e-a8a1-899a26ccc474	f8c8d2ad-31c1-453e-8b00-a3c300bbea26	ある地域で採取した水道水の塩化物イオンの濃度は 7.090mg/L（塩素の原子 量 : 35. 45）であった。この水道水の塩化物イオン濃度（mmol/L）として、最も適当 なのはどれか。1つ選べ。	\N	\N	2	multiple_choice	2025-12-25 09:10:28.469435+00	2025-12-25 09:10:28.469435+00	39	2
4f7452b1-3b4a-4dc6-a444-6fdf0c615bba	f8c8d2ad-31c1-453e-8b00-a3c300bbea26	わが国の国勢調査に関する記述である。最も適当なのはどれか。1つ選べ。	\N	\N	2	multiple_choice	2025-12-25 09:10:28.469435+00	2025-12-25 09:10:28.469435+00	39	3
1bfcf8d2-79a8-4496-b3c1-afc8a985b27e	f8c8d2ad-31c1-453e-8b00-a3c300bbea26	A 地域および B 地域の年齢階級別人口と、基準集団の年齢階級別死亡率を表に 示す。A 地域の死亡数は 12,000 人、B 地域の死亡数は 12,000 人であった。標準化 死亡比は、表中の基準集団を 100 とする。A 地域と B 地域の比較に関して、この 表から読み取れる内容の記述である。最も適当なのはどれか。1つ選べ。 65 歳以上300,000400,000300	\N	\N	2	multiple_choice	2025-12-25 09:10:28.469435+00	2025-12-25 09:10:28.469435+00	39	4
c52411af-37aa-42c4-aaa2-97e25d035aa0	f8c8d2ad-31c1-453e-8b00-a3c300bbea26	集団 A と集団 B のスクリーニング結果を比較した（表）。集団 B の方が高い指標 として、最も適当なのはどれか。1つ選べ。	\N	\N	2	multiple_choice	2025-12-25 09:10:28.469435+00	2025-12-25 09:10:28.469435+00	39	5
b047b4a4-887c-4dbc-987a-d91e88b838fa	f8c8d2ad-31c1-453e-8b00-a3c300bbea26	ある食品会社は、食品成分 A に血糖値を下げる機能があるかを確認する研究を 大学に委託し、機能性表示食品として販売することを企画した。人を対象とした研 究を実施する上で、最も適当なのはどれか。1つ選べ。	\N	\N	2	multiple_choice	2025-12-25 09:10:28.469435+00	2025-12-25 09:10:28.469435+00	39	6
ffcf4e4f-ce6c-4bb9-9e58-ec5d5f6a40c6	f8c8d2ad-31c1-453e-8b00-a3c300bbea26	生活習慣（ライフスタイル）の評価と対策に関する記述である。 最も適当なのはどれか。1つ選べ。	\N	\N	2	multiple_choice	2025-12-25 09:10:28.469435+00	2025-12-25 09:10:28.469435+00	39	7
da76dc57-a0ea-44de-9b6d-fdc4d0c39d14	f8c8d2ad-31c1-453e-8b00-a3c300bbea26	「健康づくりのための身体活動・運動ガイド 2023」に関する記述である。 最も適当なのはどれか。1つ選べ。	\N	\N	2	multiple_choice	2025-12-25 09:10:28.469435+00	2025-12-25 09:10:28.469435+00	39	8
202c6f1e-85de-4e47-97a9-6b2a5bdb8f79	f8c8d2ad-31c1-453e-8b00-a3c300bbea26	歯科口腔保健および学校保健に関する記述である。 最も適当なのはどれか。1つ選べ。	\N	\N	2	multiple_choice	2025-12-25 09:10:28.469435+00	2025-12-25 09:10:28.469435+00	39	9
3d759f34-f5d3-494d-be2a-0add50158a1b	f8c8d2ad-31c1-453e-8b00-a3c300bbea26	健康増進法に基づき市町村が行う、対策型がん検診に関する記述である。 最も適当なのはどれか。1つ選べ。	\N	\N	2	multiple_choice	2025-12-25 09:10:28.469435+00	2025-12-25 09:10:28.469435+00	39	10
81a76e5c-c830-4d40-b14c-c9beb00d5ce8	f8c8d2ad-31c1-453e-8b00-a3c300bbea26	地球温暖化に伴い、流行地域の拡大が懸念されている感染症として、最も適当な のはどれか。1つ選べ。	\N	\N	2	multiple_choice	2025-12-25 09:10:29.194975+00	2025-12-25 09:10:29.194975+00	39	11
715abb18-5fce-4563-8f87-f52d3b19043a	f8c8d2ad-31c1-453e-8b00-a3c300bbea26	難病の患者に対する医療等に関する法律（難病法）における、難病の定義に関する 記述である。誤っているのはどれか。1つ選べ。	\N	\N	2	multiple_choice	2025-12-25 09:10:29.194975+00	2025-12-25 09:10:29.194975+00	39	12
2e5d0f70-d06a-4752-ade0-da981e77cf4f	f8c8d2ad-31c1-453e-8b00-a3c300bbea26	わが国の社会保障制度を構成するもののうち、生活保護が該当するものとして、 最も適当なのはどれか。1つ選べ。	\N	\N	2	multiple_choice	2025-12-25 09:10:29.194975+00	2025-12-25 09:10:29.194975+00	39	13
489f66e6-113a-4552-9630-d33aa4192414	f8c8d2ad-31c1-453e-8b00-a3c300bbea26	市町村保健センターに関する記述である。最も適当なのはどれか。1つ選べ。	\N	\N	2	multiple_choice	2025-12-25 09:10:29.194975+00	2025-12-25 09:10:29.194975+00	39	14
d631148c-8066-414d-9d8f-c49d8aab6f0f	f8c8d2ad-31c1-453e-8b00-a3c300bbea26	特定健康診査・特定保健指導に関する記述である。 最も適当なのはどれか。1つ選べ。	\N	\N	2	multiple_choice	2025-12-25 09:10:29.194975+00	2025-12-25 09:10:29.194975+00	39	15
73e68e5d-f28a-4c52-83b7-9c9472d4e85c	f8c8d2ad-31c1-453e-8b00-a3c300bbea26	高齢者の介護に関する記述である。最も適当なのはどれか。1つ選べ。	\N	\N	2	multiple_choice	2025-12-25 09:10:29.194975+00	2025-12-25 09:10:29.194975+00	39	16
84623e9a-d156-475c-8644-6d95a3149e22	09bec7da-f775-4c39-af84-db223f99e8d9	人体を構成する細胞に関する記述である。最も適当なのはどれか。1つ選べ。	\N	\N	2	multiple_choice	2025-12-25 09:10:29.194975+00	2025-12-25 09:10:29.194975+00	39	17
db3a6010-e06b-42ca-8d50-56a28e23aef7	09bec7da-f775-4c39-af84-db223f99e8d9	アミノ酸・たんぱく質・糖質に関する記述である。 最も適当なのはどれか。1つ選べ。	\N	\N	2	multiple_choice	2025-12-25 09:10:29.194975+00	2025-12-25 09:10:29.194975+00	39	18
2c4cc6f1-2389-4cde-a8c8-9cf9b5904669	09bec7da-f775-4c39-af84-db223f99e8d9	生体エネルギー源と代謝に関する記述である。 最も適当なのはどれか。1つ選べ。	\N	\N	2	multiple_choice	2025-12-25 09:10:29.194975+00	2025-12-25 09:10:29.194975+00	39	19
35055d3d-6e04-4f77-a2aa-43f2daba486b	09bec7da-f775-4c39-af84-db223f99e8d9	アミノ酸・糖質・脂質の代謝に関する記述である。 最も適当なのはどれか。1つ選べ。	\N	\N	2	multiple_choice	2025-12-25 09:10:29.194975+00	2025-12-25 09:10:29.194975+00	39	20
aaa2dde6-5876-4951-ad2b-5fe9e54c855f	09bec7da-f775-4c39-af84-db223f99e8d9	酸塩基平衡に関する記述である。最も適当なのはどれか。1つ選べ。	\N	\N	2	multiple_choice	2025-12-25 09:11:34.055595+00	2025-12-25 09:11:34.055595+00	39	21
29c35e0c-f09c-4ee3-ba52-36d8708b6fb0	09bec7da-f775-4c39-af84-db223f99e8d9	加齢・疾患に伴う変化に関する記述である。最も適当なのはどれか。1つ選べ。	\N	\N	2	multiple_choice	2025-12-25 09:11:34.055595+00	2025-12-25 09:11:34.055595+00	39	22
35e4126d-3fa9-4754-9f34-99afce2f48c5	09bec7da-f775-4c39-af84-db223f99e8d9	臨床検査に関する記述である。最も適当なのはどれか。1つ選べ。	\N	\N	2	multiple_choice	2025-12-25 09:11:34.055595+00	2025-12-25 09:11:34.055595+00	39	23
0d3c9d54-c77b-49ec-b6c5-e85c5fa5e65f	09bec7da-f775-4c39-af84-db223f99e8d9	治療に関する記述である。最も適当なのはどれか。1つ選べ。	\N	\N	2	multiple_choice	2025-12-25 09:11:34.055595+00	2025-12-25 09:11:34.055595+00	39	24
5a8700e8-fd6b-46fc-bc0d-2128284ecca2	09bec7da-f775-4c39-af84-db223f99e8d9	脂質代謝に関する記述である。最も適当なのはどれか。1つ選べ。	\N	\N	2	multiple_choice	2025-12-25 09:11:34.055595+00	2025-12-25 09:11:34.055595+00	39	25
32c48180-1086-410b-8ef1-26d9f80752f3	09bec7da-f775-4c39-af84-db223f99e8d9	消化器系の構造と機能に関する記述である。最も適当なのはどれか。1つ選べ。	\N	\N	2	multiple_choice	2025-12-25 09:11:34.055595+00	2025-12-25 09:11:34.055595+00	39	26
942434e6-c815-4fb5-b55a-cfb30b15a9c6	09bec7da-f775-4c39-af84-db223f99e8d9	肝疾患に関する記述である。最も適当なのはどれか。1つ選べ。	\N	\N	2	multiple_choice	2025-12-25 09:11:34.055595+00	2025-12-25 09:11:34.055595+00	39	27
83f4c68c-1feb-4621-8b69-6118b6af5f20	09bec7da-f775-4c39-af84-db223f99e8d9	循環器系の構造と機能に関する記述である。最も適当なのはどれか。1つ選べ。	\N	\N	2	multiple_choice	2025-12-25 09:11:34.055595+00	2025-12-25 09:11:34.055595+00	39	28
e475b330-fd90-4969-a723-f52d217c0b5e	09bec7da-f775-4c39-af84-db223f99e8d9	循環器疾患に関する記述である。最も適当なのはどれか。1つ選べ。	\N	\N	2	multiple_choice	2025-12-25 09:11:34.055595+00	2025-12-25 09:11:34.055595+00	39	29
ac95c5b0-aa5c-4257-8714-16ca0f1b8ed0	09bec7da-f775-4c39-af84-db223f99e8d9	腎・尿路系の構造と機能に関する記述である。最も適当なのはどれか。1つ選べ。	\N	\N	2	multiple_choice	2025-12-25 09:11:34.055595+00	2025-12-25 09:11:34.055595+00	39	30
3bb5ac4a-7d48-4e6d-8c6b-9d2a1f50a88e	09bec7da-f775-4c39-af84-db223f99e8d9	A 群β溶血性連鎖球菌感染を契機とする急性糸球体腎炎に関する記述である。 最も適当なのはどれか。1つ選べ。	\N	\N	2	multiple_choice	2025-12-25 09:12:02.382593+00	2025-12-25 09:12:02.382593+00	39	31
970d8720-1be9-47eb-acd2-3a45b9ce74b6	09bec7da-f775-4c39-af84-db223f99e8d9	甲状腺・副甲状腺の疾患に関する記述である。最も適当なのはどれか。1つ選べ。	\N	\N	2	multiple_choice	2025-12-25 09:12:02.382593+00	2025-12-25 09:12:02.382593+00	39	32
d0fee863-1e6e-47a1-80f0-fdaf5c895ead	09bec7da-f775-4c39-af84-db223f99e8d9	パーキンソン病に関する記述である。最も適当なのはどれか。1つ選べ。	\N	\N	2	multiple_choice	2025-12-25 09:12:02.382593+00	2025-12-25 09:12:02.382593+00	39	33
f7e4e390-e643-4e55-86c9-37fe625b5ee7	09bec7da-f775-4c39-af84-db223f99e8d9	呼吸器系の構造と機能に関する記述である。最も適当なのはどれか。1つ選べ。	\N	\N	2	multiple_choice	2025-12-25 09:12:02.382593+00	2025-12-25 09:12:02.382593+00	39	34
bca763a3-0fb4-41c5-9af8-728018fbbdc4	09bec7da-f775-4c39-af84-db223f99e8d9	呼吸器疾患に関する記述である。最も適当なのはどれか。1つ選べ。	\N	\N	2	multiple_choice	2025-12-25 09:12:02.382593+00	2025-12-25 09:12:02.382593+00	39	35
b0b15fb8-de69-45ae-b896-72057ff239db	09bec7da-f775-4c39-af84-db223f99e8d9	平滑筋に関する記述である。最も適当なのはどれか。1つ選べ。	\N	\N	2	multiple_choice	2025-12-25 09:12:02.382593+00	2025-12-25 09:12:02.382593+00	39	36
af3be147-8e27-4e2a-bda9-e6c74e949d33	09bec7da-f775-4c39-af84-db223f99e8d9	骨粗鬆症に関する記述である。最も適当なのはどれか。1つ選べ。	\N	\N	2	multiple_choice	2025-12-25 09:12:02.382593+00	2025-12-25 09:12:02.382593+00	39	37
f858328e-1766-4856-92b5-8ed961dc992d	09bec7da-f775-4c39-af84-db223f99e8d9	妊娠糖尿病に関する記述である。最も適当なのはどれか。1つ選べ。	\N	\N	2	multiple_choice	2025-12-25 09:12:02.382593+00	2025-12-25 09:12:02.382593+00	39	38
f1cde9f7-0d1d-47bb-9612-6d4fbcb7da83	09bec7da-f775-4c39-af84-db223f99e8d9	血液系の構造と機能に関する記述である。最も適当なのはどれか。1つ選べ。	\N	\N	2	multiple_choice	2025-12-25 09:12:02.382593+00	2025-12-25 09:12:02.382593+00	39	39
0e693547-56bf-4fb0-a963-d00faf80913c	09bec7da-f775-4c39-af84-db223f99e8d9	血液疾患に関する記述である。最も適当なのはどれか。1つ選べ。	\N	\N	2	multiple_choice	2025-12-25 09:12:02.382593+00	2025-12-25 09:12:02.382593+00	39	40
7582b1ed-2acc-4b84-9660-f42170080d5e	09bec7da-f775-4c39-af84-db223f99e8d9	関節リウマチに関する記述である。最も適当なのはどれか。1つ選べ。	\N	\N	2	multiple_choice	2025-12-25 09:12:31.161975+00	2025-12-25 09:12:31.161975+00	39	41
f0cba206-86d4-47ef-9471-849b22bafcdb	09bec7da-f775-4c39-af84-db223f99e8d9	感染症に関する記述である。最も適当なのはどれか。1つ選べ。	\N	\N	2	multiple_choice	2025-12-25 09:12:31.161975+00	2025-12-25 09:12:31.161975+00	39	42
ffd163c1-6067-4d9d-a7f8-a2cb1a4f35c0	e421604c-b58f-4a5b-a8cc-5c1d81d878d4	野菜類に関する記述である。最も適当なのはどれか。1つ選べ。	\N	\N	2	multiple_choice	2025-12-25 09:12:31.161975+00	2025-12-25 09:12:31.161975+00	39	43
b663ed03-d361-4e39-9e9c-993fcf7caa74	e421604c-b58f-4a5b-a8cc-5c1d81d878d4	きのこ類に関する記述である。最も適当なのはどれか。1つ選べ。	\N	\N	2	multiple_choice	2025-12-25 09:12:31.161975+00	2025-12-25 09:12:31.161975+00	39	44
a13d7a1b-7a08-4429-bf5c-f8c216ef60e9	e421604c-b58f-4a5b-a8cc-5c1d81d878d4	肉類に関する記述である。最も適当なのはどれか。1つ選べ。	\N	\N	2	multiple_choice	2025-12-25 09:12:31.161975+00	2025-12-25 09:12:31.161975+00	39	45
e2059677-3a82-4f6f-a7fb-c80d436e376c	e421604c-b58f-4a5b-a8cc-5c1d81d878d4	油脂類に関する記述である。最も適当なのはどれか。1つ選べ。	\N	\N	2	multiple_choice	2025-12-25 09:12:31.161975+00	2025-12-25 09:12:31.161975+00	39	46
f8cd0b6b-c86f-4591-a090-f8ea2710f4ac	e421604c-b58f-4a5b-a8cc-5c1d81d878d4	精白米の第一制限アミノ酸は、塩基性であり、アミノカルボニル反応が生じやす い。このアミノ酸の構造式として、最も適当なのはどれか。1つ選べ。 (1) (2) (3) (4) O O HO O OH OH OH O H ２ N OH H ２ N NH ２ NH ２ O (5) HO OH OO H ３ C 16	\N	\N	2	multiple_choice	2025-12-25 09:12:31.161975+00	2025-12-25 09:12:31.161975+00	39	47
8280d5b8-bb29-4afa-9831-61d89748d0e8	e421604c-b58f-4a5b-a8cc-5c1d81d878d4	食品の機能性成分には、消化管内で作用する機能（消化管内）と、吸収後に標的組 織で作用する機能（標的組織）とがある。食品成分の三次機能と作用する場所の組合 せとして、最も適当なのはどれか。1つ選べ。	\N	\N	2	multiple_choice	2025-12-25 09:12:31.161975+00	2025-12-25 09:12:31.161975+00	39	48
1535dd34-f264-4dbd-97e2-baf207d8205a	e421604c-b58f-4a5b-a8cc-5c1d81d878d4	特定保健用食品の関与成分による三次機能と作用機序の組合せである。 最も適当なのはどれか。1つ選べ。	\N	\N	2	multiple_choice	2025-12-25 09:12:31.161975+00	2025-12-25 09:12:31.161975+00	39	49
13343b87-69fb-435f-9a03-c8e241c1819f	e421604c-b58f-4a5b-a8cc-5c1d81d878d4	食品の変質に関する記述である。最も適当なのはどれか。1つ選べ。	\N	\N	2	multiple_choice	2025-12-25 09:12:31.161975+00	2025-12-25 09:12:31.161975+00	39	50
a5cd8af7-2ac5-4853-bfb3-87e009e3ef9f	e421604c-b58f-4a5b-a8cc-5c1d81d878d4	自然毒食中毒に関する記述である。最も適当なのはどれか。1つ選べ。	\N	\N	2	multiple_choice	2025-12-25 09:12:31.90921+00	2025-12-25 09:12:31.90921+00	39	51
d098dbf2-7482-4982-92fa-a7b24b6c887a	e421604c-b58f-4a5b-a8cc-5c1d81d878d4	細菌性食中毒及びウイルス性食中毒に関する記述である。 最も適当なのはどれか。1つ選べ。	\N	\N	2	multiple_choice	2025-12-25 09:12:31.90921+00	2025-12-25 09:12:31.90921+00	39	52
54df3f94-4160-4d72-b74e-b52ea4de209c	e421604c-b58f-4a5b-a8cc-5c1d81d878d4	細菌性食中毒の原因菌の学名と主な原因食品の組合せである。 最も適当なのはどれか。1つ選べ。	\N	\N	2	multiple_choice	2025-12-25 09:12:31.90921+00	2025-12-25 09:12:31.90921+00	39	53
81392a3e-328c-4131-b023-f87793759390	e421604c-b58f-4a5b-a8cc-5c1d81d878d4	食品中の有害物質に関する記述である。最も適当なのはどれか。1つ選べ。	\N	\N	2	multiple_choice	2025-12-25 09:12:31.90921+00	2025-12-25 09:12:31.90921+00	39	54
601b36be-4c3b-4730-880e-30986e4d381f	e421604c-b58f-4a5b-a8cc-5c1d81d878d4	食品添加物に関する記述である。最も適当なのはどれか。1つ選べ。	\N	\N	2	multiple_choice	2025-12-25 09:12:31.90921+00	2025-12-25 09:12:31.90921+00	39	55
c70a48c9-f35a-42e5-be10-e9325aece631	e421604c-b58f-4a5b-a8cc-5c1d81d878d4	栄養成分とその分析方法の組合せである。最も適当なのはどれか。1つ選べ。	\N	\N	2	multiple_choice	2025-12-25 09:12:31.90921+00	2025-12-25 09:12:31.90921+00	39	56
c6bb2e3e-4e86-43bc-b657-144734695d87	e421604c-b58f-4a5b-a8cc-5c1d81d878d4	食品表示基準に基づく一般用加工食品の表示に関する記述である。 最も適当なのはどれか。1つ選べ。	\N	\N	2	multiple_choice	2025-12-25 09:12:31.90921+00	2025-12-25 09:12:31.90921+00	39	57
4cc951e3-ba0f-49a9-862a-ee26b4adcfb6	e421604c-b58f-4a5b-a8cc-5c1d81d878d4	栄養機能食品として表示が認められているビタミンと栄養機能表示の組合せであ る。最も適当なのはどれか。1つ選べ。	\N	\N	2	multiple_choice	2025-12-25 09:12:31.90921+00	2025-12-25 09:12:31.90921+00	39	58
09e25c37-5c85-4263-9ccd-f72ffea16280	e421604c-b58f-4a5b-a8cc-5c1d81d878d4	機能性表示食品に関する記述である。誤っているのはどれか。1つ選べ。	\N	\N	2	multiple_choice	2025-12-25 09:12:31.90921+00	2025-12-25 09:12:31.90921+00	39	59
80d26701-afdb-4d09-944d-d9cd3852f205	e421604c-b58f-4a5b-a8cc-5c1d81d878d4	食品の加工法に関する記述である。最も適当なのはどれか。1つ選べ。	\N	\N	2	multiple_choice	2025-12-25 09:12:31.90921+00	2025-12-25 09:12:31.90921+00	39	60
\.


--
-- Data for Name: subscriptions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subscriptions (id, user_id, status, price_id, current_period_end, cancel_at_period_end, created_at) FROM stdin;
\.


--
-- Data for Name: user_answers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_answers (id, attempt_id, question_id, selected_option_id, is_correct, created_at) FROM stdin;
15c16b11-82bf-41c8-a0fc-c00083163f59	6358f127-6a2d-4223-a3e3-e233f9e932ff	54260d54-7b68-4a2c-a3e9-d8abeb9b7cee	6b3a55df-ccd1-4fa2-9014-987f59ccc6ef	f	2025-12-25 09:17:25.425969+00
ff2365d3-c0cd-4939-8929-6e88f7ed9624	6358f127-6a2d-4223-a3e3-e233f9e932ff	527aefbf-aa0f-44c9-9e91-ba8fa023f26f	82692e83-6ff1-458f-8988-7eed24437834	f	2025-12-25 09:17:32.687641+00
0d902657-b997-4806-aabd-b57634fdcaf6	6358f127-6a2d-4223-a3e3-e233f9e932ff	2e5d0f70-d06a-4752-ade0-da981e77cf4f	d547afe6-12b6-4960-9bbf-3f22730c2b42	f	2025-12-25 09:17:37.340476+00
18d11e60-9b9f-4c77-88fa-83af9133e827	6358f127-6a2d-4223-a3e3-e233f9e932ff	83345644-10be-4680-a7ea-b9a9001cb528	fbfb5f15-9023-45de-a089-c9d8fb4c7685	t	2025-12-25 09:17:40.458549+00
cc41b84b-6a42-40b4-9b31-243695694873	6358f127-6a2d-4223-a3e3-e233f9e932ff	647bda88-c6a1-4fb5-969e-a276bde8e9be	ac674fb4-c8a3-410d-9358-f7e19462213f	t	2025-12-25 09:17:43.903512+00
67f2e044-8776-46fc-9208-cc8199334969	6358f127-6a2d-4223-a3e3-e233f9e932ff	1db20b72-881f-43f0-911a-a6493077e5d3	e0575dee-b49f-4554-bcd0-d429cf68531a	t	2025-12-25 09:17:51.643114+00
575e23c5-3a5a-46c5-a3e4-5786a9c11ae1	6358f127-6a2d-4223-a3e3-e233f9e932ff	81a76e5c-c830-4d40-b14c-c9beb00d5ce8	f5ec4563-d3ed-4fd8-b911-a6558aaa6f55	f	2025-12-25 09:17:54.417851+00
bcffd116-560f-417c-b031-47ead04831d6	6358f127-6a2d-4223-a3e3-e233f9e932ff	c1d0c438-5860-4b23-997e-c8bbc999bcff	6e22999b-37c9-4533-b367-b2185fc493fa	f	2025-12-25 09:17:56.838484+00
3c952f17-5f4d-4728-8f91-cb0ee4a24980	6358f127-6a2d-4223-a3e3-e233f9e932ff	32c48180-1086-410b-8ef1-26d9f80752f3	54b7a43d-bedc-4287-900a-26faa583233f	f	2025-12-25 09:17:59.487816+00
59b62d56-0bdd-47ad-b4ea-f1a65bfdc50e	6358f127-6a2d-4223-a3e3-e233f9e932ff	84623e9a-d156-475c-8644-6d95a3149e22	00d71948-ecba-4c14-ace3-3869a7d3c84d	t	2025-12-25 09:18:03.156168+00
e32ce55b-8dda-4d52-bb27-c4adb67e21ce	6358f127-6a2d-4223-a3e3-e233f9e932ff	29c35e0c-f09c-4ee3-ba52-36d8708b6fb0	76751d57-2d73-44ad-a98f-230e29d8eb05	f	2025-12-25 09:18:07.238155+00
1c974a64-a340-4c2e-9c92-4fa941c846d6	6358f127-6a2d-4223-a3e3-e233f9e932ff	db3a6010-e06b-42ca-8d50-56a28e23aef7	14e87085-5113-4718-8e5b-1925b0574caa	f	2025-12-25 09:18:10.504181+00
6cbec2c8-4d59-4e48-90a3-9b8e8e937624	6358f127-6a2d-4223-a3e3-e233f9e932ff	b047b4a4-887c-4dbc-987a-d91e88b838fa	a9c6bfdc-f4f4-491f-9ce5-8d69282aeb44	f	2025-12-25 09:18:13.679837+00
02e4911b-4abe-4299-b773-631960728b4d	6358f127-6a2d-4223-a3e3-e233f9e932ff	eff68343-e98e-4b63-b1d6-d3ac0fc8e936	31377604-db93-4899-bf7f-6271a9c8905a	f	2025-12-25 09:18:15.532701+00
a4738b32-e90d-4909-ab28-53cfcaed68da	6358f127-6a2d-4223-a3e3-e233f9e932ff	942434e6-c815-4fb5-b55a-cfb30b15a9c6	380fafb9-75f4-4cc8-bf73-05c98d4547ed	t	2025-12-25 09:18:17.402611+00
3460ae36-906a-4059-9140-93df0a903724	6358f127-6a2d-4223-a3e3-e233f9e932ff	e475b330-fd90-4969-a723-f52d217c0b5e	44fc5939-99a6-483e-86f4-2b86752c308f	f	2025-12-25 09:18:19.289873+00
2e6899b5-803f-4541-9df9-85f701aed2e3	6358f127-6a2d-4223-a3e3-e233f9e932ff	2c4cc6f1-2389-4cde-a8c8-9cf9b5904669	238db5f6-3d64-4956-8b15-a7337ab20203	t	2025-12-25 09:18:21.194827+00
cd34ff9d-6cb7-4d1e-94cd-304617ecf6c6	6358f127-6a2d-4223-a3e3-e233f9e932ff	35055d3d-6e04-4f77-a2aa-43f2daba486b	e1f8103a-e7eb-4d99-ba11-ef47ca48388e	f	2025-12-25 09:18:23.42897+00
925d639a-85f6-4eb4-bb88-2f398b0f5ed8	6358f127-6a2d-4223-a3e3-e233f9e932ff	c16f2e85-e3fc-439f-b594-258b9e0860a2	67ba87e5-a74e-444b-a177-4ac139d6f24c	f	2025-12-25 09:18:25.470404+00
dfbe77e6-a8e5-43bc-aa36-bfd9144b30c6	6358f127-6a2d-4223-a3e3-e233f9e932ff	83f4c68c-1feb-4621-8b69-6118b6af5f20	de5882d3-0ffe-4a79-b179-c7a21e2be9f4	f	2025-12-25 09:18:28.733662+00
a95005dd-0f56-4bc5-8920-cd1d139aa887	69d30f8e-7f67-4cb8-a1fc-b9578041869c	c0d7aafa-fd93-4ec9-bed1-4fa71fa07107	a2f7eee4-55aa-4ee2-b721-ebf9b7fd965b	f	2025-12-27 01:48:50.285903+00
f35bd337-46d0-4309-9233-5143a14ed324	69d30f8e-7f67-4cb8-a1fc-b9578041869c	1db20b72-881f-43f0-911a-a6493077e5d3	88a2d46c-7fe9-4472-ad23-65c643d1ebe8	f	2025-12-27 01:48:53.770881+00
1b2109f2-9e93-4dcb-b403-33f6497e624a	69d30f8e-7f67-4cb8-a1fc-b9578041869c	29c35e0c-f09c-4ee3-ba52-36d8708b6fb0	36c400ed-08fc-41e1-bad8-2b0ef9d01cc7	f	2025-12-27 01:48:59.432706+00
815f4622-013f-4ec2-a5f3-58ad19fb5f88	69d30f8e-7f67-4cb8-a1fc-b9578041869c	83345644-10be-4680-a7ea-b9a9001cb528	91f09e10-d624-4daa-9c7e-96ae4dcec7b7	f	2025-12-27 01:49:03.561317+00
82411ff9-b7fc-40da-9405-74296498f354	69d30f8e-7f67-4cb8-a1fc-b9578041869c	da76dc57-a0ea-44de-9b6d-fdc4d0c39d14	2227ccef-5943-4f8b-b83c-32ffb645d2e5	t	2025-12-27 01:49:06.886216+00
62364607-d734-44b6-816c-0b935b250739	69d30f8e-7f67-4cb8-a1fc-b9578041869c	54260d54-7b68-4a2c-a3e9-d8abeb9b7cee	88a2d46c-7fe9-4472-ad23-65c643d1ebe8	f	2025-12-27 01:49:10.189781+00
b732066c-12c2-4531-b297-78bd4fde9937	69d30f8e-7f67-4cb8-a1fc-b9578041869c	db3a6010-e06b-42ca-8d50-56a28e23aef7	d02f59cf-70c8-4b1d-abba-917f22821861	t	2025-12-27 01:49:13.305649+00
b541882d-d7c3-44e2-8f33-2b3d60776678	69d30f8e-7f67-4cb8-a1fc-b9578041869c	738d6595-8e7c-43b7-83ac-74966451bbfc	de3d3645-349e-44c4-8ac1-fa53c3effd3a	t	2025-12-27 01:49:16.076281+00
c0726ea9-f564-4d04-872f-9ceedcaca493	69d30f8e-7f67-4cb8-a1fc-b9578041869c	32c48180-1086-410b-8ef1-26d9f80752f3	05b84844-7245-4a49-b389-3b71c3339586	t	2025-12-27 01:49:18.979054+00
e3754438-a2dd-49e2-83bd-eb255b6b9cb6	69d30f8e-7f67-4cb8-a1fc-b9578041869c	b20abc83-bf36-4c4e-a8a1-899a26ccc474	556ec931-9370-404c-9de6-1d0b9cdcd206	f	2025-12-27 01:49:22.20148+00
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.schema_migrations (version, inserted_at) FROM stdin;
20211116024918	2025-12-24 02:54:30
20211116045059	2025-12-24 02:54:30
20211116050929	2025-12-24 02:54:31
20211116051442	2025-12-24 02:54:32
20211116212300	2025-12-24 02:54:32
20211116213355	2025-12-24 02:54:33
20211116213934	2025-12-24 02:54:34
20211116214523	2025-12-24 02:54:35
20211122062447	2025-12-24 02:54:35
20211124070109	2025-12-24 02:54:36
20211202204204	2025-12-24 02:54:36
20211202204605	2025-12-24 02:54:37
20211210212804	2025-12-24 02:54:39
20211228014915	2025-12-24 02:54:40
20220107221237	2025-12-24 02:54:40
20220228202821	2025-12-24 02:54:41
20220312004840	2025-12-24 02:54:41
20220603231003	2025-12-24 02:54:42
20220603232444	2025-12-24 02:54:43
20220615214548	2025-12-24 02:54:44
20220712093339	2025-12-24 02:54:44
20220908172859	2025-12-24 02:54:45
20220916233421	2025-12-24 02:54:45
20230119133233	2025-12-24 02:54:46
20230128025114	2025-12-24 02:54:47
20230128025212	2025-12-24 02:54:48
20230227211149	2025-12-24 02:54:48
20230228184745	2025-12-24 02:54:49
20230308225145	2025-12-24 02:54:49
20230328144023	2025-12-24 02:54:50
20231018144023	2025-12-24 02:54:51
20231204144023	2025-12-24 02:54:52
20231204144024	2025-12-24 02:54:52
20231204144025	2025-12-24 02:54:53
20240108234812	2025-12-24 02:54:53
20240109165339	2025-12-24 02:54:54
20240227174441	2025-12-24 02:54:55
20240311171622	2025-12-24 02:54:56
20240321100241	2025-12-24 02:54:57
20240401105812	2025-12-24 02:54:59
20240418121054	2025-12-24 02:55:00
20240523004032	2025-12-24 02:55:02
20240618124746	2025-12-24 02:55:03
20240801235015	2025-12-24 02:55:03
20240805133720	2025-12-24 02:55:04
20240827160934	2025-12-24 02:55:05
20240919163303	2025-12-24 02:55:05
20240919163305	2025-12-24 02:55:06
20241019105805	2025-12-24 02:55:07
20241030150047	2025-12-24 02:55:09
20241108114728	2025-12-24 02:55:10
20241121104152	2025-12-24 02:55:10
20241130184212	2025-12-24 02:55:11
20241220035512	2025-12-24 02:55:12
20241220123912	2025-12-24 02:55:12
20241224161212	2025-12-24 02:55:13
20250107150512	2025-12-24 02:55:13
20250110162412	2025-12-24 02:55:14
20250123174212	2025-12-24 02:55:15
20250128220012	2025-12-24 02:55:15
20250506224012	2025-12-24 02:55:16
20250523164012	2025-12-24 02:55:16
20250714121412	2025-12-24 02:55:17
20250905041441	2025-12-24 02:55:18
20251103001201	2025-12-24 02:55:18
\.


--
-- Data for Name: subscription; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.subscription (id, subscription_id, entity, filters, claims, created_at) FROM stdin;
\.


--
-- Data for Name: buckets; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.buckets (id, name, owner, created_at, updated_at, public, avif_autodetection, file_size_limit, allowed_mime_types, owner_id, type) FROM stdin;
avatars	avatars	\N	2025-12-27 01:15:53.476922+00	2025-12-27 01:15:53.476922+00	t	f	\N	\N	\N	STANDARD
\.


--
-- Data for Name: buckets_analytics; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.buckets_analytics (name, type, format, created_at, updated_at, id, deleted_at) FROM stdin;
\.


--
-- Data for Name: buckets_vectors; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.buckets_vectors (id, type, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.migrations (id, name, hash, executed_at) FROM stdin;
0	create-migrations-table	e18db593bcde2aca2a408c4d1100f6abba2195df	2025-12-24 02:54:29.779156
1	initialmigration	6ab16121fbaa08bbd11b712d05f358f9b555d777	2025-12-24 02:54:29.833513
2	storage-schema	5c7968fd083fcea04050c1b7f6253c9771b99011	2025-12-24 02:54:29.892013
3	pathtoken-column	2cb1b0004b817b29d5b0a971af16bafeede4b70d	2025-12-24 02:54:29.96786
4	add-migrations-rls	427c5b63fe1c5937495d9c635c263ee7a5905058	2025-12-24 02:54:30.029793
5	add-size-functions	79e081a1455b63666c1294a440f8ad4b1e6a7f84	2025-12-24 02:54:30.034762
6	change-column-name-in-get-size	f93f62afdf6613ee5e7e815b30d02dc990201044	2025-12-24 02:54:30.03949
7	add-rls-to-buckets	e7e7f86adbc51049f341dfe8d30256c1abca17aa	2025-12-24 02:54:30.057082
8	add-public-to-buckets	fd670db39ed65f9d08b01db09d6202503ca2bab3	2025-12-24 02:54:30.061276
9	fix-search-function	3a0af29f42e35a4d101c259ed955b67e1bee6825	2025-12-24 02:54:30.065533
10	search-files-search-function	68dc14822daad0ffac3746a502234f486182ef6e	2025-12-24 02:54:30.070466
11	add-trigger-to-auto-update-updated_at-column	7425bdb14366d1739fa8a18c83100636d74dcaa2	2025-12-24 02:54:30.075933
12	add-automatic-avif-detection-flag	8e92e1266eb29518b6a4c5313ab8f29dd0d08df9	2025-12-24 02:54:30.080818
13	add-bucket-custom-limits	cce962054138135cd9a8c4bcd531598684b25e7d	2025-12-24 02:54:30.085824
14	use-bytes-for-max-size	941c41b346f9802b411f06f30e972ad4744dad27	2025-12-24 02:54:30.090287
15	add-can-insert-object-function	934146bc38ead475f4ef4b555c524ee5d66799e5	2025-12-24 02:54:30.144888
16	add-version	76debf38d3fd07dcfc747ca49096457d95b1221b	2025-12-24 02:54:30.19578
17	drop-owner-foreign-key	f1cbb288f1b7a4c1eb8c38504b80ae2a0153d101	2025-12-24 02:54:30.205897
18	add_owner_id_column_deprecate_owner	e7a511b379110b08e2f214be852c35414749fe66	2025-12-24 02:54:30.211056
19	alter-default-value-objects-id	02e5e22a78626187e00d173dc45f58fa66a4f043	2025-12-24 02:54:30.217096
20	list-objects-with-delimiter	cd694ae708e51ba82bf012bba00caf4f3b6393b7	2025-12-24 02:54:30.221394
21	s3-multipart-uploads	8c804d4a566c40cd1e4cc5b3725a664a9303657f	2025-12-24 02:54:30.249981
22	s3-multipart-uploads-big-ints	9737dc258d2397953c9953d9b86920b8be0cdb73	2025-12-24 02:54:30.287442
23	optimize-search-function	9d7e604cddc4b56a5422dc68c9313f4a1b6f132c	2025-12-24 02:54:30.299881
24	operation-function	8312e37c2bf9e76bbe841aa5fda889206d2bf8aa	2025-12-24 02:54:30.304826
25	custom-metadata	d974c6057c3db1c1f847afa0e291e6165693b990	2025-12-24 02:54:30.309717
26	objects-prefixes	ef3f7871121cdc47a65308e6702519e853422ae2	2025-12-24 02:54:30.313892
27	search-v2	33b8f2a7ae53105f028e13e9fcda9dc4f356b4a2	2025-12-24 02:54:30.328255
28	object-bucket-name-sorting	ba85ec41b62c6a30a3f136788227ee47f311c436	2025-12-24 02:54:30.417983
29	create-prefixes	a7b1a22c0dc3ab630e3055bfec7ce7d2045c5b7b	2025-12-24 02:54:30.423248
30	update-object-levels	6c6f6cc9430d570f26284a24cf7b210599032db7	2025-12-24 02:54:30.430073
31	objects-level-index	33f1fef7ec7fea08bb892222f4f0f5d79bab5eb8	2025-12-24 02:54:30.436713
32	backward-compatible-index-on-objects	2d51eeb437a96868b36fcdfb1ddefdf13bef1647	2025-12-24 02:54:30.443109
33	backward-compatible-index-on-prefixes	fe473390e1b8c407434c0e470655945b110507bf	2025-12-24 02:54:30.450331
34	optimize-search-function-v1	82b0e469a00e8ebce495e29bfa70a0797f7ebd2c	2025-12-24 02:54:30.464075
35	add-insert-trigger-prefixes	63bb9fd05deb3dc5e9fa66c83e82b152f0caf589	2025-12-24 02:54:30.520076
36	optimise-existing-functions	81cf92eb0c36612865a18016a38496c530443899	2025-12-24 02:54:30.544572
37	add-bucket-name-length-trigger	3944135b4e3e8b22d6d4cbb568fe3b0b51df15c1	2025-12-24 02:54:30.552133
38	iceberg-catalog-flag-on-buckets	19a8bd89d5dfa69af7f222a46c726b7c41e462c5	2025-12-24 02:54:30.557275
39	add-search-v2-sort-support	39cf7d1e6bf515f4b02e41237aba845a7b492853	2025-12-24 02:54:30.566151
40	fix-prefix-race-conditions-optimized	fd02297e1c67df25a9fc110bf8c8a9af7fb06d1f	2025-12-24 02:54:30.570775
41	add-object-level-update-trigger	44c22478bf01744b2129efc480cd2edc9a7d60e9	2025-12-24 02:54:30.579233
42	rollback-prefix-triggers	f2ab4f526ab7f979541082992593938c05ee4b47	2025-12-24 02:54:30.586243
43	fix-object-level	ab837ad8f1c7d00cc0b7310e989a23388ff29fc6	2025-12-24 02:54:30.592041
44	vector-bucket-type	99c20c0ffd52bb1ff1f32fb992f3b351e3ef8fb3	2025-12-24 02:54:30.59769
45	vector-buckets	049e27196d77a7cb76497a85afae669d8b230953	2025-12-24 02:54:30.602071
46	buckets-objects-grants	fedeb96d60fefd8e02ab3ded9fbde05632f84aed	2025-12-24 02:54:30.613537
47	iceberg-table-metadata	649df56855c24d8b36dd4cc1aeb8251aa9ad42c2	2025-12-24 02:54:30.618346
48	iceberg-catalog-ids	2666dff93346e5d04e0a878416be1d5fec345d6f	2025-12-24 02:54:30.622265
49	buckets-objects-grants-postgres	072b1195d0d5a2f888af6b2302a1938dd94b8b3d	2025-12-24 02:54:30.649326
\.


--
-- Data for Name: objects; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.objects (id, bucket_id, name, owner, created_at, updated_at, last_accessed_at, metadata, version, owner_id, user_metadata, level) FROM stdin;
47ae3f14-fe22-489c-820f-d358e5a89421	avatars	e6f91dd5-c493-4cc1-81f0-5a385ac79ddf/1766799016886.jpg	e6f91dd5-c493-4cc1-81f0-5a385ac79ddf	2025-12-27 01:30:18.417076+00	2025-12-27 01:30:18.417076+00	2025-12-27 01:30:18.417076+00	{"eTag": "\\"9204193266df88b00345f941ddd071de\\"", "size": 450892, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2025-12-27T01:30:19.000Z", "contentLength": 450892, "httpStatusCode": 200}	0cf747ad-f4b7-436a-9e1b-99790e2765e0	e6f91dd5-c493-4cc1-81f0-5a385ac79ddf	{}	2
636d7f16-cdf0-4efd-812a-dd767f920f1f	avatars	e6f91dd5-c493-4cc1-81f0-5a385ac79ddf/1766799025769.jpg	e6f91dd5-c493-4cc1-81f0-5a385ac79ddf	2025-12-27 01:30:26.647923+00	2025-12-27 01:30:26.647923+00	2025-12-27 01:30:26.647923+00	{"eTag": "\\"9204193266df88b00345f941ddd071de\\"", "size": 450892, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2025-12-27T01:30:27.000Z", "contentLength": 450892, "httpStatusCode": 200}	fd5cb0ed-2b58-4d69-81bc-32f28e584a02	e6f91dd5-c493-4cc1-81f0-5a385ac79ddf	{}	2
\.


--
-- Data for Name: prefixes; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.prefixes (bucket_id, name, created_at, updated_at) FROM stdin;
avatars	e6f91dd5-c493-4cc1-81f0-5a385ac79ddf	2025-12-27 01:30:18.417076+00	2025-12-27 01:30:18.417076+00
\.


--
-- Data for Name: s3_multipart_uploads; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.s3_multipart_uploads (id, in_progress_size, upload_signature, bucket_id, key, version, owner_id, created_at, user_metadata) FROM stdin;
\.


--
-- Data for Name: s3_multipart_uploads_parts; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.s3_multipart_uploads_parts (id, upload_id, size, part_number, bucket_id, key, etag, owner_id, version, created_at) FROM stdin;
\.


--
-- Data for Name: vector_indexes; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.vector_indexes (id, name, bucket_id, data_type, dimension, distance_metric, metadata_configuration, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: supabase_migrations; Owner: postgres
--

COPY supabase_migrations.schema_migrations (version, statements, name, created_by, idempotency_key, rollback) FROM stdin;
20251224052804	{"-- Create a table for public profiles\ncreate table profiles (\n  id uuid references auth.users on delete cascade not null primary key,\n  updated_at timestamp with time zone,\n  email text,\n  role text default 'user',\n  plan text default 'free',\n  level integer default 1,\n  xp integer default 0,\n\n  constraint username_length check (char_length(email) >= 3)\n);\n\n-- Set up Row Level Security (RLS)\n-- See https://supabase.com/docs/guides/auth/row-level-security for more details.\nalter table profiles enable row level security;\n\ncreate policy \\"Public profiles are viewable by everyone.\\" on profiles\n  for select using (true);\n\ncreate policy \\"Users can insert their own profile.\\" on profiles\n  for insert with check ((select auth.uid()) = id);\n\ncreate policy \\"Users can update own profile.\\" on profiles\n  for update using ((select auth.uid()) = id);\n\n-- This triggers a function every time a user is created\ncreate function public.handle_new_user()\nreturns trigger as $$\nbegin\n  insert into public.profiles (id, email, role, plan)\n  values (new.id, new.email, 'user', 'free');\n  return new;\nend;\n$$ language plpgsql security definer;\n\ncreate trigger on_auth_user_created\n  after insert on auth.users\n  for each row execute procedure public.handle_new_user();\n"}	create_profiles_table	unboxing.or2871@gmail.com	\N	\N
20251224053720	{"-- Create categories table\ncreate table categories (\n  id uuid default gen_random_uuid() primary key,\n  name text not null unique,\n  description text,\n  image_url text, -- For future UI visuals\n  slug text unique, -- For URL routing e.g. /practice/anatomy\n  \\"order\\" integer default 0,\n  created_at timestamp with time zone default timezone('utc'::text, now()) not null\n);\n\n-- Create questions table\ncreate table questions (\n  id uuid default gen_random_uuid() primary key,\n  category_id uuid references categories(id) on delete cascade not null,\n  content text not null,\n  explanation text,\n  image_url text, -- For questions with images\n  difficulty integer default 1, -- 1: Easy, 2: Medium, 3: Hard (For future adaptive learning)\n  question_type text default 'multiple_choice', -- For future expansion (e.g. text_input)\n  created_at timestamp with time zone default timezone('utc'::text, now()) not null,\n  updated_at timestamp with time zone default timezone('utc'::text, now()) not null\n);\n\n-- Create options table\ncreate table options (\n  id uuid default gen_random_uuid() primary key,\n  question_id uuid references questions(id) on delete cascade not null,\n  content text not null,\n  is_correct boolean default false,\n  \\"order\\" integer default 0\n);\n\n-- Create exam_attempts table (User progress)\ncreate table exam_attempts (\n  id uuid default gen_random_uuid() primary key,\n  user_id uuid references auth.users(id) on delete cascade not null,\n  started_at timestamp with time zone default timezone('utc'::text, now()) not null,\n  completed_at timestamp with time zone,\n  score integer,\n  total_questions integer,\n  is_completed boolean default false\n);\n\n-- Create user_answers table (Detailed answer logs)\ncreate table user_answers (\n  id uuid default gen_random_uuid() primary key,\n  attempt_id uuid references exam_attempts(id) on delete cascade not null,\n  question_id uuid references questions(id) on delete cascade not null,\n  selected_option_id uuid references options(id) on delete set null,\n  is_correct boolean,\n  created_at timestamp with time zone default timezone('utc'::text, now()) not null\n);\n\n-- RLS Policies\nalter table categories enable row level security;\nalter table questions enable row level security;\nalter table options enable row level security;\nalter table exam_attempts enable row level security;\nalter table user_answers enable row level security;\n\n-- Read access (Public/Authenticated)\ncreate policy \\"Categories are viewable by everyone.\\" on categories for select using (true);\ncreate policy \\"Questions are viewable by authenticated users.\\" on questions for select using (auth.role() = 'authenticated');\ncreate policy \\"Options are viewable by authenticated users.\\" on options for select using (auth.role() = 'authenticated');\n\n-- Write access (Admins only for content)\n-- Note: Assuming we verify role='admin' in application logic or via a custom claim. \n-- For simplicity in RLS for now: authenticated users read only, we will enforce write in API or specific admin policy later.\n-- Ideally we use a persistent role in JWT or check profiles table.\n-- Checking profiles table in RLS can be expensive, so we'll stick to basic RLS and enforce Admin UI protection.\n-- BUT, for 'exam_attempts', users must write their own.\n\ncreate policy \\"Users can insert own attempts.\\" on exam_attempts for insert with check (auth.uid() = user_id);\ncreate policy \\"Users can update own attempts.\\" on exam_attempts for update using (auth.uid() = user_id);\ncreate policy \\"Users can view own attempts.\\" on exam_attempts for select using (auth.uid() = user_id);\n\ncreate policy \\"Users can insert own answers.\\" on user_answers for insert with check (\n  exists (select 1 from exam_attempts where id = attempt_id and user_id = auth.uid())\n);\ncreate policy \\"Users can view own answers.\\" on user_answers for select using (\n  exists (select 1 from exam_attempts where id = attempt_id and user_id = auth.uid())\n);\n"}	create_quiz_tables	unboxing.or2871@gmail.com	\N	\N
20251224054835	{"-- Enable RLS for admins on content tables\n\n-- Questions\ncreate policy \\"Admins can insert questions\\" on questions for insert\nwith check (\n  exists (select 1 from profiles where id = auth.uid() and role = 'admin')\n);\n\ncreate policy \\"Admins can update questions\\" on questions for update\nusing (\n  exists (select 1 from profiles where id = auth.uid() and role = 'admin')\n);\n\ncreate policy \\"Admins can delete questions\\" on questions for delete\nusing (\n  exists (select 1 from profiles where id = auth.uid() and role = 'admin')\n);\n\n-- Options\ncreate policy \\"Admins can insert options\\" on options for insert\nwith check (\n  exists (select 1 from profiles where id = auth.uid() and role = 'admin')\n);\n\ncreate policy \\"Admins can update options\\" on options for update\nusing (\n  exists (select 1 from profiles where id = auth.uid() and role = 'admin')\n);\n\ncreate policy \\"Admins can delete options\\" on options for delete\nusing (\n  exists (select 1 from profiles where id = auth.uid() and role = 'admin')\n);\n\n-- Categories (Just in case we add management UI later)\ncreate policy \\"Admins can insert categories\\" on categories for insert\nwith check (\n  exists (select 1 from profiles where id = auth.uid() and role = 'admin')\n);\n\ncreate policy \\"Admins can update categories\\" on categories for update\nusing (\n  exists (select 1 from profiles where id = auth.uid() and role = 'admin')\n);\n"}	fix_admin_rls_policies	unboxing.or2871@gmail.com	\N	\N
20251224055433	{"-- Add name column to profiles\nalter table profiles add column if not exists name text;\n\n-- Update handle_new_user function\ncreate or replace function public.handle_new_user()\nreturns trigger as $$\nbegin\n  insert into public.profiles (id, email, name, role, plan, level, xp)\n  values (\n    new.id,\n    new.email,\n    new.raw_user_meta_data->>'name', -- Extract name from metadata\n    'user',\n    'free',\n    1,\n    0\n  );\n  return new;\nend;\n$$ language plpgsql security definer;\n"}	add_profile_name_and_update_trigger	unboxing.or2871@gmail.com	\N	\N
20251224055633	{"alter table profiles add column if not exists created_at timestamptz default now();\n\n-- Backfill created_at from updated_at or just current timestamp for existing\nupdate profiles set created_at = updated_at where created_at is null;\n"}	add_created_at_to_profiles	unboxing.or2871@gmail.com	\N	\N
20251224060259	{"create policy \\"Admins can update all profiles\\" on profiles for update\nusing (\n  exists (select 1 from profiles where id = auth.uid() and role = 'admin')\n);\n"}	allow_admin_update_profiles	unboxing.or2871@gmail.com	\N	\N
20251224061241	{"create table if not exists app_settings (\n    key text primary key,\n    value jsonb not null,\n    description text,\n    updated_at timestamptz default now(),\n    updated_by uuid references profiles(id)\n);\n\n-- RLS\nalter table app_settings enable row level security;\n\n-- Policies\ncreate policy \\"Everyone can read app_settings\\" on app_settings\n    for select using (true);\n\ncreate policy \\"Admins can update app_settings\\" on app_settings\n    for update using (\n        exists (select 1 from profiles where id = auth.uid() and role = 'admin')\n    );\n\ncreate policy \\"Admins can insert app_settings\\" on app_settings\n    for insert with check (\n        exists (select 1 from profiles where id = auth.uid() and role = 'admin')\n    );\n\n-- Initial Seed\ninsert into app_settings (key, value, description) values\n    ('maintenance_mode', 'false'::jsonb, 'System-wide maintenance mode'),\n    ('announcement', '{\\"message\\": \\"\\", \\"active\\": false}'::jsonb, 'Global announcement banner')\non conflict (key) do nothing;\n"}	create_app_settings_table	unboxing.or2871@gmail.com	\N	\N
20251225061216	{"ALTER TABLE exam_attempts \nADD COLUMN category_id UUID REFERENCES categories(id);"}	add_category_id_to_exam_attempts	unboxing.or2871@gmail.com	\N	\N
20251226143840	{"create table if not exists bookmarks (\n  id uuid default gen_random_uuid() primary key,\n  user_id uuid references auth.users(id) on delete cascade not null,\n  question_id uuid references questions(id) on delete cascade not null,\n  created_at timestamp with time zone default timezone('utc'::text, now()) not null,\n  unique(user_id, question_id)\n);\n\nalter table bookmarks enable row level security;\n\ncreate policy \\"Users can view their own bookmarks\\"\n  on bookmarks for select\n  using (auth.uid() = user_id);\n\ncreate policy \\"Users can create their own bookmarks\\"\n  on bookmarks for insert\n  with check (auth.uid() = user_id);\n\ncreate policy \\"Users can delete their own bookmarks\\"\n  on bookmarks for delete\n  using (auth.uid() = user_id);"}	create_bookmarks_table	unboxing.or2871@gmail.com	\N	\N
20251226145306	{"create table if not exists notifications (\n  id uuid default gen_random_uuid() primary key,\n  user_id uuid references auth.users(id) on delete cascade not null,\n  title text not null,\n  message text not null,\n  type text check (type in ('info', 'success', 'warning', 'achievement')) default 'info',\n  is_read boolean default false,\n  created_at timestamp with time zone default timezone('utc'::text, now()) not null\n);\n\nalter table notifications enable row level security;\n\ncreate policy \\"Users can view their own notifications\\"\n  on notifications for select\n  using (auth.uid() = user_id);\n\ncreate policy \\"Users can update their own notifications\\"\n  on notifications for update\n  using (auth.uid() = user_id);"}	create_notifications_table	unboxing.or2871@gmail.com	\N	\N
20251227014418	{"ALTER TABLE profiles ADD COLUMN hearts INTEGER DEFAULT 7 NOT NULL;\nALTER TABLE profiles ADD COLUMN last_heart_regenerated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL;"}	add_hearts_to_profiles	unboxing.or2871@gmail.com	\N	\N
20251227014814	{"CREATE TABLE heart_logs (\n    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),\n    sender_id UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,\n    receiver_id UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,\n    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL\n);\n\nCREATE INDEX heart_logs_sender_receiver_idx ON heart_logs(sender_id, receiver_id);\nCREATE INDEX heart_logs_created_at_idx ON heart_logs(created_at);"}	create_heart_logs	unboxing.or2871@gmail.com	\N	\N
20251227020516	{"create table if not exists public.question_attempts (\n    id uuid not null default gen_random_uuid(),\n    user_id uuid not null references profiles(id) on delete cascade,\n    question_id uuid not null references questions(id) on delete cascade,\n    attempt_id uuid references exam_attempts(id) on delete set null,\n    option_id uuid references options(id) on delete set null,\n    is_correct boolean not null,\n    created_at timestamp with time zone default timezone('utc'::text, now()) not null,\n    constraint question_attempts_pkey primary key (id)\n);\n\n-- Index for faster lookups on review pages\ncreate index if not exists idx_question_attempts_user_correct on public.question_attempts(user_id, is_correct);\ncreate index if not exists idx_question_attempts_question on public.question_attempts(question_id);\n\n-- RLS Policies\nalter table public.question_attempts enable row level security;\n\ncreate policy \\"Users can view their own attempts\\"\non public.question_attempts for select\nto authenticated\nusing (auth.uid() = user_id);\n\ncreate policy \\"Users can insert their own attempts\\"\non public.question_attempts for insert\nto authenticated\nwith check (auth.uid() = user_id);"}	create_question_attempts_table	unboxing.or2871@gmail.com	\N	\N
20251227020715	{"create or replace view public.latest_question_attempts as\nselect distinct on (user_id, question_id)\n    user_id,\n    question_id,\n    is_correct,\n    created_at\nfrom public.question_attempts\norder by user_id, question_id, created_at desc;\n\n-- Grant access\ngrant select on public.latest_question_attempts to authenticated;\ngrant select on public.latest_question_attempts to service_role;"}	create_latest_attempts_view	unboxing.or2871@gmail.com	\N	\N
20251227020730	{"create or replace view public.latest_question_attempts with (security_invoker = true) as\nselect distinct on (user_id, question_id)\n    user_id,\n    question_id,\n    is_correct,\n    created_at\nfrom public.question_attempts\norder by user_id, question_id, created_at desc;"}	secure_latest_attempts_view	unboxing.or2871@gmail.com	\N	\N
20251227040219	{"-- Create subscriptions table\ncreate table if not exists public.subscriptions (\n  id text not null primary key, -- Stripe Subscription ID\n  user_id uuid references auth.users not null,\n  status text, -- active, trialing, past_due, canceled, etc.\n  price_id text,\n  metadata jsonb,\n  quantity integer,\n  cancel_at_period_end boolean,\n  created_at timestamp with time zone default timezone('utc'::text, now()) not null,\n  current_period_start timestamp with time zone default timezone('utc'::text, now()) not null,\n  current_period_end timestamp with time zone default timezone('utc'::text, now()) not null,\n  ended_at timestamp with time zone default timezone('utc'::text, now()),\n  cancel_at timestamp with time zone default timezone('utc'::text, now()),\n  canceled_at timestamp with time zone default timezone('utc'::text, now()),\n  trial_start timestamp with time zone default timezone('utc'::text, now()),\n  trial_end timestamp with time zone default timezone('utc'::text, now())\n);\n\n-- Enable RLS\nalter table public.subscriptions enable row level security;\n\n-- Policies for subscriptions\ncreate policy \\"Users can view own subscriptions\\" on public.subscriptions\n  for select using (auth.uid() = user_id);\n\n-- Add is_pro column to profiles\nalter table public.profiles add column if not exists is_pro boolean default false;\n"}	create_subscriptions	unboxing.or2871@gmail.com	\N	\N
\.


--
-- Data for Name: secrets; Type: TABLE DATA; Schema: vault; Owner: supabase_admin
--

COPY vault.secrets (id, name, description, secret, key_id, nonce, created_at, updated_at) FROM stdin;
\.


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: supabase_auth_admin
--

SELECT pg_catalog.setval('auth.refresh_tokens_id_seq', 37, true);


--
-- Name: subscription_id_seq; Type: SEQUENCE SET; Schema: realtime; Owner: supabase_admin
--

SELECT pg_catalog.setval('realtime.subscription_id_seq', 1, false);


--
-- Name: mfa_amr_claims amr_id_pk; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT amr_id_pk PRIMARY KEY (id);


--
-- Name: audit_log_entries audit_log_entries_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.audit_log_entries
    ADD CONSTRAINT audit_log_entries_pkey PRIMARY KEY (id);


--
-- Name: flow_state flow_state_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.flow_state
    ADD CONSTRAINT flow_state_pkey PRIMARY KEY (id);


--
-- Name: identities identities_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_pkey PRIMARY KEY (id);


--
-- Name: identities identities_provider_id_provider_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_provider_id_provider_unique UNIQUE (provider_id, provider);


--
-- Name: instances instances_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.instances
    ADD CONSTRAINT instances_pkey PRIMARY KEY (id);


--
-- Name: mfa_amr_claims mfa_amr_claims_session_id_authentication_method_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_authentication_method_pkey UNIQUE (session_id, authentication_method);


--
-- Name: mfa_challenges mfa_challenges_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_pkey PRIMARY KEY (id);


--
-- Name: mfa_factors mfa_factors_last_challenged_at_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_last_challenged_at_key UNIQUE (last_challenged_at);


--
-- Name: mfa_factors mfa_factors_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_pkey PRIMARY KEY (id);


--
-- Name: oauth_authorizations oauth_authorizations_authorization_code_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_authorization_code_key UNIQUE (authorization_code);


--
-- Name: oauth_authorizations oauth_authorizations_authorization_id_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_authorization_id_key UNIQUE (authorization_id);


--
-- Name: oauth_authorizations oauth_authorizations_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_pkey PRIMARY KEY (id);


--
-- Name: oauth_client_states oauth_client_states_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_client_states
    ADD CONSTRAINT oauth_client_states_pkey PRIMARY KEY (id);


--
-- Name: oauth_clients oauth_clients_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_clients
    ADD CONSTRAINT oauth_clients_pkey PRIMARY KEY (id);


--
-- Name: oauth_consents oauth_consents_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_pkey PRIMARY KEY (id);


--
-- Name: oauth_consents oauth_consents_user_client_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_user_client_unique UNIQUE (user_id, client_id);


--
-- Name: one_time_tokens one_time_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_token_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_token_unique UNIQUE (token);


--
-- Name: saml_providers saml_providers_entity_id_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_entity_id_key UNIQUE (entity_id);


--
-- Name: saml_providers saml_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_pkey PRIMARY KEY (id);


--
-- Name: saml_relay_states saml_relay_states_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: sso_domains sso_domains_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_pkey PRIMARY KEY (id);


--
-- Name: sso_providers sso_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_providers
    ADD CONSTRAINT sso_providers_pkey PRIMARY KEY (id);


--
-- Name: users users_phone_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_phone_key UNIQUE (phone);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: app_settings app_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_settings
    ADD CONSTRAINT app_settings_pkey PRIMARY KEY (key);


--
-- Name: bookmarks bookmarks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookmarks
    ADD CONSTRAINT bookmarks_pkey PRIMARY KEY (id);


--
-- Name: bookmarks bookmarks_user_id_question_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookmarks
    ADD CONSTRAINT bookmarks_user_id_question_id_key UNIQUE (user_id, question_id);


--
-- Name: categories categories_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_name_key UNIQUE (name);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: categories categories_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_slug_key UNIQUE (slug);


--
-- Name: exam_attempts exam_attempts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exam_attempts
    ADD CONSTRAINT exam_attempts_pkey PRIMARY KEY (id);


--
-- Name: heart_logs heart_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.heart_logs
    ADD CONSTRAINT heart_logs_pkey PRIMARY KEY (id);


--
-- Name: notifications notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (id);


--
-- Name: options options_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.options
    ADD CONSTRAINT options_pkey PRIMARY KEY (id);


--
-- Name: profiles profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_pkey PRIMARY KEY (id);


--
-- Name: question_attempts question_attempts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.question_attempts
    ADD CONSTRAINT question_attempts_pkey PRIMARY KEY (id);


--
-- Name: questions questions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_pkey PRIMARY KEY (id);


--
-- Name: subscriptions subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriptions
    ADD CONSTRAINT subscriptions_pkey PRIMARY KEY (id);


--
-- Name: user_answers user_answers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_answers
    ADD CONSTRAINT user_answers_pkey PRIMARY KEY (id);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE ONLY realtime.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: subscription pk_subscription; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.subscription
    ADD CONSTRAINT pk_subscription PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: buckets_analytics buckets_analytics_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.buckets_analytics
    ADD CONSTRAINT buckets_analytics_pkey PRIMARY KEY (id);


--
-- Name: buckets buckets_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.buckets
    ADD CONSTRAINT buckets_pkey PRIMARY KEY (id);


--
-- Name: buckets_vectors buckets_vectors_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.buckets_vectors
    ADD CONSTRAINT buckets_vectors_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_name_key; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_name_key UNIQUE (name);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: objects objects_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT objects_pkey PRIMARY KEY (id);


--
-- Name: prefixes prefixes_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.prefixes
    ADD CONSTRAINT prefixes_pkey PRIMARY KEY (bucket_id, level, name);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_pkey PRIMARY KEY (id);


--
-- Name: s3_multipart_uploads s3_multipart_uploads_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_pkey PRIMARY KEY (id);


--
-- Name: vector_indexes vector_indexes_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.vector_indexes
    ADD CONSTRAINT vector_indexes_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_idempotency_key_key; Type: CONSTRAINT; Schema: supabase_migrations; Owner: postgres
--

ALTER TABLE ONLY supabase_migrations.schema_migrations
    ADD CONSTRAINT schema_migrations_idempotency_key_key UNIQUE (idempotency_key);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: supabase_migrations; Owner: postgres
--

ALTER TABLE ONLY supabase_migrations.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: audit_logs_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX audit_logs_instance_id_idx ON auth.audit_log_entries USING btree (instance_id);


--
-- Name: confirmation_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX confirmation_token_idx ON auth.users USING btree (confirmation_token) WHERE ((confirmation_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: email_change_token_current_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX email_change_token_current_idx ON auth.users USING btree (email_change_token_current) WHERE ((email_change_token_current)::text !~ '^[0-9 ]*$'::text);


--
-- Name: email_change_token_new_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX email_change_token_new_idx ON auth.users USING btree (email_change_token_new) WHERE ((email_change_token_new)::text !~ '^[0-9 ]*$'::text);


--
-- Name: factor_id_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX factor_id_created_at_idx ON auth.mfa_factors USING btree (user_id, created_at);


--
-- Name: flow_state_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX flow_state_created_at_idx ON auth.flow_state USING btree (created_at DESC);


--
-- Name: identities_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX identities_email_idx ON auth.identities USING btree (email text_pattern_ops);


--
-- Name: INDEX identities_email_idx; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON INDEX auth.identities_email_idx IS 'Auth: Ensures indexed queries on the email column';


--
-- Name: identities_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX identities_user_id_idx ON auth.identities USING btree (user_id);


--
-- Name: idx_auth_code; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_auth_code ON auth.flow_state USING btree (auth_code);


--
-- Name: idx_oauth_client_states_created_at; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_oauth_client_states_created_at ON auth.oauth_client_states USING btree (created_at);


--
-- Name: idx_user_id_auth_method; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_user_id_auth_method ON auth.flow_state USING btree (user_id, authentication_method);


--
-- Name: mfa_challenge_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX mfa_challenge_created_at_idx ON auth.mfa_challenges USING btree (created_at DESC);


--
-- Name: mfa_factors_user_friendly_name_unique; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX mfa_factors_user_friendly_name_unique ON auth.mfa_factors USING btree (friendly_name, user_id) WHERE (TRIM(BOTH FROM friendly_name) <> ''::text);


--
-- Name: mfa_factors_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX mfa_factors_user_id_idx ON auth.mfa_factors USING btree (user_id);


--
-- Name: oauth_auth_pending_exp_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_auth_pending_exp_idx ON auth.oauth_authorizations USING btree (expires_at) WHERE (status = 'pending'::auth.oauth_authorization_status);


--
-- Name: oauth_clients_deleted_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_clients_deleted_at_idx ON auth.oauth_clients USING btree (deleted_at);


--
-- Name: oauth_consents_active_client_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_consents_active_client_idx ON auth.oauth_consents USING btree (client_id) WHERE (revoked_at IS NULL);


--
-- Name: oauth_consents_active_user_client_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_consents_active_user_client_idx ON auth.oauth_consents USING btree (user_id, client_id) WHERE (revoked_at IS NULL);


--
-- Name: oauth_consents_user_order_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_consents_user_order_idx ON auth.oauth_consents USING btree (user_id, granted_at DESC);


--
-- Name: one_time_tokens_relates_to_hash_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX one_time_tokens_relates_to_hash_idx ON auth.one_time_tokens USING hash (relates_to);


--
-- Name: one_time_tokens_token_hash_hash_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX one_time_tokens_token_hash_hash_idx ON auth.one_time_tokens USING hash (token_hash);


--
-- Name: one_time_tokens_user_id_token_type_key; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX one_time_tokens_user_id_token_type_key ON auth.one_time_tokens USING btree (user_id, token_type);


--
-- Name: reauthentication_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX reauthentication_token_idx ON auth.users USING btree (reauthentication_token) WHERE ((reauthentication_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: recovery_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX recovery_token_idx ON auth.users USING btree (recovery_token) WHERE ((recovery_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: refresh_tokens_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_instance_id_idx ON auth.refresh_tokens USING btree (instance_id);


--
-- Name: refresh_tokens_instance_id_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_instance_id_user_id_idx ON auth.refresh_tokens USING btree (instance_id, user_id);


--
-- Name: refresh_tokens_parent_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_parent_idx ON auth.refresh_tokens USING btree (parent);


--
-- Name: refresh_tokens_session_id_revoked_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_session_id_revoked_idx ON auth.refresh_tokens USING btree (session_id, revoked);


--
-- Name: refresh_tokens_updated_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_updated_at_idx ON auth.refresh_tokens USING btree (updated_at DESC);


--
-- Name: saml_providers_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_providers_sso_provider_id_idx ON auth.saml_providers USING btree (sso_provider_id);


--
-- Name: saml_relay_states_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_created_at_idx ON auth.saml_relay_states USING btree (created_at DESC);


--
-- Name: saml_relay_states_for_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_for_email_idx ON auth.saml_relay_states USING btree (for_email);


--
-- Name: saml_relay_states_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_sso_provider_id_idx ON auth.saml_relay_states USING btree (sso_provider_id);


--
-- Name: sessions_not_after_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_not_after_idx ON auth.sessions USING btree (not_after DESC);


--
-- Name: sessions_oauth_client_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_oauth_client_id_idx ON auth.sessions USING btree (oauth_client_id);


--
-- Name: sessions_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_user_id_idx ON auth.sessions USING btree (user_id);


--
-- Name: sso_domains_domain_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX sso_domains_domain_idx ON auth.sso_domains USING btree (lower(domain));


--
-- Name: sso_domains_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sso_domains_sso_provider_id_idx ON auth.sso_domains USING btree (sso_provider_id);


--
-- Name: sso_providers_resource_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX sso_providers_resource_id_idx ON auth.sso_providers USING btree (lower(resource_id));


--
-- Name: sso_providers_resource_id_pattern_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sso_providers_resource_id_pattern_idx ON auth.sso_providers USING btree (resource_id text_pattern_ops);


--
-- Name: unique_phone_factor_per_user; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX unique_phone_factor_per_user ON auth.mfa_factors USING btree (user_id, phone);


--
-- Name: user_id_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX user_id_created_at_idx ON auth.sessions USING btree (user_id, created_at);


--
-- Name: users_email_partial_key; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX users_email_partial_key ON auth.users USING btree (email) WHERE (is_sso_user = false);


--
-- Name: INDEX users_email_partial_key; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON INDEX auth.users_email_partial_key IS 'Auth: A partial unique index that applies only when is_sso_user is false';


--
-- Name: users_instance_id_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_instance_id_email_idx ON auth.users USING btree (instance_id, lower((email)::text));


--
-- Name: users_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_instance_id_idx ON auth.users USING btree (instance_id);


--
-- Name: users_is_anonymous_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_is_anonymous_idx ON auth.users USING btree (is_anonymous);


--
-- Name: heart_logs_created_at_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX heart_logs_created_at_idx ON public.heart_logs USING btree (created_at);


--
-- Name: heart_logs_sender_receiver_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX heart_logs_sender_receiver_idx ON public.heart_logs USING btree (sender_id, receiver_id);


--
-- Name: idx_question_attempts_question; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_question_attempts_question ON public.question_attempts USING btree (question_id);


--
-- Name: idx_question_attempts_user_correct; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_question_attempts_user_correct ON public.question_attempts USING btree (user_id, is_correct);


--
-- Name: ix_realtime_subscription_entity; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX ix_realtime_subscription_entity ON realtime.subscription USING btree (entity);


--
-- Name: messages_inserted_at_topic_index; Type: INDEX; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE INDEX messages_inserted_at_topic_index ON ONLY realtime.messages USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: subscription_subscription_id_entity_filters_key; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE UNIQUE INDEX subscription_subscription_id_entity_filters_key ON realtime.subscription USING btree (subscription_id, entity, filters);


--
-- Name: bname; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX bname ON storage.buckets USING btree (name);


--
-- Name: bucketid_objname; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX bucketid_objname ON storage.objects USING btree (bucket_id, name);


--
-- Name: buckets_analytics_unique_name_idx; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX buckets_analytics_unique_name_idx ON storage.buckets_analytics USING btree (name) WHERE (deleted_at IS NULL);


--
-- Name: idx_multipart_uploads_list; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_multipart_uploads_list ON storage.s3_multipart_uploads USING btree (bucket_id, key, created_at);


--
-- Name: idx_name_bucket_level_unique; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX idx_name_bucket_level_unique ON storage.objects USING btree (name COLLATE "C", bucket_id, level);


--
-- Name: idx_objects_bucket_id_name; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_objects_bucket_id_name ON storage.objects USING btree (bucket_id, name COLLATE "C");


--
-- Name: idx_objects_lower_name; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_objects_lower_name ON storage.objects USING btree ((path_tokens[level]), lower(name) text_pattern_ops, bucket_id, level);


--
-- Name: idx_prefixes_lower_name; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_prefixes_lower_name ON storage.prefixes USING btree (bucket_id, level, ((string_to_array(name, '/'::text))[level]), lower(name) text_pattern_ops);


--
-- Name: name_prefix_search; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX name_prefix_search ON storage.objects USING btree (name text_pattern_ops);


--
-- Name: objects_bucket_id_level_idx; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX objects_bucket_id_level_idx ON storage.objects USING btree (bucket_id, level, name COLLATE "C");


--
-- Name: vector_indexes_name_bucket_id_idx; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX vector_indexes_name_bucket_id_idx ON storage.vector_indexes USING btree (name, bucket_id);


--
-- Name: users on_auth_user_created; Type: TRIGGER; Schema: auth; Owner: supabase_auth_admin
--

CREATE TRIGGER on_auth_user_created AFTER INSERT ON auth.users FOR EACH ROW EXECUTE FUNCTION public.handle_new_user();


--
-- Name: subscription tr_check_filters; Type: TRIGGER; Schema: realtime; Owner: supabase_admin
--

CREATE TRIGGER tr_check_filters BEFORE INSERT OR UPDATE ON realtime.subscription FOR EACH ROW EXECUTE FUNCTION realtime.subscription_check_filters();


--
-- Name: buckets enforce_bucket_name_length_trigger; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER enforce_bucket_name_length_trigger BEFORE INSERT OR UPDATE OF name ON storage.buckets FOR EACH ROW EXECUTE FUNCTION storage.enforce_bucket_name_length();


--
-- Name: objects objects_delete_delete_prefix; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER objects_delete_delete_prefix AFTER DELETE ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.delete_prefix_hierarchy_trigger();


--
-- Name: objects objects_insert_create_prefix; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER objects_insert_create_prefix BEFORE INSERT ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.objects_insert_prefix_trigger();


--
-- Name: objects objects_update_create_prefix; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER objects_update_create_prefix BEFORE UPDATE ON storage.objects FOR EACH ROW WHEN (((new.name <> old.name) OR (new.bucket_id <> old.bucket_id))) EXECUTE FUNCTION storage.objects_update_prefix_trigger();


--
-- Name: prefixes prefixes_create_hierarchy; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER prefixes_create_hierarchy BEFORE INSERT ON storage.prefixes FOR EACH ROW WHEN ((pg_trigger_depth() < 1)) EXECUTE FUNCTION storage.prefixes_insert_trigger();


--
-- Name: prefixes prefixes_delete_hierarchy; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER prefixes_delete_hierarchy AFTER DELETE ON storage.prefixes FOR EACH ROW EXECUTE FUNCTION storage.delete_prefix_hierarchy_trigger();


--
-- Name: objects update_objects_updated_at; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER update_objects_updated_at BEFORE UPDATE ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.update_updated_at_column();


--
-- Name: identities identities_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: mfa_amr_claims mfa_amr_claims_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- Name: mfa_challenges mfa_challenges_auth_factor_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_auth_factor_id_fkey FOREIGN KEY (factor_id) REFERENCES auth.mfa_factors(id) ON DELETE CASCADE;


--
-- Name: mfa_factors mfa_factors_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: oauth_authorizations oauth_authorizations_client_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_client_id_fkey FOREIGN KEY (client_id) REFERENCES auth.oauth_clients(id) ON DELETE CASCADE;


--
-- Name: oauth_authorizations oauth_authorizations_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: oauth_consents oauth_consents_client_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_client_id_fkey FOREIGN KEY (client_id) REFERENCES auth.oauth_clients(id) ON DELETE CASCADE;


--
-- Name: oauth_consents oauth_consents_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: one_time_tokens one_time_tokens_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: refresh_tokens refresh_tokens_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- Name: saml_providers saml_providers_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: saml_relay_states saml_relay_states_flow_state_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_flow_state_id_fkey FOREIGN KEY (flow_state_id) REFERENCES auth.flow_state(id) ON DELETE CASCADE;


--
-- Name: saml_relay_states saml_relay_states_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: sessions sessions_oauth_client_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_oauth_client_id_fkey FOREIGN KEY (oauth_client_id) REFERENCES auth.oauth_clients(id) ON DELETE CASCADE;


--
-- Name: sessions sessions_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: sso_domains sso_domains_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: app_settings app_settings_updated_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_settings
    ADD CONSTRAINT app_settings_updated_by_fkey FOREIGN KEY (updated_by) REFERENCES public.profiles(id);


--
-- Name: bookmarks bookmarks_question_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookmarks
    ADD CONSTRAINT bookmarks_question_id_fkey FOREIGN KEY (question_id) REFERENCES public.questions(id) ON DELETE CASCADE;


--
-- Name: bookmarks bookmarks_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookmarks
    ADD CONSTRAINT bookmarks_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: exam_attempts exam_attempts_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exam_attempts
    ADD CONSTRAINT exam_attempts_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(id);


--
-- Name: exam_attempts exam_attempts_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exam_attempts
    ADD CONSTRAINT exam_attempts_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: heart_logs heart_logs_receiver_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.heart_logs
    ADD CONSTRAINT heart_logs_receiver_id_fkey FOREIGN KEY (receiver_id) REFERENCES public.profiles(id) ON DELETE CASCADE;


--
-- Name: heart_logs heart_logs_sender_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.heart_logs
    ADD CONSTRAINT heart_logs_sender_id_fkey FOREIGN KEY (sender_id) REFERENCES public.profiles(id) ON DELETE CASCADE;


--
-- Name: notifications notifications_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: options options_question_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.options
    ADD CONSTRAINT options_question_id_fkey FOREIGN KEY (question_id) REFERENCES public.questions(id) ON DELETE CASCADE;


--
-- Name: profiles profiles_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_id_fkey FOREIGN KEY (id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: question_attempts question_attempts_attempt_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.question_attempts
    ADD CONSTRAINT question_attempts_attempt_id_fkey FOREIGN KEY (attempt_id) REFERENCES public.exam_attempts(id) ON DELETE SET NULL;


--
-- Name: question_attempts question_attempts_option_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.question_attempts
    ADD CONSTRAINT question_attempts_option_id_fkey FOREIGN KEY (option_id) REFERENCES public.options(id) ON DELETE SET NULL;


--
-- Name: question_attempts question_attempts_question_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.question_attempts
    ADD CONSTRAINT question_attempts_question_id_fkey FOREIGN KEY (question_id) REFERENCES public.questions(id) ON DELETE CASCADE;


--
-- Name: question_attempts question_attempts_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.question_attempts
    ADD CONSTRAINT question_attempts_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.profiles(id) ON DELETE CASCADE;


--
-- Name: questions questions_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(id) ON DELETE CASCADE;


--
-- Name: subscriptions subscriptions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriptions
    ADD CONSTRAINT subscriptions_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.profiles(id) ON DELETE CASCADE;


--
-- Name: user_answers user_answers_attempt_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_answers
    ADD CONSTRAINT user_answers_attempt_id_fkey FOREIGN KEY (attempt_id) REFERENCES public.exam_attempts(id) ON DELETE CASCADE;


--
-- Name: user_answers user_answers_question_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_answers
    ADD CONSTRAINT user_answers_question_id_fkey FOREIGN KEY (question_id) REFERENCES public.questions(id) ON DELETE CASCADE;


--
-- Name: user_answers user_answers_selected_option_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_answers
    ADD CONSTRAINT user_answers_selected_option_id_fkey FOREIGN KEY (selected_option_id) REFERENCES public.options(id) ON DELETE SET NULL;


--
-- Name: objects objects_bucketId_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT "objects_bucketId_fkey" FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: prefixes prefixes_bucketId_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.prefixes
    ADD CONSTRAINT "prefixes_bucketId_fkey" FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads s3_multipart_uploads_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_upload_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_upload_id_fkey FOREIGN KEY (upload_id) REFERENCES storage.s3_multipart_uploads(id) ON DELETE CASCADE;


--
-- Name: vector_indexes vector_indexes_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.vector_indexes
    ADD CONSTRAINT vector_indexes_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets_vectors(id);


--
-- Name: audit_log_entries; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.audit_log_entries ENABLE ROW LEVEL SECURITY;

--
-- Name: flow_state; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.flow_state ENABLE ROW LEVEL SECURITY;

--
-- Name: identities; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.identities ENABLE ROW LEVEL SECURITY;

--
-- Name: instances; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.instances ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_amr_claims; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_amr_claims ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_challenges; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_challenges ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_factors; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_factors ENABLE ROW LEVEL SECURITY;

--
-- Name: one_time_tokens; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.one_time_tokens ENABLE ROW LEVEL SECURITY;

--
-- Name: refresh_tokens; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.refresh_tokens ENABLE ROW LEVEL SECURITY;

--
-- Name: saml_providers; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.saml_providers ENABLE ROW LEVEL SECURITY;

--
-- Name: saml_relay_states; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.saml_relay_states ENABLE ROW LEVEL SECURITY;

--
-- Name: schema_migrations; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.schema_migrations ENABLE ROW LEVEL SECURITY;

--
-- Name: sessions; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sessions ENABLE ROW LEVEL SECURITY;

--
-- Name: sso_domains; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sso_domains ENABLE ROW LEVEL SECURITY;

--
-- Name: sso_providers; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sso_providers ENABLE ROW LEVEL SECURITY;

--
-- Name: users; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.users ENABLE ROW LEVEL SECURITY;

--
-- Name: options Admins can delete options; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Admins can delete options" ON public.options FOR DELETE USING ((EXISTS ( SELECT 1
   FROM public.profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = 'admin'::text)))));


--
-- Name: questions Admins can delete questions; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Admins can delete questions" ON public.questions FOR DELETE USING ((EXISTS ( SELECT 1
   FROM public.profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = 'admin'::text)))));


--
-- Name: app_settings Admins can insert app_settings; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Admins can insert app_settings" ON public.app_settings FOR INSERT WITH CHECK ((EXISTS ( SELECT 1
   FROM public.profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = 'admin'::text)))));


--
-- Name: categories Admins can insert categories; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Admins can insert categories" ON public.categories FOR INSERT WITH CHECK ((EXISTS ( SELECT 1
   FROM public.profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = 'admin'::text)))));


--
-- Name: options Admins can insert options; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Admins can insert options" ON public.options FOR INSERT WITH CHECK ((EXISTS ( SELECT 1
   FROM public.profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = 'admin'::text)))));


--
-- Name: questions Admins can insert questions; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Admins can insert questions" ON public.questions FOR INSERT WITH CHECK ((EXISTS ( SELECT 1
   FROM public.profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = 'admin'::text)))));


--
-- Name: profiles Admins can update all profiles; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Admins can update all profiles" ON public.profiles FOR UPDATE USING ((EXISTS ( SELECT 1
   FROM public.profiles profiles_1
  WHERE ((profiles_1.id = auth.uid()) AND (profiles_1.role = 'admin'::text)))));


--
-- Name: app_settings Admins can update app_settings; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Admins can update app_settings" ON public.app_settings FOR UPDATE USING ((EXISTS ( SELECT 1
   FROM public.profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = 'admin'::text)))));


--
-- Name: categories Admins can update categories; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Admins can update categories" ON public.categories FOR UPDATE USING ((EXISTS ( SELECT 1
   FROM public.profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = 'admin'::text)))));


--
-- Name: options Admins can update options; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Admins can update options" ON public.options FOR UPDATE USING ((EXISTS ( SELECT 1
   FROM public.profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = 'admin'::text)))));


--
-- Name: questions Admins can update questions; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Admins can update questions" ON public.questions FOR UPDATE USING ((EXISTS ( SELECT 1
   FROM public.profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = 'admin'::text)))));


--
-- Name: categories Categories are viewable by everyone.; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Categories are viewable by everyone." ON public.categories FOR SELECT USING (true);


--
-- Name: app_settings Everyone can read app_settings; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Everyone can read app_settings" ON public.app_settings FOR SELECT USING (true);


--
-- Name: options Options are viewable by authenticated users.; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Options are viewable by authenticated users." ON public.options FOR SELECT USING ((auth.role() = 'authenticated'::text));


--
-- Name: profiles Public profiles are viewable by everyone.; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Public profiles are viewable by everyone." ON public.profiles FOR SELECT USING (true);


--
-- Name: questions Questions are viewable by authenticated users.; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Questions are viewable by authenticated users." ON public.questions FOR SELECT USING ((auth.role() = 'authenticated'::text));


--
-- Name: bookmarks Users can create their own bookmarks; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can create their own bookmarks" ON public.bookmarks FOR INSERT WITH CHECK ((auth.uid() = user_id));


--
-- Name: bookmarks Users can delete their own bookmarks; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can delete their own bookmarks" ON public.bookmarks FOR DELETE USING ((auth.uid() = user_id));


--
-- Name: user_answers Users can insert own answers.; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can insert own answers." ON public.user_answers FOR INSERT WITH CHECK ((EXISTS ( SELECT 1
   FROM public.exam_attempts
  WHERE ((exam_attempts.id = user_answers.attempt_id) AND (exam_attempts.user_id = auth.uid())))));


--
-- Name: exam_attempts Users can insert own attempts.; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can insert own attempts." ON public.exam_attempts FOR INSERT WITH CHECK ((auth.uid() = user_id));


--
-- Name: question_attempts Users can insert their own attempts; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can insert their own attempts" ON public.question_attempts FOR INSERT TO authenticated WITH CHECK ((auth.uid() = user_id));


--
-- Name: profiles Users can insert their own profile.; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can insert their own profile." ON public.profiles FOR INSERT WITH CHECK ((( SELECT auth.uid() AS uid) = id));


--
-- Name: exam_attempts Users can update own attempts.; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can update own attempts." ON public.exam_attempts FOR UPDATE USING ((auth.uid() = user_id));


--
-- Name: profiles Users can update own profile.; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can update own profile." ON public.profiles FOR UPDATE USING ((( SELECT auth.uid() AS uid) = id));


--
-- Name: notifications Users can update their own notifications; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can update their own notifications" ON public.notifications FOR UPDATE USING ((auth.uid() = user_id));


--
-- Name: user_answers Users can view own answers.; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can view own answers." ON public.user_answers FOR SELECT USING ((EXISTS ( SELECT 1
   FROM public.exam_attempts
  WHERE ((exam_attempts.id = user_answers.attempt_id) AND (exam_attempts.user_id = auth.uid())))));


--
-- Name: exam_attempts Users can view own attempts.; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can view own attempts." ON public.exam_attempts FOR SELECT USING ((auth.uid() = user_id));


--
-- Name: subscriptions Users can view own subscription; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can view own subscription" ON public.subscriptions FOR SELECT USING ((auth.uid() = user_id));


--
-- Name: subscriptions Users can view own subscriptions; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can view own subscriptions" ON public.subscriptions FOR SELECT USING ((auth.uid() = user_id));


--
-- Name: question_attempts Users can view their own attempts; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can view their own attempts" ON public.question_attempts FOR SELECT TO authenticated USING ((auth.uid() = user_id));


--
-- Name: bookmarks Users can view their own bookmarks; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can view their own bookmarks" ON public.bookmarks FOR SELECT USING ((auth.uid() = user_id));


--
-- Name: notifications Users can view their own notifications; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can view their own notifications" ON public.notifications FOR SELECT USING ((auth.uid() = user_id));


--
-- Name: app_settings; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.app_settings ENABLE ROW LEVEL SECURITY;

--
-- Name: bookmarks; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.bookmarks ENABLE ROW LEVEL SECURITY;

--
-- Name: categories; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.categories ENABLE ROW LEVEL SECURITY;

--
-- Name: exam_attempts; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.exam_attempts ENABLE ROW LEVEL SECURITY;

--
-- Name: notifications; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.notifications ENABLE ROW LEVEL SECURITY;

--
-- Name: options; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.options ENABLE ROW LEVEL SECURITY;

--
-- Name: profiles; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.profiles ENABLE ROW LEVEL SECURITY;

--
-- Name: question_attempts; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.question_attempts ENABLE ROW LEVEL SECURITY;

--
-- Name: questions; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.questions ENABLE ROW LEVEL SECURITY;

--
-- Name: subscriptions; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.subscriptions ENABLE ROW LEVEL SECURITY;

--
-- Name: user_answers; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.user_answers ENABLE ROW LEVEL SECURITY;

--
-- Name: messages; Type: ROW SECURITY; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE realtime.messages ENABLE ROW LEVEL SECURITY;

--
-- Name: objects Avatar Public Read; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Avatar Public Read" ON storage.objects FOR SELECT USING ((bucket_id = 'avatars'::text));


--
-- Name: objects Avatar Update; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Avatar Update" ON storage.objects FOR UPDATE USING (((bucket_id = 'avatars'::text) AND (auth.role() = 'authenticated'::text)));


--
-- Name: objects Avatar Upload; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Avatar Upload" ON storage.objects FOR INSERT WITH CHECK (((bucket_id = 'avatars'::text) AND (auth.role() = 'authenticated'::text)));


--
-- Name: buckets; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.buckets ENABLE ROW LEVEL SECURITY;

--
-- Name: buckets_analytics; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.buckets_analytics ENABLE ROW LEVEL SECURITY;

--
-- Name: buckets_vectors; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.buckets_vectors ENABLE ROW LEVEL SECURITY;

--
-- Name: migrations; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.migrations ENABLE ROW LEVEL SECURITY;

--
-- Name: objects; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.objects ENABLE ROW LEVEL SECURITY;

--
-- Name: prefixes; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.prefixes ENABLE ROW LEVEL SECURITY;

--
-- Name: s3_multipart_uploads; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.s3_multipart_uploads ENABLE ROW LEVEL SECURITY;

--
-- Name: s3_multipart_uploads_parts; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.s3_multipart_uploads_parts ENABLE ROW LEVEL SECURITY;

--
-- Name: vector_indexes; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.vector_indexes ENABLE ROW LEVEL SECURITY;

--
-- Name: supabase_realtime; Type: PUBLICATION; Schema: -; Owner: postgres
--

CREATE PUBLICATION supabase_realtime WITH (publish = 'insert, update, delete, truncate');


ALTER PUBLICATION supabase_realtime OWNER TO postgres;

--
-- Name: SCHEMA auth; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA auth TO anon;
GRANT USAGE ON SCHEMA auth TO authenticated;
GRANT USAGE ON SCHEMA auth TO service_role;
GRANT ALL ON SCHEMA auth TO supabase_auth_admin;
GRANT ALL ON SCHEMA auth TO dashboard_user;
GRANT USAGE ON SCHEMA auth TO postgres;


--
-- Name: SCHEMA extensions; Type: ACL; Schema: -; Owner: postgres
--

GRANT USAGE ON SCHEMA extensions TO anon;
GRANT USAGE ON SCHEMA extensions TO authenticated;
GRANT USAGE ON SCHEMA extensions TO service_role;
GRANT ALL ON SCHEMA extensions TO dashboard_user;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

GRANT USAGE ON SCHEMA public TO postgres;
GRANT USAGE ON SCHEMA public TO anon;
GRANT USAGE ON SCHEMA public TO authenticated;
GRANT USAGE ON SCHEMA public TO service_role;


--
-- Name: SCHEMA realtime; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA realtime TO postgres;
GRANT USAGE ON SCHEMA realtime TO anon;
GRANT USAGE ON SCHEMA realtime TO authenticated;
GRANT USAGE ON SCHEMA realtime TO service_role;
GRANT ALL ON SCHEMA realtime TO supabase_realtime_admin;


--
-- Name: SCHEMA storage; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA storage TO postgres WITH GRANT OPTION;
GRANT USAGE ON SCHEMA storage TO anon;
GRANT USAGE ON SCHEMA storage TO authenticated;
GRANT USAGE ON SCHEMA storage TO service_role;
GRANT ALL ON SCHEMA storage TO supabase_storage_admin WITH GRANT OPTION;
GRANT ALL ON SCHEMA storage TO dashboard_user;


--
-- Name: SCHEMA vault; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA vault TO postgres WITH GRANT OPTION;
GRANT USAGE ON SCHEMA vault TO service_role;


--
-- Name: FUNCTION email(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.email() TO dashboard_user;


--
-- Name: FUNCTION jwt(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.jwt() TO postgres;
GRANT ALL ON FUNCTION auth.jwt() TO dashboard_user;


--
-- Name: FUNCTION role(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.role() TO dashboard_user;


--
-- Name: FUNCTION uid(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.uid() TO dashboard_user;


--
-- Name: FUNCTION armor(bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.armor(bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.armor(bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.armor(bytea) TO dashboard_user;


--
-- Name: FUNCTION armor(bytea, text[], text[]); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.armor(bytea, text[], text[]) FROM postgres;
GRANT ALL ON FUNCTION extensions.armor(bytea, text[], text[]) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.armor(bytea, text[], text[]) TO dashboard_user;


--
-- Name: FUNCTION crypt(text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.crypt(text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.crypt(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.crypt(text, text) TO dashboard_user;


--
-- Name: FUNCTION dearmor(text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.dearmor(text) FROM postgres;
GRANT ALL ON FUNCTION extensions.dearmor(text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.dearmor(text) TO dashboard_user;


--
-- Name: FUNCTION decrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION decrypt_iv(bytea, bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION digest(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.digest(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.digest(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.digest(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION digest(text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.digest(text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.digest(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.digest(text, text) TO dashboard_user;


--
-- Name: FUNCTION encrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION encrypt_iv(bytea, bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION gen_random_bytes(integer); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_random_bytes(integer) FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_random_bytes(integer) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_random_bytes(integer) TO dashboard_user;


--
-- Name: FUNCTION gen_random_uuid(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_random_uuid() FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_random_uuid() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_random_uuid() TO dashboard_user;


--
-- Name: FUNCTION gen_salt(text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_salt(text) FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_salt(text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_salt(text) TO dashboard_user;


--
-- Name: FUNCTION gen_salt(text, integer); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_salt(text, integer) FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_salt(text, integer) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_salt(text, integer) TO dashboard_user;


--
-- Name: FUNCTION grant_pg_cron_access(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION extensions.grant_pg_cron_access() FROM supabase_admin;
GRANT ALL ON FUNCTION extensions.grant_pg_cron_access() TO supabase_admin WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.grant_pg_cron_access() TO dashboard_user;


--
-- Name: FUNCTION grant_pg_graphql_access(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.grant_pg_graphql_access() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION grant_pg_net_access(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION extensions.grant_pg_net_access() FROM supabase_admin;
GRANT ALL ON FUNCTION extensions.grant_pg_net_access() TO supabase_admin WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.grant_pg_net_access() TO dashboard_user;


--
-- Name: FUNCTION hmac(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.hmac(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.hmac(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.hmac(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION hmac(text, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.hmac(text, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.hmac(text, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.hmac(text, text, text) TO dashboard_user;


--
-- Name: FUNCTION pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT shared_blk_read_time double precision, OUT shared_blk_write_time double precision, OUT local_blk_read_time double precision, OUT local_blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision, OUT jit_deform_count bigint, OUT jit_deform_time double precision, OUT stats_since timestamp with time zone, OUT minmax_stats_since timestamp with time zone); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT shared_blk_read_time double precision, OUT shared_blk_write_time double precision, OUT local_blk_read_time double precision, OUT local_blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision, OUT jit_deform_count bigint, OUT jit_deform_time double precision, OUT stats_since timestamp with time zone, OUT minmax_stats_since timestamp with time zone) FROM postgres;
GRANT ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT shared_blk_read_time double precision, OUT shared_blk_write_time double precision, OUT local_blk_read_time double precision, OUT local_blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision, OUT jit_deform_count bigint, OUT jit_deform_time double precision, OUT stats_since timestamp with time zone, OUT minmax_stats_since timestamp with time zone) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT shared_blk_read_time double precision, OUT shared_blk_write_time double precision, OUT local_blk_read_time double precision, OUT local_blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision, OUT jit_deform_count bigint, OUT jit_deform_time double precision, OUT stats_since timestamp with time zone, OUT minmax_stats_since timestamp with time zone) TO dashboard_user;


--
-- Name: FUNCTION pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) FROM postgres;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) TO dashboard_user;


--
-- Name: FUNCTION pg_stat_statements_reset(userid oid, dbid oid, queryid bigint, minmax_only boolean); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint, minmax_only boolean) FROM postgres;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint, minmax_only boolean) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint, minmax_only boolean) TO dashboard_user;


--
-- Name: FUNCTION pgp_armor_headers(text, OUT key text, OUT value text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) TO dashboard_user;


--
-- Name: FUNCTION pgp_key_id(bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_key_id(bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_key_id(bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_key_id(bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt(text, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt(text, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt_bytea(bytea, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt_bytea(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt(bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt_bytea(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt_bytea(bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt(text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt(text, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt_bytea(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt_bytea(bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgrst_ddl_watch(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgrst_ddl_watch() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgrst_drop_watch(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgrst_drop_watch() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION set_graphql_placeholder(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.set_graphql_placeholder() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION uuid_generate_v1(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v1() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1() TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v1mc(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v1mc() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1mc() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1mc() TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v3(namespace uuid, name text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v4(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v4() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v4() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v4() TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v5(namespace uuid, name text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) TO dashboard_user;


--
-- Name: FUNCTION uuid_nil(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_nil() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_nil() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_nil() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_dns(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_dns() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_dns() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_dns() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_oid(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_oid() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_oid() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_oid() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_url(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_url() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_url() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_url() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_x500(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_x500() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_x500() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_x500() TO dashboard_user;


--
-- Name: FUNCTION graphql("operationName" text, query text, variables jsonb, extensions jsonb); Type: ACL; Schema: graphql_public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO postgres;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO anon;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO authenticated;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO service_role;


--
-- Name: FUNCTION pg_reload_conf(); Type: ACL; Schema: pg_catalog; Owner: supabase_admin
--

GRANT ALL ON FUNCTION pg_catalog.pg_reload_conf() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION get_auth(p_usename text); Type: ACL; Schema: pgbouncer; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION pgbouncer.get_auth(p_usename text) FROM PUBLIC;
GRANT ALL ON FUNCTION pgbouncer.get_auth(p_usename text) TO pgbouncer;


--
-- Name: FUNCTION handle_new_user(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.handle_new_user() TO anon;
GRANT ALL ON FUNCTION public.handle_new_user() TO authenticated;
GRANT ALL ON FUNCTION public.handle_new_user() TO service_role;


--
-- Name: FUNCTION apply_rls(wal jsonb, max_record_bytes integer); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO postgres;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO anon;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO authenticated;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO service_role;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO supabase_realtime_admin;


--
-- Name: FUNCTION broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) TO postgres;
GRANT ALL ON FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) TO dashboard_user;


--
-- Name: FUNCTION build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO postgres;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO anon;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO authenticated;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO service_role;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO supabase_realtime_admin;


--
-- Name: FUNCTION "cast"(val text, type_ regtype); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO postgres;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO dashboard_user;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO anon;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO authenticated;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO service_role;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO supabase_realtime_admin;


--
-- Name: FUNCTION check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO postgres;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO anon;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO authenticated;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO service_role;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO supabase_realtime_admin;


--
-- Name: FUNCTION is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO postgres;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO anon;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO authenticated;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO service_role;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO supabase_realtime_admin;


--
-- Name: FUNCTION list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO postgres;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO anon;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO authenticated;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO service_role;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO supabase_realtime_admin;


--
-- Name: FUNCTION quote_wal2json(entity regclass); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO postgres;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO anon;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO authenticated;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO service_role;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO supabase_realtime_admin;


--
-- Name: FUNCTION send(payload jsonb, event text, topic text, private boolean); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) TO postgres;
GRANT ALL ON FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) TO dashboard_user;


--
-- Name: FUNCTION subscription_check_filters(); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO postgres;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO dashboard_user;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO anon;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO authenticated;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO service_role;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO supabase_realtime_admin;


--
-- Name: FUNCTION to_regrole(role_name text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO postgres;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO anon;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO authenticated;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO service_role;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO supabase_realtime_admin;


--
-- Name: FUNCTION topic(); Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
--

GRANT ALL ON FUNCTION realtime.topic() TO postgres;
GRANT ALL ON FUNCTION realtime.topic() TO dashboard_user;


--
-- Name: FUNCTION _crypto_aead_det_decrypt(message bytea, additional bytea, key_id bigint, context bytea, nonce bytea); Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT ALL ON FUNCTION vault._crypto_aead_det_decrypt(message bytea, additional bytea, key_id bigint, context bytea, nonce bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION vault._crypto_aead_det_decrypt(message bytea, additional bytea, key_id bigint, context bytea, nonce bytea) TO service_role;


--
-- Name: FUNCTION create_secret(new_secret text, new_name text, new_description text, new_key_id uuid); Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT ALL ON FUNCTION vault.create_secret(new_secret text, new_name text, new_description text, new_key_id uuid) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION vault.create_secret(new_secret text, new_name text, new_description text, new_key_id uuid) TO service_role;


--
-- Name: FUNCTION update_secret(secret_id uuid, new_secret text, new_name text, new_description text, new_key_id uuid); Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT ALL ON FUNCTION vault.update_secret(secret_id uuid, new_secret text, new_name text, new_description text, new_key_id uuid) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION vault.update_secret(secret_id uuid, new_secret text, new_name text, new_description text, new_key_id uuid) TO service_role;


--
-- Name: TABLE audit_log_entries; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.audit_log_entries TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.audit_log_entries TO postgres;
GRANT SELECT ON TABLE auth.audit_log_entries TO postgres WITH GRANT OPTION;


--
-- Name: TABLE flow_state; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.flow_state TO postgres;
GRANT SELECT ON TABLE auth.flow_state TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.flow_state TO dashboard_user;


--
-- Name: TABLE identities; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.identities TO postgres;
GRANT SELECT ON TABLE auth.identities TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.identities TO dashboard_user;


--
-- Name: TABLE instances; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.instances TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.instances TO postgres;
GRANT SELECT ON TABLE auth.instances TO postgres WITH GRANT OPTION;


--
-- Name: TABLE mfa_amr_claims; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.mfa_amr_claims TO postgres;
GRANT SELECT ON TABLE auth.mfa_amr_claims TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_amr_claims TO dashboard_user;


--
-- Name: TABLE mfa_challenges; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.mfa_challenges TO postgres;
GRANT SELECT ON TABLE auth.mfa_challenges TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_challenges TO dashboard_user;


--
-- Name: TABLE mfa_factors; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.mfa_factors TO postgres;
GRANT SELECT ON TABLE auth.mfa_factors TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_factors TO dashboard_user;


--
-- Name: TABLE oauth_authorizations; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.oauth_authorizations TO postgres;
GRANT ALL ON TABLE auth.oauth_authorizations TO dashboard_user;


--
-- Name: TABLE oauth_client_states; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.oauth_client_states TO postgres;
GRANT ALL ON TABLE auth.oauth_client_states TO dashboard_user;


--
-- Name: TABLE oauth_clients; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.oauth_clients TO postgres;
GRANT ALL ON TABLE auth.oauth_clients TO dashboard_user;


--
-- Name: TABLE oauth_consents; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.oauth_consents TO postgres;
GRANT ALL ON TABLE auth.oauth_consents TO dashboard_user;


--
-- Name: TABLE one_time_tokens; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.one_time_tokens TO postgres;
GRANT SELECT ON TABLE auth.one_time_tokens TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.one_time_tokens TO dashboard_user;


--
-- Name: TABLE refresh_tokens; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.refresh_tokens TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.refresh_tokens TO postgres;
GRANT SELECT ON TABLE auth.refresh_tokens TO postgres WITH GRANT OPTION;


--
-- Name: SEQUENCE refresh_tokens_id_seq; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON SEQUENCE auth.refresh_tokens_id_seq TO dashboard_user;
GRANT ALL ON SEQUENCE auth.refresh_tokens_id_seq TO postgres;


--
-- Name: TABLE saml_providers; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.saml_providers TO postgres;
GRANT SELECT ON TABLE auth.saml_providers TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.saml_providers TO dashboard_user;


--
-- Name: TABLE saml_relay_states; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.saml_relay_states TO postgres;
GRANT SELECT ON TABLE auth.saml_relay_states TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.saml_relay_states TO dashboard_user;


--
-- Name: TABLE schema_migrations; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT SELECT ON TABLE auth.schema_migrations TO postgres WITH GRANT OPTION;


--
-- Name: TABLE sessions; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.sessions TO postgres;
GRANT SELECT ON TABLE auth.sessions TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sessions TO dashboard_user;


--
-- Name: TABLE sso_domains; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.sso_domains TO postgres;
GRANT SELECT ON TABLE auth.sso_domains TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sso_domains TO dashboard_user;


--
-- Name: TABLE sso_providers; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.sso_providers TO postgres;
GRANT SELECT ON TABLE auth.sso_providers TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sso_providers TO dashboard_user;


--
-- Name: TABLE users; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.users TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.users TO postgres;
GRANT SELECT ON TABLE auth.users TO postgres WITH GRANT OPTION;


--
-- Name: TABLE pg_stat_statements; Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON TABLE extensions.pg_stat_statements FROM postgres;
GRANT ALL ON TABLE extensions.pg_stat_statements TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE extensions.pg_stat_statements TO dashboard_user;


--
-- Name: TABLE pg_stat_statements_info; Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON TABLE extensions.pg_stat_statements_info FROM postgres;
GRANT ALL ON TABLE extensions.pg_stat_statements_info TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE extensions.pg_stat_statements_info TO dashboard_user;


--
-- Name: TABLE app_settings; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.app_settings TO anon;
GRANT ALL ON TABLE public.app_settings TO authenticated;
GRANT ALL ON TABLE public.app_settings TO service_role;


--
-- Name: TABLE bookmarks; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.bookmarks TO anon;
GRANT ALL ON TABLE public.bookmarks TO authenticated;
GRANT ALL ON TABLE public.bookmarks TO service_role;


--
-- Name: TABLE categories; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.categories TO anon;
GRANT ALL ON TABLE public.categories TO authenticated;
GRANT ALL ON TABLE public.categories TO service_role;


--
-- Name: TABLE exam_attempts; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.exam_attempts TO anon;
GRANT ALL ON TABLE public.exam_attempts TO authenticated;
GRANT ALL ON TABLE public.exam_attempts TO service_role;


--
-- Name: TABLE heart_logs; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.heart_logs TO anon;
GRANT ALL ON TABLE public.heart_logs TO authenticated;
GRANT ALL ON TABLE public.heart_logs TO service_role;


--
-- Name: TABLE question_attempts; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.question_attempts TO anon;
GRANT ALL ON TABLE public.question_attempts TO authenticated;
GRANT ALL ON TABLE public.question_attempts TO service_role;


--
-- Name: TABLE latest_question_attempts; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.latest_question_attempts TO anon;
GRANT ALL ON TABLE public.latest_question_attempts TO authenticated;
GRANT ALL ON TABLE public.latest_question_attempts TO service_role;


--
-- Name: TABLE profiles; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.profiles TO anon;
GRANT ALL ON TABLE public.profiles TO authenticated;
GRANT ALL ON TABLE public.profiles TO service_role;


--
-- Name: TABLE leaderboard; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.leaderboard TO anon;
GRANT ALL ON TABLE public.leaderboard TO authenticated;
GRANT ALL ON TABLE public.leaderboard TO service_role;


--
-- Name: TABLE notifications; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.notifications TO anon;
GRANT ALL ON TABLE public.notifications TO authenticated;
GRANT ALL ON TABLE public.notifications TO service_role;


--
-- Name: TABLE options; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.options TO anon;
GRANT ALL ON TABLE public.options TO authenticated;
GRANT ALL ON TABLE public.options TO service_role;


--
-- Name: TABLE questions; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.questions TO anon;
GRANT ALL ON TABLE public.questions TO authenticated;
GRANT ALL ON TABLE public.questions TO service_role;


--
-- Name: TABLE subscriptions; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.subscriptions TO anon;
GRANT ALL ON TABLE public.subscriptions TO authenticated;
GRANT ALL ON TABLE public.subscriptions TO service_role;


--
-- Name: TABLE user_answers; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.user_answers TO anon;
GRANT ALL ON TABLE public.user_answers TO authenticated;
GRANT ALL ON TABLE public.user_answers TO service_role;


--
-- Name: TABLE messages; Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
--

GRANT ALL ON TABLE realtime.messages TO postgres;
GRANT ALL ON TABLE realtime.messages TO dashboard_user;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO anon;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO authenticated;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO service_role;


--
-- Name: TABLE schema_migrations; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.schema_migrations TO postgres;
GRANT ALL ON TABLE realtime.schema_migrations TO dashboard_user;
GRANT SELECT ON TABLE realtime.schema_migrations TO anon;
GRANT SELECT ON TABLE realtime.schema_migrations TO authenticated;
GRANT SELECT ON TABLE realtime.schema_migrations TO service_role;
GRANT ALL ON TABLE realtime.schema_migrations TO supabase_realtime_admin;


--
-- Name: TABLE subscription; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.subscription TO postgres;
GRANT ALL ON TABLE realtime.subscription TO dashboard_user;
GRANT SELECT ON TABLE realtime.subscription TO anon;
GRANT SELECT ON TABLE realtime.subscription TO authenticated;
GRANT SELECT ON TABLE realtime.subscription TO service_role;
GRANT ALL ON TABLE realtime.subscription TO supabase_realtime_admin;


--
-- Name: SEQUENCE subscription_id_seq; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO postgres;
GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO dashboard_user;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO anon;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO authenticated;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO service_role;
GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO supabase_realtime_admin;


--
-- Name: TABLE buckets; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

REVOKE ALL ON TABLE storage.buckets FROM supabase_storage_admin;
GRANT ALL ON TABLE storage.buckets TO supabase_storage_admin WITH GRANT OPTION;
GRANT ALL ON TABLE storage.buckets TO service_role;
GRANT ALL ON TABLE storage.buckets TO authenticated;
GRANT ALL ON TABLE storage.buckets TO anon;
GRANT ALL ON TABLE storage.buckets TO postgres WITH GRANT OPTION;


--
-- Name: TABLE buckets_analytics; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.buckets_analytics TO service_role;
GRANT ALL ON TABLE storage.buckets_analytics TO authenticated;
GRANT ALL ON TABLE storage.buckets_analytics TO anon;


--
-- Name: TABLE buckets_vectors; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT SELECT ON TABLE storage.buckets_vectors TO service_role;
GRANT SELECT ON TABLE storage.buckets_vectors TO authenticated;
GRANT SELECT ON TABLE storage.buckets_vectors TO anon;


--
-- Name: TABLE objects; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

REVOKE ALL ON TABLE storage.objects FROM supabase_storage_admin;
GRANT ALL ON TABLE storage.objects TO supabase_storage_admin WITH GRANT OPTION;
GRANT ALL ON TABLE storage.objects TO service_role;
GRANT ALL ON TABLE storage.objects TO authenticated;
GRANT ALL ON TABLE storage.objects TO anon;
GRANT ALL ON TABLE storage.objects TO postgres WITH GRANT OPTION;


--
-- Name: TABLE prefixes; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.prefixes TO service_role;
GRANT ALL ON TABLE storage.prefixes TO authenticated;
GRANT ALL ON TABLE storage.prefixes TO anon;


--
-- Name: TABLE s3_multipart_uploads; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.s3_multipart_uploads TO service_role;
GRANT SELECT ON TABLE storage.s3_multipart_uploads TO authenticated;
GRANT SELECT ON TABLE storage.s3_multipart_uploads TO anon;


--
-- Name: TABLE s3_multipart_uploads_parts; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.s3_multipart_uploads_parts TO service_role;
GRANT SELECT ON TABLE storage.s3_multipart_uploads_parts TO authenticated;
GRANT SELECT ON TABLE storage.s3_multipart_uploads_parts TO anon;


--
-- Name: TABLE vector_indexes; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT SELECT ON TABLE storage.vector_indexes TO service_role;
GRANT SELECT ON TABLE storage.vector_indexes TO authenticated;
GRANT SELECT ON TABLE storage.vector_indexes TO anon;


--
-- Name: TABLE secrets; Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT SELECT,REFERENCES,DELETE,TRUNCATE ON TABLE vault.secrets TO postgres WITH GRANT OPTION;
GRANT SELECT,DELETE ON TABLE vault.secrets TO service_role;


--
-- Name: TABLE decrypted_secrets; Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT SELECT,REFERENCES,DELETE,TRUNCATE ON TABLE vault.decrypted_secrets TO postgres WITH GRANT OPTION;
GRANT SELECT,DELETE ON TABLE vault.decrypted_secrets TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON TABLES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON SEQUENCES TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON FUNCTIONS TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON TABLES TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON SEQUENCES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON FUNCTIONS TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON TABLES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO service_role;


--
-- Name: issue_graphql_placeholder; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_graphql_placeholder ON sql_drop
         WHEN TAG IN ('DROP EXTENSION')
   EXECUTE FUNCTION extensions.set_graphql_placeholder();


ALTER EVENT TRIGGER issue_graphql_placeholder OWNER TO supabase_admin;

--
-- Name: issue_pg_cron_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_cron_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_cron_access();


ALTER EVENT TRIGGER issue_pg_cron_access OWNER TO supabase_admin;

--
-- Name: issue_pg_graphql_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_graphql_access ON ddl_command_end
         WHEN TAG IN ('CREATE FUNCTION')
   EXECUTE FUNCTION extensions.grant_pg_graphql_access();


ALTER EVENT TRIGGER issue_pg_graphql_access OWNER TO supabase_admin;

--
-- Name: issue_pg_net_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_net_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_net_access();


ALTER EVENT TRIGGER issue_pg_net_access OWNER TO supabase_admin;

--
-- Name: pgrst_ddl_watch; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER pgrst_ddl_watch ON ddl_command_end
   EXECUTE FUNCTION extensions.pgrst_ddl_watch();


ALTER EVENT TRIGGER pgrst_ddl_watch OWNER TO supabase_admin;

--
-- Name: pgrst_drop_watch; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER pgrst_drop_watch ON sql_drop
   EXECUTE FUNCTION extensions.pgrst_drop_watch();


ALTER EVENT TRIGGER pgrst_drop_watch OWNER TO supabase_admin;

--
-- PostgreSQL database dump complete
--

\unrestrict qcN9ImLwPXPXZMY0bxi2R1NHseC6vDdiaGkGRCoPpgMSubOsxRO1d4sY9QJL416

--
-- PostgreSQL database cluster dump complete
--

