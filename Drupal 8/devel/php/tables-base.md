# Usefull

http://xandeadx.ru/blog/drupal/88

https://www.w3schools.com/sql/sql_select.asp

# All tables

~~~
$tables = db_query('SHOW TABLES')->fetchCol();
~~~

# List of table columns

~~~
$columns = db_query("SELECT * FROM INFORMATION_SCHEMA.COLUMNS where table_name = '{TABLE}'")->fetchAllAssoc('COLUMN_NAME');
~~~

# Field Data

~~~
$raw = db_query("SELECT * FROM {field_data_FIEND_NAME}")->fetchAll();
~~~
