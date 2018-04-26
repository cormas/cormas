managing classes
allClasses
	"return all the classes of the model (except the classes that inheriting from Msg and other classes like Interface etc"

	| collection |
	collection := self allClassesInPackage.
	collection removeAllSuchThat: [:cl | (cl inheritsFrom: CMEntity) not].
	^ collection