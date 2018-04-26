private - accessing
cormasModel: aCormasModel
	"The cormasModel is some kind of model for the spaceModel (receive notification)"
	
	cormasModel == aCormasModel ifTrue: [^self].
	cormasModel ifNotNil: [cormasModel removeDependent: self].
	cormasModel := aCormasModel.
	cormasModel ifNotNil: [cormasModel addDependent: self]