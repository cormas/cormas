aVirer
changeWith: anOtherCoordinate
	"This message is sent when a figure (self) is being deleted and replaced by anOtherCoordinate. The old one (self) is removed from SpaceView and the new one is added"
	
	self halt.
	self changed: #replace with: anOtherCoordinate