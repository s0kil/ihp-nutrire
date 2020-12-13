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
INSERT INTO public.categories (id, name, priority, slug)
VALUES (
    '7a9237a9-f731-40f0-8bc4-d5667b227835',
    'Breakfast',
    0,
    'breakfast'
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
    'a9e0ae78-903a-4b67-b5c6-27936de2f45e',
    'ce867693-686f-4c58-a4d2-b761266bd730',
    'French Breakfast',
    'Oh It''s Amazing On The Weekends, Or Any Other Day!',
    '',
    '2020-12-13 12:29:18.500472-05',
    '7a9237a9-f731-40f0-8bc4-d5667b227835'
  );
ALTER TABLE public.articles ENABLE TRIGGER ALL;
ALTER TABLE public.votes DISABLE TRIGGER ALL;
ALTER TABLE public.votes ENABLE TRIGGER ALL;
