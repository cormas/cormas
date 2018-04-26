main menu
entitiesListings
	"Creates text files (one for each class) with the listing of the methods"
	
	| directory |
	self cormasModelClass isNil ifTrue: [^nil].
	directory := Dialog
		requestDirectoryName: 'Choose a Directory to save the text files:'
		default: (Cormas modelPath: self cormasModelClass name).
	directory = '' ifTrue: [^nil].
	directory := directory asFilename.
	(self cormasModelClass allClassesInPackage
		select: [:c | (c inheritsFrom: Entity) or: [c inheritsFrom: CormasModel]])
		do: [:d | d listing: (directory construct: d class name , '.list.txt')]