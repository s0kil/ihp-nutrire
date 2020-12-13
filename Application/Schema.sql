-- Your database schema. Use the Schema Designer at http://localhost:8001/ to add some tables.
CREATE TABLE users (
  id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
  fullname TEXT NOT NULL,
  email TEXT NOT NULL UNIQUE,
  username TEXT NOT NULL UNIQUE,
  password_hash TEXT NOT NULL,
  locked_at TIMESTAMP WITH TIME ZONE DEFAULT NULL,
  failed_login_attempts INT DEFAULT 0 NOT NULL
);
CREATE TABLE articles (
  id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
  user_id UUID NOT NULL,
  title TEXT NOT NULL,
  text TEXT NOT NULL,
  image TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL,
  category_id UUID NOT NULL
);
CREATE TABLE categories (
  id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
  name TEXT NOT NULL,
  priority INT NOT NULL,
  slug TEXT NOT NULL
);
CREATE TABLE votes (
  id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
  user_id UUID NOT NULL,
  article_id UUID NOT NULL
);
ALTER TABLE articles
ADD CONSTRAINT articles_ref_category_id FOREIGN KEY (category_id) REFERENCES categories (id) ON DELETE NO ACTION;
ALTER TABLE articles
ADD CONSTRAINT articles_ref_user_id FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE NO ACTION;
ALTER TABLE votes
ADD CONSTRAINT votes_ref_article_id FOREIGN KEY (article_id) REFERENCES articles (id) ON DELETE NO ACTION;
ALTER TABLE votes
ADD CONSTRAINT votes_ref_user_id FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE NO ACTION;
