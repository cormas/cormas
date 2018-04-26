managing classes
allTerminalClasses
	"Return a collection of classes without superclasses"
	
	| all |
	all := OrderedCollection new: 30.
	self spatialClasses_sorted
		ifNotNil:
			[:coll | coll do: [:each | (Cormas isTerminal: each) ifTrue: [all add: each]]].
	self socialClasses
		ifNotNil:
			[:coll | coll do: [:each | (Cormas isTerminal: each) ifTrue: [all add: each]]].
	self passiveClasses
		ifNotNil:
			[:coll | 
			coll
				do:
					[:each | 
					((Cormas isTerminal: each) and: [each inheritsFrom: Entity])
						ifTrue: [all add: each]]].
	^all