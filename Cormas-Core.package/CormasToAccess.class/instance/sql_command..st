ODBC-private
sql_command: aCommand
	"aCommand <String> = SQL command  ex: 'select * from toto'   "
	
	| session result ans |
	result := OrderedCollection new.
	self connection isConnected ifFalse: [self createODBCConnection].
	session := self connection getSession.
	session prepare: aCommand.
	session execute.
	ans := session answer.
	(ans == #noMoreAnswers or: [ans == #noAnswerStream])
		ifFalse:
			[[ans atEnd] whileFalse: [result add: ans next].
			ans := session answer].
	^result