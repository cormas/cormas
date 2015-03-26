ODBC-private
createODBCConnection: anUsername password: aPassword base: aDataBase
	"Create a ODBC connection on base aDataBase (<String>) with username (<String>) and password (<String>)"
	
	self connection: ODBCConnection new.
	(self connection)
		username: anUsername;
		password: aPassword;
		environment: aDataBase.
	self connection connect.
	^self