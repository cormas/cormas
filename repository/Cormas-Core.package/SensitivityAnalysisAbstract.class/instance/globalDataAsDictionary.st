save
globalDataAsDictionary
	"return a dictionary of the data: probe name as key and values as collection:
<Dictionary> simple :
	[ #attribut1 (1 3 0 99 )
	  #attribut2 (23 4 8 1) ...... ]"
	
	self cormasModel data isEmpty
		ifTrue: [^self listProbes list]
		ifFalse: [^self cormasModel data at: self cormasModelClass name]	"	aValue := (selectedClass perform: ((probes at: index)
							tokensBasedOn: $>) last asSymbol) asFloat."