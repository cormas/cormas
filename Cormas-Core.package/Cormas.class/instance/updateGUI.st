main menu
updateGUI
	"Display the model on Cormas GU interface"
	"aModel = subClass of <CormasModel>"
	
	| aList |
	aList := List new.
	self modelName: self cormasModelClass name.
	self mainWin label: 'Cormas [' , self cormasModelClass name , ']'.
	self cormasModelClass socialClasses
		do: [:anEntity | aList add: anEntity name].
	self listSocialEntities list: aList.
	aList := List new.
	self cormasModelClass spatialClasses
		do: [:anEntity | aList add: anEntity name].
	self listSpatialEntities list: aList.
	aList := List new.
	self cormasModelClass passiveClasses
		do: [:anEntity | aList add: anEntity name].
	self listPassiveEntities list: aList.
	self displayVersionOfModel: self cormasModelClass