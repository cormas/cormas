deprecated
loadAttributesForLocatedEntity: aClass fromFile: aStringOrFilename
	"Load data from a File, create as many instances of aClass as necessary and set the values of the attributs 
	according to the format declared into the file. If the patchID is declared into the file, the located entities are moved to the right cells"
	
	self createAndLoadLocatedEntity: aClass fromFile: aStringOrFilename