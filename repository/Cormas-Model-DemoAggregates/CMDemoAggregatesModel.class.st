"
'The CMDemo_Aggregates model is a didactic model that allows to test two different ways to create spatial aggregates with Cormas. This model introduces the functionning principles of Cormas aggregative spatial entities. In the inheritage tree of the Cormas generic spatial entities, the compound spatial entity SpatialEntity_Set is specialized in :
      	* SpatialEntityAggregate  whose components should be contiguous (the Groves),
   		* SpatialEntityNotConnex  whose components may not be contiguous (the FragmentedForests).

The operations of aggregation-disintegration are based on the two attributes: ''components'' (a collection of lower level spatial entities) and ''theCSE'' (a register of belonging to higer level spatial entities). 

In the first scenario (initForests - stepForests:), the components are defined as sets of contiguous cells sharing a same condition. The initialization loads a spatial grid made of 50*50 cells (instances of the CMPlot class) from a file. Each plot has either #tree (aggregation condition) or #empty as value of its ''context'' attribute. The effective instanciation of the Groves (SpatialEntityAggregate) is done by selecting the connected plots with #tree as context, plus an additional constraint about a minimum number (set to 25) of contiguous plots verifying the aggregation condition. 
To let co-exist in the same model several spatial entities defined at different levels gives a great flexibility to write the dynamics of the model. Some of the processes are more easily described at the cellular level (newContext), as for some others, the aggregated level is more suitable (expand or swell). In this didactic and simplistic example, each plot has a fixed (very low) probability to switch its context attribute value. At the level of the groves, a spreading process from the edges is written like this: a given number (corresponding to the hundredth of the total number of components of the forestry entity) of cells at the outside edge are going to be aggregated to the forest. In order to keep a high compacity to the forestry entities, a priority is given to the cells that are surrounded by the highest number of already aggregated cells. 
      
In the second one, 10 seed cells are randomly chosen in the 50*50 spatial grid. 10 aggregates are intialized with one of these seeds as a single component. The iterative building process of the aggregates relies on the integration, among the cells belonging to the outside edge of each aggregate, of all the one that do not yet belong to another aggregate'
"
Class {
	#name : #CMDemoAggregatesModel,
	#superclass : #CMAbstractModel,
	#instVars : [
		'thePlots',
		'theGroves',
		'seeds',
		'partitionsAverageSize',
		'nbCells',
		'theFragmentedForests'
	],
	#category : #'Cormas-Model-DemoAggregates'
}

{ #category : #description }
CMDemoAggregatesModel class >> aProposDe [
	| tmp1 |
	tmp1 := 'Ce modele illustre les principes d''utilisation des entites spatiales agregatives de Cormas. Dans l''arbre d''heritage des entites spatiales generiques de Cormas, l''entite spatiale composee SpatialEntity_Set se specialise :
      * SpatialEntityAggregate  dont les composants respectent une contrainte de contiguite
      * SpatialEntityNotConnex  dont les composants peuvent etre disjoints.

Les operations d''agregation-desagregation sont realisees a partir des deux attributs, components        (une collection d''entites spatiales de niveau hierarchique inferieur) et theCSE (un registre d''appartenance a des entites spatiales de niveaux superieurs). 

Le modele TSE permet de tester deux facons de creer des agregats avec Cormas.

La premiere consiste a definir les composantes comme des ensembles de cellules contigues partageant une meme condition. On commence par charger une grille de 50*50 cellules de type Cell dont l''attribut context est soit #forest (condition d''agregation), soit #empty. La creation des entites spatiales composees Aggregate est soumise a une contrainte supplementaire sur le nombre minimum (fixe a 25) de composants contigus verifiant la condition d''agregation. Faire co-exister dans le meme modele des entites spatiales definies a differents niveaux offre une grande souplesse pour ecrire les methodes de dynamique de la vegetation. Certains processus seront plus facilement decrits au niveau cellulaire, d''autres au niveau agrege. Ainsi, dans cet exemple theorique simpliste, chaque cellule a une probabilite fixee (tres faible) de changer de contexte. Une dynamique d''expansion par la lisiere est ecrite (au niveau agrege) de la facon suivante: un certain nombre (correspondant au centieme du total des cellules composants l''entite forestiere) de cellules en lisiere vont etre integrees a la foret. Dans le but de garder une certaine compacite aux entites forestieres, on choisit en priorite les cellules de la lisiere qui sont entourees du plus grand nombre de cellules deja agregees. 

La seconde consiste a partir de 10 cellules graines, et a creer autant d''agregats initialement constitues  d''un seul composant: une graine. Le processus iteratif de construction des agregats repose sur l''integration, parmi les cellules en lisiere, de toutes celles qui n''appartiennent pas encore a un autre agregat.'
		asText emphasizeAllWith: #(#bold)
]

{ #category : #description }
CMDemoAggregatesModel class >> howToRunIt [
	| tmp1 |
	tmp1 := '1. Spreading of 3 forests\' withCRs asText
		emphasizeAllWith: #(#bold #large).
	tmp1 := tmp1 , '1.1 From the Cormas main menu, load ' asText
		, ('Files -> Load ' asText emphasizeAllWith: #italic)
		, '. Select ' asText , ('TSE ' asText emphasizeAllWith: #italic)
		, 'and choose ' asText
		, ('SpreadForest.st ' asText emphasizeAllWith: #color -> Color red)
		, ' version of TSE.\' withCRs asText.
	tmp1 := tmp1 , '1.2 Click on the first icon of the ' asText
		, ('Visualisation ' asText emphasizeAllWith: #color -> Color red)
		, 'area to open the standard spatial grid.\' withCRs asText.
	tmp1 := tmp1 , '1.3 From the spatial grid menu, use ' asText
		, ('Tools -> Load an environment' asText emphasizeAllWith: #italic)
		, ', select ' asText
		, ('3forests.env ' asText emphasizeAllWith: #italic)
		,
			'and validate. This will initialize a 50*50 grid and assign values (#tree or #empty) to the cell attribute '
				asText , ('context\' withCRs asText emphasizeAllWith: #italic).
	tmp1 := tmp1
		, '1.4 Right-click within the spatial grid window to select the ' asText
		, ('povTree ' asText emphasizeAllWith: #italic) , 'view for ' asText
		, ('Cell' asText emphasizeAllWith: #italic) , '.\' withCRs asText.
	tmp1 := tmp1 , '1.5 Click on the ' asText
		, ('Initialize ' asText emphasizeAllWith: #italic)
		, 'button of the ' asText
		, ('Simulation ' asText emphasizeAllWith: #color -> Color red)
		, 'area.\' withCRs asText.
	tmp1 := tmp1 , '1.6 Select the ' asText
		, ('initForests ' asText emphasizeAllWith: #italic) , 'and ' asText
		, ('stepForests: ' asText emphasizeAllWith: #italic)
		, 'methods, then validate by clicking on ' asText
		, ('Apply and close.' asText emphasizeAllWith: #italic)
		,
			' This version builds first level Aggregates (the forests are composed of connected cells with #forest as context) and second level aggregates : a fragmented aggregate composed with first level aggregates.\'
				withCRs asText.
	tmp1 := tmp1
		, '1.7 Right-click within the spatial grid window to select the ' asText
		, ('povSize ' asText emphasizeAllWith: #italic) , 'view for ' asText
		, ('Aggregate' asText emphasizeAllWith: #italic)
		, '.\' withCRs asText.
	tmp1 := tmp1 , '1.8 Enter 30 in the ' asText
		, ('Final time ' asText emphasizeAllWith: #italic)
		, 'input field of the ' asText
		, ('Simulation ' asText emphasizeAllWith: #color -> Color red)
		, 'area.\' withCRs asText.
	tmp1 := tmp1 , '1.9 Click on the ' asText
		, ('Run ' asText emphasizeAllWith: #italic)
		, 'button of the ' asText
		, ('Simulation ' asText emphasizeAllWith: #color -> Color red)
		, 'area.\\' withCRs asText.
	tmp1 := tmp1
		,
			('2. Swelling from 10 seeds\' withCRs asText
				emphasizeAllWith: #(#bold #large)).
	tmp1 := tmp1 , '2.1 From the spatial grid menu, use ' asText
		, ('Tools -> Load an environment' asText emphasizeAllWith: #italic)
		, ', select ' asText
		, ('10seeds.env ' asText emphasizeAllWith: #italic)
		,
			'and validate. This will initialize a 50*50 grid and assign values (true or false) to the cell attribute '
				asText , ('seed\' withCRs asText emphasizeAllWith: #italic).
	tmp1 := tmp1
		, '2.2 Right-click within the spatial grid window to select the ' asText
		, ('povSeed ' asText emphasizeAllWith: #italic) , 'view for ' asText
		, ('Cell' asText emphasizeAllWith: #italic) , '.\' withCRs asText.
	tmp1 := tmp1 , '2.3 Click on the ' asText
		, ('Initialize ' asText emphasizeAllWith: #italic)
		, 'button of the ' asText
		, ('Simulation ' asText emphasizeAllWith: #color -> Color red)
		, 'area.\' withCRs asText.
	tmp1 := tmp1 , '2.4 Select the ' asText
		, ('initSeeds ' asText emphasizeAllWith: #italic) , 'and ' asText
		, ('stepSeeds: ' asText emphasizeAllWith: #italic)
		, 'methods, then validate by clicking on ' asText
		, ('Apply and close.\' asText emphasizeAllWith: #italic) withCRs asText.
	tmp1 := tmp1
		, '2.5 Right-click within the spatial grid window to select the ' asText
		, ('povId ' asText emphasizeAllWith: #italic) , 'view for ' asText
		, ('Aggregate' asText emphasizeAllWith: #italic)
		, '.\' withCRs asText.
	tmp1 := tmp1 , '2.6 Click on the ' asText
		, ('Step ' asText emphasizeAllWith: #italic)
		, 'button of the ' asText
		, ('Simulation ' asText emphasizeAllWith: #color -> Color red)
		, 'area.\\' withCRs asText.
	tmp1 := tmp1
		,
			('3. Save and load your environment\' withCRs asText
				emphasizeAllWith: #(#bold #large)).
	tmp1 := tmp1 , '3.1 From the Cormas main menu, load ' asText
		, ('Files -> Load ' asText emphasizeAllWith: #italic)
		, '. Select ' asText , ('TSE ' asText emphasizeAllWith: #italic)
		, 'and choose ' asText
		,
			('Save-Load-Aggregates.st ' asText
				emphasizeAllWith: #color -> Color red)
		, ' version of TSE.\' withCRs asText.
	tmp1 := tmp1
		,
			'3.2 The init method will load a 50*50 grid and load the aggregate instances and their neighbours.\'
				withCRs asText.
	tmp1 := tmp1
		,
			'3.2 If you want to see how to save the current grid, the aggregates and their neighbours, see the '
				asText
		, ('exportAggregatesAndNeighbours:' asText emphasizeAllWith: #italic)
		,
			' method. (You can also save the neighbours of the cells. It can save time when you load big irregular grid (see the '
				asText , ('exportNeighboors' asText emphasizeAllWith: #italic)
		, ' method).\' withCRs asText
]

{ #category : #testing }
CMDemoAggregatesModel class >> isAbstract [
	^ false
]

{ #category : #'default value' }
CMDemoAggregatesModel class >> seeds_default [
	^ nil
]

{ #category : #procedures }
CMDemoAggregatesModel >> buildForests [
	self
		deleteSpatialEntitySet: CMDemoAggregatesGrove;
		createAggregates: CMDemoAggregatesGrove
			from: CMDemoAggregatesPlot
			verifying: [ :arg1 | arg1 tree ]
			minimumSize: 25.
	self theGroves do: [ :arg2 | arg2 initNeighbourhood ].
	self spaceModel meanCompactness: CMDemoAggregatesGrove
]

{ #category : #procedures }
CMDemoAggregatesModel >> buildFragmentedEntitiesFromAggregates [
	self spaceModel
		setFragmentedEntities: CMDemoAggregatesFragmentedForest
		from: CMDemoAggregatesGrove
		verifying: [ :arg1 | arg1 size > 50 ]
]

{ #category : #procedures }
CMDemoAggregatesModel >> buildFragmentedEntitiesFromCells [
	self spaceModel
		setFragmentedEntities: CMDemoAggregatesFragmentedForest
		from: CMDemoAggregatesPlot
		verifying: #tree
]

{ #category : #procedures }
CMDemoAggregatesModel >> createNewAggregateWith: arg1 [
	| tmp1 |
	tmp1 := CMDemoAggregatesFragmentedForest newWith: arg1.
	tmp1
		id: CMDemoAggregatesFragmentedForest CurrentId;
		components: OrderedCollection new.
	tmp1 components addAll: arg1.
	arg1
		do: [ :arg2 | arg2 theCSE at: #CMDemoAggregatesFragmentedForest put: tmp1 ].
	(self spaceModel spatialEntities
		at: #CMDemoAggregatesFragmentedForest) add: tmp1.
	tmp1 spaceModel: self spaceModel.
	self theFragmentedForests add: tmp1
]

{ #category : #procedures }
CMDemoAggregatesModel >> defaultDisplay [
	self
		openOneSpaceInterface;
		displayPov: #povTree of: CMDemoAggregatesPlot;
		displayPov: #delimitors of: CMDemoAggregatesGrove
]

{ #category : #procedures }
CMDemoAggregatesModel >> exportForests [
	self spaceModel
		exportAggregateClass: CMDemoAggregatesGrove
		separator: $;
]

{ #category : #procedures }
CMDemoAggregatesModel >> exportNeighboors [
	self spaceModel
		saveNeighboorsClass: CMDemoAggregatesGrove
		separator: $;
]

{ #category : #seeds }
CMDemoAggregatesModel >> givenSeeds [
	| tmp2 |
	self seeds: OrderedCollection new.
	tmp2 := self seeds.
	tmp2
		add: self spaceModel centralLocation;
		add: self spaceModel upperRightLocation;
		add: self spaceModel upperLeftLocation;
		add: self spaceModel lowerRightLocation;
		add: self spaceModel lowerLeftLocation.
	self seeds do: [ :arg1 | arg1 seed: true ].
	^ self seeds
]

{ #category : #procedures }
CMDemoAggregatesModel >> importForests [
	self spaceModel
		importAggregateClass: CMDemoAggregatesGrove
		componentClass: CMDemoAggregatesPlot
		separator: $;
]

{ #category : #procedures }
CMDemoAggregatesModel >> importNeighboors [
	self spaceModel
		loadNeighboorsClass: CMDemoAggregatesGrove
		separator: $;
]

{ #category : #init }
CMDemoAggregatesModel >> init1FragmentedAggregate [
	self
		loadEnvironmentFromDirectory: '3forests.cells';
		buildFragmentedEntitiesFromCells;
		defaultDisplay;
		displayPov: #nil of: CMDemoAggregatesGrove;
		displayPov: #povId of: CMDemoAggregatesFragmentedForest
]

{ #category : #init }
CMDemoAggregatesModel >> init2AggregateLevels [
	self
		loadEnvironmentFromDirectory: '3forests.cells';
		createAggregates: CMDemoAggregatesGrove
			from: CMDemoAggregatesPlot
			verifying: [ :arg1 | arg1 tree ].
	self theGroves do: [ :arg2 | arg2 initNeighbourhood ].
	self
		createFragmentedEntities: CMDemoAggregatesFragmentedForest
			from: CMDemoAggregatesGrove
			attribute: #size;
		defaultDisplay;
		displayPov: #nil of: CMDemoAggregatesGrove;
		displayPov: #povId of: CMDemoAggregatesFragmentedForest
]

{ #category : #init }
CMDemoAggregatesModel >> initForests [
	self
		loadEnvironmentFromDirectory: '3forests.cells';
		buildForests;
		buildFragmentedEntitiesFromAggregates;
		defaultDisplay
]

{ #category : #seeds }
CMDemoAggregatesModel >> randomSeeds: arg1 [
	| tmp1 |
	self seeds: OrderedCollection new.
	[ self seeds size < arg1 ]
		whileTrue: [ tmp1 := Cormas selectRandomlyFrom: self thePlots.
			(self seeds includes: tmp1)
				ifFalse: [ self seeds add: tmp1.
					tmp1 seed: true ] ].
	^ self seeds
]

{ #category : #accessing }
CMDemoAggregatesModel >> seeds [
	^ seeds
]

{ #category : #accessing }
CMDemoAggregatesModel >> seeds: arg1 [
	seeds := arg1
]

{ #category : #init }
CMDemoAggregatesModel >> setAggregatesFifthFourth [
	self spaceModel loadEnvironmentFromDirectory: '3forests.cells'.
	self
		createAggregates: CMDemoAggregatesGrove
			from: CMDemoAggregatesPlot
			horizontalDividers: 5
			verticalDividers: 4;
		defaultDisplay
]

{ #category : #init }
CMDemoAggregatesModel >> setAggregatesFromRandomSeeds [
	self
		loadEnvironmentFromDirectory: '3forests.cells';
		createAggregates: CMDemoAggregatesGrove
			fromSeeds: (self randomSeeds: 30)
			sizeDistribution: #(#(30 80));
		displayPov: #povId of: CMDemoAggregatesGrove;
		displayInfo: #info_surface of: CMDemoAggregatesGrove
]

{ #category : #init }
CMDemoAggregatesModel >> setSingletonAggregatesFromRandomSeeds [

	self loadEnvironmentFromDirectory: '3forests.cells'.
	
	self
		createSingletonAggregates: CMDemoAggregatesGrove fromSeeds: (self randomSeeds: 30);
		ask: CMDemoAggregatesGrove toDo: #setForest;
		displayPov: #povId of: CMDemoAggregatesGrove
		"displayInfo: #info_surface of: CMDemoAggregatesGrove"
]

{ #category : #control }
CMDemoAggregatesModel >> step2AggregateLevels: arg1 [
	self
		ask:
			(Cormas
				elementsFrom: self theFragmentedForests
				withMinValue: #minSurface)
		toDo: #swell
]

{ #category : #control }
CMDemoAggregatesModel >> stepForests: arg1 [
	self thePlots do: [ :arg2 | arg2 newState ].
	self theGroves do: [ :arg3 | arg3 expand ].
	self buildForests
]

{ #category : #control }
CMDemoAggregatesModel >> swellForests: arg1 [
	self askRandom: CMDemoAggregatesGrove toDo: #swell
]

{ #category : #accessing }
CMDemoAggregatesModel >> theCMFragmentedForests [
	| tmp2 |
	tmp2 := theFragmentedForests.
	^ tmp2
		ifNil: [ theFragmentedForests := OrderedCollection new ]
		ifNotNil: [ tmp2 ]
]

{ #category : #accessing }
CMDemoAggregatesModel >> theCMGroves [
	| tmp2 |
	tmp2 := theGroves.
	^ tmp2
		ifNil: [ theGroves := OrderedCollection new ]
		ifNotNil: [ tmp2 ]
]

{ #category : #accessing }
CMDemoAggregatesModel >> theCMPlots [
	| tmp2 |
	tmp2 := thePlots.
	^ tmp2
		ifNil: [ thePlots := OrderedCollection new ]
		ifNotNil: [ tmp2 ]
]

{ #category : #accessing }
CMDemoAggregatesModel >> theFragmentedForests [
	| tmp2 |
	tmp2 := theFragmentedForests.
	^ tmp2
		ifNil: [ theFragmentedForests := OrderedCollection new ]
		ifNotNil: [ tmp2 ]
]

{ #category : #accessing }
CMDemoAggregatesModel >> theFragmentedForests: arg1 [
	theFragmentedForests := arg1
]

{ #category : #accessing }
CMDemoAggregatesModel >> theGroves [
	| tmp2 |
	tmp2 := theGroves.
	^ tmp2
		ifNil: [ theGroves := OrderedCollection new ]
		ifNotNil: [ tmp2 ]
]

{ #category : #accessing }
CMDemoAggregatesModel >> theGroves: arg1 [
	theGroves := arg1
]

{ #category : #accessing }
CMDemoAggregatesModel >> thePlots [
	| tmp2 |
	tmp2 := thePlots.
	^ tmp2
		ifNil: [ thePlots := OrderedCollection new ]
		ifNotNil: [ tmp2 ]
]

{ #category : #accessing }
CMDemoAggregatesModel >> thePlots: arg1 [
	thePlots := arg1
]
