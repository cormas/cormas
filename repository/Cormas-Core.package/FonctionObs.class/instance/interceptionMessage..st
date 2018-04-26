bakam
interceptionMessage: unMsg
	
	| methode |
	methode := unMsg class isObserved.
	methode notNil
		ifTrue: [^unMsg perform: methode]
		ifFalse: [^true]