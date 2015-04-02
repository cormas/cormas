accessing
cormasModel: newModelInstance
	"set the new simulation and give a reference to cormas"
	
	cormasModel := newModelInstance.
	newModelInstance ifNil: [^nil].
	newModelInstance cormas: self