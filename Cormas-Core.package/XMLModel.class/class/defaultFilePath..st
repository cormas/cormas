paths
defaultFilePath: aModel
	"From a model, return the default file path of the modele.xml file"
	
	^(Cormas xmlPath: aModel class name) construct: 'modele.xml'