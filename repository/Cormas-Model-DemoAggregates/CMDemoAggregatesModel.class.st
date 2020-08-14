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
]

{ #category : #description }
CMDemoAggregatesModel class >> howToRunIt [
| txt |
txt := '1. Spreading of 3 forests\' withCRs asText emphasizeAllWith: #(#bold #large).
txt := txt, '1.1 From the Cormas main menu, load ' asText, ('Files -> Load ' asText emphasizeAllWith: #italic), '. Select ' asText, ('TSE ' asText emphasizeAllWith: #italic), 'and choose ' asText, ('SpreadForest.st ' asText emphasizeAllWith: #color -> Color red), ' version of TSE.\' withCRs asText.
txt := txt, '1.2 Click on the first icon of the ' asText, ('Visualisation ' asText emphasizeAllWith: #color -> Color red), 'area to open the standard spatial grid.\' withCRs asText.
txt := txt, '1.3 From the spatial grid menu, use ' asText, ('Tools -> Load an environment' asText emphasizeAllWith: #italic), ', select ' asText, ('3forests.env ' asText emphasizeAllWith: #italic), 'and validate. This will initialize a 50*50 grid and assign values (#tree or #empty) to the cell attribute ' asText, ('context\' withCRs asText emphasizeAllWith: #italic).
txt := txt, '1.4 Right-click within the spatial grid window to select the ' asText, ('povTree ' asText emphasizeAllWith: #italic), 'view for ' asText, ('Cell' asText emphasizeAllWith: #italic), '.\' withCRs asText.
txt := txt, '1.5 Click on the ' asText, ('Initialize ' asText emphasizeAllWith: #italic), 'button of the ' asText, ('Simulation ' asText emphasizeAllWith: #color -> Color red),  'area.\' withCRs asText.
txt := txt, '1.6 Select the ' asText, ('initForests ' asText emphasizeAllWith: #italic), 'and ' asText, ('stepForests: ' asText emphasizeAllWith: #italic), 'methods, then validate by clicking on ' asText, ('Apply and close.' asText emphasizeAllWith: #italic), ' This version builds first level Aggregates (the forests are composed of connected cells with #forest as context) and second level aggregates : a fragmented aggregate composed with first level aggregates.\'  withCRs asText.
txt := txt, '1.7 Right-click within the spatial grid window to select the ' asText, ('povSize ' asText emphasizeAllWith: #italic), 'view for ' asText, ('Aggregate' asText emphasizeAllWith: #italic), '.\' withCRs asText.
txt := txt, '1.8 Enter 30 in the ' asText, ('Final time ' asText emphasizeAllWith: #italic), 'input field of the ' asText,  ('Simulation ' asText emphasizeAllWith: #color -> Color red),  'area.\' withCRs asText.
txt := txt, '1.9 Click on the ' asText, ('Run ' asText emphasizeAllWith: #italic), 'button of the ' asText,  ('Simulation ' asText emphasizeAllWith: #color -> Color red),  'area.\\' withCRs asText.

txt := txt, ('2. Swelling from 10 seeds\' withCRs asText emphasizeAllWith: #(#bold #large)).
txt := txt, '2.1 From the spatial grid menu, use ' asText, ('Tools -> Load an environment' asText emphasizeAllWith: #italic), ', select ' asText, ('10seeds.env ' asText emphasizeAllWith: #italic), 'and validate. This will initialize a 50*50 grid and assign values (true or false) to the cell attribute ' asText, ('seed\' withCRs asText emphasizeAllWith: #italic).
txt := txt, '2.2 Right-click within the spatial grid window to select the ' asText, ('povSeed ' asText emphasizeAllWith: #italic), 'view for ' asText, ('Cell' asText emphasizeAllWith: #italic), '.\' withCRs asText.
txt := txt, '2.3 Click on the ' asText, ('Initialize ' asText emphasizeAllWith: #italic), 'button of the ' asText, ('Simulation ' asText emphasizeAllWith: #color -> Color red),  'area.\' withCRs asText.
txt := txt, '2.4 Select the ' asText, ('initSeeds ' asText emphasizeAllWith: #italic), 'and ' asText, ('stepSeeds: ' asText emphasizeAllWith: #italic), 'methods, then validate by clicking on ' asText, ('Apply and close.\' asText emphasizeAllWith: #italic) withCRs asText.
txt := txt, '2.5 Right-click within the spatial grid window to select the ' asText, ('povId ' asText emphasizeAllWith: #italic), 'view for ' asText, ('Aggregate' asText emphasizeAllWith: #italic), '.\' withCRs asText.
txt := txt, '2.6 Click on the ' asText, ('Step ' asText emphasizeAllWith: #italic), 'button of the ' asText,  ('Simulation ' asText emphasizeAllWith: #color -> Color red),  'area.\\' withCRs asText.
txt := txt, ('3. Save and load your environment\' withCRs asText emphasizeAllWith: #(#bold #large)).
txt := txt, '3.1 From the Cormas main menu, load ' asText, ('Files -> Load ' asText emphasizeAllWith: #italic), '. Select ' asText, ('TSE ' asText emphasizeAllWith: #italic), 'and choose ' asText, ('Save-Load-Aggregates.st ' asText emphasizeAllWith: #color -> Color red), ' version of TSE.\' withCRs asText.
txt := txt, '3.2 The init method will load a 50*50 grid and load the aggregate instances and their neighbours.\' withCRs asText.
txt := txt, '3.2 If you want to see how to save the current grid, the aggregates and their neighbours, see the ' asText, ('exportAggregatesAndNeighbours:' asText emphasizeAllWith: #italic), ' method. (You can also save the neighbours of the cells. It can save time when you load big irregular grid (see the ' asText, ('exportNeighboors' asText emphasizeAllWith: #italic), ' method).\' withCRs asText.
"ComposedTextView open: txt asValue label: ('How to run ', self name, '     step-by-step instructions') icon: (Icon constantNamed: #workspace) extent: 530@550"
]

{ #category : #testing }
CMDemoAggregatesModel class >> isAbstract [ 
^false
]

{ #category : #'- default value' }
CMDemoAggregatesModel class >> seeds_default [ 
	"Return the default value of seeds attribute"	
	^nil
]

{ #category : #procedures }
CMDemoAggregatesModel >> buildForests [
	"Create the Aggregates from trees. Each aggregate must be bigger than 25 cells (set the compactness)"
	self deleteSpatialEntitySet: CMDemoAggregatesGrove.
	self createAggregates: CMDemoAggregatesGrove from: CMDemoAggregatesPlot verifying: [:aCell | aCell tree] minimumSize: 25.
	self theGroves do: [:agg | agg initNeighbourhood].
	self spaceModel meanCompactness: CMDemoAggregatesGrove
]

{ #category : #procedures }
CMDemoAggregatesModel >> buildFragmentedEntitiesFromAggregates [
	self spaceModel
		setFragmentedEntities: CMDemoAggregatesFragmentedForest
		from: CMDemoAggregatesGrove
		verifying: [:c | c size > 50]
]

{ #category : #procedures }
CMDemoAggregatesModel >> buildFragmentedEntitiesFromCells [

	self spaceModel
		setFragmentedEntities: CMDemoAggregatesFragmentedForest
		from: CMDemoAggregatesPlot
		verifying: #tree
]

{ #category : #procedures }
CMDemoAggregatesModel >> createNewAggregateWith: setCell [

	| fe |

	fe := CMDemoAggregatesFragmentedForest newWith: setCell.
	fe id: CMDemoAggregatesFragmentedForest CurrentId.
	fe components: OrderedCollection new.
	fe components addAll: setCell.
	setCell do: [ : c | c theCSE at: #CMDemoAggregatesFragmentedForest put: fe ].
	(self spaceModel spatialEntities at: #CMDemoAggregatesFragmentedForest) add: fe.
	fe spaceModel: self spaceModel.
	self theFragmentedForests add: fe.
]

{ #category : #procedures }
CMDemoAggregatesModel >> defaultDisplay [
	self openOneSpaceInterface.
	self displayPov: #povTree of: CMDemoAggregatesPlot.
	self displayPov: #delimitors of: CMDemoAggregatesGrove
]

{ #category : #procedures }
CMDemoAggregatesModel >> exportForests [
	self spaceModel 
		exportAggregateClass: CMDemoAggregatesGrove 
		separator: $;
]

{ #category : #procedures }
CMDemoAggregatesModel >> exportNeighboors [
	self spaceModel saveNeighboorsClass: CMDemoAggregatesGrove separator: $;
	"self spaceModel saveNeighboorsClass: Cell separator: $;"
]

{ #category : #seeds }
CMDemoAggregatesModel >> givenSeeds [
"set 5 particular seeds on the space"
	self seeds: OrderedCollection new.
	self seeds add: self spaceModel centralLocation;
		add: self spaceModel upperRightLocation;
		add: self spaceModel upperLeftLocation;
		add: self spaceModel lowerRightLocation;
		add: self spaceModel lowerLeftLocation.
	self seeds do: [:c | c seed: true].
	^self seeds
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
	self spaceModel loadNeighboorsClass: CMDemoAggregatesGrove separator: $;
]

{ #category : #init }
CMDemoAggregatesModel >> init1FragmentedAggregate [
"Build 1 FragmentedForest of forested plots"
	self loadEnvironmentFromFile: '3forests.env'.
	self buildFragmentedEntitiesFromCells.
	self defaultDisplay.
	self displayPov: #nil of: CMDemoAggregatesGrove.
	self displayPov: #povId of: CMDemoAggregatesFragmentedForest
]

{ #category : #init }
CMDemoAggregatesModel >> init2AggregateLevels [
"Build the 3 groves + the FragmentedForest. Each FragmentedForest is composed of groves having the same surface: 
	1 of 128 groves of 1 plot, 	1 of 49 groves of 2 plots, 	1 of 21 groves of 3 plots,
	1 of 1 grove of 240 plots, 	1 of 1 grove of 80 plots, 	1 of 2 groves of 4 plots,
	1 of 1 grove of 143 plots"
	self loadEnvironmentFromFile: '3forests.env'.
	self createAggregates: CMDemoAggregatesGrove from: CMDemoAggregatesPlot verifying: [:aCell | aCell tree].
	self theGroves do:[:ag| ag initNeighbourhood].
	self createFragmentedEntities: CMDemoAggregatesFragmentedForest from: CMDemoAggregatesGrove attribute: #size.
	self defaultDisplay.
	self displayPov: #nil of: CMDemoAggregatesGrove.
	self displayPov: #povId of: CMDemoAggregatesFragmentedForest
]

{ #category : #init }
CMDemoAggregatesModel >> initForests [
	"Constructs the forest aggregates"

	self loadEnvironmentFromFile: '3forests.env'.
	self buildForests.
	self buildFragmentedEntitiesFromAggregates.
	self defaultDisplay
]

{ #category : #seeds }
CMDemoAggregatesModel >> randomSeeds: n [
	"Spreads randomly n seeds on the space"

	| newSeed |
	self seeds: OrderedCollection new.
	[self seeds size < n]
		whileTrue: 
			[newSeed := Cormas selectRandomlyFrom: self thePlots.
			(self seeds includes: newSeed)
				ifFalse: 
					[self seeds add: newSeed.
					newSeed seed: true]].
	^self seeds
]

{ #category : #accessing }
CMDemoAggregatesModel >> seeds [
^seeds
]

{ #category : #accessing }
CMDemoAggregatesModel >> seeds: aValue [
seeds := aValue
]

{ #category : #init }
CMDemoAggregatesModel >> setAggregatesFifthFourth [
	"Constructs a complete space partition by regular segmentation"

	self spaceModel loadEnvironmentFromFile: '3forests.env'.
	self createAggregates: CMDemoAggregatesGrove from: CMDemoAggregatesPlot horizontalDividers: 5 verticalDividers: 4.
	self defaultDisplay
]

{ #category : #init }
CMDemoAggregatesModel >> setAggregatesFromRandomSeeds [
	"Constructs a complete space partition from seeds"

	self loadEnvironmentFromFile: '3forests.env'.
	self createAggregates: CMDemoAggregatesGrove
		fromSeeds: (self randomSeeds: 30)
		sizeDistribution: #(#(30 80) )
		"sizeDistribution: #(#(1 800) #(5 30) #(4 3) #(20 10))".
	self displayPov: #povId of: CMDemoAggregatesGrove.
	self displayInfo: #info_surface of: CMDemoAggregatesGrove
]

{ #category : #init }
CMDemoAggregatesModel >> setSingletonAggregatesFromRandomSeeds [
	"Constructs 30 singleton groves from random seeds.
	Step = swellForests: t"

	"self spaceModel loadEnvironmentFromFile: '3forests.env'."
	self createSingletonAggregates: CMDemoAggregatesGrove
		fromSeeds: (self randomSeeds: 30).
	self ask: CMDemoAggregatesGrove toDo: #setForest.
	self displayPov: #povId of: CMDemoAggregatesGrove.
	self displayInfo: #info_surface of: CMDemoAggregatesGrove
]

{ #category : #control }
CMDemoAggregatesModel >> step2AggregateLevels: t [
	"the 1st FragmentedForest will swell"
	self ask:
			(Cormas elementsFrom: self theFragmentedForests withMinValue: #minSurface)
		toDo: #swell
]

{ #category : #control }
CMDemoAggregatesModel >> stepForests: t [ 
"Each cell has a small probability of changing its state. Then each grove expands on external cells that are mostly surrounded by groves. Finally, the aggregates are rebuilt"
	self thePlots do: [:c | c newState].
	self theGroves do: [:a | a expand].
	self buildForests
]

{ #category : #control }
CMDemoAggregatesModel >> swellForests: t [
"Each grove swells on external cells"

	self askRandom: CMDemoAggregatesGrove toDo: #swell
]

{ #category : #accessing }
CMDemoAggregatesModel >> theCMFragmentedForests [
	^ theFragmentedForests
		ifNil: [ theFragmentedForests := OrderedCollection new ]
]

{ #category : #accessing }
CMDemoAggregatesModel >> theCMGroves [
	^ theGroves ifNil: [ theGroves := OrderedCollection new ]
]

{ #category : #accessing }
CMDemoAggregatesModel >> theCMPlots [
	^ thePlots ifNil: [ thePlots := OrderedCollection new ]
]

{ #category : #accessing }
CMDemoAggregatesModel >> theFragmentedForests [
	^ theFragmentedForests
		ifNil: [ theFragmentedForests := OrderedCollection new ]
]

{ #category : #accessing }
CMDemoAggregatesModel >> theFragmentedForests: x [
theFragmentedForests := x
]

{ #category : #accessing }
CMDemoAggregatesModel >> theGroves [
	^ theGroves ifNil: [ theGroves := OrderedCollection new ]
]

{ #category : #accessing }
CMDemoAggregatesModel >> theGroves: x [ 
	theGroves := x
]

{ #category : #accessing }
CMDemoAggregatesModel >> thePlots [
	^ thePlots ifNil: [ thePlots := OrderedCollection new ]
]

{ #category : #accessing }
CMDemoAggregatesModel >> thePlots: x [ 
	thePlots := x
]
