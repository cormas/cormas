ODBC
createTableFromSQLcommand: anSQLcommand
	"Create the table from an SQL command.
Ex:   
self createTableFromSQLcommand:
			'CREATE TABLE GlobalProbes (num COUNTER PRIMARY KEY, simulationName VARCHAR(50), step INTEGER, probeName VARCHAR(50), probeValue Single, CONSTRAINT [FK_2] FOREIGN KEY ([simulationName]) REFERENCES SimName ([simulationName]))'"
	
	| result |
	result := self trySQL_command: anSQLcommand.
	result == false ifTrue: [^false].
	^true