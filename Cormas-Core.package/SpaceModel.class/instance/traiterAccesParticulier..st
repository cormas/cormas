private - irregular polygons creation
traiterAccesParticulier: val
	
	| point listePoint |
	listePoint := self traiterChaineDeCaractere: val.
	point := (listePoint at: 1) asNumber @ (listePoint at: 2) asNumber.
	^point