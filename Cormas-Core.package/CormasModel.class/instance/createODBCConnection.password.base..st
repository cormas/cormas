+ utilities - ODBC
createODBCConnection: username password: password base: aDataBase
	"Create a ODBC connection on base aDataBase (<String>) with username (<String>) and password (<String>)"
	
	self simManager createODBCConnection: username password: password base:
			aDataBase