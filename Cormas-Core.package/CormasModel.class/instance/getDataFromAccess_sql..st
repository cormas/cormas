ODBC
getDataFromAccess_sql: sqlRequest
	"return a collection from an SQL request on Access. This method may be called from your model in order to get values from a database.
Be carefull: Except in case of error, the connexion with the database won't be release.
For a single request, you should rather use : getDataFromAccess: aDataBase username: username password: password sql: sqlRequest"
	
	| result |
	self database
		ifNil:
			[self error: 'Database not connected'	"The database is not connected. Before this method, you should send the message : self createAccessConnection: username password: password base: aDataBase"].
	result := self database trySQL_command: sqlRequest.
	result
		ifFalse:
			[self database disconnectODBCConnection.
			self error: 'Connexion Error'].
	^result