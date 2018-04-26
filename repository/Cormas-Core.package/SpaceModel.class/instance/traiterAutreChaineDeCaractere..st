private - irregular polygons creation
traiterAutreChaineDeCaractere: chaine
	"ex: chaine = '    Pen (1,2,0) '   et retourne une coll du genre : OrderedCollection ('Pen' '(1,2,0) ')  "
	
	| objet liste |
	objet := chaine copyReplaceFrom: 1 to: 4 with: ''.
	liste := self traiterChaineDeCaractere: objet.
	^liste