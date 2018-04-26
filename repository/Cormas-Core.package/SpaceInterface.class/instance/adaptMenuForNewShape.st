menus
adaptMenuForNewShape
	"adapt the menu"
	
	| menu |
	menu := self menuCellshape.
	spaceModel gridCellShape = #hexagonal
		ifTrue:
			[(menu atNameKey: #fourconnexe) beOff.
			(menu atNameKey: #eightconnexe) beOff.
			(menu atNameKey: #square) beOff.
			(menu atNameKey: #hexagonal) beOn]
		ifFalse:
			[(menu atNameKey: #square) beOn.
			(menu atNameKey: #hexagonal) beOff.
			spaceModel nbNeighbours = #four
				ifTrue:
					[(menu atNameKey: #fourconnexe) beOn.
					(menu atNameKey: #eightconnexe) beOff]
				ifFalse:
					[(menu atNameKey: #fourconnexe) beOff.
					(menu atNameKey: #eightconnexe) beOn]]