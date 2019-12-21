**Usefull**

http://xandeadx.ru/blog/drupal/88

https://www.w3schools.com/sql/sql_select.asp

**All tables**
``` php
$tables = db_query("SHOW TABLES")->fetchCol();
```

**List of table columns**
``` php
$columns = db_query("SELECT * FROM INFORMATION_SCHEMA.COLUMNS where table_name = '{TABLE}'")->fetchAllAssoc('COLUMN_NAME');
```

**Field Data**
``` php
$raw = db_query("SELECT * FROM {ENTITY_TYPE__FIEND_NAME}")->fetchAll();
```
