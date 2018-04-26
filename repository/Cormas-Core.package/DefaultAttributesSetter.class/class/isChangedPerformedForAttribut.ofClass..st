getParameters
isChangedPerformedForAttribut: anAttribut ofClass: aClass
	"Returns a Boolean depending if the instuction 'self changed' is written or not in the setter accessor of anAttibut.
	anAttribut = <Symbol>
	aClass = <Class>"
	
	^((aClass compiledMethodAt: (anAttribut , ':') asSymbol) getSource
		findString: 'self changed' startingAt: 1) ~= 0