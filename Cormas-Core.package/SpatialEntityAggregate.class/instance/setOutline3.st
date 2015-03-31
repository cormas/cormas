- displaying
setOutline3
	"outine est une collection de points"
	
	| externalNeighCells outlineTempo skin |
	self outline: OrderedCollection new.
	outlineTempo := Set new.
	skin := self getSkinE.
	skin
		do:
			[:cell | 
			externalNeighCells := cell neighbourhood
				select: [:n | (self elementaryComponents includes: n) not].
			externalNeighCells
				do: [:n | outlineTempo addAll: (cell sharedOutlineWith: n)]].
	self outline addAll: outlineTempo.
	self outline add: (self outline at: 1)