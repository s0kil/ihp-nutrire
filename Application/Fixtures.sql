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
    '7a508dfc-0e44-4f4a-82fa-0dd67c4e5700',
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
    'a0fb28d0-68de-44d0-89a0-3f84a826e06b',
    'Daniel Sokil',
    'dtechtours@gmail.com',
    'danielsokil',
    'sha256|17|ZofNa1UXrw4v3sJ9Yj8grA==|nhKWaKjFIDqBHahJMeX1X5njo7gDN1yeAReVxGVNf6s=',
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
    'b44045b6-fc35-44c2-86a5-6c56d85d1272',
    'a0fb28d0-68de-44d0-89a0-3f84a826e06b',
    'French Breakfast',
    'Oh It''s Great!',
    '',
    '2020-12-07 14:40:40.66475-05',
    '7a508dfc-0e44-4f4a-82fa-0dd67c4e5700'
  );
ALTER TABLE public.articles ENABLE TRIGGER ALL;
ALTER TABLE public.votes DISABLE TRIGGER ALL;
ALTER TABLE public.votes ENABLE TRIGGER ALL;
