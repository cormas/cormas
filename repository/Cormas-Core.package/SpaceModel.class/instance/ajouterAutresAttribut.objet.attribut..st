private - irregular polygons creation
ajouterAutresAttribut: cel objet: objet attribut: attrib
	"Ex: cel = 0.49018@13.7327   objet = a Cell   attrib = 'center'"
	
	| listeAttributs position |
	listeAttributs := objet class allInstVarNames.
	1
		to: listeAttributs size
		do: [:b | (listeAttributs at: b) = attrib ifTrue: [position := b]].
	objet instVarAt: position put: cel