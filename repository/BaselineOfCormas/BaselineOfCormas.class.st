"
3+09:00 Cormas.image priorSource: 100
"
Class {
	#name : #BaselineOfCormas,
	#superclass : #BaselineOf,
	#classVars : [
		'LastVersionLoad'
	],
	#category : #BaselineOfCormas
}

{ #category : #baselines }
BaselineOfCormas >> baseline: spec [
	<baseline>
	spec
		for: #common do: [ 
			spec blessing: #baseline.
			spec postLoadDoIt: #postLoad.
			self 
				specForBaselines: spec;
				specForPackages: spec ]
]

{ #category : #doits }
BaselineOfCormas >> loadBgImage [
	" Load background CORMAS image "

	| logoFileref app |
	app := (Smalltalk at: #PFProjectApplication) applicationClass uniqueInstance.
	logoFileref := app resourceLocator imagesPath / 'CormasLogoFull.png'.
	logoFileref exists
		ifTrue: [ 
			[ PolymorphSystemSettings desktopLogoFileName: logoFileref fullName ]
			on: NotFound 
			do: [ : ex | ] ]
]

{ #category : #doits }
BaselineOfCormas >> postLoad [
	" Private - Execute post install actions "

	(Smalltalk at: #PFProjectApplication) applicationClass: (Smalltalk at: #CMApplicationProject).
	self loadBgImage.	
	FDMorphicUIManager new beDefault.
	ShortcutReminder enabled: false.
	TaskbarMorph showTaskbar: true.
	" https://github.com/cormas/cormas/issues/511
	
	MenubarMorph showMenubar: false."
	"self openPlaygroundWindow."
	
	" Build user projects and un-load models from the image "
	CMApplicationProject cormasRepository 
		ifNotNil: [ CMProjectBuilder buildProjectDemos ].

]

{ #category : #specs }
BaselineOfCormas >> specForBaselines: spec [

	spec
		baseline: 'CollectionExtensions'
		with: [ spec loads: 'Core'; repository: 'github://pharo-contributions/CollectionExtensions:v1.x.x/src' ];

		baseline: 'SMark'
		with: [ spec repository: 'github://smarr/SMark:v1.0.4' ];	

		baseline: 'NeoJSON' 	
		with: [ spec repository: 'github://svenvc/NeoJSON/repository' ];
	
		baseline: 'PetitParser'
		with: [ spec repository: 'github://moosetechnology/PetitParser/src'; loads: #('YAML') ];
			
		baseline: 'FileDialog'
		with: [ spec repository: 'github://peteruhnak/file-dialog:v1.x/repository' ];

		baseline: 'ProjectFramework'
		with: [ spec repository: 'github://hernanmd/ProjectFramework/repository' ];
				
		"baseline: 'SpecUIAddOns'
		with: [ spec repository: 'github://hernanmd/SpecUIAddOns/repository' ];"
		
		baseline: 'CodeGenerator'
		with: [ spec repository: 'github://hernanmd/CodeGenerator/repository' ];

		baseline: 'MathRandomNumbers'
		with: [ spec repository: 'github://PolyMathOrg/random-numbers:v1.x.x/src' ];

		baseline: 'GitBridge'
		with: [ spec repository: 'github://jecisc/GitBridge/src' ];

		baseline: 'ESRIASCIIRaster'
		with: [ spec repository: 'github://pharo-GIS/ESRI-ASCII-Raster/' ].

]

{ #category : #specs }
BaselineOfCormas >> specForPackages: spec [
	" Private - Do not load the models in the image. Use the Open Project from the main UI instead "

	spec
		package: 'Cormas-Core' with: [ self specForPackagesInCore: spec ];
"		package: 'Cormas-Model-Conway' with: [ spec requires: #('Cormas-Core') ];
		package: 'Cormas-Model-Conway-Tests' with: [ spec requires: #('Cormas-Model-Conway') ];	
		package: 'Cormas-Model-DemoAggregates'  with: [ spec requires: #('Cormas-Core') ];
		package: 'Cormas-Model-Diffuse'  with: [ spec requires: #('Cormas-Core') ];
		package: 'Cormas-Model-ECEC' with: [ spec requires: #('Cormas-Core') ];
		package: 'Cormas-Model-FireAutomata' with: [ spec requires: #('Cormas-Core' 'Cormas-Tests') ];
		package: 'Cormas-Model-PlotsRental' with: [ spec requires: #('Cormas-Core') ];
		package: 'Cormas-Model-ReHab' with: [ spec requires: #('Cormas-Core') ];
		package: 'Cormas-Model-Stupid' with: [ spec requires: #('Cormas-Core') ];"
		package: 'Cormas-Mocks' with: [ spec requires: #('Cormas-Core') ];
		package: 'Cormas-Tests' with: [ spec requires: #('Cormas-Core' 'Cormas-Mocks') ];
		package: 'Cormas-OpenMole' with: [ spec requires: #('Cormas-Core' 'NeoJSON') ]
]

{ #category : #specs }
BaselineOfCormas >> specForPackagesInCore: spec [

	spec requires: #(
			" Required by ???? "
			'MathRandomNumbers' 
			" Required by YAML "
			'PetitParser' 
			" Required by ??? "
			'GitBridge' 
			" Required by ??? "
			'ESRIASCIIRaster' 
			" Required SubunitRunner to run tests without the TestRunner UI "
			'SMark'
			" Required by the Entity Browser "
			'CodeGenerator' 
			" Required for project management "
			'ProjectFramework'
			" Required some String methods "
			'CollectionExtensions' 
			)
]

{ #category : #specs }
BaselineOfCormas >> specForPharo9: spec [

	spec
		for: #('pharo9.x' 'pharo10.x')
		do: [ 
			spec
				baseline: 'Tabular' 							with: [ spec repository: 'github://VincentBlondeau/Tabular' ];
				baseline: 'ClassEditor'						with: [ spec repository: 'github://hernanmd/class-editor/repository'; loads: 'complete' ];
				baseline: 'UrucuNavigator' 					with: [ spec repository: 'github://tinchodias/pharo-urucu-navigator' ];

				package: 'Cormas-UI'							with: [ spec requires: #('Cormas-Core' 'ClassEditor' 'SpecUIAddOns' 'FileDialog' 'ProjectFramework' 'CodeGenerator' 'UrucuNavigator') ];
				package: 'Cormas-UI-Tests' 					with: [ spec requires: #('Cormas-Tests' 'Cormas-UI' 'Cormas-Mocks') ].
				"package: 'Cormas-Model-ECEC-Roassal3' 	with: [ spec requires: #('Cormas-Model-ECEC' 'Roassal3' 'Cormas-UI-Roassal3') ]"
			self specForPharo9Groups: spec. ]
]

{ #category : #specs }
BaselineOfCormas >> specForPharo9Groups: spec [

	spec
		group: 'Core' 		with: #('Cormas-Core');
		group: 'UI' 			with: #(#'Cormas-UI' 'Core' 'Cormas-UI-Roassal3');

		group: 'Tests' 		with: #('Core' 'Cormas-Mocks' 'Cormas-Tests' 'Cormas-UI-Tests');

		group: 'OpenMole'	with: #('Cormas-OpenMole' 'Core');

		group: 'All'			with: #('UI' 'Tests' 'Core' 'OpenMole');
		group: 'default' 	with: #('All')	
]
