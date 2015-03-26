ODBC
getDataFromAccess: aDataBase username: username password: password sql: sqlRequest
	"return a collection from an SQL request on Access. This method may be called from your model in order to get values from a database.
Create a ODBC connection on base aDataBase (<String>) with username (<String>) and password (<String>).
Send the request.
sqlRequest examples : 'SELECT * FROM SimName'  
If you need quotes in your request, you should double the quotes. Be careful: Two quotes (' + ') are differents from quotation marks (''). Ex:
	'SELECT * FROM SimName WHERE version LIKE ''ECEC.st'''   

Example: 
	self getDataFromAccess: 'cormasSimulations' username: 'bommel' password: '' sql: 'SELECT * FROM SimName WHERE version LIKE ''ECEC.st'''   "
	
	| result |
	self createAccessConnection: username password: password base: aDataBase.
	result := self database trySQL_command: sqlRequest.
	self database disconnectODBCConnection.
	result ifFalse: [self error: 'Connexion Error'].
	^result