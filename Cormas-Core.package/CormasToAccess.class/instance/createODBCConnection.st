ODBC
createODBCConnection
	"Create an ODBC Connection by asking if necessary for 'username' 'password' and 'aDataBase' "
	
	(self username isNil
		or:
			[self dataBase isNil
				or: [self username isEmpty or: [self dataBase isEmpty]]])
		ifTrue:
			[self openLoginWindow.
			(self accept
				and: [dataBase value isEmpty not and: [username value isEmpty not]])
				ifTrue:
					[dataBase := dataBase value.
					username := username value.
					pwd := pwd value]
				ifFalse: [^nil]].
	^self createODBCConnection: username password: pwd base: dataBase