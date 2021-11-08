DROP TABLE IF EXISTS jbergmann.etl_books;
CREATE TABLE jbergmann.etl_books (
  `Identifier` varchar(10) DEFAULT NULL,
  `Place of Publication` text,
  `Date of Publication` varchar(50) DEFAULT NULL,
  `Publisher` text,
  `Title` text,
  `Author` text,
  `Flickr URL` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
select * from jbergmann.etl_books; 
