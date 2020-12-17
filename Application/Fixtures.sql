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
ALTER TABLE public.categories DISABLE TRIGGER ALL;
INSERT INTO public.categories (id, name, priority)
VALUES (
    '6b8bc3d1-2eeb-47eb-8885-8444a91287e8',
    'Breakfast',
    1
  );
ALTER TABLE public.categories ENABLE TRIGGER ALL;
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
    'ce867693-686f-4c58-a4d2-b761266bd730',
    'Daniel Sokil',
    'dtechtours@gmail.com',
    'danielsokil',
    'sha256|17|q8KCg7jcFXgXvnoksNO+aQ==|QIP3zlgJYCaRDc5incszhqCQ9L0Enee3ruvQDPAv1oQ=',
    NULL,
    0
  );
ALTER TABLE public.users ENABLE TRIGGER ALL;
ALTER TABLE public.articles DISABLE TRIGGER ALL;
INSERT INTO public.articles (
    id,
    user_id,
    title,
    text,
    image,
    created_at,
    category_id
  )
VALUES (
    '4e279ab9-cd04-43ed-b3f3-c7b3f0461a6a',
    'ce867693-686f-4c58-a4d2-b761266bd730',
    'Oh Amazing Breakfast',
    'Blah, Blah.',
    '',
    '2020-12-17 09:56:46.246963-05',
    '6b8bc3d1-2eeb-47eb-8885-8444a91287e8'
  );
ALTER TABLE public.articles ENABLE TRIGGER ALL;
ALTER TABLE public.votes DISABLE TRIGGER ALL;
ALTER TABLE public.votes ENABLE TRIGGER ALL;
