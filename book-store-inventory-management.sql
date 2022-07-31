/* Book Store Inventory Management by Ryan Breeden */

--Creating table
create table book_store_inventory_management 
	(book_name varchar(100) primary key NOT NULL,
	author_name varchar(100) NOT NULL, book_description varchar(250), 
	price float, inventory int NOT NULL, primary_color varchar(10), rating float);
	
--Inserting book data into table	
insert into book_store_inventory_management (book_name, author_name, book_description, price, inventory, primary_color, rating) values 
	('The Intelligent Investor', 'Benjamin Graham', 'Lesson on value investing and financial history', 24.99, 14, 'Red', 8.5), 
	('Born A Crime', 'Trevor Noah', 'Stories about growing up in South Africa', 18.00, 19, 'Blue', 8),
	('A Promised Land', 'Barack Obama', 'History and life of the 44th president of the USA', 45, 3, 'Grey', 9),
	('Common Sense', 'Thomas Paine', 'Of the origin and design of government', 9.95, 27, 'Brown', 10),
	('The Job Interview Phase Book', 'Nancy Schuman', 'Best practices for successful interviews results', 10.95, 42, 'White', 7),
	('Python Programming for Dummies', 'John Paul Mueller, Luca Massaron', 'Learn basic python programing fundamentals', 31.95, 22, 'Black', 10),
	('Corporate Financial Management', 'Douglas R. Emery', 'Discover financial theories and best practices', 150, 65, 'Blue', 9);
	
select * from book_store_inventory_management;

--Identifying all book names with a price greater than or equal to $19.00
select * from book_store_inventory_management where price >=19;

--Selecting the all book names that start with the letter 'T'
select book_name from book_store_inventory_management where book_name like 'T%';

--Selecting only blue books with a rating score less than or equal to 8
select book_name, primary_color, rating from book_store_inventory_management where primary_color ='Blue' and rating <=8;

--Ordering all books by inventory in descending order from high to low
select * from book_store_inventory_management order by inventory desc;

--When a user selects to purchase the book 'Common Sense', the database is updated to reflect the latest inventory count
select book_name, price, inventory from book_store_inventory_management where book_name = 'Common Sense';
update book_store_inventory_management set inventory = inventory-1 where book_name = 'Common Sense';
select * from book_store_inventory_management where book_name = 'Common Sense';
