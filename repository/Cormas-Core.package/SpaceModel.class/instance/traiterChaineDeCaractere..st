private - irregular polygons creation
traiterChaineDeCaractere: chaine
	
	| spaceIndex objetGraphique nombreElement listeTemp |
	listeTemp := OrderedCollection new.
	spaceIndex := chaine indexOf: Character space.
	spaceIndex = 0
		ifFalse:
			[objetGraphique := chaine
				copyFrom: 1
				to: spaceIndex - 1.
			nombreElement := chaine
				copyFrom: spaceIndex + 1
				to: chaine size.
			listeTemp
				add: objetGraphique;
				add: nombreElement].
	^listeTemp