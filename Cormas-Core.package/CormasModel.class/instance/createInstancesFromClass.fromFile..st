utilities - files
createInstancesFromClass: aClass fromFile: aStringOrFilename
	"class := (self class environment at: className asSymbol)."
	
	| fileSize a collec getter |
	fileSize := (self getDataLinesFromFile: aStringOrFilename) size.
	self
		perform: (self setterForEntityClass: aClass)
		with: OrderedCollection new.
	getter := self getterForEntityClass: aClass.
	fileSize - 1
		timesRepeat:
			[a := aClass new.
			collec := self perform: getter.
			collec add: a].
	^collec