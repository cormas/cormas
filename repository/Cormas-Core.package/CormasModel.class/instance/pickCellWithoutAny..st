+ accessing - entities
pickCellWithoutAny: aClass
	"Purpose: return a cell (picked randomly) without any instance of aClassName
Return Value: a cell
Example1: self pickCellWithoutAny: Building
Example2: self pickCellWithoutAny: #Building"
	
	^self pickCellConstrainedBy: [:cell | (cell occupantsAt: aClass) isEmpty]