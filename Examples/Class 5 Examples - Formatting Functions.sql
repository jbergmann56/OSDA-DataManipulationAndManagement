/* Numeric Examples */
SELECT FORMAT(12324.2573, 3), CAST('150' AS Unsigned), IFNULL(NULL, 500), ISNULL(NULL), COALESCE(NULL, NULL, NULL, 'W3Schools.com', NULL, 'Example.com'); 
/* String Examples */ 
SELECT CONCAT('Jeremy ','Bergmann'), INSTR('myteststring','st'), TRIM(LEADING 'leading' FROM 'leadingtext' ), REPLACE('w3resource','ur','r'), LCASE('MYTESTSTRING'), Length('Bergmann');
/* Date Examples */ 
SELECT CURDATE(), CURRENT_TIMESTAMP(), HOUR(CURRENT_TIMESTAMP()), Datediff(CURDATE(), '1999-12-31'),
DAY('2008-05-15'),MONTH('2008-05-15'),YEAR('2008-05-15'), DAYOFWEEK(CURDATE()) ;