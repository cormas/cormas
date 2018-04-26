initialisation
setSpaceModel: aModel
	"Set the receiver's model to be aModel."
	
	spaceModel == aModel ifTrue: [^self].
	spaceModel ifNotNil: [spaceModel removeDependent: self].
	spaceModel := aModel.
	spaceModel ifNotNil: [spaceModel addDependent: self]