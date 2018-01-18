description
aProposDe
	| txt |
	txt := 'Ce modele illustre les principes d''utilisation des entites spatiales agregatives de Cormas. Dans l''arbre d''heritage des entites spatiales generiques de Cormas, l''entite spatiale composee SpatialEntity_Set se specialise :
      * SpatialEntityAggregate  dont les composants respectent une contrainte de contiguite
      * SpatialEntityNotConnex  dont les composants peuvent etre disjoints.

Les operations d''agregation-desagregation sont realisees a partir des deux attributs, components        (une collection d''entites spatiales de niveau hierarchique inferieur) et theCSE (un registre d''appartenance a des entites spatiales de niveaux superieurs). 

Le modele TSE permet de tester deux facons de creer des agregats avec Cormas.

La premiere consiste a definir les composantes comme des ensembles de cellules contigues partageant une meme condition. On commence par charger une grille de 50*50 cellules de type Cell dont l''attribut context est soit #forest (condition d''agregation), soit #empty. La creation des entites spatiales composees Aggregate est soumise a une contrainte supplementaire sur le nombre minimum (fixe a 25) de composants contigus verifiant la condition d''agregation. Faire co-exister dans le meme modele des entites spatiales definies a differents niveaux offre une grande souplesse pour ecrire les methodes de dynamique de la vegetation. Certains processus seront plus facilement decrits au niveau cellulaire, d''autres au niveau agrege. Ainsi, dans cet exemple theorique simpliste, chaque cellule a une probabilite fixee (tres faible) de changer de contexte. Une dynamique d''expansion par la lisiere est ecrite (au niveau agrege) de la facon suivante: un certain nombre (correspondant au centieme du total des cellules composants l''entite forestiere) de cellules en lisiere vont etre integrees a la foret. Dans le but de garder une certaine compacite aux entites forestieres, on choisit en priorite les cellules de la lisiere qui sont entourees du plus grand nombre de cellules deja agregees. 

La seconde consiste a partir de 10 cellules graines, et a creer autant d''agregats initialement constitues  d''un seul composant: une graine. Le processus iteratif de construction des agregats repose sur l''integration, parmi les cellules en lisiere, de toutes celles qui n''appartiennent pas encore a un autre agregat.' asText emphasizeAllWith: #(#bold).
	"ComposedTextView open: txt asValue
		label: 'About ' , self name
		icon: (Icon constantNamed: #workspace)
		extent: 600 @ 600"