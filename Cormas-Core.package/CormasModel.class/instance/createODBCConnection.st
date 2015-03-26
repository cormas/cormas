+ utilities - ODBC
createODBCConnection
	"Create a ODBC connection.
This method is called from SimManager in order to save the probe's values into a database (cormasSimulations).
You may redifine it with the right dataBase (<String>) and username (<String>) and password (<String>). Ex: 
createODBCConnection
	self createODBCConnection: 'bommel' password: '' base: 'essai'   "
	
	^nil