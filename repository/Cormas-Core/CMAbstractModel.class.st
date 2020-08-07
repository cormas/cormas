"
CormasModel is one of the main class of Cormas. It is the super class of your model class.

When you create a new model in Cormas (ex: MyModel), a sub class of CormasModel is created; its name is the name of your model. 
For example:
CormasNS.Models.MyModel defineClass: #MyModel
	superclass: #{CormasNS.Kernel.CormasModel}
	indexedType: #none
	private: false
	instanceVariableNames: ''
	classInstanceVariableNames: ''
	imports: ''
	category: 'MyModelCategory'  
This class allows to initiate a simulation and to schedule it.
Your subclass will contain attributs like 'theCells' for example which are OrderedCollections storing the instances of your entities.

Instance Variables
	activeControl	<Symbol>	it memorizes the name of the control method that have been selected by the user (ex: #stepSynchronously)
	activeInit	<Symbol>	it memorizes the name of the control method that have been selected by the user (ex: #init)
	channel	<Channel>	a channel for messages communication
	data	<Dictionary of Dictionaries>	It stocks the values of the probes selected by the user.
			The key of the first Dictionary is the name of the class contzining the probes. This key 			points to another Dictionary. Each key of this second dictionary is the name of the probe; 			it points to a List of values of the probe.
			(ex: 
			Dictionary (#Conway->Dictionary (#alive->List () 
											 #dead->List () ) 
					    #Cell->Dictionary (#isAlive->Dictionary () ) )
	periodicity	<Integer>	It may be used into the step method by calling 'testPeriod' : it tests if the timeStep is at the begining of the periodicity
	simManager	<SimulationsManager>	see description of SimManager
	spaceModel	<SpaceModel>	see description of SpaceModel
	timeStep	<Integer>	describes the current time step


"
Class {
	#name : #CMAbstractModel,
	#superclass : #Object,
	#instVars : [
		'cormas',
		'timeStep',
		'channel',
		'activeInit',
		'activeControl',
		'spaceModel',
		'data',
		'simManager',
		'projectManager',
		'database',
		'collector',
		'defaultAttributesSetter',
		'sensitivitySetter',
		'delayedChanges',
		'allClassVarBOSS',
		'announcer'
	],
	#classInstVars : [
		'cellClass',
		'spatialClasses',
		'socialClasses',
		'passiveClasses',
		'povColorsDict',
		'visualStateIsOpen',
		'charts',
		'activeProbes',
		'activityDiagrams'
	],
	#category : #'Cormas-Core-Interface'
}

{ #category : #'- default value' }
CMAbstractModel class >> activeControl_default [
	"Return the default value of activeControl attribute"
	
	^nil
]

{ #category : #'- default value' }
CMAbstractModel class >> activeInit_default [
	"Return the default value of activeInit attribute"
	
	^nil
]

{ #category : #probes }
CMAbstractModel class >> activeProbes [
	^ activeProbes
		ifNil: [ self defaultProbes ]
		ifNotNil: [ activeProbes ]
]

{ #category : #probes }
CMAbstractModel class >> activeProbes: anObject [
	
	activeProbes := anObject
]

{ #category : #'- activityEditor' }
CMAbstractModel class >> activityDiagrams [
	
	^activityDiagrams ifNil: [activityDiagrams := Dictionary new]
]

{ #category : #'- activityEditor' }
CMAbstractModel class >> activityDiagrams: anObject [
	
	activityDiagrams := anObject
]

{ #category : #'- activityEditor' }
CMAbstractModel class >> activityDiagramsAt: instanceOperationName [
	" (Entity activityDiagramsAt: #exampleTest) open   "
	
	| ad |
	ad := self activityDiagrams
		at: instanceOperationName
		ifAbsent:
			[ad := [self perform: (self activitySelectorOf: instanceOperationName)]
				on: Error
				do:
					[:ex | 
					^Cormas current warn: 'No Activity Diagram found for <1p>' with:
							instanceOperationName].
			self activityDiagrams at: instanceOperationName put: ad].
	^ad
]

{ #category : #'- activityEditor' }
CMAbstractModel class >> activitySelectorOf: instanceSelector [
	"Return the activity_selector name from #instanceSelector with 'activity_'.
	ex: Agent activitySelectorOf: #exampleTest     --> #activity_exampleTest"
	
	^(self preStringForActivitySelector , instanceSelector) asSymbol
]

{ #category : #'description - primitives' }
CMAbstractModel class >> addClassComment [
	"Set the comment of the class"
	
	| noComment index classComment |
	self comments = 'Not yet commented...' ifTrue: [^nil].	"self comment = '' ifTrue:[(Refactory.Browser.BrowserCommentTool codeModel: ((Refactory.Browser.CodeModel navigator: (Refactory.Browser.Navigator new)) setClass: self)) defaultClassComment]. "	"pour que les commentaires par defaut soient g√©n√©r√©s, avec les attributs etc... mais bon..."
	self comment = '' ifTrue: [^nil].
	noComment := 'has not been commented.  The comment should state the purpose of the class and also explain any unobvious aspects of the implementation.'.
	classComment := self comment.
	index := classComment indexOfSubCollection: noComment startingAt: 1.
	index = 0
		ifTrue:
			[classComment = ''
				ifTrue: [classComment := self comments]
				ifFalse:
					[index := classComment indexOfSubCollection: '***' startingAt: 1.
					classComment := classComment
						copyReplaceFrom: 1
						to: index - 2
						with: self comments withCRs]]
		ifFalse:
			[classComment := classComment
				copyReplaceFrom: 1
				to: index + noComment size
				with: self comments , '\ ***' withCRs].
	self comment: classComment	"replaceElementsFrom: start to: stop withByteEncodedString: replacement startingAt: repStart 
startingAt: repStart replaceElementsIn: collection from: start to: stop
copyReplaceFrom: start to: stop with: replacement
containsSubstring: aString

stDocumentation:
comment:"
]

{ #category : #accessing }
CMAbstractModel class >> addRandomAttributes: anArray [
	"' Compile #randomAttributes by adding anArray: #(#attribute scopeLevel #randFloat min max) "
	
	| list code oldLine |
	list := self randomAttributes asList.
	oldLine := list
		detect:
			[:line | (line at: 1) = (anArray at: 1) and: [(line at: 2) = (anArray at: 2)]]
		ifNone: [nil].
	oldLine isNil
		ifTrue: [list add: anArray]
		ifFalse:
			[oldLine := oldLine asArray.
			oldLine
				at: 3
				put: (anArray at: 3).
			oldLine
				at: 4
				put: (anArray at: 4).
			oldLine
				at: 5
				put: (anArray at: 5)].
	code := 'randomAttributes \	"Returns a list of randomAttributes: a List of arrays: [#(#attributeName scopeLevel #randomFloat min max) #(...) #(...) ... ].

	This method is automatically redefined when creating new random attributes" 	\'
		withCRs.
	code := code ,
			'	| list |
	list := List new. \'.
	list do: [:line | code := code , '	list add: ' , line printString , '. \'].
	code := (code , '	^list') withCRs.
	self class
		compile: code
		classified: '- accessing' asString
		notifying: nil
]

{ #category : #'- activityEditor' }
CMAbstractModel class >> allActivityDiagramSelectors [
	"Return the selectors starting with 'activity_'.
	ex: Agent allActivityDiagramSelectors"
	
	^self class allSelectors
		select:
			[:n | 
			(n asString
				indexOfSubCollection: self preStringForActivitySelector
				startingAt: 1) = 1]
]

{ #category : #'- activityEditor' }
CMAbstractModel class >> allActivitySelectors [
	"Return the instance selectors defined for the activityDiagrams '.
	ex: Agent allActivitySelectors"
	
	^self allActivityDiagramSelectors
		collect: [:as | self instanceSelectorFrom: as]
]

{ #category : #'managing classes' }
CMAbstractModel class >> allClassesInPackage [
	"Returns all classes of the package in the same tag than the model (include the model)"

	^ (self package classTags
		detect: [ :class | class includesClass: self ]) classes
]

{ #category : #'managing classes' }
CMAbstractModel class >> allClassesNames [
	"return all the Entity class names of the model (except the my self, Msg and other classes like Interface etc)"

	^ self allEntityClasses collect: [ :c | c name asString ]
]

{ #category : #'managing classes' }
CMAbstractModel class >> allEntityClasses [
	"return all the classes of the model (except the classes that inheriting from Msg and other classes like Interface etc"

	^ self allClassesInPackage
		removeAllSuchThat: [ :class | (class inheritsFrom: CMEntity) not ]
]

{ #category : #'- activityEditor' }
CMAbstractModel class >> allInstanceSelectors [
	
	| coll |
	coll := OrderedCollection new.
	(self superClassesUntil: Object)
		do: [:aClass | coll addAll: aClass selectors].
	^coll
]

{ #category : #'managing classes' }
CMAbstractModel class >> allTerminalClasses [
	"Return a collection of classes without superclasses"
	
	| all |
	all := OrderedCollection new: 30.
	self spatialClasses_sorted
		ifNotNil:
			[:coll | coll do: [:each | (Cormas isTerminal: each) ifTrue: [all add: each]]].
	self socialClasses
		ifNotNil:
			[:coll | coll do: [:each | (Cormas isTerminal: each) ifTrue: [all add: each]]].
	self passiveClasses
		ifNotNil:
			[:coll | 
			coll
				do:
					[:each | 
					((Cormas isTerminal: each) and: [each inheritsFrom: Entity])
						ifTrue: [all add: each]]].
	^all
]

{ #category : #'- default value' }
CMAbstractModel class >> builder_default [
	"Return the default value of builder attribute"
	
	^nil
]

{ #category : #'managing classes' }
CMAbstractModel class >> cellClass [
	^ cellClass
]

{ #category : #accessing }
CMAbstractModel class >> cellClass: aClass [
	cellClass := aClass
]

{ #category : #'- default value' }
CMAbstractModel class >> channel_default [
	"Return the default value of channel attribute"
	
	^nil
]

{ #category : #'+ activityEditor' }
CMAbstractModel class >> chooseActivityDiagramEditorToOpen [
	"Purpose: user can choose and reOpen an ActivityDiagramEditor.
	Example: CormasModel chooseActivityDiagramEditorToOpen   "

	| chooser |
	chooser := self chooseActivityDiagramName.
	chooser ifNil: [ ^ nil ].
	chooser action = #new
		ifTrue: [ ^ self openBlankActivityDiagramEditor ].
	chooser action = #remove
		ifTrue: [ ^ self removeActivityDiagram: chooser diagramList selection ].
	^ self openActivityDiagram: chooser diagramList selection
]

{ #category : #'+ activityEditor' }
CMAbstractModel class >> chooseActivityDiagramEditorToRemove [
	" Purpose: user can choose and remove an ActivityDiagramEditor.
	Example: Entity chooseActivityDiagramEditorToRemove   "

	| operationName list |
	list := self allActivitySelectors asSortedCollection.
	operationName := Dialog
		choose: 'Which activity diagram to remove?'
		fromList: list
		values: list
		lines: 8
		cancel: [ #Cancel ].
	operationName = #Cancel
		ifTrue: [ ^ nil ].
	^ self removeActivityDiagram: operationName
]

{ #category : #'+ activityEditor' }
CMAbstractModel class >> chooseActivityDiagramName [
	" Purpose: user can choose an ActivityDiagramEditor.
ex:   Entity chooseActivityDiagramName inspect   "
	
	| list dialogValue |
	list := self allActivitySelectors asSortedCollection.
	dialogValue := DiagramChooser new.
	dialogValue diagramList list: list.
	dialogValue open.
	dialogValue cancel value ifTrue: [^nil].
	^dialogValue
]

{ #category : #'managing classes' }
CMAbstractModel class >> classFromSymbol: aSymbol [
	self deprecated: 'Use class method on Symbol instead of classFromSymbol:'.
	^ aSymbol class
]

{ #category : #probes }
CMAbstractModel class >> colorOfProbe: aProbeSymbol [
	"answer the color of a probe (to display the curve in ChartsInterface)"
	
	| selectorName |
	selectorName := (#colorOfProbe_ , aProbeSymbol) asSymbol.
	self class methodDictionary
		at: selectorName
		ifAbsent: [^nil].
	^self perform: selectorName
]

{ #category : #'managing classes' }
CMAbstractModel class >> commClasses [
	^ self allEntityClasses
		select: [ :i | 
			(i inheritsFrom: CMAgentComm) | (i inheritsFrom: CMAgentCommLocation)
				| (i inheritsFrom: CMMsg) ]
]

{ #category : #'managing classes' }
CMAbstractModel class >> compoundSpatialClasses [
	
	^ self spatialClasses select: [:i | i inheritsFrom: CMSpatialEntitySet]
]

{ #category : #compiling }
CMAbstractModel class >> createDefaultMethods [
	
	self
		compile: 'initAgents\"To be completed"\	' withCRs
		classified: 'instance-creation'
		notifying: nil.
	self
		compile: 'init\"To be completed"\	self initCells.' withCRs
		classified: 'init'
		notifying: nil.
	self
		compile: 'step: t\"To be completed"\\ ' withCRs
		classified: 'control'
		notifying: nil
]

{ #category : #compiling }
CMAbstractModel class >> createInstancesAccessorsForAllEntityClasses [
	self allEntityClasses
		do: [ :class | self createInstancesAccessorsForClass: class ]
]

{ #category : #compiling }
CMAbstractModel class >> createInstancesAccessorsForClass: aClass [
	| pop |
	pop := self getterForEntityClass: aClass.
	aClass isAbstract
		ifTrue: [ self
				compile:
					(pop
						,
							'\	"Returns a collection of all the instances of aClass (and sub classes) collected by cormasModel.\'
						, Cormas automaticCommentString
						, ' "\\   ^self allTheEntities: ' , aClass name asString)
						withCRs
				classified: 'accessing'
				notifying: nil ]
		ifFalse: [ (self hasInstVarNamed: pop)
				ifFalse: [ self addInstVarNamed: pop ].
			self createReaderAccessor: aClass.
			self createSetterAccessor: aClass ]
]

{ #category : #compiling }
CMAbstractModel class >> createReaderAccessor: aClass [
	"creates a reader accessor that returns an IndexedSet. 
aClassName = <String> or <Symbol>.

Ex: #theXXXs 
	''Returns a collection of all the instances of the classe collected by cormasModel.
	!! This method was automatically generated by Cormas !!''
^ theXXXifNil:[theXXX := IndexedSet new]."
	
	| pop |
	pop := self getterForEntityClass: aClass.
	self
		compile:
			(pop ,
					'\	"Returns a collection of all the instances of the sub classes collected by cormasModel.\'
				, Cormas automaticCommentString , '"\\\^' , pop , ' ifNil:[' , pop ,
					' := IndexedSet new]') withCRs
		classified: 'accessing'
		notifying: nil
]

{ #category : #compiling }
CMAbstractModel class >> createSetterAccessor: aClass [
	"creates a setter accessor such as :
theXXXs: aNewCollection 
	theXXXs := aNewCollection.
aClassName = <String> or <Symbol>.
(aClassName ('XXX') is completed as theXXXs)"
	
	| pop |
	pop := self getterForEntityClass: aClass.
	self
		compile:
			(pop , ': aNewCollection\	"Set a new collection for theXXXs attribute.\'
				, Cormas automaticCommentString , '"\\	' , pop , ' := aNewCollection')
				withCRs
		classified: 'accessing'
		notifying: nil
]

{ #category : #accessing }
CMAbstractModel class >> current [
	"Direct acces to the current cormasModel"
	
	^Cormas current cormasModel
]

{ #category : #accessing }
CMAbstractModel class >> currentSimulation [
	self deprecated: 'currentSimulation is no longer supported.'
]

{ #category : #accessing }
CMAbstractModel class >> currentSimulation: anObject [
	self deprecated: 'currentSimulation is no longer supported.'
]

{ #category : #'- default value' }
CMAbstractModel class >> database_default [
	"Return the default value of database attribute"
	
	^nil
]

{ #category : #'+ simulation settings' }
CMAbstractModel class >> defaultControl [
	
	^#step:
]

{ #category : #'+ simulation settings' }
CMAbstractModel class >> defaultDelayChangesSetting [
	
	^false
]

{ #category : #'+ simulation settings' }
CMAbstractModel class >> defaultInit [
	^ #init
]

{ #category : #'+ simulation settings' }
CMAbstractModel class >> defaultProbes [
	^ #()
]

{ #category : #'+ simulation settings' }
CMAbstractModel class >> defaultSteppingBackSetting [
	
	^false
]

{ #category : #'description - primitives' }
CMAbstractModel class >> descriptionTextFromFirstDate: firstDate lastDate: lastDate authors: list1 emails: list2 comments: additionalText [
	
	| txt |
	txt := 'Model name : ' asText
		,
			((self name , '\') asText emphasizeAllWith: #color -> ColorValue red)
				withCRs asText emphasizeAllWith: #(#bold #large).
	txt := txt , 'Current version : ' asText
		,
			((self version , '\') asText emphasizeAllWith: #color -> ColorValue red)
				withCRs asText.
	txt := txt , 'Creation date : ' asText
		,
			((firstDate , '\') asText emphasizeAllWith: #color -> ColorValue red)
				withCRs asText.
	txt := txt , 'Last update : ' asText
		,
			((lastDate , '\') asText emphasizeAllWith: #color -> ColorValue red)
				withCRs asText.
	list1 size > 1
		ifTrue:
			[txt := txt , ('Authors\' withCRs asText emphasizeAllWith: #(#bold #large))]
		ifFalse:
			[txt := txt , ('Author\' withCRs asText emphasizeAllWith: #(#bold #large))].
	list1
		with: list2
		do:
			[:a :e | 
			txt := txt , a , ' ' asText
				, (('   ' , e , '\') asText emphasizeAllWith: #italic) withCRs asText].
	txt := txt
		, ('Comments\' withCRs asText emphasizeAllWith: #(#bold #large)).
	txt := txt , (additionalText , '\') withCRs asText.
	^txt
]

{ #category : #compiling }
CMAbstractModel class >> getterForEntityClass: aClass [
	"efficiently create the getter selector for the entity class aClass (avoid concatenation).
	ex : self getterForEntityClass: Object -> #theObjects

	self basicNew getterForEntityClass: Object
	"

	^ ('the'
		,
			(aClass isString
				ifTrue: [ aClass ]
				ifFalse: [ aClass entityName ]) pluralize capitalized) asSymbol
]

{ #category : #testing }
CMAbstractModel class >> hasRandomAttribute: anAttributeName [
	"' Answer if anAttributeName defined at class or instance level is a random attribute"
	
	^self randomAttributes contains: [:line | (line at: 1) = anAttributeName]
]

{ #category : #accessing }
CMAbstractModel class >> hasRandomAttribute: anAttributeName classVariable: boolean value: aString [
	"' Answer if anAttributeName defined at level (#instance or #class) is already defined with the same value as aString.
randomAttributes = #(#bioma #instance #randomFloat 0 1). "
	
	| level anArray otherString include |
	(self isRandomAttribute: anAttributeName classVariable: boolean)
		ifFalse: [^false].
	level := boolean
		ifTrue: [#class]
		ifFalse: [#instance].
	anArray := self randomAttributes
		detect:
			[:line | (line at: 1) = anAttributeName and: [(line at: 2) = level]].
	otherString := (anArray at: 3) asString.
	otherString = 'randomFloat'
		ifTrue: [include := false]
		ifFalse: [include := true].
	include
		ifTrue: [otherString := otherString , ': [']
		ifFalse: [otherString := otherString , ': ]'].
	otherString := otherString , (anArray at: 4) asString.
	otherString := otherString , ' ; '.
	otherString := otherString , (anArray at: 5) asString.
	include
		ifTrue: [otherString := otherString , ']']
		ifFalse: [otherString := otherString , '['].
	^otherString = aString
]

{ #category : #'instance creation' }
CMAbstractModel class >> initialize [
	self initializeCellClass.
	self initializeModelClasses.
	self cellClass notNil
		ifTrue:
			[ "self povColorsDict at: self cellClass put: Dictionary new." self cellClass colorsDict: Dictionary new	"(self povColorsDict at: self cellClass)" ].
	(self compoundSpatialClasses
		select: [ :cse | cse isGenericEntity not ])
		do:
			[ :aClass | "self povColorsDict at: aClass put: Dictionary new." "self dicoImage at: aClass put: ImageObjetSpatialise new.
			aClass image: (self dicoImage at: aClass)." aClass colorsDict: Dictionary new	"(self povColorsDict at: aClass)" ]
]

{ #category : #'instance creation' }
CMAbstractModel class >> initializeCellClass [
	"Store the Cell class of the model into cellClass"

	self
		cellClass:
			(self allEntityClasses
				detect: [ :each | each inheritsFrom: CMSpatialEntityElement ]
				ifNone: [ nil ])
]

{ #category : #'instance creation' }
CMAbstractModel class >> initializeModelClasses [
	"Decompose classes of the model in spatial, social and passive classes"

	| classes |
	classes := self allClassesInPackage.
	self
		spatialClasses: (classes select: [ :each | each inheritsFrom: CMSpatialEntity ]).
	self
		socialClasses: (classes select: [ :each | each inheritsFrom: CMAgent ]).
	self
		passiveClasses:
			(classes
				select:
					[ :each | (each inheritsFrom: CMPassiveObject) or: [ each inheritsFrom: CMMsg ]])
]

{ #category : #'- activityEditor' }
CMAbstractModel class >> instanceSelectorFrom: activity_selector [
	"Return the selector name from #activity_selector without 'activity_'.
	ex: Agent instanceSelectorFrom: #activity_bidon     --> #bidon"
	
	^(activity_selector
		copyFrom: self preStringForActivitySelector size + 1
		to: activity_selector size) asSymbol
]

{ #category : #testing }
CMAbstractModel class >> isGenericEntity [
	
	^self = CMAbstractModel	"| self = CormasModelGame"
]

{ #category : #testing }
CMAbstractModel class >> isRandomAttribute: anAttributeName classVariable: boolean [
	"' Answer if anAttributeName defined at level (#instance or #class) is a random attribute"
	
	^self
		isRandomAttribute: anAttributeName
		scopeLevel:
			(boolean
				ifTrue: [#class]
				ifFalse: [#instance])
]

{ #category : #testing }
CMAbstractModel class >> isRandomAttribute: anAttributeName scopeLevel: level [
	"' Answer if anAttributeName defined at level (#instance or #class) is a random attribute"
	
	^self randomAttributes
		contains:
			[:line | (line at: 1) = anAttributeName and: [(line at: 2) = level]]
]

{ #category : #testing }
CMAbstractModel class >> isSituatedClass [
	
	^false
]

{ #category : #'description - primitives' }
CMAbstractModel class >> listing: fileName [
	"Creates a simple listing of the attributes and methods of this class into fileName"
	
	| bufferText stream |
	bufferText := Text new.
	bufferText := bufferText , '***** Attributs'' list *****\' withCRs.
	self instVarNames
		do: [:iv | bufferText := bufferText , '  -' , iv asString , '\' withCRs].
	bufferText := bufferText , '\\\***** Methodes'' list ***** ' withCRs.
	self organization categories
		do:
			[:protoc | 
			bufferText := bufferText , '\\Protocol: ' , protoc asString , '\\' withCRs.
			(self organization listAtCategoryNamed: protoc)
				do:
					[:meth | bufferText := bufferText , '  #' , meth asString , '\' withCRs]].
	stream := fileName asFilename writeStream.
	stream nextPutAll: bufferText withCRs.
	stream close
]

{ #category : #'managing classes' }
CMAbstractModel class >> locatedObjectClasses [
	
	^self passiveClasses select: [:i | i inheritsFrom: CMObjectLocation]
]

{ #category : #'managing classes' }
CMAbstractModel class >> messages [
	^ self passiveClasses select: [ :i | i inheritsFrom: CMMsg ]
]

{ #category : #'- activityEditor' }
CMAbstractModel class >> methodsForControl [
	"Return a set of manipulation methods of this class which are neither in #init, #testing, #pov #accessing #probes or #info protocols
	This is usefull if you want to manipulate your agent from a graphic interface or with the Manipulate Instances and Create Instances tools.
	The modeler can redefine this method in order to get the desired selectors. 
Example :
	methodsForControl
		^#(#step #reproduce #randomWalk)	"
	
	| coll |
	coll := self modelMethodsForManipulation
		- self methodsForTesting asOrderedCollection.
	^coll
]

{ #category : #'- activityEditor' }
CMAbstractModel class >> methodsForControlNoArg [
	"Purpose: returns a list of all the control methods with no argument
Return value: a collection of symbols"
	
	^self methodsForControl select: [:selector | (selector includes: $:) not]
]

{ #category : #'- activityEditor' }
CMAbstractModel class >> methodsForTesting [
	"Return a set of all the methods which are in protocols starting by '* testing'
	This is usefull if you want to manipulate your agent with Manipulate Instances tool
	The modeler can redefine this method in order to get the desired selectors. 
Example :
	methodsForTesting
		^#(#isRich #isLandOwner)	"
	
	| coll |
	coll := self methodsOfProtocol: #testing.
	coll addAll: (self methodsOfProtocol: '+ testing - scheduling' asSymbol).
	^coll
]

{ #category : #'- activityEditor' }
CMAbstractModel class >> methodsOfProtocol: protocolName [
	"Return a set of all the methods of model classes which are in the given protocol and of all the methods of cormas entity classes which are in the protocol '* protocolName'"
	
	| collModel |
	collModel := OrderedCollection new.
	(self superClassesUntil: CMAbstractModel)
		do:
			[:aClass | 
			collModel
				addAll: (aClass organization listAtCategoryNamed: protocolName) sorted].
	^collModel
]

{ #category : #'- activityEditor' }
CMAbstractModel class >> modelMethodsForManipulation [
	"Return a set of all instance methods of this class and model upperclasses which are not in protocols #pov #accessing #probes #info.
Ex: CormasModel modelMethodsForManipulation"
	
	| coll categories |
	coll := OrderedCollection new.
	(self superClassesUntil: CMAbstractModel)
		do: [ : aClass | 
			(self cmEnvironment includes: aClass)
				ifTrue:
					[categories := (aClass organization categories
						select: [:cat | (cat first = $-) not]) asOrderedCollection.
					categories
						remove: #'default values'
						ifAbsent: [].
					coll
						addAll:
							(aClass selectors
								select:
									[:method | categories includes: (aClass organization categoryOfElement: method)])
								sorted]
				ifFalse:
					[categories := (aClass organization categories
						select: [:cat | cat first = $+]) asOrderedCollection.
					categories
						removeAllSuchThat:
							[:p | (p findString: 'utilities' startingAt: 1) ~= 0].
					#(#'+ pov' #'+ utilities - ODBC')
						do:
							[:cat | 
							categories
								remove: cat
								ifAbsent: []].
					coll
						addAll:
							(aClass selectors
								select:
									[:method | categories includes: (aClass organization categoryOfElement: method)])
								sorted]].
	coll removeAllSuchThat: [:s | s includes: $:].
	^coll
]

{ #category : #accessing }
CMAbstractModel class >> modelPrefix [
	"Remove CM prefix at the beginning and Model at the end"
	^ (self name allButFirst: 'CM' size) allButLast: 'Model' size
]

{ #category : #'instance creation' }
CMAbstractModel class >> newSimulation [
	
	| sim |
	sim := super new.	"sim initialize.   already called by new"
	self currentSimulation: sim.
	^sim
]

{ #category : #'managing classes' }
CMAbstractModel class >> occupantClasses [
	"return a collection of classes for which intances are located on the grid"
	
	^self allEntityClasses select: [:cl | cl isSituatedClass]
]

{ #category : #'+ activityEditor' }
CMAbstractModel class >> openActivityDiagram: operationName [
	" Agent openActivityDiagram: #exampleTest   "
	
	| ad |
	"le diagramme en m√©moire s'ouvre mais les activit√©s ne sont plus connect√©es. Il faut donc recr√©er"
	self activityDiagrams
		removeKey: operationName
		ifAbsent: [nil].
	ad := self activityDiagramsAt: operationName.
	ad open.
	ad setTitle.
	^ad
]

{ #category : #'+ activityEditor' }
CMAbstractModel class >> openBlankActivityDiagramEditor [
	" Purpose: open a blank ActivityDiagramEditor for this class.
	 ex:   AgentLocation openActivityDiagramEditor   "
	
	^ActivityDiagramEditor forClass: self
]

{ #category : #'managing classes' }
CMAbstractModel class >> passiveClasses [
	"return a collection of passive classes of the model"

	^ self
		allClassesInPackage
		remove: self;
		removeAll: self spatialClasses;
		removeAll: self socialClasses;
		yourself
]

{ #category : #accessing }
CMAbstractModel class >> passiveClasses: aCollection [
	passiveClasses := aCollection
]

{ #category : #'managing classes' }
CMAbstractModel class >> passiveObjectClasses [
	" self passiveClasses select: [:i | i inheritsFrom: PassiveObject] "

	^ passiveClasses 
]

{ #category : #accessing }
CMAbstractModel class >> povColorsDict [
	^ povColorsDict
]

{ #category : #accessing }
CMAbstractModel class >> povColorsDict: aDictionary [
	
	povColorsDict := aDictionary
]

{ #category : #'- default value' }
CMAbstractModel class >> povColorsDict_default [
	"Return the default value of povColorsDict attribute"
	
	^nil
]

{ #category : #'- activityEditor' }
CMAbstractModel class >> preStringForActivitySelector [
	
	^'activity_'
]

{ #category : #probes }
CMAbstractModel class >> probes [
	^ (Pragma allNamed: #probe in: self) collect: #methodSelector
]

{ #category : #accessing }
CMAbstractModel class >> randomAttributes [
	"' Returns a list of randomAttributes (List of arrays: #(#attribute scopeLevel #randFloat min max) ).
	This method is automatically redefined when creating new random attributes"
	
	^#()
]

{ #category : #'- activityEditor' }
CMAbstractModel class >> removeActivityDiagram: instanceOperationName [
	"Removes the diagram store into activityDiagrams dictionnary, but also deletes the 2 methods defining the diagram"
	
	self activityDiagrams
		removeKey: instanceOperationName
		ifAbsent: [nil].
	self removeSelector: instanceOperationName asSymbol.
	self class
		removeSelector:
			(self preStringForActivitySelector , instanceOperationName asString)
				asSymbol
]

{ #category : #accessing }
CMAbstractModel class >> removeRandomAttributes: anArray [
	"' Compile #randomAttributes by removing anArray: #(#attribute scopeLevel #randFloat min max) "
	
	| list code |
	list := self randomAttributes asList.
	list
		remove: anArray
		ifAbsent: [nil].
	code := 'randomAttributes \	"Returns a list of randomAttributes: a List of arrays: [#(#attributeName scopeLevel #randFloat min max) #(...) #(...) ... ].

	This method is automatically redefined when creating new random attributes" 	\'
		withCRs.
	code := code ,
			'	| list |
	list := List new. \'.
	list do: [:line | code := code , '	list add: ' , line printString , '. \'].
	code := (code , '	^list') withCRs.
	self class
		compile: code
		classified: '- accessing' asString
		notifying: nil
]

{ #category : #'managing classes' }
CMAbstractModel class >> renameAttribute: oldName by: newName [
	"(ex: theCells by theLandUnits)"
	
	(self instVarNames includes: oldName)
		ifTrue:
			[Cursor wait
				showWhile:
					[(RenameInstanceVariableRefactoring rename: oldName to: newName in: self)
						execute]]
]

{ #category : #'managing classes' }
CMAbstractModel class >> renameSelector: oldName by: newName inputParametersNumber: nbArgs [
	"ex: theCells by theLandUnits or 
	theCells:xx by theLandUnits:xx"
	
	| map |
	map := (1 to: nbArgs) collect: [:i | i].
	(self allSelectors includes: oldName asSymbol)
		ifTrue:
			[Cursor wait
				showWhile:
					[(RenameMethodRefactoring
						renameMethod: oldName asSymbol
						in: self
						to: newName asSymbol
						permutation: map) execute]]
]

{ #category : #probes }
CMAbstractModel class >> setActiveProbes: listProbes [
	| selectedClass selectedClassName |
	self activeProbes: OrderedCollection new.
	self allEntityClasses do: [ :c | c activeProbes: OrderedCollection new ].
	listProbes
		do: [ :s | 
			s = CMSimManager separator
				ifFalse: [
					selectedClassName := (s findTokens: $>) first asSymbol.
					selectedClassName = #Global
						ifTrue: [ selectedClassName := self name ].
					selectedClass := selectedClassName asClass.
					selectedClass activeProbes add: (s findTokens: $>) last asSymbol ] ]
]

{ #category : #compiling }
CMAbstractModel class >> setColor: aColorValue forProbe: aSymbol [
	"creates a color method at class level, such as :
colorOfProbe_aSymbol
	^ ColorValue yellow"
	
	self class
		compile:
			('colorOfProbe_' , aSymbol asString , '\  ^ ' , aColorValue printString)
				withCRs
		classified: '- probes'
		notifying: nil
]

{ #category : #'description - primitives' }
CMAbstractModel class >> setCormasAndVwVersion [
	"Creates 2 class methods: #cormasCompatibleVersion and #vwCompatibleVersion"
	
	self class
		compile:
			'cormasCompatibleVersion' ,
					'
^ ' , Cormas version printString
		classified: 'description'
		notifying: nil.
	self setDescriptionFor: 'vwCompatibleVersion' withText: SystemVersionName	"SystemUtils.SystemVersionName     -> '7.6'"	"SystemUtils version   ->  'VisualWorks¬Æ NonCommercial, 7.6 of lundi 3 mars 2008'"
]

{ #category : #'description - primitives' }
CMAbstractModel class >> setDescriptionFor: method withText: text [
	"Creates  a method for a CormasModel subclass from the text"
	
	| textWithoutQuote |
	textWithoutQuote := text copyReplaceAll: #($') with: #($").	"embedded quotes get doubled"
	self class
		compile:
			method ,
					'
^ ''' , textWithoutQuote , '''	'
		classified: 'description'
		notifying: nil
]

{ #category : #'description - primitives' }
CMAbstractModel class >> setVersion: aString [
	
	self setDescriptionFor: 'version' withText: aString
]

{ #category : #compiling }
CMAbstractModel class >> setterForEntityClass: aClass [
	"efficiently create the setter selector for the entity class aClass (avoid concatenation).
	ex : Object -> #theObjects:

	self setterForEntityClass: CMEntity
	"

	^ (self getterForEntityClass: aClass) , ':'
]

{ #category : #'- default value' }
CMAbstractModel class >> simManager_default [
	"Return the default value of simManager attribute"
	
	^nil
]

{ #category : #'managing classes' }
CMAbstractModel class >> socialClasses [
	" Answer a <Collection> of social classes of the model. Already configured in #initializeWithoutVS "
	" self allClassesInPackage select: [ :e | e inheritsFrom: CMAgent ] "

	^ socialClasses ifNil: [ socialClasses := self allClassesInPackage select: [ :e | e inheritsFrom: CMAgent ] ]
]

{ #category : #accessing }
CMAbstractModel class >> socialClasses: aCollection [
	socialClasses := aCollection
]

{ #category : #'- default value' }
CMAbstractModel class >> spaceModel_default [
	"Return the default value of spaceModel attribute"
	
	^nil
]

{ #category : #'managing classes' }
CMAbstractModel class >> spatialClasses [
	" Answer a <Collection> of spatial classes of the model. Aldready configured in #initializeWithoutVS "
	"self allClassesInPackage select: [ :aClass | aClass inheritsFrom: CMSpatialEntityCell ]"
	^ spatialClasses
]

{ #category : #accessing }
CMAbstractModel class >> spatialClasses: aCollection [
	spatialClasses := aCollection
]

{ #category : #'managing classes' }
CMAbstractModel class >> spatialClasses_sorted [
	"return a collection of SpatialClasses of the model, starting with the Cell class"
	
	| coll |
	self cellClass ifNil: [^#()].
	coll := self compoundSpatialClasses asOrderedCollection.
	coll addFirst: self cellClass.
	^coll
]

{ #category : #'- activityEditor' }
CMAbstractModel class >> superClassesUntil: aSuperClass [
	"Return the super classes of the class sender until aSuperClass"
	
	| coll |
	coll := self withAllSuperclasses
		select: [:aClass | aClass inheritsFrom: aSuperClass].
	coll add: aSuperClass.
	^coll
]

{ #category : #'- activityEditor' }
CMAbstractModel class >> superClassesUntilEntity [
	"Return the super classes of the class sender until CormasModel"
	
	^self superClassesUntil: CMAbstractModel
]

{ #category : #'+ testing - scheduling' }
CMAbstractModel class >> testPeriodicity: anInteger [
	"This method is moved to the instance side."

	self deprecated: 'This method is moved to the instance side.'.
	^ self timeStep \\ anInteger = 0
]

{ #category : #compiling }
CMAbstractModel class >> testTheAccessors [
	"test if reader and setter accessors exist for each terminal class (and if readerAccessors contains IndexedSet), otherwise it recompiles new code"
	
	| accessor |
	self allEntityClasses
		do:
			[:aClass | 
			aClass isAbstract
				ifFalse:
					[accessor := self getterForEntityClass: aClass.
					(self canUnderstand: accessor)
						ifFalse: [self createInstancesAccessorsForClass: aClass].
					(self allInstVarNames includes: accessor asString)
						ifFalse: [self createInstancesAccessorsForClass: aClass].
					((self sourceCodeAt: accessor) string indexOfSubCollection:
							'IndexedSet' startingAt: 1) = 0
						ifTrue: [self createInstancesAccessorsForClass: aClass]]]
]

{ #category : #'+ accessing - scheduling' }
CMAbstractModel class >> timeStep [
	"Deprecated. If you want to get the current timeStep, try 'self cormasModel timeStep'."

	self
		deprecated:
			'timeStep is moved to the instance side. If you want to get the current time, try "self cormasModel timeStep".'
]

{ #category : #accessing }
CMAbstractModel class >> timeStep: anInteger [
	"deprecated. The timeStep management is moved to the instance side so that we can run multiple instances of models."

	self
		deprecated: 'The timeStep management is moved to the instance side.'.

]

{ #category : #'- default value' }
CMAbstractModel class >> timeStep_default [
	"Return the default value of timeStep attribute"
	
	^0
]

{ #category : #'- default value' }
CMAbstractModel class >> uiSession_default [
	"Return the default value of uiSession attribute"
	
	^nil
]

{ #category : #accessing }
CMAbstractModel class >> visualStateIsOpen [
	^ visualStateIsOpen
]

{ #category : #accessing }
CMAbstractModel class >> visualStateIsOpen: aBoolean [
	visualStateIsOpen := aBoolean
]

{ #category : #'- default value' }
CMAbstractModel class >> visualStateIsOpen_default [
	"Return the default value of visualStateIsOpen attribute"

	^ false
]

{ #category : #'managing classes' }
CMAbstractModel class >> visualizableClasses [
	"Return a list of the model' classes for whom a 'pov' protocol exists"
	
	| coll |
	coll := OrderedCollection withAll: self occupantClasses.
	coll addAll: self spatialClasses.
	^coll
]

{ #category : #'managing classes' }
CMAbstractModel class >> visualizedClasses [
	"Return a list of the model' classes inheriting from Entity for whom a 'pov' protocol exists"
	
	^self allEntityClasses	"select: [:cl | (cl organization listAtCategoryNamed: #pov) isEmpty not]"
]

{ #category : #accessing }
CMAbstractModel >> activeControl [
	^ activeControl ifNil: [ activeControl := self class defaultControl ]
]

{ #category : #accessing }
CMAbstractModel >> activeControl: aSymbol [
	activeControl := aSymbol
]

{ #category : #accessing }
CMAbstractModel >> activeInit [
	^ activeInit ifNil: [ activeInit := self class defaultInit ]
]

{ #category : #accessing }
CMAbstractModel >> activeInit: aSymbol [
	activeInit := aSymbol
]

{ #category : #deprecated }
CMAbstractModel >> allEntities: aClass [
	
	^self allTheEntities: aClass
]

{ #category : #'- pov and info' }
CMAbstractModel >> allEntitiesFrom: aClass getInfoFor: infoSymbol [
	"return a collection of info from all entities inheriting from aClass"
	
	^(self allTheEntities: aClass)
		collect: [:each | each getInfoFor: infoSymbol]
]

{ #category : #'- pov and info' }
CMAbstractModel >> allEntitiesFrom: aClass povAt: povSelector [
	"return a collection of povs from all entities inheriting from aClass"
	
	^(self allTheEntities: aClass) collect: [:each | each povAt: povSelector]
]

{ #category : #'accessing - entities' }
CMAbstractModel >> allTheEntities [
	"Returns a collection of all the instances of the Entity (and sub classes) collected by cormasModel"
	
	| coll |
	coll := OrderedCollection new.
	self class allEntityClasses do: [:cl | coll addAll: (self theEntities: cl)].
	^coll
]

{ #category : #'accessing - entities' }
CMAbstractModel >> allTheEntities: aClass [
	"Purpose: Returns a collection of all the instances of aClass (and sub classes) collected by cormasModel. Usefull for abstract classes
Example: (self allTheEntities: Forager) is returning all the instances of restrained and unrestrained foragers"
	
	| coll |
	coll := OrderedCollection new.
	aClass withAllSubclasses
		do: [:cl | cl isAbstract ifFalse: [coll addAll: (self theEntities: cl)]].
	^coll
]

{ #category : #'accessing - entities' }
CMAbstractModel >> allTheEntitiesOfClassOrCollec: aCollecOrClass [
	"Purpose:  In case aCollecOrClass is a class or a class name (symbol), the method returns all the entities of the class and subclasses. In case aCollecOrClass is a collection of entities, the method return the same collection
Examples:
self  entitiesFromACollecOrClass: #Farmer
self  entitiesFromACollecOrClass: Farmer
self  entitiesFromACollecOrClass: self theFarmers"
	
	aCollecOrClass isSymbol
		ifTrue: [^self allTheEntities: aCollecOrClass class].
	aCollecOrClass isCollection ifTrue: [^aCollecOrClass].
	aCollecOrClass cormasHelper isTypeEntity
		ifTrue: [^Array with: aCollecOrClass].
	aCollecOrClass cormasHelper isTypeEntityClass
		ifTrue: [^self allTheEntities: aCollecOrClass].
	^nil
]

{ #category : #'accessing - entities' }
CMAbstractModel >> allTheLocatedEntities [
	"Returns a collection of all the instances of AgentLocation and of ObjectLocation (and sub classes) collected by cormasModel"
	
	^self allTheEntities select: [:entity | entity isClassLocation]
]

{ #category : #'accessing - entities' }
CMAbstractModel >> allTheLocatedEntities: aClass [
	"Returns a collection of all the Located Entities (AgentLocation & ObjectLocation) of the model"
	
	| theLocatedObjects |
	theLocatedObjects := OrderedCollection new.
	self spaceModel elementaryEntities
		do:
			[:cell | 
			aClass withAllSubclasses
				do:
					[:class | 
					theLocatedObjects
						addAll:
							(cell theOccupants
								at: class name
								ifAbsent: [Array new])]].
	^theLocatedObjects
]

{ #category : #'accessing - entities' }
CMAbstractModel >> allTheLocatedObjects [
	"Returns a collection of all the instances of ObjectLocation (and sub classes) collected by cormasModel"
	
	^self allTheEntities select: [:entity | entity isObjectLocation]
]

{ #category : #'accessing - entities' }
CMAbstractModel >> allThePassiveObjects [
	"Returns a collection of all the instances of PassiveObject (and sub classes) collected by cormasModel"
	
	^self allTheEntities select: [:entity | entity isPassiveObject]
]

{ #category : #'accessing - entities' }
CMAbstractModel >> allTheSituatedEntities [
	"Returns a collection of all the instances of AgentLocation and of ObjectLocation (and sub classes) collected by cormasModel, which are situated on a patch"
	
	^self allTheEntities select: [:entity | entity isSituated]
]

{ #category : #'accessing - entities' }
CMAbstractModel >> allTheSituatedEntities: aClass [
	"Purpose: Returns a collection of all the situated instances of aClass (and sub classes) collected by cormasModel. Usefull for abstract classes
Example: (self allTheSituatedEntities: Forager) is returning all the instances of restrained and unrestrained foragers that are situated on the space"
	
	| coll |
	coll := OrderedCollection new.
	aClass withAllSubclasses
		do:
			[:cl | 
			cl isAbstract
				ifFalse:
					[coll addAll: ((self theEntities: cl) select: [:e | e isSituated])]].
	^coll
]

{ #category : #announcement }
CMAbstractModel >> announceProbesDataUpdated [
	^ self announcer
		announce: (CMProbesDataUpdatedAnnouncement timeStep: self timeStep)
]

{ #category : #announcement }
CMAbstractModel >> announceTimeChange [
	^ self announcer
		announce: (CMTimeChangedAnnouncement timeStep: self timeStep)
]

{ #category : #announcement }
CMAbstractModel >> announcer [
    ^ announcer ifNil: [ announcer := Announcer new ]
]

{ #category : #'- simulation settings' }
CMAbstractModel >> applyModelDefaultCormasSettings [
	
	self cormas isChangesDelayed = self class defaultDelayChangesSetting
		ifFalse: [self cormas toggleDelayChanges]
]

{ #category : #'+ control' }
CMAbstractModel >> ask: aClass select: aBlockCondition toDo: aSymbol [
	"Purpose: To ask the instances of a class that satisfy a condition to execute a method named by aSymbol. The entities are ordered according to their id.
Arguments: aBlockCondition is aBlock which use the following syntax [:x | x message ]  wherer x message should return true or false
Example: self ask: Animal select: [:f | f energy > 10] toDo: #reproduce"
	
	self ask: aClass select: aBlockCondition toDo: aSymbol with: #()
]

{ #category : #'+ control' }
CMAbstractModel >> ask: aClass select: aBlockCondition toDo: aSymbol with: aValueOrArrayOfValues [
	"Purpose: To ask the instances of a class that satisfy a condition to execute a method which requires arguments and named by aSymbol which should end by ':'. The entities are ordered according to their id. 
Arguments: aBlockCondition is aBlock which use the following syntax [:x | x message ]  wherer x message should return true or false
Example: self ask: Fireman select:[:f | f isOccupied not] toDo: #moveWithinRange: with: 10
Example: self ask: Animal select: [:a | a energy > 10] toDo: #eatQuantity: with: 5"
	
	| allArguments collecEntities |
	"Check if the argument is a collection or array and rebuilts the list of arguments"
	allArguments := (aValueOrArrayOfValues isKindOf: Array)
		ifTrue: [aValueOrArrayOfValues]
		ifFalse: [Array with: aValueOrArrayOfValues].
	collecEntities := (self allTheEntitiesOfClassOrCollec: aClass) select:
			aBlockCondition.
	collecEntities isEmpty
		ifFalse:
			[self
				checkEntity: collecEntities first
				respondsTo: aSymbol.
			collecEntities do: [:c | c perform: aSymbol withArguments: allArguments]]
]

{ #category : #'+ control' }
CMAbstractModel >> ask: aCollecOrClass toDo: aSymbol [
	"Purpose: To ask a collection of instances or all the instances of a class to execute a method named by aSymbol. In case aCollecOrClass is a 	class, the entities are ordered according to their id. In case aCollecOrClass is a collection of instances, the order of the collection is 	kept.
	Example: self ask: Fireman toDo: #move
	Example: self ask: (self theAnimals select:[:f | f energy > 10]) toDo: #reproduce"

	self ask: aCollecOrClass toDo: aSymbol with: #()
]

{ #category : #'+ control' }
CMAbstractModel >> ask: aCollecOrClass toDo: aSymbol with: aValueOrArrayOfValues [
	"Purpose: To ask a collection of instances or all the instances of a class to execute a method which requires arguments and named by aSymbol which should end by ':'. In case aCollecOrClass is a class, the entities are ordered according to their id. In case aCollecOrClass is a collection of instances, the order of the collection is kept.
Example: self ask: Fireman toDo: #moveWithinRange: with: 10
Example: self ask: Fireman toDo: #moveToCellState:maxDistance: with: #(#onFire 10)
Example: self ask: (self theAnimals select:[:f | f energy > 10]) toDo: #eatQuantity: with: 5"
	
	| allArguments collecEntities |
	"Check if the argument is a collection or array and rebuilts the list of arguments"
	allArguments := Cormas arrayFrom: aValueOrArrayOfValues.
	collecEntities := self allTheEntitiesOfClassOrCollec: aCollecOrClass.
	collecEntities isEmpty
		ifFalse:
			[self
				checkEntity: collecEntities first
				respondsTo: aSymbol.
			collecEntities do: [:c | c perform: aSymbol withArguments: allArguments]]
]

{ #category : #'+ control' }
CMAbstractModel >> askRandom: aClass select: aBlockCondition toDo: aSymbol [
	"Purpose: To ask a collection of instances or all the instances of a class to execute a method named by aSymbol. The instances are randomly mixed.
Arguments: aBlockCondition is aBlock which use the following syntax [:x | x message ]  wherer x message should return true or false
Example: self askRandom: Animal with: [:f | f energy > 10] toDo: #reproduce"
	
	self askRandom: aClass select: aBlockCondition toDo: aSymbol with: #()
]

{ #category : #'+ control' }
CMAbstractModel >> askRandom: aClass select: aBlockCondition toDo: aSymbol with: aValueOrArrayOfValues [
	"Purpose: To ask a collection of instances or all the instances of a class to execute a method which requires arguments and named by aSymbol which should end by ':'. The instances are randomly mixed.
Arguments: aBlockCondition is aBlock which use the following syntax [:x | x message ]  wherer x message should return true or false
Example: self askRandom: Fireman with:[:f| f isOccupied not] toDo: #moveWithinRange: with: 10
Example: self askRandom: Animal with: [:a | a energy > 10] toDo: #eatQuantity: with: 5"
	
	| allArguments collecEntities |
	"Check if the argument is a collection or array and rebuilts the list of arguments"
	allArguments := (aValueOrArrayOfValues isCollection
		and: [aValueOrArrayOfValues isCharacters not])
		ifTrue: [aValueOrArrayOfValues]
		ifFalse: [Array with: aValueOrArrayOfValues].
	collecEntities := (self allTheEntitiesOfClassOrCollec: aClass) select:
			aBlockCondition.
	collecEntities isEmpty
		ifFalse:
			[self
				checkEntity: collecEntities first
				respondsTo: aSymbol.
			(Cormas mix: collecEntities)
				do: [:c | c perform: aSymbol withArguments: allArguments]]
]

{ #category : #'+ control' }
CMAbstractModel >> askRandom: aCollecOrClass toDo: aSymbol [
	"Purpose: To ask a collection of instances or all the instances of a class to execute a method named by aSymbol. The instances are randomly mixed.
Example: self askRandom: Fireman toDo: #move
Example: self askRandom: (self theAnimals select:[:f | f energy > 10]) toDo: #reproduce"
	
	self askRandom: aCollecOrClass toDo: aSymbol with: #()
]

{ #category : #'+ control' }
CMAbstractModel >> askRandom: aCollecOrClass toDo: aSymbol with: aValueOrArrayOfValues [
	"Purpose: To ask a collection of instances or all the instances of a class to execute a method which requires arguments and named by aSymbol which should end by ':'. The instances are randomly mixed.
Example: self askRandom: Fireman toDo: #moveWithinRange: with: 10
Example: self askRandom: Fireman toDo: #moveToCellState:maxDistance: with: #(#onFire 10)
Example: self askRandom: (self theAnimals select:[:f | f energy > 10]) toDo: #eatQuantity: with: 5"
	
	| allArguments collecEntities |
	"Check if the argument is a collection or array and rebuilts the list of arguments"
	allArguments := Cormas arrayFrom: aValueOrArrayOfValues.
	collecEntities := self allTheEntitiesOfClassOrCollec: aCollecOrClass.
	collecEntities isEmpty
		ifFalse:
			[self
				checkEntity: collecEntities first
				respondsTo: aSymbol.
			(Cormas mix: collecEntities)
				do: [:c | c perform: aSymbol withArguments: allArguments]]
]

{ #category : #'+ accessing - spatial grid' }
CMAbstractModel >> autoResizeGrids: aBoolean [
	"Purpose: automatically resize all the opened spatial grids when aBoolean = true, otherwise, do not resize"

	self spaceModel autoResizeBounds: aBoolean
]

{ #category : #'+ utilities - population metrics' }
CMAbstractModel >> averageOfAttribute: att of: aCollecOrClass [
	"Purpose: returns the average value of an attribute for a collection of entities (aCollecOrClass)
Argument: aCollecOrClass can be a collection of entities or the name of class, in which case all the entities of that class (including subclasses entities) will be included in the collection
Examples: self averageOfAttribute: #age of: Person
			 self averageOfAttribute: #age of: (self theBirds)"
	
	^Cormas
		average:
			((self allTheEntitiesOfClassOrCollec: aCollecOrClass) asOrderedCollection
				collect: [:e | e perform: att])
]

{ #category : #'+ accessing - entities' }
CMAbstractModel >> centralCell [
	"Purpose: returns the cell located at the center of the spatial grid. Number of lines and number of columns of the spatial grid have to be odd"

	^ self spaceModel centralLocation
]

{ #category : #accessing }
CMAbstractModel >> channel [
	
	^channel
]

{ #category : #accessing }
CMAbstractModel >> channel: aCanal [
	
	channel := aCanal
]

{ #category : #private }
CMAbstractModel >> checkEntity: anEntity respondsTo: aSymbol [
	"check the entity can responds to a message. Alert the user if not"
	
	(anEntity respondsTo: aSymbol) ifTrue: [^self].
	self cormas
		warn: 'The class <1s> does not have a method called <2p>'
		with: anEntity class name
		with: aSymbol.
]

{ #category : #'accessing - entities' }
CMAbstractModel >> classFromSymbol: aSymbol [
	self deprecated: 'Use class method on Symbol instead of classFromSymbol:'.
	^ aSymbol class
]

{ #category : #'interface closing' }
CMAbstractModel >> closeRequest [
	"When the model is closing, you may redefine this method If you want to finalise some things, as for example, to close a specific window of the model"
	
	super closeRequest
]

{ #category : #'referencing entities' }
CMAbstractModel >> collect: anEntity [
	"adds anEntity to the collection called theXXXs (where XXX is equal to the class name)"
	
	| collection |
	collection := self theEntities: anEntity class.
	collection cormasHelper isTypeArrayNotChars
		ifTrue:
			[self
				setTheEntity: anEntity class
				with: (OrderedCollection withAll: collection).
			collection := self theEntities: anEntity class].
	collection add: anEntity
]

{ #category : #'referencing entities' }
CMAbstractModel >> collectAll: aCollectionOfEntities [
	"add all the elements of aCollectionOfEntities to the collection called theXXXs (where XXX is equal to the class name)"
	
	aCollectionOfEntities isEmpty ifTrue: [^nil].
	(self theEntities: aCollectionOfEntities first class) addAll:
			aCollectionOfEntities
]

{ #category : #accessing }
CMAbstractModel >> collector [
	"Getter accessor with default value = Collector new model: self "
	
	collector isNil ifTrue: [self setNewCollector].
	^collector
]

{ #category : #accessing }
CMAbstractModel >> collector: aCollector [
	collector := aCollector
]

{ #category : #'- probes color' }
CMAbstractModel >> colorOfProbe: aProbeSymbol [
	"Method is defined by the class
	 ->answer the color of a probe (to display the curve in ChartsInterface)"
	
	^self class colorOfProbe: aProbeSymbol
]

{ #category : #'accessing - entities' }
CMAbstractModel >> compoundSpatialClasses [
	
	| coll |
	coll := self class compoundSpatialClasses.
	coll size = 0
		ifTrue: [^self cormas warn: 'Pas d''entites spatiales composees !'].
	coll size > 1
		ifTrue:
			[^self cormas warn:
					'Il y a plusieurs classes d''entites spatiales composees !'].
	^self perform: (self getterForEntityClass: coll first)
]

{ #category : #accessing }
CMAbstractModel >> cormas [
	
	^cormas ifNil: [cormas := Cormas current]
]

{ #category : #accessing }
CMAbstractModel >> cormas: anObject [
	
	cormas := anObject
]

{ #category : #deprecated }
CMAbstractModel >> create: n groups: classGroup from: aCollec [
	
	^self createN: n groups: classGroup from: aCollec
]

{ #category : #ODBC }
CMAbstractModel >> createAccessConnection: username password: password base: aDataBase [
	"Create a ODBC connection on base aDataBase (<String>) with username (<String>) and password (<String>).
This method may be called from your model in order to save or get values from a database."
	
	self
		database:
			(CMToAccess createODBCConnection: username password: password base:
					aDataBase)
]

{ #category : #'+ instance creation - spatial entities' }
CMAbstractModel >> createAggregate: compoundEntity from: aSet [
	"Purpose: Creates and returns an instance of compoundEntity composed with a set of cells.
Arguments: 	aSet = a set of base entities (inheriting from <SpatialEntity>) 
	compoundEntity = a Class name inheriting from <SpatialEntitySet>
Example: self createAggregate: Plot from: (self centalCell recursiveNeighbourhood: 5)"
	
	^self spaceModel createOneAggregate: compoundEntity from: aSet
]

{ #category : #'+ instance creation - spatial entities' }
CMAbstractModel >> createAggregates: compoundEntity from: baseEntity attribute: attributeName [
	"Purpose: Create n aggregates that will occupy the whole grid. Each aggregate is composed of cells that have the same value of anAttribute. This method resets all aggregates 'compoundEntity' and rebuilds them.
Attributes: baseEntity is a Class name inheriting from SpatialEntityElement. anAttribute is a symbol referring to a baseEntity's attribute name. compoundEntity is a Class name inheriting from SpatialEntitySet.
Example: self createAggregates: ZoneArea from: Cell attribute: #landCover"
	
	^self spaceModel setAggregates: compoundEntity from: baseEntity attribute:
			attributeName
]

{ #category : #'+ instance creation - spatial entities' }
CMAbstractModel >> createAggregates: compoundEntity from: baseEntity attribute: attributeName1 attribute: attributeName2 [
	"Purpose: Create n aggregates that will occupy the whole grid. Each aggregate is composed of cells that have the same value for anAttributeName1 and anAttributeName2. This method resets all aggregates 'compoundEntity' and rebuilds them.
Attributes: baseEntity is a Class name inheriting from SpatialEntityElement. attributeName1 and attributeName2 are symbols referring to a baseEntity's attribute name. compoundEntity is a Class name inheriting from SpatialEntitySet.
Example: self createAggregates: DistrictZoneArea from: Cell attribute: #landCover attribute: #district"
	
	^self spaceModel setAggregates: compoundEntity from: baseEntity attribute:
			attributeName1 attribute: attributeName2
]

{ #category : #'+ instance creation - spatial entities' }
CMAbstractModel >> createAggregates: compoundEntity from: baseEntity attribute: attributeName excludingValue: aValue [
	"Purpose: Create n aggregates that will not necessarily occupy the whole grid. Cells which have aValue for anAttribute are excluded from the process. Each aggregate is composed of cells that have the same value of anAttribute (except the excluded one). This method resets all aggregates 'compoundEntity' and rebuilds them.
Attributes: compoundEntity is a Class name inheriting from SpatialEntitySet. baseEntity is a Class name inheriting from SpatialEntityElement. anAttributeName is a symbol referring to a baseEntity's attribute name. aValue is a specific value of the attribute, for instance #notDefined, or 0. 
Example: self createAggregates: ZoneArea from: Cell attribute: #landCover excludingValue: #water"
	
	^self spaceModel setAggregates: compoundEntity from: baseEntity attribute:
			attributeName excludingValue: aValue
]

{ #category : #'+ instance creation - spatial entities' }
CMAbstractModel >> createAggregates: compoundEntity from: baseEntity horizontalDividers: xRatio verticalDividers: yRatio [
	"Purpose: Creates (xRatio x yRatio) rectangular aggregates by dividing the grid by yRatio columns and xRatio lines. The aggregates will  occupy the whole grid. This method resets all aggregates 'compoundEntity' and rebuids them. 
Arguments: baseEntity = a subClass of  <SpatialEntity> 
	compoundEntity = a subClass of  <SpatialEntitySet>
Example: self createAggregates: SquareArea from: Cell horizontalDividers: 5 verticalDividers: 4 --> for a spatial grid of 41 * 41, it will create 20 aggregates: 5 along the horizontal direction and in 4 along the vertical direction"
	
	^self spaceModel setAggregates: compoundEntity from: baseEntity
		horizontalDividers: xRatio verticalDividers: yRatio
]

{ #category : #'+ instance creation - spatial entities' }
CMAbstractModel >> createAggregates: compoundEntity from: baseEntity verifying: aBlock [
	"Purpose: Create n aggregates from cells that verify a condition. This method resets all aggregates 'compoundEntity' and rebuilds them. 
Arguments: compoundEntity is a Class name inheriting from SpatialEntitySet.
baseEntity is a Class name inheriting from SpatialEntityElement.
aBlock is the condition written as a block refering to a test on each of the base entity
Example: self createAggregates: Forest from: Cell verifying: [:aCell | aCell state = #tree]"
	
	^self spaceModel setAggregates: compoundEntity from: baseEntity verifying:
			aBlock
]

{ #category : #'+ instance creation - spatial entities' }
CMAbstractModel >> createAggregates: compoundEntity from: baseEntity verifying: aBlock minimumSize: ms [
	"Purpose: Create n aggregates from cells that verify a condition. Aggregates are built only if they can contain a minimum number of cells specified by ms (ms must be >= 1). This method resets all aggregates 'compoundEntity' and rebuilds them. 
Attributes: baseEntity is a Class name inheriting from SpatialEntityElement. attributeName1 and attributeName2 are symbols referring to a baseEntity's attribute name.
compoundEntity is a Class name inheriting from SpatialEntitySet.
ms is an integer
Example: self createAggregates: Forest from: Cell verifying: [:aCell | aCell state = #tree] minimumSize: 5"
	
	^self spaceModel setAggregates: compoundEntity from: baseEntity verifying:
			aBlock minimumSize: ms
]

{ #category : #'+ instance creation - spatial entities' }
CMAbstractModel >> createAggregates: compoundEntity fromSeeds: aCollecOfCells [
	"Purpose: Create n aggregates that will occupy the whole grid. The number n of aggregates correspond to the size of aCollecOfCells. Each aggregate is made of an element of aCollecOfCells (a seed) and of its surrounding cells. This method resets all aggregates 'compoundEntity' and rebuilds them.
Arguments: aCollecOfCells is a collection of cells (SpatialEntityElement). compoundEntity is a Class name inheriting from SpatialEntitySet.
Example: self createAggregates: VitalArea fromSeeds: (self theDens collect:[:c | c patch])
Example: self createAggregates: Forest fromSeeds: (self theCells select:[:c| c isForestSeed]."
	
	^self spaceModel setAggregates: compoundEntity fromSeeds: aCollecOfCells
]

{ #category : #'+ instance creation - spatial entities' }
CMAbstractModel >> createAggregates: compoundEntity fromSeeds: aCollecOfCells maxSize: anInteger [
	"Purpose: Create aggregates from a collection of cells but the expansion of aggregates is constrained by a maximum size This method resets all aggregates 'compoundEntity' and rebuids them. 
Arguments:	aCollecOfCells = a collection of base entities (inheriting from <SpatialEntityElement>) 
compoundEntity = a subClass of  <SpatialEntitySet> 
anInteger is the maximum size an aggregate may have .
Example: self createAggregates: Forest fromSeeds: (self pickN: 5 entities: Cell) maxSize: 12   -> Will create 5 forests of a maximum size of 12"
	
	^self
		createAggregates: compoundEntity
		fromSeeds: aCollecOfCells
		sizeDistribution:
			(Array
				with:
					(Array
						with: aCollecOfCells size
						with: anInteger))
]

{ #category : #'+ instance creation - spatial entities' }
CMAbstractModel >> createAggregates: compoundEntity fromSeeds: aCollecOfCells sizeDistribution: aDistribution [
	"Purpose: Create aggregates from a collection of cells but the expansion of aggregates is constrained by a size distribution. This method requieres that the aggregate owns an attribute called givenSize. This method resets all aggregates 'compoundEntity' and rebuids them. 
Arguments:	aCollecOfCells = a collection of base entities (inheriting from <SpatialEntityElement>) 
compoundEntity = a subClass of  <SpatialEntitySet> 
aDistribution is a collection ( (n1,s1), (n2,s2)) , n being the number of aggregates of size s.
Example: self createAggregates: Forest fromSeeds: (self theCells select:[:c| c isForestSeed] sizeDistribution: (#(3 1) #(5 2) #(2 3)). --> create 3 aggregates of size 1, 5  aggregates of size 2, and 2 aggregates of size 3"
	
	^self spaceModel setAggregates: compoundEntity fromSeeds: aCollecOfCells
		sizeDistribution: aDistribution
]

{ #category : #'+ instance creation - spatial entities' }
CMAbstractModel >> createAggregates: compoundEntity fromSeeds: aCollecOfCells verifying: aBlock [
	"Purpose: Create n aggregates made of an element of aCollecOfCells (a seed) and surrounding cells verifying a defined condition (aBlock). This method resets all aggregates 'compoundEntity' and rebuilds them.
Arguments: compoundEntity is a Class name inheriting from SpatialEntitySet.
aCollecOfCells is a collection of cells (SpatialEntityElement).
aBlock represnts the condition 
Example: self createAggregates: Forest fromSeeds: (self theCells select:[:c| c isForestSeed] verifying: [:c | c landCover ~= #water]"
	
	^self spaceModel setAggregates: compoundEntity fromSeeds: aCollecOfCells
		verifying: aBlock
]

{ #category : #'+ instance creation - spatial entities' }
CMAbstractModel >> createAggregates: compoundEntity fromSeeds: aCollecOfCells verifying: aBlock sizeDistribution: dis [
	"Purpose: Create n aggregates made of an element of aCollecOfCells (a seed) and surrounding cells verifying a defined condition (aBlock). The expansion of aggregates is constrained by a size distribution. This method resets all aggregates 'compoundEntity' and rebuilds them.
Arguments: compoundEntity is a Class name inheriting from SpatialEntitySet.
aCollecOfCells is a collection of cells (SpatialEntityElement).
aBlock represnts the condition 
aDistribution is a collection ( (n1,s1), (n2,s2)) , n being the number of aggregates of size s.
Example: self createAggregates: Forest fromSeeds: (self theCells select:[:c| c isForestSeed] verifying: [:c | c state isNil not] sizeDistribution: (#(3 1) #(5 2) #(2 3))"
	
	^self spaceModel setAggregates: compoundEntity fromSeeds: aCollecOfCells
		verifying: aBlock sizeDistribution: dis
]

{ #category : #deprecated }
CMAbstractModel >> createAndLoadAttributesFromClass: aClass fromFile: aStringOrFilename [
	"Load data from a File, create as many instances of aClass as necessary and set the values of the attributs according to the format declared into the file.
	!!Be carefull, you should use this method to create spatial entity instances !!!"
	
	self createInstancesFromClass: aClass fromFile: aStringOrFilename.
	self setValuesForEntities: aClass fromFile: aStringOrFilename
]

{ #category : #deprecated }
CMAbstractModel >> createAndLoadEntity: aClass fromFile: aStringOrFilename [
	"Deprecated. Load data from a File, create as many instances of aClass as necessary and set the values of the attributs according to the format declared into the file. 
	If the patchID is declared into the file, the located entities are moved to the right cells"
	
	self createEntities: aClass fromFile: aStringOrFilename
]

{ #category : #deprecated }
CMAbstractModel >> createAndLoadLocatedEntity: aClass fromFile: aStringOrFilename [
	"Deprecated.
	Load data from a File, create as many instances of aClass as necessary and set the values of the attributs according to the format declared into the file. 
	If the patchID is declared into the file, the located entities are moved to the right cells"
	
	self createAndLoadEntity: aClass fromFile: aStringOrFilename
]

{ #category : #deprecated }
CMAbstractModel >> createDataBaseConnection: username password: password base: aDataBase [
	"Create a ODBC connection on base aDataBase (<String>) with username (<String>) and password (<String>).
This method may be called from your model in order to save or get values from a database."
	
	self simManager createODBCConnection: username password: password base:
			aDataBase
]

{ #category : #'+ utilities - save load attributes' }
CMAbstractModel >> createEntities: aClass fromFile: aStringOrFilename [
	"Load data from a File, create as many instances of aClass as necessary and set the values of the attributs according to the format declared into the file. 
	If the patchID is declared into the file, the located entities are moved to the right cells"
	
	self createInstancesFromClass: aClass fromFile: aStringOrFilename.
	self setValuesForEntities: aClass fromFile: aStringOrFilename
]

{ #category : #'+ instance creation - spatial entities' }
CMAbstractModel >> createFragmentedEntities: compoundEntity from: baseEntity attribute: attributeName [
	"Purpose: Create n fragmented spatial entities <SpatialEntityNotConnex>. Each fragmented spatial entity is composed of spatial elements that have the same value of anAttribute. This method resets all fragmented spatial entities 'compoundEntity' and rebuilds them.
Arguments: baseEntity is a Class name inheriting from <SpatialEntity> (can be <SpatialEntityElement>, <SpatialEntityCell>, <SpatialEntityAggregate> or <SpatialEntityNotConnex>).
Example: self createFragmentedEntities: ForestGroup from: Forest attribute: #forestType"
	
	^self spaceModel setFragmentedEntities: compoundEntity from: baseEntity
		attribute: attributeName
]

{ #category : #'+ instance creation - spatial entities' }
CMAbstractModel >> createFragmentedEntities: compoundEntity from: baseEntity verifying: aBlock [
	"Purpose: Create n fragmented spatial entities (SpatialEntityNotConnex) from baseEntities that verify a condition. This method resets all fragmented spatial entities 'compoundEntity' and rebuilds them.
Arguments: baseEntity is a Class name inheriting from <SpatialEntity> (can be <SpatialEntityElement>, <SpatialEntityCell>, <SpatialEntityAggregate> or <SpatialEntityNotConnex>).
Example: 	self createFragmentedEntities: Forest from: Cell verifying: [:aCell | aCell state = #tree].
self createFragmentedEntities: Forest from: Cell verifying: [:aggregat | aggregat type = #forest] "
	
	^self spaceModel setFragmentedEntities: compoundEntity from: baseEntity
		verifying: aBlock
]

{ #category : #'+ instance creation - spatial entities' }
CMAbstractModel >> createFragmentedEntity: compoundEntity fromCollection: aCollecOfSpatialEntityElement [
	"Purpose: Create one fragmented spatial entity <SpatialEntityNotConnex> made of a collection of spatialEntityElements. This method resets all fragmented spatial entities 'compoundEntity' and rebuilds them. 
Arguments: aCollecOfSpatialEntityElement is a collection of base entities (inheriting from <SpatialEntityElement>).
compoundEntity = a Class name inheriting from <SpatialEntityNotConnex>
Example: self createFragmentedEntity: UrbanArea fromCollection: (self theCells select:[:c | c landUse = #building])"
	
	^self spaceModel setFragmentedEntity: compoundEntity fromCollection:
			aCollecOfSpatialEntityElement
]

{ #category : #'+ instance creation - spatial grid' }
CMAbstractModel >> createGridLines: numLines columns: numColumns neighbourhood: aNumber closed: aBoolean [
	"Purpose: Create a spatial grid made of cells
Arguments:  numColumns : number of columns ; numLines : number of lines of the grid.
Arguments: aNumber is the neighbourhood type. It must 4, 6 or 8
Arguments: aBoolean : closed or torroidal space.
Example: self createGridColumns: 20 lines: 20 neighbourhood: 8 closed: true "

	| shapeSymbol nbSymbol |
	aNumber = 8
		ifTrue: [ shapeSymbol := #squared.
			nbSymbol := #eight ].
	aNumber = 4
		ifTrue: [ shapeSymbol := #squared.
			nbSymbol := #four ].
	aNumber = 6
		ifTrue: [ shapeSymbol := #hexagonal.
			nbSymbol := #six ].
	self spaceModel
		initializeRegularLines: numLines
		columns: numColumns
		shape: shapeSymbol
		nbNeighbours: nbSymbol
		boundaries:
			(aBoolean
				ifTrue: [ #closed ]
				ifFalse: [ #torroidal ])
]

{ #category : #'+ instance creation - spatial grid' }
CMAbstractModel >> createGridNeighbourhood: anInteger closed: aBoolean fromMatrixCsvFile: aString attribute: aName [
	"Purpose: Create a spatial grid made of cells from a csv file in a matrix format providing values for a given attribute.
The file has to be located into /data folder.
Arguments: 
	anInteger <Integer> is the neighbourhood type. It must 4, 6 or 8
	aBoolean <Boolean> to inform if it is closed or torroidal space.
	aString <String>: the name of the csv datafile. The file has to be located in the 'data' subdirectory of the model.
	anAttributeName <String>: attribute's name.

Example: 	self createGridNeighbourhood: 8 closed: true fromMatrixCsvFile: 'map.csv' attribute: 'cover'. "

	| matrix nbLines nbCols collec |
	matrix := self readCsvFile: aString.
	nbLines := matrix size.
	nbCols := matrix first size.
	self
		createGridLines: nbLines
		columns: nbCols
		neighbourhood: anInteger
		closed: aBoolean.
	collec := OrderedCollection new.
	matrix do: [ :line | collec addAll: line ].
	collec
		with: self theESE
		do: [ :string :c | 
			c
				perform: (aName , ':') asSymbol
				with: (Cormas stringAsObjectType: string) ]
]

{ #category : #deprecated }
CMAbstractModel >> createGridX: x Y: y neighbourhood: aNumber closed: aBoolean [
	"This method is deprecated. Please use createGridColumn:lines:neighbourhood:closed: instead."

	"Purpose: Create a spatial grid made of cells
Arguments:  X : number of columns ; Y : number of lines of the grid.
Arguments: aNumber is the neighbourhood type. It must 4, 6 or 8
Arguments: aBoolean : closed or torroidal space.
Example: self createGridX: 20 Y: 20 neighbourhood: 8 closed: true "

	self
		deprecated:
			'This method is no longer supported. Please use createGridColumns:lines:neighbourhood:closed: instead.'.
	^ self
		createGridLines: y
		columns: x
		neighbourhood: aNumber
		closed: aBoolean
]

{ #category : #'utilities - files' }
CMAbstractModel >> createInstancesFromClass: aClass fromFile: aStringOrFilename [
	"class := (self class environment at: className asSymbol)."
	
	| fileSize a collec getter |
	fileSize := (self getDataLinesFromFile: aStringOrFilename) size.
	self
		perform: (self setterForEntityClass: aClass)
		with: OrderedCollection new.
	getter := self getterForEntityClass: aClass.
	fileSize - 1
		timesRepeat:
			[a := aClass new.
			collec := self perform: getter.
			collec add: a].
	^collec
]

{ #category : #'+ instance creation - agents & objects' }
CMAbstractModel >> createN: aNumber entity: aClass [
	"Return a collection of aNumber of entities of aClass for wich the init method has been send.
	ex: self createN: 10 entity: Predator "
	
	^self createN: aNumber entity: aClass initMethod: #init arguments: #()
]

{ #category : #'+ instance creation - agents & objects' }
CMAbstractModel >> createN: aNumber entity: aClass initMethod: aSymbol [
	"Return a collection of aNumber of entities of aClass for wich the init method 'aSymbol' has been send.
	ex: self createN: 10 entity: Predator initMethod: #initAge"
	
	^self createN: aNumber entity: aClass initMethod: aSymbol arguments: #()
]

{ #category : #'+ instance creation - agents & objects' }
CMAbstractModel >> createN: aNumber entity: aClass initMethod: aSymbol arguments: aCollec [
	"Return a collection of aNumber of entities of aClass for wich the init method 'aSymbol' with a set of arguments 'aCollec' has been send.
	ex: self createN: 10 entity: Predator initMethod: #initAge:energy: arguments: #(0 50) "
	
	| anEntity collec |
	collec := List new.
	aNumber
		timesRepeat:
			[anEntity := self newEntity: aClass.
			anEntity perform: aSymbol withArguments: aCollec.
			collec add: anEntity].
	^collec
]

{ #category : #'+ instance creation - groups' }
CMAbstractModel >> createN: n groups: classGroup from: aCollec [
	"Purpose: Creates and returns n instances of classGroup. Each group is composed of X agents (X=aCollec size / n). The agents (included into aCollec) are randomly distributed into the groups
Example: self createN: 5 groups: Village from: self theIndividuals"
	
	| collection groupSize index newGroup groupsCollec |
	groupsCollec := OrderedCollection new.
	collection := Cormas mix: aCollec.
	groupSize := (aCollec size / n) asInteger.
	index := 1.
	1
		to: n - 1
		do:
			[:i | 
			newGroup := self newEntity: classGroup.
			newGroup init.
			index
				to: groupSize * i
				do: [:j | newGroup addComponent: (collection at: j)].
			groupsCollec add: newGroup.
			index := groupSize * i + 1].
	newGroup := self newEntity: classGroup.
	newGroup init.
	index
		to: collection size
		do: [:j | newGroup addComponent: (collection at: j)].
	groupsCollec add: newGroup.
	^groupsCollec
]

{ #category : #'+ instance creation - agents & objects' }
CMAbstractModel >> createN: aNumber randomlyLocatedAloneEntities: aClass [
	"Return a collection of aNumber of entities of aClass for wich the 'init' method has been send.
	The new entities are randomly located on the free cells of the grid.
	ex: self createN: 10 randomlyLocatedAloneEntities: Predator"
	
	self createN: aNumber randomlyLocatedAloneEntities: aClass initMethod:
			#init arguments: #()
]

{ #category : #'+ instance creation - agents & objects' }
CMAbstractModel >> createN: aNumber randomlyLocatedAloneEntities: aClass initMethod: aSymbol [
	"Return a collection of aNumber of entities of aClass for wich the init method 'aSymbol' has been send.
	The new entities are randomly located on the free cells of the grid.
	ex: self createN: 10 randomlyLocatedAloneEntities: Predator initMethod: #initAge  "
	
	^self createN: aNumber randomlyLocatedAloneEntities: aClass initMethod:
			aSymbol arguments: #()
]

{ #category : #'+ instance creation - agents & objects' }
CMAbstractModel >> createN: aNumber randomlyLocatedAloneEntities: aClass initMethod: aSymbol arguments: aCollec [
	"Return a collection of aNumber of entities of aClass for wich the init method 'aSymbol' with a set of arguments 'aCollec' has been send.
	The new entities are randomly located on the free cells of the grid.
	ex: self createN: 10 randomlyLocatedAloneEntities: Predator initMethod: #initAge:energy: arguments: #(0 50) "
	
	| a freeCell newEntities |
	newEntities := OrderedCollection new.
	aNumber
		timesRepeat:
			[freeCell := self randomFreeCell.
			freeCell isNil
				ifTrue:
					[self cormas warn: 'No free cell. The simulation will stop'.
					self halt].
			a := self newEntity: aClass.
			a moveTo: freeCell.
			a perform: aSymbol withArguments: aCollec.
			newEntities add: a].
	^newEntities
]

{ #category : #'+ instance creation - agents & objects' }
CMAbstractModel >> createN: aNumber randomlyLocatedEntities: aClass [
	"Return a collection of aNumber of entities of aClass for wich the 'init' method 'has been send.
	The new entities are randomly located on the grid.
	ex: self createN: 10 randomlyLocatedEntities: Predator"
	
	^self createN: aNumber randomlyLocatedEntities: aClass initMethod: #init
]

{ #category : #'+ instance creation - agents & objects' }
CMAbstractModel >> createN: aNumber randomlyLocatedEntities: aClass constrainedBy: aBlock [
	"Return a collection of aNumber of entities of aClass for wich the init method 'aSymbol' has been send.
	The new entities are randomly located on the grid on cells that verify the constraint.
	ex: self createN: 10 randomlyLocatedEntities: Predator constrainedBy: [:c | c noOccupant and: [c energy > 1]]"
	
	^self createN: aNumber randomlyLocatedEntities: aClass initMethod: #init
		arguments: #() constrainedBy: aBlock
]

{ #category : #'+ instance creation - agents & objects' }
CMAbstractModel >> createN: aNumber randomlyLocatedEntities: aClass initMethod: aSymbol [
	"Return a collection of aNumber of entities of aClass for wich the init method 'aSymbol' has been send.
	The new entities are randomly located on the grid.
	ex: self createN: 10 randomlyLocatedEntities: Predator initMethod: #initAge "
	
	^self createN: aNumber randomlyLocatedAgents: aClass initMethod: aSymbol
		arguments: #()
]

{ #category : #'+ instance creation - agents & objects' }
CMAbstractModel >> createN: aNumber randomlyLocatedEntities: aClass initMethod: aSymbol arguments: aCollec [
	"Return a collection of aNumber of entities of aClass for wich the init method 'aSymbol' with a set of arguments 'aCollec' has been send. 
	The new entities are randomly located on the grid.
	ex: self createN: 10 randomlyLocatedEntities: Predator initMethod: #initAge:energy: arguments: #(0 50) "
	
	| anAgent newEntities |
	newEntities := OrderedCollection new.
	aNumber
		timesRepeat:
			[anAgent := self newEntity: aClass.
			anAgent moveTo: self randomCell.
			anAgent perform: aSymbol withArguments: aCollec.
			newEntities add: anAgent].
	^newEntities
]

{ #category : #'+ instance creation - agents & objects' }
CMAbstractModel >> createN: aNumber randomlyLocatedEntities: aClass initMethod: aSymbol arguments: aCollec constrainedBy: aBlock [
	"Return a collection of aNumber of entities of aClass for wich the init method 'aSymbol' with a set of arguments 'aCollec' has been send.
	The new entities are randomly located on the free cells of the grid.
	ex: self createN: 10 randomlyLocatedEntities: Predator initMethod: #initAge constrainedBy: [:cell | cell energy > 1] "
	
	| a targetCell newEntities |
	newEntities := OrderedCollection new.
	aNumber
		timesRepeat:
			[targetCell := self pickCellConstrainedBy: aBlock.
			targetCell isNil
				ifTrue:
					[self cormas warn:
							'No available cell for the constraint. The simulation will stop'.
					self halt].
			a := self newEntity: aClass.
			a moveTo: targetCell.
			a perform: aSymbol withArguments: aCollec.
			newEntities add: a].
	^newEntities
]

{ #category : #'+ instance creation - nodes & arcs' }
CMAbstractModel >> createNetworkOfArcs: anArcClass onCells: listOfCells [
	"create a Network of arcs (instances of anArcClass) located on the listOfCells"
	
	| anArc network |
	listOfCells size < 2 ifTrue: [^nil].
	anArc := (self newEntity: anArcClass)
		initFromCell: listOfCells first
		toCell: (listOfCells at: 2).
	listOfCells size < 3 ifTrue: [^anArc fullNetwork].
	3
		to: listOfCells size
		do:
			[:i | 
			anArc := (self newEntity: anArcClass)
				initFromCell: (listOfCells at: i - 1)
				toCell: (listOfCells at: i)].
	network := anArc fullNetwork.
	self updateEntities.
	^network
]

{ #category : #'+ utilities - ODBC' }
CMAbstractModel >> createODBCConnection [
	"Create a ODBC connection.
This method is called from SimManager in order to save the probe's values into a database (cormasSimulations).
You may redifine it with the right dataBase (<String>) and username (<String>) and password (<String>). Ex: 
createODBCConnection
	self createODBCConnection: 'bommel' password: '' base: 'essai'   "
	
	^nil
]

{ #category : #'+ utilities - ODBC' }
CMAbstractModel >> createODBCConnection: username password: password base: aDataBase [
	"Create a ODBC connection on base aDataBase (<String>) with username (<String>) and password (<String>)"
	
	self simManager createODBCConnection: username password: password base:
			aDataBase
]

{ #category : #'+ instance creation - nodes & arcs' }
CMAbstractModel >> createRandomNetworkOfN: n arcs: anArcClass [
	"create a random Network of n arcs (instances of anArcClass) randomly located on the grid. N is a value > 2"
	
	| coll |
	coll := OrderedCollection new.
	n timesRepeat: [coll add: self randomCell].
	^self createNetworkOfArcs: anArcClass onCells: coll
]

{ #category : #'+ instance creation - spatial entities' }
CMAbstractModel >> createSingleAggregateFromGrid: compoundEntity [
	"Purpose: Create one instance of compoundEntity from all the cells <SpatialEntityElement> of the grid. This method resets all aggregates 'compoundEntity' and rebuilds them.
Arguments: compoundEntity is a Class name inheriting from <SpatialEntitySet>
Example: self createSingleAggregateFromGrid: Territory"
	
	^self spaceModel setGridAsAggregat: compoundEntity
]

{ #category : #'+ instance creation - spatial entities' }
CMAbstractModel >> createSingletonAggregates: compoundEntity fromSeeds: aCollecOfCells [
	"Purpose: Create n (n correspond to aCollecOfCells size) aggregates made of a single component which is an element of aCollecOfCells. This method resets all aggregates 'compoundEntity' and rebuilds them. Arguments: aCollecOfCells is a collection of cells (SpatialEntityElement). compoundEntity is a Class name inheriting from SpatialEntitySet.
Example: self createSingletonAggregates: Forest fromSeeds: (self theCells select:[:c| c isForestSeed]."
	
	^self spaceModel setSingletonAggregates: compoundEntity fromSeeds:
			aCollecOfCells
]

{ #category : #ODBC }
CMAbstractModel >> createTable: aTable withParameters: parametersArray primaryKey: primaryKey [
	"create a table: aTable <String> withParameters: parameters <Array or OrederedCollection> on primaryKey: primaryKey <String>"
	
	self simManager createTable: aTable withParameters: parametersArray
		primaryKey: primaryKey
]

{ #category : #ODBC }
CMAbstractModel >> createTable: aTable withParametersAndProbes: parametersArray primaryKey: primaryKey [
	"create a table: aTable <String> withParameters: parameters <Array or OrederedCollection> and selectedProbes on primaryKey: primaryKey <String>"
	
	self simManager createTable: aTable withParametersAndProbes:
			parametersArray primaryKey: primaryKey
]

{ #category : #'+ testing - scheduling' }
CMAbstractModel >> currentSimulationEnded [
	"Return YES or NO"
	
	^self simManager currentSimEnded
]

{ #category : #'probes - recording' }
CMAbstractModel >> data [
	"Returns probes results collected during one simulation"
	"At the moment, data is a dictionary"
	"Should be replaced by DataFrame in the future"
	^data isNil
		ifTrue: [data := Dictionary new]
		ifFalse: [data]
]

{ #category : #'probes - recording' }
CMAbstractModel >> data: aDictionary [
	data := aDictionary
]

{ #category : #accessing }
CMAbstractModel >> database [
	^ database
]

{ #category : #accessing }
CMAbstractModel >> database: anObject [
	database := anObject
]

{ #category : #'default values' }
CMAbstractModel >> defaultAttributesSetter [
	
	^defaultAttributesSetter
		ifNil: [defaultAttributesSetter := DefaultAttributesSetter newOn: self]
]

{ #category : #'default values' }
CMAbstractModel >> defaultAttributesSetter: aDefaultSetter [
	
	^defaultAttributesSetter := aDefaultSetter
]

{ #category : #'private - notification' }
CMAbstractModel >> delayChangesWhile: aBlock [
	"delay changes (see registerChangeFor:) during aBlock evaluation.
	transmit all delayed changes immediately after"
	
	(delayedChanges == nil and: [self cormas isChangesDelayed])
		ifTrue:
			[[delayedChanges := OrderedCollection new.
			aBlock value]
				ensure:
					[| coll |
					coll := delayedChanges.
					delayedChanges := nil.
					self spaceModel noticeChanges: coll]]
		ifFalse: [aBlock value]
]

{ #category : #ODBC }
CMAbstractModel >> disconnectAccessConnection [
	"disconnect the ODBC connection (database) "
	
	self database disconnectODBCConnection
]

{ #category : #'+ utilities - ODBC' }
CMAbstractModel >> disconnectODBCConnection [
	"Purpose: disconnect the ODBC connection"
	
	self simManager disconnectODBCConnection
]

{ #category : #'+ pov' }
CMAbstractModel >> displayDefaultPovOf: aClass [
	"Purpose: set the default POV of aClass to be displayed on the first opened spatial grid
Example : self displayDefaultPovOf: Cell"
	
	self displayPov: #povClassName of: aClass
]

{ #category : #'+ pov' }
CMAbstractModel >> displayInfo: aSymbol of: aClass [
	"Purpose: set the INFO text of aClass to be displayed on the opened spatial grids.
Example : self displayInfo: #info_ID of: Cell"
	
	(aClass availableInfo includes: aSymbol)
		ifFalse:
			[self cormas
				warn: 'The class <1s> does not have a info called <2s>'
				with: aClass name
				with: aSymbol].
	self spaceModel displayInfo: aSymbol of: aClass
]

{ #category : #'+ pov' }
CMAbstractModel >> displayPov: aSymbol of: aClass [
	"Purpose: set the POV of aClass to be displayed on the opened spatial grids.
Example : self displayPov: #landUse of: Cell"
	
	(aClass availablePov includes: aSymbol)
		ifFalse:
			[self cormas
				warn: 'The class <1s> does not have a pov called <2s>'
				with: aClass name
				with: aSymbol].
	self spaceModel displayPov: aSymbol of: aClass
]

{ #category : #'+ user interface' }
CMAbstractModel >> displaySimInformation [
	"display information on the current simulation"
	
	ComposedTextView
		open: self getSimDescriptionText asValue
		label: '* About Current Simulation * '
		icon: (Icon constantNamed: #workspace)
		extent: 400 @ 200
]

{ #category : #'+ utilities - space metrics' }
CMAbstractModel >> distanceFromCell: cell1 toCell: cell2 [
	"Purpose: return the distance in number of cells (also known as Manhattan distance)"
	
	^self spaceModel distanceFromCell: cell1 toCell: cell2
]

{ #category : #'+ utilities - space metrics' }
CMAbstractModel >> distanceFromHexagonalCell: cell1 toCell: cell2 [
	"Purpose: return the distance in number of hexagonal cells"
	
	^self spaceModel distanceFromHexagonalCell: cell1 toCell: cell2
]

{ #category : #'- user interface' }
CMAbstractModel >> doesHabitusExists: aString [
	
	^(self class respondsTo: ('SIconfig_' , aString) asSymbol)
		ifFalse:
			[self cormas warn: 'No habitus named <1s> exists' with: aString.
			false]
		ifTrue: [true]
]

{ #category : #'+ utilities - space metrics' }
CMAbstractModel >> dominance: anAttribute [
	"Purpose: Return the Dominance-Index of SpatialEntityElements instances (theCells for example). The Dominance-Index is used as an index of biodiversity. It gives the information if there is one dominant category of cells in the spatial grid or if all categories have more or less the same relative proportions. Categories of cells are cells that have a different value of anAttribute (see the method nClasses: anAttribute).
Argument: anAttribute is the name of the attribute, ex #state
Return Value: Depending of the proportions the results range between 0 and 1.
Example: self dominance: #groupNumber"

	^ self spaceModel dominance: anAttribute
]

{ #category : #'- binary storage' }
CMAbstractModel >> dumpOrganization [
	"Purpose: [Backward] Ask for filename.bos destination and register the complete organization"
	
	| name fileName |
	name := Dialog request: 'Save the whole organization on File '
		initialAnswer: 'filename.bos'.
	name = '' ifTrue: [^nil].	"name := 'test.bos'.  "
	fileName := (Cormas dumpPath: self class name) construct: name.
	fileName exists
		ifTrue:
			[(Dialog confirm: 'File already exists !!! Use it anyway ???')
				ifFalse: [^nil]].
	self dumpOrganizationOnFile: fileName
]

{ #category : #'+ utilities - space metrics' }
CMAbstractModel >> edgeDensity: aClass [
	"Purpose: Return the density of edges of an aggregate class instances as compared to the total size of the spatial grid.
Argument: aClass should be an aggregate.
Example: self edgeDensity: ForestAggregate"
	
	^self spaceModel edgeDensity: aClass
]

{ #category : #'+ utilities - space metrics' }
CMAbstractModel >> edgeDensity: aClass totalArea: aNumber [
	"Purpose: Return the density of edges of an aggregate class instances as compared to the specified total size of the area.
Argument: aClass should be an aggregate. aNumber is the specified total area
Example: self edgeDensity: ForestAggregate totalArea: 7436"
	
	^self spaceModel edgeDensity: aClass totalArea: aNumber
]

{ #category : #'+ utilities - space metrics' }
CMAbstractModel >> euclideanDistanceFromCell: cell1 toCell: cell2 [
	"Purpose: return the euclidian distance (unit = cell) using the Euclidean distance formula : square root of [(Xa - Xb)^2 + (Ya - Yb)^2)]"
	
	^self spaceModel euclideanDistanceFromCell: cell1 toCell: cell2
]

{ #category : #deprecated }
CMAbstractModel >> exportAttribute: attributeName fromClass: className [
	"attributeName <Symbol>
className <String>"

	| stream filename instances |
	filename := (Cormas dataPath: self class name)
		construct: className asString , '_' , attributeName asString , '.txt'.
	stream := filename asFilename writeStream.
	instances := self perform: (self getterForEntityClass: className).
	instances isEmpty
		ifFalse: [ instances
				do: [ :anInstance | 
					stream
						store: (anInstance perform: attributeName);
						cr ] ].
	stream close
]

{ #category : #'probes - charts' }
CMAbstractModel >> exportGlobalCharts: aList inFile: aString [
	
	| file labels x |
	file := ((Cormas dataPath: self class name) , aString) asFilename
		writeStream.
	labels := aList asOrderedCollection.
	labels addFirst: #pdt.
	labels do: [:l | file nextPutAll: l asString , '	'].
	file nextPutAll: '\' withCRs.
	1
		to: (self perform: aList first) size
		do:
			[:i | 
			file nextPutAll: (i - 1) printString , '	'.
			2
				to: labels size
				do:
					[:j | 
					x := (self perform: (labels at: j)) at: i.
					file
						nextPutAll:
							(x asFloat printString
								collect:
									[:a | 
									a = $.
										ifTrue: [$,]
										ifFalse: [a]]) , '	'].
			file nextPutAll: '\' withCRs].
	file close
]

{ #category : #'+ accessing - scheduling' }
CMAbstractModel >> finalTime [
	
	^self simManager finalTime
]

{ #category : #'+ control - scheduling' }
CMAbstractModel >> finishSimulation [
	"Stop the current simulation: the current time is set equal to final time"
	
	self simManager finishSimulation
]

{ #category : #'+ utilities - space metrics' }
CMAbstractModel >> fractalDimension: aClass [
	"Purpose: Return the fractal dimension of an aggregate class instances.
Argument: aClass is an aggregate"

	^ self spaceModel fractalDimension: aClass
]

{ #category : #'+ init - social network' }
CMAbstractModel >> generateAsymetricNetworkDensity: x forAgents: aClass [
	"Purpose: As a result of this method, the acquaintances attribute of each agent is set with a collection of other agents, randomly picked. The size of this collection is the ratio x of the total population. The method loops on each agent and link it with the requested number of other agents of the same class.
The relation is not symetric, it means agent A may know agent B but B may not know A
Argument: x is a ratio of the total population of agents of aClass. Its value is between 0 and 1.
Example: self generateAsymetricNetworkDensity: 0.6 forAgents: Citizen"
	
	| allAgents n otherAgents |
	allAgents := self theEntities: aClass.
	n := (x * allAgents size) truncated.
	allAgents
		do:
			[:a | 
			a acquaintances size < n
				ifTrue:
					[otherAgents := Cormas mix: (self otherAgentsButMe: a).
					1
						to: n
						do: [:i | a acquaintances add: (otherAgents at: i)]]]
]

{ #category : #'+ init - social network' }
CMAbstractModel >> generateSymetricNetworkDensity: x forAgents: aClass [
	"Purpose: As a result of this method, the acquaintances attribute of each agent is set with a collection of other agents, randomly picked. The size of this collection is the ratio x of the total population. The method loops on each agent and link it with the requested number of other agents of the same class.
The relation is  symetric, it means if agent A knows agent B, B will know A.
Argument: x is a ratio of the total population of agents of aClass. Its value is between 0 and 1.
Example: self generateSymetricNetworkDensity: 0.3 forAgents: Citizen"
	
	| allAgents n otherAgents |
	allAgents := Cormas mix: (self theEntities: aClass).
	n := (x * allAgents size) truncated.
	allAgents
		do:
			[:a | 
			otherAgents := Cormas
				mix:
					((self otherAgentsButMe: a) select: [:o | o acquaintances size < n]).
			1
				to: (n min: otherAgents size)
				do:
					[:i | 
					a acquaintances size < n
						ifTrue:
							[a acquaintances add: (otherAgents at: i).
							(otherAgents at: i) acquaintances add: a]]]
]

{ #category : #'utilities - files' }
CMAbstractModel >> getAttributesType: attributes fromInstances: instanceCollection [
	
	| firstInstance firstValue type dicoAttConv |
	dicoAttConv := Dictionary new.
	attributes
		do:
			[:att | 
			firstInstance := instanceCollection
				detect: [:p | (p perform: att asSymbol) isNil not]
				ifNone: [nil].
			firstInstance isNil
				ifTrue: [firstValue := nil]
				ifFalse: [firstValue := firstInstance perform: att asSymbol].
			firstValue isSymbol
				ifTrue:
					[type := '(Symbol)'.
					dicoAttConv
						at: att asSymbol
						put: #(#asString '(Symbol)')]
				ifFalse:
					[firstValue cormasHelper isTypeNumber
						ifTrue:
							[type := '(Number)'.
							dicoAttConv
								at: att asSymbol
								put: #(#printString '(Number)')]
						ifFalse:
							[firstValue isString
								ifTrue:
									[type := '(String)'.
									dicoAttConv
										at: att asSymbol
										put: #(#asString '(String)')]
								ifFalse:
									[firstValue cormasHelper isTypeBoolean
										ifTrue:
											[type := '(Boolean)'.
											dicoAttConv
												at: att asSymbol
												put: #(#printString '(Boolean)')]
										ifFalse:
											[type := '(nil)'.
											dicoAttConv
												at: att asSymbol
												put: #(#printString '(nil)')]]]]].
	^dicoAttConv
]

{ #category : #ODBC }
CMAbstractModel >> getDataFromAccess: aDataBase username: username password: password sql: sqlRequest [
	"return a collection from an SQL request on Access. This method may be called from your model in order to get values from a database.
Create a ODBC connection on base aDataBase (<String>) with username (<String>) and password (<String>).
Send the request.
sqlRequest examples : 'SELECT * FROM SimName'  
If you need quotes in your request, you should double the quotes. Be careful: Two quotes (' + ') are differents from quotation marks (''). Ex:
	'SELECT * FROM SimName WHERE version LIKE ''ECEC.st'''   

Example: 
	self getDataFromAccess: 'cormasSimulations' username: 'bommel' password: '' sql: 'SELECT * FROM SimName WHERE version LIKE ''ECEC.st'''   "
	
	| result |
	self createAccessConnection: username password: password base: aDataBase.
	result := self database trySQL_command: sqlRequest.
	self database disconnectODBCConnection.
	result ifFalse: [self error: 'Connexion Error'].
	^result
]

{ #category : #ODBC }
CMAbstractModel >> getDataFromAccess_sql: sqlRequest [
	"return a collection from an SQL request on Access. This method may be called from your model in order to get values from a database.
Be carefull: Except in case of error, the connexion with the database won't be release.
For a single request, you should rather use : getDataFromAccess: aDataBase username: username password: password sql: sqlRequest"
	
	| result |
	self database
		ifNil:
			[self error: 'Database not connected'	"The database is not connected. Before this method, you should send the message : self createAccessConnection: username password: password base: aDataBase"].
	result := self database trySQL_command: sqlRequest.
	result
		ifFalse:
			[self database disconnectODBCConnection.
			self error: 'Connexion Error'].
	^result
]

{ #category : #'+ utilities - files' }
CMAbstractModel >> getDataFromFile: aStringOrFilename separator: aChar [
	"Returns a collection of collections containing the elements of one line of the file. The elements are separated by aChar. 
	Creates a 'read' connexion to a file (aStringOrFilename) located into the current model 'data' 
	directory and copy all data from this file into a collection. 
	ex: self getDataFromFile: 'aFile.txt' separator: ';' (or Character tab or $, ...)
	Rq: self getDataFromFile: 'cormas.env' separator: Character cr is equivalent to self getDataLinesFromFile: 'cormas.env'"
	
	| stream aFilename result line |
	aFilename := self stringToFilename: aStringOrFilename.
	stream := aFilename readStream.	"On devine le format des lignes"
	stream lineEndAuto.
	result := OrderedCollection new.
	[stream atEnd]
		whileFalse:
			[line := Cormas splitLine: stream sep: aChar.
			result add: line].
	stream close.
	^result
]

{ #category : #'utilities - files' }
CMAbstractModel >> getDataLinesFromFile: aStringOrFilename [
	"Returns a collection of data. Returns a collection of elements from the 'aStringOrFilename 'file. An element = a line of the file.
	Creates a 'read' connexion to a file (aStringOrFilename) located into the current model 'data' directory and copy all data from this file into a collection.
	ex: self getDataFromFile: 'aFile.txt' 
	Rq: see also getDataFromFile: aStringOrFilename separator: aChar"
	
	^self
		getDataFromFile: aStringOrFilename
		separator: Character cr
]

{ #category : #'- binary storage' }
CMAbstractModel >> getFileOf: aClassName from: fileNameString [
	
	^(fileNameString tokensBasedOn: $.) first , '.' , aClassName asString
]

{ #category : #'+ user interface' }
CMAbstractModel >> getSimDescriptionText [
	"returns a text describing the information of the current simulation"

	^ Text
		streamContents: [ :stream | 
			stream
				nextPutAll: 'Model name : ';
				nextPutAll: (self class modelPrefix asText allBold addAttribute: TextColor red);
				cr;
				cr;
				nextPutAll: 'Initialization: ';
				tab;
				nextPutAll: '#';
				nextPutAll: (self activeInit asText addAttribute: TextEmphasis italic);
				cr;
				nextPutAll: 'Control:           ';
				tab;
				nextPutAll: '#';
				nextPutAll: (self activeControl asText addAttribute: TextEmphasis italic);
				cr;
				nextPutAll: 'Random seed: ';
				tab;
				nextPutAll: (Cormas seed printString asText addAttribute: TextEmphasis italic);
				cr ]
]

{ #category : #'accessing - entities' }
CMAbstractModel >> getterForEntityClass: aClass [
	"efficiently create the getter selector for the entity class aClass (avoid concatenation).
	ex : Object -> #theObjects

	self basicNew getterForEntityClass: Object
	"
	
	^self class getterForEntityClass: aClass
]

{ #category : #'+ utilities - population metrics' }
CMAbstractModel >> giniIndexOfAttribute: att absoluteCorrection: aNumber of: aCollecOrClass [
	"Purpose: Returns the gini for an attribute (which can include negative values) on a collection of entities (aCollecOrClass) 
See the 'giniIndexOfAttribute:of: method for more details on Gini index.
As the calculation of the Gini index requieres that individuals cannot have a negative value for the assessed attribute, and in  case the attribute you want to assess has negative values, the following method operates a translation of the attribute value.
Enter in the absoluteCorrection argument an amount equals or higher to the minimum negative value that your attribute may take.
Beware that this translation affects the absolute value of the Gini index.
(e.g. the Gini index calculated with an ''absoluteCorrection'' value of 1000 will not be the same than one calculated with a  ''absoluteCorrection'' value of 5000).
Arguments:
- aCollecOrClass can be a collection of entities or the name of class, in which case all the entities of that class (including subclasses entities) will be included in the collection
- att is the name of the attribute <aSymbol> Negative value are accepted .
- aNumber is a number
Examples: self giniIndexOfAttribute: #accountBalance absoluteCorrection: 5000 of: Person"
	
	^Cormas
		giniIndexOf:
			((self allTheEntitiesOfClassOrCollec: aCollecOrClass) asOrderedCollection
				collect: [:e | e perform: att])
		absoluteCorrection: aNumber
]

{ #category : #'+ utilities - population metrics' }
CMAbstractModel >> giniIndexOfAttribute: att of: aCollecOrClass [
	"Purpose: Returns the gini for an attribute on a collection of entities (aCollecOrClass)
The Gini coefficient is a number between 0 and 1, where 0 corresponds with perfect equality (where everyone has the same income) and 1 corresponds with perfect inequality (where one person has all the income, and everyone else has zero income). The Gini index is the Gini coefficient expressed in percentage form, and is equal to the Gini coefficient multiplied by 100.
Arguments:
- aCollecOrClass can be a collection of entities or the name of class, in which case all the entities of that class (including subclasses entities) will be included in the collection
- att is the name of the attribute <aSymbol> Negative values for that attribute are not allowed.
Examples: self giniIndexOfAttribute: #money of: Person
			 self giniIndexOfAttribute: #money of: (self thePersons select: [:p| p age between: 30 and:55)]

More: The Gini coefficient is a measure of inequality developed by the Italian statistician Corrado Gini and published in 1912.
It is a commonly used coefficient to measure income inequality in a society by institutions such as the World Bank and others.
While the Gini coefficient is mostly used to measure income inequality, it can also be used to measure other types of inequality.
For more details on the calculation and use of the Gini coefficient and index see http://en.wikipedia.org/wiki/Gini_coefficient"
	
	^Cormas
		giniIndexOf:
			((self allTheEntitiesOfClassOrCollec: aCollecOrClass) asOrderedCollection
				collect: [:e | e perform: att])
]

{ #category : #'probes - charts' }
CMAbstractModel >> globalCharts [
	
	^(self data includesKey: self class name)
		ifFalse: [OrderedCollection  new]
		ifTrue: [(self data at: self class name) keys]
]

{ #category : #deprecated }
CMAbstractModel >> group: aCollec by: n into: aGroupClass [
	"Creates and returns n instances of classGroup. Each group is composed of X agents (X=aCollec size / n). The agents (included into aCollec) are randomly distributed into the groups"
	
	^self create: n groups: aGroupClass from: aCollec
]

{ #category : #'- user interface' }
CMAbstractModel >> habitusNames [
	
	| collec |
	collec := SortedCollection new.
	(self class class organization listAtCategoryNamed: #SI_config)
		do:
			[:e | 
			collec
				add:
					(e
						copyFrom: 10
						to: e size)].
	^collec
]

{ #category : #'default values' }
CMAbstractModel >> hasAttributesSetter [
	
	^defaultAttributesSetter isNil not
]

{ #category : #'default values' }
CMAbstractModel >> hiddenAttributes [
	"returns a list of hidden attributs that won't be displayed by the parameter interface.
	This method is automatically redefined from the Setting menu (Hide Parameters...) of Parameter interface"
	
	^List new
]

{ #category : #scheduling }
CMAbstractModel >> incrementTimeStep [
	self timeStep: self timeStep + 1
]

{ #category : #deprecated }
CMAbstractModel >> initCells [
	
	^self resetCells
]

{ #category : #deprecated }
CMAbstractModel >> initCells: initSelector [
	"The method initSelector <Symbol> is send to each Cell instance"
	
	self initCells: initSelector withArguments: #()
]

{ #category : #deprecated }
CMAbstractModel >> initCells: initSelector withArguments: argumentCollection [
	"The method initSelector <Symbol> with the arguments : argumentCollection, is send to each Cell instance"
	
	| cellClass |
	cellClass := self class cellClass ifNil: [^nil].
	cellClass CurrentId: 0.
	(self theEntities: cellClass)
		do:
			[:ese | 
			ese reset.
			ese perform: initSelector withArguments: argumentCollection]
]

{ #category : #'probes - charts' }
CMAbstractModel >> initCharts [
	
	self
		initLocalCharts;
		initGlobalCharts
]

{ #category : #deprecated }
CMAbstractModel >> initCollec: aListOfEntities [
	aListOfEntities
		do: [ :e | 
			e new perform: #CurrentId: with: 0.
			self
				perform: (self setterForEntityClass: e)
				with: OrderedCollection new ]
]

{ #category : #deprecated }
CMAbstractModel >> initData [
	"DEPRECATED. Do nothing anymore"
	"self updateData: 0"
	
	
]

{ #category : #'init entities' }
CMAbstractModel >> initEntities [
	"Initialize all the Entity classes of the model"

	"Remove all the PassiveObjects and Located Objects"

	self class passiveClasses
		do: [ :aClass | 
			((aClass inheritsFrom: CMMsg) or: [ aClass isAbstract ])
				ifFalse: [ (aClass inheritsFrom: CMObjectLocation)
						ifTrue: [ (self theEntities: aClass) isNil
								ifFalse: [ (self theEntities: aClass) do: [ :LO | LO leave ] ] ].
					self initializeTheEntity: aClass ] ].	"Remove all the Agents from previous simulation"
	self class socialClasses
		do: [ :aClass | 
			aClass isAbstract
				ifFalse: [ (aClass inheritsFrom: CMAgentLocation)
						ifTrue: [ (self theEntities: aClass) isNil
								ifFalse: [ (self theEntities: aClass) do: [ :LO | LO leave ] ] ].
					self initializeTheEntity: aClass ] ].
	self spaceModel isNil
		ifFalse: [ self spaceModel resetSpatialEntitiesButCells ]
]

{ #category : #'utilities - files' }
CMAbstractModel >> initFile: aStringOrFilename dataCollection: aCollec separator: aChar [
	"Create a file in the current model 'data' directory and writes in it a tupple separated by aChar.
	ex: self initFile: 'aFile.txt' dataCollection: #('time' 'value1' 'value2') separator: ';'."
	
	| aFilename |
	aFilename := self stringToFilename: aStringOrFilename.
	aFilename exists ifTrue: [aFilename delete].
	self updateFile: aFilename dataCollection: aCollec separator: aChar
]

{ #category : #deprecated }
CMAbstractModel >> initFullPathFile: aFilename dataCollection: aCollec separator: aChar [
	"Deprecated. Should use :"
	
	self initFile: aFilename dataCollection: aCollec separator: aChar
]

{ #category : #'probes - charts' }
CMAbstractModel >> initGlobalCharts [
	
	self globalCharts
		do:
			[:s | 
			self
				perform: (s asString , ':') asSymbol
				with: (self perform: s) class new].
	self updateGlobalCharts: 0
]

{ #category : #'probes - charts' }
CMAbstractModel >> initLocalCharts [
	
	self localCharts
		do:
			[:s | 
			self
				perform: (s asString , ':') asSymbol
				with: (self perform: s) class new].
	self updateLocalCharts: 0
]

{ #category : #deprecated }
CMAbstractModel >> initObjects [
	
	
]

{ #category : #scheduling }
CMAbstractModel >> initSimulation [
	self timeStep: 0.
	self spaceModel ifNil: [ self initializeSpaceModel ].
	self initializeProbes.
	"store the instances of entities in a collection and request an update of the space views at the end of the initialization"
	self setNewCollector.
	"remove the previous entities of the collections (theXXXs), except for theCells"
	self initEntities.
	"set default attributes values of entities"
	self defaultAttributesSetter reApplyNewValues.	"setAttributeNewValue"	"reApplyNewValues"
	"Call the selected INIT method"
	self perform: self activeInit.	"launch the selected INIT method"
	self updateEntities.	"updates theXXXs collections"
	self updateDataForChart.
	self channel isNil
		ifTrue: [ self initializeChannel ].
	self theAgentsComm do: [ :p | p channel: self channel ].
	self theAgentsComm isEmpty
		ifFalse: [ self channel population: self theAgentsComm ].
	"announce to all the subscribers that simulation is beeing initialized"
	self announcer announce: CMSimInitializationAnnouncement
]

{ #category : #initialization }
CMAbstractModel >> initialize [
	"self class spatialClasses isEmpty ifFalse: [self initializeSpaceModel]."	"NB ->retire pour que les cells ne demandent pas le currentSimulation spaceModel alors qu''il n''est pas encore fini d''initialise"
	self class socialClasses ifNil: [ self class initializeWithoutVS ].
	self class socialClasses isEmpty
		ifFalse: [ self initializeChannel ].
	self applyModelDefaultCormasSettings
]

{ #category : #'initalize release' }
CMAbstractModel >> initializeChannel [
	
	self channel: CMChannel new
]

{ #category : #'probes - recording' }
CMAbstractModel >> initializeProbes [
	data := Dictionary new.
	self setDataStructures.
	self cormas ifNil: [ ^ nil ].
	self cormas refreshCharts
]

{ #category : #'initalize release' }
CMAbstractModel >> initializeSpaceModel [
	
	self class cellClass ifNil: [^nil].
	self spaceModel: CMSpaceModel basicNew.
	self spaceModel cormasModel: self.
	self spaceModel initialize.
	self spaceModel initializeRegular
]

{ #category : #'init entities' }
CMAbstractModel >> initializeTheEntity: aClass [
	"Initialize the Entity classes of the model and creates the new collector (IndexedSet)"
	
	| entities |
	entities := self theEntities: aClass.
	entities reverseDo: [:anEntity | anEntity delete].
	aClass CurrentId: 0.
	aClass isAbstract ifTrue: [^OrderedCollection new: 0].
	^entities removeAll
]

{ #category : #'- binary storage' }
CMAbstractModel >> installNewEntities: arrayOfEntitiesSameClass [
	"set the attribute theXXXs of a Class = arrayOfEntitiesSameClass"
	
	| aClass coll newPatch |
	arrayOfEntitiesSameClass isEmpty ifTrue: [^nil].
	aClass := arrayOfEntitiesSameClass first class.
	coll := arrayOfEntitiesSameClass asOrderedCollection.
	self
		perform: (self setterForEntityClass: aClass)
		with: coll.
	coll
		do:
			[:inst | 
			inst collector: self collector.
			inst isSpatialEntity ifTrue: [inst spaceModel: self spaceModel].
			inst isClassLocation
				ifTrue:
					["the patch may be an old instance. We must re-localize the agent"
					inst patch
						ifNotNil:
							[newPatch := self theESE at: inst patch id.
							(inst isKindOf: CMArcEntity)
								ifTrue:
									[(inst startNode notNil and: [inst stopNode notNil])
										ifTrue:
											[| destination |
											destination := self theESE at: inst stopNode patch id.
											inst leave.
											inst isMovedFrom: newPatch to: destination]]
								ifFalse:
									[inst leave.
									inst moveTo: newPatch]]]].
	aClass isSpatialClass
		ifTrue:
			[self spaceModel spatialEntities
				at: aClass name
				put: coll.
			aClass isSpatialEntityElementClass
				ifTrue:
					["newCells notification also dispatch the request to remoteSpaceModels to rebuild the cell figures"
					self spaceModel
						sendCellsToClientSpaceModels: (EntityReference onEntities: coll).	"dispatch the info that cells have been modifyed to all opened spaceInterfaces"
					self spaceModel changed: #newCells]
				ifFalse: [self registerSpaceModelChange: #newAggregates with: aClass]].
	aClass CurrentId: coll size
]

{ #category : #'- binary storage' }
CMAbstractModel >> installNewEntities: aClass fromClone: cloneCormasModel [
	"set the attribute theXXXs of a Class = arrayOfEntitiesSameClass"
	
	| coll |
	coll := (cloneCormasModel theEntities: aClass) copy.
	self
		perform: (self setterForEntityClass: aClass)
		with: coll.
	coll
		do:
			[:inst | 
			inst collector: self collector.
			inst isSpatialEntity ifTrue: [inst spaceModel: self spaceModel].
			inst isClassLocation
				ifTrue:
					[inst patch
						ifNotNil:
							[(inst isKindOf: CMArcEntity)
								ifTrue:
									[(inst startNode notNil and: [inst stopNode notNil])
										ifTrue:
											[self
												registerEntityChange: #newArc
												with:
													(EntityReference on: inst startCell) -> (EntityReference on: inst stopCell)
												from: (EntityReference on: inst)]]
								ifFalse:
									[self
										registerEntityChange: #newOccupant
										with: (EntityReference on: inst patch)
										from: (EntityReference on: inst)]]]].
	aClass isSpatialClass
		ifTrue:
			[self spaceModel spatialEntities
				at: aClass name
				put: coll.
			aClass isSpatialEntityElementClass
				ifTrue:
					["newCells notification also dispatch the request to remoteSpaceModels to rebuild the cell figures"
					self spaceModel
						sendCellsToClientSpaceModels: (EntityReference onEntities: coll).	"dispatch the info that cells have been modifyed to all opened spaceInterfaces"
					self spaceModel changed: #newCells]
				ifFalse: [self registerSpaceModelChange: #newAggregates with: aClass]].
	aClass CurrentId: coll size
]

{ #category : #'+ utilities - population metrics' }
CMAbstractModel >> interquartileRangeOfAttribute: att of: aCollecOrClass [
	"Purpose: returns the interquartile range of teh values of an attribute for a collection of entities (aCollecOrClass)
Argument: aCollecOrClass can be a collection of entities or the name of class, in which case all the entities of that class (including subclasses entities) will be included in the collection
Examples: self interquartileRangeOfAttribute: #age of: Person
			 self interquartileRangeOfAttribute: #age of: (self theBirds)"
	
	^Cormas
		interquartileRange:
			((self allTheEntitiesOfClassOrCollec: aCollecOrClass) asOrderedCollection
				collect: [:e | e perform: att])
]

{ #category : #'probes - recording' }
CMAbstractModel >> lastValueOfGlobalDataNamed: name [
	
	(self data includesKey: self class name)
		ifTrue:
			[((self data at: self class name) includesKey: name)
				ifTrue: [^((self data at: self class name) at: name) last]
				ifFalse: [^0]]
		ifFalse: [^0]
]

{ #category : #'util_files' }
CMAbstractModel >> loadAttributesForClass: aClass fromFile: aStringOrFilename [
	"Load data from a File and set the values of the attributs according to the format declared into the file"
	
	| stream aFilename attype dataLine couple name type numLigne i valeur instances method fileSize getter |
	aFilename := self stringToFilename: aStringOrFilename.
	fileSize := (self getDataLinesFromFile: aStringOrFilename) size.
	getter := self getterForEntityClass: aClass.
	instances := self perform: getter.
	fileSize - 1 = instances size
		ifFalse:
			[self cormas
				warn: 'Different number of instances declared in <1s> and in <2s> !!'
				with: aStringOrFilename asString
				with: getter.
			self halt].	"Reading the datafile, line by line, each line is giving the values for the attributes of an instance of the class"
	aFilename exists
		ifFalse:
			[self cormas warn: 'This particular datafile does not exist !!'.
			^nil].
	stream := aFilename readStream.	"On devine le format des lignes"
	stream lineEndAuto.
	attype := OrderedCollection new.
	dataLine := (stream upTo: Character cr) readStream.
	[dataLine atEnd]
		whileFalse:
			[couple := OrderedCollection new.
			name := dataLine upTo: $(.
			name := (name , ':') asSymbol.
			type := dataLine upTo: $).
			type := ('as' , type) asSymbol.
			dataLine skipSeparators.
			couple
				add: name;
				add: type.
			attype add: couple].
	dataLine close.	"lecture des valeurs des attributs, et maj des entites spatiales a 
	partir de ces valeurs"	"balayage de gauche a droite et de bas en haut"
	numLigne := 0.
	[stream atEnd]
		whileFalse:
			[dataLine := (stream upTo: Character cr) readStream.
			numLigne := numLigne + 1.
			i := 0.
			[dataLine atEnd]
				whileFalse:
					[i := i + 1.
					valeur := dataLine upTo: $,.
					method := (attype at: i) first.
					valeur = 'nil'
						ifFalse: [valeur := valeur perform: (attype at: i) last]
						ifTrue: [valeur := nil].
					valeur isNil
						ifFalse:
							[method = #patchID:
								ifTrue:
									[(aClass inheritsFrom: CMAgentLocation) ifTrue: [method := #moveTo:].
									(aClass inheritsFrom: CMObjectLocation)
										ifTrue: [method := #isMovedTo:].
									valeur := self spaceModel elementaryEntities
										detect: [:cell | cell id = valeur]]].
					(instances at: numLigne) perform: method with: valeur].
			dataLine close].
	stream close
]

{ #category : #deprecated }
CMAbstractModel >> loadAttributesForLocatedEntity: aClass fromFile: aStringOrFilename [
	"Load data from a File, create as many instances of aClass as necessary and set the values of the attributs 
	according to the format declared into the file. If the patchID is declared into the file, the located entities are moved to the right cells"
	
	self createAndLoadLocatedEntity: aClass fromFile: aStringOrFilename
]

{ #category : #deprecated }
CMAbstractModel >> loadDataForClass: aClass fromFile: aStringOrFilename [
	"Deprecated. Load data from a File, create as many instances that necessary and set the values of the attributs according to the format declared into the file"
	
	self setValuesForEntities: aClass fromFile: aStringOrFilename
]

{ #category : #'+ instance creation - spatial grid' }
CMAbstractModel >> loadEnvironmentFromFile: aName [
	"Purpose: create spatial elements and load attributes value specified in a defined env file
	Argument: aName = <String> or aName = <Filename> . If aName = <String>, it creates a Filename from maps directory.
	Example:	self loadEnvironmentFromFile: 'test.env'
	Example: self loadEnvironmentFromFile: ('d:\Vw5i.4\cormas\Models\JLB\maps\test.env' asFilename)"
	
	self spaceModel loadEnvironmentFromFile: aName
]

{ #category : #'+ instance creation - spatial grid' }
CMAbstractModel >> loadEnvironmentFromFile: aName withPov: aSymbol [
	"Purpose: create spatial elements, load attributes value specified in a defined env file and set the point of view of the elementary spatial entity to a defined pov
Argument: aName = <String> or aName = <Filename> . If aName = <String>, it creates a Filename from maps directory. 
aSymbol is the name of the cell pov to be displayed
Example:	self loadEnvironmentFromFile: 'test.env' withPov: #state
Example: self loadEnvironmentFromFile: ('d:\Vw5i.4\cormas\Models\JLB\maps\test.env' asFilename) withPov: #state"
	
	self spaceModel loadEnvironmentFromFile: aName.
	self
		displayPov: aSymbol
		of: self class cellClass
]

{ #category : #'- user interface' }
CMAbstractModel >> loadHabitusName: aString forInterface: aSI [
	
	(self doesHabitusExists: aString) ifFalse: [^nil].
	self
		registerSpaceModelChange: #loadSilentltySIConfigName
		with: aSI -> aString
]

{ #category : #'probes - charts' }
CMAbstractModel >> localCharts [
	
	| list |
	list := OrderedCollection new.
	self class allEntityClasses
		do:
			[:cl | 
			(self data includesKey: cl name)
				ifTrue: [list addAll: (self data at: cl name) keys]].
	^list
]

{ #category : #'probes - charts' }
CMAbstractModel >> localChartsForEntity: aName [
	
	| list |
	list := OrderedCollection new.
	(self data includesKey: aName)
		ifTrue: [list addAll: (self data at: aName) keys].
	^list
]

{ #category : #'+ accessing - entities' }
CMAbstractModel >> lowerLeftCell [
	"Purpose: returns the cell located at the lower left location of the spatial grid"

	^ self spaceModel lowerLeftLocation
]

{ #category : #'+ utilities - population metrics' }
CMAbstractModel >> lowerQuartileOfAttribute: att of: aCollecOrClass [
	"Purpose: returns the lower quartile of the values of an attribute for a collection of entities (aCollecOrClass)
Argument: aCollecOrClass can be a collection of entities or the name of class, in which case all the entities of that class (including subclasses entities) will be included in the collection
Examples: self lowerQuartileOfAttribute: #age of: Person
			 self lowerQuartileOfAttribute: #age of: (self theBirds)"
	
	^Cormas
		lowerQuartile:
			((self allTheEntitiesOfClassOrCollec: aCollecOrClass) asOrderedCollection
				collect: [:e | e perform: att])
]

{ #category : #'+ accessing - entities' }
CMAbstractModel >> lowerRightCell [
	"Purpose: returns the cell located at the lower right location of the spatial grid"

	^ self spaceModel lowerRightLocation
]

{ #category : #'+ utilities - population metrics' }
CMAbstractModel >> maxOfAttribute: att of: aCollecOrClass [
	"Purpose: returns the max value of an attribute for a collection of entities (aCollecOrClass)
Argument: aCollecOrClass can be a collection of entities or the name of class, in which case all the entities of that class (including subclasses entities) will be included in the collection
Examples: self maxOfAttribute: #age of: Person
			 self maxOfAttribute: #age of: (self theBirds)"
	
	^Cormas
		max:
			((self allTheEntitiesOfClassOrCollec: aCollecOrClass) asOrderedCollection
				collect: [:e | e perform: att])
]

{ #category : #'+ utilities - space metrics' }
CMAbstractModel >> meanCompactness: aClass [
	"Purpose: return the mean compactness of the aggregates of a class. The compactness of an aggregate is defined by 4* pi *area / perimeter squared"
	
	^self spaceModel meanCompactness: aClass
]

{ #category : #'+ utilities - space metrics' }
CMAbstractModel >> meanNearestNeighbourDistanceAggregate: aClass attribute: anAttribute [
	"Purpose: Return the average nearest distance between all aggregates that implement the attribute anAttribute
Argument: aClass is an aggregate class that has several subclasses. 
anAttribute is the name of the attribute, ex #state"
	
	^self spaceModel meanNearestNeighbourDistanceAggregate: aClass attribute:
			anAttribute
]

{ #category : #'+ utilities - space metrics' }
CMAbstractModel >> meanPatchSize: aClass [
	"Purpose: Return the average size of instances of an aggregate class.
Argument: aClass is an aggregate.
Example: self meanPatchSize: ForestAggregate"
	
	^self spaceModel meanPatchSize: aClass
]

{ #category : #'+ utilities - population metrics' }
CMAbstractModel >> medianOfAttribute: att of: aCollecOrClass [
	"Purpose: returns the median of an attribute for a collection of entities (aCollecOrClass)
Argument: aCollecOrClass can be a collection of entities or the name of class, in which case all the entities of that class (including subclasses entities) will be included in the collection
Examples: self medianOfAttribute: #age of: Person
			 self medianOfAttribute: #age of: (self theBirds)"
	
	^Cormas
		median:
			((self allTheEntitiesOfClassOrCollec: aCollecOrClass) asOrderedCollection
				collect: [:e | e perform: att])
]

{ #category : #'+ utilities - population metrics' }
CMAbstractModel >> minOfAttribute: att of: aCollecOrClass [
	"Purpose: returns the min value of an attribute for a collection of entities (aCollecOrClass)
Argument: aCollecOrClass can be a collection of entities or the name of class, in which case all the entities of that class (including subclasses entities) will be included in the collection
Examples: self minOfAttribute: #age of: Person
			 self minOfAttribute: #age of: (self theBirds)"
	
	^Cormas
		min:
			((self allTheEntitiesOfClassOrCollec: aCollecOrClass) asOrderedCollection
				collect: [:e | e perform: att])
]

{ #category : #'+ utilities - space metrics' }
CMAbstractModel >> nPatches: aClass [
	"Purpose: Return the number of instances of aClass.
Argument: aClass should be an aggregate.
Example: self nPatches: ForestAggregate"
	
	^self spaceModel nPatches: aClass
]

{ #category : #'+ utilities - space metrics' }
CMAbstractModel >> nbDistinctValuesOf: anAttribute [
	"Purpose: Return the number of SpatialEntityElements instances (theCells for example) that have a different value for anAttribute.
Argument: anAttribute is a symbol
Example: self nClasses: #state"

	^ self spaceModel nbDistinctValuesOf: anAttribute
]

{ #category : #'+ utilities - space metrics' }
CMAbstractModel >> nearestNeighbourProbaAttribute: anAttribute state1: x1 state2: x2 [
	"Purpose: Return the probability to have aCell having x2 as value for anAttribute in the direct neighbourhood (distance = 1) of aCell which has x1 as value for anAttribute.
Argument: anAttribute is the name of the attribute, ex #state, X1 and x2 being two possible values.
Example: self nearestNeighbourProbaAttribute: #landUse state1: #field state2: #forest"
	
	^self spaceModel nearestNeighbourProbaAttribute: anAttribute state1: x1
		state2: x2
]

{ #category : #'+ instance creation - agents & objects' }
CMAbstractModel >> newEntity: aClass [
	"Creates a new instance of aClass and collects it, immediately, at the level of  theXXXs collection. 
	Set also the collector of the new instance"

	| anEntity |
	anEntity := aClass new.
	anEntity
		cormasModel: self;
		collector: self collector.
	self collect: anEntity.
	^ anEntity
]

{ #category : #'default values' }
CMAbstractModel >> newSensitivitySetter: aSensitivityClass [
	
	^sensitivitySetter := aSensitivityClass newOn: self	"sensitivitySetter isNil
		ifTrue: [sensitivitySetter := aSensitivityClass newOn: self]
		ifFalse:
			[(sensitivitySetter isKindOf: SensitivitySetter)
				ifTrue:
					[sensitivitySetter := aSensitivityClass newFromPreviousSetter:
							sensitivitySetter]
				ifFalse: [sensitivitySetter := aSensitivityClass newOn: self]].
	^sensitivitySetter"
]

{ #category : #'+ user interface' }
CMAbstractModel >> openASpaceInterface [
	"Purpose: open programmaticaly a space interface windows
Example: self loadEnvironmentFromFile: 'test.env' .self openASpaceInterface. self displayPov: #state of: Cell "
	
	^self cormas openSpatialGrid
]

{ #category : #'+ user interface' }
CMAbstractModel >> openAnotherInterfaceWithHabitusName: aString [
	"Purpose: open programmaticaly a space interface window and load a specified habitus for it
If a spaceInterface with a habitus of the same name is already open, a new spaceInterface with the same habitus is open.
Argument: aSymbol = <aSymbol> that corresponds to a habitus name previously defined
Example: self openAnotherInterfaceWithHabitusName:'Farmer'    "
	
	self
		loadHabitusName: aString
		forInterface: self openASpaceInterface
]

{ #category : #'default values' }
CMAbstractModel >> openDataSetterInterface [
	
	defaultAttributesSetter
		ifNil: [defaultAttributesSetter := ParameterInterface newOn: self].
	(defaultAttributesSetter isKindOf: ParameterInterface)
		ifFalse:
			[defaultAttributesSetter := ParameterInterface newFromPreviousSetter:
					defaultAttributesSetter].
	self defaultAttributesSetter mainWindow isNil
		ifTrue: [^self defaultAttributesSetter open].
	self defaultAttributesSetter mainWindow isOpen
		ifTrue:
			[(self defaultAttributesSetter mainWindow)
				raise;
				expand]
		ifFalse: [self defaultAttributesSetter open]
]

{ #category : #'+ user interface' }
CMAbstractModel >> openInterfaceWithHabitusName: aString [
	"Purpose: open programmaticaly a space interface window and load a specified habitus for it
If a spaceInterface with a habitus of the same name is already open, it doesn't open a new spaceInterface, but it reloads the specified habitus for this spaceInterface instead.
Argument: aSymbol = <aSymbol> that corresponds to a habitus name previously defined
Example: self openInterfaceWithHabitusName:#Forester"
	
	| collec |
	collec := self openedSpatialGridsForHabitus: aString.
	collec isEmpty
		ifTrue: [self openAnotherInterfaceWithHabitusName: aString]
		ifFalse:
			[collec do: [:si | self loadHabitusName: aString forInterface: si]]
]

{ #category : #'default values' }
CMAbstractModel >> openSensitivityInterface: aSensitivityClass [
	
	sensitivitySetter isNil
		ifTrue: [sensitivitySetter := aSensitivityClass newOn: self].
	(self sensitivitySetter isKindOf: aSensitivityClass)
		ifFalse: [self newSensitivitySetter: aSensitivityClass].
	self sensitivitySetter mainWindow isNil
		ifTrue:
			[self sensitivitySetter open.
			^self sensitivitySetter].
	self sensitivitySetter mainWindow isOpen
		ifTrue:
			[(self sensitivitySetter mainWindow)
				raise;
				expand]
		ifFalse: [self sensitivitySetter open].
	(self sensitivitySetter isKindOf: SensitivitySetter)
		ifTrue: [self sensitivitySetter reinitDefaultValues].
	^self sensitivitySetter
]

{ #category : #'+ accessing - spatial grid' }
CMAbstractModel >> openedSpatialGrid [
	"Purpose: return the last opened spatial grid"

	| spatialGrids |
	spatialGrids := self openedSpatialGrids.
	^ spatialGrids isEmpty
		ifTrue: [ nil ]
		ifFalse: [ spatialGrids last ]
]

{ #category : #'+ accessing - spatial grid' }
CMAbstractModel >> openedSpatialGrids [
	"Purpose: return a collection of all opened spatial grids"
	
	^self spaceModel openedSpatialGrids
]

{ #category : #'+ accessing - spatial grid' }
CMAbstractModel >> openedSpatialGridsForHabitus: aString [
	"Purpose: return a collection of all opened spatial grids corresponding to the habitus named aString"
	
	^self spaceModel openedSpatialGridsForHabitus: aString
]

{ #category : #'accessing - entities' }
CMAbstractModel >> otherAgentsButMe: anAgent [
	"Purpose: Return a collection of all agents from anAgent class, except itself"
	
	^(self theEntities: anAgent class) select: [:other | other ~= anAgent]
]

{ #category : #'+ utilities - space metrics' }
CMAbstractModel >> patchDensity: aClass [
	"Purpose: Return the density of instances of an aggregate class as compared to the total size of the spatial grid (total size of aggregates / grid size).
Argument: aClass should be an aggregate.
Example: self patchDensity: ForestAggregate"

	^ self spaceModel patchDensity: aClass
]

{ #category : #'+ utilities - space metrics' }
CMAbstractModel >> patchDensity: aClass totalArea: aNumber [
	"Purpose: Return the density of instances of an aggregate class as compared to the total specified total area.
Argument: aClass should be an aggregate.
aNumber is the specified total area
Example: self patchDensity: ForestAggregate totalArea: 4875"
	
	^self spaceModel patchDensity: aClass totalArea: aNumber
]

{ #category : #'+ diagram' }
CMAbstractModel >> performActivityDiagram [
	"Purpose: Open an activity diagram chooser, then executes the target diagram. 
This method may be redefined"
	
	| aName |
	aName := self class chooseActivityDiagramName.
	aName ifNil: [^nil].
	self performActivityDiagram: aName
]

{ #category : #'+ diagram' }
CMAbstractModel >> performActivityDiagram: aName [
	"Purpose: This is the main method to execute an activity diagram.
After having found the initial dot (StartFigure), it performs each activity of the diagram, following the way of the transitions, until the stop dot (EndFigure).
aName = <Symbol>
Example: Entity new performActivityDiagram: #exampleTest"
	
	| editor nextActivityModel result |
	editor := self class activityDiagramsAt: aName.
	editor class = ActivityDiagramEditor ifFalse: [^self].
	nextActivityModel := (editor drawing components
		detect: [:fig | fig class = StartFigure]) model outgoing first.	" Loop over the activities "
	[nextActivityModel class = EndPointModel]
		whileFalse:
			["          *****************************************************************      "
			"          ******************      Performs the Activity     ******************      "
			"          *****************************************************************      "
			result := self
				perform: nextActivityModel selectedActivity value asSymbol.	"          *****************************************************************      "	"		select the next activity to be performed "
			nextActivityModel class = ActivityModel
				ifTrue: [nextActivityModel := nextActivityModel outgoing first]
				ifFalse:
					[(result isKindOf: Boolean)
						ifFalse:
							[self cormas warn:
									'The decision method called %<%<<1s>>> did not return a Boolean. It returns: '
								with: aName with: result.
							^self].
					result
						ifTrue: [nextActivityModel := nextActivityModel outgoingTrue]
						ifFalse: [nextActivityModel := nextActivityModel outgoingFalse]]]
]

{ #category : #'deprecated - mouse behavior' }
CMAbstractModel >> performCtrlRedButton: aPoint [
	
	
]

{ #category : #'deprecated - mouse behavior' }
CMAbstractModel >> performRedButton: aPoint [
	"to inspect the spatial which extent includes aPoint"
	
	self spaceModel performRedButton: aPoint
]

{ #category : #'deprecated - mouse behavior' }
CMAbstractModel >> performShiftCtrlRedButton: aPoint [
	"to open the charts interface for the occupant located at aPoint"
	
	self spaceModel performShiftCtrlRedButton: aPoint
]

{ #category : #'deprecated - mouse behavior' }
CMAbstractModel >> performShiftRedButton: aPoint [
	"to inspect the occupants located at aPoint"
	
	self spaceModel performShiftRedButton: aPoint
]

{ #category : #'+ accessing - entities' }
CMAbstractModel >> pickCell [
	"Purpose: return a spatialEntityElement (aCell) picked randomly from the spatial grid.
	Example: self pickCell"

	^ Cormas selectRandomlyFrom: self theESE
]

{ #category : #'+ accessing - entities' }
CMAbstractModel >> pickCellConstrainedBy: aBlock [
	"Purpose: return a random cell of the grid. The cell verifies the block condition.
	Example:  self pickCellConstrainedBy: [:cell | state=#land] or self pickCellConstrainedBy: [: cell | cell energy > 1] "

	^ Cormas
		selectRandomlyFrom: (self theESE asArray select: [ :c | aBlock value: c ])
]

{ #category : #'+ accessing - entities' }
CMAbstractModel >> pickCellWithoutAny: aClass [
	"Purpose: return a cell (picked randomly) without any instance of aClassName
	Return Value: a cell
	Example1: self pickCellWithoutAny: Building
	Example2: self pickCellWithoutAny: #Building"

	^ self
		pickCellConstrainedBy: [ :cell | (cell occupantsAt: aClass) isEmpty ]
]

{ #category : #'+ accessing - entities' }
CMAbstractModel >> pickCellsN: anInteger [
	"Purpose: return a collection of spatialEntityElements (some Cells) picked randomly from the spatial grid (without replacement).
	Example: self pickCellsN: 5"

	^ Cormas selectRandomlyFrom: self theESE subCollectionSize: anInteger
]

{ #category : #'+ accessing - entities' }
CMAbstractModel >> pickEntity: aClass [
	"Purpose: return an entity belonging to a class, picked randomly.
	Return Value: an instance of aClass, or nil if there is no instance  
	Example:  self pickEntity: RestrainedForager "

	^ Cormas selectRandomlyFrom: (self allTheEntities: aClass)
]

{ #category : #'+ accessing - entities' }
CMAbstractModel >> pickEntity: aClass constrainedBy: aBlock [
	"Purpose: return a random entity belonging to a class and verifying the block condition.
	Return Value: an instance of aClass, or nil if there is no instance verifying the condition 
	Example:  self pickEntity: RestrainedForager constrainedBy: [:e| e patch energy <2]"

	^ Cormas
		selectRandomlyFrom: ((self allTheEntities: aClass) select: [ :c | aBlock value: c ])
]

{ #category : #'+ accessing - entities' }
CMAbstractModel >> pickN: anInteger entities: aClass [
	"Purpose: return a collection of entities belonging to a class .
	Return Value: a collection of instances of aClass, or an empty collection if there is no instance
	Example:  self pickN: 5 entities: Forager"

	^ Cormas
		selectRandomlyFrom: (self allTheEntities: aClass)
		subCollectionSize: anInteger
]

{ #category : #'+ accessing - entities' }
CMAbstractModel >> pickN: anInteger entities: aClass constrainedBy: aBlock [
	"Purpose: return a collection of entities belonging to a class and verifying a condition.
	Return Value: a collection of instances of aClass, or an empty collection if there is no instance verifying the condition 
	Example:  self pickN: 5 entities: Forager constrainedBy: [:e| e energy > 50] "

	^ Cormas
		selectRandomlyFrom: ((self allTheEntities: aClass) select: [ :c | aBlock value: c ])
		subCollectionSize: anInteger
]

{ #category : #'+ accessing - entities' }
CMAbstractModel >> pickUnoccupiedCell [
	"Purpose: return a random cell not occuppied of the grid
	Return Value: a cell"

	^ self pickCellConstrainedBy: [ :cell | cell noOccupant ]
]

{ #category : #'initalize release' }
CMAbstractModel >> prepareCommunicationFor: anAgent [
	
	anAgent channel: self channel.
	self channel population add: anAgent.
	self channel listeFonctionObs
		do: [:a | a populationSourceAddAgent: anAgent]
]

{ #category : #accessing }
CMAbstractModel >> projectManager [
	^ projectManager
]

{ #category : #accessing }
CMAbstractModel >> projectManager: anObject [
	projectManager := anObject
]

{ #category : #deprecated }
CMAbstractModel >> randomCell [
	"Purpose: Return a spatialEntityElement (aCell) picked randomly from the spatial grid."
	
	^self pickCell
]

{ #category : #deprecated }
CMAbstractModel >> randomFreeCell [
	
	^self pickUnoccupiedCell
]

{ #category : #'+ utilities - files' }
CMAbstractModel >> readCsvFile: file [
	" Returns a <Collection> of collections, each one containing the values of the csv file (separator is ';').
	The file name is just a string containing the name of the file (with or without extension) that is stored in the *** /data *** directory of a model.
	Ex:    self readCsvFile: 'palaya1973'  or  self readCsvFile: 'palaya1973.cvs'     "
	
	^ CMResourceLocator new
		readCsvFile: file
		myModel: self class name asString
]

{ #category : #'+ utilities - files' }
CMAbstractModel >> readMatrix: fileName sep: aSepChar [
	"Returns a collection of collections, each one containing the values between the separator of the file.
The file name is just a string containing the name of the file (with extension) that is stored in the /data directory of the model.
fileName = <String> or <Filename>
Ex: self readMatrix: 'test.csv' sep: ';'   "
	
	| filename |
	filename := self stringToFilename: fileName.
	^Cormas readMatrix: filename sep: aSepChar
]

{ #category : #'private - notification' }
CMAbstractModel >> registerChange: aChange [
	"register a Change (transmit the change immediatly or in a group later"
	
	delayedChanges == nil
		ifTrue:
			["immediate transmission"
			self spaceModel noticeChange: aChange]
		ifFalse:
			["store the change information for delayed transmission"
			"In case the delaychanges already includes an #updateEntity notice on that same entity ->"
			"aChange symbol = #valueChanged ifTrue:[coll removeAllSuchThat: [:c| c symbol  = #valueChanged and:[c entity = aChange entity]]]."
			delayedChanges size >= 200
				ifTrue:
					[| coll |
					coll := delayedChanges.
					delayedChanges := OrderedCollection new: 200.
					self spaceModel noticeChanges: coll].
			delayedChanges add: aChange]
]

{ #category : #'private - notification' }
CMAbstractModel >> registerEntityChange: aSymbol from: anEntityReference [
	"report a change from anEntity (sent encapsulated in an entityReference). These changes can be delayed in order to make one remote call with many changes"
	
	^self registerEntityChange: aSymbol with: nil from: anEntityReference
]

{ #category : #'private - notification' }
CMAbstractModel >> registerEntityChange: aSymbol with: aParameter from: anEntity [
	"report a change from anEntity. These changes can be delayed in order to make one remote call with many changes"
	
	self
		registerChange:
			(EntityChange newChange: aSymbol with: aParameter from: anEntity)
]

{ #category : #'private - notification' }
CMAbstractModel >> registerSpaceModelChange: aSymbol [
	"report a change from the spaceModel. These changes can be delayed in order to make one remote call with many changes"
	
	^self registerSpaceModelChange: aSymbol with: nil
]

{ #category : #'private - notification' }
CMAbstractModel >> registerSpaceModelChange: aSymbol with: aParameter [
	"report a change from the spaceModel. These changes can be delayed in order to make one remote call with many changes"
	
	self
		registerChange: (SpaceModelChange newChange: aSymbol with: aParameter)
]

{ #category : #'initalize release' }
CMAbstractModel >> release [
	
	self spaceModel release.
	self spaceModel: nil.
	self channel isNil ifFalse: [self channel population: nil].
	self channel: nil.
	super release
]

{ #category : #'referencing entities' }
CMAbstractModel >> removeDeadEntities [
	"removes all the dead or destroyed intances"
	
	self removeDestroyedEntities
]

{ #category : #'referencing entities' }
CMAbstractModel >> removeDeadEntities: aClass [
	"removes all the dead or destroyed intances of type: aClass"
	
	| theEntities destroyedEntities |
	theEntities := self theEntities: aClass.
	theEntities isNil
		ifFalse:
			[destroyedEntities := theEntities select: [:a | a destroyed].
			destroyedEntities
				do:
					[:a | 
					(self class occupantClasses includes: aClass) ifTrue: [a leave].
					theEntities remove: a]]
]

{ #category : #'referencing entities' }
CMAbstractModel >> removeDestroyedEntities [
	"removes all the dead or destroyed intances"
	
	self class allEntityClasses do: [:aClass | self removeDestroyedEntities: aClass]
]

{ #category : #'referencing entities' }
CMAbstractModel >> removeDestroyedEntities: aClass [
	"removes all the dead or destroyed intances of type: aClass"
	
	| theEntities destroyedEntities |
	theEntities := self theEntities: aClass.
	theEntities isNil
		ifFalse:
			[destroyedEntities := theEntities select: [:a | a destroyed].
			destroyedEntities
				do:
					[:a | 
					a isSituated ifTrue: [a leave].
					theEntities remove: a]]
]

{ #category : #'referencing entities' }
CMAbstractModel >> removeEntity: anEntity [
	"removes the dead or destroyed Entity"
	
	anEntity isSituated ifTrue: [anEntity leave].
	(self theEntities: anEntity class)
		remove: anEntity
		ifAbsent: [nil]
]

{ #category : #'initalize release' }
CMAbstractModel >> removeFromChannel: anAgent [
	
	self channel listeFonctionObs
		do: [:a | a populationSourceRemoveAgent: anAgent]
]

{ #category : #'private - notification' }
CMAbstractModel >> removeMultipleChanges [
	"remove all the overlapping changes for the entities (before displaying). Just keep the last change"
	
	| lastChanges otherChanges |
	"otherChanges := delayedChanges removeAllSuchThat: [: e | e class ~= EntityChange]."
	lastChanges := OrderedCollection new.
	otherChanges := OrderedCollection new.
	delayedChanges
		reverseDo:
			[:ent | 
			ent class ~= EntityChange
				ifTrue: [otherChanges add: ent]
				ifFalse:
					[(lastChanges
						contains: [:e | e entity = ent entity and: [e symbol = ent symbol]])
						ifFalse: [lastChanges add: ent]]].
	delayedChanges := otherChanges reverse.
	delayedChanges addAll: lastChanges reverse
]

{ #category : #'- binary storage' }
CMAbstractModel >> removeOldEntities: aClass [
	"Delete the entities of aClass, stored into 'theXXXs' collection.
	entities = <Class>"
	
	| entities |
	entities := self perform: (self getterForEntityClass: aClass).
	entities reverseDo: [:inst | inst delete].
	self removeDestroyedEntities: aClass.
	aClass CurrentId: nil
]

{ #category : #'+ update' }
CMAbstractModel >> resetCells [
	"Purpose: reset all the generic attributes of the cells"
	
	self theESE do: [:e | e reset]
]

{ #category : #accessing }
CMAbstractModel >> resourceLocator [
	" Answer the receiver's <CMResourceLocator>, an object to locate resources "

	^ self projectManager resourceLocator
]

{ #category : #scheduling }
CMAbstractModel >> runStep [
	"The main step method that activates the agents:
		- INCREMENT the timeStep
		- EXECUTE the selected #Step method (of the ScenarioBuilder Interface) for the new timeStep,
		- UPDATE the Entities (remove the dead ones and add the new ones in theXXs collections).
	(For display: Store the changed entities in a collection and request an update of the space views at the end of the timestep)"
	
	self incrementTimeStep.
	self
		delayChangesWhile:
			[self activeControl last = $:
				ifTrue:
					[self
						perform: self activeControl
						with: self timeStep]
				ifFalse: [self perform: self activeControl].
			self updateEntities].
	self channel notNil ifTrue: [self channel flush].
	self updateDataForChart.
]

{ #category : #deprecated }
CMAbstractModel >> runStep: aStep [
	"The main step method that activates the agents:
		- execute the selected STEP method (of the ScenarioBuilder Interface),
		- UPDATE the Entities (remove the dead ones and add the new ones in theXXs collections).
	(For display: Store the changed entities in a collection and request an update of the space views at the end of the timestep)"
	
	self
		delayChangesWhile:
			[self activeControl last = $:
				ifTrue:
					[self
						perform: self activeControl
						with: aStep]
				ifFalse: [self perform: self activeControl].
			self updateEntities].
	self channel notNil ifTrue: [self channel flush]
]

{ #category : #'+ utilities - save load attributes' }
CMAbstractModel >> saveAttributes: attributes fromClass: aClass inFile: aStringOrFilename [
	"Save the attributes of the intances of aClass on a file 'aStringOrFilename'  
attributes <OrderedCollection> ex: OrderedCollection ('seed' 'context')
file <Filename> ex: aFATFilename('d:\vw7nc\cormas\Models\TSE\data\titi.txt') or
file <String> ex: 'titi.txt'  it will be save into data/"
	
	self
		saveAttributes: attributes
		fromClass: aClass
		inFile: aStringOrFilename
		separator: Character tab
]

{ #category : #'private - util_files' }
CMAbstractModel >> saveAttributes: attributes fromClass: aClass inFile: aStringOrFilename separator: aChar [
	"Save the attributes of the intances of aClass on a file 'aStringOrFilename'  
attributes <OrderedCollection> ex: OrderedCollection ('seed' 'context')
file <Filename> ex: aFATFilename('d:\vw7nc\cormas\Models\TSE\data\titi.txt') or
file <String> ex: 'titi.txt'  it will be save into data/"
	
	| stream dicoAttConv instance a c filename instances |
	filename := self stringToFilename: aStringOrFilename.
	instances := self perform: (self getterForEntityClass: aClass).
	instances isEmpty ifTrue: [^nil].
	stream := filename appendStream.	" attributs a sauver, ainsi que leur type (on perd cette info car on les sauve au format string "	"stream nextPutAll: 'attributes	'."
	dicoAttConv := self getAttributesType: attributes fromInstances: instances.
	attributes
		do:
			[:att | 
			| typ |
			typ := (dicoAttConv at: att asSymbol) last.
			stream
				nextPutAll: att asSymbol , typ;
				nextPutAll:
						(att = attributes last
								ifFalse: [aChar asSymbol asString]
								ifTrue: ['\' withCRs])].	" Fin du fichier : 1 ligne pour les valeurs des attributs de chaque instance "
	1
		to: instances size - 1
		do:
			[:i | 
			instance := instances at: i.
			attributes
				do:
					[:att | 
					a := att asSymbol.
					c := (dicoAttConv at: a) first.
					stream
						nextPutAll: ((instance perform: a) perform: c);
						nextPutAll:
								(att = attributes last
										ifFalse: [aChar asSymbol asString]
										ifTrue: ['\' withCRs])]].
	instance := instances last.
	attributes
		do:
			[:att | 
			a := att asSymbol.
			c := (dicoAttConv at: a) first.
			stream
				nextPutAll: ((instance perform: a) perform: c);
				nextPutAll:
						(att = attributes last
								ifFalse: [aChar asSymbol asString]
								ifTrue: ['\' withCRs])].
	stream close
]

{ #category : #'+ utilities - binary storage' }
CMAbstractModel >> saveBOS: aCollection into: aFileName [
	"Purpose: Save the entities of aCollection into a BOS file. The file is stored into the 'dump' directory of the model.
	Arguments:  aCollection <Collection of Entities> ; aFileName = <String>
	Example: self saveBOS: self theFarmers into: '10x10.Farmer' "
	
	| bos fileName |
	fileName := (Cormas dumpPath: self class name) construct: aFileName.
	bos := BinaryObjectStorage onNew: fileName writeStream.
	bos expectCycles: false.
	[bos nextPutAll: aCollection] ensure: [bos close]
]

{ #category : #'+ utilities - files' }
CMAbstractModel >> saveCollec: aCollec inCsvFile: aString [
	"Save in /data directory a Collection of literals (characters, numbers, strings...) as csv file (easily openable with Excel.
	aString = the name of the file (with or without .csv extention)
	aString = <String> or <Filename> (with or without .csv extention)"
	
	Cormas
		saveCollec: aCollec
		inCsvFile: (self stringToFilename: aString)
]

{ #category : #'+ utilities - save load attributes' }
CMAbstractModel >> saveLocatedAgent: aClass withAttributs: attributes inFile: aStringOrFilename [
	"Save the attributes of the intances of aClass (SituatedAgent or LocatedObject) on a file 'aStringOrFilename'  
attributes <OrderedCollection> ex: OrderedCollection ('seed' 'context')
file <Filename> ex: aFATFilename('d:\vw7nc\cormas\Models\TSE\data\titi.txt') or
file <String> ex: 'titi.txt'  it will be save into data/"
	
	attributes add: 'patchID'.
	self saveAttributes: attributes fromClass: aClass inFile:
			aStringOrFilename
]

{ #category : #'+ accessing - entities' }
CMAbstractModel >> selectCellsBetweenLine1: lineNumber1 line2: lineNumber2 andColumn1: colNumber1 column2: colNumber2 [
	"Purpose: Return the cells between the lines lineNumber1 and lineNumber2, and between the columns colNumber1 and colNumber2 of the spatial grid. The Cells are sorted by id.
Arguments: lineNumber1   <Integer> lineNumber = Positive Integer
Arguments: lineNumber2   <Integer> colNumber = Positive Integer
Arguments: colNumber1   <Integer> lineNumber = Positive Integer
Arguments: colNumber2   <Integer> colNumber = Positive Integer
Example:  cellsBetweenLine1: 1 line2: 6 andColumn1: 2 column2: 3  ->  a collection of cells between columns 2 and 3, and between lines 1 and 6, and ordered from line 1 to line 6"

	^ self spaceModel
		cellsBetweenLine1: lineNumber1
		line2: lineNumber2
		andColumn1: colNumber1
		column2: colNumber2
]

{ #category : #'+ accessing - entities' }
CMAbstractModel >> selectCellsInRectangle: aRectangle [
	"This method is deprecated. Please use selectCellsBetweenLine1:line2:andColumn1:column2: ."

	"Purpose: return a collection of the cells located in a rectangle defined by an origin cell (top left) and a corner cell (down right). The collection of cells is sorted by id.
	Argument: aRectangle   <Rectangle> where origin < corner.
	Example: self  selectCellsInRectangle: (Rectangle origin: 1@2 corner: 6@3)  ->  a collection of cells between columns 2 and 3, and between lines 1 and 6, and ordered from line 	1 to line 6"

	self
		deprecated: 'Please use selectCellsBetweenLine1:line2:andColumn1:column2: instead'.
	^ self
		selectCellsBetweenLine1: aRectangle left
		line2: aRectangle right
		andColumn1: aRectangle top
		column2: aRectangle bottom
]

{ #category : #'+ accessing - entities' }
CMAbstractModel >> selectCellsInRectangleOriginCell: cell1 cornerCell: cell2 [
	"Purpose: return a collection of the cells located in a rectangle defined by an origin cell and a cell at the opposit corner of the rectangle. The collection of cells is ordered from cell1 to cell2.
	Arguments : cell1   <SpatialEntityElement>
	Arguments : cell2   <SpatialEntityElement>
	Example: self createAggregate: City from: (self selectCellsInRectangleOriginCell: self upperLeftCell  cornerCell: self pickCell)"

	^ self spaceModel cellsIntoRectangleFrom: cell1 to: cell2
]

{ #category : #'+ accessing - entities' }
CMAbstractModel >> selectCellsOfColumn: colNumber [
	"Purpose: return a collection of the cells belonging to the specified column of the spatial grid.
	Arguments: colNumber   <Integer> colNumber = Positive Integer
	Example: self ask: (self selectCellsOfColumn: 2) toDo: #flash"

	^ self spaceModel cellsOfColumn: colNumber
]

{ #category : #'+ accessing - entities' }
CMAbstractModel >> selectCellsOfLine: lineNumber [
	"Purpose: return a collection of the cells belonging to the specified line of the spatial grid.
	Arguments : lineNumber   <Integer> lineNumber = Positive Integer
	Example: self ask: (self selectCellsOfLine: 2) toDo: #flash"

	^ self spaceModel cellsOfLine: lineNumber
]

{ #category : #'default values' }
CMAbstractModel >> sensitivitySetter [
	
	^sensitivitySetter
		ifNil: [sensitivitySetter := OATsensitivity newOn: self]
]

{ #category : #'default values' }
CMAbstractModel >> sensitivitySetter: anObject [
	
	sensitivitySetter := anObject
]

{ #category : #'- binary storage' }
CMAbstractModel >> setAttributesOf: aClass [
	
	| theInstances attributes assos attribValue |
	theInstances := self theEntities: aClass.
	attributes := aClass allInstVarNames.
	theInstances
		do:
			[:inst | 
			1
				to: attributes size
				do:
					[:i | 
					((inst instVarAt: i) isKindOf: Association)
						ifTrue:
							[assos := inst instVarAt: i.
							attribValue := (self theEntities: assos key)
								detect: [:o | o id = assos value]
								ifNone: [nil].
							attribValue isNil
								ifFalse:
									["inst perform: ((attributes at: i), ':') asSymbol with: attribValue."
									inst instVarAt: i put: attribValue]]]]
]

{ #category : #'- probes color' }
CMAbstractModel >> setColor: aColorValue forProbe: aSymbol [
	"Method is defined by the class
           ->creates a color method at class level"
	
	^self class setColor: aColorValue forProbe: aSymbol
]

{ #category : #'- binary storage' }
CMAbstractModel >> setCurrentID_from: arrayOfEntities [
	
	| lastId |
	(Set withAll: (arrayOfEntities collect: [:inst | inst class]))
		do:
			[:aClass | 
			lastId := (arrayOfEntities select: [:inst | inst class = aClass]) size.
			aClass CurrentId: lastId]
]

{ #category : #'probes - recording' }
CMAbstractModel >> setDataStructures [
	
	self class activeProbes isEmpty
		ifFalse:
			[self data
				at: self class name
				put: Dictionary new.
			self class activeProbes
				do:
					[:p | 
					(self data at: self class name)
						at: p
						put: OrderedCollection  new]].
	self class allEntityClasses
		do:
			[:c | 
			c activeProbes isEmpty
				ifFalse:
					[self data
						at: c name
						put: Dictionary new.
					c activeProbes
						do:
							[:p | 
							(self data at: c name)
								at: p
								put: Dictionary new]]]
]

{ #category : #'+ init - spatial entities' }
CMAbstractModel >> setLinearGradientForAttribute: aString centralValue: cv borderValue: bv [
	"Purpose: Set the value of anAttribute of all spatial entity elements of the spatial grid in order to create a linear gradient for anAttribute starting from centre of the spatial grid with the value cv to the border of the spatial grid with the value bv. The horizontal and vertical grid dimensions have to be an odd number.
Arguments: cv and bv are numbers (integer or float). anAttribute is the name of the attribute as symbol. 
Example: self setLinearGradientForAttribute: #energy centralValue: 10 borderValue: 0.1"
	
	^self spaceModel setLinearGradientForAttribute: aString centralValue: cv
		borderValue: bv
]

{ #category : #'+ init - spatial entities' }
CMAbstractModel >> setLinearGradientForAttribute: anAttribute centralValue: cv borderValue: bv bySections: anArray [
	"Purpose: Set the value of anAttribute of all spatial entity elements of the spatial grid in order to create a gradient by layers for anAttribute starting from centre of the spatial grid with the value cv to the border of the spatial grid with the value bv. The horizontal and vertical grid dimensions have to be an odd number.
Arguments: cv and bv are numbers (integer or float). anAttribute is the name of the attribute as symbol. 
anArray is an array made of two values arrays. The first value specifies the number of layers affected and the second value is a factor affecting the gradient for the concerned layer.
Example: self setLinearGradientForAttribute: #energy centralValue: 10 borderValue: 0.1 bySections: #( #(2 0.5) #(4 1) #(2 0.5))"
	
	^self spaceModel setLinearGradientForAttribute: anAttribute centralValue:
			cv borderValue: bv bySections: anArray
]

{ #category : #'accessing - entities' }
CMAbstractModel >> setNewCollector [
	
	self collector: CMCollector new.
	collector cormasModel: self
]

{ #category : #'accessing - entities' }
CMAbstractModel >> setTheEntity: aClass with: aSet [
	
	^self
		perform: (self setterForEntityClass: aClass)
		with: aSet
]

{ #category : #'+ utilities - save load attributes' }
CMAbstractModel >> setValuesForEntities: aClass fromFile: aStringOrFilename [
	"Load data from a File and set the values of the attributs according to the format declared into the file"
	
	| stream aFilename attype dataLine couple name type numLigne i valeur instances method fileSize getter |
	aFilename := self stringToFilename: aStringOrFilename.
	fileSize := (self getDataLinesFromFile: aStringOrFilename) size.
	getter := self getterForEntityClass: aClass.
	instances := self perform: getter.
	fileSize - 1 = instances size
		ifFalse:
			[self cormas
				warn: 'Different number of instances declared in <1s> and in <2s> !!'
				with: aStringOrFilename asString
				with: getter.
			self halt].	"Reading the datafile, line by line, each line is giving the values for the attributes of an instance of the class"
	aFilename exists
		ifFalse:
			[self cormas warn: 'This particular datafile does not exist !!'.
			^nil].
	stream := aFilename readStream.	"On devine le format des lignes"
	stream lineEndAuto.
	attype := OrderedCollection new.
	dataLine := (stream upTo: Character cr) readStream.
	[dataLine atEnd]
		whileFalse:
			[couple := OrderedCollection new.
			name := dataLine upTo: $(.
			name := (name , ':') asSymbol.
			type := dataLine upTo: $).
			type := ('as' , type) asSymbol.
			dataLine skipSeparators.
			couple
				add: name;
				add: type.
			attype add: couple].
	dataLine close.	"lecture des valeurs des attributs, et maj des entites spatiales a 
	partir de ces valeurs"	"balayage de gauche a droite et de bas en haut"
	numLigne := 0.
	[stream atEnd]
		whileFalse:
			[dataLine := (stream upTo: Character cr) readStream.
			numLigne := numLigne + 1.
			i := 0.
			[dataLine atEnd]
				whileFalse:
					[i := i + 1.
					valeur := dataLine upTo: $,.
					method := (attype at: i) first.
					valeur = 'nil'
						ifFalse: [valeur := valeur perform: (attype at: i) last]
						ifTrue: [valeur := nil].
					valeur isNil
						ifFalse:
							[method = #patchID:
								ifTrue:
									[(aClass inheritsFrom: CMAgentLocation) ifTrue: [method := #moveTo:].
									(aClass inheritsFrom: CMObjectLocation)
										ifTrue: [method := #isMovedTo:].
									valeur := self spaceModel elementaryEntities
										detect: [:cell | cell id = valeur]]].
					(instances at: numLigne) perform: method with: valeur].
			dataLine close].
	stream close
]

{ #category : #'accessing - entities' }
CMAbstractModel >> setterForEntityClass: aClass [
	"Return a Symbol as a name for the setter accessor for the entity class aClass.
	ex : Object -> #theObjects: 

	self basicNew setterForEntityClass: Object
	"
	
	^self class setterForEntityClass: aClass
]

{ #category : #'+ utilities - space metrics' }
CMAbstractModel >> shannon: anAttribute [
	"Purpose : Returns the Shannon index of the attribute of SpatialEntity suchThat:
Ha = - SumOf [ occuranceOf(attribut) . ln(occuranceOf(attribut)) ] 
Argument: anAttribute  <Symbol> is the name of the attribute
Example: self shannon: #state"
	
	^self spaceModel shannon: anAttribute
]

{ #category : #accessing }
CMAbstractModel >> simManager [
	
	^ simManager
		ifNil: [
			simManager := CMSimManager new 
				cormasModel: self;
				yourself ]
]

{ #category : #accessing }
CMAbstractModel >> simManager: anObject [
	
	simManager := anObject
]

{ #category : #accessing }
CMAbstractModel >> simNumero [
	
	^self simManager simNumero
]

{ #category : #'accessing  - projectManager' }
CMAbstractModel >> simWindow [

^self projectManager ifNil:[nil] ifNotNil:[:pm| pm projectWindow simWindow simWindow ]
]

{ #category : #'- pov and info' }
CMAbstractModel >> situatedEntitiesFrom: aClass povAt: povSelector [
	"return a collection of povs from all entities inheriting from aClass"
	
	| coll |
	coll := OrderedCollection new.
	(self theEntities: aClass)
		do:
			[:each | each isSituated ifTrue: [coll add: (each povAt: povSelector)]].
	^coll
]

{ #category : #accessing }
CMAbstractModel >> spaceModel [
	^ spaceModel
]

{ #category : #accessing }
CMAbstractModel >> spaceModel: aSpaceModel [
	spaceModel := aSpaceModel
]

{ #category : #accessing }
CMAbstractModel >> spaceModelEntities [

	^ self spaceModel ifNotNil: [:sm| sm spatialEntities values flattened asOrderedCollection]
]

{ #category : #'+ utilities - population metrics' }
CMAbstractModel >> stDevOfAttribute: att of: aCollecOrClass [
	"Purpose: returns the standard Deviation  of an attribute for a collection of entities (aCollecOrClass)
Argument: aCollecOrClass can be a collection of entities or the name of class, in which case all the entities of that class (including subclasses entities) will be included in the collection
Examples: self stDevOfAttribute: #age of: Person
			 self stDevOfAttribute: #age of: (self theBirds)"
	
	^Cormas
		standardDeviation:
			((self allTheEntitiesOfClassOrCollec: aCollecOrClass) asOrderedCollection
				collect: [:e | e perform: att])
]

{ #category : #deprecated }
CMAbstractModel >> stepAgents [
	"DEPRECATED"
	"Iteration over the collection of agents. The agents are ordered according to their id"
	
	self stepEntities: self theAgents
]

{ #category : #deprecated }
CMAbstractModel >> stepAsynchronously: t [
	"Purpose: To active the transition function and to update asynchronously a cellular automata"
	
	self stepAsynchronouslyCA: t
]

{ #category : #'+ control' }
CMAbstractModel >> stepAsynchronouslyCA: t [
	"Purpose: To active the transition function and to update asynchronously a cellular automata"
	
	self theESE
		do:
			[:a | 
			a
				newState;
				updateState]
]

{ #category : #deprecated }
CMAbstractModel >> stepDynPop: aCollec [
	"Deprecated. Should use   stepEntities: aCollec"
	
	| newBorns repro |
	newBorns := OrderedCollection new.
	(Cormas mix: aCollec)
		do:
			[:anAgent | 
			repro := anAgent step.
			repro notNil ifTrue: [newBorns add: repro]].
	self update: aCollec with: newBorns
]

{ #category : #'+ control' }
CMAbstractModel >> stepEntities: aCollecOrClass [
	"Purpose: Iteration over aCollec or the entities of a class. In case aCollecOrClass is a class, the entities are ordered according to their id. In case aCollecOrClass is a collection of instances, the order of the collection is kept.
Example: self stepEntities: Farmer
Example: self stepEntities: (self theForagers select:[:f| f energy > 10])"
	
	self ask: aCollecOrClass toDo: #step
]

{ #category : #'+ control' }
CMAbstractModel >> stepEntitiesRandom: aCollecOrClass [
	"Purpose: Iteration over aCollec or the entities of a class. The elements of aCollec / or the instances of the class, are randomly mixed.
Example: self stepEntities: Farmer
Example: self stepEntities: (self theForagers select:[:f| f energy > 10])"
	
	self askRandom: aCollecOrClass toDo: #step
]

{ #category : #deprecated }
CMAbstractModel >> stepSynchronously: t [
	"Purpose: To active the transition function and to update synchronously a cellular automata
Example: See the models Conway http://cormas.cirad.fr/en/applica/conway.htm or Fire http://cormas.cirad.fr/en/applica/fireautomata.htm "
	
	self stepSynchronouslyCA: t
]

{ #category : #'+ control' }
CMAbstractModel >> stepSynchronouslyCA: t [
	"Purpose: To active the transition function and to update synchronously a cellular automata
Example: See the models Conway http://cormas.cirad.fr/en/applica/conway.htm or Fire http://cormas.cirad.fr/en/applica/fireautomata.htm"
	
	self theESE do: [:a | a newState].
	self theESE do: [:a | a updateState]
]

{ #category : #'utilities - files' }
CMAbstractModel >> stringToFilename: aStringOrFilename [
	"Returns a Filename from (aStringOrFilename) located into the current model 'data' 
	directory (ex: 'cormas.env') "
	
	| aFilename |
	aStringOrFilename isString
		ifTrue:
			[aFilename := (Cormas dataPath: self class name) construct:
					aStringOrFilename]
		ifFalse: [aFilename := aStringOrFilename].
	^aFilename
]

{ #category : #'+ utilities - population metrics' }
CMAbstractModel >> sumOfAttribute: att of: aCollecOrClass [
	"Purpose: returns the sum of values of an attribute for a collection of entities (aCollecOrClass)
Argument: aCollecOrClass can be a collection of entities or the name of class, in which case all the entities of that class (including subclasses entities) will be included in the collection
Examples: self sumOfAttribute: #age of: Person
			 self sumOfAttribute: #age of: (self theBirds)"
	
	^Cormas
		sum:
			((self allTheEntitiesOfClassOrCollec: aCollecOrClass) asOrderedCollection
				collect: [:e | e perform: att])
]

{ #category : #'+ testing - scheduling' }
CMAbstractModel >> testPeriodicity: anInteger [
	"Purpose: To test if the curent time step is a multiple of the periodicity defined by anInteger
Return value: aBoolean
Example: (self testPeriodicity: 12) ifTrue:[self theFarmers do:[:f| f calculateAnnualBalance]]"
		
	^self timeStep \\ anInteger = 0
]

{ #category : #'+ accessing - entities' }
CMAbstractModel >> theAgents [
	"Purpose: returns a collection of all the agents (social entities) of the model
	Example: self ask: (self theAgents) toDo: #step"

	| collection |
	collection := OrderedCollection new.
	self class socialClasses
		do: [ :cl | collection addAll: (self theEntities: cl) ].
	^ collection
]

{ #category : #'accessing - entities' }
CMAbstractModel >> theAgentsComm [
	"Returns a collection of all the communicating agents (social agents) of the model"
	
	^self theAgents select: [:ag | ag isAgentComm]
]

{ #category : #'accessing - entities' }
CMAbstractModel >> theCSE: aSet [
	
	| coll |
	coll := self class compoundSpatialClasses.
	coll size = 0
		ifTrue: [^self cormas warn: 'Pas d''entites spatiales composees !'].
	coll size > 1
		ifTrue:
			[^self cormas warn:
					'Il y a plusieurs classes d''entites spatiales composees !'].
	^self
		setTheEntity: self class compoundSpatialClasses first
		with: aSet
]

{ #category : #'accessing - entities' }
CMAbstractModel >> theESE [
	"Purpose: Returns the collection of SpatialEntityElements (equivalent to theCells in case your model ESE class is named Cell)"
	
	^self theEntities: self class cellClass
]

{ #category : #'accessing - entities' }
CMAbstractModel >> theESE: aSet [
	
	^self
		setTheEntity: self class cellClass
		with: aSet
]

{ #category : #'accessing - entities' }
CMAbstractModel >> theEntities: aClass [
	"Returns a indexedSet of all the instances of aClass collected by cormasModel."
	
	| collec getter |
	aClass isAbstract ifTrue: [^OrderedCollection new].
	getter := self getterForEntityClass: aClass.
	collec := self perform: getter.	"If theXXXs method does not return an Indexedset, theXXXs is dynamically rebuilt as :
	theXXXs
		^theXXXs ifNil:[theXXXs := IndexedSet new]"
	collec
		ifNil:
			[self class createReaderAccessor: aClass.
			collec := self perform: getter].
	^collec
]

{ #category : #deprecated }
CMAbstractModel >> theEntity: aClass with: aSet [
	
	^self setTheEntity: aClass with: aSet
]

{ #category : #scheduling }
CMAbstractModel >> timeChanged [
	"the time has changed (time step). Method is called whenever a modification of #timeStepValue.
	Propagate the new time to the class (to be easily accessible from the agents: #currentTime) and all dependents"

	| newTime |
	newTime := self timeStep.
	self simWindow ifNotNil: [ :sw | sw newCurrentStepValue: newTime ].
	self announceTimeChange.
	self flag: #toClean.
	"self changed: #timeChanged with: newTime."
	"newTime = 0 ifTrue: [^self simManager setButtonsForTime0].
	newTime = 1 ifTrue: [^self simManager setButtonsForTime1]"
]

{ #category : #'+ accessing - scheduling' }
CMAbstractModel >> timeStep [
	"Purpose: returns the current time step of the simulation
	Example: self timeStep = 2 ifTrue:[self doSomething]"

	^ timeStep
]

{ #category : #scheduling }
CMAbstractModel >> timeStep: anInteger [
	timeStep := anInteger.
	self timeChanged
]

{ #category : #scheduling }
CMAbstractModel >> timeStepValue [
	self
		deprecated:
			'timeStepValue is deprecated. If you want to get the timeStep value, use timeStep. If you want to subscribe to the change of timeStep, use whenTimeStepChangedDo:.'.
	^ self shouldNotImplement
]

{ #category : #scheduling }
CMAbstractModel >> timeStepValue: anInteger [
	self
		deprecated: 'timeStepValue: is deprecated. Use timeStep: to set the timeStep.'.
	self timeStep: anInteger
]

{ #category : #'+ user interface' }
CMAbstractModel >> timeStepWithUnit [
	"return a String describing the current time + the time unit name.
the modelers may redefine timeUnitName.
Ex: 
timeUnitName
	^'days'     "
	
	^self timeStep printString , ' ' , self timeUnitName
]

{ #category : #'+ user interface' }
CMAbstractModel >> timeUnitName [
	"return a String describing the time unit name.
 the modelers may redefine it.
Ex: 
timeUnitName
	^'days'     "
	
	^'steps'
]

{ #category : #deprecated }
CMAbstractModel >> update: aCollec with: newCollec [
	"DEPRECATED. You should rather use newAndCollect to create and collect new entities"
	
	| theDeadAgents |
	theDeadAgents := aCollec select: [:a | a dead].
	theDeadAgents
		do:
			[:a | 
			(self class occupantClasses includes: a class) ifTrue: [a leave].
			aCollec remove: a].
	aCollec addAll: newCollec
]

{ #category : #deprecated }
CMAbstractModel >> updateAgents [
	"DEPRECATED"
	
	self updateEntities
]

{ #category : #'probes - charts' }
CMAbstractModel >> updateCharts: t [
	
	self
		updateGlobalCharts: t;
		updateLocalCharts: t
]

{ #category : #deprecated }
CMAbstractModel >> updateData: t [
	"DEPRECATED. Do nothing anymore"
	"self updateGlobalData;
		updateLocalData: t"
	
	
]

{ #category : #'probes - recording' }
CMAbstractModel >> updateDataForChart [
	"Update the global and local data and refresh the charts"
	
	self
		updateGlobalData;
		updateLocalData.
	self announceProbesDataUpdated
]

{ #category : #deprecated }
CMAbstractModel >> updateDataForChart: t [
	
	self
		updateGlobalData;
		updateLocalData.
	self cormas refreshCharts
]

{ #category : #'+ update' }
CMAbstractModel >> updateEntities [
	"Purpose: removes all the dead or destroyed intances from all theXXXs collections and adds the new entities stored into collector"
	
	self collector entities
		keysAndValuesDo:
			[:class :collec | (self theEntities: class) addAll: collec].
	self collector empty.	"removes all the dead or destroyed intances"
	self removeDestroyedEntities
]

{ #category : #'+ update' }
CMAbstractModel >> updateEntities: aClass [
	"Purpose: removes all the dead or destroyed intances from theClasss collection and adds the new entities stored into collector"
	
	(self theEntities: aClass) addAll: (self collector entitiesAt: aClass).
	self collector empty: aClass.	"removes all the dead or destroyed intances"
	self removeDeadEntities: aClass
]

{ #category : #'utilities - files' }
CMAbstractModel >> updateFile: aStringOrFilename dataCollection: aCollec separator: aChar [
	"Updates a file in the current model 'data' directory and writes in it a tupple separated by aChar, at the end of the previous data.
	ex: self updateFile: 'aFile.txt' dataCollection: #(0 11 67) separator: ';'."
	
	| stream aFilename |
	aFilename := self stringToFilename: aStringOrFilename.
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
CMAbstractModel >> updateFullPathFile: aFilename dataCollection: aCollec separator: aChar [
	"Deprecated. Should use :"
	
	self updateFile: aFilename dataCollection: aCollec separator: aChar
]

{ #category : #'probes - charts' }
CMAbstractModel >> updateGlobalCharts: t [
	
	self globalCharts
		do:
			[:s | (self perform: s) add: (self perform: (s asString , 'Data') asSymbol)]
]

{ #category : #'probes - recording' }
CMAbstractModel >> updateGlobalData [
	
	(self data includesKey: self class name)
		ifTrue:
			[(self data at: self class name)
				keysAndValuesDo: [:name :list | list add: (self perform: name)]]
]

{ #category : #'probes - charts' }
CMAbstractModel >> updateLocalCharts: t [
	| classAndSelector res collec className selector |
	self localCharts
		do: [ :s | 
			classAndSelector := self perform: (s asString , 'Data') asSymbol.
			className := classAndSelector first.
			selector := classAndSelector last.
			res := OrderedCollection new.
			(self perform: (self getterForEntityClass: className))
				do:
					[ :c | res add: (Array with: (c perform: selector) with: c id) ].
			res
				do: [ :x | 
					((self perform: s) keys includes: x last)
						ifFalse: [ collec := OrderedCollection new.
							t timesRepeat: [ collec add: 0 ] ]
						ifTrue: [ collec := (self perform: s) at: x last ].
					collec add: x first.
					(self perform: s) at: x last put: collec ] ]
]

{ #category : #'probes - recording' }
CMAbstractModel >> updateLocalData [
	
	| res collec className aValue |
	self class allEntityClasses
		do:
			[:cl | 
			className := cl name.
			(self data includesKey: className)
				ifTrue:
					[(self data at: className)
						keysAndValuesDo:
							[:name :dict | 
							res := OrderedCollection new.
							(self perform: (self getterForEntityClass: cl))
								do:
									[:c | 
									aValue := c perform: name.
									aValue isSymbol
										ifTrue:
											["The local probe is a reference to a global probe"
											aValue := self lastValueOfGlobalDataNamed: name].
									res
										add:
											(Array
												with: aValue
												with: c id)].
							res
								do:
									[:x | 
									(dict keys includes: x last)
										ifFalse:
											[collec := OrderedCollection new.
											self timeStep timesRepeat: [collec add: 0]]
										ifTrue: [collec := dict at: x last].
									collec add: x first.
									dict
										at: x last
										put: collec]]]]
]

{ #category : #ODBC }
CMAbstractModel >> updateTable: aTable withValues: anArrayOfValues [
	
	self simManager updateTable: aTable withValues: anArrayOfValues
]

{ #category : #'+ accessing - entities' }
CMAbstractModel >> upperLeftCell [
	"Purpose: returns the cell located at the upper left location of the spatial grid"

	^ self spaceModel upperLeftLocation
]

{ #category : #'+ utilities - population metrics' }
CMAbstractModel >> upperQuartileOfAttribute: att of: aCollecOrClass [
	"Purpose: returns the upper quartile of the values of an attribute for a collection of entities (aCollecOrClass)
Argument: aCollecOrClass can be a collection of entities or the name of class, in which case all the entities of that class (including subclasses entities) will be included in the collection
Examples: self upperQuartileOfAttribute: #age of: Person
			 self upperQuartileOfAttribute: #age of: (self theBirds)"
	
	^Cormas
		upperQuartile:
			((self allTheEntitiesOfClassOrCollec: aCollecOrClass) asOrderedCollection
				collect: [:e | e perform: att])
]

{ #category : #'+ accessing - entities' }
CMAbstractModel >> upperRightCell [
	"Purpose: return the cell located at the upper right location of the spatial grid"

	^ self spaceModel upperRightLocation
]

{ #category : #'+ utilities - population metrics' }
CMAbstractModel >> varianceOfAttribute: att of: aCollecOrClass [
	"Purpose: returns the variance of an attribute for a collection of entities (aCollecOrClass)
Argument: aCollecOrClass can be a collection of entities or the name of class, in which case all the entities of that class (including subclasses entities) will be included in the collection
Examples: self varianceOfAttribute: #age of: Person
			 self varianceOfAttribute: #age of: (self theBirds)"
	
	^Cormas
		variance:
			((self allTheEntitiesOfClassOrCollec: aCollecOrClass) asOrderedCollection
				collect: [:e | e perform: att])
]

{ #category : #'+ utilities - space metrics' }
CMAbstractModel >> wayFromCell: cell1 toCell: cell2 [
	"Purpose: return a collection of cells from cell1 to cell2 (including cell1 and cell2)"
	
	^self spaceModel wayFromCell: cell1 toCell: cell2
]

{ #category : #scheduling }
CMAbstractModel >> whenTimeStepChangedDo: aBlock [
	self announcer when: CMTimeChangedAnnouncement do: aBlock
]

{ #category : #scheduling }
CMAbstractModel >> whenTimeStepChangedSend: aSymbol to: anObject [
	self announcer
		when: CMTimeChangedAnnouncement
		send: aSymbol
		to: anObject
]
