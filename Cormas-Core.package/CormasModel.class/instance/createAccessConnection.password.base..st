ODBC
createAccessConnection: username password: password base: aDataBase
	"Create a ODBC connection on base aDataBase (<String>) with username (<String>) and password (<String>).
This method may be called from your model in order to save or get values from a database."
	
	self
		database:
			(CormasToAccess createODBCConnection: username password: password base:
					aDataBase)