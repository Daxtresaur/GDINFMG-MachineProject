A (Not-So) Comprehensive README Document:

(1) OPEN THE NECESSARY SQL APPS (MySQL, phpMyAdmin)
(2) Import/Copy-Paste the file "mp.sql" to your local server via MySQL Workbench.
	** Make sure you have a database named "mp", within your server (MySQL and phpMyAdmin both 
	   access the same local server so you can use either one), as the PHP scripts mainly rely 
	   on having that database.
(3) Run the Code and Let the Table be Automatically Created
	** There shouldn't be any problem as long as the mp database is already (manually) created.
(4) Add the MP folder (containing the PHP files) to htdocs of xammp or mamp, but NOT inside `sqlconnect`.
	** Basing on various HTTP links within the C# scripts
(5) Run the project and check for errors.