- #### What is PostgreSQL?

  -> PostgreSQL is a object-relational database management system, which means that it has relational capabilities and an object-oriented design that uses SQL for data management while supporting advanced data types and ACID_compliant transactions.

- #### What is the purpose of a database schema in PostgreSQL?

  -> Database schema is a a logical container or namespace within a database that organizes objects such as table, views, indexes, functions, and data types.

- #### Explain the primary key and foreign key concepts in PostgreSQL.

  -> Primary key is a unique identifier for each row in a table and foreign key is a column (or group of columns) that references the primary key of another table.

- #### What is the difference between the VARCHAR and CHAR data types?

  -> Primary difference is how they handle padding and length limits.

- #### Explain the purpose of the WHERE clause in a SELECT statement.
   
    -> Primary purpose is filter records based on specific conditions.

- #### What are the LIMIT and OFFSET clauses used for?

  -> LIMIT: Restrict the number of rows returned.
     OFFSET: How many rows we want to skip.

- #### How can you perform data modification using UPDATE statements?

  -> UPDATE table_name
      SET col1 = val1,
          col2 = val2,
      WHERE condition;

- #### What is the significance of the JOIN operation, and how does it work in PostgreSQL?

  -> Using JOIN we can merge rows from two or more tables based on related column, typically a primary and foreign key relationship.
  PostgreSQL executes a join by comparing rows between tables based on a join condition (usually specified with the ON or USING clause) 

- #### Explain the GROUP BY clause and its role in aggregation operations.

  -> The GROUP BY clause groups rows in a table based on the values of one or more specified columns. We can perform aggregate functions for this groups rows like COUNT(), MAX(), MIN(), SUM(), AVG() to get one single number.

- #### How can you calculate aggregate functions like COUNT, SUM, and AVG in PostgreSQL?

  -> 1. We can use these aggregate function within a SELECT statement to get a single total for the whole table. 2. Secondly we can use these aggregate function within GROUP BY clause for a groups rows

- #### What is the purpose of an index in PostgreSQL, and how does it optimize query performance?

  -> Primary purpose is to speed up data retrieval by providing a "shortcut" to specific rows. Instead of scanning every row or sequential scan in a table.
      1. Avoid full tables scan, 2. Reduce DISK I/O, 3. speed up joins and sorting, 4. Index-only scans

- #### Explain the concept of a PostgreSQL view and how it differs from a table.

  -> View is a virtual table. It does not store actual data on disk like a physical table; instead, it provides a way to look at data from one or more underlying base tables as if they were a single table.
