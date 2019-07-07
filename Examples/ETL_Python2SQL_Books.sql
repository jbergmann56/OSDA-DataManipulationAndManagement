drop table if exists test.etl_books;
CREATE TABLE test.etl_books (
  `Identifier` varchar(10) DEFAULT NULL,
  `Place of Publication` text,
  `Date of Publication` varchar(50) DEFAULT NULL,
  `Publisher` text,
  `Title` text,
  `Author` text,
  `Flickr URL` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
select * from test.etl_books; 
