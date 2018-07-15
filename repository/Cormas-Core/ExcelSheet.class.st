"
ExcelSheet points to a Excel worksheet.

Instance Variables:
	currentCell	<Object>	description of currentCell
	currentCol	<(SequenceableCollection of: (Character | CharacterArray | GeneralBindingReference))>	description of currentCol
	currentLine	<ArithmeticValue | CPointer>	description of currentLine
	sheet	<>	description of sheet


"
Class {
	#name : #ExcelSheet,
	#superclass : #Object,
	#instVars : [
		'name',
		'sheet',
		'currentCell',
		'currentLine',
		'currentCol',
		'dataSavedByLine'
	],
	#category : 'Cormas-Core-Connect'
}

{ #category : #alphabet }
ExcelSheet class >> allColumns [
	"return an array containing all the column's names of Excel : 
 ExcelSheet allColumns = OrderedCollection ('A' 'B' 'C' ... 'Z' 'AA' 'AB' ... 'IV')"
	
	| c string |
	c := OrderedCollection new: 256.
	0
		to: 255
		do:
			[:i | 
			i > 25
				ifFalse: [string := self getAlphabet at: i + 1]
				ifTrue:
					[string := (self getAlphabet at: (i quo: 26))
						, (self getAlphabet at: i \\ 26 + 1)].
			c add: string].
	^c
]

{ #category : #alphabet }
ExcelSheet class >> columnAsNumber: aColumnName [
	"return the number of the column's name of Excel : 
 ExcelSheet columnAsNumber: 'AB' => 28 "
	
	^self allColumns indexOf: aColumnName
]

{ #category : #alphabet }
ExcelSheet class >> getAlphabet [
	"ExcelSheet getAlphabet = OrderedCollection ($A $B $C ... $Z) = 26 letters"
	
	| c |
	c := OrderedCollection new: 26.
	1
		to: 127
		do:
			[:i | 
			(Character value: i) isAlphabetic
				ifTrue: [c add: (String with: (Character value: i) asUppercase)]].
	^c
]

{ #category : #new }
ExcelSheet class >> newWith: anExcelWorksheetController [
	
	^(self new)
		sheet: anExcelWorksheetController;
		initialize
]

{ #category : #alphabet }
ExcelSheet class >> ultimateColumn [
	"ExcelSheet ultimateColumn = 'IV'    "
	
	^self allColumns last
]

{ #category : #navigation }
ExcelSheet >> columnAt: aNumber [
	"return the 'aNumber' column name.
ex: self columnAt: 1   -> 'A'
ex: self columnAt: 76 -> 'BX'
! Only 256 columns in Excel. Last column = 'IV' "
	
	aNumber > 256
		ifTrue: [^self error: 'Number of column exceeds Excel capacities'].
	self currentCol size = 1
		ifTrue:
			[self currentCol first = $Z
				ifFalse: [^self incrChar: self currentCol first]
				ifTrue: [^'AA']].
	self currentCol last = $Z
		ifFalse:
			[^self currentCol first asSymbol asString
				, (self incrChar: self currentCol last)]
		ifTrue: [^(self incrChar: self currentCol first) , 'A']
]

{ #category : #accessing }
ExcelSheet >> columnTitles [
	"Answer an array with information (title) of the columns, from currentCol.
Ex: #('Time' 'cash_famA' 'cash_famB')"
	
	| range info |
	range := sheet getRange: 'A1:' , self previousColumn , '1'.
	[info := range value copy] ensure: [range release].
	^info at: 1
]

{ #category : #accessing }
ExcelSheet >> currentCell [
	
	^self currentCol , self currentLine printString
]

{ #category : #accessing }
ExcelSheet >> currentCol [
	
	^currentCol
]

{ #category : #accessing }
ExcelSheet >> currentCol: aString [
	
	aString = '[A' ifTrue: [self halt].
	currentCol := aString
]

{ #category : #accessing }
ExcelSheet >> currentLine [
	
	^currentLine
]

{ #category : #accessing }
ExcelSheet >> currentLine: aCell [
	
	currentLine := aCell
]

{ #category : #accessing }
ExcelSheet >> dataSavedByLine [
	
	dataSavedByLine ifNil: [dataSavedByLine := false].
	^dataSavedByLine
]

{ #category : #accessing }
ExcelSheet >> dataSavedByLine: anObject [
	
	dataSavedByLine := anObject
]

{ #category : #save }
ExcelSheet >> fillColumnWith: anOrderedCollection [
	"Copy aValue on the right Excel cell then increase the current line."
	
	| lastCell anArray |
	lastCell := self currentCol
		, (self currentLine + anOrderedCollection size - 1) printString.	"conversion en Array d'Array. ex: #(#('Time\ECEC>>meanEnergy') #(0) #(1) #(2) #(3))"
	anArray := Array new: anOrderedCollection size.
	1
		to: anOrderedCollection size
		do:
			[:i | 
			anArray
				at: i
				put: (Array with: (anOrderedCollection at: i))].
	sheet
		setRange: self currentCell , ':' , lastCell
		to: anArray.
	self incrColumn.
	self currentLine: 1
]

{ #category : #save }
ExcelSheet >> fillFirstColumnWith: anOrderedCollection [
	"Copy aValue on the right Excel cell then increase the current line."
	
	| lastCell anArray |
	lastCell := self currentCol , anOrderedCollection size printString.	"conversion en Array d'Array. ex: #(#('Time\ECEC>>meanEnergy') #(0) #(1) #(2) #(3))"
	anArray := Array new: anOrderedCollection size.
	1
		to: anOrderedCollection size
		do:
			[:i | 
			anArray
				at: i
				put: (Array with: (anOrderedCollection at: i))].
	sheet
		setRange: 'A1:' , lastCell
		to: anArray.
	self incrColumn
]

{ #category : #save }
ExcelSheet >> fillFirstLineWith: anOrderedCollection [
	"Copy the values of anOrderedCollection on the fisrt line of Excel sheet then increase the current line."
	
	| names lastColumn range |
	names := anOrderedCollection asArray.
	lastColumn := ExcelSheet allColumns at: names size.
	range := 'A' , self currentLine printString , ':' , lastColumn
		, self currentLine printString.
	sheet setRange: range to: names.
	self incrLine.
	self currentCol: 'A'
]

{ #category : #save }
ExcelSheet >> fillLineWith: anOrderedCollection [
	"Copy the values of anOrderedCollection on the current line of Excel sheet then increase the current line."
	
	| names lastCell |
	names := anOrderedCollection asArray.
	lastCell := (ExcelSheet allColumns
		at: (ExcelSheet columnAsNumber: self currentCol) - 1 + names size)
		asString , self currentLine printString.	"lastColumn := ExcelSheet allColumns at: names size.
	range := self currentCol asString  , self currentLine printString , ':' , lastColumn, self currentLine printString."
	sheet
		setRange: self currentCell , ':' , lastCell
		to: names.
	self incrLine.
	self currentCol: 'A'
]

{ #category : #charts }
ExcelSheet >> getCellValue [
	" return the value of the current cell"
	" 'A2'  -> '33'"
	
	^(self sheet getRange: self currentCell) value
]

{ #category : #charts }
ExcelSheet >> getDataRange [
	" return a <ExcelRangeController> without first line neither first column"
	" 'B2:C6'  ie."
	
	^self sheet
		getRange: 'A1:' , (self lastColumn , self lastLine printString)	"self currentCell"
]

{ #category : #name }
ExcelSheet >> getName [
	"Answer the name of the sheet"
	
	^sheet getProperty: 'Name'
]

{ #category : #charts }
ExcelSheet >> getRange [
	" return a <ExcelRangeController>"
	" 'A1:C2'  ie."
	
	^self sheet getRange: 'B1:' , self currentCell
]

{ #category : #charts }
ExcelSheet >> getSimInfo [
	"Get the cell matrix from Excel into Smalltalk."
	
	| range info |
	range := self sheet getRange: 'A1'.
	[info := range value copy] ensure: [range release].
	^info
]

{ #category : #charts }
ExcelSheet >> getValueRange [
	" return a <ExcelRangeController>"
	" 'A1:C11'  ie."
	
	self lastColumn.
	self lastLine.
	^self sheet getRange: 'A1:' , self currentCell
]

{ #category : #navigation }
ExcelSheet >> incrChar: aChar [
	
	| nextChar |
	nextChar := (aChar asInteger + 1) asCharacter.
	nextChar isAlphabetic ifFalse: [^$A].
	^nextChar
]

{ #category : #navigation }
ExcelSheet >> incrColumn [
	"Increments column (AA -> AB, for example)
! Only 256 columns in Excel. Last column = 'IV' "
	
	self currentCol: self nextColumn
]

{ #category : #navigation }
ExcelSheet >> incrLine [
	"Increments line"
	
	self currentLine: self currentLine + 1
]

{ #category : #init }
ExcelSheet >> initialize [
	
	self currentLine: 1.
	self currentCol: 'A'
]

{ #category : #navigation }
ExcelSheet >> lastColumn [
	"return the last column name for which a value exists.
! Only 256 columns in Excel. Last column = 'IV' "
	
	self currentCol: 'A'.
	self currentLine: 1.
	[self getCellValue isNil]
		whileFalse:
			[self incrColumn.
			self currentCol = ExcelSheet ultimateColumn ifTrue: [^self currentCol]].
	self currentCol: self previousColumn.
	^self currentCol
]

{ #category : #navigation }
ExcelSheet >> lastLine [
	"return the last line for which a value exists."
	
	self currentLine: 1.
	[self getCellValue isNil] whileFalse: [self incrLine].
	self currentLine = 1 ifTrue: [^0].
	self currentLine: currentLine - 1.
	^self currentLine
]

{ #category : #accessing }
ExcelSheet >> name [
	
	^name
]

{ #category : #accessing }
ExcelSheet >> name: anObject [
	
	name := anObject
]

{ #category : #navigation }
ExcelSheet >> nextColumn [
	"return the next column name.
ex: curent column = 'A'  -> 'B'
ex: curent column = 'AA'  -> 'AB'
ex: curent column = 'ZZ'  -> 'AAA'
ex: curent column = 'CZ'  -> 'DA'
(! Only 256 columns in Excel. Last column = 'IV' ) not with Excel 97"
	
	| nonZ i chr |
	self currentCol last = $Z
		ifFalse:
			[currentCol := self currentCol asTwoByteString.
			currentCol
				at: self currentCol size
				put: (self incrChar: self currentCol last).
			^self currentCol]
		ifTrue:
			[nonZ := self currentCol select: [:ch | (ch = $Z) not].
			nonZ isEmpty
				ifTrue:
					[^'A'
						,
							(String
								new: self currentCol size
								withAll: $A)]
				ifFalse:
					[i := self currentCol findLast: [:ch | ch = nonZ last].
					chr := self incrChar: (self currentCol at: i).
					currentCol := self currentCol asTwoByteString.
					self currentCol at: i put: chr.
					i + 1
						to: self currentCol size
						do:
							[:j | 
							self currentCol
								at: j
								put: (self incrChar: (self currentCol at: j))].
					^self currentCol]]	"	self currentCol size = 1 ifTrue: [
							self currentCol first = $Z 
									ifFalse: [^self incrChar: self currentCol first]
									ifTrue: [^'AA']].
	self currentCol last = $Z 
		ifFalse: [^(self currentCol first asSymbol asString , (self incrChar: self currentCol last))]
		ifTrue: [^(self incrChar: self currentCol first)	, 'A']."
]

{ #category : #navigation }
ExcelSheet >> prepareForNextSim [
	
	self dataSavedByLine
		ifTrue:
			[self incrLine.
			self currentCol: 'A']
		ifFalse:
			[self incrColumn.
			self currentLine: 1]
]

{ #category : #navigation }
ExcelSheet >> previousChar: aChar [
	"Answer the previous character.
Ex: ExcelSheet new previousChar: $A --> 'C' "
	
	^(aChar asInteger - 1) asCharacter asSymbol asString
]

{ #category : #navigation }
ExcelSheet >> previousColumn [
	"return the previous column name.
ex: curent column = 'B'  -> 'A'
ex: curent column = 'AB'  -> 'AA'
! If currentCOl = 'A', return the last one ('IV' ) "
	
	self currentCol = 'A' ifTrue: [^'IV'].
	self currentCol size = 1
		ifTrue: [^self previousChar: self currentCol last].
	self currentCol last = $A
		ifFalse:
			[^self currentCol first asSymbol asString
				, (self previousChar: self currentCol last)]
		ifTrue:
			[self currentCol first = $A
				ifFalse: [^(self previousChar: self currentCol first) , 'Z']
				ifTrue: [^'Z']]
]

{ #category : #save }
ExcelSheet >> saveCollection: anOrderedCollection [
	"Copy aValue on the right Excel cell then increase the current line.
 !! anOrderedCollection = only numbers  !!"
	
	self dataSavedByLine
		ifTrue: [self fillLineWith: anOrderedCollection]
		ifFalse: [self fillColumnWith: anOrderedCollection]
]

{ #category : #save }
ExcelSheet >> saveValue: aValue [
	"Copy aValue on the right Excel cell then increase the current line."
	
	self sheet
		setRange: self currentCell
		to: aValue.
	self dataSavedByLine
		ifTrue: [self incrColumn]
		ifFalse: [self incrLine]
]

{ #category : #save }
ExcelSheet >> saveValues: anOrderedCollection [
	"Copy aValue on the right Excel cell then increase the current line."
	
	self dataSavedByLine
		ifTrue: [self fillFirstLineWith: anOrderedCollection]
		ifFalse: [self fillFirstColumnWith: anOrderedCollection]
]

{ #category : #name }
ExcelSheet >> setName: aString [
	"Change the name of the sheet"
	
	self name: aString.
	^sheet setProperty: 'Name' value: aString
]

{ #category : #accessing }
ExcelSheet >> sheet [
	
	^sheet
]

{ #category : #accessing }
ExcelSheet >> sheet: aSheet [
	
	sheet := aSheet
]
