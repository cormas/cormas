ODBC
createTable: aTable withParameters: parametersArray primaryKey: primaryKey
	"create a table: aTable <String> withParameters: parameters <Array or OrederedCollection> on primaryKey: primaryKey <String>"
	
	self simManager createTable: aTable withParameters: parametersArray
		primaryKey: primaryKey