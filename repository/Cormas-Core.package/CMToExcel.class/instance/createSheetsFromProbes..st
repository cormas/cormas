run
createSheetsFromProbes: nameList
	
	| index |
	" (workbook getMethod: 'Worksheets') invokeMethod: 'Add'   
(self controller worksheetAt: 1) invokeMethod: #Delete  
self deleteWorksheet "
	self sheets: OrderedCollection new.	"removing default sheets"
	self deleteWorksheet.
	self deleteWorksheet.	"normalement il en reste 1"
	index := 1.
	nameList
		do:
			[:aName | 
			index = 1
				ifTrue: [self setWorksheet: 1]
				ifFalse:
					[self addWorksheet.
					self setWorksheet: 1].
			self sheets first setName: aName asString.
			index := index + 1]