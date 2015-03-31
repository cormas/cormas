deprecated
vue
	"en principe le modele n'a pas a manipuler directement sa vue !!!"
	
	^self dependents isEmpty
		ifTrue: [nil]
		ifFalse: [self dependents first]