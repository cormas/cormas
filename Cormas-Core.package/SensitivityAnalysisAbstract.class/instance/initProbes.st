initialize-release
initProbes
	
	| initialList aSet i |
	initialList := List new.
	aSet := Set new.
	i := 0.
	self cormasModelClass probes
		do:
			[:p | 
			i := i + 1.
			initialList add: self cormasModelClass name asString , '>>' , p asString.
			(self cormasModelClass activeProbes includes: p) ifTrue: [aSet add: i]].	"(self cormasModel allClasses asSortedCollection: [:cl1 :cl2 | cl1 name < cl2 name]) do: 
			[:c | 
			(c probes isEmpty or:[c isAbstract]) ifFalse: 
					[initialList add: self class separator.
					i := i + 1.
					c probes do: 
							[:p | 
							i := i + 1.
							initialList add: c name asString , '>>' , p asString.
							(c activeProbes includes: p) ifTrue: [aSet add: i]]]]."
	self listProbes list: initialList.
	self listProbes selectionIndexHolder value: aSet