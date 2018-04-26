actions
requestConstraintsOnPatches
	"open a Patch selection window 
and return a collec of pacthes "
	
	| dialog |
	dialog := PatchConstraintDialog new.
	dialog cells: self cormasModel theESE.
	dialog open.
	^dialog selectedCells