deprecated
loadDataForClass: aClass fromFile: aStringOrFilename
	"Deprecated. Load data from a File, create as many instances that necessary and set the values of the attributs according to the format declared into the file"
	
	self setValuesForEntities: aClass fromFile: aStringOrFilename