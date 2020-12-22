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
    '304ac067-7962-4ec1-82f2-bbcd76cd64f3',
    'ce867693-686f-4c58-a4d2-b761266bd730',
    'Random Title 0',
    'Random Text 0',
    'https://loremflickr.com/600/600/nutrition?lock=27',
    '2020-12-21 20:53:54.493885-05',
    '6b8bc3d1-2eeb-47eb-8885-8444a91287e8'
  );
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
    '80a7e51b-c7e0-4cda-878e-0879bb6b0943',
    'ce867693-686f-4c58-a4d2-b761266bd730',
    'Random Title 01',
    'Random Text 01',
    'https://loremflickr.com/600/600/nutrition?lock=29',
    '2020-12-21 20:54:06.759308-05',
    '6b8bc3d1-2eeb-47eb-8885-8444a91287e8'
  );
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
    'cbc9c235-b94a-4be7-b90d-d5fc30504f1d',
    'ce867693-686f-4c58-a4d2-b761266bd730',
    'Random Title 012',
    'Random Text 012',
    'https://loremflickr.com/600/600/nutrition?lock=31',
    '2020-12-21 20:54:18.693809-05',
    '6b8bc3d1-2eeb-47eb-8885-8444a91287e8'
  );
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
    '086070ce-c93c-41d5-bf14-b179555f7fa1',
    'ce867693-686f-4c58-a4d2-b761266bd730',
    'Random Title 0123',
    'Random Text 0123',
    'https://loremflickr.com/600/600/nutrition?lock=33',
    '2020-12-21 20:54:30.768547-05',
    '6b8bc3d1-2eeb-47eb-8885-8444a91287e8'
  );
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
    'e9eb15b2-903e-4863-a7ac-b2d810883d7e',
    'ce867693-686f-4c58-a4d2-b761266bd730',
    'Random Title 01234',
    'Random Text 01234',
    'https://loremflickr.com/600/600/nutrition?lock=35',
    '2020-12-21 20:54:45.324728-05',
    '6b8bc3d1-2eeb-47eb-8885-8444a91287e8'
  );
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
    '780411d3-be90-4a96-b1bf-dfe05bbe489f',
    'ce867693-686f-4c58-a4d2-b761266bd730',
    'Random Title 012345',
    'Random Text 012345',
    'https://loremflickr.com/600/600/nutrition?lock=37',
    '2020-12-21 20:54:57.606242-05',
    '6b8bc3d1-2eeb-47eb-8885-8444a91287e8'
  );
ALTER TABLE public.articles ENABLE TRIGGER ALL;
ALTER TABLE public.votes DISABLE TRIGGER ALL;
ALTER TABLE public.votes ENABLE TRIGGER ALL;
