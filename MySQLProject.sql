create database onlineBookStore;
use onlinebookstore;

create table Books (
Book_id serial primary key,
Title varchar(100),
Author varchar(100),
Genre varchar(50),
Published_Year int,
Price numeric (10, 2),
Stock int);

create table Customers (
Customer_Id serial primary key,
Name varchar (100),
Email varchar(100),
Phone varchar(15),
City varchar(50),
Country varchar(150)
);

create table Orders (
Order_Id serial primary key,
Customer_Id int references Customers (Customer_Id),
Book_Id int references Books (Book_Id),
Order_Date date,
Quantity int,
Total_Amount numeric (10, 2)
);

select * from books;
select * from customers;
select * from orders;

Q1) Retrieve all books in the fiction Genre

Select * from books
where genre="fiction";

Q2 Find books published after the year 1950

select * from books
where published_year>1950;

Q3 List all customer from Canada

select * from customers
where country="canada";

Q4 show order placed in November 2023 

select * from orders
where order_date between "2023-11-01" and "2023-11-30";

Q5 Retrieve the total stock of books available

select Sum(stock) Total_Stock
from books;

Q6 Find the details of the most expensive book

select * from books 
order by price desc limit 1;

Q7 Show all customers who ordered more than 5 quantity of a book

select * from orders
where quantity>5;

Q8 retrieve all orders where total amount exceeds $200

select * from orders
where total_amount>200;

Q9 List all Genres available in the books table

select distinct genre from books;

Q10 find books with lowest stock

select * from books
order by stock limit 1;

Q11 Calculate the total revenue generated from all orders

select sum(total_amount) _Revenue 
from orders;

_Advance questions

Q1 Retrieve the total no of books sold for each Genre

select * from books;
select * from orders;

select b.genre, sum(o.quantity) as Total_books_sold
from books b
join 
orders o on b.book_id=o.book_id
group by genre;

Q2 Find the average price of books in the "Fantasy" Genre

select avg(price) Avg_Price
from books 
where genre="fantasy";


Q3 List customers who have placed at least 2 orders

select o.customer_id, c.name, count(o.order_id) as Order_count
from orders o
join 
customers c on o.customer_id=c.customer_id
group by o.customer_id, c.name
having count(o.order_id)>=2;

Q4 Find the most frequently ordered book
select o.book_id, b.title, count(o.order_id) as order_count
from orders o
join
books b on o.book_id=b.book_id
group by o.book_id, b.title
order by order_count desc limit 1;

Q5 show the most expensive books of "fantasy" genre

select * from books
where genre="fantasy"
order by price desc limit 3;

Q6 Retrieve the total quantity of books sold by each author

select b.author, sum(o.quantity) as total_books_sold
from orders o
join books b on o.book_id=b.book_id
group by b.author;

Q7 List the cities where customer who spent over $300 are located

select distinct c.city, o.total_amount
from orders o
join customers c on o.customer_id=c.customer_id
where o.total_amount>300;

Q8 Find the customer who spent most on orders

select c.customer_id, c.name, sum(o.total_amount) as Total_spent
from orders o
join customers c on o.customer_id=c.customer_id
group by c.customer_id, c.name
order by total_spent desc limit 3;

Q9 Calculate the stock remaining after fulfilling all orders:

select b.book_id, b.title, b.stock, coalesce(sum(o.quantity),0) as order_quantity,
b.stock - coalesce(sum(o.quantity),0) as remaining_quantity
from books b
left join orders o on b.book_id=o.book_id
group by b.book_id
order by b.book_id asc;

select * from books;
select * from orders;
select * from customers;








