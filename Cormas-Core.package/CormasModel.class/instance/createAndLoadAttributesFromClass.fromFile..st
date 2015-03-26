deprecated
createAndLoadAttributesFromClass: aClass fromFile: aStringOrFilename
	"Load data from a File, create as many instances of aClass as necessary and set the values of the attributs according to the format declared into the file.
	!!Be carefull, you should use this method to create spatial entity instances !!!"
	
	self createInstancesFromClass: aClass fromFile: aStringOrFilename.
	self setValuesForEntities: aClass fromFile: aStringOrFilename