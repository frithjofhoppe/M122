sqlite3 $PWD/example.db << EOF
DROP TABLE account;
CREATE TABLE account (ID INTEGER, Vorname TEXT, Nachname TEXT,PRIMARY KEY (ID));
INSERT INTO account (ID,Vorname,Nachname) VALUES (1,'Frithjof','Hoppe');
INSERT INTO account (ID,Vorname,Nachname) VALUES (2,'Clara','Hoppe');
EOF

sqlite3 $PWD/example.db "SELECT * FROM account"
