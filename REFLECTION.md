# Reflection

## a. Evaluation of the Advanced Queries

Exploring advanced SQL queries showed me that a database can do much more than simply store and retrieve information. The advanced features allowed me to perform calculations, automate changes, and process data in different ways.

One example was the trigger in my prison management database. When an inmate is deleted, the trigger automatically decreases the occupancy of the cell that was assigned to that inmate. This showed me how database automation can help maintain consistent information without requiring a user to manually update another table.

The window functions also helped me understand how SQL can analyse data while still keeping the individual records visible. Using `RANK()` and `ROW_NUMBER()` allowed me to compare inmates within their respective cell blocks.

## b. My Experience Using the Queries

At the beginning of the assignment, I was not very familiar with some of these SQL features because most of my previous SQL work focused on queries such as `SELECT`, `INSERT`, `UPDATE`, and `DELETE`.

The syntax for stored procedures, triggers, functions, cursors, and events initially seemed more complicated than the SQL I was used to. I had to research the different concepts and then test them in MySQL to understand how they worked in practice.

The trigger was one of the features I found most interesting because it allowed an action on one table to automatically cause an update on another table. Seeing the cell occupancy change after deleting an inmate helped me understand the practical value of database triggers.

## c. What I Learned

This assignment expanded my understanding of what can be achieved using SQL.

I learned how to create and use window functions for analysing records, stored procedures for combining multiple database operations, triggers for automatically responding to changes, functions for returning calculated values, cursors for processing records individually, and events for performing scheduled database tasks.

I also gained a better understanding of foreign key relationships. While testing the trigger, I discovered that an inmate with related records in other tables could not simply be deleted because of the foreign key constraints. This helped me understand how relational databases protect data integrity.

## d. Limitations and Challenges

One of the main challenges I experienced was testing the trigger. I initially attempted to delete an existing inmate, but the deletion was prevented because the inmate had related records in other tables. Instead of removing those records, I created a temporary inmate with no related visits or rehabilitation programme records. I could then delete the temporary record and observe the trigger updating the cell occupancy.

Another challenge was understanding how the different advanced SQL features work together with the existing database structure. I had to pay attention to the order in which tables were created and data was inserted because of the foreign key relationships.

I also found error handling and debugging challenging. This showed me that I still need more practice with designing SQL that can safely handle unexpected situations.

## e. How These Skills Can Help in Real Projects

The skills I gained from this assignment can be applied to many real-world database systems.

For example, triggers could be used to automatically update related information when records change. Stored procedures could be used to group common database operations, while functions could perform calculations that are needed regularly. Events could also be useful for scheduled maintenance tasks.

These concepts could be applied to systems such as hospitals, schools, financial systems, or business applications. The assignment therefore gave me a better understanding of how databases can support the logic and automation required by larger software systems.

## f. The Importance of Testing and Planning

One of the main lessons I took from this assignment is that advanced SQL requires careful planning and testing.

A change to one table can affect other tables when foreign keys, triggers, and related database logic are involved. I learned to test individual features rather than assuming that the SQL would work correctly on the first attempt.

The experience also showed me the importance of understanding the database structure before writing advanced queries. I now have a better appreciation for testing SQL in a controlled way and checking the results after each operation.

Overall, this assignment improved my confidence with SQL and gave me practical experience with database features that I had not previously used extensively.