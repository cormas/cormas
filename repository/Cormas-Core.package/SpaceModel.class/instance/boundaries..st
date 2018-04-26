private - accessing
boundaries: aSymbol
	"aSymbol = #closed  or  #torroidal"
	
	self boundaries == aSymbol ifTrue: [^self].
	boundaries := aSymbol.
	self initNeighbourhood.
	self initEdge.
	self cormasModel registerSpaceModelChange: #boundariesChanged	"dispatch the info to other spaceInterfaces"