procedures
autoClassesFor: dataCollec
	
	| col int builtClasses |
	col := dataCollec asSet asOrderedCollection sort.
	col size = 1
		ifTrue:
			[self nbClasses: 1.
			^OrderedCollection with: col first].	"set interval for a maximum  of 10 classes"
	int := (col last - col first) / ((10 min: col size) - 1).
	builtClasses := OrderedCollection new.
	builtClasses add: col first.
	1
		to: (10 min: col size) - 1
		do: [:x | builtClasses add: col first + (x * int)].
	self nbClasses: builtClasses size.
	^builtClasses