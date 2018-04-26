menu - actions
reopen
	"Open a new spatial grid with same properties"
	
	| interface |
	self spaceModel cormas
		ifNil: [^self cormas warn: 'The model should be initialized'].
	interface := SpaceInterface new.
	interface copyPovFrom: self.
	interface open.
	interface drawing fillColor: self drawing fillColor.
	interface setMenuHolder.
	interface displayAllPovs.	"self spaceModel cormas spaceInterfaces add: interface."
	^interface