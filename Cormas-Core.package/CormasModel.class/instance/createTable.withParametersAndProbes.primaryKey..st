ODBC
createTable: aTable withParametersAndProbes: parametersArray primaryKey: primaryKey
	"create a table: aTable <String> withParameters: parameters <Array or OrederedCollection> and selectedProbes on primaryKey: primaryKey <String>"
	
	self simManager createTable: aTable withParametersAndProbes:
			parametersArray primaryKey: primaryKey