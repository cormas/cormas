instance creation
newOn: aCMCormasModel
	"createASimpleChartOnACormasModel"
| newBe |
newBe := self new.
newBe cormasModel: aCMCormasModel.
^newBe