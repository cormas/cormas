new
createODBCConnection: username password: password base: aDataBase
	
	| db |
	db := self new.
	db username: username.
	db pwd: password.
	db dataBase: aDataBase.
	^db createODBCConnection