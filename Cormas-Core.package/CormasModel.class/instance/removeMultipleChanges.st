private - notification
removeMultipleChanges
	"remove all the overlapping changes for the entities (before displaying). Just keep the last change"
	
	| lastChanges otherChanges |
	"otherChanges := delayedChanges removeAllSuchThat: [: e | e class ~= EntityChange]."
	lastChanges := OrderedCollection new.
	otherChanges := OrderedCollection new.
	delayedChanges
		reverseDo:
			[:ent | 
			ent class ~= EntityChange
				ifTrue: [otherChanges add: ent]
				ifFalse:
					[(lastChanges
						contains: [:e | e entity = ent entity and: [e symbol = ent symbol]])
						ifFalse: [lastChanges add: ent]]].
	delayedChanges := otherChanges reverse.
	delayedChanges addAll: lastChanges reverse