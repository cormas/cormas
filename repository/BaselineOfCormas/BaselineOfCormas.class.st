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
				specForPackages: spec ].

	self 
		specForPharo8: spec;
		specForPharo9: spec.

]

{ #category : #doits }
BaselineOfCormas >> closePharoWelcomeWindow [
	" Pharo 6.x version "

	World submorphs
		select: [ :sm | self isWelcomeWindow: sm ]
		thenDo: [ :window | window delete ]
]

{ #category : #doits }
BaselineOfCormas >> findCurrentOwner [
	" Answer a <String> with the name of the current CORMAS repository 'owner', this is the username from where the current image clone of cormas was installed. If no registry entries are detected, defaults to the cormas repository name "

	^ IceRepository registry 
			detect: [ :each | each name asLowercase = 'cormas' ]
			ifFound: [ : found | found origin owner ]
			ifNone: [ 'hernanmd' ]
]

{ #category : #doits }
BaselineOfCormas >> isWelcomeWindow: sm [
	" Answer <true> if sm matches the Pharo Welcome window "

	^ sm isSystemWindow and: [ sm label endsWith: 'Welcome' ]
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
BaselineOfCormas >> platformAssetsUrls [
	" Answer a <Collection> of <String> representing each one an asset base URL "
	
	^ {
		('https://github.com/' , self findCurrentOwner , '/cormas/raw/master/resources/')
		}
]

{ #category : #doits }
BaselineOfCormas >> postLoad [
	" Private - Execute post install actions "

	self closePharoWelcomeWindow.
	(Smalltalk at: #PFProjectApplication) applicationClass: (Smalltalk at: #CMApplicationProject).
	self loadBgImage.	
	(Smalltalk at: #FDMorphicUIManager) new beDefault.
	ShortcutReminder enabled: false.
	TaskbarMorph showTaskbar: true.
	" https://github.com/cormas/cormas/issues/511
	
	MenubarMorph showMenubar: false."
	
	self unloadPackages.
	"self openPlaygroundWindow."

	" https://github.com/ObjectProfile/Roassal3/issues/408 
	https://github.com/ObjectProfile/Roassal3/issues/413
	"
	RSWorldMenu loadFullVersion.
	
	" Build user projects and un-load models from the image "
	(Smalltalk at: #CMApplicationProject) cormasRepository 
		ifNotNil: [ (Smalltalk at: #CMProjectBuilder) buildProjectDemos ].

]

{ #category : #doits }
BaselineOfCormas >> preLoadForPharo8 [
	" Private - Execute post install actions "

	Smalltalk tools debugger filterCommonMessageSends: true.
	PharoLightTheme beCurrent
]

{ #category : #doits }
BaselineOfCormas >> preLoadForPharo9 [
	" Private - Execute post install actions "

	"Smalltalk tools debugger filterCommonMessageSends: true."
	PharoLightTheme beCurrent.
	RSUMLCalypsoSettings useCalypsoUML: false.
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
		with: [ spec repository: 'github://hernanmd/file-dialog/repository' ];

		baseline: 'ProjectFramework'
		with: [ spec repository: 'github://hernanmd/ProjectFramework/repository' ];
				
		baseline: 'SpecUIAddOns'
		with: [ spec repository: 'github://hernanmd/SpecUIAddOns/repository' ];
		
		baseline: 'CodeGenerator'
		with: [ spec repository: 'github://hernanmd/CodeGenerator/repository' ];

		baseline: 'PolyMath'
		with: [ spec repository: 'github://PolyMathOrg/PolyMath:v1.0.3';	loads: #('Core') ];

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
			'PolyMath' 
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
BaselineOfCormas >> specForPharo8: spec [

	spec
		for: #'pharo8.x'
		do: [ 
			spec preLoadDoIt: #preLoadForPharo8.
			spec
				baseline: 'Tabular' 	with: [ spec repository: 'github://VincentBlondeau/Tabular' ];
				baseline: 'Roassal2' 	with: [ spec repository: 'github://ObjectProfile/Roassal2' ];

				package: 'Cormas-UI' with: [ spec requires: #('Cormas-Core' 'SpecUIAddOns' 'FileDialog' 'ProjectFramework' 'CodeGenerator') ];
				package: 'Cormas-UI-Tests' with: [ spec requires: #('Cormas-Tests' 'Cormas-UI') ];
				package: 'Cormas-UI-Roassal2' with: [ spec requires: #('Cormas-Core' 'Cormas-UI' 'Roassal2') ];
				package: 'Cormas-UI-Roassal2-Tests' with: [ spec requires: #('Cormas-Tests' 'ProjectFramework' 'Cormas-Core' 'Cormas-UI' 'Cormas-UI-Roassal2') ];
				
				package: 'Cormas-Model-Conway-Roassal2' with: [ spec requires: #('Cormas-Model-Conway' 'Cormas-UI-Roassal2') ];
				package: 'Cormas-Model-Diffuse-Roassal2'  with: [ spec requires: #('Cormas-Model-Diffuse' 'Cormas-UI-Roassal2') ];
				package: 'Cormas-Model-ECEC-Roassal2' with: [ spec requires: #('Cormas-Model-ECEC' 'Cormas-UI-Roassal2') ];
				package: 'Cormas-Model-FireAutomata-Roassal2' with: [ spec requires: #('Cormas-Model-FireAutomata' 'Cormas-UI-Roassal2') ];
				package: 'Cormas-Model-Stupid-Roassal2' with: [ spec requires: #('Roassal2' 'Cormas-Model-Stupid' 'Cormas-UI-Roassal2') ].

			self specForPharo8Groups: spec ]
]

{ #category : #specs }
BaselineOfCormas >> specForPharo8Groups: spec [

	spec
		group: 'Core' 		with: #('Cormas-Core');
		group: 'UI' 			with: #(#'Cormas-UI' 'Core');

		group: 'Tests' 		with: #('Core' 'Cormas-Mocks' 'Cormas-Tests' 'Cormas-UI-Tests');

		group: 'Models' 	with: 	#(
						'Cormas-Model-Conway' 
						'Cormas-Model-ReHab' 
						'Cormas-Core' 
						'Cormas-Model-ECEC' 
						'Cormas-Model-FireAutomata' 
						'Cormas-Model-PlotsRental' 
						'Cormas-Model-Diffuse' 
						'Cormas-Model-DemoAggregates' 
						'Cormas-Model-Stupid');
		group: 'OpenMole'	with: #('Cormas-OpenMole' 'Core');

		group: 'All'			with: #('UI' 'Tests' 'Core' 'Models' 'OpenMole');
		group: 'default' 	with: #('All')	
]

{ #category : #specs }
BaselineOfCormas >> specForPharo9: spec [

	spec
		for: #('pharo9.x')
		do: [ 
			spec preLoadDoIt: #preLoadForPharo9.
			spec
				baseline: 'Tabular' 							with: [ spec repository: 'github://VincentBlondeau/Tabular' ];
				baseline: 'ClassEditor'						with: [ spec repository: 'github://hernanmd/class-editor/repository'; loads: 'complete' ];
				baseline: 'Roassal3' 							with: [ spec repository: 'github://ObjectProfile/Roassal3' ];
				baseline: 'Roassal3Exporters' 				with: [ spec repository: 'github://ObjectProfile/Roassal3Exporters' ];
				baseline: 'UrucuNavigator' 					with: [ spec repository: 'github://tinchodias/pharo-urucu-navigator' ];

				package: 'Cormas-UI'							with: [ spec requires: #('Cormas-Core' 'ClassEditor' 'SpecUIAddOns' 'FileDialog' 'ProjectFramework' 'CodeGenerator' 'UrucuNavigator') ];
				package: 'Cormas-UI-Tests' 					with: [ spec requires: #('Cormas-Tests' 'Cormas-UI' 'Cormas-Mocks') ];
				package: 'Cormas-UI-Roassal3' 				with: [ spec requires: #('Cormas-UI' 'Roassal3' 'Roassal3Exporters') ].
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

{ #category : #specs }
BaselineOfCormas >> specForPharoX: spec [

	spec
		for: #('pharo10.x')
		do: [ 
			spec preLoadDoIt: #preLoadForPharo9.
			spec
				baseline: 'Tabular' 							with: [ spec repository: 'github://VincentBlondeau/Tabular' ];
				"baseline: 'ClassEditor'						with: [ spec repository: 'github://hernanmd/class-editor/repository'; loads: 'complete' ];"
				baseline: 'Roassal3' 							with: [ spec repository: 'github://ObjectProfile/Roassal3' ];
				baseline: 'Roassal3Exporters' 				with: [ spec repository: 'github://ObjectProfile/Roassal3Exporters' ];
				baseline: 'UrucuNavigator' 					with: [ spec repository: 'github://tinchodias/pharo-urucu-navigator' ];

				package: 'Cormas-UI'							with: [ spec requires: #('Cormas-Core' 'ClassEditor' 'SpecUIAddOns' 'FileDialog' 'ProjectFramework' 'CodeGenerator' 'UrucuNavigator') ];
				package: 'Cormas-UI-Tests' 					with: [ spec requires: #('Cormas-Tests' 'Cormas-UI' 'Cormas-Mocks') ];
				package: 'Cormas-UI-Roassal3' 				with: [ spec requires: #('Cormas-UI' 'Roassal3' 'Roassal3Exporters') ].
				"package: 'Cormas-Model-ECEC-Roassal3' 	with: [ spec requires: #('Cormas-Model-ECEC' 'Roassal3' 'Cormas-UI-Roassal3') ]"
			self specForPharoXGroups: spec. ]
]

{ #category : #specs }
BaselineOfCormas >> specForPharoXGroups: spec [

	spec
		group: 'Core' 		with: #('Cormas-Core');
		group: 'UI' 			with: #(#'Cormas-UI' 'Core' 'Cormas-UI-Roassal3');

		group: 'Tests' 		with: #('Core' 'Cormas-Mocks' 'Cormas-Tests' 'Cormas-UI-Tests');

		group: 'OpenMole'	with: #('Cormas-OpenMole' 'Core');

		group: 'All'			with: #('UI' 'Tests' 'Core' 'OpenMole');
		group: 'default' 	with: #('All')	
]

{ #category : #doits }
BaselineOfCormas >> unloadPackages [

	(RPackageOrganizer default packageNames select: [ :each | each endsWith: '-Help' ]) do: [ :each | (MCPackage named: each) unload ].
	(MCPackage named: 'MonticelloMocks') unload.	
	(MCPackage named: 'ToolsTest') unload.	
	(MCPackage named: 'Announcements-Tests-Core') unload.	
	(MCPackage named: 'AST-Tests-Core') unload.	
	(MCPackage named: 'AST-Interpreter-Test') unload.	
	(MCPackage named: 'Ring-Tests-Containers') unload.	
	(MCPackage named: 'Ring-Tests-Kernel') unload.	
	(MCPackage named: 'Ring-Tests-Monticello') unload.	
	(MCPackage named: 'Regex-Tests-Core') unload.	
	(MCPackage named: 'Refactoring-Tests-Changes') unload.	
	(MCPackage named: 'Refactoring-Tests-Core') unload.	
	(MCPackage named: 'Refactoring-Tests-Critics') unload.	
	(MCPackage named: 'Refactoring-Tests-Environment') unload.	
	(MCPackage named: 'FileSystem-Tests-Core') unload.	
	(MCPackage named: 'FileSystem-Tests-Disk') unload.	
	(MCPackage named: 'FileSystem-Tests-Memory') unload.		
	
	(MCPackage named: 'GT-Tests-Inspector') unload.		
	(MCPackage named: 'Glamour-Tests-Core') unload.		
	(MCPackage named: 'Glamour-Tests-Morphic') unload.		
	(MCPackage named: 'Glamour-Tests-Resources') unload.		
	(MCPackage named: 'Glamour-Tests-Rubric') unload.	
			
	(MCPackage named: 'Versionner-Tests-Core-Commands') unload.	
	(MCPackage named: 'Versionner-Tests-Core-DependenciesModel') unload.	
	(MCPackage named: 'Versionner-Tests-Core-Model') unload.			
	(MCPackage named: 'Versionner-Tests-Resources') unload.		
	
]
