display
updateEntity: anEntityReference
	"Called from the spaceModel to update one entity that received a changed message
	If the spaceInterface settings allow the visualiation of that entityClass (aSelector is not nil), then it asks the corresponding figure to update according to its own povSpec (which may be different from the povSpec specified by the sapceInterface for that entityClass "
	
	| aSelector |
	aSelector := self povMethodDicoAt: anEntityReference entityClass.
	(aSelector = #nil or: [aSelector = #delimitors]) ifTrue: [^nil].	"Delimitors are updated only when the components of a spatialSet is changed"
	self drawing updateFigureForEntityReference: anEntityReference