deprecated
stepDynPop: aCollec
	"Deprecated. Should use   stepEntities: aCollec"
	
	| newBorns repro |
	newBorns := OrderedCollection new.
	(Cormas mixt: aCollec)
		do:
			[:anAgent | 
			repro := anAgent step.
			repro notNil ifTrue: [newBorns add: repro]].
	self update: aCollec with: newBorns