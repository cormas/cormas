private
getInfoFor: infoSelectorName
	"Returns another String according to infoSelectorName.
infoSelectorName = <Symbol>."
	
	infoSelectorName = #nil ifTrue: [^nil].
	^self entity getInfoFor: infoSelectorName