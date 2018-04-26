changed
changeWith: anOtherCompositePOV
	"This message is sent when a figure (self) is being deleted or if shape has changed with anOtherCompositePOV. The old one (self) is removed from SpaceView and the new one is added"
	
	anOtherCompositePOV setDelimitors.
	super changeWith: anOtherCompositePOV