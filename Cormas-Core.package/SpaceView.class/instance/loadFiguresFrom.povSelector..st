adding-removing
loadFiguresFrom: aClass povSelector: selectorName
	"Create, add and return a collection of Figures from the Entity (aClass) and subclasses"
	
	| aInfoName |
	aInfoName := self model infoMethodDicoAt: aClass.
	self loadFiguresFrom: aClass povSelector: selectorName andInfo: aInfoName