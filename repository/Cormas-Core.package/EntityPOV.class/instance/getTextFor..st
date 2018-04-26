info
getTextFor: infoSelectorName
	"this method is called from a Figure, to display an information text"
	
	infoName := infoSelectorName.
	infoResult := self entity getInfoFor: infoSelectorName.
	^infoResult