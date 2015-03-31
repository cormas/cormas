instance creation
openAndDisplay: aSpaceModel
	
	| interface |
	interface := self new.
	interface spaceModel: aSpaceModel.
	interface open.
	interface displayGrid.
	^interface