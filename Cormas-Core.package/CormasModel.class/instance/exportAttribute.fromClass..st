deprecated
exportAttribute: attributeName fromClass: className
	"attributeName <Symbol>
className <String>"
	
	| stream filename instances |
	filename := (Cormas dataPath: self class name)
		construct: className asString , '_' , attributeName asString , '.txt'.
	stream := filename asFilename writeStream.
	instances := self perform: ('the' , className , 's') asSymbol.
	instances isEmpty
		ifFalse:
			[instances
				do:
					[:anInstance | 
					stream
						store: (anInstance perform: attributeName);
						cr]].
	stream close