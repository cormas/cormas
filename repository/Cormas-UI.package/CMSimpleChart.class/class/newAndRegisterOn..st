deprecated
newAndRegisterOn: aCMCormasModel
	"createASimpleChartOnACormasModel"

	| newBe |
	newBe := self new.
	newBe cormasModel: aCMCormasModel.
	aCMCormasModel addDependent:newBe.
	^ newBe