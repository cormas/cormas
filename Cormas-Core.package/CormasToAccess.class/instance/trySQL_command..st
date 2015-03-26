ODBC
trySQL_command: sqlCommand
	"sqlCommand <String> 
ex: 'select * from toto'      or							
sqlCommand := 'INSERT INTO LocalProbes (simulationName, step, className, id, probeName, probeValue) VALUES (''' , self currentSimulationName , ''', ' , self currentTime printString , ', ''' , selectedClass name , ''', ' , inst id printString , ', ''' , probeName , ''', ' , aValue printString , ')'.
result := self trySQL_command: sqlCommand   "
	
	| result |
	^[result := self sql_command: sqlCommand]
		on: GenericException
		do: [:ex | ex return: false]