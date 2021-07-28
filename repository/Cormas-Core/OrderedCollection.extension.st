Extension { #name : #OrderedCollection }

{ #category : #'*Cormas-Core' }
OrderedCollection >> elementsWithMaxValue: aMagnitudeName [
	" Returns all the elements from aCollection with the highest value of a given function.

	Arguments: 
		aName = <ByteSymbol>
		aCollection = <Collection(Object)>
	Return value: <a subCollection of aCollection>

	Example: Cormas elementsFrom:  self theCells withMaxValue: #elevation 
	Example: Cormas elementsFrom: (OrderedCollection with: (Agent new) with: (Agent new) with: (Agent new)) withMaxValue: #id   "
	
	^ self elementsWithMaxValue: aMagnitudeName verifying: [: e | true ]
]

{ #category : #'*Cormas-Core' }
OrderedCollection >> elementsWithMaxValue: aMagnitudeName verifying: aCondition [
	" Returns all the elements from aCollection with the highest value of a given function.
Arguments: aName = <ByteSymbol>
			aCollection = <Collection(Object)>
			aCondition = <BlockClosure>
Return value: <a subCollection of aCollection>
Example: Cormas elementsFrom:  self theCells withMaxValue: #elevation  verifying: [:e | e isPolluted] 
Example: Cormas elementsFrom: (OrderedCollection with: (Agent new) with: (Agent new) with: (Agent new)) withMaxValue: #id  verifying: [:e | e dead not]   "
	
	| value |
	value := self maxOf: aMagnitudeName verifying: aCondition.
	value ifNil: [^#()].
	^ self select: [:e | (aCondition value: e) and: [(e perform: aMagnitudeName) = value]]
]

{ #category : #'*Cormas-Core' }
OrderedCollection >> maxOf: aMagnitudeName verifying: aBlockCondition [
	"Purpose: returns the highest value of a given function among a collection of objects understanding this function
Arguments: aName = <ByteSymbol>
			aCollection = <Collection(Object)>
			aBlockCondition = <BlockClosure>
Return value: <Magnitude>
Example: Cormas maxOf: #elevation amongObjects: self theCells verifying: [:c | c notPolluted]
Example: Cormas maxOf: #CurrentId amongObjects: (Entity allTerminalClasses ) verifying: [:c | c isSituatedClass] "

	| collec |
	collec := self select: [:c | ((c perform: aMagnitudeName) respondsTo: #>) and: [aBlockCondition value: c]].
	^ collec isEmpty
		ifFalse: [ (collec collect: [:c | c perform: aMagnitudeName]) max ]
		ifTrue: [ nil ]
]

{ #category : #'*Cormas-Core' }
OrderedCollection >> selectRandomlySubCollectionSize: anInteger [
	"Purpose: Returns a subcollection randomly built from a collection (an item may be selected only once). If the collection is empty, or if the collection size is lower than the subcollection size, its returns aCollection randomly mixed..
Examples: Cormas selectRandomlyFrom: (Set withAll: #(1 2 3 4 5)) subCollectionSize: 3 => OrderedCollection (4 5 1)
			self ask: (Cormas selectRandomlyFrom: (self theCells select:[:c| c state = #tree]) subCollectionSize: 4) toDo: #burn"
	
	| randomCollection |
	anInteger < 1 ifTrue: [ ^ self class new ].
	randomCollection := self asOrderedCollection shuffleBy: Cormas randomGenerator.
	randomCollection size <= anInteger ifTrue: [ ^ randomCollection].
	^ randomCollection copyFrom: 1 to: anInteger
]
