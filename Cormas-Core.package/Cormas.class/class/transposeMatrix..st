+ utilities - mathematics
transposeMatrix: aCollectionOfCollections
	"Return a transposed collection Of Collections.
Ex:
| collA |
	collA := OrderedCollection new.
	7 timesRepeat:[
	collA add: ( OrderedCollection withAll: #( 1 2 3 4 5))].
	collA inspect.
	(Cormas transposeMatrix: collA) inspect    "
	
	| coll2 line2 max |
	"complete irregular lines to get a full matrix"
	max := 0.
	aCollectionOfCollections
		do: [:lineColl | lineColl size > max ifTrue: [max := lineColl size]].
	aCollectionOfCollections
		do: [:lineColl | [lineColl size < max] whileTrue: [lineColl add: nil]].	"transpose"
	coll2 := OrderedCollection new.
	1
		to: aCollectionOfCollections first size
		do:
			[:col | 
			line2 := OrderedCollection new.
			1
				to: aCollectionOfCollections size
				do:
					[:ligne | line2 add: ((aCollectionOfCollections at: ligne) at: col)].
			coll2 add: line2].
	^coll2