instance creation
on: anAgent adaptor: anAdaptor function: aFunction
	
	| tmp |
	tmp := super new initialize.
	tmp privateSource: anAgent.
	tmp privateFunction: aFunction.
	tmp privateAdaptor: anAdaptor.
	anAgent isNil
		ifTrue: [tmp etatNoChanged: 2]
		ifFalse:
			[tmp
				etatNoChanged:
					(aFunction
						agent: anAgent
						niveau: anAdaptor level)].
	^tmp