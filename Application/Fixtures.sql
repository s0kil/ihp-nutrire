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
SET SESSION AUTHORIZATION DEFAULT;
ALTER TABLE public.users DISABLE TRIGGER ALL;
INSERT INTO public.users (
    id,
    fullname,
    email,
    username,
    password_hash,
    locked_at,
    failed_login_attempts
  )
VALUES (
    '5c775607-c2a0-4492-bdfe-0b805db51d97',
    'Daniel Sokil',
    'dtechtours@gmail.com',
    's0kil',
    'sha256|17|LmUyyF7qaKb19ts1GwPodg==|InelK+wrcBRIiNbsvRoZ/ai6lmyseYyIUN2/EN8jDEE=',
    NULL,
    0
  );
ALTER TABLE public.users ENABLE TRIGGER ALL;
