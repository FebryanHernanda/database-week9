/*==============================================  QUERY EXERCISE */
-- Movie-movie yang rilis ditahun 2020
SELECT
  id,
  title,
  movie,
  release_date,
  rating
FROM
  movies
WHERE
  EXTRACT(
    YEAR
    FROM
      release_date
  ) = 2020;

-- Aktor-aktor yang memiliki nama berakhiran 's'
SELECT
  id,
  name
FROM
  actors
WHERE
  name LIKE '%s';

-- Movie-movie yang memiliki rating minimum 4 dan maksimal 7 yang rilis pada tahun 2004-2010
SELECT
  id,
  title,
  movie,
  release_date,
  rating
FROM
  movies
WHERE
  EXTRACT(
    YEAR
    FROM
      release_date
  ) BETWEEN 2004 AND 2010
  AND rating BETWEEN 4 AND 7;

/*==============================================  PRODUCTS AND PROMOS DATA */
CREATE TABLE
  promos (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    discount INT NOT NULL
  )
INSERT INTO
  promos (name, discount)
VALUES
  ('Soft Opening', 10000),
  ('Gajian', 5000),
  ('Lebaran Haji', 15000);

CREATE TABLE
  products (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP,
    name VARCHAR(50) NOT NULL,
    promo_id INT,
    FOREIGN KEY (promo_id) references promos (id),
    price INT NOT NULL
  )
INSERT INTO
  products (name, promo_id, price)
VALUES
  ('Tea', null, 10000),
  ('Coffee', 1, 12000),
  ('Cake', 1, 22000),
  ('Fried Rice', 2, 15000)
  /*============================================== JOINING TABLE QUERY */
  /* INNER JOIN */
SELECT
  prd.name,
  prd.price,
  pro.name,
  pro.discount
FROM
  products prd
  JOIN promos pro ON prd.promo_id = pro.id;

/* LEFT JOIN */
SELECT
  prd.name,
  prd.price,
  pro.name,
  pro.discount
FROM
  products prd
  LEFT JOIN promos pro ON prd.promo_id = pro.id
SELECT
  prd.name,
  (prd.price - COALESCE(pro.discount, 0)) AS "sale price"
FROM
  products prd
  LEFT JOIN promos pro on prd.promo_id = pro.id
SELECT
  promo_id,
  avg(price) as "rerata_harga"
from
  products
group by
  promo_id
  /*============================================== GROUP AND AGGREGATIONS QUERY */
SELECT
  promo_id,
  avg(price) as "rerata_harga"
from
  products
group by
  promo_id
having
  avg(price) < 15000
SELECT
  promo_id,
  avg(price) as "rerata_harga"
from
  products
where
  promo_id is not null
group by
  promo_id
having
  avg(price) < 16000 table products;

SELECT
  promo_id,
  max(price) as "harga_produk_terkecil"
from
  products
where
  promo_id is not null
group by
  promo_id
order by
  promo_id asc