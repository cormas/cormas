"
This class is the main class of Cormas (!). It is instanciated from the VisualLauncher menu.
All the useful method for user are class method into utils's protocols, ex: Cormas random.
To run Cormas: 
		VW -> Tools -> Cormas -> Cormas english
or select the following instruction and 'Do it':
		CormasLauncher launchCormas

	instanceVariableNames: 'listEntiteRessource listEntiteSociete listAttribut nomModele nomEntite nomMethode aPartirDe lesEntitesType listMethode commeEntiteType classBuilder typeEntite lesAttributsTempo menuBar espaceModel vue compteur cycle dModelBuilder simulationCourante modeleCourant mode observationGOSIsOn classesOS nomGroupe classeGroupe ressources methodes modeRessource listeSelectA listeSelectB tailleSlider modeDisplay imageOS imageOSInVue lastSelection tailleHolder '



	classVariableNames: ''



	poolDictionaries: ''



	category: 'Plate forme'
"
Class {
	#name : #Cormas,
	#superclass : #Object,
	#instVars : [
		'reducedCommandsBar',
		'modelName',
		'eraseLinks',
		'obsWin',
		'visualStateWin',
		'definePatchWin',
		'defineCSEWin',
		'defineEntityWin',
		'defineObjectWin',
		'defineCommWin',
		'displayCommWin',
		'defineChartsWin',
		'displayChartsWin',
		'stepCounter',
		'cycle',
		'cormasModel',
		'cormasModelClass',
		'defineObservation',
		'listPassiveEntities',
		'listSpatialEntities',
		'listSocialEntities',
		'process',
		'displaySimNumber',
		'mainWin',
		'simulationWin',
		'modelNameField',
		'versionField',
		'exportPlaybackLog',
		'useExternalVisualization',
		'xmlModel',
		'simManager',
		'menuHolder',
		'useOnlyOneRB',
		'browser',
		'distributionControl',
		'isChangesDelayed',
		'subcanvasSim',
		'mainBuilder',
		'simName',
		'simNum'
	],
	#classInstVars : [
		'Rand',
		'seed',
		'simpleRand',
		'current',
		'runtimeMode'
	],
	#category : 'Cormas-Core-Interface'
}

{ #category : #accessing }
Cormas class >> Rand [
	
	Rand isNil
		ifTrue:
			[Rand := RandFishmanMoore new.
			seed := Rand class Ui].
	Rand class Ui isNil
		ifTrue:
			[Rand := RandFishmanMoore new.
			seed := Rand class Ui].
	^Rand
]

{ #category : #accessing }
Cormas class >> Rand: aRandFishmanMoore [
	
	Rand := aRandFishmanMoore
]

{ #category : #version }
Cormas class >> aboutCormas [
	| text dialog width |
	text := Cormas systemInformationString withCRs.
	width := 0.
	text linesDo: [ :l | width := width max: (Smalltalk ui theme textFont widthOfStringOrText: l) ].
	dialog := LongMessageDialogWindow new entryText: text.
	dialog iconMorph image: #pharoIcon asIcon.
	dialog title: 'About Cormas'.
	dialog open.
	dialog textMorph
		minWidth: 20;
		minHeight: 20.
	dialog width: (width + 120 min: Display width - 50).
	dialog position: 25 @ 25
]

{ #category : #'+ utilities - files' }
Cormas class >> addOnsPath [
	" Answer a <FileReference> corresponding to the path of 'Add-ons' directory "

	^ self application addOnsPath

]

{ #category : #'+ utilities - code management' }
Cormas class >> allTerminalClassesOf: aClassRoot [
	"Purpose: Returns a collection of all the terminal classes of aClassRoot
Example: Cormas allTerminalClassesOf: Forager"
	
	^aClassRoot withAllSubclasses select: [:aClass | self isTerminal: aClass]
]

{ #category : #'+ utilities - files' }
Cormas class >> application [

	^ CMApplicationProject uniqueInstance

]

{ #category : #'+ utilities - value types' }
Cormas class >> arrayFrom: anElementOrArray [
	"return an array for the argument"
	
	^anElementOrArray cormasHelper arrayFrom: anElementOrArray
]

{ #category : #'+ utilities - value types' }
Cormas class >> arrayOrNilFrom: anElementOrArray [
	"return an array or a nil for the argument"
	
	^anElementOrArray cormasHelper arrayOrNilFrom: anElementOrArray
]

{ #category : #'util_strings' }
Cormas class >> askUserArgumentsForMethod: aMethodAsString [
	"open a Dialog to set the arguments values. Return a collection of values if many arguments or just the value entered otherwise"
	
	| arg aV nbArguments |
	arg := OrderedCollection new.
	nbArguments := (aMethodAsString select: [:ch | ch = $:]) size.
	nbArguments
		timesRepeat:
			[aV := self current
				request:
					(arg isEmpty
						ifTrue:
							['Enter an argument for this method
if the value is a symbol, start with #']
						ifFalse: ['Enter the next argument']).
			aV = '' ifTrue: [^nil].
			aV := Cormas stringAsObjectType: aV.
			arg add: aV].	"nbArguments = 1 ifTrue:[^aV]."
	^arg asArray
]

{ #category : #'util_strings' }
Cormas class >> askUserArgumentsForMethod: aMethodAsString classesAsArgForModel: aCormasModel [
	
	| arg aV |
	arg := OrderedCollection new.
	(aMethodAsString select: [:ch | ch = $:]) size
		timesRepeat:
			[aV := self current
				request:
					(arg isEmpty
						ifTrue:
							['Enter an argument for this method
if the value is a symbol, start with #']
						ifFalse: ['Enter the next argument']).
			aV = '' ifTrue: [^nil].
			aV := Cormas stringAsObjectType: aV.
			((aCormasModel allEntityClasses collect: [:c | c name]) includes: aV asSymbol)
				ifTrue:
					[(self current confirm: 'Do you mean the Class ' , aV , ' ?')
						ifTrue: [aV := aV asSymbol class]].
			arg add: aV].
	^arg asArray
]

{ #category : #'util_strings' }
Cormas class >> askUserArgumentsForMethod_Pierre: aMethodAsString [
	"open a Dialog to set the arguments values. Return a collection of values if many arguments or just the value entered otherwise"
	
	| arg aV nbArguments |
	arg := OrderedCollection new.
	nbArguments := (aMethodAsString select: [:ch | ch = $:]) size.
	nbArguments
		timesRepeat:
			[aV := self current
				request:
					(arg isEmpty
						ifTrue:
							['Enter an argument for this method
if the value is a symbol, start with #']
						ifFalse: ['Enter the next argument']).
			aV = '' ifTrue: [^nil].
			aV := Cormas stringAsObjectType: aV.
			arg add: aV].
	nbArguments = 1 ifTrue: [^aV].
	^arg asArray
]

{ #category : #'util_codeManagement' }
Cormas class >> automaticCommentString [
	
	^'	!! This method was automatically generated by Cormas !!'
]

{ #category : #'runtime mode accessing' }
Cormas class >> availableRuntimeModes [
	"return the actual supported runtime modes"

	^ Set with: #developer with: #modeler with: #modelUser
]

{ #category : #'+ utilities - mathematics' }
Cormas class >> average: aCollectionOfNumbers [
	"Purpose: Returns the average of set of numbers
Argument: aCollectionOfNumbers = < OrderedCollection> or <Array>
Example: Cormas averageOf: #( 1 2 3)  	=> 2.0 "
	
	aCollectionOfNumbers size = 0 ifTrue: [^0].
	^((aCollectionOfNumbers
		inject: 0
		into: [:subTotal :next | subTotal + next]) / aCollectionOfNumbers size)
		asFloat
]

{ #category : #deprecated }
Cormas class >> averageOf: aCollectionOfNumbers [
	
	^self average: aCollectionOfNumbers
]

{ #category : #actions }
Cormas class >> closeAllInstances [
	
	Cormas allInstances
		do:
			[:aCormas | 
			aCormas closeModel.
			aCormas requestForWindowClose]
]

{ #category : #collector }
Cormas class >> collect: anEntity [
	"this add anEntity to cormasModel collection (theXXXs).
This works but this is not the best way to do !
We suggest to use 'newAndCollect: aCollector' to create and collect an entity"
	
	| cormasForModel instOfCormasModel |
	cormasForModel := Cormas allInstances
		select: [:corm | corm cormasModelClass = anEntity modelClass].
	cormasForModel size = 1
		ifTrue:
			[instOfCormasModel := cormasForModel first cormasModel.
			anEntity collector: instOfCormasModel collector.
			instOfCormasModel collector collect: anEntity.
			^anEntity]
		ifFalse:
			[self inform: 'Only ONE simulation is possible']
]

{ #category : #'+ user interface' }
Cormas class >> colorChooser [
	"Purpose: open a Color chooser and returns the color value of the user selected color.
Example: aColor := Cormas colorChooser "
	
	^PovSetter colorChooser
]

{ #category : #'+ utilities - value types' }
Cormas class >> colorFrom: aSymbolOrColorValue [
	"return a color value for the argument"
	
	^aSymbolOrColorValue cormasHelper colorFrom: aSymbolOrColorValue
]

{ #category : #'+ utilities - value types' }
Cormas class >> colorOrBlackFrom: aColorValueOrElse [
	"return either the argument if it is a colorValue or a black colorValue"
	
	^aColorValueOrElse cormasHelper colorOrBlackFrom: aColorValueOrElse
]

{ #category : #'- printing - documentation' }
Cormas class >> commentOfMethod: sel class: aClass [
	"Answer a String with the comment of the method"
	
	| source parser thisComment |
	source := (aClass findSelector: sel) first sourceCodeAt: sel.
	source isEmpty ifTrue: [^self].
	(parser := self parserClass new) parseSelector: source.
	thisComment := parser
		parseMethodComment: source
		setPattern: [:none | none].
	thisComment isEmpty
		ifTrue: [^'']
		ifFalse: [^thisComment first]
]

{ #category : #actions }
Cormas class >> compileDictionaries [
	
	IndexedFileMessageCatalog compileAllCatalogsInSearchDirectories
]

{ #category : #'util_images' }
Cormas class >> construireImageDeCouleur: aColorValue avecImageRouge: uneImage [
	"construire une image colori√©e √† partir d'uneImage rouge.
	Le principe est de prendre l'image rouge et de fabriquer des copies en changeant la palette.
	Les couleurs rouges de la palette d'origine sont remplac√©es par la nouvelle couleur mais en essayant
	de garder le niveau de gris (brightness) pour conserver les ombres.
	La couleur rouge est int√©ressante car sa valeur hue est de 0"
	
	| colors palette newImage |
	colors := uneImage palette colors
		collect:
			[:each | 
			(each hue <= 0.1 and: [each isGray not])
				ifTrue:
					[ColorValue
						hue: aColorValue hue
						saturation: aColorValue saturation
						brightness:
							(aColorValue brightness - (ColorValue red brightness - each brightness)
								max: 0)]
				ifFalse: [each]].
	palette := MappedPalette withColors: colors.
	newImage := Image
		extent: uneImage extent
		depth: uneImage depth
		bitsPerPixel: uneImage bitsPerPixel
		palette: palette
		usingBits: uneImage bits.
	^newImage
]

{ #category : #'util_images' }
Cormas class >> construireImageGriseAvec: uneImage [
	"construire une image grise √† partir d'une image existante.
Le principe est de modifier la palette pour remplacer toutes les couleurs par un niveau de gris"
	
	| colors palette newImage im |
	im := uneImage asImage.
	colors := im palette colors
		collect: [:each | ColorValue brightness: each brightness / 3.0 + 0.33].
	palette := MappedPalette withColors: colors.
	newImage := Image
		extent: im extent
		depth: im depth
		bitsPerPixel: im bitsPerPixel
		palette: palette
		usingBits: im bits.
	^newImage
]

{ #category : #'util_images' }
Cormas class >> construireImageMultipleAvec: uneImage [
	"construire une image illustrant la multiplicit√© √† partir d'uneImage"
	
	| delta pixmap gc |
	delta := 15 @ 10.
	pixmap := Pixmap extent: uneImage extent + delta.
	gc := pixmap graphicsContext.
	uneImage displayOn: gc.
	uneImage displayOn: gc at: delta.
	^pixmap asImage
]

{ #category : #'util_images' }
Cormas class >> construireMaskAvec: uneImage [
	"construction d'un mask √† partird une image.
	le principe est de cr√©er un mask en mettant opaque les pixels de couleur diff√©rente du premier pixel.
	Pour autoriser du blanc dans l'image, il est n√©cessaire de consid√©rer une couleur particuli√®re comme transparente.
	Plut√¥t que prendre automatiquement le blanc, il est pr√©f√©rable de prendre la couleur du premier pixel.
	self construireMaskAPartirDe: self imageMaison
	"
	
	| im mask transparentColorValue palette transparentValue opaqueValue |
	im := uneImage asImage.
	transparentColorValue := im atX: 0 y: 0.
	palette := CoveragePalette monoMaskPalette.
	transparentValue := palette indexOf: CoverageValue transparent.
	opaqueValue := palette indexOf: CoverageValue opaque.
	mask := Image
		extent: im extent
		depth: 1
		bitsPerPixel: 1
		palette: palette.
	im
		pixelsDo:
			[:x :y | 
			mask
				atX: x
				y: y
				put:
					((im atX: x y: y) = transparentColorValue
						ifTrue: [transparentValue]
						ifFalse: [opaqueValue])].
	^mask
]

{ #category : #'util_images' }
Cormas class >> construireOpaqueImageAvec: uneImage [
	"construction d'une OpaqueImage √† partir d'une image.
	on consi√®d√®re que le premier pixel indique la couleur transparente"
	
	| mask cachedImage cachedMask |
	mask := self construireMaskAvec: uneImage.
	cachedImage := CachedImage on: uneImage.
	cachedMask := CachedImage on: mask.
	^OpaqueImage figure: cachedImage shape: cachedMask
]

{ #category : #version }
Cormas class >> contributors [
	^ 'Thank you to the following contributors: \' , String cr , Cormas developerNames
]

{ #category : #version }
Cormas class >> cormasName [
	^ 'cormasMVC2014'
]

{ #category : #'+ utilities - files' }
Cormas class >> cormasPath [
	" Answer a <FileReference> corresponding to the path of Cormas directory. "

	^ self application cormasPath

]

{ #category : #'+ utilities - mathematics' }
Cormas class >> count: element into: aCollection [
	"Purpose: Return a value indicating the number of occurrence of 'element' from aCollection. 
Argument: aCollectionOfNumbers = < OrderedCollection> or <Array>
Examples: Cormas count: 3 into: #( 1 2 3 3 3 3 3) 	 => 5
			Cormas count: 'a' into: #( 1 2 3 3 3 3 3) 	 => 0"
	
	^(aCollection select: [:anElement | element = anElement]) size
]

{ #category : #accessing }
Cormas class >> current [
	"acces to the single current Cormas  (pattern singleton)
	Conveniently retrieve the already created instance
	"
	
	^current ifNil: [current := self allInstances first]
]

{ #category : #accessing }
Cormas class >> current: aCormas [
	"acces to the single current Cormas  (pattern singleton).
	Used by the initialize during cormas initialisation"
	
	current := aCormas
]

{ #category : #version }
Cormas class >> currentDeveloperName [
	
	^'Pierre Bommel'
]

{ #category : #version }
Cormas class >> currentVersion [
	^ 'Cormas 2014.3' , String cr
]

{ #category : #version }
Cormas class >> dateAsArray [
	"Answer an array (6) with current date. 
	Example: #(2010 6 24 8 31 54) . 
	Cormas dateAsArray"
	
	| day array |
	day := Time dateAndTimeNow first day
		- Time dateAndTimeNow first firstDayOfMonth + 1.
	array := Array new: 6.
	array
		at: 1
		put: Time dateAndTimeNow first year.
	array
		at: 2
		put: Time dateAndTimeNow first monthIndex.
	array at: 3 put: day.
	array
		at: 4
		put: (Time dateAndTimeNow at: 2) hours.
	array
		at: 5
		put: (Time dateAndTimeNow at: 2) minutes.
	array
		at: 6
		put: (Time dateAndTimeNow at: 2) seconds.
	^array
]

{ #category : #distributed }
Cormas class >> defaultClientPort [
	"return the default client  port used for distributed simulation "
	
	^4243
]

{ #category : #distributed }
Cormas class >> defaultServerPort [
	"return the default server port used for distributed simulation "
	
	^4242
]

{ #category : #version }
Cormas class >> developerNames [
^ 'Innocent Bakam
François Bousquet
Christophe Le Page
Pierre Bommel
Alassane Bah
Nicolas Bécu
Emmanuel Lieurain
Jean-Christophe Soulié
Paul Guyot
Jean François Lefevre'
]

{ #category : #'util_parcels' }
Cormas class >> displayCormasParcelsOnly [
	"Write the name of the loaded parcels on the Transcript.
		Cormas displayCormasParcelsOnly"
	
	self CormasParcelsOnly do: [:p | Cormas println: p]
]

{ #category : #'util_parcels' }
Cormas class >> displayLoadedParcels [
	"Write the name of the loaded parcels on the Transcript"
	
	Parcel parcels do: [:p | Cormas println: p name]
]

{ #category : #version }
Cormas class >> downloadString [
^ 
'Visit the Cormas web site :  
      in French = http://cormas.cirad.fr
      in English = http://cormas.cirad.fr/indexeng.htm
'

]

{ #category : #'+ utilities - string' }
Cormas class >> dropBlanksFromString: aString [
	"Purpose: Returns a copy of aString without any space characters
Example: Cormas dropBlanksFromString: 'Hello World    ' => 'HelloWorld'"

	^ aString copyWithRegex: ' ' matchesReplacedWith: ''
]

{ #category : #'+ utilities - files' }
Cormas class >> dumpPath: aModelClassName [
	" Answer a <FileReference> corresponding to the path of the current model 'dump' directory.
	aModelClassName = <String>"

	^ self application dumpPath: aModelClassName

]

{ #category : #'util_files' }
Cormas class >> editMethod: aSelector fromClass: aClass [
	"open a RefactoryBrowser for aClass on aSelector. If aSelector is only defined in a superclass, then open this superclass"
	"self editMethod: #moveTo: fromClass: AgentLocation
self editMethod: #id fromClass: AgentLocation"
	
	| class_method |
	class_method := aClass findSelector: aSelector.
	class_method
		ifNil:
			[Dialog
				warn:
					('No method <1p> found in <2s>and super classes.<n>Will open a standard editor'
						expandMacrosWith: aSelector
						with: aClass name).
			^aClass browse].
	(class_method first) browse navigator setSelector: aSelector
]

{ #category : #'- printing - documentation' }
Cormas class >> emphasisForMethodComment [
	
	^Array
		with: #plain
		with: #color -> ColorValue black
]

{ #category : #'- printing - documentation' }
Cormas class >> emphasisForMethodHeader [
	
	^Array
		with: #bold
		with: #color -> ColorValue black
]

{ #category : #'- printing - documentation' }
Cormas class >> emphasisForMethodHeaderArg [
	
	^Array
		with: #bold
		with: #color -> ColorValue darkPink
]

{ #category : #'- printing - documentation' }
Cormas class >> emphasisForProtocol [
	
	^Array
		with: #italic
		with: #color -> ColorValue black
]

{ #category : #'interface specs' }
Cormas class >> entities [
	"Tools.UIPainter new openOnClass: self andSelector: #entities"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#properties: #(PropertyListDictionary #sizeType #specifiedSize #openType #advanced #openPosition #(Point 10 254) #positionType #specifiedPosition) 
			#label: 'entities' 
			#min: #(Point 404 149) 
			#max: #(Point 804 1000) 
			#bounds: #(Rectangle 719 449 1119 598)) 
		#component: #(SpecCollection 
			#collection: #(#(SequenceViewSpec 
				#layout: #(LayoutFrame 0 0.3525 44 0 0 0.6625 -7 1) 
				#name: #List1 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 6143 7167 8191)) 
				#model: #listSocialEntities 
				#callbacksSpec: #(UIEventCallbackSubSpec 
					#doubleClickSelector: #modifySocialEntityClass) 
				#menu: #socialEntityMenu 
				#style: #pixelLarge) #(SequenceViewSpec 
				#layout: #(LayoutFrame 0 0.68 44 0 0 0.985 -7 1) 
				#name: #List3 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 8191 6143 4096)) 
				#model: #listPassiveEntities 
				#callbacksSpec: #(UIEventCallbackSubSpec 
					#doubleClickSelector: #modifyPassiveEntityClass) 
				#menu: #passiveEntityMenu 
				#style: #pixelLarge) #(GroupBoxSpec 
				#layout: #(LayoutFrame 2 0 2 0 0 0.995 -3 1) 
				#name: #GroupBox1 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue #blue)) 
				#label: 'Define the entities') #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(LayoutSizedOrigin 0 0.0575 19.5 0 26 24) 
				#name: #addSpatialEntityClass 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue 4607 8191 1024) 
					#setBackgroundColor: #(ColorValue #green)) 
				#model: #addSpatialEntityClass 
				#helpText: 'Click to add a Spatial entity class' 
				#label: #plusIcon 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(LabelSpec 
				#layout: #(LayoutSizedOrigin 0 0.13 18 0 47 24) 
				#name: #Label2 
				#label: 'spatial   ' 
				#style: #pixelLarge) #(LabelSpec 
				#layout: #(LayoutSizedOrigin 0 0.4675 18 0 39 24) 
				#name: #Label1 
				#label: 'social' 
				#style: #pixelLarge) #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(LayoutSizedOrigin 0 0.395 19 0 26 24) 
				#name: #addSocialEntityClass 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 6143 7167 8191)) 
				#model: #addSocialEntityClass 
				#helpText: 'Click to add a Social entity class' 
				#label: #plusIcon 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(LabelSpec 
				#layout: #(LayoutSizedOrigin 0 0.79 18 0 50 24) 
				#name: #Label3 
				#label: 'passive' 
				#style: #pixelLarge) #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(LayoutSizedOrigin 0 0.715 19.5 0 26 24) 
				#name: #addPassiveEntityClass 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 8191 6143 4096)) 
				#model: #addPassiveEntityClass 
				#helpText: 'Click to add a passive entity class' 
				#label: #plusIcon 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(SequenceViewSpec 
				#layout: #(LayoutFrame 0 0.02 45 0 0 0.34 -7 1) 
				#name: #List2 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 5119 8191 5119)) 
				#model: #listSpatialEntities 
				#callbacksSpec: #(UIEventCallbackSubSpec 
					#doubleClickSelector: #modifySpatialEntityClass) 
				#menu: #spatialEntityMenu 
				#style: #pixelLarge))))
]

{ #category : #'util_export' }
Cormas class >> export [
	"Export Cormas. 
The cormas version is updated.
ST files (kernel.st, VisualLauncher...) are save on disk.
A parcel is generated "
	"update version name and comments"
	
	self
		setDescriptionFor: 'kernelFileName'
		withText: 'Kernel-v.' , self versionAsString.
	self updateVersion.
	Notice
		show: 'Saving Cormas as ST files...'
		while: [self saveAsST].
	Notice
		show: 'Saving Cormas as Parcel...'
		while:
			[self
				saveParcelFromPackage:
					(Registry containingPackageForNameSpace: self environment)]	"parcels := Parcel parcelsForClass: self.
	parcels ifNotNil: [parcels do: [:parcel | parcel saveParcelDialogFor: nil]]"
]

{ #category : #'+ utilities - code management' }
Cormas class >> findSelector: selector in: aClass [

"Answer an Array with the class and method for this selector,
	or nil if the selector is not found.
	NicolasBecu 5/28/2015 19:38 -> copy from VW for Pharo integration"

	| meth |
	meth := aClass class compiledMethodAt: selector ifAbsent: [nil].
	meth == nil ifFalse: [^Array with: self with: meth].
	^aClass superclass == nil
		ifTrue: [nil]
		ifFalse: [Cormas findSelector: selector in: aClass superclass]
]

{ #category : #'+ utilities - mathematics' }
Cormas class >> giniIndexOf: aCollec [
	"Purpose: Returns the gini of a set of numbers
The Gini coefficient is a number between 0 and 1, where 0 corresponds with perfect equality (where everyone has the same income) and 1 corresponds with perfect inequality (where one person has all the income, and everyone else has zero income). The Gini index is the Gini coefficient expressed in percentage form, and is equal to the Gini coefficient multiplied by 100.
Argument: aCollectionOfNumbers = < OrderedCollection> or <Array>
Negative value are not accepted .
Example: Cormas giniIndexOf: #( 4.5 88.7 456 12 64 89.1 44 781)
More: The Gini coefficient is a measure of inequality developed by the Italian statistician Corrado Gini and published in 1912.
It is a commonly used coefficient to measure income inequality in a society by institutions such as the World Bank and others.
While the Gini coefficient is mostly used to measure income inequality, it can also be used to measure other types of inequality.
For more details on the calculation and use of the Gini coefficient and index see http://en.wikipedia.org/wiki/Gini_coefficient"
	
	| tot sort cumAttributeShare previousValue value areaAcollec areaAbyreaBcollec tot2 index |
	tot := 0.
	aCollec do: [:i | tot := tot + i].
	sort := aCollec asSortedCollection: [:x :y | x < y] .
	cumAttributeShare := OrderedCollection new.
	previousValue := 0.
	sort
		do:
			[:i | 
			value := i / tot.
			cumAttributeShare add: value + previousValue.
			previousValue := cumAttributeShare last].
	cumAttributeShare last rounded ~= 1 ifTrue: [self halt].
	areaAcollec := OrderedCollection new.
	1
		to: cumAttributeShare size
		do:
			[:i | 
			i = 1
				ifTrue: [areaAcollec add: (cumAttributeShare at: i)]
				ifFalse:
					[areaAcollec add: (cumAttributeShare at: i) + (cumAttributeShare at: i - 1)]].
	areaAbyreaBcollec := OrderedCollection new.
	areaAcollec do: [:i | areaAbyreaBcollec add: i * (1 / areaAcollec size)].
	tot2 := 0.
	areaAbyreaBcollec do: [:i | tot2 := tot2 + i].
	index := (1 - tot2) * 100.
	index < 0 | (index > 100) ifTrue: [self halt].
	^index
]

{ #category : #'+ utilities - mathematics' }
Cormas class >> giniIndexOf: aCollec absoluteCorrection: aNumber [
	"Purpose: Returns the gini of a set of numbers, which can include negative values
See the 'giniIndexOf: method for more details on Gini index.
As the calculation of the Gini index requieres that individuals cannot have a negative value for the assessed attribute, the following method operates a translation of the attribute value in case the attribute you want to assess has negative value.
Enter in the absoluteCorrection argument an amount equals or higher to the minimum negative value that your attribute may take.
Beware that this translation affects the absolute value of the Gini index.
(e.g. the Gini index calculated with an ''absoluteCorrection'' value of 1000 will not be the same than one calculated with a  ''absoluteCorrection'' value of 5000).
Argument: aCollectionOfNumbers = < OrderedCollection> or <Array>
Negative value are accepted .
Example: Cormas giniIndexOf: #( 4.5 -88.7 456 -12 64 89.1 44 781) absoluteCorrection: 100  -> 50.8776"
	
	| tot sort cumAttributeShare previousValue value areaAcollec areaAbyreaBcollec tot2 index |
	tot := 0.
	aCollec do: [:i | tot := tot + i + aNumber].
	sort := SortedCollection
		withAll: aCollec
		sortBlock: [:x :y | x < y].
	cumAttributeShare := OrderedCollection new.
	previousValue := 0.
	sort
		do:
			[:i | 
			value := (i + aNumber) / tot.
			cumAttributeShare add: value + previousValue.
			previousValue := cumAttributeShare last].
	cumAttributeShare last rounded ~= 1 ifTrue: [self halt].
	areaAcollec := OrderedCollection new.
	1
		to: cumAttributeShare size
		do:
			[:i | 
			i = 1
				ifTrue: [areaAcollec add: (cumAttributeShare at: i)]
				ifFalse:
					[areaAcollec add: (cumAttributeShare at: i) + (cumAttributeShare at: i - 1)]].
	areaAbyreaBcollec := OrderedCollection new.
	areaAcollec do: [:i | areaAbyreaBcollec add: i * (1 / areaAcollec size)].
	tot2 := 0.
	areaAbyreaBcollec do: [:i | tot2 := tot2 + i].
	index := (1 - tot2) * 100.
	index < 0 | (index > 100) ifTrue: [self halt].
	^index
]

{ #category : #'- printing - documentation' }
Cormas class >> headerOfMethod: sel class: aClass [
	
	| source parser header endOfHeader |
	source := aClass sourceCodeAt: sel.
	source isEmpty ifTrue: [^nil].
	(parser := self parserClass new) parseSelector: source.
	endOfHeader := parser endOfLastToken.
	[(source at: endOfHeader) isSeparator]
		whileTrue: [endOfHeader := endOfHeader - 1].	"back up over white space"
	header := source
		copyFrom: 1
		to: (endOfHeader min: source size).
	^header
]

{ #category : #deprecated }
Cormas class >> initFile: t1 dataCollection: t2 separator: t3 [
	"Deprecated. Should use CormasModel initFile: t1 dataCollection: t2 separator: t3"
	
	t1 exists ifTrue: [t1 delete].
	self updateFile: t1 dataCollection: t2 separator: t3.
	^self
]

{ #category : #'private_aleat' }
Cormas class >> initRandom [
	"seed := nil.
	Rand := nil"
	
	
]

{ #category : #'private_aleat' }
Cormas class >> initRandomSeed [
	"Release the randomSeed. 
For example, if the initilizations of the simulations were done with fixed random seed (identical initial state for each simulation), then with #initRandomSeed called after initilization, the  simulations may be different"
	
	seed := nil.
	Rand := nil
]

{ #category : #'class initialization' }
Cormas class >> initialize [
	"Build the singleton when Cormas class is loaded"
	self current: Cormas new
]

{ #category : #'+ utilities - mathematics' }
Cormas class >> interquartileRange: aCollectionOfNumbers [
	"Purpose : Returns the interquartile range quartile of a collection of numbers 
The interquartile range is the difference between the upper and lower quartiles
Example: Cormas interquartileRange: #(21 -15 7 -20 22 -8 5 -1 7 15 8 4 -4 11 24 12 47 12 18 1)"
	
	aCollectionOfNumbers size = 0 ifTrue: [^0].
	^(self upperQuartile: aCollectionOfNumbers)
		- (self lowerQuartile: aCollectionOfNumbers)
]

{ #category : #'runtime mode accessing' }
Cormas class >> isDeveloperMode [
	^ self runtimeMode == #developer
]

{ #category : #'runtime mode accessing' }
Cormas class >> isModelUserMode [
	^ self runtimeMode == #modelUser
]

{ #category : #'runtime mode accessing' }
Cormas class >> isModelerMode [
	^ self runtimeMode == #modeler
]

{ #category : #'+ utilities - code management' }
Cormas class >> isTerminal: aClass [
	"test efficiently if aClass is a terminal (or concrete) class (has no subclasses)
	use the getSubclasses which return nil or Array of subclasses without any copy.
	use the well known hack size = 0 for testing nil or empty collection

	self isTerminal: Object.
	self isTerminal: Fraction.

	Time microsecondsToRun: [10000 timesRepeat: [ Object subclasses isEmpty. Fraction subclasses isEmpty ]]
	Time microsecondsToRun: [10000 timesRepeat: [ CormasModel isTerminal: Object.  CormasModel isTerminal: Fraction ]]
	"
	
	^aClass subclasses size == 0
]

{ #category : #accessing }
Cormas class >> kernelClassNames [
	
	| collec |
	collec := OrderedCollection new.
	self cmEnvironment allClassNames do: [ : s | collec add: (s findTokens: $.) last].
	^ collec
]

{ #category : #version }
Cormas class >> kernelFileName [
	
	^'Kernel-v.2014.6.23 - .st'
]

{ #category : #version }
Cormas class >> licenseString [
	^ self licenseStringTemplate format: (Array with: Date today year asString)
]

{ #category : #version }
Cormas class >> licenseStringTemplate [
	^ 'LICENSE
	
Licensed under the MIT License.

Copyright (c) 1996-{1} CIRAD - Green Research Unit, and Cormas Contributors

Permission is hereby granted, free of charge, to any person obtaining a copy of this
software and associated documentation files (the "Software"), to deal in the Software
without restriction, including without limitation the rights to use, copy, modify, merge,
publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons
to whom the Software is furnished to do so, subject to the following conditions: The
above copyright notice and this permission notice shall be included in all copies or
substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS
OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
'
]

{ #category : #'+ utilities - mathematics' }
Cormas class >> linearRegression: data [
	"Purpose: Return an array containing a, b, and correlation coefficient, that are the parameters of the linear 	regression of a set of data, where y = a + bx.
Argument: data is supposed to be a List of Array ( x,y) : data = <Collection (Array 2)>
Example: Cormas linearRegression: #(#(1 2) #(5 2) #(5 4) #(10 9) #(1 1) #(2 2))   ->  #(0.2 0.783333 0.921746)"
	
	| sumX sumY sumX2 sumY2 n marginalMeanX marginalMeanY sumDiffX2 sumDiffXY diffX diffY diffXY covariance marginalVarianceX b a correlationCoefficient sumDiffY2 |
	sumX := 0.
	sumY := 0.
	sumX2 := 0.
	sumY2 := 0.
	n := data size.
	data
		do:
			[:couple | 
			sumX := sumX + couple first.
			sumY := sumY + (couple at: 2).
			sumX2 := sumX2 + couple first squared.
			sumY2 := sumY2 + (couple at: 2) squared].
	marginalMeanX := sumX / n.
	marginalMeanY := sumY / n.
	sumDiffX2 := 0.
	sumDiffY2 := 0.
	sumDiffXY := 0.
	data
		do:
			[:couple | 
			diffX := couple first - marginalMeanX.
			sumDiffX2 := sumDiffX2 + diffX squared.
			diffY := (couple at: 2) - marginalMeanY.
			sumDiffY2 := sumDiffY2 + diffY squared.
			diffXY := diffX * diffY.
			sumDiffXY := sumDiffXY + diffXY].
	covariance := sumDiffXY / n.
	marginalVarianceX := sumDiffX2 / n.
	b := covariance / marginalVarianceX.
	a := marginalMeanY - (b * marginalMeanX).
	correlationCoefficient := covariance
		/ ((sumDiffX2 / n) sqrt * (sumDiffY2 / n) sqrt).
	^Array
		with: a asFloat
		with: b asFloat
		with: correlationCoefficient asFloat
]

{ #category : #'util_files' }
Cormas class >> listing [
	
	| bufferText stream |
	bufferText := Text new.
	bufferText := bufferText , 'Attributs\' withCRs.
	self instVarNames
		do: [:iv | bufferText := bufferText , iv asString , '    '].
	bufferText := bufferText , '\\\Methodes' withCRs.
	self organization categories
		do:
			[:c | 
			bufferText := bufferText , '\\' , c asString , '\' withCRs.
			(self organization listAtCategoryNamed: c)
				do: [:m | bufferText := bufferText , m asString , '    ']].
	stream := ((Cormas modelPath: self name)
		construct: self class name , '.list') asFilename writeStream.
	stream nextPutAll: bufferText withCRs.
	stream close
]

{ #category : #'- printing - documentation' }
Cormas class >> listing: fileName [
	
	| bufferText stream |
	bufferText := Text new.
	bufferText := bufferText , 'Attributs\' withCRs.
	self instVarNames
		do: [:iv | bufferText := bufferText , iv asString , '    '].
	bufferText := bufferText , '\\\Methodes' withCRs.
	self organization categories
		do:
			[:c | 
			bufferText := bufferText , '\\' , c asString , '\' withCRs.
			(self organization listAtCategoryNamed: c)
				do: [:m | bufferText := bufferText , m asString , '    ']].
	stream := fileName asFilename writeStream.
	stream nextPutAll: bufferText withCRs.
	stream close
]

{ #category : #'+ utilities - mathematics' }
Cormas class >> logisticGrowth: x r: r K: K [
	"Purpose: Returns the next value of X(t+1), according to the discrete logistic equation :
	 X(t+1) = X(t) + dx /dt  "

	^ x + (self logisticIncrease: x r: r K: K)
]

{ #category : #'+ utilities - mathematics' }
Cormas class >> logisticGrowthContinuous: x r: r K: K [
	"Returns the next value of X(t+1), according to the continuous logistic equation :
	 f(x,t) = x(t) = K / [(K-Xo)/Xo . exp(- r.t) + 1]   "
	
	^K / ((K - x) / x * (2.71828 raisedTo: r negated) + 1)
]

{ #category : #'+ utilities - mathematics' }
Cormas class >> logisticIncrease: x r: r K: K [
	"Returns the increase of X (dx /dt), according to the discrete logistic equation :
	 dx / dt  = r . x . (K - X(t)) / K "
	
	^r * x * (K - x) / K
]

{ #category : #'+ utilities - string' }
Cormas class >> lowerCaseFirstChar: aString [
	"Purpose: Converts the first character of a string into lowercase
Example: Cormas lowerCaseFirstChar: 'Hello World' => 'hello World'  "
	
	^ aString uncapitalized 
]

{ #category : #'+ utilities - string' }
Cormas class >> lowerCaseString: aString [
	"Purpose: Converts all uppercase characters of a string into lowercase characters
Example: Cormas lowerCaseString: 'Hello World' 'hello world'   "

	^ aString asLowercase
]

{ #category : #'+ utilities - mathematics' }
Cormas class >> lowerQuartile: aCollectionOfNumbers [
	"Purpose : Returns the lower quartile of a numbers distribution. 
The lower quartile (or first quartile or Q1) is the value of the sorted series of numbers which splits the lowest 25% of data
For example, assume that we have obtained the following 20 observations:
   2, 4, 7, -20, 22, -1, 0, -1, 7, 15, 8, 4, -4, 11, 11, 12, 3, 12, 18, 1
In order to calculate the quartiles we first have to sort the observations:
   -20, -4, -1, -1, 0, 1, 2, 3, 4, 4, 7, 7, 8, 11, 11, 12, 12, 15, 18, 22
The position of the first quartile is x = round(0.25*(20+1)) = round(5.25) = 5, which means that Q1 is the 5th value of the sorted series, namely Q1 = 0.
Example: Cormas lowerQuartile: #(2 4 7 -20 22 -1 0 -1 7 15 8 4 -4 11 11 12 3 12 18 1)"

	| sortedColl |
	aCollectionOfNumbers size = 0
		ifTrue: [ ^ 0 ].
	sortedColl := aCollectionOfNumbers asSortedCollection: [ :a :b | a < b ].
	^ sortedColl at: (0.25 * (sortedColl size + 1)) rounded
]

{ #category : #'mainMenu (resources)' }
Cormas class >> mainMenu [
	"the main menu depends on the runtime mode"
	
	^self isModelUserMode
		ifTrue: [self modelUserMainMenu]
		ifFalse: [self fullMainMenu]
]

{ #category : #'+ utilities - files' }
Cormas class >> mapsPath: aModelClassName [
	"Purpose: Returns a Filename corresponding to the path of the current model 'maps' directory.
Argument: aModelClassName = <String>
Example: (Cormas mapsPath: #FireModel) / 'zone.env' 	"
	
	| modelPath mapsPath |
	modelPath := self modelPath: aModelClassName.
	mapsPath := modelPath / 'maps'.
	mapsPath exists ifFalse: [mapsPath createDirectory].
	^mapsPath
]

{ #category : #'+ utilities - files' }
Cormas class >> matrixInOneColumn: aMatrix [
	"aMatrix = Coll of collections.
aMatrix =
OrderedCollection (
'a;b;c;d'
'e;f;g;h' 
...)
oneCol = ('a;e;b;f;c;g;d;h)"
	
	| oneCol nbOfCol |
	oneCol := OrderedCollection new.
	nbOfCol := aMatrix first size.
	1
		to: nbOfCol
		do: [:i | aMatrix do: [:coll | oneCol add: (coll at: i)]].
	^oneCol
]

{ #category : #'+ utilities - files' }
Cormas class >> matrixInOneLine: aMatrix [
	"aMatrix = Coll of collections.
aMatrix =
OrderedCollection (
'a;b;c;d'
'e;f;g;h' 
...)
oneCol = ('a b c d e f g h)"
	
	| oneLine |
	oneLine := OrderedCollection new.
	aMatrix do: [:coll | oneLine addAll: coll].
	^oneLine
]

{ #category : #'+ utilities - mathematics' }
Cormas class >> max: aCollectionOfNumbers [
	"Answer the maximum of a set of numbers. 
aCollectionOfNumbers = < OrderedCollection> or <Array>
ex:		Cormas max: #( 1 2 3) => 3"

	^ aCollectionOfNumbers max
]

{ #category : #'+ utilities - mathematics' }
Cormas class >> maxOf: aMagnitudeName amongObjects: aCollection [
	"Purpose: returns the highest value of a given function among a collection of objects understanding this function
Arguments: aName = <ByteSymbol>
			aCollection = <Collection(Object)>
Return value: <Magnitude>
Example: Cormas maxOf: #elevation amongObject: self theCells"
	
	| collec |
	collec := aCollection
		select: [:c | (c perform: aMagnitudeName) respondsTo: #>].
	^collec isEmpty
		ifFalse: [self max: (collec collect: [:c | c perform: aMagnitudeName])]
		ifTrue: [nil]
]

{ #category : #'+ utilities - mathematics' }
Cormas class >> median: aCollectionOfNumbers [
	"Answer the median of a numbers distribution. 
	The median is defined by :
		the element whose index is (N+1)/2, if N is odd	or
		the average of elements whose indexes are N/2 and 1+N/2, if N is even
aCollectionOfNumbers = < OrderedCollection> or <Array>
ex:		Cormas median: #( 1 2 3) 	=> 2
		Cormas median: #( 1 2 3 5) 	=> 2.5"
	
	| sortedColl |
	aCollectionOfNumbers size = 0 ifTrue: [^0].
	sortedColl := aCollectionOfNumbers asSortedCollection: [:a :b | a > b].
	sortedColl size odd
		ifTrue: [^sortedColl at: (sortedColl size + 1) / 2]
		ifFalse:
			[^((sortedColl at: sortedColl size / 2)
				+ (sortedColl at: sortedColl size / 2 + 1)) / 2]
]

{ #category : #'+ utilities - mathematics' }
Cormas class >> min: aCollectionOfNumbers [
	"Answer the minimum of a set of numbers. 
aCollectionOfNumbers = < OrderedCollection> or <Array>
ex:		Cormas min: #( 1 2 3)	=> 1"

	^ aCollectionOfNumbers min
]

{ #category : #'+ utilities - random' }
Cormas class >> mixt: aCollection [
	"Purpose: Returns a randomly mixed collection
Argument: aCollection is a collection to be mixed"

	^ aCollection shuffle
]

{ #category : #'+ utilities - mathematics' }
Cormas class >> mode: aCollectionOfNumbers [
	"Answer an array of the most frequent values of a set of numbers. 
aCollectionOfNumbers = < OrderedCollection> or <Array>
ex:		Cormas mode: #( 1 2 3 3 3 3 3) => #(3)
ex:		Cormas mode: #( 1 1 1 0 2 6 7 3 3 3) => #(1 3)"
	
	| bestFrequency winners count |
    bestFrequency := 0.
    winners := OrderedCollection new.
    aCollectionOfNumbers
        do:
            [:aNb |
            count := (aCollectionOfNumbers select: [:anElement | aNb = anElement]) size.
            bestFrequency = count ifTrue: [winners add: aNb].
            bestFrequency < count
                ifTrue:
                    [bestFrequency := count.
                    winners := OrderedCollection with: aNb]].
    ^winners asSet asArray
]

{ #category : #'+ utilities - files' }
Cormas class >> modelPath: aModelClassName [
	"Purpose: Returns a Filename corresponding to the path of the current model directory.
	Argument: aModelClassName = <String>
	Example: 
	(Cormas modelPath: #FireModel) construct: 'test.csv' 
	"

	^ self application modelPath: aModelClassName

]

{ #category : #'+ utilities - files' }
Cormas class >> modelsPath [
	" Answer a <FileReference> corresponding to the path of 'Models' directory "

	^ self application modelsPath

]

{ #category : #'+ utilities - mathematics' }
Cormas class >> nextCyclicElementOf: anArray currentElement: currentElement [
	"Purpose : return the next element of anArray. 
If currentElement is the last of anArray, then return the first element.
Arguments: anArray = <Array>
currentElement = <Object>.
Examples: 
	Cormas nextCyclicElementOf: #(1 2 3 4 5 6 7) currentElement: 3 => 4
	Cormas nextCyclicElementOf: #(1 2 3 4 5 6 7) currentElement: 7 => 1
	Cormas nextCyclicElementOf: #(monday tuesday wednesday thursday friday saturday sunday) currentElement: #sunday => #monday"
	
	| index |
	index := anArray indexOf: currentElement.
	index = anArray size
		ifTrue: [index := 1]
		ifFalse: [index := index + 1].
	^anArray at: index
]

{ #category : #'+ utilities - random' }
Cormas class >> normal: mu sigma: sigma [
	"Purpose: Return a random number from a normal distribution. polar method, Law et Kelton
Arguments: mu = mean; sigma = standard deviation."

	| w u1 u2 v1 v2 y x1 |
	w := 2.
	[ w > 1 ]
		whileTrue: [ u1 := Cormas random.
			u2 := Cormas random.
			v1 := 2 * u1 - 1.
			v2 := 2 * u2 - 1.
			w := v1 squared + v2 squared ].
	y := (-2 * w ln / w) sqrt.
	x1 := v1 * y.
	x1 := mu + (sigma * x1).
	^ x1
]

{ #category : #'+ utilities - mathematics' }
Cormas class >> number: aNumber onCycle: aCycleBase [
	"Purpose : return a new number from aNumber transformed in aCycleBase. 
If aNumber exceeds aCycleBase, return to 1
Arguments: aNumber = <Integer>
aCycleBase = <Integer>.
Examples: 
	Cormas number: 4 onCycle: 5 => 4
	Cormas number: 5 onCycle: 5 => 5
	Cormas number: 6 onCycle: 5 => 1
	Cormas number: 7 onCycle: 5 => 2"
	
	^(aNumber - 1) \\ aCycleBase + 1
]

{ #category : #'+ utilities - string' }
Cormas class >> objectTypeAsString: anObject [
	"Purpose: convert anObject as a String.
Examples: 
	Cormas objectTypeAsString: 12.3 => '12.3'
	Cormas objectTypeAsString: true => 'true'
	Cormas objectTypeAsString: #truc => 'truc' 
	Cormas objectTypeAsString: 'world' 'world' => 'world'  "
	
	
	^anObject asString
]

{ #category : #'interface opening' }
Cormas class >> open [
	"Cormas open"
	
	^self openInterface: #windowSpec
]

{ #category : #'+ user interface' }
Cormas class >> openActivityDiagramChooserOn: anEntityClass [
	"display an Activity Diagrams chooser on the target class.
anEntityClass = <Class>
Ex: Cormas openActivityDiagramChooserOn: CormasNS.Models.ECEC.Forager"
	
	anEntityClass chooseActivityDiagramEditorToOpen
]

{ #category : #'+ user interface' }
Cormas class >> openEn [
	"Cormas openEn"
	"avant c'était #fr mais il fallait recharger (FileIn) Locale.st.
	#fr => #'fr_FR.CP1252' 
	#en => #'en_US.CP1252' "
	"self openInterface: #windowSpec WithLanguage: #'en_US.CP1252'"
	Locale installCLocale.
	^self openInterface: #windowSpec
]

{ #category : #'+ user interface' }
Cormas class >> openFr [
	"avant c'était #fr mais il fallait recharger (FileIn) Locale.st.
	#fr => #'fr_FR.CP1252' 
	#en => #'en_US.CP1252' "
	self openInterface: #windowSpec WithLanguage: #'fr_FR.CP1252'
]

{ #category : #actions }
Cormas class >> openInterface: anInterfaceName [
	"Open the Cormas interface.
anInterfaceName : #windowSpec
Cormas openInterface: #windowSpec "
	
	| win bdr |
	CormasLauncher adaptSettings.
	self compileDictionaries.
	bdr := self new allButOpenInterface: anInterfaceName.
	win := bdr window.
	bdr source mainWin: win.
	bdr source mainBuilder: bdr.
	win openIn: (10 @ 20 extent: win minimumSize).
	Cormas visualLauncherWindow ifNotNil: [:w | w collapse].
	^win
]

{ #category : #actions }
Cormas class >> openInterface: anInterface WithLanguage: languageCode [
	"languageCode = #fr or #en
 anInterface = #windowSpec or #windowSpec_old "
	
	| bdr win |
	CormasLauncher adaptSettings.
	self compileDictionaries.
	Locale set: languageCode.
	Locale current preferredPixelSize: nil.
	bdr := self new allButOpenInterface: anInterface.
	win := bdr window.
	bdr source mainWin: win.
	win openIn: (10 @ 20 extent: win minimumSize).
	Cormas visualLauncherWindow ifNotNil: [:w | w collapse]
]

{ #category : #actions }
Cormas class >> openInterface: anInterface WithLanguage: languageCode ofModel: aCormas [
	"languageCode = #fr or #en
 anInterface = #windowSpec or #windowSpec_old "
	
	| bdr win |
	self compileDictionaries.
	Locale set: languageCode.
	Locale current preferredPixelSize: nil.
	bdr := aCormas allButOpenInterface: anInterface.
	win := bdr window.
	bdr source mainWin: win.
	win openIn: (10 @ 20 extent: win minimumSize).
	Cormas visualLauncherWindow ifNotNil: [:w | w collapse]
]

{ #category : #'+ user interface' }
Cormas class >> openVisualInspectorOn: anObject [
	"display anObject on a VisualInspector"
	
	anObject psiVisualInspect
]

{ #category : #'util_window' }
Cormas class >> originPointOfWindowExtent: bounds toPlaceBelow: mainWindow [
	" Return the preferred position for the origin (upper right) corner of the window extent receiver so that it is placed below the specified window"
	
	| mainRectangle hackFactor screenBounds |
	hackFactor := 0 @ 34.
	mainRectangle := mainWindow getDisplayBox.
	screenBounds := mainWindow == nil
		ifTrue: [Screen default bounds]
		ifFalse: [mainWindow screen bounds].
	^Point
		x:
			((mainRectangle bottomRight x + hackFactor x - bounds x
				max: screenBounds left) min: screenBounds right)
		y:
			((mainRectangle bottomRight y + hackFactor y max: screenBounds top)
				min: screenBounds bottom)
]

{ #category : #'util_window' }
Cormas class >> originPointOfWindowExtent: bounds toPlaceOnSideOf: mainWindow [
	" Return the preferred position for the origin (upper right) corner of the window extent receiver so that it is placed on the left or on the right side of the specified window"
	
	| mainRectangle hackFactor screenBounds |
	hackFactor := 16 @ 0.
	screenBounds := mainWindow == nil
		ifTrue: [Screen default bounds]
		ifFalse: [mainWindow screen bounds].
	mainRectangle := mainWindow getDisplayBox.
	^Point
		x:
			(mainRectangle topLeft x - bounds x - hackFactor x < 0
				ifFalse:
					[(mainRectangle topLeft x - bounds x - hackFactor x max: screenBounds left)
						min: screenBounds right]
				ifTrue: [mainRectangle topRight x + hackFactor x])
		y:
			((mainRectangle topLeft y + hackFactor y max: screenBounds top)
				min: screenBounds bottom)
]

{ #category : #'util_window' }
Cormas class >> originPointOfWindowExtent: bounds toPlaceOnSideOf: mainWindow andBelow: secWindow [
	" Return the preferred position for the origin (upper right) corner of the window extent receiver so that it is placed on the left or on the right side of the specified window and below another specifed window"
	
	| mainRectangle hackFactor screenBounds secRectangle |
	hackFactor := 16 @ 34.
	mainRectangle := mainWindow getDisplayBox.
	secRectangle := secWindow getDisplayBox.
	screenBounds := mainWindow == nil
		ifTrue: [Screen default bounds]
		ifFalse: [mainWindow screen bounds].
	^Point
		x:
			(mainRectangle topLeft x - bounds x - hackFactor x < 0
				ifFalse:
					[(mainRectangle topLeft x - bounds x - hackFactor x max: screenBounds left)
						min: screenBounds right]
				ifTrue: [mainRectangle topRight x + hackFactor x])
		y:
			((secRectangle bottomRight y + hackFactor y max: screenBounds top)
				min: screenBounds bottom)
]

{ #category : #accessing }
Cormas class >> passiveEntitiesClassNames [
	
	| collec |
	collec := OrderedCollection new.
	collec
		add: 'Msg';
		add: 'PassiveObject'.
	self cmEnvironment allClasses "should be allEntityClasses ??" 
		do: [ : aClass | (aClass inheritsFrom: PassiveObject)
			ifTrue: [collec add: aClass name asString ] ].
	^ collec
]

{ #category : #'util_export' }
Cormas class >> postLoadActions [
	"Finalize Cormas installation by adapting the VW settings, loading Excel (COM), closing all windows, launching Cormas and saving the image"
	"Cormas postLoadActions"
	
	Notice
		showNotice: 'Finalizing Cormas installation... in progress'
		complete: 4
		while:
			["**  1  **   Close all the GF windows"
			IncrementNotification raiseSignal.
			CormasLauncher adaptSettings.
			GFDemoLauncher allInstances do: [:inst | inst closeRequest].	"**  2  **   Close the Workspace window"
			(Delay forMilliseconds: 40) wait.
			IncrementNotification raiseSignal.
			Workspace allInstances do: [:inst | inst closeRequest].	"**  3  **   Close the Hotdraw windows"
			(Delay forMilliseconds: 40) wait.
			IncrementNotification raiseSignal.
			[(ScheduledWindow allInstances
				select:
					[:w | w label = 'HotDraw Installation Workspace' and: [w model isNil not]])
				do: [:w | w controller closeAndUnschedule]]
				on: GenericException
				do: [:ex | ex return: 'plantage'].
			[(ApplicationWindow allInstances
				select:
					[:w | w label = 'Welcome to VisualWorks' and: [w model isNil not]])
				do: [:w | w controller closeAndUnschedule]]
				on: GenericException
				do: [:ex | ex return: 'plantage'].	"**  4  **   Load COM"
			(Delay forMilliseconds: 40) wait.
			IncrementNotification raiseSignal.
			ParcelManager allInstances do: [:w | w closeRequest].
			FileBrowser allInstances do: [:w | w closeRequest].
			OSHandle platformMoniker = #win
				ifTrue:
					[(Parcel findParcelNamed: 'Com- All') isNil
						ifFalse: [Parcel loadParcelByName: 'Com- All']].	"**  5  **   Specify Memory Policy"
			(Delay forMilliseconds: 40) wait.
			IncrementNotification raiseSignal.
			ObjectMemory currentMemoryPolicy growthRegimeUpperBound: 128000000.
			ObjectMemory sizesAtStartup: #(10.0 10.0 1.0 1.0 1.0 10.0 1.0).
			(Delay forMilliseconds: 40) wait.
			IncrementNotification raiseSignal]
		title: 'Cormas'.	"**  6  **   Settings for Mac OSX:  change default button aspects"
	Screen default platformName = 'MacOSX'
		ifTrue:
			[Dialog warn:
					'For Mac OS X users, the ''Aqua'' style buttons are hardly readable.

We recommand to set the ''Look & Feel'' settings of the ''User interface look'' to:

	***    Macintosh (OS-8)    *** '.
			SettingsManager openOrRaise: VisualWorksSettings].
	Cormas open.
	Cormas saveImage
]

{ #category : #'+ utilities - string' }
Cormas class >> print: aString [
	"Purpose: A Java-like print method. Writes aString on the Transcript Withour carriage return.
Example: Cormas print: 'Hello World'   "
	
	(Cormas objectTypeAsString: aString) printOn: Transcript.
	Transcript flush
]

{ #category : #'+ utilities - string' }
Cormas class >> println: aString [
	"Purpose: A Java-like println method. Writes aString on the Transcript
Example: Cormas println: 'Hello World'   "
	
	(Cormas objectTypeAsString: aString) printOn: Transcript.
	Transcript
		flush;
		cr
]

{ #category : #'+ utilities - random' }
Cormas class >> random [
	self flag:#shouldBeRevised.
	^ Random new next
]

{ #category : #'+ utilities - random' }
Cormas class >> randomBoolean [
	^ #(true false) atRandom
]

{ #category : #'+ utilities - random' }
Cormas class >> randomCell [
	| x y |
	x := self randomFrom: 1 to: 100.
	y := self randomFrom: 1 to: 100.
	^ x @ y
]

{ #category : #'+ utilities - random' }
Cormas class >> randomColor [
"Purpose: Returns a random ColorValue
Example: Cormas randomColor"
	^Color registeredColorNames atRandom
]

{ #category : #'+ utilities - random' }
Cormas class >> randomFloatFrom: startNumber to: endNumber [
	"Purpose: Return a random float between 'startNumber' and 'endNumber' (excluding startNumber and endNumber): 
	startNumber < randomFloat < endNumber, ie. randomFloat in ]startNumber ; endNumber[.
Examples: Cormas randomFloatFrom: 0 to: 10.
		Cormas randomFloatFrom: -4.1 to: 2.5
		10 timesRepeat: [Cormas randomFloatFrom: 1.1 to: 2.9] => (2.19661 1.78905 1.19457 1.96943 1.6194 1.12104 1.94028 2.41498 2.19254 2.18504) "
	
	| extent result |
	extent := endNumber asFraction - startNumber asFraction.
	result := (Cormas random * extent + startNumber asFraction) asFloat.
	^result = endNumber
		ifTrue: [self randomFloatFrom: startNumber to: endNumber]
		ifFalse: [result]
]

{ #category : #'+ utilities - random' }
Cormas class >> randomFrom: startInteger to: endInteger [
	| extent |
	extent := endInteger - startInteger + 1.
	^endInteger min: (Cormas random * extent) truncated + startInteger
]

{ #category : #'+ utilities - random' }
Cormas class >> randomIntegerFrom: startInteger to: endInteger [
	"Purpose: Return a random Integer between 'startInteger' and 'endInteger': 
	startInteger <= randInteger <= endInteger, ie. randInteger ‚Ç¨ [startInteger ; endInteger].
Examples: Cormas randomFrom: 0 to: 100.
Examples: Cormas randomFrom: -4 to: 10
		10 timesRepeat: [Cormas randomFrom: 0 to: 10] => 10 1 7 0 4 0 6 10 7 "
	
	^self randomFrom: startInteger to: endInteger
]

{ #category : #'+ utilities - random' }
Cormas class >> randomSeed: aValue [
	"Purpose: Set the initial value of the RandFishmanMoore suit. Without this method, the initial value is equal to Time millisecondClockValue.
Argument: aValue must be an integer greater than 1.
Example : 
	3 timesRepeat: 
			[Cormas randomSeed: 100.
			6 timesRepeat: 
					[Cormas random printString printOn: Transcript].
					Transcript flush; cr] "
	
	self seed: aValue
]

{ #category : #'+ utilities - files' }
Cormas class >> readCsv: filename [
	"Returns a collection of collections, each one containing the values of the each line (separator = $;).
The file name must be complete.
fileName = <String or Filename>
Ex: Cormas readCsv: 'D:\vw7.6\cormas\Models\Ecec\data\test.csv' "
	
	^self
		readMatrix: filename
		sep: DataSaver_Asci separator
]

{ #category : #'+ utilities - files' }
Cormas class >> readCsv: file myModel: modelName [
	"Purpose: Returns a dictionary containing the values of the csv file (separator is ';').
The file name is just a string containing the name of the file (with or without extension) that is stored in the /data directory of a model.
Ex:    Cormas readCsv: 'palaya1973' myModel: 'Thunupa'    		or 
	Cormas readCsv: 'palaya1973.cvs' myModel: 'Thunupa'           "
	
	| stream line dicoR dico l nbLine nbRow r key values |
	stream := ((Cormas dataPath: modelName) construct: file , '.csv')
		readStream.	"On devine le format des lignes"
	stream lineEndAuto.
	dicoR := Dictionary new.
	dico := Dictionary new.	" Read file line per line and save it into DicoR which is a reversed line and row dictionary "
	l := 1.
	[stream atEnd]
		whileFalse:
			[line := Cormas splitLine: stream sep: $,.
			dicoR at: l put: line.
			l := l + 1].
	stream close.	"Reverse the dicoR into the dico"
	nbLine := dicoR keys size.
	nbRow := (dicoR at: 1) size.
	r := 1.
	nbRow
		timesRepeat:
			[l := 1.
			key := (dicoR at: l) at: r.
			values := OrderedCollection new.
			nbLine - 1
				timesRepeat:
					[l := l + 1.
					values add: ((dicoR at: l) at: r)].
			dico at: key put: values.
			r := r + 1].
	^dico
]

{ #category : #'+ utilities - files' }
Cormas class >> readCsvFile: file myModel: modelName [
	"Returns a collection of collections, each one containing the values of the csv file (separator is ';').
The file name is just a string containing the name of the file (with or without extension) that is stored in the /data directory of a model.
Ex:    Cormas readCsvFile: 'palaya1973' myModel: 'Thunupa'    		or 
	Cormas readCsvFile: 'palaya1973.cvs' myModel: 'Thunupa'           "
	
	| filename |
	filename := (Cormas dataPath: modelName) construct: file.
	filename := Cormas removeExtensionOf: filename.
	^Cormas
		readMatrix: filename asString , '.csv'
		sep: $;
]

{ #category : #'+ utilities - files' }
Cormas class >> readCsvMap: file myModel: modelName [
	"Returns a collection of collections, each one containing the values of the csv file (separator is ';').
The file name is just a string containing the name of the file (with or without extension) that is stored in the /data directory of a model.
Ex:    Cormas readCsvMap: 'palaya1973' myModel: 'Thunupa'    		or 
	Cormas readCsvMap: 'palaya1973.cvs' myModel: 'Thunupa'           "
	
	| filename |
	filename := (Cormas mapsPath: modelName) construct: file.
	filename := Cormas removeExtensionOf: filename.
	^Cormas
		readMatrix: filename asString , '.csv'
		sep: $;
]

{ #category : #'+ utilities - files' }
Cormas class >> readMatrix: fileName sep: aSepChar [
	"Returns a collection of collections (a Matrix), each one containing the values between the separator of the file.
	Example: file = 
		time;0;1;2;3;4;5;6;7;8;9;10;
		energy;50.0;48.1;47.5;46.5;46.2;44.2;44.4;44.9;45;46;	
	the Matrix = 
		OrderedCollection (	OrderedCollection ('time' 0 1 2 3 4 5 6 7 8 9 10) 
							OrderedCollection ('energy' 50.0 48.1 47.5 46.5 46.2 44.2 44.4 44.9 45 46)   )
The file name must be complete.
fileName = <String>
aSepChar = <Character> or <String>
Ex: Cormas readMatrix: 'D:\vw7.6\cormas\Models\Ecec\data\test.csv' sep: $;    or
Ex: Cormas readMatrix: 'D:\vw7.6\cormas\Models\Ecec\data\test.csv' sep: ';'   "

	| lines stream line sep subCollection matrix nbColumns |
	sep := aSepChar isString
		ifTrue: [ aSepChar first ]
		ifFalse: [ aSepChar ].
	lines := OrderedCollection new.
	stream := fileName asFilename readStream.	"On devine le format des lignes"
	stream lineEndAuto.	" Lecture du fichier, ligne par ligne "
	nbColumns := 0.
	[ stream atEnd ]
		whileFalse: [ line := Cormas splitLine: stream sep: sep.
			nbColumns := nbColumns max: line size.
			lines add: line ].
	stream close.	"creates the Matrix"
	matrix := OrderedCollection new.
	lines
		do: [ :aLine | 
			"coll removeAllSuchThat:[:x| x isEmpty]."
			subCollection := OrderedCollection new.
			aLine
				do: [ :x | subCollection add: (Cormas stringAsObjectType: x) ].
			[ subCollection size < nbColumns ]
				whileTrue: [ subCollection add: nil ].
			matrix add: subCollection ].
	^ matrix
]

{ #category : #actions }
Cormas class >> rebuildMenu [
	"rebuild the main menu for all opened Cormas (usefull when adding item in the mainMenu)
	Cormas rebuildMenu
	"
	
	self allInstances do: [:each | each rebuildMenu]
]

{ #category : #'- printing - documentation' }
Cormas class >> recordDictClass: aClass [
	
	| dict dictClass |
	dict := Dictionary new.
	aClass organization categories asSortedCollection
		do:
			[:cat | 
			(self recordProtocol: cat class: aClass)
				keysAndValuesDo: [:k :v | dict at: k put: v]].
	dictClass := Dictionary new.
	aClass class organization categories asSortedCollection
		do:
			[:cat | 
			(self
				recordProtocol: cat
				class: aClass class) keysAndValuesDo: [:k :v | dictClass at: k put: v]].
	^Array with: dict with: dictClass
]

{ #category : #'- printing - documentation' }
Cormas class >> recordMethod: sel category: cat class: aClass [
	
	| source parser header endOfHeader thisComment |
	source := aClass sourceCodeAt: sel.
	source isEmpty ifTrue: [^self].
	(parser := self parserClass new) parseSelector: source.
	endOfHeader := parser endOfLastToken.
	[(source at: endOfHeader) isSeparator]
		whileTrue: [endOfHeader := endOfHeader - 1].	"back up over white space"
	header := source
		copyFrom: 1
		to: (endOfHeader min: source size).
	thisComment := parser
		parseMethodComment: source
		setPattern: [:none | none].
	thisComment isEmpty ifFalse: [thisComment := thisComment first].
	^Association
		key:
			(header string , '& [' , aClass name asString , ' >> ' , cat asString , ']')
				asSymbol
		value: thisComment
]

{ #category : #'- printing - documentation' }
Cormas class >> recordProtocol: cat class: aClass [
	
	| dict |
	dict := Dictionary new.
	(Kernel includes: aClass)
		ifTrue: [(cat first = $+ or: [cat first = $*]) ifFalse: [^dict]]
		ifFalse:
			[(cat = #description or: [cat first = $- or: [cat = #'pov symbols']])
				ifTrue: [^dict]].
	(aClass organization listAtCategoryNamed: cat)
		do:
			[:sel | dict add: (self recordMethod: sel category: cat class: aClass)].
	^dict
]

{ #category : #'interface specs' }
Cormas class >> reducedCommandsBar [
	"UIPainter new openOnClass: self andSelector: #reducedCommandsBar"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#label: 'CORMAS' 
			#min: #(Point 571 35) 
			#max: #(Point 571 35) 
			#bounds: #(Rectangle 282 380 853 415) 
			#colors: #(LookPreferences 
				#setBackgroundColor: #(ColorValue #white)) 
			#isEventDriven: true) 
		#component: #(SpecCollection 
			#collection: #(#(InputFieldSpec 
				#layout: #(Rectangle 391 6 430 30) 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 7044 7044 7044)) 
				#model: #stepCounter 
				#alignment: #right 
				#isReadOnly: true 
				#type: #number 
				#formatString: '0') #(LabelSpec 
				#layout: #(Point 352 8) 
				#label: #(UserMessage 
					#key: #time 
					#defaultString: 'Horloge')) #(InputFieldSpec 
				#layout: #(Rectangle 303 5 343 31) 
				#model: #cycle 
				#alignment: #right 
				#type: #number 
				#formatString: '0') #(ActionButtonSpec 
				#layout: #(Rectangle 119 5 189 32) 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 7044 7044 7044)) 
				#model: #runStepByStep 
				#label: #(UserMessage 
					#key: #step 
					#defaultString: 'Pas a pas') 
				#defaultable: true) #(ActionButtonSpec 
				#layout: #(Rectangle 43 5 117 32) 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 7044 7044 7044)) 
				#model: #openScenarioBuilderWin 
				#label: #(UserMessage 
					#key: #initialiser 
					#defaultString: 'Initialiser...') 
				#defaultable: true) #(ActionButtonSpec 
				#layout: #(Rectangle 193 5 280 32) 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 7044 7044 7044)) 
				#model: #runSimulation 
				#label: #(UserMessage 
					#key: #ntimes 
					#defaultString: 'Lancer N fois') 
				#defaultable: true) #(ActionButtonSpec 
				#layout: #(Rectangle 6 7 32 30) 
				#model: #expandMainWindow 
				#label: '<->' 
				#defaultable: true) #(LabelSpec 
				#layout: #(Point 242 324) 
				#name: #Label2 
				#label: 'simulation') #(LabelSpec 
				#layout: #(Point 446 8) 
				#name: #Label1 
				#label: 'simulation') #(ActionButtonSpec 
				#layout: #(Rectangle 501 6 560 30) 
				#name: #simButton2 
				#model: #openParametersWin 
				#label: '0' 
				#defaultable: true))))
]

{ #category : #'interface specs' }
Cormas class >> reducedWindow [
	"UIPainter new openOnClass: self andSelector: #reducedWindow"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#label: 'CORMAS' 
			#min: #(Point 571 35) 
			#max: #(Point 571 35) 
			#bounds: #(Rectangle 402 381 973 416) 
			#colors: #(LookPreferences 
				#setBackgroundColor: #(ColorValue #white)) 
			#isEventDriven: true) 
		#component: #(SpecCollection 
			#collection: #(#(InputFieldSpec 
				#layout: #(Rectangle 391 6 430 30) 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 7044 7044 7044)) 
				#model: #stepCounter 
				#alignment: #right 
				#isReadOnly: true 
				#type: #number 
				#formatString: '0') #(LabelSpec 
				#layout: #(Point 352 8) 
				#label: #(UserMessage 
					#key: #time 
					#defaultString: 'Horloge')) #(InputFieldSpec 
				#layout: #(Rectangle 303 5 343 31) 
				#model: #cycle 
				#alignment: #right 
				#type: #number 
				#formatString: '0') #(ActionButtonSpec 
				#layout: #(Rectangle 119 5 189 32) 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 7044 7044 7044)) 
				#model: #runStepByStep 
				#label: #(UserMessage 
					#key: #step 
					#defaultString: 'Pas a pas') 
				#defaultable: true) #(ActionButtonSpec 
				#layout: #(Rectangle 43 5 117 32) 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 7044 7044 7044)) 
				#model: #openScenarioBuilderWin 
				#label: #(UserMessage 
					#key: #initialiser 
					#defaultString: 'Initialiser...') 
				#defaultable: true) #(ActionButtonSpec 
				#layout: #(Rectangle 193 5 280 32) 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 7044 7044 7044)) 
				#model: #runSimulation 
				#label: #(UserMessage 
					#key: #ntimes 
					#defaultString: 'Lancer N fois') 
				#defaultable: true) #(ActionButtonSpec 
				#layout: #(Rectangle 6 7 32 30) 
				#model: #expandMainWindow 
				#label: '<->' 
				#defaultable: true) #(LabelSpec 
				#layout: #(Point 242 324) 
				#name: #Label2 
				#label: 'simulation') #(LabelSpec 
				#layout: #(Point 446 8) 
				#name: #Label1 
				#label: 'simulation') #(ActionButtonSpec 
				#layout: #(Rectangle 501 6 560 30) 
				#name: #simButton2 
				#model: #openParametersWin 
				#label: '0' 
				#defaultable: true))))
]

{ #category : #'+ user interface' }
Cormas class >> refresh: aSpaceInterface [
	"force the mainWindow of aSpaceInterface (spaceView) to refresh its display when the simulation runs in distributedmode.
Fixes problem of refreshing in distributed mode (without this instruction, the user needs to move his mouse over the spaceview for the display to refresh"
	
	aSpaceInterface mainWindow
		ifNotNil:
			[:w | current isDistributed ifTrue: [w displayPendingInvalidation]]
]

{ #category : #'util_files' }
Cormas class >> removeExtensionOf: aFilename [
	"convert and return the filename titi.ext as 'titi'"
	
	| aString index |
	aString := aFilename asString.
	index := aString
		indexOfSubCollection: aFilename extension
		startingAt: 1.
	index = 0 ifTrue: [^aFilename].
	^(aString
		copyReplaceFrom: index
		to: aString size
		with: '') asFilename
]

{ #category : #'+ utilities - string' }
Cormas class >> removeFirstCharacterOfString: aString [
	"Purpose: Remove the first character of aString. Answer a new String that is a copy of the argument, aString without the first character."
	
	| newString |
	newString := String new: aString size - 1.
	2
		to: aString size
		do:
			[:i | 
			newString
				at: i - 1
				put: (aString at: i)].
	^newString
]

{ #category : #'util_codeManagement' }
Cormas class >> renameAttribute: oldName to: newName inClass: aClass [
	"Rename the attribute of aClass by newName.
	
	oldName = <Symbol>
	newName = <Symbol>
	aClass = <Class> (full name of aClass, with its nameSpace)

	Ex: 
		Cormas renameAttribute: #energy to: #biomass inClass: CormasNS.Models.ECEC.Forager
		Cormas renameAttribute: #harvestRate: to: #harvestRateZZ: inClass: CormasNS.Models.ECEC.Forager class"
	
	| rb |
	(aClass instVarNames includes: oldName asString)
		ifTrue:
			[Cursor wait
				showWhile:
					[rb := RenameInstanceVariableRefactoring
						rename: oldName asString
						to: newName
						in: aClass.
					rb transform.
					RefactoringManager instance addRefactoring: rb]]
]

{ #category : #'util_codeManagement' }
Cormas class >> renameSelector: oldName to: newName nbArguments: nbArgs inClass: aClass [
	"Rename the method of aClass by newName. nbArgs is an integer representing the number of arguments of the method.
	
	oldName = <Symbol>
	newName = <Symbol>
	nbArgs = <Integer (positive)>
	aClass = <Class> (full name of aClass, with its nameSpace)

	Ex: 
		Cormas renameSelector: #updateEnergy to: #consumeEnergy nbArguments: 0 inClass: CormasNS.Models.ECEC.Forager
		Cormas renameSelector: #harvestRate: to: #harvestRateZZ: nbArguments: 1 inClass: CormasNS.Models.ECEC.Forager class"
	
	| map |
	map := (1 to: nbArgs) collect: [:i | i].
	(aClass allSelectors includes: oldName asSymbol)
		ifTrue:
			[Cursor wait
				showWhile:
					[(RenameMethodRefactoring
						renameMethod: oldName asSymbol
						in: aClass
						to: newName asSymbol
						permutation: map) execute]]
]

{ #category : #'- printing - documentation' }
Cormas class >> reportTextForClasses: aCollec [
	"Answer a Text containing a list ordered in alphabetic order of all the method definitions of a given collection of classes."
	
	| stream dictionaries methodName classProt comment dict dictClass dictAll i |
	stream := TextStream on: (String new: 100).
	dict := Dictionary new.
	dictClass := Dictionary new.
	dictAll := Dictionary new.
	aCollec
		do:
			[:aClass | 
			dictionaries := self recordDictClass: aClass.
			dictionaries first
				keysAndValuesDo:
					[:k :v | 
					"dict at: k put: v. "
					dictAll at: k put: v].
			dictionaries last
				keysAndValuesDo:
					[:k :v | 
					"dictClass at: k put: v. "
					dictAll at: k put: v]].
	dictAll keys asSortedCollection
		do:
			[:k | 
			methodName := (k tokensBasedOn: $&) first.
			classProt := (k tokensBasedOn: $&) last.
			comment := dictAll at: k.
			i := 0.
			(methodName tokensBasedOn: Character space)
				do:
					[:s | 
					i := i + 1.
					stream
						emphasis:
							((i \\ 2) isZero
								ifTrue: [self emphasisForMethodHeaderArg]
								ifFalse: [self emphasisForMethodHeader]).
					stream
						nextPutAll: s;
						space].
			stream emphasis: self emphasisForProtocol.
			stream
				nextPutAll: classProt;
				cr.
			stream emphasis: self emphasisForMethodComment.
			stream
				nextPutAll: comment;
				cr;
				cr].
	^stream contents
]

{ #category : #'+ utilities - mathematics' }
Cormas class >> round: aNumber toNdigits: x [
	"Purpose: Returns a float value rounded with a specified number of decimals
Argument: aNumber to be rounded   ; x the number of decimals wanted
Example: Cormas round: 5.1675634  toNdigits: 2	=> 5.17
Cormas round: 4/3 toNdigits: 1	=> 1.3"
	
	aNumber isInteger ifTrue: [^aNumber].
	x = 0 ifTrue: [^aNumber rounded].
	^(aNumber * (10 raisedTo: x)) rounded / (10 raisedTo: x) asFloat
]

{ #category : #'runtime mode accessing' }
Cormas class >> runtimeMode [
	"return the actual runtime mode for this image (usefull for adapting menus).
	3 values are supported : #developer, #modeler, #modelUser.
	the default value is #developer and is changed by the CormasPackager.
	"

	^ runtimeMode ifNil: [ runtimeMode := #developer ]
]

{ #category : #'runtime mode accessing' }
Cormas class >> runtimeMode: aSymbol [
	"set the actual runtime mode for this image (usefull for adapting menus).
	this method is reserved for the CormasPackager"

	(self availableRuntimeModes includes: aSymbol)
		ifFalse: [ ^ self error: 'Unsupported RuntimeMode' , aSymbol printString ].
	runtimeMode := aSymbol
]

{ #category : #'util_export' }
Cormas class >> saveAsST [
	"A kernel.st, a VisualLauncher and a Locale.st are created in kernel directory."
	"Cormas saveAsST"
	
	| defaultFileName fileName fileManager path vL |
	defaultFileName := (Cormas cormasPath construct: 'Kernel')
		construct: 'Kernel-v.' , self versionAsString , '.st'.
	fileName := Dialog
		requestNewFileName: (UserMessage defaultString: '' key: #export) asString
		default: defaultFileName.
	fileName = '' ifTrue: [^nil].	"update version name and comments"
	self
		setDescriptionFor: 'kernelFileName'
		withText:
			(fileName asArrayOfSubstringsSeparatedBy: Filename separator) last.	"save kernel file"
	fileManager := SourceCodeStream write: fileName encoding: #Source.
	[fileManager timeStamp.
	fileManager deferInitializations.
	self
		selectedThingsWithOrder:
			[:definedObjects | 
			definedObjects
				do:
					[:thing | 
					thing fileOutSourceOn: fileManager.
					fileManager cr]]
		onSelection: Kernel asNameSpace.
	fileManager finishInitializations.
	fileManager cr] ensure: [fileManager close].	"directoryName := self cormasPath , Cormas pathSeparator, directoryName.
	directoryName asFilename exists ifFalse: [directoryName asFilename makeDirectory]."	"export VisualLauncher"
	path := self cormasPath construct: 'Kernel'.
	vL := (path construct: 'VisualLauncher.st') asFilename.
	fileManager := SourceCodeStream write: vL encoding: #Source.
	[fileManager timeStamp.
	VisualLauncher fileOutSourceOn: fileManager]
		valueNowOrOnUnwindDo: [fileManager close]
]

{ #category : #'+ utilities - files' }
Cormas class >> saveCollec: aCollec asLineOfFile: aFilename separator: aChar [
	"Purpose: Save a Collection of literals (characters, numbers, strings...) into a defined file. The elements of the collection are saved into a single line, each one separated by aChar. If the file already exists, the elements of the collection are saved after the last line of the file.
Arguments: aColllec is the collection to be savec ; aFilename is a filename object indicatng the name, the extension and the path of the file  ; aChar the character of the separator writen between each element
Example: Cormas saveCollec: #(abc '??' 67) asLineOfFile: ((Cormas modelPath: #ECEC) construct: 'test.csv')   separator: $;  "
	
	| stream |
	stream := aFilename appendStream.
	1
		to: aCollec size - 1
		do:
			[:i | stream nextPutAll: (aCollec at: i) printString , aChar asSymbol asString].
	stream nextPutAll: aCollec last printString.
	stream nextPutAll: '\' withCRs.
	stream close
]

{ #category : #deprecated }
Cormas class >> saveCollec: aCollec inCsvFile: aString [
	
	self
		saveElementsOfCollec: aCollec
		inFile: (self removeExtensionOf: aString) asString , '.csv'
]

{ #category : #deprecated }
Cormas class >> saveCollec: t1 inFile: t2 [
	"Deprecated. Should use CormasModel updateFile: t1 dataCollection: t2 separator: t3"
	
	| t3 |
	t3 := t2 asFilename appendStream.
	t1 do: [:t4 | t3 nextPutAll: t4 printString , ';'].
	t3 nextPutAll: '\' withCRs.
	t3 close.
	^self
]

{ #category : #deprecated }
Cormas class >> saveCollec: aCollec inTxtFile: aString [
	
	| file lastData i |
	file := aString asFilename appendStream.
	lastData := aCollec size.
	i := 1.
	aCollec
		do:
			[:a | 
			i = lastData
				ifFalse: [file nextPutAll: a asString , '\' withCRs]
				ifTrue: [file nextPutAll: a asString].
			i := i = 1].
	file close
]

{ #category : #'+ utilities - files' }
Cormas class >> saveElementsOfCollec: aCollec inFile: aFilename [
	"Purpose: Save a Collection of literals (characters, numbers, strings...) into a defined file. Each element of the collection is saved into a separate line of the file. If the file already exists, the elements of the collection are saved starting frm the end of the file.
Arguments: aColllec is the collection to be savec ; aFilename is a filename object indicatng the name, the extension and the path of the file
Example: Cormas saveElementsOfCollec: #(abc ?? 67) inFile: ((Cormas modelPath: #ECEC) construct: 'test.txt')     "
	
	| file lastData i |
	file := aFilename appendStream.
	lastData := aCollec size.
	i := 1.
	aCollec
		do:
			[:a | 
			i = lastData
				ifFalse: [file nextPutAll: a asString , '\' withCRs]
				ifTrue: [file nextPutAll: a asString].
			i := i = 1].
	file close
]

{ #category : #'util_export' }
Cormas class >> saveImage [
	"save the vw image with Cormas. Usually called when Cormas has just been installed or updated.
Cormas saveImage"
	
	| stringName |
	(self current
		confirm:
			'Cormas has been loaded successfully. \ Do you want to save Cormas now?'
				withCRs)
		ifTrue:
			[ObjectMemory verboseGlobalCompactingGC.
			Transcript clear.
			stringName := Dialog requestNewFileName: 'Save image as' default:
					'cormas.im'.
			stringName isEmpty ifTrue: [^nil].
			stringName := (self
				removeExtensionOf: stringName asFilename tail asFilename) asString.
			ObjectMemory saveAs: stringName thenQuit: false.
			Cormas visualLauncherWindow
				ifNotNil: [:w | w label: VisualLauncher title]]
]

{ #category : #'util_export' }
Cormas class >> saveParcelFromPackage: aPackage [
	
	aPackage name = 'Cormas'
		ifTrue: [PublishAsParcelDialog publishAsParcel: aPackage]
		ifFalse:
			[| parcel |
			parcel := aPackage asParcel.
			self silentlySaveParcel: parcel]
]

{ #category : #accessing }
Cormas class >> seed [
	
	seed isNil ifTrue: [self seed: self Rand class Ui].
	^seed
]

{ #category : #accessing }
Cormas class >> seed: aValue [
	
	Rand := RandFishmanMoore new.
	RandFishmanMoore Ui: aValue.
	seed := aValue
]

{ #category : #'+ utilities - collection' }
Cormas class >> selectEntitiesWithMaxOf: aMagnitudeName amongEntities: aCollection verifying: aCondition [
	"Purpose: selects the entities with the maximum value of a given magnitude and verifying a specified condition. 
Arguments: aMagnitudeName = <ByteSymbol>
			aCollection = <Collection(Entity)>
			aCondition = <BlockClosure>
Return value: <Collection(Entity)>
Example: Cormas selectEntitiesWithMaxOf: #water amongEntities self theCells verifying: [:c | c isPolluted not]"
	
	| selection |
	selection := aCollection
		select:
			[:c | ((c perform: aMagnitudeName) respondsTo: #>) and: [aCondition value: c]].
	selection := selection
		asSortedCollection:
			[:i :j | (i perform: aMagnitudeName) > (j perform: aMagnitudeName)].
	selection := selection
		select:
			[:c | (c perform: aMagnitudeName) = (selection first perform: aMagnitudeName)].
	^selection
]

{ #category : #'+ utilities - random' }
Cormas class >> selectRandomlyFrom: aCollection [
	aCollection isEmpty
		ifTrue: [ ^ nil ].
	^ aCollection atRandom
]

{ #category : #'+ utilities - random' }
Cormas class >> selectRandomlyFrom: aCollection constrainedBy: aBlock [
	"Purpose: Returns an item satisfying the condition aBlock at randomly position of the collection 'aCollection'. 
If the collection is empty, or no item satisfies the condition aBlock, its returns nil.
Example:  Cormas selectRandomlyFrom: (List withAll: #(1 2 3 4 5)) constrainedBy: [:i | i > 2].
Example:  Cormas selectRandomlyFrom: self thePersons constrainedBy: [:p | p  age <  42] "
	
	| x collec2 |
	collec2 := aCollection select: aBlock.
	collec2 isEmpty ifTrue: [^nil].
	x := self
		randomFrom: 1
		to: collec2 size.
	^collec2 asOrderedCollection at: x
]

{ #category : #'+ utilities - random' }
Cormas class >> selectRandomlyFrom: aCollection subCollectionSize: anInteger [
	"Purpose: Returns a subcollection randomly built from a collection (an item may be selected only once). If the collection is empty, or if the collection size is lower than the subcollection size, its returns aCollection randomly mixed..
Examples: Cormas selectRandomlyFrom: (Set withAll: #(1 2 3 4 5)) subCollectionSize: 3 => OrderedCollection (4 5 1)
			self ask: (Cormas selectRandomlyFrom: (self theCells select:[:c| c state = #tree]) subCollectionSize: 4) toDo: #burn"
	
	| randomCollection |
	anInteger < 1 ifTrue: [^OrderedCollection new].
	randomCollection := Cormas mixt: aCollection.
	randomCollection size <= anInteger ifTrue: [^randomCollection].
	^randomCollection copyFrom: 1 to: anInteger
]

{ #category : #'+ utilities - random' }
Cormas class >> selectRandomlyFrom: aCollection subCollectionSize: anInteger constrainedBy: aBlock [
	"Purpose: Returns a subcollection, which elements satisfies the condition aBlock and are randomly picked from aCollection (an element may be selected only once). If aCollection is empty, or if the number of elements satisfying the condition aBlock is lower than the subcollection size, its returns a collection of elements satsisfying the condition randomly mixed..
Examples: Cormas selectRandomlyFrom: (Set withAll: #(1 2 3 4 5)) subCollectionSize: 3  constrainedBy: [:i | i > 2].
			self ask: (Cormas selectRandomlyFrom: self theCells subCollectionSize: 4 constrainedBy: [:c| c state = #tree]) toDo: #burn"
	
	| randomCollection |
	anInteger < 1 ifTrue: [^OrderedCollection new].
	randomCollection := Cormas mixt: (aCollection select: aBlock).
	randomCollection size <= anInteger ifTrue: [^randomCollection].
	^randomCollection copyFrom: 1 to: anInteger
]

{ #category : #'private_aleat' }
Cormas class >> selectSimpleRandomlyFrom: aCollection [
	"Returns an item at randomly position of the collection 'aCollection'. 
ex: Cormas selectSimpleRandomlyFrom: (Set withAll: #(1 2 3 4 5))"
	
	^aCollection
		at:
			(self
				simpleRandomFrom: 1
				to: aCollection size)
]

{ #category : #'util_export' }
Cormas class >> selectedThingsWithOrder: aBlock onSelection: aNameSpace [
	
	| things |
	things := OrderedCollection new.
	things add: aNameSpace.
	things addAll: aNameSpace allClasses.
	things addAll: aNameSpace allNameSpaces.
	things := SystemUtils sortForLoading: things.
	aBlock value: things
]

{ #category : #'util_files' }
Cormas class >> separator [
	
	^DataSaver_Asci separator
]

{ #category : #'util_files' }
Cormas class >> separator: aSeparator [
	
	DataSaver_Asci separator: aSeparator
]

{ #category : #version }
Cormas class >> setDescriptionFor: method withText: text [
	"Creates  a method for a CormasModel subclass from the text"
	
	| textWithoutQuote |
	textWithoutQuote := text copyReplaceAll: #($') with: #($").	"embedded quotes get doubled"
	self class
		compile:
			method ,
					'
^ ''' , textWithoutQuote , '''	'
		classified: 'version'
		notifying: nil
]

{ #category : #'util_export' }
Cormas class >> silentlySaveParcel: aParcel [
	"Save aParcel into model's directory. Erase previous version"
	
	| pfe pse parcelName |
	pfe := aParcel class fileExtension.
	pse := aParcel class sourceExtension.
	(parcelName := aParcel name) isNil
		ifTrue:
			[parcelName := self current request: 'Enter a name for the Parcel'].	"Adapting the VW parcels path Settings"
	CormasLauncher setParcelPathForModel: parcelName.	"Save the Parcel"
	aParcel
		parcelOutOn: ((Cormas modelPath: parcelName) construct: parcelName , pfe)
		withSource: ((Cormas modelPath: parcelName) construct: parcelName , pse)
		hideOnLoad: false
		republish: true
		backup: false
]

{ #category : #'private_aleat' }
Cormas class >> simpleRandom [
	" Return a pseudo-random value according to the Random equation. No seed.
	It is also useful for non-entities, as display processes for example"
	
	simpleRand isNil 
		ifTrue: [ simpleRand := Random new ].
	^ simpleRand next
]

{ #category : #'private_aleat' }
Cormas class >> simpleRandomFrom: start to: end [
	"Return a random value between 'start' and 'end'.
	This method doesn't use the 'random' method of Cormas and so do not change the next value of RandFishmanMoore.
	It is also useful for non-entities, as display processes for example"
	
	| extent |
	extent := end - start + 1.
	^end min: (Cormas simpleRandom * extent) truncated + start
]

{ #category : #'interface specs' }
Cormas class >> simulationWindow [
	"Tools.UIPainter new openOnClass: self andSelector: #simulationWindow"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#properties: #(PropertyListDictionary #sizeType #specifiedSize #openType #advanced #openPosition #(Point 10 305) #positionType #specifiedPosition) 
			#label: 'Simulation' 
			#min: #(Point 395 108) 
			#max: #(Point 404 150) 
			#bounds: #(Rectangle 720 450 1124 558) 
			#colors: #(LookPreferences 
				#setForegroundColor: #(ColorValue #black) 
				#setBackgroundColor: #(ColorValue #white) 
				#setSelectionForegroundColor: #(ColorValue #black) 
				#setSelectionBackgroundColor: #(ColorValue 6143 6143 6143) 
				#setBorderColor: #(ColorValue #black)) 
			#isEventDriven: true) 
		#component: #(SpecCollection 
			#collection: #(#(ArbitraryComponentSpec 
				#layout: #(Rectangle 120 38 344 91) 
				#name: #ViewHolder1 
				#flags: 0 
				#component: #twoWaysIcon) #(LabelSpec 
				#layout: #(Point 191 24) 
				#label: 'current step' 
				#style: #pixelSmall) #(InputFieldSpec 
				#layout: #(Rectangle 344 52.0 399 76.0) 
				#model: #cycle 
				#callbacksSpec: #(UIEventCallbackSubSpec 
					#requestValueChangeSelector: #changeFinalV) 
				#helpText: 'Enter the Final step' 
				#alignment: #right 
				#type: #number 
				#formatString: '0') #(LabelSpec 
				#layout: #(Point 242 324) 
				#name: #Label2 
				#label: 'simulation') #(DividerSpec 
				#layout: #(Rectangle 84 25 88 99) 
				#name: #Divider2 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 7044 7044 7044)) 
				#orientation: #vertical) #(LabelSpec 
				#layout: #(Point 353 24) 
				#name: #Label3 
				#label: 'Final step' 
				#style: #pixelSmall) #(LabelSpec 
				#layout: #(Point 40 -1) 
				#name: #Label6 
				#label: 'Initialize') #(InputFieldSpec 
				#layout: #(LayoutSizedOrigin 190 0 50 0 45 24) 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 7700 7700 7700)) 
				#model: #stepCounter 
				#callbacksSpec: #(UIEventCallbackSubSpec 
					#requestValueChangeSelector: #changeV) 
				#tabable: false 
				#helpText: 'current time' 
				#alignment: #right 
				#isReadOnly: false 
				#type: #number 
				#formatString: '0') #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(LayoutSizedOrigin 249 0 20 0 40 40) 
				#name: #stepButton 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white)) 
				#model: #runStepByStep 
				#tabable: false 
				#helpText: 'Execute 1 step' 
				#label: #stepIcon 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(LayoutSizedOrigin 290 0 20 0 43 40) 
				#name: #runButton 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white)) 
				#model: #run 
				#tabable: false 
				#helpText: 'Run simulation until final step' 
				#label: #runIcon 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(LayoutSizedOrigin 91 0 43 0 43 40) 
				#name: #runBackButton 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white)) 
				#model: #runBack 
				#tabable: false 
				#helpText: 'Replay simulation backward' 
				#label: #runBackIcon 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(LabelSpec 
				#layout: #(Point 267 -3) 
				#name: #Label1 
				#label: 'Forward' 
				#style: #systemDefault) #(LabelSpec 
				#layout: #(Point 106 -3) 
				#name: #Label7 
				#label: 'backward' 
				#style: #systemDefault) #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(LayoutSizedOrigin 136 0 43 0 40 40) 
				#name: #stepBackButton 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white)) 
				#model: #stepBack 
				#tabable: false 
				#helpText: 'Return 1 step backward' 
				#label: #stepBackIcon 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(LayoutSizedOrigin 290 0 61 0 43 40) 
				#name: #replayRunForwardButton 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white)) 
				#model: #replayRunForward 
				#tabable: false 
				#helpText: 'Replay stored simulation' 
				#label: #replayRunForwardIcon 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(LayoutSizedOrigin 249 0 61 0 40 40) 
				#name: #replayStepForwardButton 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white)) 
				#model: #replayStepForward 
				#tabable: false 
				#helpText: 'Replay 1 stored step' 
				#label: #replayStepForwardIcon 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(LabelSpec 
				#layout: #(Point 1 32) 
				#name: #Label4 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue 7466 2799 2799)) 
				#label: 'simulate' 
				#style: #pixelSmall) #(LabelSpec 
				#layout: #(Point 11 74) 
				#name: #Label5 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue 4607 1024 8191)) 
				#label: 'replay' 
				#style: #pixelSmall) #(DividerSpec 
				#layout: #(Rectangle 339 25 343 99) 
				#name: #Divider3 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 7044 7044 7044)) 
				#orientation: #vertical) #(ActionButtonSpec 
				#layout: #(Rectangle 386 2 401 16) 
				#name: #ActionButton1 
				#model: #openSimulationGUI 
				#tabable: false 
				#label: 'X' 
				#defaultable: true) #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(LayoutSizedOrigin 40 0 20 0 40 40) 
				#name: #ActionButton4 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white)) 
				#model: #openScenarioBuilderWin 
				#tabable: false 
				#helpText: 'Define the scenario' 
				#label: #initSimIcon 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(LayoutSizedOrigin 40 0 61 0 40 40) 
				#name: #ActionButton3 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white)) 
				#model: #openReplayWin 
				#tabable: false 
				#helpText: 'Replay a stored simulation' 
				#label: #initReplayIcon 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(ActionButtonSpec 
				#layout: #(Rectangle 352.5 84 390.5 99) 
				#name: #ActionButton2 
				#model: #setStepMethod 
				#label: 'Change' 
				#style: #pixelSmall 
				#defaultable: true))))
]

{ #category : #'+ utilities - mathematics' }
Cormas class >> sin: x min: min max: max phase: phase period: period [
	"return the sinus function of x, according to min value, max value, phase and period.
example: Environment updateTemperature: time 
	temperatureMin= -10 	temperatureMax = 20	period = 24
 	self temperature: self temperatureMin + Cormas sin: time min: -10 max: 20 phase: 0 period: 24"
	
	| delta omega |
	delta := max - min.
	omega := 2 * Float pi / period.
	^delta / 2 + (delta / 2 * (omega * (x + phase)) sin)
]

{ #category : #accessing }
Cormas class >> socialEntitiesClassNames [
	
	| collec |
	collec := OrderedCollection new.
	collec add: 'Agent'.
	self cmEnvironment allClasses "should be allEntityClasses ??" 
		do: [ : aClass | (aClass inheritsFrom: CMAgent) 
				ifTrue: [ collec add: aClass name asString ] ].
	^ collec
]

{ #category : #'+ utilities - collection' }
Cormas class >> sort: collec byDecreasing: att1 thenByDecreasing: att2 [
	"Purpose: Sort a collection of objects (entities) that have the same attributes att1 and att2, first according to an decreasing order of att1, then according to an decreasing value of att2.
Arguments: collec is the collection to be sorted. at1 and aat2 are the names (in symbol) of the attributes
Example: Cormas sort: (self theTrees) byDecreasing: #age thenByDecreasing: #height"
	
	| oc temp tutu |
	oc := OrderedCollection new.
	temp := (collec
		asSortedCollection: [:i :j | (i perform: att1) > (j perform: att1)])
		asOrderedCollection.
	[temp isEmpty]
		whileFalse:
			[tutu := temp select: [:i | (temp first perform: att1) = (i perform: att1)].
			oc
				addAllLast:
					(tutu asSortedCollection: [:i :j | (i perform: att2) > (j perform: att2)]).
			temp removeAll: tutu].
	^oc
]

{ #category : #'+ utilities - collection' }
Cormas class >> sort: collec byDecreasing: att1 thenByIncreasing: att2 [
	"Purpose: Sort a collection of objects (entities) that have the same attributes att1 and att2, first according to an Decreasing order of att1, then according to an increasing value of att2.
Arguments: collec is the collection to be sorted. at1 and aat2 are the names (in symbol) of the attributes
Example: Cormas sort: (self theTrees) byDecreasing: #age thenByIncreasing: #height"
	
	| oc temp tutu |
	oc := OrderedCollection new.
	temp := (collec
		asSortedCollection: [:i :j | (i perform: att1) > (j perform: att1)])
		asOrderedCollection.
	[temp isEmpty]
		whileFalse:
			[tutu := temp select: [:i | (temp first perform: att1) = (i perform: att1)].
			oc
				addAllLast:
					(tutu asSortedCollection: [:i :j | (i perform: att2) < (j perform: att2)]).
			temp removeAll: tutu].
	^oc
]

{ #category : #'+ utilities - collection' }
Cormas class >> sort: collec byIncreasing: att1 thenByDecreasing: att2 [
	"Purpose: Sort a collection of objects (entities) that have the same attributes att1 and att2, first according to an increasing order of att1, then according to an decreasing value of att2.
Arguments: collec is the collection to be sorted. at1 and aat2 are the names (in symbol) of the attributes
Example: Cormas sort: (self theTrees) byIncreasing: #age thenByDecreasing: #height"
	
	| oc temp tutu |
	oc := OrderedCollection new.
	temp := (collec
		asSortedCollection: [:i :j | (i perform: att1) < (j perform: att1)])
		asOrderedCollection.
	[temp isEmpty]
		whileFalse:
			[tutu := temp select: [:i | (temp first perform: att1) = (i perform: att1)].
			oc
				addAllLast:
					(tutu asSortedCollection: [:i :j | (i perform: att2) > (j perform: att2)]).
			temp removeAll: tutu].
	^oc
]

{ #category : #'+ utilities - collection' }
Cormas class >> sort: collec byIncreasing: att1 thenByIncreasing: att2 [
	"Purpose: Sort a collection of objects (entities) that have the same attributes att1 and att2, first according to an increasing order of att1, then according to an increasing value of att2.
Arguments: collec is the collection to be sorted. at1 and aat2 are the names (in symbol) of the attributes
Example: Cormas sort: (self theTrees) byIncreasing: #age thenByIncreasing: #height"
	
	| oc temp tutu |
	oc := OrderedCollection new.
	temp := (collec
		asSortedCollection: [:i :j | (i perform: att1) < (j perform: att1)])
		asOrderedCollection.
	[temp isEmpty]
		whileFalse:
			[tutu := temp select: [:i | (temp first perform: att1) = (i perform: att1)].
			oc
				addAllLast:
					(tutu asSortedCollection: [:i :j | (i perform: att2) < (j perform: att2)]).
			temp removeAll: tutu].
	^oc
]

{ #category : #'+ utilities - collection' }
Cormas class >> sortDecreasingly: aCollectionOfNumbers [
	"Purpose: sort the elements of a collection in an decreasing order
Argument: aCollectionOfNumbers = < OrderedCollection> or <Array>
Return value: a sorted collection
Example: Cormas sortDecreasingly: #( 2 1 3)	 => aSortedCollection (3 2 1)"

	^ aCollectionOfNumbers asSortedCollection: [ :a :b | a > b ]
]

{ #category : #'+ utilities - collection' }
Cormas class >> sortIncreasingly: aCollectionOfNumbers [
	"Purpose: sort the elements of a collection in an increasing order
Argument: aCollectionOfNumbers = < OrderedCollection> or <Array>
Return value: a sorted collection
Example: Cormas sortIncreasingly: #( 2 1 3)	 => aSortedCollection (1 2 3)"

	^ aCollectionOfNumbers asSortedCollection: [ :a :b | a < b ]
]

{ #category : #accessing }
Cormas class >> spatialEntitiesClassNames [
	
	| collec |
	collec := OrderedCollection new.
	self cmEnvironment allClasses "should be allEntityClasses ??" 
		do: [ : aClass | 
			(aClass inheritsFrom: CMSpatialEntity)
				ifTrue: [ collec add: aClass name asString ] ].
	^collec
]

{ #category : #'+ utilities - files' }
Cormas class >> splitLine: stream sep: aSepChar [
	"Purpose: Used when loading an external file. Split a read stream according to a given separator character
Example: Cormas splitLine: aStream sep: $,   "
	
	| wordsList line item |
	wordsList := OrderedCollection new.
	line := (stream upTo: Character cr) readStream.
	[line atEnd]
		whileFalse:
			[item := line upTo: aSepChar.
			wordsList add: item].
	line close.
	^wordsList
]

{ #category : #'+ utilities - value types' }
Cormas class >> splitString: aString with: aChar [
	"Purpose: Splits a string according to a given separator character and returns a collection of the splited portions of the string
Examples: Cormas splitString: 'Hello world;Bonjour le monde;Bom dia Mundo;Buenos Dias Mundo' with: $; "
	
	| stream collec |
	stream := aString readStream.
	collec := OrderedCollection new.
	[stream atEnd] whileFalse: [collec add: (stream upTo: aChar)].
	stream close.
	^collec
]

{ #category : #'+ utilities - mathematics' }
Cormas class >> standardDeviation: aCollectionOfNumbers [
	"Purpose : Returns the standardDeviation of set of numbers. Measure of the dispersal of a series with regard to their average. Its value is obtained by calculating the square root of the variance (see ''variance:').
Argument: aCollectionOfNumbers = < OrderedCollection> or <Array>
Example:		Cormas standardDeviation: #( 1 2 3)	=> 0.816497"
	
	^(self variance: aCollectionOfNumbers) sqrt
]

{ #category : #'+ utilities - string' }
Cormas class >> stringAsObjectType: aString [
	"Pupose: convert aString into a Number, a Boolean, a Symbol, or a String depending of the content.
Examples: 
	Cormas stringAsType: '12.3' => 12.3   or '12,3' => 12.3
	Cormas stringAsType: 'true' => true
	Cormas stringAsType: '#truc' => #truc
	Cormas stringAsType: 'abc' => 'abc' "
	
	aString isEmpty ifTrue: [^nil].
	(aString allSatisfy: [:elem | elem isDigit or: [elem = $.]])
		ifTrue: [^aString asNumber].
	aString first = $#
		ifTrue: [^(self removeFirstCharacterOfString: aString) asSymbol].
	aString = 'true' ifTrue: [^true].
	aString = 'false' ifTrue: [^false].
	(aString allSatisfy: [:elem | elem isDigit or: [elem = $,]])
		ifTrue: [^(aString copyReplaceAll: ',' with: '.') asNumber].
	^aString
]

{ #category : #'+ utilities - mathematics' }
Cormas class >> sum: aCollectionOfNumbers [
	"Purpoose: Answer the summation of a set of numbers. 
Argument: aCollectionOfNumbers = < OrderedCollection> or <Array>
Example: Cormas sum: #( 1 2 3)	=> 6"

	^ aCollectionOfNumbers sum
]

{ #category : #version }
Cormas class >> systemInformationString [

	^ String streamContents: [ : stream |
		stream 
			cr;
			nextPutAll: self currentVersion;
			cr; cr;
			nextPutAll: self licenseString;
			cr; cr;
			nextPutAll: self downloadString;
			cr; cr;
			nextPutAll: self contributors ]
]

{ #category : #'+ utilities - string' }
Cormas class >> textAsList: aText [
	"Purpose: Returns a list of strings corresponding to each line of a given text.
Examples: Cormas textAsList: 'Hello world\Bonjour le monde\Bom dia Mundo\Buenos Dias Mundo' withCRs
Cormas textAsList:'Hello world
Bonjour le monde
		Bom dia Mundo
Buenos Dias Mundo' withCRs "
	
	| stream list |
	self flag:#curiousMethod.
	list := OrderedCollection new.
	stream := ReadStream on: aText asString.
	[stream atEnd] whileFalse: [list add: (stream upTo: Character cr)].
	stream close.
	^list
]

{ #category : #'+ utilities - mathematics' }
Cormas class >> transposeMatrix: aCollectionOfCollections [
	"Return a transposed collection Of Collections.
Ex:
| collA |
	collA := OrderedCollection new.
	7 timesRepeat:[
	collA add: ( OrderedCollection withAll: #( 1 2 3 4 5))].
	collA inspect.
	(Cormas transposeMatrix: collA) inspect    "
	
	| coll2 line2 max |
	"complete irregular lines to get a full matrix"
	max := 0.
	aCollectionOfCollections
		do: [:lineColl | lineColl size > max ifTrue: [max := lineColl size]].
	aCollectionOfCollections
		do: [:lineColl | [lineColl size < max] whileTrue: [lineColl add: nil]].	"transpose"
	coll2 := OrderedCollection new.
	1
		to: aCollectionOfCollections first size
		do:
			[:col | 
			line2 := OrderedCollection new.
			1
				to: aCollectionOfCollections size
				do:
					[:ligne | line2 add: ((aCollectionOfCollections at: ligne) at: col)].
			coll2 add: line2].
	^coll2
]

{ #category : #version }
Cormas class >> updateComments [
	"Add some comments to the new Cormas version by editing a Comment board and add the strings into the #versionComments method. Example:
versionComments
	^ 'old comments
------- 2011/1/7 - 11:58:34 ------- 
new comments.

	Cormas  updateComments "
	
	| commentInterface |
	"open comments window"
	commentInterface := CommentInterface new.
	commentInterface
		cormasComments:
			(' --------------------- ' withCRs , self versionAsString ,
					' --------------------- 
') asValue.
	commentInterface authorName: self currentDeveloperName asValue.
	commentInterface openInterface: #commentsCormasWindow.	"update the #versionComments method"
	self
		setDescriptionFor: 'versionComments'
		withText:
			self versionComments , '\' withCRs , commentInterface cormasComments value
				, '\' withCRs , ' *** Developer: ' , commentInterface authorName value
				, ' ***' , '\' withCRs , ' *** kernel FileName: ' , self kernelFileName
				, ' ***' , '\' withCRs , ' *** VW compatibility: '
				, self vwCompatibleVersion printString , ' ***'.	"update the #currentDeveloperName method"
	self currentDeveloperName = commentInterface authorName value
		ifFalse:
			[self
				setDescriptionFor: 'currentDeveloperName'
				withText: commentInterface authorName value].
	((self textAsList: self developerNames)
		includes: self currentDeveloperName)
		ifFalse:
			[self
				setDescriptionFor: 'developerNames'
				withText:
					self developerNames , '\' withCRs , commentInterface authorName value].
	^commentInterface
]

{ #category : #deprecated }
Cormas class >> updateFile: t1 dataCollection: t2 separator: t3 [
	"Deprecated. Should use CormasModel updateFile: t1 dataCollection: t2 separator: t3"
	
	| t4 t5 t6 t7 |
	t5 := t3 asSymbol asString.
	t4 := t1 appendStream.
	t6 := 1.
	t7 := t2 size - 1.
	[t6 <= t7]
		whileTrue:
			[t4 nextPutAll: (t2 at: t6) printString , t5.
			t6 := t6 + 1].
	t4 nextPutAll: t2 last printString.
	t4 nextPutAll: '\' withCRs.
	t4 close.
	^self
]

{ #category : #version }
Cormas class >> updateName [
	"	update the Cormas name with new date"
	
	self class
		compile:
			'cormasName\	^ ''' withCRs , 'cormasMVC'
				, Time dateAndTimeNow first year printString , ''''
		classified: 'version'
		notifying: nil.
	^self
]

{ #category : #version }
Cormas class >> updateVersion [
	"Create the Cormas 'version' method. Example:
version
	^ #(2010 6 24 8 31 54)   
Cormas updateVersion"
	
	self class
		compile: 'version\	^ ' withCRs , self dateAsArray printString
		classified: 'version'
		notifying: nil.
	self updateName.
	self updateComments
]

{ #category : #'+ utilities - string' }
Cormas class >> upperCaseFirstChar: aString [
	"Purpose: Converts the first character of of a string into uppercase
Example: Cormas upperCaseFirstChar: 'hello World'  => 'Hello World'  "
	
	^aString capitalized
]

{ #category : #'+ utilities - string' }
Cormas class >> upperCaseString: aString [
	"Purpose: Converts all lowercase characters of a string into uppercase characters
Example: Cormas upperCaseString: 'Hello World'   "
	
	| ws |
	ws := WriteStream on: (aString species new: aString size).
	1
		to: aString size
		do:
			[:i | 
			| c |
			c := aString at: i.
			ws
				nextPut:
					(c isLowercase
						ifFalse: [c]
						ifTrue: [c asUppercase])].
	^ws contents
]

{ #category : #'+ utilities - mathematics' }
Cormas class >> upperQuartile: aCollectionOfNumbers [
	"Purpose : Returns the upper quartile of a numbers distribution. 
The upper quartile (or third quartile or Q3) is the value of the sorted series of numbers which splits the highest 25% of data (or lowest 75%)
For example, assume that we have obtained the following 20 observations:
   2, 4, 7, -20, 22, -1, 0, -1, 7, 15, 8, 4, -4, 11, 11, 12, 3, 12, 18, 1
In order to calculate the quartiles we first have to sort the observations:
   -20, -4, -1, -1, 0, 1, 2, 3, 4, 4, 7, 7, 8, 11, 11, 12, 12, 15, 18, 22
The position of the third quartile is x = 0.75*(20+1) = 15.75 
Example: Cormas upperQuartile: #(2 4 7 -20 22 -1 0 -1 7 15 8 4 -4 11 11 12 3 12 18 1)"

	| sortedColl |
	aCollectionOfNumbers size = 0
		ifTrue: [ ^ 0 ].
	sortedColl := aCollectionOfNumbers asSortedCollection: [ :a :b | a < b ].
	^ sortedColl at: (0.75 * ((sortedColl size) + 1)) rounded 
]

{ #category : #'+ utilities - value types' }
Cormas class >> valueFrom: anObjectOrMenuItemOrValueHolder [
	"return either the value of the argument if it is a MenuItem or a ValueHolder or the argument itself "
	
	^anObjectOrMenuItemOrValueHolder cormasHelper valueFrom:
			anObjectOrMenuItemOrValueHolder
]

{ #category : #deprecated }
Cormas class >> valueOfValueInString: aString [
	"DEPRECATED.
Should use #stringAsType:aStrings"
	
	aString ifNil: [^nil].
	aString first isDigit ifTrue: [^aString asNumber].
	aString first = $#
		ifTrue:
			[^(aString
				copyFrom: 2
				to: aString size) asSymbol].
	(aString = 'true' or: [aString = 'false']) ifTrue: [^aString asBoolean].
	^aString
]

{ #category : #'+ utilities - mathematics' }
Cormas class >> variance: aCollectionOfNumbers [
	"Purpose: Returns the variance of set of numbers. Measure of the dispersal of a series with regard to their average. The dispersal of a statistical distribution is obtained by dividing the sum of the squares of the distances in the average by the number N from elements. For instance the average of 1, 2 and 3 is 2 , but the variance is 0,667.
	[(1 - 2)2 + (2 - 2)2 + (3 - 2)2] √∑ 3 = 0,667
Argument: aCollectionOfNumbers = < OrderedCollection> or <Array>
Example: Cormas variance: #( 1 2 3)		=> 0.666667  "

	| moy |
	aCollectionOfNumbers size = 0
		ifTrue: [ ^ 0 ].
	moy := self average: aCollectionOfNumbers.
	^ ((aCollectionOfNumbers inject: 0 into: [ :subTotal :next | subTotal + (next - moy) squared ])
		/ aCollectionOfNumbers size) asFloat
]

{ #category : #version }
Cormas class >> version [
	
	^#(2014 6 23 11 51 45)
]

{ #category : #version }
Cormas class >> versionAsString [
	
	^self versionAsString: self version
]

{ #category : #version }
Cormas class >> versionAsString: aDateCollection [
	"  Cormas versionAsString:#(2010 6 24 8 31 54)  -> '2010.6.24 '  "
	
	| text |
	text := ''.
	text := text , (aDateCollection at: 1) printString , '.'.
	text := text , (aDateCollection at: 2) printString , '.'.
	text := text , (aDateCollection at: 3) printString.	", ' - ' "	"text := text , (aDateCollection at: 4) printString , ':'.
	text := text , (aDateCollection at: 5) printString , ':'.
	text := text , (aDateCollection at: 6) printString."
	^text
]

{ #category : #version }
Cormas class >> versionComments [
	
	^'
 --------------------- 2011/2/13 - 16:22:57 --------------------- 
- CormasModel as subclass of ApplicationModel.
- Entity class : chooseActivityDiagramEditorToReOpen
- Add this new Cormas version utility (with developer name):
Cormas class : 
		update updateVersion method.
		create #updateComments method.
		create #versionComments method.
		add developerNames methods.
		new menu, displayCormasVersion
CommentInterface: add one new interface for this comment.
 *** Developer: Pierre Bommel ***
 --------------------- 2011/2/14 - 3:11:52 --------------------- 
finalize the Comments Version utility
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2011214 - ooo.st ***
 --------------------- 2011/2/14 - 5:55:48 --------------------- 
Comments utilities + kernel filename

 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2011214 - commentVersion.st ***
 --------------------- 2011/2/14 - 6:14:5 --------------------- 
Display the Cormas contributors into "about Cormas" window
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2011214 - contributors.st *** 
 --------------------- 2011/2/17 - 15:55:21 --------------------- 
Allows to create and manipulate Arcs on the grid.
New classes :
  - ToolConditionType
  - ConditionTransitionTable
Modifications on classes :
  - Tool : #initializeCreateEntityTool
  - SpaceInterface createStartArcEntityOn
  - CreateInstances : nouvelle var de classe : entityClass pour √™tre facilement accessible depuis le Tool. #createInstancesOnCell:aCell. modif de l"interface

Other small modifications: manipulate locatedObjects when aggregated POV is selected
  - SpaceView #spatialAgregateFigureAt:
  - Figure #isMovedTo:
  - CompositeEntityFigure #celluleFigureAt:
  - SpaceViewZoom #zoomTo: aSetOfPovs
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2011217 - ArcManipulation.st ***
 --------------------- 2011/2/17 - 17:1:23 --------------------- 
Small corrections:
  - Tool #initializeCreateEntityTool
  - CreateInstances #changeEntity to display the entity figure in the interface
  - ArcEntity #startNodeType & #stopNodeType
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2011217 - 155521.st ***
 --------------------- 2011/2/18 - 8:53:23 --------------------- 
Improvement of CreateIntances: A Click on [+] button of spaceInterface will open the CreateInstanceInterface.
   By default, the number of instances to create is not limited (number= a character different from number)
	
  - Tool #initializeCreateEntityTool
  - CreateInstances #isNbEntitiesToCreatePositive; #numberEntitiesToCreate ; ...
  - SpaceInterface: organization of tool hotdraw; #createInstancesController:
  - creation of some traduction messages (file all.lbl)
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2011217 - createInstances.st ***
 --------------------- 2011/2/28 - 3:30:6 --------------------- 
Manipulation interface (***  Nicolas B√©cu ***).
Some very few modifications
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2011218 - nico.st ***
 --------------------- 2011/3/3 - 20:16:40 --------------------- 
Activity diagrams are saved via compiled methods. A new method (#bidon for ex) is created as instance method of the Agent, and an activity method (#activity_bidon for ex) is created at the class level of the agent.
Main work in ActivityDiagramEditor.

bug correction on #stepSynchronouslyCA:
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2011228 - activityDiag_OK.st ***
 --------------------- 2011/3/4 - 5:32:54 --------------------- 

 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.activityDiag_OK.st ***
 --------------------- 2011/3/4 - 8:13:6 --------------------- 
Integrating Nico"s modifications for the manipulation tool (not finalized).
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.201134 - IntegratingNB.st ***
 --------------------- 2011/3/15 - 21:8:2 --------------------- 
Small changes:
 - initializeInspectTool
 - setText for the figures
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.201134 - 8136.st ***
 --------------------- 2011/3/23 - 15:34:5 --------------------- 
Options on ChartInterface : 
	display markers, auto scale Y axis & display legend.
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2011315 -chartInterfaceOption.st ***
 --------------------- 2011/3/24 - 4:10:21 --------------------- 
POV are saved as class method into #pov symbol category. Is compatible with .ev files
 *** Developer: Nicolas B√©cu ***
 *** kernel FileName: Kernel-v.2011323 - povSymbol.st ***
 --------------------- 2011/4/1 - 5:37:53 --------------------- 

 *** Developer: Pierre + Nicolas + CLP ***
 *** kernel FileName: Kernel-v.2011324 - collective.st ***
 --------------------- 2011/4/1 - 6:32:16 --------------------- 
 reviseSystemSilently when new classes are created
 *** Developer: Pierre + Nicolas + CLP ***
 *** kernel FileName: Kernel-v.201141-collective.st ***
 --------------------- 2011/4/1 - 8:3:16 --------------------- 
Version without French
 *** Developer: Pierre + Nicolas + CLP ***
 *** kernel FileName: Kernel-v.201141 without French.st ***
 --------------------- 2011/4/2 - 13:36:34 --------------------- 
- First version compatible with VW 7.7.
- Cormas automatically opened at starting (after parcels loading). See Cormas #postLoadActions.
- Only 1 Cormas item in VisualLauncher menu.
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.201141 - vw7.7.st ***
 --------------------- 2011/4/6 - 16:38:46 --------------------- 
 - The "+" tool to add manualy new agents on the grid has been improved : "any kind" works...   Manipulate is more direct now (click and move directly), shift to move several entities.

 - The install procedure ends on Comas interface and proposes to save the image after having clean-up all the install windows.

 - With WV7.7, a new bug: PovSetterNotebook bugs... Into Cormas #openPovSetterGUI, on  PovSetterNotebook new openOn: self currentModel... to be solved...  :(
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.201141 - vw7.7 bis.st ***
 --------------------- 2011/4/7 - 20:26:21 --------------------- 
- Displaying aggregates delimitors do not remove anymore the cell figures.
- Manipulation of entities on the grid: select and move directly
 *** Developer: Pierre Bommel + Nicolas Becu ***
 *** kernel FileName: Kernel-v.201146 - delimitor.st ***
 --------------------- 2011/4/17 - 6:48:40 --------------------- 
- ZoomInterface is more precise.
- SpaceInterface opens respecting the spaceModel dimensions
- Parcel can be saved with overrides !
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.201147 - zoomInterface.st ***
 --------------------- 2011/4/17 - 6:48:40 --------------------- 

 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.201147 - zoomInterface.st ***
 *** VW compatibility: 7.6 ***
 --------------------- 2011/4/17 - 16:28:25 --------------------- 
- Debug: #saveImage at the end of installation with the right filename
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2011417 - saveImage.st ***
 *** VW compatibility: 7.6 ***
 --------------------- 2011/4/18 - 5:53:3 --------------------- 
Key shortcuts for inspect and manipulate spaceInterface tools
Multiple select of entities with manipulate tool

 *** Developer: Pierre Bommel + Nicolas Becu ***
 *** kernel FileName: Kernel-v.2011417 - 162825.st ***
 *** VW compatibility: 7.6 ***
 --------------------- 2011/6/23 - 8:37:47 --------------------- 
mise en commun NB + PB
 *** Developer: Pierre Bommel + Nicolas Becu ***
 *** kernel FileName: Kernel-v.2011-06-23.st ***
 *** VW compatibility: 7.6 ***
 --------------------- 2011/7/11 - 2:24:38 --------------------- 
- New way of setting the attribut accessors
- Analysis table (not finished)
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2011623 - 83747.st ***
 *** VW compatibility: 7.6 ***
 --------------------- 2011/9/3 - 15:32:16 --------------------- 
New default attribut setter.
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2011711 - 22438.st ***
 *** VW compatibility: 7.6 ***
 --------------------- 2011/9/4 - 17:55:8 --------------------- 
New grid to add attributes and default values.
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.201193 - 153216.st ***
 *** VW compatibility: 7.6 ***
 --------------------- 2011/9/5 - 16:25:36 --------------------- 
minor corrections
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.201194 - 17558.st ***
 *** VW compatibility: 7.6 ***
 --------------------- 2011/9/14 - 1:57:10 --------------------- 
Add, Remove and Rename attributes (and accessors) from the Edition Attribute Interface.
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.201195 - 162536.st ***
 *** VW compatibility: 7.6 ***
 --------------------- 2011/9/18 - 10:47:32 --------------------- 
- Add menu of Entities: 
	- for changing abstract / concret class
	- for edition of Class Diagram
- remove from the ScenarioBuilderInterface the probes for the abstract classes
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2011914 - 15710.st ***
 *** VW compatibility: 7.6 ***
 --------------------- 2011/10/26 - 18:26:14 --------------------- 
Some adaptations for Mac
 *** Developer: Pierre Bommel ***
 *** kernel FileName: 18 - 10:47:32.st ***
 *** VW compatibility: 7.6 ***
 --------------------- 2011/10/26 - 18:48:42 --------------------- 
 postLoadActions for Mac
 *** Developer: Pierre Bommel ***
 *** kernel FileName: 26 - 18:26:14.st ***
 *** VW compatibility: 7.6 ***
 --------------------- 2011/11/7 - 16:16:58 --------------------- 
* DefaultAttributesSetter: 2 types of default values of the parameters:
 - the InitialValues that are set at the initialisation of a simulation
 - the DefaultValues that are predefined in the model.
* small fixes: 
 - open RB of CormasModel on firts method of #init or #control.
 - resize the spaceGrid window when proportions (X & Y) have changed
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.20111026 - 184842.st ***
 *** VW compatibility: 7.6 ***
 --------------------- 2011/11/16 - 18:45:9 --------------------- 
Fix a bug for DefaultValue of an attribute in the case of a Dictionary
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2011117 - 161658.st ***
 *** VW compatibility: 7.6 ***
 --------------------- 2011/11/21 - 4:28:29 --------------------- 
Modifications on DefaultAttributesSetter (and AttributeAdder, ClassAttributeValue) for Symbol and String, but also for Array (because in VW7.6, #(1 2 3) is an immutable Array...).
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.20111116 - 18459.st ***
 *** VW compatibility: 7.6 ***
 --------------------- 2011/11/21 - 12:33:45 --------------------- 
Fix the update Cormas
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.20111121 - 42829.st ***
 *** VW compatibility: 7.6 ***
 --------------------- 2011/12/1 - 6:8:42 --------------------- 
New class: ParameterInterface, that displays the parameters of the model and allows to custome the interface by hidding some of them (menu Settings). These settings can be saved for future interfaces (recompile the #hiddenAttributes into CormasModel)
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.20111201.st ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012/3/20 - 9:14:10 --------------------- 
Small bug fix on Sensitivity Analysis
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2011121 - 6842.st ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012/4/2 - 10:29:59 --------------------- 
Sensitivity Analysis can be saved using Excel
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2012320 - 91410.st ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012/4/5 - 5:21:47 --------------------- 
update of protocols name and renaming of methods
 *** Developer: Le Page & Becu ***
 *** kernel FileName: Kernel-v.201242 - 102959.st ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012/4/6 - 3:4:30 --------------------- 

 *** Developer: Le Page & Becu ***
 *** kernel FileName: Kernel-v.201245 - 52147.st ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012/4/6 - 6:55:43 --------------------- 
Sensitivity Analysis is OK: works for CSV and Excel savings, and for OAT and Crossed analysis
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.201246 - 3430.st ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012/4/11 - 5:44:33 --------------------- 

 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2012-04-11.st ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012/4/11 - 10:53:18 --------------------- 
Renaming of protocols and methods in the Cormas and CormasModel classes
New methods for population metrics
 *** Developer: Nicolas Becu ***
 *** kernel FileName: Kernel-v.2012411 - 54433.st ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012/4/11 - 20:21:7 --------------------- 
Debug of VW crash that occured when manipulating big grid of cells.
(SpaceView -> addAllSpatialEntities & changePov:)
 *** Developer: Nicolas Becu ***
 *** kernel FileName: Kernel-v.2012.04.12.st ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012/4/12 - 8:12:49 --------------------- 
Renaming protocols and metods in the Cormas class
new methods in the utilities - string protocol of the Cormas class

 *** Developer: Nicolas Becu ***
 *** kernel FileName: Kernel-v.2012411 - 20217.st ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012/4/13 - 16:2:25 --------------------- 
Renaming protocols and methods in the Cormas class
 *** Developer: Nicolas Becu ***
 *** kernel FileName: Kernel-v.2012412 - 81249.st ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012/4/21 - 19:12:25 --------------------- 
Editor of attributes and of activity diagram for CormasModel.
New icons for Programming menu + edit attributes and activity diagram for CormasModel.
Direct access to PoV setter from class menu (in Entities window).
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2012413 - 16225.st ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012/4/30 - 8:26:33 --------------------- 

With Clp adds

* Comments on Entity classes
* Glossary in Cormas "?" menu 
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2012421 - 191225.st ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012.4.30 - 14:24:25 --------------------- 
Activity Diagrams for CormasModel
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2012.4.30 - 8:26:33 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012.4.30 - 14:26:56 --------------------- 
Activity Diagrams for CormasModel
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2012.4.30 - 8:26:33 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012.4.30 - 21:29:17 --------------------- 
New protocols for Entities: @ (manipulable methods), + (publics) and - (privates).
Minor changes: setSurround of aggregates, entitiesListing, Figure (comments of methods, deletionUpdateFrom)
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2012.4.30 - 14:36:15 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012.5.2 - 5:1:11 --------------------- 
* modifs to collect "info" et "pov" methods used in  graphical user interfaces (the corresponding protocols have been renamed "* pov" and "* info"
* minor changes in Cormas glossary
  - arguments in dark pink;
  - redondent Entity subclasses (GroupComm AgentCommLocation GroupCommLocation et GroupLocation ) not considered
 *** Developer: clp ***
 *** kernel FileName: Kernel-v.2012.4.30 - 21:29:17 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012.5.2 - 8:55:3 --------------------- 
bug fix on notify observers when changed
modification of add on manager help 
 *** Developer: nb ***
 *** kernel FileName: Kernel-v.2012.5.2 - 5:1:11 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012.5.3 - 8:28:44 --------------------- 
new way to create classes for the entities of the model: 
- use the "+" buttons to add classes inheriting from Cormas generic entities
- use the contextual menu ("specialize") directly on the list of model"s entities to add a class inheriting from an existing model"s class 
 *** Developer: clp ***
 *** kernel FileName: Kernel-v.2012.5.2 - 8:55:3 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012.5.4 - 19:54:39 --------------------- 
 - New way to create classes (CLP).
 - Bug fix for TrackFigure
 - Bug fix for Activity deletion
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2012.5.3 - 8:28:44 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012.5.6 - 12:8:14 --------------------- 
Let the user set some comments on his model"s version.
Automatic glossary for Model.
Some new menus on Cormas interface.
UpdateCormas with choices.
Creation of Entity with remarque for Specialization.
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2012.5.4 - 19:54:39 ***
 *** VW compatibility: 7.6 *** 
 --------------------- 2012.5.6 - 20:24:36 ---------------------

 --------------------- 2012.5.6 - 20:29:40 --------------------- 
Add Network components to PassiveEntity creation (EntityAdditionInterface)
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2012.5.6 - 20:24:36 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012.5.8 - 14:37:23 --------------------- 
Small stuff on AttributeAdder
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2012.5.6 - 20:29:40 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012.5.12 - 21:1:2 --------------------- 
- Bug fix for ImageEditor
- Remove POV menu for not situated classes
- defaultCOlor as a fonction of the class name
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2012.5.8 - 14:37:23 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012.5.14 - 20:27:35 --------------------- 
PoVSetter: 
   - "palette" now compatible with Mac
   - background color according to entity type
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2012.5.12 - 21:1:2 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012.6.5 - 19:54:23 --------------------- 
Bug fix for Aggregate swelling.
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2012.5.14 - 20:27:35 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012.6.9 - 7:48:38 --------------------- 

 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2012.6.5 - 19:54:23 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012.6.11 - 20:39:18 --------------------- 
test new activityEditor
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2012.6.9 - 7:48:38 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012.6.12 - 11:38:45 --------------------- 
New Activity Diagram Editor with new ActivityFigure and DiamondFigure, and new way to select the activities.
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2012.6.11 - 20:39:18 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012.6.12 - 22:10:16 --------------------- 
Activity diagram compatibility with previous version.
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2012.6.12 - 11:38:45 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012.6.13 - 11:2:30 --------------------- 
add Dictionary #elementsEqual from COM into Cormas (for Mac compatibility)
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2012.6.12 - 22:10:16 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012.8.13 - 13:41:2 --------------------- 
Activity diagram editor: display control methods without argument
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2012.6.13 - 11:2:30 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012.8.13 - 17:58:53 --------------------- 
manipulation: add #allMethodsButProtocols:  #allMethodsBut:  to be compatible with protocols stating with #* ... and #+ ...
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2012.8.13 - 13:41:2 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012.8.20 - 11:28:28 --------------------- 
Few corrections of the PoVSetters
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2012.8.13 - 17:58:53 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012.8.20 - 13:39:59 --------------------- 
BitMap library compatible with Mac OS.
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2012.8.20 - 11:28:28 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012.8.21 - 8:58:18 --------------------- 
updateCormas that reopens the Cormas main window
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2012.8.20 - 13:39:59 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012.8.23 - 12:53:54 --------------------- 
Probes with predefined colors, that can be modified (and saved). New class: MultiColorChooser
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2012.8.21 - 8:58:18 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012.8.25 - 15:48:11 --------------------- 
 - User can now choose the color of the curves displayed by ChartsInterface. Colors are saved at CormasModel class level.
 - Contextual menu on the grid with PoV and Track (you can change the PoV of one entity, and track only this entity)
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2012.8.23 - 12:53:54 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012.8.28 - 10:9:38 --------------------- 
Small stuff on SensitivityAnalysis for Mac interfaces
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2012.8.25 - 15:48:11 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012.9.1 - 12:27:59 --------------------- 
 - New Sensitivity analysis to sort the parameters (Global sensitivity). New class: ClassifyParameter.
Analysis is runned in 2 sessions: Standard runs + Modified runs, then calculates sensitivity formula.
 - Removing an activity diagram
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2012.8.28 - 10:9:38 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012.9.5 - 13:18:25 --------------------- 
 - ClassifyParameter and ExcelSheet modifications
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2012.9.1 - 12:27:59 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012.9.13 - 14:34:43 --------------------- 
Cormas randomFloatFrom:to: & Cormas randomIntegerFrom:to:
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2012.9.5 - 13:18:25 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012.9.20 - 9:2:13 --------------------- 
Possibility to create random value as default value of an attribute
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2012.9.13 - 14:34:43 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012.9.20 - 13:35:18 --------------------- 
Can choose between SpatialEntityElement or SpatialEntityCell when creating a cell class.
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2012.9.20 - 9:2:13 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012.9.21 - 9:33:32 --------------------- 

 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2012.9.20 - 13:35:18 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012.9.23 - 16:12:48 --------------------- 
Bugs fixes
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2012.9.21 - 9:33:32 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012.9.26 - 15:14:3 --------------------- 

 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2012.9.23 - 16:12:48 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012.9.26 - 15:38:50 --------------------- 
AttributeAdder: Can change a default value (from the setter), just by entering the new value (and save) 
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2012.9.26 - 15:14:3 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012.9.27 - 9:47:0 --------------------- 

 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2012.9.26 - 15:38:50 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012.11.24 - 10:38:16 --------------------- 
DefaultAttributesSetter -> transformAsString ok for Array
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2012.9.27 - 9:47:0 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012.12.4 - 3:17:5 --------------------- 
ChartsInterface with possibility to change and save the color of the local probes. (+ Entity class-colorOfVectorialPOV)
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2012.11.24 - 10:38:16 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012.12.11 - 4:40:44 --------------------- 
Debug DiagramChooser.
AgentLocation -> #randomWalk: radius and #randomJump
SpatialEntity -> #grid and #connexity (connexity in SpaceModel)
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2012.12.4 - 3:17:5 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2013.2.16 - 12:38:55 --------------------- 
AgentLocation --> randomJump
Activity diagram opens independently of the running diagram
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2012.12.11 - 4:40:44 ***
 *** VW compatibility: 7.6 ***
bug correction on adding and removing symbols in the pov setter interface
 --------------------- 2013.2.17 - 10:48:55 --------------------- 

 *** Developer: Nicolas Becu ***
 *** kernel FileName: Kernel-v.2013.2.16 - 12:38:55 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2013.2.19 - 4:38:52 --------------------- 
bug correction
-ne bug plus si on change le notify when changed alors qu"on a pas encore appliqu√© les valeurs par d√©faut (--> accepte directement la valeur par d√©faut au moment o√π l"on ferme la fenetre de cr√©ation d"une valeur par d√©faut)
-erreur dans le wayTo corrig√© 
-syntaxe des exemples dans les createEntities
-v√©rification que la m√©thode existe dans les methodes ask toDo
-n"affiche plus les accesseur dans les m√©thode de manipulation depuis l"interface spatiale

 *** Developer: Nicolas Becu ***
 *** kernel FileName: Kernel-v.2013.2.17 - 10:48:55 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2013.2.20 - 16:14:41 --------------------- 
minor bug fixes
add an option in the pov setter to directly create a povMethod for a specific attribute
 *** Developer: Nicolas Becu ***
 *** kernel FileName: Kernel-v.2013.2.19 - 4:38:52 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2013.2.20 - 16:31:49 --------------------- 

 *** Developer: Nicolas Becu ***
 *** kernel FileName: Kernel-v.2013.2.20 - 16:14:41 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2013.2.25 - 17:23:28 --------------------- 
This version implements the Habitus module for configuring the way a user can view, manipulate and act on entities

The version also includes a new EntityInspector that enables to see all the values of an instances at a glance. The EntityInspector is linked to a Histogram chart interface and enables to view a population distribution for any numeric or symbolic attribute
 *** Developer: Nicolas Becu ***
 *** kernel FileName: Kernel-v.2013.2.20 - 16:31:49 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2013.3.1 - 8:2:56 --------------------- 

 *** Developer: Nicolas Becu ***
 *** kernel FileName: Kernel-v.2013.2.25 - 17:23:28 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2013.3.1 - 8:48:33 --------------------- 
ScenarioBuilder - Select a init and step method automatically if only one choice exists
changePov:ofEntity:   Optimization ->  changed from "values do:[ "  to  "do:["
changePov:ofEntity:   Optimization ->  changed from "values do:[ "  to  "do:["
createSpatialGrid now returns the new spaceInterface created
 *** Developer: Nicolas Becu ***
 *** kernel FileName: Kernel-v.2013.3.1 - 8:2:56 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2013.3.2 - 0:6:3 --------------------- 

 *** Developer: Nicolas Becu ***
 *** kernel FileName: Kernel-v.2013.3.1 - 8:48:33 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2013.3.22 - 10:1:16 --------------------- 
Optimization of memory allocation of VisualWorks VM
- no more growMemory request dynamically in the addAllSpatialEntities when loading a Cormas environment
- setting of the memory allocation of VW settings directly during Cormas parcel installation. objectMemory settings used :
	growthRegime 128 000 000 (instead of 32 000 000 as default)
	ObjectMemory sizesAtStartup:  #(3.0 15.0 1.0 1.0 1.0 20.0 1.0)   instead of  #(1.0 1.0 1.0 1.0 1.0 1.0 1.0)  as default 

Performance of Cormas mixt: method
Gives directly the size of the new OrderedCollection when created so that it doesn"t need to grow several times during the proceess of adding items to it
-> collTemp1 := OrderedCollection new: aCollec size.

Adds an option to have only one Refactroing Browser used to browse entities and cormasModel init and step.
When the user edits another entity, it focuses the already opened Browser on that entity insteald of opening a second one.
the user can change this setting in the Cormas Tools Menu  
 *** Developer: Nicolas Becu and Jean Fran√ßois Lefevre ***
 *** kernel FileName: Kernel-v.2013.3.2 - 0:6:3 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2013.3.22 - 11:24:43 --------------------- 
Updated settings of ObjectMemory found after several tests on opening large envrironments and running simulations. The best option found is 
ObjectMemory sizesAtStartup:  #(10.0 10.0 1.0 1.0 1.0 10.0 1.0).
 *** Developer: Nicolas Becu ***
 *** kernel FileName: Kernel-v.2013.3.22 - 10:1:16 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2013.3.29 - 7:39:34 --------------------- 
correction of a bug appearing in the entity inspector when an atribute"s value is an instance to an object which ios not a cormas entity
correction of a bug appearing when requesting the graph of an attribute which has a nil value or non plotable value
adds by default a control protocol for any new entity created
focus the refactoring browser on the control protocol when it is first open so that the user does"nt see the class definition when editing a class, but instead a method canevas

 *** Developer: Nicolas Becu ***
 *** kernel FileName: Kernel-v.2013.3.22 - 11:24:43 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2013.4.13 - 4:0:28 --------------------- 
bug fix when opening a chart on a specific entity when using the Habitus module
correction of the syntax of examples given the ask:toDo: methods
addition of ask: aClass select: aBlockCondition toDo: aSymbol  methods in the +control protocol
bug fix on the canBeMoved option of an Entity in the Habitus module
adding the method recursiveNeighbourhood: range verifying: aBlock which has disappeared 
 *** Developer: Nicolas Becu ***
 *** kernel FileName: Kernel-v.2013.3.29 - 7:39:34 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2013.4.13 - 4:5:41 --------------------- 
- Removing the use of inheritsFrom: and replacing them by tests on the class (isMoveable isSituated isSituatedClass isSpatialClass)
- Having the CreateInstances window openned and linked properly to a spaceInterface. The spaceInterface now inform of its changes (eg self changed: #windowClosed) and the objects registered to the spaceInterace (such has a createInstances window) receive those notifications
- Adding in the spaceInterface some access methods to the various properties of cormasModel in order to encapsulate the capabilities of the spaceInterface (eg classFromSymbol timeName timeUnitName)
- Adding in the spaceModel some access methods to the various properties of cormasModel in order to encapsulate the capabilities of the spaceModel (eg  timeStep timeUnitName)
- Adding the method envSpecStringFor: in the spaceModel to compute all the title of the window in one method (in ordre to limit the messages between the spaceInterface and the spaceModel)
- changing the way the timeChanged message is propagated to the different objects that needs to update. It now uses -> self changed: #timeChanged (see as well  the initialze method of cormasModel). The spaceModel propages the timeChanged message to its dependents.  -> The cormasModel is some kind of model for the spaceModel (receive notification).
- Change the initialization of a spaceInterface (setSpaceModel: aModel)
-Adding a ClientSpaceModel class which redirect some messages to the remoteSpaceModel (cellClass timeStep absoluteBounds envSpecStringFor: timeUnitName gridCellShape
 *** Developer: Jean Fran√ßois Lefevre ***
 *** kernel FileName: Kernel-v.2013.4.13 - 4:0:28 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2013.4.14 - 14:58:3 --------------------- 
- new functionality to define a local probe that refers to a global probe. To do so, the local probe method has to return a symbol of the name of the global probe it refers to. The global probe has to be activated in order for the local probe to work (otherwise it returns a 0 value)
 *** Developer: Nicolas Becu ***
 *** kernel FileName: Kernel-v.2013.4.13 - 4:5:41 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2013.5.9 - 7:26:51 --------------------- 

 *** Developer: Nicolas Becu ***
 *** kernel FileName: Kernel-v.2013.4.14 - 14:58:3 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2013.5.27 - 16:5:20 --------------------- 

 *** Developer: Nicolas Becu ***
 *** kernel FileName: Kernel-v.2013.5.9 - 7:26:51 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2013.6.17 - 2:54:36 --------------------- 

 *** Developer: Nicolas Becu ***
 *** kernel FileName: Kernel-v.2013.5.27 - 16:5:20 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2013.6.17 - 2:56:17 --------------------- 

 *** Developer: Nicolas Becu ***
 *** kernel FileName: Kernel-v.2013.6.17 - 2:54:36 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2013.6.20 - 12:35:12 --------------------- 
Debug of Opentalk remarshaling for passModel by name
Implentation of a EntityReference transport mode between spaceModel and its remoteSpaceInterfaces to reduce the messages from client to server
Adding a createEntityPovFromSpec: aEntityPOVSpec class method so that entityPovs for clients can be created on the client side using that class method
 *** Developer: Nicolas Becu + Jean-Fran√ßois Lefevre ***
 *** kernel FileName: Kernel-v.2013.6.17 - 2:56:17 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2013.6.25 - 3:11:55 --------------------- 

 *** Developer: Nicolas Becu + Jean-Fran√ßois Lefevre ***
 *** kernel FileName: Kernel-v.2013.6.20 - 12:35:12 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2013.6.25 - 3:31:19 --------------------- 

 *** Developer: Nicolas Becu + Jean-Fran√ßois Lefevre ***
 *** kernel FileName: Kernel-v.2013.6.25 - 3:11:55 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2013.6.25 - 3:43:28 --------------------- 

 *** Developer: Nicolas Becu + Jean-Fran√ßois Lefevre ***
 *** kernel FileName: Kernel-v.2013.6.25 - 3:31:19 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2013.6.26 - 13:52:28 --------------------- 

 *** Developer: Nicolas Becu ***
 *** kernel FileName: Kernel-v.2013.6.25 - 3:43:28 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2013.7.1 - 5:10:40 --------------------- 

 *** Developer: Nicolas Becu ***
 *** kernel FileName: Kernel-v.2013.6.26 - 13:52:28 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2013.7.2 - 5:31:34 --------------------- 

 *** Developer: Nicolas Becu ***
 *** kernel FileName: Kernel-v.2013.7.1 - 5:10:40 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2013.7.2 - 15:34:44 --------------------- 

 *** Developer: Nicolas Becu ***
 *** kernel FileName: Kernel-v.2013.7.2 - 5:31:34 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2013.7.2 - 16:8:6 --------------------- 

 *** Developer: Nicolas Becu ***
 *** kernel FileName: Kernel-v.2013.7.2 - 15:34:44 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2013.7.9 - 2:0:16 --------------------- 

 *** Developer: Nicolas Becu ***
 *** kernel FileName: Kernel-v.2013.7.2 - 16:8:6 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2013.7.25 - 6:11:15 --------------------- 

 *** Developer: Nicolas Becu ***
 *** kernel FileName: Kernel-v.2013.7.9 - 2:0:16 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2013.10.18 - 3:22:7 --------------------- 
Activity Diagram editor debuging after Distribution module integration
Zoom debuging after Distribution module integration
Arc-Node entities debuging after Distribution module integration
 *** Developer: Nicolas Becu ***
 *** kernel FileName: Kernel-v.2013.7.25 - 6:11:15 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2013.11.4 - 11:52:58 --------------------- 

 *** Developer: Nicolas Becu ***
 *** kernel FileName: Kernel-v.2013.10.18 - 3:22:7 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2013.11.6 - 13:55:58 --------------------- 

 *** Developer: Nicolas Becu ***
 *** kernel FileName: Kernel-v.2013.11.4 - 11:52:58 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2013.11.6 - 13:56:17 --------------------- 

 *** Developer: Nicolas Becu ***
 *** kernel FileName: Kernel-v.2013.11.6 - 13:55:58 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2013.11.27 - 23:47:33 --------------------- 
Integration of a Cormas packager module
- File/Package model saves an executable image (exe file) for the current opened model only
- ?/Package Cormas saves  an executable image (exe file) for Cormas
 *** Developer: Nicolas Becu ***
 *** kernel FileName: Kernel-v.2013.11.6 - 13:56:17 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2013.12.8 - 13:38:7 --------------------- 
Bug fix for cormas primitives access on contextual menu of the BrowserCodeTool

 *** Developer: Nicolas Becu ***
 *** kernel FileName: Kernel-v.2013.11.27 - 23:47:33 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2013.12.16 - 14:7:27 --------------------- 
From the Version of N. B√©cu and J.F. Lefevre, add all the modifications made by P.Bommel. Mainly:
 - ClassAttributeValue, ParameterInterface, DefaultAttributeSetter
 - ChartsInterface
 *** Developer: Nicolas Becu ***
 *** kernel FileName: Kernel-v.2013.12.8 - 13:38:7 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2013.12.16 - 18:35:24 --------------------- 

 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2013.12.16 - 14:7:27 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2013.12.16 - 18:49:6 --------------------- 
Cormas closeDialog => more simple: Save then Exit - Just Exit - Cancel
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2013.12.16 - 18:35:24 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2014.2.28 - 15:20:51 --------------------- 
Int√®gre le patch de NB (Delay changes:  false by default)
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2013.12.16 - 18:49:6 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2014.4.3 - 14:18:43 --------------------- 
CormasModel: removeMultipleChanges (for optimization).
EntityPOV: calculateNewPositionOnPatchBounds (for real random position of an agent on a cell).
Does not yet includes the optim_20140316.st from Jean-Fran√ßois.
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2014.2.28 - 15:20:51 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2014.4.4 - 18:40:58 --------------------- 
- Includes the optimizations from JF. Lefevre.
- Real random position of the agent"s figures on the cell
- distortable (or not) vectorial figures
- The agents" figures can be displayed on the border of the cell (position = #border_topRight, ...)
- unregisterEntityReferences on SpaceView
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2014.4.3 - 14:18:43 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2014.4.6 - 18:29:49 --------------------- 
- NewLibrary of Vectorial Figures.
- VectorialPOVEditor has been improved, with sliders
- 2 buttons to magnify or Shrunk the bitmapFigure (instead of the size slider)
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2014.4.4 - 18:40:58 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2014.4.18 - 1:26:15 --------------------- 
Backward steping option, using BOSS.
Clean up the SimManager class.
Integration of the SimWindow into Cormas Interface.
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2014.4.6 - 18:29:49 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2014.4.21 - 23:3:6 --------------------- 
Stabilized version with backward and forward replays.
SimManager has been completly modified.
Distribution must be checked.
The Undo/Redo on the spaceInterface are still missing (very soon...)
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2014.4.18 - 1:26:15 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2014.4.22 - 19:38:42 --------------------- 
Some debugs: CormasModel: do not save attributes type UiBuilder (specific interface of a model)
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2014.4.21 - 23:3:6 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2014.4.24 - 16:4:23 --------------------- 
Version for official release Cormas2014 (1).
Backward & Forward replay are OK.
Run backward & forward as threads.
Analysis as thread.
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2014.4.22 - 19:38:42 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2014.4.24 - 16:39:30 --------------------- 
Cormas2014 (2)
Cormas interface background = White
Simulation buttons = opaque
FinalStep changed by user (change #run button)
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2014.4.24 - 16:4:23 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2014.5.13 - 9:40:33 --------------------- 
- Opentalk as prerequisite (+ patch NB & JFR)
- SpaceInterface with Undo/Redo butons
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2014.4.24 - 16:39:30 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2014.5.14 - 5:58:56 --------------------- 
3 processes in SimManager (instead of 1): processRun, processReplayForward and processReplayBackward
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2014.5.13 - 9:40:33 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2014.5.14 - 10:11:0 --------------------- 
Recuperate VectorialImageLibrary.
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2014.5.14 - 5:58:56 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2014.5.16 - 4:40:27 --------------------- 

 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2014.5.14 - 10:11:0 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2014.6.12 - 20:22:15 --------------------- 
some work on Networks.
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2014.5.16 - 4:40:27 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2014.6.21 -  --------------------- 

 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2014.6.12 - 202215.st ***
 *** VW compatibility: 7.6 ***
 --------------------- 2014.6.22 -  --------------------- 
- Position of occupants
- debug zoom
- add all work of Nico (SpaceInterfaceConfig)
- merging cells
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2014.6.21 -  ***
 *** VW compatibility: 7.6 ***
 --------------------- 2014.6.23 -  --------------------- 
- SpaceView: setBackgroundColor -> OK
- PovSetter: tailleSlider set to 100% when Apply
- SpaceInterface menu, display -> Bidon suppressed (Still need to fix the delimitor size of the Spatial ENtities)
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2014.6.22 -  ***
 *** VW compatibility: 7.6 ***'
]

{ #category : #'+ utilities - files' }
Cormas class >> videoPath: aModelClassName [
	" Answer a <FileReference> corresponding to the path of the current model 'dump' directory.
	aModelClassName = <String>"

	^ self application videoPath: aModelClassName

]

{ #category : #'util_window' }
Cormas class >> visualLauncherWindow [
	"return the actual VisualLauncher window if exists. Return one of them if multiple windows exists.
	return nil if no VisualLauncher is actually open.
	This method is inspired from ApplicationModel class>>raiseSingleInstance
	Cormas visualLauncherWindow
	"
	
	Screen default
		allScheduledWindowsDo:
			[:each | (each model isKindOf: VisualLauncher) ifTrue: [^each]].
	^nil
]

{ #category : #'interface specs' }
Cormas class >> windowSpec [
	"Tools.UIPainter new openOnClass: self andSelector: #windowSpec"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#properties: #(PropertyListDictionary #sizeType #specifiedSize #positionType #specifiedPosition #openType #advanced) 
			#label: 'CORMAS' 
			#min: #(Point 406 80) 
			#max: #(Point 406 208) 
			#bounds: #(Rectangle 720 450 1126 530) 
			#flags: 4 
			#menu: #menuHolder 
			#colors: #(LookPreferences 
				#setForegroundColor: nil 
				#setBackgroundColor: #(ColorValue #white) 
				#setSelectionForegroundColor: nil 
				#setSelectionBackgroundColor: nil) 
			#isEventDriven: true) 
		#component: #(SpecCollection 
			#collection: #(#(LabelSpec 
				#layout: #(Point 9 3) 
				#name: #Label1 
				#label: 'ModelName:') #(LabelSpec 
				#layout: #(Point 10 28) 
				#name: #Label2 
				#label: 'Version : ' 
				#style: #small) #(InputFieldSpec 
				#layout: #(Rectangle 80 4 235 25) 
				#flags: 0 
				#model: #modelNameField 
				#tabable: false 
				#isReadOnly: true) #(InputFieldSpec 
				#layout: #(Rectangle 80 27 235 49) 
				#flags: 0 
				#model: #versionField 
				#tabable: false 
				#style: #pixelDefault 
				#isReadOnly: true) #(SubCanvasSpec 
				#layout: #(Rectangle -2 59 407 168) 
				#name: #subcanvasSim 
				#flags: 24 
				#majorKey: Cormas 
				#minorKey: #simulationWindow 
				#clientKey: #subcanvasSim) #(InputFieldSpec 
				#layout: #(Rectangle 237 0.5 403 25.0) 
				#name: #simNameInputField 
				#flags: 0 
				#model: #simName 
				#tabable: false 
				#style: #pixelDefault 
				#isReadOnly: true) #(InputFieldSpec 
				#layout: #(Rectangle 237 28 403 49) 
				#name: #simNumInputField 
				#flags: 0 
				#model: #simNum 
				#tabable: false 
				#style: #pixelDefault 
				#isReadOnly: true))))
]

{ #category : #'interface specs' }
Cormas class >> windowSpec_old [
	"UIPainter new openOnClass: self andSelector: #windowSpec_old"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#label: 'CORMAS' 
			#min: #(Point 394 423) 
			#max: #(Point 394 423) 
			#bounds: #(Rectangle 512 345 906 768) 
			#flags: 4 
			#menu: #mainMenu_old 
			#colors: #(LookPreferences 
				#setBackgroundColor: #(ColorValue #white)) 
			#isEventDriven: true) 
		#component: #(SpecCollection 
			#collection: #(#(SequenceViewSpec 
				#layout: #(Rectangle 139 56 256 147) 
				#model: #listSocialEntities 
				#callbacksSpec: #(UIEventCallbackSubSpec 
					#doubleClickSelector: #modifySocialEntityClass) 
				#menu: #socialEntityMenu 
				#style: #pixelLarge) #(LabelSpec 
				#layout: #(Point 166 33) 
				#label: #(UserMessage 
					#key: #sociales 
					#defaultString: 'sociales!!!') 
				#style: #pixelLarge) #(GroupBoxSpec 
				#layout: #(Rectangle 4 3 390 222) 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue #red)) 
				#label: #(UserMessage 
					#key: #modelisation 
					#defaultString: 'Modelisation!!')) #(ActionButtonSpec 
				#layout: #(Rectangle 132 363 220 386) 
				#name: #run 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue #black) 
					#setBackgroundColor: #(ColorValue 6553 6553 6553)) 
				#model: #run 
				#label: #(UserMessage 
					#key: #launch 
					#defaultString: 'Lancer!!!') 
				#isDefault: false 
				#defaultable: true) #(InputFieldSpec 
				#layout: #(Rectangle 324 360 369 386) 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 6553 6553 6553)) 
				#model: #stepCounter 
				#alignment: #right 
				#isReadOnly: true 
				#type: #number 
				#formatString: '0') #(LabelSpec 
				#layout: #(Point 286 361) 
				#label: #(UserMessage 
					#key: #time 
					#defaultString: 'Current time-step')) #(ActionButtonSpec 
				#layout: #(Rectangle 115 247 155 286) 
				#model: #openSpatialGrid 
				#label: #defineSpaceIcon 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(ActionButtonSpec 
				#layout: #(Rectangle 19 178 171 203) 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue #black) 
					#setBackgroundColor: #(ColorValue 6553 6553 6553)) 
				#model: #openDefineSchedulerWin 
				#label: #(UserMessage 
					#key: #preparecontrole 
					#defaultString: 'Preparer et Controler!!!') 
				#defaultable: true) #(ActionButtonSpec 
				#layout: #(Rectangle 174 247 214 286) 
				#model: #openVisuCommunications 
				#label: #defineCommunicationIcon 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(GroupBoxSpec 
				#layout: #(Rectangle 198 154 380 214) 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue #blue)) 
				#label: #(UserMessage 
					#key: #defineobservation 
					#defaultString: ' Definir l''observation...!!!')) #(InputFieldSpec 
				#layout: #(Rectangle 221 362 267 386) 
				#model: #cycle 
				#alignment: #right 
				#type: #number 
				#formatString: '0') #(ActionButtonSpec 
				#layout: #(Rectangle 56 362 126 386) 
				#name: #stepButton 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue #black) 
					#setBackgroundColor: #(ColorValue 6553 6553 6553)) 
				#model: #runStepByStep 
				#label: #(UserMessage 
					#key: #step 
					#defaultString: 'Pas a pas') 
				#defaultable: true) #(ActionButtonSpec 
				#layout: #(Rectangle 75 324 186 352) 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue #black) 
					#setBackgroundColor: #(ColorValue 6553 6553 6553)) 
				#model: #openScenarioBuilderWin 
				#label: #(UserMessage 
					#key: #initialiser 
					#defaultString: 'Initialiser...') 
				#defaultable: true) #(GroupBoxSpec 
				#layout: #(Rectangle 10 21 383 154) 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue #blue)) 
				#label: #(UserMessage 
					#key: #defineentities 
					#defaultString: 'Definir les entites !!!')) #(ActionButtonSpec 
				#layout: #(Rectangle 233 246 271 286) 
				#model: #openCharts 
				#label: #chartsIcon 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(GroupBoxSpec 
				#layout: #(Rectangle 11 154 180 214) 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue #blue)) 
				#label: #(UserMessage 
					#key: #controletheevolution 
					#defaultString: 'Controler l''evolution!!!')) #(ActionButtonSpec 
				#layout: #(Rectangle 133 362 220 386) 
				#name: #runSimulation 
				#flags: 24 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue #black) 
					#setBackgroundColor: #(ColorValue 6553 6553 6553)) 
				#model: #runSimulation 
				#label: #(UserMessage 
					#key: #ntimes 
					#defaultString: 'Lancer N fois') 
				#defaultable: true) #(GroupBoxSpec 
				#layout: #(Rectangle 15 300 381 396) 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue #red)) 
				#label: #(UserMessage 
					#key: #cormasModel 
					#defaultString: 'Simulation')) #(MenuButtonSpec 
				#layout: #(Rectangle 212 179 366 203) 
				#model: #defineObservation 
				#menu: #defineObsMenu) #(SequenceViewSpec 
				#layout: #(Rectangle 17 56 134 147) 
				#model: #listSpatialEntities 
				#callbacksSpec: #(UIEventCallbackSubSpec 
					#doubleClickSelector: #modifySpatialEntityClass) 
				#menu: #spatialEntityMenu 
				#style: #pixelLarge) #(SequenceViewSpec 
				#layout: #(Rectangle 260 56 377 147) 
				#model: #listPassiveEntities 
				#callbacksSpec: #(UIEventCallbackSubSpec 
					#doubleClickSelector: #modifyPassiveEntityClass) 
				#menu: #passiveEntityMenu 
				#style: #pixelLarge) #(LabelSpec 
				#layout: #(Point 40 33) 
				#label: #(UserMessage 
					#key: #spatiales 
					#defaultString: 'spatiales!!!') 
				#style: #pixelLarge) #(LabelSpec 
				#layout: #(Point 282 33) 
				#label: #(UserMessage 
					#key: #passives 
					#defaultString: 'passives!!!') 
				#style: #pixelLarge) #(GroupBoxSpec 
				#layout: #(Rectangle 88 225 292 294) 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue #red)) 
				#label: 'Visualisation') #(LabelSpec 
				#layout: #(Point 247 328) 
				#name: #Label1 
				#label: 'simulation') #(InputFieldSpec 
				#layout: #(Rectangle 310 325 369 351) 
				#name: #InputField1 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 6553 6553 6553)) 
				#model: #displaySimNumber 
				#alignment: #right 
				#isReadOnly: true))))
]

{ #category : #'+ utilities - files' }
Cormas class >> xmlPath: aModelClassName [
	" Answer a <FileReference> corresponding to the path of the current model 'dump' directory.
	aModelClassName = <String>"

	^ self application xmlPath: aModelClassName

]

{ #category : #'main menu' }
Cormas >> aboutThisModel [
	
	self cormasModelClass isNil not
		ifTrue: [self cormasModelClass aboutIt]
		ifFalse: [self warn: 'Select or create a model']
]

{ #category : #'model entities' }
Cormas >> addClassFrom: aSuperClass [
	
	| aName newClass |
	self cormasModelClass isNil ifTrue: [^self alert_NewModel].
	aName := self askUserTheClassNameWithDefaultValue: aSuperClass name.
	aName isNil ifTrue: [^nil].
	newClass := self createClassNamed: aName from: aSuperClass.
	((self cormasModelClass passiveClasses includes: aSuperClass)
		or: [aSuperClass = PassiveObject or: [aSuperClass = CMObjectLocation]])
		ifTrue:
			[self cormasModelClass passiveClasses add: newClass.
			(newClass inheritsFrom: CMObjectLocation)
				ifTrue:
					[self createColorsDictClass: newClass.
					self createImageDictClass: newClass.
					self createInit: newClass].
			self listPassiveEntities list add: aName asSymbol.
			self listPassiveEntities selection: aName asSymbol.
			self modifyPassiveEntityClass].
	((self cormasModelClass socialClasses includes: aSuperClass)
		or: [self basicAgentClasses includes: aSuperClass])
		ifTrue:
			[self cormasModelClass socialClasses add: newClass.
			self
				createInit: newClass;
				createStep: newClass.
			self createColorsDictClass: newClass.
			self createImageDictClass: newClass.
			self listSocialEntities list add: aName asSymbol.
			self listSocialEntities selection: aName asSymbol.
			self modifySocialEntityClass].
	self createModelAccessors: newClass.
	(newClass inheritsFrom: CMMsg)
		ifTrue:
			[self listPassiveEntities list add: aName asSymbol.
			self listPassiveEntities selection: aName asSymbol.
			self cormasModelClass passiveClasses add: newClass.
			self modifyPassiveEntityClass]
]

{ #category : #'model entities' }
Cormas >> addNewClassType: aType inheritingFrom: aSuperclass defaultName: aString [
	
	^self addNewClassType: aType inheritingFrom: aSuperclass defaultName:
			aString initProtocol: false stepProtocol: false
]

{ #category : #'model entities' }
Cormas >> addNewClassType: aType inheritingFrom: aSuperclass defaultName: aString initProtocol: createInit stepProtocol: createStep [
	
	^self
		addNewClassType: aType
		inheritingFrom: aSuperclass
		name: (self askUserTheClassNameWithDefaultValue: aString)
		initProtocol: createInit
		stepProtocol: createStep
]

{ #category : #'model entities' }
Cormas >> addNewClassType: aType inheritingFrom: aSuperclass name: aName initProtocol: createInit stepProtocol: createStep [
	
	| newClass selectionInList selector newList |
	self cormasModelClass isNil ifTrue: [^self alert_NewModel].
	(aName isNil or: [aName isEmpty]) ifTrue: [^nil].
	newClass := self createClassNamed: aName from: aSuperclass.
	selector := ((Cormas lowerCaseString: aType) , 'Classes') asSymbol.
	(self cormasModelClass perform: selector) add: newClass.
	(newClass inheritsFrom: CMSpatialEntityElement)
		ifTrue: [self cormasModelClass cellClass: newClass].
	selectionInList := self perform: ('list' , aType , 'Entities') asSymbol.	"selectionInList list add: aName asSymbol."
	newList := self getSortedListEntityClassType: aType.
	selectionInList list: newList.
	selectionInList
		selection:
			(newList
				detect: [:s | (Cormas dropBlanksFromString: s) = aName]
				ifNone: [self halt]).
	self createModelAccessors: newClass.
	self createProtocol: #control forClass: newClass.
	createInit ifTrue: [self createInit: newClass].
	createStep ifTrue: [self createStep: newClass].	"self modifyEntityClassType: aType."
	^newClass
]

{ #category : #'main menu' }
Cormas >> addOnHowTo [
	
	| txt txtNum txtCharter |
	txtNum := '	Add-On Manager' asText emphasizeAllWith: #(#bold #large).
	txtCharter := '
A Cormas Add-on can be of the two following type
- ST - The add-on is saved in a .st file
- Parcel - The add-on is saved as a parcel with a .pcl file and .pst file. Both files are requiered.

All Cormas add-on files should be saved in the '
		, ('directory cormas\Add-ons' asText emphasizeAllWith: #(#large)) ,
			'

'
		,
			('-- How to install a Cormas add-on --' asText emphasizeAllWith: #(#large))
		,
			'
Copy the ST file or the pcl and pst files in the of the directory cormas\Add-ons.
Open the Add-On, select the desired add-on and clic ''Load''. If you want to remmember the list of add-ons you want to load each time you open Cormas, yuo can save your list with the ''floppy disk'' button. Beware: you will still have to clic on the "Load" button each time you re-open Cormas.

'
		,
			('-- How to create an add-on as a ST file --' asText emphasizeAllWith:
					#(#large)) ,
			'
1/ In a SmallTalk Browser select the methods or class that make up your add-on and save them in a ST file using - Right Clic -> fileOut -
2/ Put the file in the Add-ons directory
3/ To set the add-on meta info, do the following
- Open a VisualWorks File Browser (in the VisualWorks main window) and browse to your ST file. Now you can see and edit the content of the ST file. 
- In between the first XML tag (e.g. <?xml version="1.0"?>) and the second XML tag (e.g. <st-source>) insert the following lines (you don''t need to include them all) 
	<Add-On-Name> HERE TYPE THE NAME OF THE ADD-ON </Add-On-Name>
	<Add-On-Version> HERE TYPE THE VERSION OF THE ADD-ON </Add-On-Version>
	<Add-On-Author> HERE TYPE THE AUTHOR NAME OF THE ADD-ON </Add-On-Author>
	<Add-On-Category> HERE TYPE THE CATEGORY OF THE ADD-ON YOU WANT TO BE DISPLAYED IN THE ADD-ON MANAGER WINDOW </Add-On-Category>
	<Add-On-Description> HERE TYPE A SHORT DESCRIPTION OF THE ADD-ON </Add-On-Description>
- Save the edits you made in the ST file by - Right Clic -> accept - 


'
		,
			('-- How to create an add-on as a Parcel --' asText emphasizeAllWith:
					#(#large)) ,
			'
1/ In a SmallTalk Browser go to Package meneu and create a new packag. Gite a name.
2/ Select the methods or class that make up your add-on and drag-and-drop to your package on the left side of the SmallTalk Browser (Package View)
3/ Right clic your package (left side of the browser) and  select ''Publish as Parcel...''. Validate by clicking ''Publish''
4/ Put the file in the Add-ons directory
5/ Setting the add-on meta info (Version, Author, Categoy, Description), is not yet working
'.
	txt := txtNum , txtCharter.
	ComposedTextView
		open: txt asValue
		label: 'Add-On manager: How To'
		icon: (Icon constantNamed: #workspace)
		extent: 700 @ 300
]

{ #category : #'model entities' }
Cormas >> addPassiveEntityClass [
	
	| interface |
	self cormasModelClass isNil ifTrue: [^self alert_NewModel].
	interface := EntityAdditionInterface new.
	interface cormas: self.
	interface openInterface: #addPassiveEntity
]

{ #category : #'model entities' }
Cormas >> addSocialEntityClass [
	
	| interface |
	self cormasModelClass isNil ifTrue: [^self alert_NewModel].
	interface := EntityAdditionInterface new.
	interface cormas: self.
	interface openInterface: #addAgent
]

{ #category : #'model entities' }
Cormas >> addSpatialEntityClass [
	
	| interface |
	self cormasModelClass isNil ifTrue: [^self alert_NewModel].
	interface := EntityAdditionInterface new.
	interface cormas: self.
	interface openInterface: #addSpatialEntity
]

{ #category : #version }
Cormas >> adjustChartsTo2002 [
	
	| oldCharts oldProbes source index startIndex endIndex entityName probeName |
	oldCharts := (self cormasModelClass organization listAtCategoryNamed:
			#graphiques) asOrderedCollection
		select:
			[:n | 
			n asString last ~= $:
				and:
					[n size <= 4
						or:
							[(n
								findString: 'Data'
								startingAt: n size - 4) = 0]]].
	oldCharts := oldCharts collect: [:oc | oc asString].
	oldProbes := oldCharts collect: [:x | x asString , 'Data'].
	oldProbes
		with: oldCharts
		do:
			[:op :oc | 
			source := (self cormasModelClass compiledMethodAt: op asSymbol) getSource.
			index := source findString: '^#' startingAt: 1.
			index = 0
				ifTrue:
					[self cormasModelClass
						compile:
							(source
								copyReplaceFrom: 1
								to: op asString size
								with: oc asString)
						classified: 'probes'
						notifying: nil]
				ifFalse:
					[startIndex := index + 4.
					endIndex := (source
						nextIndexOf: Character space
						from: startIndex
						to: source size) - 1.
					entityName := (source copyFrom: startIndex to: endIndex) asSymbol.
					probeName := (source
						copyFrom: endIndex + 3
						to: source size - 1) asSymbol.
					(self cormasModelClass environment at: entityName) organization
						classify: probeName under: #probes]].
	self cormasModelClass removeCategory: 'graphiques'.
	oldCharts
		do:
			[:oc | 
			(self cormasModelClass instVarNames includes: oc)
				ifTrue: [self cormasModelClass removeInstVarName: oc]]
]

{ #category : #'user messages' }
Cormas >> alert: aString [
	
	self warn: aString
]

{ #category : #'user messages' }
Cormas >> askUserTheClassNameWithDefaultValue: defaultString [
	
	| aName |
	(aName := self
		request:
			'*** Create a new kind of Entity ***\         Enter the entity''s name '
				withCRs
		initialAnswer: defaultString) isEmpty
		ifFalse:
			[aName beMutable.
			aName first isAlpha ifFalse: [aName := 'X_' , aName].
			aName
				at: 1
				put: aName first asUppercase.
			(self verifyClassExist: aName)
				ifTrue:
					[self alert_NameAlreadyExist.
					^self askUserTheClassNameWithDefaultValue: defaultString]]
		ifTrue: [^nil].
	^aName
]

{ #category : #'user messages' }
Cormas >> asynchronousDo: aBlock [
	"ask aSpatialGrid for habitus named aHabitusName to execute aBlock in an asynchronous way (used for distributed cormas)
	no result expected"
	
	aBlock promise
]

{ #category : #'user messages' }
Cormas >> asynchronousDo: aBlock toHabitus: aHabitusName [
	"ask aSpatialGrid for habitus named aHabitusName to execute aBlock in an asynchronous way (used for distributed cormas)
	no result expected"
	
	(self targetForHabitus: aHabitusName) asynchronousDo: aBlock
]

{ #category : #'user messages' }
Cormas >> asynchronousDo: aBlock toHabitus: aHabitusName elseTo: anotherHabitusName [
	"ask aSpatialGrid for habitus named aHabitusName to execute aBlock in an asynchronous way (used for distributed cormas)
	no result expected"
	
	(self targetForHabitus: aHabitusName or: anotherHabitusName)
		asynchronousDo: aBlock
]

{ #category : #'model entities' }
Cormas >> basicAgentClasses [
	
	| coll |
	coll := OrderedCollection 
		with: CMAgentComm 
		with: CMAgentLocation
		with: CMAgentCommLocation.
	coll
		addAll: (OrderedCollection 
			with: Group 
			with: CMGroupComm 
			with: CMGroupLocation 
			with: 	CMGroupCommLocation).
	^ coll
]

{ #category : #'model entities' }
Cormas >> browser [
	"return the associated browser redisplaying its windows or recreate one if necessary"
	
	^RefactoringBrowser
		ifDefinedDo:
			[:browserClass | 
			self browserWindow
				ifNil: [browser := browserClass open]
				ifNotNil:
					[:win | 
					win isCollapsed
						ifTrue: [win expand]
						ifFalse: [win raise]].
			browser]
]

{ #category : #'model entities' }
Cormas >> browserWindow [
	"return the associated window's browser if it is still valid"
	
	| win |
	browser ifNil: [^nil].
	win := browser mainWindow.
	win ifNil: [^win].
	win key ifNil: [^nil].
	^win
]

{ #category : #'model entities' }
Cormas >> changeAbstract: aClass [
	
	(aClass isAbstract
		ifTrue:
			[self
				confirm:
					aClass name asString ,
							' is abstract. It will be changed as concrete class. 
OK?']
		ifFalse:
			[self
				confirm:
					aClass name asString ,
							' is concrete. It will be changed as abstract class. 
OK?']) ifFalse: [^nil].
	aClass isAbstract not
		ifTrue:
			[aClass class
				compile: 'isAbstract \^true' withCRs
				classified: 'testing'
				notifying: nil]
		ifFalse:
			[aClass class
				compile: 'isAbstract \^false' withCRs
				classified: 'testing'
				notifying: nil].
	self cormasModelClass createInstancesAccessorsForClass: aClass
]

{ #category : #'model entities' }
Cormas >> changeAbstractPassive [
	"Set target class as Abstract or Concret class. "
	
	| aClass |
	aClass := self getSelectedEntityClassType: 'Passive'.
	aClass isNil ifFalse: [self changeAbstract: aClass]
]

{ #category : #'model entities' }
Cormas >> changeAbstractSocial [
	"Set target class as Abstract or Concret class. "
	
	| aClass |
	aClass := self getSelectedEntityClassType: 'Social'.
	aClass isNil ifFalse: [self changeAbstract: aClass]
]

{ #category : #changed }
Cormas >> changeFinalV [
	"change Validation for the stepCounter input field"
	
	| newValue |
	newValue := self cycle myDependents hasEditValue
		ifTrue: [self cycle myDependents editValue]
		ifFalse: [^true].	"^true"
	^self simManager applyUserChangeForFinalStep: newValue
]

{ #category : #changed }
Cormas >> changeN [
	
	self halt
]

{ #category : #'interface actions' }
Cormas >> changeSingleRBrowser [
	
	self useOnlyOneRB: self useOnlyOneRB not
]

{ #category : #changed }
Cormas >> changeV [
	"change Validation for the stepCounter input field"
	
	| newValue |
	newValue := self stepCounter myDependents hasEditValue
		ifTrue: [self stepCounter myDependents editValue]
		ifFalse: [^true].	"^true"
	self cormasModel ifNil: [^true].
	^self simManager applyUserChangeForStep: newValue
]

{ #category : #testing }
Cormas >> checkBrowserNotEditing [
	
	| b |
	b := self browser.
	(b toolsets allSatisfy: [:each | each isEditing not])
		ifFalse:
			[^b
				confirm:
					#ModifiedViewsExistsExitAnyway << #browser >>
							'Modified views exists.
Exit anyway?']
		ifTrue: [^true]
]

{ #category : #'model saving&loading' }
Cormas >> checkDirectoryName: aName [
	"Check if the directory name starts with an Uppercase (and if it contains blanks). If no, renames the directory and returns the new name"
	
	| modelsDirectory targetDirectory nameWithoutBlank |
	aName isEmpty
		ifTrue:
			[self warn: 'Directory name is empty ! '.
			^nil].
	nameWithoutBlank := Cormas checkIfNameContainsBlank: aName.
	(nameWithoutBlank first isUppercase and: [nameWithoutBlank = aName])
		ifTrue: [^nameWithoutBlank].
	modelsDirectory := self class modelsPath asFilename.
	modelsDirectory directoryContents
		do:
			[:aDir | 
			aDir = aName
				ifTrue:
					[(modelsDirectory construct: aDir) isDirectory
						ifTrue: [targetDirectory := modelsDirectory construct: aDir]]].
	nameWithoutBlank
		at: 1
		put: nameWithoutBlank first asUppercase.
	targetDirectory
		renameTo: (modelsDirectory construct: nameWithoutBlank) asFilename.
	self
		alert_renameDirectory:
			(modelsDirectory construct: nameWithoutBlank) asString.
	^nameWithoutBlank
]

{ #category : #'model saving&loading' }
Cormas >> checkForUnpackagedClasses [
	"Check if all classes are packaged. If none, packaging the nameSpace"
	
	| aNameSpace pkg outOfPackageClasses |
	aNameSpace := self cormasModelClass environment.
	pkg := WeakRegistry packageNamedOrCreate: aNameSpace name asString.	"look for un packaged classes"
	outOfPackageClasses := (aNameSpace allEntityClasses
		select: [:cl | (pkg allDefinedClasses includes: cl) not]) asSet.	"look for un packaged selectors"
	outOfPackageClasses
		addAll:
			(aNameSpace allEntityClasses
				select:
					[:cl | (cl selectors allSatisfy: [:selector | pkg methods includes: selector]) not]).
	outOfPackageClasses isEmpty
		ifFalse:
			[| string |
			string := ''.
			outOfPackageClasses
				do:
					[:cl | 
					pkg addEntiretyOfClass: cl.	"Adding classes. AddClass: is not enough !!!"
					string := string , '\    ' , cl name asString].
			self
				warn:
					'The following classes : <1s><n>have been added to the package: <2s>'
				with: string
				with: pkg name]
]

{ #category : #'user messages' }
Cormas >> choose: messageString labels: labels values: values default: defaultValue [
	
	^Dialog choose: messageString labels: labels values: values default:
			defaultValue
]

{ #category : #'user messages' }
Cormas >> choose: messageString labels: labels values: values default: defaultValue then: aBlock [
	"request the user to choose from a list of options then evaluate aBlock in an asynchronous way.
	no result expected
	used for distributed cormas"
	
	| answer |
	answer := Dialog choose: messageString labels: labels values: values
		default: defaultValue.
	aBlock value: answer
]

{ #category : #'user messages' }
Cormas >> choose: messageString labels: labels values: values default: defaultValue toHabitus: aHabitusName [
	
	^(self targetForHabitus: aHabitusName) choose: messageString labels:
			labels values: values default: defaultValue
]

{ #category : #'user messages' }
Cormas >> choose: messageString labels: labels values: values default: defaultValue toHabitus: aHabitusName elseTo: anotherHabitusName [
	
	^(self targetForHabitus: aHabitusName or: anotherHabitusName) choose:
			messageString labels: labels values: values default: defaultValue
]

{ #category : #'user messages' }
Cormas >> choose: messageString labels: labels values: values default: defaultValue toHabitus: aHabitusName elseTo: anotherHabitusName then: aBlock [
	"request the user to choose from a list of options then evaluate aBlock in an asynchronous way.
	no result expected
	used for distributed cormas"
	
	^(self targetForHabitus: aHabitusName or: anotherHabitusName) choose:
			messageString labels: labels values: values default: defaultValue then:
			aBlock
]

{ #category : #'interface actions' }
Cormas >> closeAllWindows [
	
	self closeMyWindows.
	^super requestForWindowClose
]

{ #category : #'interface actions' }
Cormas >> closeDialog [
	"ask the user for choosing a close action, execute the action.
	return false in case of cancel"
	
	| labels values result |
	Cormas isModelUserMode ifTrue: [^self closeDialogForModelUser].
	labels := OrderedCollection new.
	values := OrderedCollection new.
	self cormasModelClass
		ifNil:
			[labels
				add: #closeCormas << nil >> 'Close Cormas';
				add: #closeCormasThenExit << nil >> 'Exit'.
			values addAll: #(#close #exit)]
		ifNotNil:
			[labels
				add: #saveModelThenExit << nil >> 'Save model then Exit';
				add: #closeCormas << nil >> 'Just Close Cormas';
				add: #exitWithoutSavingModel << nil >> 'Exit VW'.	"add: #saveModelThenClose << nil >> 'Save the model then close Cormas';"
			values addAll: #(#saveModelThenExit #close #exitWithoutSaving)].
	labels add: #Cancel << nil >> 'Cancel'.
	values add: #cancel.
	result := Dialog
		choose: #closeCormasOrExit << nil >> 'Exit Cormas'
		fromVerticallyAlignedButtonsWithLabels: labels
		values: values
		default: #cancel.
	result == #cancel ifTrue: [^false].
	(#(#saveThenClose #saveThenExit) includes: result)
		ifTrue: [self exportModel].
	(#(#close #closeWithoutSaving #saveThenClose) includes: result)
		ifTrue:
			[self closeModel.
			VisualLauncher raiseSingleInstance].
	(#(#saveThenExit #exitWithoutSaving #exit) includes: result)
		ifTrue: [ObjectMemory quit]
]

{ #category : #'interface actions' }
Cormas >> closeDialogForModelUser [
	"the closeDialog offers only the cancel / exit  choices.
	return false in case of cancel"
	
	| labels values result |
	labels := OrderedCollection
		with: #closeCormasThenExit << nil >> 'Exit'
		with: #Cancel << nil >> 'Cancel'.
	values := OrderedCollection with: #exit with: #cancel.
	result := Dialog
		choose: #closeCormasOrExit << nil >> 'Exit Cormas ?'
		labels: labels
		values: values
		default: #cancel.
	result == #cancel ifTrue: [^false].
	ObjectMemory quit
]

{ #category : #'interface actions' }
Cormas >> closeGraphicWindows [
	"Close all the opened graphic windows (space interfaces and charts)"
	
	self spaceModel closeGraphicWindows.	"self spaceInterfaces do:[: spaceWin | spaceWin closeRequest].
	self spaceInterfaces: nil."
	self obsWin notNil
		ifTrue:
			[self obsWin observateur actionQuitter.
			self obsWin: nil].
	self visualStateWin notNil
		ifTrue:
			[self visualStateWin close.
			self visualStateWin: nil].
	self defineCommWin notNil
		ifTrue:
			[self defineCommWin closeRequest.
			self defineCommWin: nil].
	self displayChartsWin notNil
		ifTrue:
			[self displayChartsWin do: [:win | win closeRequest].
			self displayChartsWin: nil]
]

{ #category : #'main menu' }
Cormas >> closeModel [
	
	self cormasModel notNil ifTrue: [self closeSimulation].
	self listSocialEntities list: List new.
	self listSpatialEntities list: List new.
	self listPassiveEntities list: List new.
	self mainWin label: 'Cormas'.
	xmlModel isNil
		ifFalse:
			[xmlModel release.
			xmlModel := nil].
	self cormasModelClass: nil.
	self displaySimNumber value: ' '.
	self modelNameField value: ' '.
	self versionField value: ' '	"(self builder componentAt: #SimButton) widget labelString: ' '"
]

{ #category : #'interface actions' }
Cormas >> closeMyWindows [
	"Close all the opened windows except the main interface"
	"self spaceInterfaces do:[: spaceWin | spaceWin closeRequest].
	self spaceInterfaces: nil."
	
	| subcanvas |
	self spaceModel ifNotNil: [:sm | sm closeGraphicWindows].
	self obsWin notNil
		ifTrue:
			[self obsWin observateur actionQuitter.
			self obsWin: nil].
	self visualStateWin notNil
		ifTrue:
			[self visualStateWin close.
			self visualStateWin: nil].
	self defineEntityWin notNil
		ifTrue:
			["self defineEntityWin close"
			self defineEntityWin controller closeAndUnschedule.
			self defineEntityWin: nil].
	self simulationWin notNil
		ifTrue:
			[self simulationWin controller closeAndUnschedule.
			self simulationWin: nil].
	subcanvas := self mainBuilder componentAt: #subcanvasSim.
	subcanvas isVisible
		ifTrue:
			[self resizeWindowToMin.
			subcanvas beInvisible].	"self defineSchedulerWin notNil 
		ifTrue: 
			[self defineSchedulerWin closeRequest.
			self defineSchedulerWin: nil]."
	self defineCommWin notNil
		ifTrue:
			[self defineCommWin closeRequest.
			self defineCommWin: nil].
	self displayChartsWin notNil
		ifTrue:
			[self displayChartsWin do: [:win | win closeRequest].
			self displayChartsWin: nil].
	self defineChartsWin notNil
		ifTrue:
			[self defineChartsWin closeRequest.
			self defineChartsWin: nil].
	self definePatchWin notNil
		ifTrue:
			[self definePatchWin closeRequest.
			self definePatchWin: nil].
	CreateInstances allInstances do: [:aWin | aWin closeRequest].
	ManipulateInstances allInstances do: [:aWin | aWin closeRequest].
	DefaultAttributesSetter allInstances do: [:aWin | aWin closeRequest].
	HistogramsInterface allInstances do: [:aWin | aWin closeRequest].
	(Cormas allTerminalClassesOf: SensitivitySetter)
		do: [:aClass | aClass allInstances do: [:aWin | aWin closeRequest]]
]

{ #category : #'main menu' }
Cormas >> closeSimulation [
	
	self simNum value: ''.
	self simName value: ''.
	self cormasModel
		ifNotNil:
			[:sim | 
			process isNil
				ifFalse:
					[process terminate.
					process := nil].
			xmlModel
				ifNotNil:
					[xmlModel release.
					xmlModel := nil].
			sim spaceModel
				ifNotNil:
					[:sm | 
					sm
						cormasModel: nil;
						release.
					sim spaceModel: nil].
			sim closeRequest.
			self cormasModel: nil].
	self closeMyWindows
]

{ #category : #'user messages' }
Cormas >> confirm: aString [
	
	^Dialog confirm: aString
]

{ #category : #'user messages' }
Cormas >> confirm: aString then: aBlock [
	"request the user for confirmation then √©valuate aBlock in an asynchronous way.
	no result expected
	used for distributed cormas"
	
	[(Dialog confirm: aString) ifTrue: [aBlock value]] promise
]

{ #category : #'user messages' }
Cormas >> confirm: aMessage toHabitus: aHabitusName [
	
	^(self targetForHabitus: aHabitusName) confirm: aMessage
]

{ #category : #'user messages' }
Cormas >> confirm: aMessage toHabitus: aHabitusName elseTo: anotherHabitusName [
	
	^(self targetForHabitus: aHabitusName or: anotherHabitusName) confirm:
			aMessage
]

{ #category : #'user messages' }
Cormas >> confirm: aMessage toHabitus: aHabitusName elseTo: anotherHabitusName then: aBlock [
	"open a confirmation dialog then execute aBlock without blocking the current process.
	usefull for distributed cormas.
	no return can be expected from this method"
	
	(self targetForHabitus: aHabitusName or: anotherHabitusName) confirm:
			aMessage then: aBlock
]

{ #category : #'user messages' }
Cormas >> confirm: aString with: firstParameter [
	
	^Dialog confirm: (aString expandMacrosWith: firstParameter)
]

{ #category : #'user messages' }
Cormas >> confirm: aString with: firstParameter with: secondParameter [
	
	^Dialog
		confirm: (aString expandMacrosWith: firstParameter with: secondParameter)
]

{ #category : #'user messages' }
Cormas >> confirm: aString with: firstParameter with: secondParameter with: thirdParameter [
	
	^Dialog
		confirm:
			(aString expandMacrosWith: firstParameter with: secondParameter with:
					thirdParameter)
]

{ #category : #'user messages' }
Cormas >> confirm: aString withAll: someParameters [
	
	^Dialog confirm: (aString expandMacrosWithArguments: someParameters)
]

{ #category : #'user messages' }
Cormas >> confirm_DeleteEntity [
	
	^(UserMessage defaultString: ' Delete entity ' key: #deleteEntity)
		asString
]

{ #category : #'user messages' }
Cormas >> confirm_DeleteSimulation [
	
	^UserMessage defaultString: ' Are you sure ? ' key: #deleteSimulation
]

{ #category : #'user messages' }
Cormas >> confirm_IsAbstractClass: aClass [
	
	| text |
	Dev todo: 'Il y a TextStream pour faire √ßa'.
	text := '                                           Is ' asText
		emphasizeAllWith: #bold.
	text := text , (aClass name asText emphasizeAllWith: #(#bold #italic)).
	text := text
		,
			((' an Abstract class?' , '\' withCRs) asText emphasizeAllWith: #(#bold)).
	text := text
		,
			' (an abstract class does not have instance and must have subclasses, while \'
				withCRs asText.
	text := text , ' a concret class will have instances and '
		, self cormasModelClass name , ' will define an attribut called ' asText.
	text := text
		,
			(('the' , aClass name , 's') asText
				emphasizeAllWith: #color -> ColorValue red) asText.
	text := text , ').' asText.
	^self confirm: text asText
]

{ #category : #util }
Cormas >> convertSourceTo2002: name [
	"on copie le fichier model.st en model2001.st"
	
	| contents upgradeDictionary index stream oldVersion answer |
	oldVersion := (Filename splitExtension: name) first , '2001.'
		, (Filename splitExtension: name) last.
	oldVersion asFilename exists
		ifTrue:
			[self
				warn:
					(UserMessage defaultString:
							'Conversion already performed ! Just import it !' key:
							#alreadyConverted).
			^nil].
	answer := Dialog
		requestFileName:
			(UserMessage defaultString: 'Your previous version will be renamed as : '
				key: #previousVersion)
		default: oldVersion
		version: #new.
	answer isEmpty ifTrue: [^nil].
	name asFilename copyTo: answer asFilename.
	stream := name asFilename readStream.	"On devine le format des lignes"
	stream lineEndAuto.
	contents := stream contents.
	upgradeDictionary := Dictionary new.	"a completer en fonction de tous les changements de noms de methodes et de classes"	"attention a ne pas oublier le blanc en fin de string du nouveau nom sous 2002"
	upgradeDictionary
		at: 'SpatialEntity_Element' put: 'SpatialEntityElement ';
		at: 'SpatialEntity_Aggregate' put: 'SpatialEntityAggregate ';
		at: 'SpatialEntity_Partition' put: 'SpatialEntityAggregate ';
		at: 'SpatialEntity_Set_notConnex' put: 'SpatialEntityNotConnex ';
		at: 'SpatialEntity_CA' put: 'SpatialEntityCell ';
		at: 'initCharts!' put: 'initData! ';
		at: 'initLocalCharts' put: 'initData ';
		at: 'initGlobalCharts' put: 'initData ';
		at: 'updateCharts:' put: 'updateData: ';
		at: 'updateLocalCharts:' put: 'updateData: ';
		at: 'updateGlobalCharts:' put: 'updateData: ';
		at: 'Cormas_Model' put: 'CormasModel '.
	upgradeDictionary
		keysAndValuesDo:
			[:k :v | 
			index := contents findString: k startingAt: 1.
			[index ~= 0]
				whileTrue:
					[contents := contents
						changeFrom: index
						to: index + k size
						with: v.
					index := contents findString: k startingAt: index]].
	stream := name asFilename writeStream.
	stream nextPutAll: contents.
	stream close
]

{ #category : #version }
Cormas >> convertToCormas2011 [
	"Add tje _default parameters to the entity classes of the model"
	
	| das |
	das := DefaultAttributesSetter new.
	das cormasModel: self cormasModel.
	das getDefaultParametersValues.
	self cormasModelClass testTheAccessors
]

{ #category : #version }
Cormas >> convertToVW73 [
	"Check if a package exists for the model and if all classes are packaged. If none, packaging the nameSpace"
	
	| aNameSpace pkg |
	aNameSpace := self cormasModelClass environment.
	pkg := Registry containingPackageForNameSpace: aNameSpace.
	(pkg isNil or: [pkg name = '(none)'])
		ifTrue:
			[Notice
				show:
					(UserMessage defaultString: ' Adapting the model to VW7.3 ' key:
							#adaptingToVW73)
				while: [self packagingNamespace: aNameSpace].
			self
				warn:
					(UserMessage defaultString:
							' The model has been adapted to VW7.3. \ A package and a parcel have been created '
						key: #packageAndParcelCreated) asString withCRs].
	self checkForUnpackagedClasses
]

{ #category : #accessing }
Cormas >> cormasModel [
	
	^cormasModel
]

{ #category : #accessing }
Cormas >> cormasModel: newModelInstance [
	"set the new simulation and give a reference to cormas"
	
	cormasModel := newModelInstance.
	newModelInstance ifNil: [^nil].
	newModelInstance cormas: self
]

{ #category : #accessing }
Cormas >> cormasModelClass [
	
	^cormasModelClass
]

{ #category : #accessing }
Cormas >> cormasModelClass: x [
	
	cormasModelClass := x
]

{ #category : #'model entities' }
Cormas >> createClassModelNamed: aName [
	"Create the NameSpace of the new model and its category then create the class of this model"
	
	| classBuilder nameSpace |
	nameSpace := self createSubModelsNameSpace: aName.
	classBuilder := ClassBuilder new.
	classBuilder
		environment: nameSpace;
		beFixed;
		superclass: CormasModel;
		className: aName asSymbol;
		instVarString: '';
		category: aName , 'Category'.
	^classBuilder reviseSystemSilently
]

{ #category : #'model entities' }
Cormas >> createClassNamed: aName from: aSuperClass [
	"aName <String> - aSuperClass <Object, Agent, Entity, etc >"
	
	| classBuilder class currentNameSpace pkg |
	classBuilder := ClassBuilder new.
	currentNameSpace := self cormasModelClass environment.	"#{aSuperClass}"
	pkg := Registry packageNamedOrCreate: currentNameSpace name asString.	"RB := Refactory.Browser.BrowserNavigator new.
RB 	handleError:
			[RB performRefactoring:
					(Refactory.Browser.AddClassRefactoring
						addClass: (CormasNS.Kernel unambiguousName , '.') , aName
						superclass: aSuperClass
						subclasses: (Array new: 0)).
			CormasNS.Kernel
				at: aName asSymbol
				ifAbsent: [nil]].   "	"CormasNS.Kernel
		defineClass: #Momo
		superclass: #{CormasNS.Models.ECEC.Forager}
		indexedType: #none
		private: false
		instanceVariableNames: ''
		classInstanceVariableNames: ''
		imports: ''
		category: ''.  "
	classBuilder
		addRecord: (ClassCreatorRecord forName: aName in: currentNameSpace).
	classBuilder
		environment: currentNameSpace;
		beFixed;
		superclass: aSuperClass;
		className: aName asSymbol;
		instVarString: '';
		category: self cormasModelClass category.
	BrowserNavigator new
		moveObjectsNamed: (List with: aSuperClass fullName , '.' , aName)
		toPackage: pkg.
	class := classBuilder reviseSystemSilently.
	self packagingNamespace: self cormasModelClass environment.
	^class
]

{ #category : #deprecated }
Cormas >> createColorsDictClass: newClass [
	"OBSOLETE	self currentModel povColorsDict at: newClass put: Dictionary new.
	newClass colorsDict: (self currentModel povColorsDict at: newClass)"
	
	
]

{ #category : #'model entities' }
Cormas >> createIdProtocol: newClass [
	"c'est inutile !"
	"newClass addClassVarName: 'CurrentId'.
	newClass class compile: 'CurrentId\	^CurrentId isNil \		ifTrue: [0] \		ifFalse: [CurrentId]' withCRs
		classified: 'id'
		notifying: nil.
	newClass class compile: 'CurrentId: x\	^CurrentId := x' withCRs
		classified: 'id'
		notifying: nil.
	newClass
		compile: 'initId\	self id: (self class CurrentId: self class CurrentId + 1)' withCRs
		classified: 'init'
		notifying: nil"
	
	
]

{ #category : #deprecated }
Cormas >> createImageDictClass: newClass [
	"OBSOLETE	self currentModel imageDict at: newClass put: VectorialElementaryPOV new.
	newClass image: (self currentModel imageDict at: newClass)"
	
	
]

{ #category : #'model entities' }
Cormas >> createInit: newClass [
	
	newClass
		compile: 'init\	"to be completed"\' withCRs
		classified: 'init'
		notifying: nil
]

{ #category : #'model entities' }
Cormas >> createModelAccessors: newClass [
	"ask if newClass is Abstract, 
	no, then creates the attribut 'theNewClasss' and the accesors at the level of cormasModel,
	yes, then creates an accessing methods 'theNewClasss' that will returns a collection of all entities of newClass and its subclasses"
	
	| isAbstract |
	(newClass inheritsFrom: CMSpatialEntityElement)
		ifTrue: [isAbstract := false]
		ifFalse: [isAbstract := self confirm_IsAbstractClass: newClass].
	isAbstract
		ifTrue:
			[newClass class
				compile: 'isAbstract \^true' withCRs
				classified: 'testing'
				notifying: nil]
		ifFalse:
			[newClass class
				compile: 'isAbstract \^false' withCRs
				classified: 'testing'
				notifying: nil].
	self cormasModelClass createInstancesAccessorsForClass: newClass
]

{ #category : #'model entities' }
Cormas >> createProtocol: aSymbol forClass: aClass [
	
	BrowserNavigator new
		performChange: (AddProtocolChange class: aClass protocol: aSymbol)
]

{ #category : #'model entities' }
Cormas >> createStep: newClass [
	
	newClass
		compile: 'step\	"to be completed"' withCRs
		classified: 'control'
		notifying: nil
]

{ #category : #'model entities' }
Cormas >> createSubModelsNameSpace: aName [
	"Creates and returns the NameSpace under CormasNS.Models    aName : <String>"
	
	^Models
		defineNameSpace: aName asSymbol
		private: false
		imports:
			'private Smalltalk.* 
						 private CormasNS.Kernel.*'
		category: aName , 'Category'
]

{ #category : #deprecated }
Cormas >> currentModel [
	
	^cormasModelClass
]

{ #category : #accessing }
Cormas >> currentModel: x [
	
	cormasModelClass := x
]

{ #category : #deprecated }
Cormas >> currentSimulation [
	
	^cormasModel
]

{ #category : #deprecated }
Cormas >> currentSimulation: newModel [
	"set the new simulation and give a reference to cormas"
	
	self cormasModel: newModel
]

{ #category : #aspects }
Cormas >> cycle [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^cycle isNil
		ifTrue: [cycle := 0 asValue]
		ifFalse: [cycle]
]

{ #category : #'main menu' }
Cormas >> defObservationChanged [
	
	self perform: self defineObservation value
]

{ #category : #accessing }
Cormas >> defineCSEWin [
	
	^defineCSEWin
]

{ #category : #accessing }
Cormas >> defineCSEWin: x [
	
	defineCSEWin := x
]

{ #category : #'model observation' }
Cormas >> defineChartsObs [
	
	self cormasModelClass isNil ifTrue: [^self alert_NewModel].
	self defineChartsWin: ProbesList new.
	self defineChartsWin openOn: self cormasModelClass
]

{ #category : #accessing }
Cormas >> defineChartsWin [
	
	^defineChartsWin
]

{ #category : #accessing }
Cormas >> defineChartsWin: x [
	
	defineChartsWin := x
]

{ #category : #accessing }
Cormas >> defineCommWin [
	
	^defineCommWin
]

{ #category : #accessing }
Cormas >> defineCommWin: x [
	
	defineCommWin := x
]

{ #category : #'model observation' }
Cormas >> defineCommunicationObs [
	
	| messageClass items |
	self cormasModelClass isNil ifTrue: [^self alert_NewModel].
	messageClass := Msg allSubclasses
		select: [:aClass | aClass category = self cormasModelClass category].
	messageClass isEmpty
		ifTrue: [^self alert_NewMessage]
		ifFalse:
			[messageClass size = 1
				ifTrue: [messageClass := messageClass first]
				ifFalse:
					[items := messageClass collect: [:a | a name asString].
					messageClass := Dialog choose: 'On which class?' labels: items values:
							messageClass default: nil].	"(Tools.FullNotebookSystemBrowser new) initializeForSystem; spawnOnClassHierarchy: messageClass."
			messageClass
				compile:
					('povMessage' ,
							'\"return a boolean"\^#true\"in that example all messages will be dispalyed"')
						withCRs
				classified: 'pov'.
			self
				withBrowserDo:
					[:b | 
					(b navigator)
						selectClass: messageClass;
						beHierarchy;
						setSelector: #povMessage	"browser := CormasRB open.
				browser setClasseMsgTo: messageClass"]]
]

{ #category : #accessing }
Cormas >> defineEntityWin [
	
	^defineEntityWin
]

{ #category : #accessing }
Cormas >> defineEntityWin: x [
	
	defineEntityWin := x
]

{ #category : #accessing }
Cormas >> defineObjectWin [
	
	^defineObjectWin
]

{ #category : #accessing }
Cormas >> defineObjectWin: x [
	
	defineObjectWin := x
]

{ #category : #aspects }
Cormas >> defineObservation [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^defineObservation isNil
		ifTrue: [defineObservation := nil asValueHolder]
		ifFalse: [defineObservation]
]

{ #category : #accessing }
Cormas >> definePatchWin [
	
	^definePatchWin
]

{ #category : #accessing }
Cormas >> definePatchWin: x [
	
	definePatchWin := x
]

{ #category : #accessing }
Cormas >> displayChartsWin [
	
	^displayChartsWin ifNil: [displayChartsWin := OrderedCollection new]
]

{ #category : #accessing }
Cormas >> displayChartsWin: x [
	
	displayChartsWin := x
]

{ #category : #accessing }
Cormas >> displayCommWin [
	
	^displayCommWin
]

{ #category : #accessing }
Cormas >> displayCommWin: x [
	
	displayCommWin := x
]

{ #category : #'main menu' }
Cormas >> displayCormasVersion [
	
	| txt |
	txt := '	History of the Cormas versions ' asText emphasizeAllWith:
			#(#bold #large).
	txt := txt , Cormas versionComments.
	ComposedTextView
		open: txt asValue
		label: '* Versions of Cormas * '
		icon: (Icon constantNamed: #workspace)
		extent: 500 @ 650
]

{ #category : #'main menu' }
Cormas >> displayModelVersion [
	
	| txt |
	self cormasModelClass isNil
		ifTrue: [^self warn: 'Select or create a model'].
	txt := ('	History of ' , self cormasModelClass name , ''' versions ')
		asText emphasizeAllWith: #(#bold #large).
	txt := txt , self cormasModelClass versionComments.
	ComposedTextView
		open: txt asValue
		label: '* Versions of ' , self cormasModelClass name , ' * '
		icon: (Icon constantNamed: #workspace)
		extent: 500 @ 650
]

{ #category : #aspects }
Cormas >> displaySimNumber [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^displaySimNumber isNil
		ifTrue: [displaySimNumber := String new asValueHolder]
		ifFalse: [displaySimNumber]
]

{ #category : #version }
Cormas >> displayVersionOfModel: aModel [
	"Display the model version on Cormas GU interface"
	
	aModel version isNil ifTrue: [aModel setVersion: 'v-0'].	"self mainWin label: self mainWin label, '  version: ', aModel version."
	self modelNameField value: self modelName.
	self versionField value: aModel version
]

{ #category : #accessing }
Cormas >> distributionControl [
	
	^distributionControl
		ifNil: [distributionControl := DistributionControl new]
]

{ #category : #'model entities' }
Cormas >> edit: aClass [
	"Cormas new edit: Agent"
	
	self
		withBrowserDo:
			[:b | 
			(b navigator)
				selectClass: aClass;
				beHierarchy;
				changed]
]

{ #category : #'model entities' }
Cormas >> edit: aClass onProtocol: aSymbol [
	"Cormas new edit: Agent.
Set the nagitor selection on a specified protocol"
	
	self
		withBrowserDo:
			[:b | 
			| navigator newState |
			navigator := b navigator.
			newState := navigator getState.
			newState
				protocol: aSymbol;
				selectors: #().
			navigator
				selectClass: aClass;
				beHierarchy;
				updatePartsWith: newState;
				changed]
]

{ #category : #'model entities' }
Cormas >> edit: aClass pov: aSymbol [
	"Open a RefactoryBrowser on aClass by selecting the method aSymbol"
	
	| listMethods |
	self
		withBrowserDo:
			[:b | 
			| navigator |
			navigator := b navigator.
			navigator
				selectClass: aClass;
				beHierarchy.
			(aClass includesSelector: aSymbol)
				ifTrue: [navigator setSelector: aSymbol]
				ifFalse:
					[listMethods := aClass organization
						listAtCategoryNamed:
							(aSymbol = #init
								ifTrue: [#init]
								ifFalse: [#control]).
					listMethods isEmpty
						ifFalse: [navigator setSelector: listMethods first]].
			navigator changed]
]

{ #category : #'model entities' }
Cormas >> edit: aClass selector: aSymbol [
	
	self
		withBrowserDo:
			[:b | 
			(b navigator)
				selectClass: aClass;
				beHierarchy;
				setSelector: aSymbol;
				changed]
]

{ #category : #'model entities' }
Cormas >> editAttributesClass: aClass [
	"Ouvrir fen√™tre √©quivalente √† la fen√™tre Param√®tre du menu simulation mais uniquement sur cette classe.  Avec boutons pour ajouter une ligne (donc un nouvel attribut) , niveau instance et classe. A chaque fois il y a la colonne de la valeur par d√©faut et l‚Äôutilisateur la rempli √† la main. Quand il valide, √ßa cr√©e les accesseurs et √ßa inscrit en dur la valeur par d√©faut (comme d‚Äôhab)"
	
	| das |
	das := AttributeAdder
		newAttributWindowOn: aClass
		model: self cormasModel.
	das openInterface: #oneClassAttributSetter
]

{ #category : #'interface actions' }
Cormas >> ensureSimulationGUIisOpen [
	"Test if the simulation subCanvas of the main window is visible. If not then makes it visible"
	
	| subcanvas spec |
	self cormasModelClass isNil ifTrue: [^self alert_NewModel].
	subcanvas := self mainBuilder componentAt: #subcanvasSim.
	subcanvas isVisible
		ifFalse:
			[self resizeWindowToMax.
			subcanvas beVisible.
			spec := self class interfaceSpecFor: #simulationWindow.
			subcanvas := subcanvas widget.
			subcanvas
				client: self
				spec: spec
				builder: self mainBuilder]
]

{ #category : #'interface actions' }
Cormas >> entities [
	"Open the ENTITIES interface"
	
	| selectionInList |
	self cormasModelClass isNil ifTrue: [^self alert_NewModel].
	self defineEntityWin isNil
		ifTrue:
			["bdr := self allButOpenInterface: #entities. Pour ouvrir la fenetre juste sous Cormas. Mais, qd on la ferme, √ßa ferme le mod√®le...
	self defineEntityWin:  bdr window.
	bdr source mainWin: self defineEntityWin.
	self defineEntityWin openIn: (10 @ 20 extent: self defineEntityWin minimumSize)."
			#('Spatial' 'Social' 'Passive')
				do:
					[:aType | 
					selectionInList := self perform: ('list' , aType , 'Entities') asSymbol.
					(self perform: ('list' , aType , 'Entities') asSymbol)
						list: (self getSortedListEntityClassType: aType)].
			self
				defineEntityWin: (self class openOn: self withSpec: #entities) window]
		ifFalse:
			[(self defineEntityWin)
				raise;
				expand].
	self listEntitesSpatialesChanged
]

{ #category : #'main menu' }
Cormas >> entitiesListings [
	"Creates text files (one for each class) with the listing of the methods"
	
	| directory |
	self cormasModelClass isNil ifTrue: [^nil].
	directory := Dialog
		requestDirectoryName: 'Choose a Directory to save the text files:'
		default: (Cormas modelPath: self cormasModelClass name).
	directory = '' ifTrue: [^nil].
	directory := directory asFilename.
	(self cormasModelClass allClassesInPackage
		select: [:c | (c inheritsFrom: Entity) or: [c inheritsFrom: CormasModel]])
		do: [:d | d listing: (directory construct: d class name , '.list.txt')]
]

{ #category : #changed }
Cormas >> entryN [
	
	self halt
]

{ #category : #changed }
Cormas >> entryV [
	
	^true
]

{ #category : #aspects }
Cormas >> eraseLinks [
	
	^eraseLinks isNil
		ifTrue: [eraseLinks := true]
		ifFalse: [eraseLinks]
]

{ #category : #aspects }
Cormas >> eraseLinks: aBool [
	
	eraseLinks := aBool
]

{ #category : #changed }
Cormas >> exitN [
	
	self halt.
	^true
]

{ #category : #changed }
Cormas >> exitV [
	
	self halt.
	^true
]

{ #category : #'interface actions' }
Cormas >> expandMainWindow [
	"This stub method was generated by UIDefiner"
	
	^self
]

{ #category : #'main menu' }
Cormas >> exportCormas [
	
	Cormas export
]

{ #category : #'main menu' }
Cormas >> exportModel [
	
	self cormasModelClass notNil
		ifTrue:
			[self exportModelWithChoice.
			self saveVisualStates]
]

{ #category : #'model saving&loading ST' }
Cormas >> exportModelWithChoice [
	"export the model as ST file. The user can choose the file name and also the version of the model as a consequence"
	
	| fileName |
	fileName := self prepareSavingAs: '.st'.
	fileName ifNil: [^nil].
	self stFile: fileName
]

{ #category : #'model saving&loading ST' }
Cormas >> exportModelWithoutChoice [
	
	self cormasModelClass notNil
		ifTrue:
			[self stFile.
			self saveVisualStates]
]

{ #category : #accessing }
Cormas >> exportPlaybackLog [
	
	^exportPlaybackLog ifNil: [exportPlaybackLog := false]
]

{ #category : #accessing }
Cormas >> exportPlaybackLog: anObject [
	
	exportPlaybackLog := anObject
]

{ #category : #'model saving&loading' }
Cormas >> getFilenameFromDirectory: directoryName extension: ext [
	"Return a Filename. Look for a file that corresponds to the selected version (selected by user)
	directoryName = <String> ex : 'AutomataDim1'
	ext = <String>  ex: 'st' without dot !"
	
	| defaultFileName aFileName |
	defaultFileName := (self class modelPath: directoryName asSymbol)
		construct: directoryName , '.' , ext.	"on repete car des fois y comprend pas bien !"
	defaultFileName := (self class modelPath: directoryName asSymbol)
		construct: directoryName , '.' , ext.
	aFileName := Dialog
		requestFileName:
			(UserMessage defaultString: 'choose model' key: #import) asString
		default: defaultFileName.
	aFileName = '' ifTrue: [^nil].
	aFileName asFilename exists
		ifFalse:
			[self
				warn:
					(UserMessage
						defaultString: 'no ' , ext , ' file'
						key: #noStModelFilename).
			^nil].
	^aFileName
]

{ #category : #'model entities' }
Cormas >> getSelectedEntityClassType: aType [
	"aType is either 'Spatial', 'Social' or 'Passive'"
	
	| aName selectionInList |
	selectionInList := self perform: ('list' , aType , 'Entities') asSymbol.
	aName := (Cormas dropBlanksFromString: selectionInList selection) asSymbol.
	^aName notNil
		ifTrue: [self cormasModelClass environment at: aName]
		ifFalse: [nil]
]

{ #category : #testing }
Cormas >> hasGraphicInterfaces [
	"true if cormas has some SpaceInterfaces or displayChartsWin openened.
	added while removing spaceInterfaces from Cormas"
	
	^self spaceModel
		ifNotNil:
			[:sm | sm hasGraphicInterfaces or: [self displayChartsWin notEmpty]]
		ifNil: [false]
]

{ #category : #'main menu' }
Cormas >> howToRunThisModel [
	
	self cormasModelClass isNil not
		ifTrue: [self cormasModelClass howToRunIt]
		ifFalse:
			[self
				warn:
					(UserMessage defaultString: 'Select or create a model' key: #noModel)]
]

{ #category : #util }
Cormas >> inheritedMethodsFrom: aClass category: aCat [
	"Retourne la liste des methodes des superclasses de aClass 
	sauf celles de Object"
	"Inutile avec cormas2000"
	
	| aList tmp |
	aList := OrderedCollection new.
	aClass allSuperclasses
		do:
			[:uneClasse | 
			tmp := uneClasse organization listAtCategoryNamed: aCat.
			1
				to: tmp size
				do:
					[:i | 
					tmp
						at: i
						put: (tmp at: i) asString , ' (' , uneClasse name asString , ')'].
			aList addAll: tmp].
	^aList
]

{ #category : #deprecated }
Cormas >> initSimulation [
"This method is obsolete. In cormas-pharo init simulation is managed by the simManger (and not by cormas)"
	| pop |
	self halt.
	self cormasModel ifNil: [ ^ nil ].
	self releaseProcess.
	self cormasModel activeInit isNil
		ifTrue: [ ^ self alert_NoInit ].	"xmlModel isNil
		ifFalse: 
			[xmlModel release.
			xmlModel := nil]."	"Load the XML file if we export the log or if we use an external visualization module"
	(self useExternalVisualization or: [ self exportPlaybackLog ])
		ifTrue: [ xmlModel := XMLModel with: self cormasModel.
			useExternalVisualization
				ifTrue:
					[ "Contact external visualization module via XML-RPC" xmlModel connectToExternalVisualizer ].
			exportPlaybackLog
				ifTrue: [ "Open playback log stream" xmlModel openPlaybackLog ] ]
		ifFalse: [ xmlModel := nil ].
	Cursor wait
		showWhile: [ "self stepCounter value: 0."
			self cormasModel initSimulation.
			pop := self cormasModel theAgentsComm.
			self makeVideo.
			self obsWin notNil
				ifTrue: [ self obsWin populationSource: pop.
					self obsWin msgObs: self cormasModelClass messages ] ].
	useExternalVisualization
		ifTrue:
			[ "Send initial map to external visualization module via XML-RPC" xmlModel sendMapToExternalVisualizer ]
]

{ #category : #'initialize-release' }
Cormas >> initialize [
	
	super initialize.
	self class current: self.
	"self menuHolder: self class mainMenu asValue.
	self defineObservation value: #openPovSetterGUI.
	self defineObservation onChangeSend: #defObservationChanged to: self.
	self listSocialEntities selectionIndexHolder onChangeSend:
			#listAgentsChanged to: self.
	self listSpatialEntities selectionIndexHolder onChangeSend:
			#listEntitesSpatialesChanged to: self.
	self listPassiveEntities selectionIndexHolder onChangeSend:
			#listEntitesPassivesChanged to: self."
	cycle isNil ifFalse: [cycle:= NewValueHolder value: 0]
]

{ #category : #accessing }
Cormas >> isChangesDelayed [
	
	^isChangesDelayed ifNil: [isChangesDelayed := false]
]

{ #category : #accessing }
Cormas >> isChangesDelayed: aBoolean [
	
	isChangesDelayed := aBoolean.
	aBoolean
		ifTrue:
			[((self menuHolder value atNameKey: #Tools) submenu atNameKey:
					#isChangesDelayed) beOn]
		ifFalse:
			[((self menuHolder value atNameKey: #Tools) submenu atNameKey:
					#isChangesDelayed) beOff]
]

{ #category : #remoting }
Cormas >> isDistributed [
	
	^distributionControl isNil
		ifTrue: [false]
		ifFalse: [distributionControl brokerStarted]
]

{ #category : #'model saving&loading' }
Cormas >> isPOVsymbolsSavedAsClassMethods [
	"Check if the protocol 'pov symbols' exists in one of the entities class"
	
	| test |
	test := false.
	self cormasModelClass allEntityClasses
		do:
			[:entityClass | 
			(entityClass class organization categories includes: #'pov symbols')
				ifTrue: [test := true]].
	^test
]

{ #category : #testing }
Cormas >> isServerOn [
	
	^CormasOpentalkIntegration isServerOn
]

{ #category : #'model packaging' }
Cormas >> launchPackagerForModelUser [
	"launch the packaging window for a model user packaging"
	
	CormasPackagerForModelUser open
]

{ #category : #'model packaging' }
Cormas >> launchPackagerForModeler [
	"launch the packaging window for a modeler packaging"
	
	CormasPackagerForModeler open
]

{ #category : #changed }
Cormas >> listAgentsChanged [
	
	| menu |
	menu := self builder menuAt: #socialEntityMenu.
	self listSocialEntities selection isNil
		ifTrue: [menu menuItems do: [:i | i disable]]
		ifFalse: [menu menuItems do: [:i | i enable]]
]

{ #category : #changed }
Cormas >> listEntitesPassivesChanged [
	
	| menu |
	menu := self builder menuAt: #passiveEntityMenu.
	self listPassiveEntities selection isNil
		ifTrue: [menu menuItems do: [:i | i disable]]
		ifFalse: [menu menuItems do: [:i | i enable]]
]

{ #category : #changed }
Cormas >> listEntitesSpatialesChanged [
	
	| menu |
	menu := self builder menuAt: #spatialEntityMenu.
	self listSpatialEntities selection isNil
		ifTrue: [menu menuItems do: [:i | i disable]]
		ifFalse:
			[menu menuItems do: [:i | i enable].
			(self cormasModelClass cellClass notNil
				and:
					[self cormasModelClass cellClass name
						= self listSpatialEntities selection asSymbol])
				ifTrue: [(menu atNameKey: #specializeSpatialEntity) disable]]
]

{ #category : #changed }
Cormas >> listMethodsChanged [
	"some methods has changed. Propagate the changed to the spaceModel for its spaceInterfaces.
	(added while removing spaceInterfaces"
	
	self spaceModel ifNotNil: [:sm | sm listMethodsChanged]
]

{ #category : #aspects }
Cormas >> listPassiveEntities [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^listPassiveEntities isNil
		ifTrue: [listPassiveEntities := SelectionInList new]
		ifFalse: [listPassiveEntities]
]

{ #category : #aspects }
Cormas >> listSocialEntities [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^listSocialEntities isNil
		ifTrue: [listSocialEntities := SelectionInList new]
		ifFalse: [listSocialEntities]
]

{ #category : #aspects }
Cormas >> listSpatialEntities [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^listSpatialEntities isNil
		ifTrue: [listSpatialEntities := SelectionInList new]
		ifFalse: [listSpatialEntities]
]

{ #category : #'model saving&loading EV' }
Cormas >> loadArcImageOf: aClass line: line [
	"Méthode modifiée par PB le 10/5/2010"
	"Le format d'enregistrement dans le fichier EV des VectorialImage est à present de la forme
ClassName VectorialElementaryPOV symbolName (color red) (color green) (color blue) (lineColor red) (lineColor green) (lineColor blue) lineWidth sizeratio position (array of outline vertices)"
	
	| aNewImage classImage newSymbol linecolor linewidth startAnnotation stopAnnotation |
	classImage := aClass name asSymbol symbol.
	classImage ifNil: [^nil].
	newSymbol := (line upTo: Character space) asSymbol.
	linecolor := ColorValue
		red: (line upTo: Character space) asNumber
		green: (line upTo: Character space) asNumber
		blue: (line upTo: Character space) asNumber.
	linewidth := (line upTo: Character space) asNumber.
	startAnnotation := (line upTo: Character space) asBoolean.
	stopAnnotation := (line upTo: Character space) asBoolean.
	aNewImage := (ArcPOV new)
		lineColor: linecolor;
		lineWidth: linewidth;
		startAnnotation: startAnnotation;
		stopAnnotation: stopAnnotation.
	aClass povDict at: newSymbol put: aNewImage
]

{ #category : #'model saving&loading POV' }
Cormas >> loadArcPOV: selector ofClass: entity [
	"Le format d'enregistrement dans la m√©thode de classe est de la forme
 (color red) (color green) (color blue) (lineColor red) (lineColor green) (lineColor blue) lineWidth sizeratio position (array of outline vertices)"
	
	| aNewImage newSymbol linecolor linewidth startAnnotation stopAnnotation data |
	newSymbol := self symbolNameOfSelector: selector.
	data := entity perform: selector.
	linecolor := ColorValue
		red: (data at: 1) asNumber
		green: (data at: 2) asNumber
		blue: (data at: 3) asNumber.
	linewidth := (data at: 4) asNumber.
	startAnnotation := data at: 5.	"asBoolean"
	stopAnnotation := data at: 6.	"asBoolean"
	aNewImage := (ArcPOV new)
		lineColor: linecolor;
		lineWidth: linewidth;
		startAnnotation: startAnnotation;
		stopAnnotation: stopAnnotation.
	entity povDict at: newSymbol put: aNewImage
]

{ #category : #deprecated }
Cormas >> loadBitmapImageOf: entity line: line [
	
	| aNewImage newSymbol position |
	newSymbol := (line upTo: Character space) asSymbol.
	(entity class findSelector: (newSymbol asString , 'BitmapImage') asSymbol)
		ifNotNil:
			[position := (line upTo: Character space) asSymbol.
			aNewImage := BitmapPOV
				newFrom:
					(entity perform: (newSymbol asString , 'BitmapImage') asSymbol).
			aNewImage position: position.
			entity povDict at: newSymbol put: aNewImage]
]

{ #category : #'model saving&loading POV' }
Cormas >> loadBitmapPOV: selector ofClass: entity [
	
	| aNewImage newSymbol position data |
	newSymbol := self symbolNameOfSelector: selector.
	data := entity perform: selector.
	(entity class findSelector: (newSymbol asString , 'BitmapImage') asSymbol)
		ifNotNil:
			[position := (data at: 1) asSymbol.
			aNewImage := BitmapPOV
				newFrom:
					(entity perform: (newSymbol asString , 'BitmapImage') asSymbol).
			aNewImage position: position.
			entity povDict at: newSymbol put: aNewImage]
]

{ #category : #'model saving&loading EV' }
Cormas >> loadEV_file [
	"Chargement eventuel des etats visuels des classes du modele"
	
	| evFileName |
	evFileName := (self class modelPath: self cormasModelClass name)
		construct:
			(self cormasModelClass version
				ifNotNil:
					[(self cormasModelClass version tokensBasedOn: $.) first , '.ev']
				ifNil: [self cormasModelClass name , '.ev']).
	evFileName exists
		ifFalse:
			["Facility for models built before november 2002"
			evFileName := (self class modelPath: self cormasModelClass name)
				construct: self cormasModelClass name , '.ev'].
	evFileName exists
		ifTrue:
			[self readVSFile: evFileName	"self cormasModelClass updateVS"	"initializeWithVS"].
	self updateGUI.
	self cormasModelClass visualStateIsOpen: false
]

{ #category : #'model saving&loading EV' }
Cormas >> loadOldImageOf: entity line: line [
	
	| lw nbs t rm ev colR colG colB aNewImage |
	lw := line upTo: Character space.
	lw = 'figurine' ifTrue: [^nil].
	lw := lw asNumber.
	nbs := (line upTo: Character space) asNumber.
	t := (line upTo: Character space) asNumber.	"?"
	rm := (line upTo: Character space) asNumber.
	ev := (line upTo: Character space) asBoolean.
	colR := (line upTo: Character space) asNumber.
	colG := (line upTo: Character space) asNumber.
	colB := (line upTo: Character space) asNumber.
	aNewImage := VectorialElementaryPOV new.
	aNewImage lineWidth: lw nbSegments: nbs sizeRatio: t ev: ev colR: colR
		colG: colG colB: colB.	"load image (old format) as a VectorialPov of the entity"
	entity povDict
		at: entity name
		put: aNewImage.	"set image (old format) as a the defaultImage of the entity"
	entity class
		compile:
			('defaultImage' ,
					'\"defaultImage adapted for Cormas versions previous to 2010. Returns a copy of the POV image stored in the povDict of the class at a specifed symbol key"\^((self povDict keys includes: #'
				, entity name , ') ifTrue:[self povDict at:#' , entity name ,
					'] ifFalse:[super defaultImage]) copy') withCRs
		classified: 'image'
		notifying: nil
]

{ #category : #'model saving&loading EV' }
Cormas >> loadOldImageOfTEMP: entity line: line [
	
	| defaultPovName linewidth nbs sizeRatio rm ev colR colG colB color aNewImage |
	defaultPovName := entity name.
	linewidth := line upTo: Character space.
	linewidth = 'figurine' ifTrue: [^nil].
	linewidth := linewidth asNumber.
	nbs := (line upTo: Character space) asNumber.
	sizeRatio := (line upTo: Character space) asNumber.	"?"
	rm := (line upTo: Character space) asNumber.
	ev := (line upTo: Character space) asBoolean.
	colR := (line upTo: Character space) asNumber.
	colG := (line upTo: Character space) asNumber.
	colB := (line upTo: Character space) asNumber.
	color := ColorValue
		red: colR
		green: colG asNumber
		blue: colB.
	aNewImage := VectorialElementaryPOV new.
	aNewImage lineWidth: linewidth nbSegments: nbs sizeRatio: sizeRatio ev: ev
		colR: colR colG: colG colB: colB.
	self halt.
	^aNewImage	"linecolor := ColorValue red: ((line upTo: Character space) asNumber) green: ((line upTo: Character space) asNumber) blue: ((line upTo: Character space) asNumber). 
	linewidth := (line upTo: Character space) asNumber.
	sizeR := (line upTo: Character space) asNumber.
	position  := (line upTo: Character space) asSymbol.
	line upTo: $(. 
	linevertices := (line upTo: $)). 
	vertiCollec := OrderedCollection new.
	((linevertices tokensBasedOn: (Character space)) do:[:text| |ab| ab := text tokensBasedOn: $@. vertiCollec add: (Point x: ab first asNumber y: ab last asNumber)]).
	aNewImage := classImage newColor: color lineColor: linecolor lineWidth: linewidth sizeRatio: sizeR position: position vertices: vertiCollec asArray.
	entity povDict at: newSymbol put: aNewImage"
]

{ #category : #'model saving&loading POV' }
Cormas >> loadPOVs [
	
	| povType |
	self cormasModelClass cmEnvironment values
		do:
			[:entity | 
			(entity class organization categories includes: #'pov symbols')
				ifTrue:
					[(entity class organization listAtCategoryNamed: #'pov symbols')
						do:
							[:selector | 
							povType := selector readStream upTo: $_.
							povType = 'BitmapPOV'
								ifTrue: [self loadBitmapPOV: selector ofClass: entity].
							povType = 'ArcPOV'
								ifTrue: [self loadArcPOV: selector ofClass: entity].
							povType = 'VectorialPOV'
								ifTrue: [self loadVectorialPOV: selector ofClass: entity].
							povType = 'SpatialEntityPOV'
								ifTrue: [self loadSpatialEntityPOV: selector ofClass: entity]]]].
	self updateGUI.
	self cormasModelClass visualStateIsOpen: false
]

{ #category : #'model saving&loading POV' }
Cormas >> loadSpatialEntityPOV: selector ofClass: entity [
	
	| newSymbol data colR colG colB |
	newSymbol := self symbolNameOfSelector: selector.
	data := entity perform: selector.
	colR := (data at: 1) asNumber.
	colG := (data at: 2) asNumber.
	colB := (data at: 3) asNumber.
	entity colorsDict
		at: newSymbol
		put: (ColorValue red: colR green: colG blue: colB)
]

{ #category : #'model saving&loading EV' }
Cormas >> loadVectorialImage: aClassName of: entity line: line [
	"M√©thode modifi√©e par NB le 10/1/2010"
	"Le format d'enregistrement dans le fichier EV des VectorialImage est √† present de la forme
ClassName VectorialElementaryPOV symbolName (color red) (color green) (color blue) (lineColor red) (lineColor green) (lineColor blue) lineWidth sizeratio position (array of outline vertices)"
	
	| aNewImage classImage newSymbol color linecolor linewidth sizeR position linevertices vertiCollec |
	"on r√©cup√®re le type de VectorialPov associ√© √† ce symbol. En pratique il n'y a que des VectorialElementaryPOV, donc on pourrait se passer des 2 lignes suivantes et dire que classImage est VectorialElementaryPOV. Je laisse comme √ßa au cas o√π par la suite on done la possibilit√© de d√©finir des Vectorialpov pov sur labase d'autres classes que VectorialElementaryPOV"
	classImage := aClassName asSymbol class.
	classImage ifNil: [^nil].	"on r√©cup√®re le symbol et autres √©l√©ments d√©finissant le pov"
	newSymbol := (line upTo: Character space) asSymbol.
	color := ColorValue
		red: (line upTo: Character space) asNumber
		green: (line upTo: Character space) asNumber
		blue: (line upTo: Character space) asNumber.
	linecolor := ColorValue
		red: (line upTo: Character space) asNumber
		green: (line upTo: Character space) asNumber
		blue: (line upTo: Character space) asNumber.
	linewidth := (line upTo: Character space) asNumber.
	sizeR := (line upTo: Character space) asNumber.
	position := (line upTo: Character space) asSymbol.
	line upTo: $(.
	linevertices := line upTo: $).
	vertiCollec := OrderedCollection new.
	(linevertices tokensBasedOn: Character space)
		do:
			[:text | 
			| ab |
			ab := text tokensBasedOn: $@.
			vertiCollec
				add:
					(Point
						x: ab first asNumber
						y: ab last asNumber)].	"on cr√©√© l''instance du pov puis on la charge dans le povDict de l''entite"
	aNewImage := classImage
		newColor: color
		lineColor: linecolor
		lineWidth: linewidth
		sizeRatio: sizeR
		position: position
		vertices: vertiCollec asArray.
	entity povDict at: newSymbol put: aNewImage
]

{ #category : #'model saving&loading POV' }
Cormas >> loadVectorialPOV: selector ofClass: entity [
	"Le format d'enregistrement dans la m√©thode de classe est √† de la forme suivante
(color red) (color green) (color blue) (lineColor red) (lineColor green) (lineColor blue) lineWidth sizeratio position (array of outline vertices)"
	
	| aNewImage newSymbol color linecolor linewidth sizeR position vertiCollec data verticesDecalle a2 |
	"on r√©cup√®re le symbol et autres √©l√©ments d√©finissant le pov"
	newSymbol := self symbolNameOfSelector: selector.
	data := entity perform: selector.
	color := ColorValue
		red: (data at: 1) asNumber
		green: (data at: 2) asNumber
		blue: (data at: 3) asNumber.
	linecolor := ColorValue
		red: (data at: 4) asNumber
		green: (data at: 5) asNumber
		blue: (data at: 6) asNumber.
	linewidth := (data at: 7) asNumber.
	sizeR := (data at: 8) asNumber.
	position := (data at: 9) asSymbol.
	verticesDecalle := (data at: 10) tokensBasedOn: #@.
	vertiCollec := OrderedCollection new.
	verticesDecalle
		do:
			[:a1b2 | 
			a2
				ifNotNil:
					[vertiCollec
						add:
							(Point
								x: a2
								y: (a1b2 at: 1))].
			a2 := a1b2 last].	"on cr√©√© l''instance du pov puis on la charge dans le povDict de l''entite"
	aNewImage := VectorialElementaryPOV
		newColor: color
		lineColor: linecolor
		lineWidth: linewidth
		sizeRatio: sizeR
		position: position
		vertices: vertiCollec asArray.
	data size >= 11 ifTrue: [aNewImage isDistortable: (data at: 11)].
	entity povDict at: newSymbol put: aNewImage
]

{ #category : #simulation }
Cormas >> logLeaveOf: anAgentLocation from: srcSpatialEntity [
	"Log the disparition of an agent from a spatial entity"
	
	self useExternalVisualization
		ifTrue:
			[xmlModel sendLeaveToExternalVisualizerOf: anAgentLocation from:
					srcSpatialEntity].
	self exportPlaybackLog
		ifTrue:
			[xmlModel writeLeaveToPlaybackLogOf: anAgentLocation from: srcSpatialEntity]
]

{ #category : #simulation }
Cormas >> logMovementOf: anAgentLocation from: srcSpatialEntity to: dstSpatialEntity [
	"Log the movement of an agent from a spatial entity to another entity"
	
	useExternalVisualization
		ifTrue:
			[xmlModel sendMoveToExternalVisualizerOf: anAgentLocation from:
					srcSpatialEntity to: dstSpatialEntity].
	exportPlaybackLog
		ifTrue:
			[xmlModel writeMoveToPlaybackLogOf: anAgentLocation from: srcSpatialEntity
				to: dstSpatialEntity]
]

{ #category : #accessing }
Cormas >> mainBuilder [
	
	^mainBuilder
]

{ #category : #accessing }
Cormas >> mainBuilder: anObject [
	
	mainBuilder := anObject
]

{ #category : #accessing }
Cormas >> mainWin [
	
	^mainWin
]

{ #category : #accessing }
Cormas >> mainWin: anObject [
	
	mainWin := anObject
]

{ #category : #video }
Cormas >> makeVideo [
	"ask spaceInterfaces for making video"
	
	self spaceModel
		snapGridTimeForMovie: self stepCounter value
		makingMovie: self cormasModel currentSimulationEnded	"self spaceInterfaces do: 
			[:spaceInterface | 
			spaceInterface snapGridTimeForMovie: self stepCounter value.
			self currentSimulation currentSimulationEnded ifTrue: [spaceInterface makeMovie]]"
]

{ #category : #accessing }
Cormas >> menuHolder [
	
	menuHolder ifNil: [menuHolder := self class mainMenu asValue].
	^menuHolder
]

{ #category : #accessing }
Cormas >> menuHolder: anObject [
	
	menuHolder := anObject
]

{ #category : #aspects }
Cormas >> modelName [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^modelName isNil
		ifTrue: [modelName := String new asValue]
		ifFalse: [modelName]
]

{ #category : #aspects }
Cormas >> modelName: aString [
	
	modelName := aString
]

{ #category : #aspects }
Cormas >> modelNameField [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^modelNameField isNil
		ifTrue: [modelNameField := String new asValue]
		ifFalse: [modelNameField]
]

{ #category : #'model entities' }
Cormas >> modifyEntityClassType: aType [
	"aType is either 'Spatial', 'Social' or 'Passive'"
	
	| aClass |
	aClass := self getSelectedEntityClassType: aType.
	aClass isNil ifFalse: [self edit: aClass onProtocol: #control]
]

{ #category : #'model entities' }
Cormas >> modifyPassiveEntityClass [
	
	self modifyEntityClassType: 'Passive'
]

{ #category : #'model entities' }
Cormas >> modifyPassiveEntityClassAttributes [
	
	| aClass |
	aClass := self getSelectedEntityClassType: 'Passive'.
	aClass isNil ifFalse: [self editAttributesClass: aClass]
]

{ #category : #'model entities' }
Cormas >> modifyPassiveEntityClassMethods [
	
	self modifyEntityClassType: 'Passive'
]

{ #category : #'model entities' }
Cormas >> modifyPassiveEntityDiagram [
	"Set target class as Abstract or Concret class. "
	
	| aClass |
	aClass := self getSelectedEntityClassType: 'Passive'.
	aClass isNil ifFalse: [aClass chooseActivityDiagramEditorToOpen]
]

{ #category : #'model entities' }
Cormas >> modifyPassiveEntityPoVSetter [
	
	| aClass |
	aClass := self getSelectedEntityClassType: 'Passive'.
	aClass isNil
		ifFalse:
			[self openPovSetterGUI.
			self visualStateWin controller model majorKeys selection: aClass name]
]

{ #category : #'model entities' }
Cormas >> modifyScedulerDiagram [
	"Set target class as Abstract or Concret class. "
	
	self cormasModelClass chooseActivityDiagramEditorToOpen
]

{ #category : #'model entities' }
Cormas >> modifySchedulerAttributes [
	
	self editAttributesClass: self cormasModelClass
]

{ #category : #'model entities' }
Cormas >> modifySocialEntityClass [
	
	self modifyEntityClassType: 'Social'
]

{ #category : #'model entities' }
Cormas >> modifySocialEntityClassAttributes [
	
	| aClass |
	aClass := self getSelectedEntityClassType: 'Social'.
	aClass isNil ifFalse: [self editAttributesClass: aClass]
]

{ #category : #'model entities' }
Cormas >> modifySocialEntityClassMethods [
	
	self modifyEntityClassType: 'Social'
]

{ #category : #'model entities' }
Cormas >> modifySocialEntityDiagram [
	"Set target class as Abstract or Concret class. "
	
	| aClass |
	aClass := self getSelectedEntityClassType: 'Social'.
	aClass isNil ifFalse: [aClass chooseActivityDiagramEditorToOpen]
]

{ #category : #'model entities' }
Cormas >> modifySocialEntityPoVSetter [
	
	| aClass |
	aClass := self getSelectedEntityClassType: 'Social'.
	aClass isNil
		ifFalse:
			[self openPovSetterGUI.
			self visualStateWin controller model majorKeys selection: aClass name]
]

{ #category : #'model entities' }
Cormas >> modifySpatialEntityClass [
	
	self modifyEntityClassType: 'Spatial'
]

{ #category : #'model entities' }
Cormas >> modifySpatialEntityClassAttributes [
	
	| aClass |
	aClass := self getSelectedEntityClassType: 'Spatial'.
	aClass isNil ifFalse: [self editAttributesClass: aClass]
]

{ #category : #'model entities' }
Cormas >> modifySpatialEntityClassMethods [
	
	self modifyEntityClassType: 'Spatial'
]

{ #category : #'model entities' }
Cormas >> modifySpatialEntityDiagram [
	"Set target class as Abstract or Concret class. "
	
	| aClass |
	aClass := self getSelectedEntityClassType: 'Spatial'.
	aClass isNil ifFalse: [aClass chooseActivityDiagramEditorToOpen]
]

{ #category : #'model entities' }
Cormas >> modifySpatialEntityPoVSetter [
	
	| aClass |
	aClass := self getSelectedEntityClassType: 'Spatial'.
	aClass isNil
		ifFalse:
			[self openPovSetterGUI.
			self visualStateWin controller model majorKeys selection: aClass name]
]

{ #category : #'main menu' }
Cormas >> newModel [
	
	| nomM |
	(nomM := self request: self alertModelName) isEmpty ifTrue: [^self].
	nomM beMutable.
	nomM
		at: 1
		put: nomM first asUppercase.
	nomM := Cormas checkIfNameContainsBlank: nomM.
	((Kernel includesKey: nomM asSymbol)
		or:
			[(Kernel includesKey: nomM asSymbol) or: [Core includesKey: nomM asSymbol]])
		ifTrue:
			[self alert_NameAlreadyExist.
			^self newModel].
	self cormasModelClass notNil
		ifTrue:
			[self cormasModelClass visualStateIsOpen
				ifTrue: [self visualStateWin closeRequest]].
	self closeModel.	" le modele courant est ferme, on peut en creer un autre"
	self cormasModelClass: (self createClassModelNamed: nomM).
	self packagingNamespace: self cormasModelClass environment.
	self cormasModelClass createDefaultMethods.
	self cormasModelClass initialize.
	self cormasModel: self cormasModelClass new.
	self
		setModelVersionEqualTo: (self cormasModelClass name , '.st') asFilename.
	self updateGUI.
	self modelName: nomM asSymbol.
	self dependents first label: 'Cormas [' , nomM , ']'.
	self setModelComments
]

{ #category : #'interface closing' }
Cormas >> noticeOfWindowClose: aWindow [
	"one of my window was closed"
	
	aWindow == self simulationWin ifTrue: [self simulationWin: nil].
	aWindow == self defineEntityWin ifTrue: [self defineEntityWin: nil].
	^super noticeOfWindowClose: aWindow
]

{ #category : #accessing }
Cormas >> obsWin [
	
	^obsWin
]

{ #category : #accessing }
Cormas >> obsWin: x [
	
	obsWin := x
]

{ #category : #'main menu' }
Cormas >> openAddOnManager [
	
	AddOnManager isWinOpen ifFalse: [AddOnManager new openOn: self]
]

{ #category : #'main menu' }
Cormas >> openAddOnsWebPage [
	
	self warn:
			'Visite the Cormas AddOns page at http://cormas.cirad.fr/AddOns'
]

{ #category : #visualisation }
Cormas >> openCharts [
	
	self cormasModelClass isNil ifTrue: [^self alert_NewModel].
	self cormasModel cormas isNil
		ifTrue: [^self warn: 'The model should be initialized at least once'].
	self displayChartsWin add: ChartsInterface new.
	self displayChartsWin last initialize: self cormasModel.	"time: self stepCounter value."
	self displayChartsWin last open
]

{ #category : #visualisation }
Cormas >> openChartsOn: id [
	
	self halt.
	self cormasModelClass isNil ifTrue: [^self alert_NewModel].
	self displayChartsWin: ChartsInterface new.
	self displayChartsWin initialize: self cormasModel.	"time: self stepCounter value."
	self displayChartsWin openOn: id
]

{ #category : #'main menu' }
Cormas >> openCormasGlossary [
	
	| allClasses |
	allClasses := OrderedCollection new.
	allClasses add: Cormas.
	allClasses add: CormasModel.
	allClasses
		addAll:
			('Cormas-Core' asPackage classTagNamed: 'Entities') classes.
	^self openCormasGlossaryClasses: allClasses
]

{ #category : #'main menu' }
Cormas >> openCormasGlossaryClasses: aCollec [
	"Purpose: opens Cormas glossary window on hierarchy of classes based on a given superclass"
	
	ComposedTextView
		open: (self class reportTextForClasses: aCollec) asValue
		label: 'Cormas Glossary for ' , aCollec first name asString
		icon: (Icon constantNamed: #workspace)
		extent: 800 @ 700
]

{ #category : #'main menu' }
Cormas >> openCormasGlossary_Cormas [
	
	^self openCormasGlossaryClasses: (Array with: Cormas)
]

{ #category : #'main menu' }
Cormas >> openCormasGlossary_CormasModel [
	
	^self openCormasGlossaryClasses: (Array with: CormasModel)
]

{ #category : #'main menu' }
Cormas >> openCormasGlossary_Entity [
	
	| entityClasses |
	entityClasses := ('Cormas-Core' asPackage classTagNamed: 'Entities') classes.
	entityClasses remove: Entity.
	entityClasses addFirst: Entity.
	entityClasses
		remove: CMGroupComm;
		remove: CMAgentCommLocation;
		remove: CMGroupCommLocation;
		remove: CMGroupLocation.
	^self openCormasGlossaryClasses: entityClasses
]

{ #category : #'model manipulation' }
Cormas >> openCreateInstances [
	
	self cormasModelClass isNil ifTrue: [^self alert_NewModel].
	CreateInstances new openOn: self cormasModel
]

{ #category : #'interface actions' }
Cormas >> openCrossedSensitivityGUI [
	"Open the Crossed sensitivity GUI for sequential values"
	
	self openSensitivityGUI: SequentialCrossedAnalysis
]

{ #category : #'model scheduling' }
Cormas >> openDefineSchedulerWin [
	
	self cormasModelClass isNil
		ifTrue: [^self alert_NewModel]
		ifFalse: [self edit: self currentModel]
]

{ #category : #'model scheduling' }
Cormas >> openDefineSchedulerWinControl [
	
	self cormasModelClass isNil
		ifTrue: [^self alert_NewModel]
		ifFalse:
			[self
				edit: self cormasModelClass
				pov: #step:]
]

{ #category : #'model scheduling' }
Cormas >> openDefineSchedulerWinInit [
	
	self cormasModelClass isNil
		ifTrue: [^self alert_NewModel]
		ifFalse:
			[self
				edit: self cormasModelClass
				pov: #init]
]

{ #category : #remoting }
Cormas >> openDistributionControl [
	
	self cormasModel
		ifNil:
			[^Dialog warn:
					'A model must be loaded to open the Distribution window manager'].
	^self distributionControl reopen
]

{ #category : #'interface actions' }
Cormas >> openDistributionListCrossedGUI [
	"Open the DistributionList Crossed sensitivity GUI "
	
	self openSensitivityGUI: DistributionListCrossedAnalysis
]

{ #category : #'interface actions' }
Cormas >> openDistributionListOATGUI [
	"Open the DistributionList OAT sensitivity GUI "
	
	self openSensitivityGUI: DistributionListOAT
]

{ #category : #'model manipulation' }
Cormas >> openManipulationGUI [
	
	self cormasModelClass isNil ifTrue: [^self alert_NewModel].	"	ManipulateInstances isWinOpen ifFalse:["	"x := "
	ManipulateInstances new openOn: self cormasModel	"x cormas: self]"
]

{ #category : #'model manipulation' }
Cormas >> openManipulationSetterGUI [
	
	self cormasModelClass isNil ifTrue: [^self alert_NewModel].
	ManipulationSetter new openOn: self cormasModelClass
]

{ #category : #'main menu' }
Cormas >> openModel: aModel [
	
	aModel isNil ifTrue: [^nil].
	self cormasModelClass: aModel.	"self cormasModelClass initialize."
	self cormasModelClass allEntityClasses isNil
		ifTrue: [self cormasModelClass initialize].
	self updateGUI.
	self cormasModelClass visualStateIsOpen: false.
	self cormasModel: self cormasModelClass newSimulation.
	self resetSimulation
]

{ #category : #'main menu' }
Cormas >> openModelGlossary [
	"open a glossary containing a list of the methods (and their comments) of the model"
	
	| allClasses |
	self cormasModelClass isNil ifTrue: [^self warn: 'Please, load a model'].
	allClasses := OrderedCollection new.
	allClasses add: self cormasModelClass.
	allClasses addAll: self cormasModelClass allEntityClasses.
	^self openCormasGlossaryClasses: allClasses
]

{ #category : #'interface actions' }
Cormas >> openOATclassifierGUI [
	"Open the OAT classifier GUI "
	
	self openSensitivityGUI: ClassifyParameter
]

{ #category : #'interface actions' }
Cormas >> openOATsensitivityGUI [
	"Open the OAT sensitivity GUI "
	
	self openSensitivityGUI: SequentialOAT
]

{ #category : #'interface actions' }
Cormas >> openParamatersGUI [
	"Open the Parameters GUI (in SimulationsManagers class)"
	
	self cormasModel isNil ifTrue: [^self alert_NewModel].
	self cormasModel openDataSetterInterface
]

{ #category : #'model scheduling' }
Cormas >> openParametersWin [
	
	^self simManager isNil
		ifTrue: [nil]
		ifFalse: [self simManager open]
]

{ #category : #'interface actions' }
Cormas >> openRandomCrossedSensitivityGUI [
	"Open the MonteCarlo Crossed sensitivity GUI "
	
	self halt.
	self openSensitivityGUI: MonteCarloOAT
]

{ #category : #'interface actions' }
Cormas >> openRandomOATsensitivityGUI [
	"Open the MonteCarlo OAT sensitivity GUI "
	
	self openSensitivityGUI: MonteCarloOAT
]

{ #category : #'model scheduling' }
Cormas >> openReplayWin [
	
	self cormasModelClass isNil ifTrue: [^self alert_NewModel].
	process isNil
		ifFalse:
			[process terminate.
			process := nil].
	self simManager openReplayWin
]

{ #category : #'model scheduling' }
Cormas >> openScenarioBuilderWin [
	
	self cormasModelClass isNil ifTrue: [^self alert_NewModel].
	process isNil
		ifFalse:
			[process terminate.
			process := nil].
	self simManager openScenarioBuilderWin
]

{ #category : #'interface actions' }
Cormas >> openSensitivityGUI: aSensitivityClass [
	"Open the aSensitivityClass GUI "
	
	| gui |
	self cormasModelClass isNil ifTrue: [^self alert_NewModel].
	self cormasModel defaultAttributesSetter modifiedAttribute isEmpty
		ifFalse:
			[(Dialog confirm:
					'Some attributes have been modified.
Before the analysis, Cormas will set them to their default values, OK?')
				ifFalse: [^nil]
				ifTrue: [self cormasModel defaultAttributesSetter backToDefaultValues]].
	gui := self cormasModel openSensitivityInterface: aSensitivityClass.
	gui cormas: self
]

{ #category : #'interface actions' }
Cormas >> openSimpleStochasticAnalysisGUI [
	"Open the SimpleStochasticAnalysis GUI"
	
	self openSensitivityGUI: SimpleStochasticAnalysis
]

{ #category : #'interface actions' }
Cormas >> openSimulationGUI [
	"Open the Simulation GUI. Now theSimulationGUI is a subCanvas of main application"
	
	| subcanvas spec |
	self cormasModelClass isNil ifTrue: [^self alert_NewModel].	"Ancienne version avec petite fenetre ind√©pendante."	"self simulationWin isNil 
		ifTrue: [self simulationWin: (self class openOn: self withSpec: #simulationWindow) window]
		ifFalse: [(self simulationWin) raise; expand]."
	subcanvas := self mainBuilder componentAt: #subcanvasSim.
	subcanvas isVisible
		ifTrue:
			[self resizeWindowToMin.
			subcanvas beInvisible]
		ifFalse:
			[self resizeWindowToMax.
			subcanvas beVisible.
			spec := self class interfaceSpecFor: #simulationWindow.
			subcanvas := subcanvas widget.
			subcanvas
				client: self
				spec: spec
				builder: self mainBuilder	"subcanvas client: self spec: spec"]	"	spec := self class interfaceSpecFor: #simulationWindow.
	subcanvas := (self builder componentAt: #subcanvasSim) widget.
	subcanvas client: self spec: spec builder: self mainBuilder."	"
	subcanvas client: self spec: spec.
	(self mainBuilder componentAt: #runBackButton) disable."
]

{ #category : #visualisation }
Cormas >> openSpatialGrid [
	
	self cormasModelClass isNil ifTrue: [^self alert_NewModel].
	self cormasModelClass spatialClasses isEmpty
		ifTrue: [^self alert_NoSpatialEntity].
	self spaceModel ifNil: [self cormasModel initializeSpaceModel].	"^self spaceInterfaces add: (SpaceInterface openAndDisplay: self currentSimulation spaceModel)"	"removing spaceInterfaces from Cormas (event are now propagated by spacemodel changes)"
	^SpaceInterface openAndDisplay: self cormasModel spaceModel
]

{ #category : #visualisation }
Cormas >> openVisuCommunications [
	
	self cormasModelClass isNil ifTrue: [^self alert_NewModel].
	self cormasModelClass commClasses isEmpty ifTrue: [^self alertNoComm].
	Dialog warn: 'Under reconstruction'	"
	self currentSimulation isNil
		ifTrue: [self currentSimulation: self cormasModelClass new].
self currentSimulation channel isNil ifTrue: [ self initializeChannel].
	largeurFenPrincipale := self builder window width.
	self obsWin isNil
		ifTrue: 
			[self
				obsWin: (FonctionObs populationSource: self currentSimulation channel population
						at: largeurFenPrincipale).
		self currentSimulation channel addFonctionObs: self obsWin.
			self obsWin msgObs: self cormasModelClass messages]
		ifFalse: [self obsWin reinitializeAt: largeurFenPrincipale]"
]

{ #category : #'user messages' }
Cormas >> openedSpatialGridsForHabitus: aString [
	
	^self cormasModel openedSpatialGridsForHabitus: aString
]

{ #category : #'user messages' }
Cormas >> openedSpatialsGrids [
	"access the actual openened space interfaces"
	
	^self cormasModel openedSpatialsGrids
]

{ #category : #'model saving&loading' }
Cormas >> prepareSavingAs: extensionFile [
	"Prepare the exportation of the model as ST file or Parcel, according to extensionFile. The user can choose the file name and also the version of the model as a consequence.
Return a filename or nil.
extensionFile = <String>  ex: '.st' or '.pcl' "
	
	| fileName defaultFileName |
	(self cormasModelClass version = 'v-0'
		or: [self cormasModelClass version isNil])
		ifTrue:
			[defaultFileName := (self class modelPath: self cormasModelClass name)
				construct: self cormasModelClass name asString , extensionFile]
		ifFalse:
			[defaultFileName := (self class modelPath: self cormasModelClass name)
				construct: self cormasModelClass version.
			defaultFileName := ((Cormas removeExtensionOf: defaultFileName) asString
				, extensionFile) asFilename].
	fileName := Dialog
		requestNewFileName:
			(UserMessage defaultString: 'Save as' key: #saveas) asString
		default: defaultFileName.
	fileName = '' ifTrue: [^nil].
	self setModelVersionEqualTo: fileName asFilename.
	self cormasModelClass
		setDescriptionFor: 'lastUpdate'
		withText: Date today printString.
	self cormasModelClass updateComments.
	self updateGUI.
	^fileName asFilename
]

{ #category : #accessing }
Cormas >> process [
	
	^process
]

{ #category : #accessing }
Cormas >> process: x [
	
	process := x
]

{ #category : #'model saving&loading EV' }
Cormas >> readVSFile: evFileName [
	
	| stream entity line methodName colR colG colB newSymbol end key classExist image |
	stream := evFileName asFilename readStream.	"On devine le format des lignes"
	stream lineEndAuto.
	["Lecture du fichier, ligne par ligne"
	stream atEnd]
		whileFalse:
			[line := (stream upTo: Character cr) readStream.
			key := (line upTo: Character space) asSymbol.
			classExist := true.
			entity := self cormasModelClass environment
				at: key
				ifAbsent: [classExist := false].
			classExist
				ifTrue:
					[methodName := line upTo: Character space.
					methodName = 'image'
						ifTrue: [image := self loadOldImageOf: entity line: line].
					(methodName ~= 'image' and: [methodName ~= 'dicoCouleur'])
						ifTrue:
							[methodName = 'Bitmap' ifTrue: [self loadBitmapImageOf: entity line: line].
							methodName = 'ArcPOV'
								ifTrue: [self loadArcImageOf: entity line: line]
								ifFalse:
									[self loadVectorialImage: methodName of: entity line: line]	"en fait c'est le nom de la classe"].
					methodName = 'dicoCouleur'
						ifTrue:
							[end := line upTo: Character space.
							end isEmpty
								ifFalse:
									[newSymbol := end asSymbol.
									colR := (line upTo: Character space) asNumber.
									colG := (line upTo: Character space) asNumber.
									colB := (line upTo: Character space) asNumber.
									entity colorsDict
										at: newSymbol
										put: (ColorValue red: colR green: colG blue: colB).
									(methodName = 'image' and: [image isNotNil])
										ifTrue:
											["Adaptation Cormas 2005: l'image stock√©e dans 'image' est recopi√©e dans povDict avec la cl√© newSymbol"
											entity povDict at: newSymbol put: image]]]].
			line close].
	stream close
]

{ #category : #'model saving&loading EV' }
Cormas >> readVSFileOLD: evFileName [
	
	| stream entity line methodName colR colG colB newSymbol end key classExist image |
	stream := evFileName asFilename readStream.	"On devine le format des lignes"
	stream lineEndAuto.
	["Lecture du fichier, ligne par ligne"
	stream atEnd]
		whileFalse:
			[line := (stream upTo: Character cr) readStream.
			key := (line upTo: Character space) asSymbol.
			classExist := true.
			entity := self cormasModelClass environment
				at: key
				ifAbsent: [classExist := false].
			classExist
				ifTrue:
					[methodName := line upTo: Character space.
					methodName = 'image'
						ifTrue: [image := self loadOldImageOf: entity line: line].
					(methodName ~= 'image' and: [methodName ~= 'dicoCouleur'])
						ifTrue:
							[methodName = 'Bitmap'
								ifTrue: [self loadBitmapImageOf: entity line: line]
								ifFalse:
									[self loadVectorialImage: methodName of: entity line: line]	"en fait c'est le nom de la classe"].
					methodName = 'dicoCouleur'
						ifTrue:
							[end := line upTo: Character space.
							end isEmpty
								ifFalse:
									[newSymbol := end asSymbol.
									colR := (line upTo: Character space) asNumber.
									colG := (line upTo: Character space) asNumber.
									colB := (line upTo: Character space) asNumber.
									entity colorsDict
										at: newSymbol
										put: (ColorValue red: colR green: colG blue: colB).
									(methodName = 'image' and: [image isNotNil])
										ifTrue:
											["Adaptation Cormas 2005: l'image stock√©e dans 'image' est recopi√©e dans povDict avec la cl√© newSymbol"
											entity povDict at: newSymbol put: image]]]].
			line close].
	stream close
]

{ #category : #'interface actions' }
Cormas >> reduceWindowToMinSize [
	"set the window size to its min"
	
	
]

{ #category : #accessing }
Cormas >> reducedCommandsBar [
	
	^reducedCommandsBar
]

{ #category : #accessing }
Cormas >> reducedCommandsBar: x [
	
	reducedCommandsBar := x
]

{ #category : #visualisation }
Cormas >> refreshCharts [
	
	self displayChartsWin do: [:aChart | aChart refreshAfterStep].
	Dev todo: 'change this system with a dependence to timestepvalue'.
	HistogramsInterface allInstances do: [:aChart | aChart refreshAfterStep]
]

{ #category : #'initialize-release' }
Cormas >> release [
	
	super release.	"Clean up the xmlModel"
	xmlModel isNil
		ifFalse:
			[xmlModel release.
			xmlModel := nil]
]

{ #category : #simulation }
Cormas >> releaseProcess [
	
	process isNil
		ifFalse:
			[process terminate.
			process := nil].	"self runButtonLabel: 'Run'"
	self runButtonRun
]

{ #category : #util }
Cormas >> removeBrackets: aNom [
	"inutile avec Cormas2000"
	
	| index unNom |
	aNom isNil ifTrue: [^nil].
	index := aNom findFirst: [:aChar | aChar = $(].
	unNom := aNom
		changeFrom: index - 1
		to: aNom size
		with: ''.
	^unNom
]

{ #category : #'model entities' }
Cormas >> removeEntityClassType: aType [
	"aType is either 'Spatial', 'Social' or 'Passive'"
	
	| classToBeRemoved selectionInList selector answer |
	selectionInList := self perform: ('list' , aType , 'Entities') asSymbol.
	classToBeRemoved := self getSelectedEntityClassType: aType.
	selector := ((Cormas lowerCaseString: aType) , 'Classes') asSymbol.
	classToBeRemoved isNil ifTrue: [^nil].
	answer := classToBeRemoved withAllSubclasses size > 1
		ifFalse:
			[self confirm: 'Delete the class ' , classToBeRemoved name asString , ' ?']
		ifTrue:
			[| sousClasses |
			sousClasses := ''.
			classToBeRemoved allSubclasses
				do: [:cl | sousClasses := sousClasses , '   ' , cl name asString , '\'].
			self
				confirm:
					('Delete the class ' , classToBeRemoved name asString ,
							' and the following subclasses ? \' , sousClasses) withCRs].
	answer ifFalse: [^nil].
	((OrderedCollection with: classToBeRemoved)
		addAll: classToBeRemoved allSubclasses;
		yourself)
		do:
			[:cl | 
			(self cormasModelClass perform: selector) remove: cl.
			self removeModelAccessors: cl name asString].
	classToBeRemoved = self cormasModelClass cellClass
		ifTrue: [self cormasModelClass cellClass: nil].
	classToBeRemoved removeFromSystem.
	selectionInList list: (self getSortedListEntityClassType: aType).
	selectionInList selectionIndex: 0
]

{ #category : #'model entities' }
Cormas >> removeModelAccessors: aName [
	
	| pop |
	pop := 'the' , aName , 's'.
	(self cormasModelClass instVarNames includes: pop)
		ifTrue: [self cormasModelClass removeInstVarName: pop].
	(self cormasModelClass selectors includes: pop asSymbol)
		ifTrue: [self cormasModelClass removeSelector: pop asSymbol].
	(self cormasModelClass selectors includes: (pop , ':') asSymbol)
		ifTrue: [self cormasModelClass removeSelector: (pop , ':') asSymbol].
	(self cormasModelClass selectors
		includes: ('allThe' , aName , 's') asSymbol)
		ifTrue:
			[self cormasModelClass removeSelector: ('allThe' , aName , 's') asSymbol]
]

{ #category : #util }
Cormas >> removeParentheses: aNom [
	"inutile avec Cormas2000"
	
	| index unNom |
	aNom isNil ifTrue: [^nil].
	index := aNom findFirst: [:aChar | aChar = $(].
	unNom := aNom
		changeFrom: index - 1
		to: aNom size
		with: ''.
	^unNom
]

{ #category : #'model entities' }
Cormas >> removePassiveEntityClass [
	
	self removeEntityClassType: 'Passive'
]

{ #category : #'model entities' }
Cormas >> removeSocialEntityClass [
	
	self removeEntityClassType: 'Social'
]

{ #category : #accessing }
Cormas >> removeSpaceInterface: aSpaceInterface [
	
	self spaceInterfaces
		remove: aSpaceInterface
		ifAbsent: []
]

{ #category : #'model entities' }
Cormas >> removeSpatialEntityClass [
	
	self removeEntityClassType: 'Spatial'
]

{ #category : #'model entities' }
Cormas >> renameClass: aClass [
	
	| newName oldName |
	oldName := aClass name asString.
	newName := self askUserTheClassNameWithDefaultValue: oldName.
	newName isNil ifTrue: [^nil].
	[aClass renameAndFixSourceTo: newName]
		on: Error
		do:
			[:ex | 
			self warn: ex messageText.
			^self renameClass: aClass].
	^aClass
]

{ #category : #'model entities' }
Cormas >> renameEntityClass: aClass entitiesList: listSymbol [
	
	| newName oldName result |
	"get the new name"
	oldName := aClass name.
	result := self renameClass: aClass.
	result isNil ifTrue: [^nil].
	newName := result name.
	newName isEmpty ifTrue: [^nil].	"Change attribut name at the level of CormasModel (ex: theCells by theLandUnits)"
	(self alert_ChangeAccessors: oldName by: newName)
		ifTrue:
			[self cormasModelClass
				renameAttribute: 'the' , oldName , 's'
				by: 'the' , newName , 's'.	"Change accessors name at the level of CormasModel (ex: theCells by theLandUnits)"
			self cormasModelClass
				renameSelector: 'the' , oldName , 's'
				by: 'the' , newName , 's'
				inputParametersNumber: 0.
			self cormasModelClass
				renameSelector: 'the' , oldName , 's:'
				by: 'the' , newName , 's:'
				inputParametersNumber: 1].	"change the lists (ex: listSymbol = #listSpatialEntities)"
	(self perform: listSymbol) list add: newName.
	(self perform: listSymbol) list remove: oldName.
	(self perform: listSymbol) selectionIndex: 0.
	listSymbol = #listPassiveEntities
		ifTrue: [self listEntitesPassivesChanged].
	listSymbol = #listSocialEntities ifTrue: [self listAgentsChanged].
	listSymbol = #listSpatialEntities
		ifTrue:
			[self listEntitesSpatialesChanged.
			self warnCormasModelThat: oldName changeTo: aClass].
	^aClass
]

{ #category : #'model entities' }
Cormas >> renameEntityClass: aClass type: aType [
	
	| newName oldName result |
	oldName := aClass name.
	result := self renameClass: aClass.
	result isNil ifTrue: [^nil].
	newName := result name.
	newName isEmpty ifTrue: [^nil].	"Change attribute znd its accessors names at the level of CormasModel (ex: theCells by theLandUnits)"
	(self alert_ChangeAccessors: oldName by: newName)
		ifTrue:
			[self cormasModelClass
				renameAttribute: 'the' , oldName , 's'
				by: 'the' , newName , 's'.
			self cormasModelClass
				renameSelector: 'the' , oldName , 's'
				by: 'the' , newName , 's'
				inputParametersNumber: 0.
			self cormasModelClass
				renameSelector: 'the' , oldName , 's:'
				by: 'the' , newName , 's:'
				inputParametersNumber: 1].
	(self perform: ('list' , aType , 'Entities') asSymbol)
		list: (self getSortedListEntityClassType: aType).
	(self perform: ('list' , aType , 'Entities') asSymbol) selectionIndex: 0.
	self warnCormasModelThat: oldName changeTo: aClass.
	^aClass
]

{ #category : #'model entities' }
Cormas >> renameEntityClassType: aType [
	"aType is either 'Spatial', 'Social' or 'Passive'"
	
	| aClass |
	aClass := self getSelectedEntityClassType: aType.
	(aClass notNil and: [self changeRequest])
		ifTrue: [self renameEntityClass: aClass type: aType].
	^aClass
]

{ #category : #'model entities' }
Cormas >> renamePassiveEntityClass [
	
	self renameEntityClassType: 'Passive'
]

{ #category : #'model entities' }
Cormas >> renamePassiveEntityClass: aClass [
	
	^self renameEntityClass: aClass entitiesList: #listPassiveEntities
]

{ #category : #'model entities' }
Cormas >> renameSocialEntityClass [
	
	self renameEntityClassType: 'Social'
]

{ #category : #'model entities' }
Cormas >> renameSocialEntityClass: aClass [
	
	^self renameEntityClass: aClass entitiesList: #listSocialEntities
]

{ #category : #'model entities' }
Cormas >> renameSpatialEntityClass [
	
	self renameEntityClassType: 'Spatial'
]

{ #category : #'model entities' }
Cormas >> renameSpatialEntityClass: aClass [
	
	^self renameEntityClass: aClass entitiesList: #listSpatialEntities
]

{ #category : #simulation }
Cormas >> replayRunForward [
	"Replay the stored simulation history forward using BOS file"
self halt.
	^ self simManager replayRunForward
]

{ #category : #simulation }
Cormas >> replayStepForward [
	"Replay a step forward using BOS file"
self halt.
	^ self simManager replayStepForward
]

{ #category : #'binary storage' }
Cormas >> representBinaryOn: bos [
	
	self halt
]

{ #category : #'user messages' }
Cormas >> request: msgString [
	
	^Dialog request: msgString
]

{ #category : #'user messages' }
Cormas >> request: msgString initialAnswer: initialString [
	
	^Dialog request: msgString initialAnswer: initialString
]

{ #category : #'user messages' }
Cormas >> request: aMessage initialAnswer: initialString then: aBlock [
	"request the user then evaluate aBlock with the result
	this is used for compatibility with spatialGrids for distributed cormas
	no return are expected"
	
	| answer |
	answer := Dialog request: aMessage initialAnswer: initialString.
	aBlock value: answer
]

{ #category : #'user messages' }
Cormas >> request: aMessage initialAnswer: initialString toHabitus: aHabitusName [
	
	^(self targetForHabitus: aHabitusName) request: aMessage initialAnswer:
			initialString
]

{ #category : #'user messages' }
Cormas >> request: aMessage initialAnswer: initialString toHabitus: aHabitusName elseTo: anotherHabitusName [
	
	^(self targetForHabitus: aHabitusName or: anotherHabitusName) request:
			aMessage initialAnswer: initialString
]

{ #category : #'user messages' }
Cormas >> request: aMessage initialAnswer: initialString toHabitus: aHabitusName elseTo: anotherHabitusName then: aBlock [
	
	^(self targetForHabitus: aHabitusName or: anotherHabitusName) request:
			aMessage initialAnswer: initialString then: aBlock
]

{ #category : #'user messages' }
Cormas >> request: aMessage toHabitus: aHabitusNameAsString [
	
	^(self targetForHabitus: aHabitusNameAsString) request: aMessage
]

{ #category : #'user messages' }
Cormas >> request: aMessage toHabitus: aHabitusName elseTo: anotherHabitusName [
	
	^(self targetForHabitus: aHabitusName or: anotherHabitusName) request:
			aMessage
]

{ #category : #'interface actions' }
Cormas >> requestForWindowClose [
	"This is a callback method"
	
	self uiSession activeController
		ifNotNil:
			[:ctrl | 
			ctrl view = self mainWin
				ifTrue: [self closeDialog == false ifTrue: [^false]]].
	^super requestForWindowClose
]

{ #category : #'main menu' }
Cormas >> resetSimulation [
	
	self cycle value: 0.
	self stepCounter value: 0
]

{ #category : #'interface actions' }
Cormas >> resizeWindowToMax [
	"set the window size to its max"
	
	| win orig ext hg |
	win := self mainBuilder window.
	orig := win globalOrigin.
	hg := (self mainBuilder componentAt: #subcanvasSim) bounds height.
	ext := win bounds extent + (0 @ hg).
	win displayBox: (orig extent: ext)
]

{ #category : #'interface actions' }
Cormas >> resizeWindowToMin [
	"set the window size to its min"
	
	| win orig ext subC |
	subC := self mainBuilder componentAt: #subcanvasSim.
	subC bounds extent.
	win := self mainBuilder window.
	orig := win globalOrigin.
	ext := win bounds extent
		- (0 @ (self mainBuilder componentAt: #subcanvasSim) bounds height).
	win displayBox: (orig extent: ext rounded).	"m'emmerde ce bandeau qui devient blanc l√† haut..."
	self mainWin label:
			'Cormas [                                                                                                                                                                                                                       ]'.
	self mainWin label: 'Cormas [' , self cormasModelClass name , ']'.	"win moveTo: 44@44. win moveTo: orig."
	win
		display;
		refresh
]

{ #category : #simulation }
Cormas >> run [
	"Run the current  simulation. Threaded process"
self halt.
	self cormasModelClass isNil
		ifTrue: [ ^ nil ].
	self cormasModel activeControl isNil
		ifTrue: [ ^ self alert_NoDynamic ].
	self stepCounter value = self cycle value
		ifTrue: [ ^ nil ].	"for old cormas versions"
	(self cormasModel activeControl asString tokensBasedOn: $:) size = 3
		ifTrue: [ ^ self runNSimulations_old ].	"*******  RUN  threaded *******"
	self simManager runSimulationThreaded
]

{ #category : #simulation }
Cormas >> runBack [
	"Perform a run back to 0 using BOS file"
self halt.
	^ self simManager runBack
]

{ #category : #'model scheduling' }
Cormas >> runButtonLabel: aString [
	"(self builder componentAt: #runButton) isNil ifFalse:[(self builder componentAt: #runButton) labelString: aString]."
	
	(self builder componentAt: #runButton) isNil
		ifFalse: [(self builder componentAt: #runButton) labelString: aString]
]

{ #category : #'model scheduling' }
Cormas >> runButtonPause [
	"(self builder componentAt: #runButton) isNil ifFalse:[(self builder componentAt: #runButton) labelString: aString]."
	
	(self builder componentAt: #runButton) isNil
		ifFalse: [(self builder componentAt: #runButton) label: Cormas pauseIcon]
]

{ #category : #'model scheduling' }
Cormas >> runButtonRun [
	"(self builder componentAt: #runButton) isNil ifFalse:[(self builder componentAt: #runButton) labelString: aString]."
	
	(self builder componentAt: #runButton) isNil
		ifFalse: [(self builder componentAt: #runButton) label: Cormas runIcon]
]

{ #category : #simulation }
Cormas >> runNSimulations_old [
	"Deprecated. Just use for the old 'run: t times: n' method"
	| nbOfSim j test i |
self halt.
	nbOfSim := (self request: self numberOfSimul initialAnswer: '1') asNumber.
	j := 1.
	nbOfSim
		timesRepeat: [ self initSimulation.
			i := self stepCounter value.
			test := 'ok'.
			[ i <= cycle value and: [ test isNil not ] ]
				whileTrue: [ test := self cormasModel perform: self cormasModel activeControl with: i with: j.
					self cormasModelClass commClasses isEmpty
						ifFalse: [ self cormasModel channel flush ].
					self obsWin notNil
						ifTrue: [ self eraseLinks
								ifTrue: [ self obsWin observateur modeleObs actionClear ] ].
					self stepCounter value: i.
					i := i + 1 ].
			test isNil
				ifTrue:
					[ self cormasModel perform: self cormasModel activeControl with: cycle value with: j ].
			j := j + 1 ]
]

{ #category : #simulation }
Cormas >> runStepByStep [
self halt.
	self cormasModel isNil
		ifTrue: [ ^ nil ].
	self stepCounter value = self cycle value
		ifTrue: [ self cycle value: self cycle value + 1 ].
	self obsWin isNil
		ifFalse: [ self obsWin window isOpen
				ifTrue: [ self eraseLinks isNil
						ifFalse: [ self eraseLinks
								ifTrue: [ self obsWin observateur modeleObs actionClear ] ] ] ].
	xmlModel isNil
		ifFalse: [ "Handle the beginning of the step for the XMLModel" xmlModel startStep ].
	exportPlaybackLog
		ifTrue: [ "Write map to the log" xmlModel writeMapToPlaybackLog ].
	Processor yield.	"  **************************************************"	"  ******************   RUN Step   ****************"	"**"
	self simManager runStepByStep.	"**"	"  ********************    Done   ******************"	"  **************************************************"
	self makeVideo.
	useExternalVisualization
		ifTrue:
			[ "Send map to external visualization module via XML-RPC" xmlModel sendMapToExternalVisualizer ].
	xmlModel isNil
		ifFalse: [ "Handle the end of the step in for the XML Model" xmlModel endStep ]
]

{ #category : #'model saving&loading POV' }
Cormas >> savePOVasClassMethods [
	
	self cormasModelClass spatialClasses
		do:
			[:aClass | 
			aClass colorsDict
				keysAndValuesDo:
					[:aSymbol :aColor | 
					CMSpecPovSetter_SpatialEntity new saveSpatialEntityPOVcolor: aColor intoClass:
							aClass symbol: aSymbol]].
	self cormasModelClass occupantClasses
		do:
			[:aClass | 
			aClass povDict
				keysAndValuesDo:
					[:aSymbol :aPOV | 
					(aClass inheritsFrom: CMArcEntity)
						ifTrue:
							[PovSetter_Arc new saveArcPOV: aPOV intoClass: aClass symbol: aSymbol]
						ifFalse:
							[aPOV isBitmapPOV
								ifTrue:
									[PovSetter_Agent new saveBitmapPOV: aPOV intoClass: aClass symbol: aSymbol]
								ifFalse:
									[PovSetter_Agent new saveVectorialPOV: aPOV intoClass: aClass symbol:
											aSymbol]]]]
]

{ #category : #'model saving&loading EV' }
Cormas >> saveVisualStates [
	"export the POVs of the model as EV file. The file name is equal to the version of the model"
	
	| fileNameEv stream |
	fileNameEv := (self class modelPath: self cormasModelClass name)
		construct:
			(self cormasModelClass version tokensBasedOn: $.) first , '.ev'.
	stream := fileNameEv asFilename writeStream.
	self cormasModelClass visualizedClasses
		do:
			[:entity | 
			(self cormasModelClass spatialClasses includes: entity)
				ifFalse:
					["IMAGES des ENTITES (plus couleurs pour les VectorialPOV // pour les BitmapPOV r√©f√©rence au nom du symbole associ√©"
					entity povDict
						keysAndValuesDo:
							[:k :im | 
							stream nextPutAll: entity name , ' '.
							(im isVectorialPOV or: [im isArcPOV])
								ifFalse:
									[stream
										nextPutAll:
											'Bitmap ' , k asString , ' ' , im position , '\' withCRs	"c'est un bitmap"]
								ifTrue:
									[stream nextPutAll: im class name asString , ' '.
									stream nextPutAll: k asString , ' '.
									im exportIn: stream]]].	"COLOR of the SPATIALIZED ENTITIES"
			(self cormasModelClass spatialClasses includes: entity)
				ifTrue:
					[entity colorsDict isEmpty
						ifTrue:
							[stream nextPutAll: entity name , ' dicoCouleur '.
							stream nextPutAll: '\' withCRs]
						ifFalse:
							[entity colorsDict
								keysAndValuesDo:
									[:k :v | 
									stream nextPutAll: entity name , ' dicoCouleur '.
									v isNil
										ifTrue: [stream nextPutAll: k asString]
										ifFalse:
											[stream
												nextPutAll:
													k asString , ' ' , v red printString , ' ' , v green printString , ' '
														, v blue printString].
									stream nextPutAll: '\' withCRs]]]].
	stream close
]

{ #category : #version }
Cormas >> setModelComments [
	"Open a CommentInterface to fill information.
The comments are stored as class methods of the model class"
	
	| commentInterface authors |
	self cormasModelClass ifNil: [^self alert_NoModel].
	commentInterface := CommentInterface new initOn: self cormasModelClass.
	commentInterface openInterface: #commentsWindow.
	authors := commentInterface authorMailList listHolder value.
	self cormasModelClass
		setDescriptionFirstDate: commentInterface creationDate value
		authors: (authors collect: [:author | author name])
		emails: (authors collect: [:author | author email])
		comments: commentInterface modelComments value asString
]

{ #category : #version }
Cormas >> setModelVersionEqualTo: aFileName [
	
	| versionAsString |
	versionAsString := aFileName isString
		ifTrue: [aFileName]
		ifFalse: [aFileName tail].
	self cormasModelClass setVersion: versionAsString
]

{ #category : #'interface actions' }
Cormas >> setStepMethod [
	"Open a #step methods chooser, in order for the user to change the #step operation that is called at each time step"
	
	^self simManager setStepMethod
]

{ #category : #accessing }
Cormas >> simManager [
	
	^self cormasModel simManager
]

{ #category : #aspects }
Cormas >> simName [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^simName isNil
		ifTrue: [simName := String new asValue]
		ifFalse: [simName]
]

{ #category : #aspects }
Cormas >> simNum [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^simNum isNil
		ifTrue: [simNum := String new asValue]
		ifFalse: [simNum]
]

{ #category : #accessing }
Cormas >> simSubcanvas [
	" subcanvas := self widgetAt: #subcanvasSim. "
	
	^(self mainBuilder componentAt: #subcanvasSim) widget
]

{ #category : #accessing }
Cormas >> simulationWin [
	
	Dev todo:
			'On ne devrait pas conna√Ætre cette fen√™tre (on est un mod√®le ! et en plus on dispose de cette fen√™tre par self mainWindow)'.
	^simulationWin
]

{ #category : #accessing }
Cormas >> simulationWin: anObject [
	
	simulationWin := anObject
]

{ #category : #'main menu' }
Cormas >> snapshotModel [
	"Snapshot the current simulation state as BOS file. Time is temporary set to 0, in order to use the BOS file as initial state of further simulations"
	
	self cormasModel ifNil: [^Dialog warn: 'No model'].
	self simManager snapshotCurrentState
]

{ #category : #accessing }
Cormas >> spaceModel [
	
	^self cormasModel ifNotNil: [:sim | sim spaceModel]
]

{ #category : #'model entities' }
Cormas >> specializeEntityClass: superClass type: aType [
	
	self
		addNewClassType: aType
		inheritingFrom: superClass
		name: (self askUserTheClassNameWithDefaultValue: superClass name)
		initProtocol: false
		stepProtocol: false
]

{ #category : #'model entities' }
Cormas >> specializeEntityClassType: aType [
	"aType is either 'Spatial', 'Social' or 'Passive'"
	
	| aClass |
	aClass := self getSelectedEntityClassType: aType.
	(aClass notNil and: [self changeRequest])
		ifTrue: [self specializeEntityClass: aClass type: aType]
]

{ #category : #'model entities' }
Cormas >> specializePassiveEntity [
	
	self specializeEntityClassType: 'Passive'
]

{ #category : #'model entities' }
Cormas >> specializeSocialEntity [
	
	self specializeEntityClassType: 'Social'
]

{ #category : #'model entities' }
Cormas >> specializeSpatialEntity [
	
	self specializeEntityClassType: 'Spatial'
]

{ #category : #'model saving&loading ST' }
Cormas >> stFile [
	"export the model as ST file. The user can not choose the name of the file : it is 'self cormasModelClass name asString , '.st' ' "
	
	| fileName |
	fileName := (self class modelPath: self cormasModelClass name)
		construct: self cormasModelClass name asString , '.st'.
	self stFile: fileName
]

{ #category : #'model saving&loading ST' }
Cormas >> stFile: fileName [
	"Save the model as ST file.
fileName = <Filename> or <String>"
	
	| fileManager pkg |
	Notice
		show: 'Saving Model as ST file...'
		while:
			[pkg := self cormasModelClass package.
			fileManager := SourceCodeStream
				write: fileName asString
				encoding: #Source.
			[fileManager timeStamp.
			fileManager deferInitializations.
			pkg fileOutOn: fileManager.
			fileManager finishInitializations.
			fileManager cr] ensure: [fileManager close]]
]

{ #category : #simulation }
Cormas >> stepBack [
	"Perform a step back using BOS file"
self halt.
	^ self simManager stepBack
]

{ #category : #accessing }
Cormas >> subcanvasSim [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^subcanvasSim isNil
		ifTrue: [subcanvasSim := self]
		ifFalse: [subcanvasSim]
]

{ #category : #'interface actions' }
Cormas >> switchInterface [
	
	| model |
	model := self cormasModelClass.
	self closeModel.
	self dependents
		do:
			[:win | 
			win
				release;
				close].
	self closeRequest.	"closeAndUnschedule"	"ScheduledControllers scheduledControllers removeAllSuchThat:[: sc|sc view application isNil]."
	(self builder bindings at: #__specName) = #windowSpec_old
		ifFalse:
			[Cormas
				openInterface: #windowSpec_old
				WithLanguage: Locale current name
				ofModel: self]
		ifTrue:
			[Cormas
				openInterface: #windowSpec
				WithLanguage: Locale current name
				ofModel: self].
	self openModel: model
]

{ #category : #'model saving&loading POV' }
Cormas >> symbolNameOfSelector: selector [
	
	| stream |
	stream := selector readStream.
	stream upTo: $_.
	^stream upToEnd asSymbol
]

{ #category : #'user messages' }
Cormas >> targetForHabitus: aHabitusName [
	"return a target for user messages, searching in the opened spatialGrids for aHabitusName or defaultly return self"
	
	^self targetForHabitus: aHabitusName or: nil
]

{ #category : #'user messages' }
Cormas >> targetForHabitus: aHabitusName or: anotherHabitusName [
	"return a target for user messages, searching in the opened spatialGrids for aHabitusName, or for anotherHabitusName or defaultly return self"
	
	| targets |
	targets := self openedSpatialGridsForHabitus: aHabitusName.
	(targets isEmpty and: [anotherHabitusName notNil])
		ifTrue:
			[targets := self openedSpatialGridsForHabitus: anotherHabitusName].
	targets size = 1 ifTrue: [^targets first].
	targets isEmpty
		ifTrue:
			[self warn: 'No habitus named <1s> or <2s>. Using Cormas' with:
					aHabitusName with: anotherHabitusName.
			^self].
	^Dialog
		choose:
			('Multiple habitus named <1s> or <2s>. Please chose one' expandMacrosWith:
					aHabitusName with: anotherHabitusName)
		fromList: targets
		values: targets
		lines: 5
		cancel: [^self]
]

{ #category : #util }
Cormas >> testParcelsRequired: fileNameSt [
	
	| stream line parcels |
	parcels := OrderedCollection new.
	stream := fileNameSt asFilename readStream.
	[stream atEnd]
		whileFalse:
			[line := (stream upTo: Character cr) tokensBasedOn: Character space.
			(line includes: 'subclass:')
				ifTrue:
					[line first = 'ExternalInterface' ifTrue: [parcels add: 'DLLCC' -> ''].
					line first = 'DdemlClient' ifTrue: [parcels add: 'DDEML' -> '']]].
	stream close.
	Parcel setFileCachesTo: [Dictionary new].
	Cursor wait
		showWhile:
			[parcels
				do:
					[:pname | 
					Parcel
						handleParcelSignalsDo:
							[Parcel
								ensureLoadedParcel: pname key
								withVersion: pname value
								for: nil]]]
]

{ #category : #'interface actions' }
Cormas >> toggleDelayChanges [
	
	self isChangesDelayed: self isChangesDelayed not
]

{ #category : #'main menu' }
Cormas >> updateCormas [
	"Update the Cormas version by loading cormas.pcl situated into vw/cormas/ directory"
	
	| parcelName previousModel newCormas result |
	"Update Cormas using the Parcel stored in VW/Cormas/"
	previousModel := self cormasModelClass.
	parcelName := Dialog
		requestFileName: 'Update Cormas using the Parcel...' asString
		default:
			(SourceFileManager default targetFile logicalName directory construct:
					'cormas.pcl') asFilename.
	parcelName = '' ifTrue: [^nil].
	self closeAllWindows.
	self uiSession close.
	self builder window close.
	self builder window controller closeAndUnschedule.
	VisualLauncher raiseSingleInstance.
	result := Parcel loadParcelFrom: parcelName.
	self mainWin isNil
		ifFalse:
			[self cormasModel isNil
				ifFalse:
					[self closeModel.
					self mainWin close]].
	newCormas := Cormas open model.
	result isNil ifFalse: [Cormas saveImage].
	newCormas openModel: previousModel	"visualLauncher updateCormas"
]

{ #category : #'main menu' }
Cormas >> updateGUI [
	"Display the model on Cormas GU interface"
	"aModel = subClass of <CormasModel>"
	
	| aList |
	aList := List new.
	self modelName: self cormasModelClass name.
	self mainWin label: 'Cormas [' , self cormasModelClass name , ']'.
	self cormasModelClass socialClasses
		do: [:anEntity | aList add: anEntity name].
	self listSocialEntities list: aList.
	aList := List new.
	self cormasModelClass spatialClasses
		do: [:anEntity | aList add: anEntity name].
	self listSpatialEntities list: aList.
	aList := List new.
	self cormasModelClass passiveClasses
		do: [:anEntity | aList add: anEntity name].
	self listPassiveEntities list: aList.
	self displayVersionOfModel: self cormasModelClass
]

{ #category : #accessing }
Cormas >> useExternalVisualization [
	
	^useExternalVisualization ifNil: [useExternalVisualization := false]
]

{ #category : #accessing }
Cormas >> useExternalVisualization: anObject [
	
	useExternalVisualization := anObject
]

{ #category : #accessing }
Cormas >> useOnlyOneRB [
	
	^useOnlyOneRB ifNil: [useOnlyOneRB := true]
]

{ #category : #accessing }
Cormas >> useOnlyOneRB: aBoolean [
	
	useOnlyOneRB := aBoolean.
	aBoolean
		ifTrue:
			[((self menuHolder value atNameKey: #Tools) submenu atNameKey:
					#useOnlyOneRB) beOn]
		ifFalse:
			[((self menuHolder value atNameKey: #Tools) submenu atNameKey:
					#useOnlyOneRB) beOff]
]

{ #category : #'model entities' }
Cormas >> verifyClassExist: aClassName [
	
	^ Smalltalk hasClassNamed: aClassName asSymbol
]

{ #category : #aspects }
Cormas >> versionField [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^versionField isNil
		ifTrue: [versionField := String new asValue]
		ifFalse: [versionField]
]

{ #category : #accessing }
Cormas >> visualStateWin [
	
	^visualStateWin
]

{ #category : #accessing }
Cormas >> visualStateWin: x [
	
	visualStateWin := x
]

{ #category : #'model saving&loading EV' }
Cormas >> vsFile_old [
	"export the POVs of the model as EV file. The file name is equal to the version of the model"
	
	| fileNameEv stream |
	fileNameEv := (self class modelPath: self cormasModelClass name)
		construct:
			(self cormasModelClass version tokensBasedOn: $.) first , '.ev'.
	stream := fileNameEv asFilename writeStream.
	self cormasModelClass visualizedClasses
		do:
			[:entity | 
			(self cormasModelClass spatialClasses includes: entity)
				ifFalse:
					[stream nextPutAll: entity name , ' image '.
					entity image class = EntityPOV
						ifFalse: [stream nextPutAll: 'figurine\' withCRs]
						ifTrue: [entity image exportIn: stream]].
			(entity colorsDict isNil or: [entity colorsDict isEmpty])
				ifTrue:
					[stream nextPutAll: entity name , ' dicoCouleur '.
					stream nextPutAll: '\' withCRs]
				ifFalse:
					[entity colorsDict
						keysAndValuesDo:
							[:k :v | 
							stream nextPutAll: entity name , ' dicoCouleur '.
							stream
								nextPutAll:
									k asString , ' ' , v red printString , ' ' , v green printString , ' '
										, v blue printString.
							stream nextPutAll: '\' withCRs]]].
	stream close
]

{ #category : #'user messages' }
Cormas >> warn: aString [
	self error: aString
]

{ #category : #'model entities' }
Cormas >> warnCormasModelThat: oldName changeTo: newClass [
	
	| entities |
	(newClass inheritsFrom: CMSpatialEntity)
		ifTrue:
			["spaceModel"
			self spaceModel
				ifNotNil:
					[:sm | 
					entities := sm spatialEntities
						at: oldName
						ifAbsent: [nil].
					entities isNil ifTrue: [^nil].
					sm spatialEntities
						at: newClass name
						put: entities.
					sm spatialEntities removeKey: oldName.
					sm activeSpatialEntity = oldName asSymbol
						ifTrue: [sm activeSpatialEntity: newClass name]].	"cormasModel"
			(newClass inheritsFrom: CMSpatialEntityElement)
				ifTrue: [self cormasModel theESE: entities].
			(newClass inheritsFrom: CMSpatialEntityAggregate)
				ifTrue:
					[self cormasModel
						perform: ('the' , newClass name asString , 's:') asSymbol
						with: entities]].
	self alert_SaveModel
]

{ #category : #'model entities' }
Cormas >> withBrowserDo: aBlock [
	"Evaluate a block with a browser in parameter"
	
	self halt.
	aBlock value: Smalltalk tools browser

]
