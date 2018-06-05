instance creation
openOn: aCMCormasModel
	"create and open a simpleChart on a cormasModel"

	| newBe |
	newBe := self basicNew.
	newBe cormasModel: aCMCormasModel.
	newBe initialize.
	newBe openWithToolbar.
	^ newBe