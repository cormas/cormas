init
initScenarioWindow
	
	| initialList aSet i |  
	self randomSeed value = 1 ifTrue: [self randomSeed: Cormas seed asValue].
	self fixRandomSeed onChangeSend: #changedRandomSeed to: self.	"self fixRandomSeed value: self fixRandomSeed value."
	(self enableBackward isKindOf: Boolean)
		ifTrue: [ enableBackwardValue := self enableBackward asValue ].
	(self listInit list: (self cormasModel class organization listAtCategoryNamed: #init)) isEmpty
		ifTrue: [ ^ self alertMessage: 'The model does not define any method for initialization !' ].
	(self cormasModel activeInit
		ifNotNil: [:m | self listInit list includes: m]
		ifNil: [false])
			ifTrue: [self listInit selection: self cormasModel activeInit]
			ifFalse: [ self listInit notEmpty
				ifTrue: [ self listInit selection: self listInit list first ] ].
	(self listControle list: (self cormasModel class organization listAtCategoryNamed: #control)) isEmpty
		ifTrue: [ ^ self alertMessage: 'The model does not define any method for control !'].
	(self cormasModel activeControl
		ifNotNil: [ : m | self listControle list includes: m ]
		ifNil: [ false ])
			ifTrue: [ self listControle selection: self cormasModel activeControl]
			ifFalse: [ self listControle notEmpty
				ifTrue: [ self listControle selection: self listControle list first ] ].
	initialList := OrderedCollection new.
	aSet := Set new.
	i := 0.
	self cormasModel class probes
		do: [ : p | 
			i := i + 1.
			initialList
				add: self cormasModel class name asString , '>>' , p asString.
			(self cormasModel class activeProbes includes: p) ifTrue: [aSet add: i]].
	(self cormasModel class allEntityClasses
		asSortedCollection: [ : cl1 : cl2 | cl1 name < cl2 name])
		do: [: c  | 
			(c probes isEmpty or: [ c isAbstract ])
				ifFalse: [
					initialList add: self class separator.
					i := i + 1.
					c probes do: [ : p | 
							i := i + 1.
							initialList add: c name asString , '>>' , p asString.
							(c activeProbes includes: p) ifTrue: [aSet add: i]]]].
	self listProbes list: initialList.
	self listProbes selectionIndexHolder value: aSet.
	self finalStep value: self cormasModel finalTime.
	self builder: nil