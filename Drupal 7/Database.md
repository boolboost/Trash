## Получить таблицы "views_view" и "views_display" из "backup.sql".

```
grep -E -i -w '^INSERT INTO `views_view`' backup.sql > views_view.sql
grep -E -i -w '^INSERT INTO `views_display`' backup.sql > views_display.sql
```
