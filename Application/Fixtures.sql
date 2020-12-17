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
    '95fdca3a-3670-420e-b7ff-e0b0d4a4f767',
    'ce867693-686f-4c58-a4d2-b761266bd730',
    'Testing Image Default',
    'Alright',
    'https://picsum.photos/seed/testing-image-default/600',
    '2020-12-17 10:48:43.619669-05',
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
    '20fc8c54-20a8-405d-80ea-43a2f5eaa5be',
    'ce867693-686f-4c58-a4d2-b761266bd730',
    'Oh Amazing Breakfast Two',
    'Random 1',
    'https://picsum.photos/seed/oh-amazing-breakfast-two/600',
    '2020-12-17 10:54:40.13003-05',
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
    '8693a153-f0fb-441b-80cf-04f4dc771bd1',
    'ce867693-686f-4c58-a4d2-b761266bd730',
    'This Is Great!',
    'Blah Blah',
    'https://picsum.photos/seed/this-is-great/600',
    '2020-12-17 11:28:04.037768-05',
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
    '30fa1bbd-ac5b-4de5-a69c-65ce661504a2',
    'ce867693-686f-4c58-a4d2-b761266bd730',
    'Oh Amazing Breakfast Three',
    'Blah Blah',
    'https://picsum.photos/seed/oh-amazing-breakfast-three/600',
    '2020-12-17 11:31:54.029381-05',
    '6b8bc3d1-2eeb-47eb-8885-8444a91287e8'
  );
ALTER TABLE public.articles ENABLE TRIGGER ALL;
ALTER TABLE public.votes DISABLE TRIGGER ALL;
ALTER TABLE public.votes ENABLE TRIGGER ALL;
