"
Baseline of project CORMAS: https://github.com/cormas/cormas

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
		for: #common
			do: [ spec blessing: #baseline.
			spec postLoadDoIt: #postLoad.
			spec
				baseline: 'PetitParser'
					with: [ spec
						repository: 'github://moosetechnology/PetitParser/src';
						loads: #('YAML') ];
				baseline: 'FileDialog'
					with: [ spec repository: 'github://peteruhnak/file-dialog/repository' ];
				baseline: 'ProjectFramework'
					with: [ spec
						repository: 'github://hernanmd/ProjectFramework/repository' ];
				baseline: 'CodeGenerator'
					with: [ spec repository: 'github://hernanmd/CodeGenerator/repository' ];
				baseline: 'Roassal2'
					with: [ spec repository: 'github://ObjectProfile/Roassal2/src' ];
				baseline: 'NeoCSV'
					with: [ spec repository: 'github://svenvc/NeoCSV/repository' ];
				baseline: 'PolyMath'
					with: [ spec repository: 'github://PolyMathOrg/PolyMath/src' ].
			spec
				package: 'Cormas-Core' with: [ spec requires: #('PolyMath') ];
				package: 'Cormas-Model-Conway';
				package: 'Cormas-Model-DemoAggregates';
				package: 'Cormas-Model-Diffuse';
				package: 'Cormas-Model-ECEC';
				package: 'Cormas-Model-FireAutomata';
				package: 'Cormas-Model-PlotsRental';
				package: 'Cormas-Model-ReHab';
				package: 'Cormas-Model-Stupid';
				package: 'Cormas-Tests' with: [ spec requires: #('Cormas-Core') ];
				package: 'Cormas-OpenMole'
					with: [ spec requires: #('Cormas-Core') ];
				package: 'Cormas-UI'
					with: [ spec
						requires: #('FileDialog' 'ProjectFramework' 'CodeGenerator' 'Roassal2') ];
				package: 'Cormas-UI-Tests'
					with: [ spec requires: #('Cormas-Tests' 'Cormas-UI') ];
				package: 'Cormas-VW-Ported'.
			spec
				group: 'Core' with: #('Cormas-Core');
				group: 'Tests' with: #('Core' 'Cormas-Tests' 'Cormas-UI-Tests');
				group: 'UI' with: #(#'Cormas-UI' 'Core') ];
		group: 'Models'
			with:
			#('Cormas-Model-Conway' 'Cormas-Model-ReHab' 'Cormas-Core' 'Cormas-Model-ECEC' 'Cormas-Model-FireAutomata' 'Cormas-Model-PlotsRental' 'Cormas-Model-Diffuse' 'Cormas-Model-DemoAggregates' 'Cormas-Model-Stupid');
		group: 'OpenMole' with: #('Cormas-OpenMole' 'Core');
		group: 'All'
			with: #('Cormas-VW-Ported' 'UI' 'Tests' 'Core' 'Models' 'OpenMole').
	spec
		for: #'pharo7.x'
		do: [ spec preLoadDoIt: #preLoadForPharo7.
			spec
				project: 'Tabular'
					with: [ spec
						className: #ConfigurationOfTabular;
						versionString: #development;
						repository: 'http://ss3.gemtalksystems.com/ss/Tabular' ];
				project: 'NeoJSON'
					with: [ spec
						className: 'ConfigurationOfNeoJSON';
						version: #stable;
						repository: 'http://smalltalkhub.com/mc/SvenVanCaekenberghe/Neo/main' ] ].
	spec
		for: #'pharo8.x'
		do: [ spec preLoadDoIt: #preLoadForPharo8.
			spec
				baseline: 'Tabular'
					with: [ spec repository: 'github://VincentBlondeau/Tabular' ];
				baseline: 'NeoJSON'
					with: [ spec repository: 'github://svenvc/NeoJSON/repository' ] ].
	"baseline: 'Roassal3'
					with: [ spec repository: 'github://ObjectProfile/Roassal3' ];"
	spec
		for: #'pharo9.x'
		do: [ spec preLoadDoIt: #preLoadForPharo9.
			spec
				baseline: 'Tabular'
					with: [ spec repository: 'github://VincentBlondeau/Tabular' ];
				baseline: 'NeoJSON'
					with: [ "baseline: 'Roassal3'
					with: [ spec repository: 'github://ObjectProfile/Roassal3' ];" spec repository: 'github://svenvc/NeoJSON' ] ]
]

{ #category : #doits }
BaselineOfCormas >> closePharoWelcomeWindow [
	" Pharo 6.x version "

	World submorphs
		select: [ :sm | self isWelcomeWindow: sm ]
		thenDo: [ :window | window delete ]
]

{ #category : #doits }
BaselineOfCormas >> cormasExpressions [
	" Answer a <String> with Smalltalk expressions "
	
	^ 'CMProjectModel allInstances isEmpty.
CMProjectManager allInstances.
CMSpecProjectWindow allInstances.

CMProjectModel allInstances first.
CMProjectManager allInstances first.
CMSpecProjectWindow allInstances first.

CMProjectModel allInstances first pointersTo.
CMProjectManager allInstances first pointersTo.
CMSpecProjectWindow allInstances first pointersTo.

CMSpecProjectWindow allInstances first projectAnnouncer subscriptions reset.
CMProjectManager allInstances first announcer subscriptions reset.

CMSpecProjectWindow allInstancesDo: [ : e | e becomeForward: nil ].
CMProjectManager allInstancesDo: [ : e | e becomeForward: nil ].
CMProjectModel allInstancesDo: [ : e | e becomeForward: nil ].
3 timesRepeat: [ Smalltalk garbageCollect ].
{ CMProjectModel allInstances.
CMProjectManager allInstances.
CMSpecProjectWindow allInstances } allSatisfy: #isEmpty.'

]

{ #category : #doits }
BaselineOfCormas >> ensureMetacelloFileDownload [
	Metacello new
		baseline: 'OSSubprocess';
		repository: 'github://pharo-contributions/OSSubprocess/repository';
		load.
	Metacello new
		baseline: 'MetacelloFileDownload';
		repository: 'github://hernanmd/MetacelloFileDownload';
		load
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
	app := (Smalltalk at: #PFProjectApplication) applicationClass
		uniqueInstance.
	logoFileref := app resourceLocator imagesPath / 'CormasLogoFull.png'.
	logoFileref exists
		ifTrue: [ PolymorphSystemSettings desktopLogoFileName: logoFileref fullName ]
]

{ #category : #doits }
BaselineOfCormas >> openPlaygroundWindow [

	(Workspace openLabel: 'CORMAS - Useful expressions')
		contents: self cormasExpressions.
]

{ #category : #doits }
BaselineOfCormas >> platformAssetsUrls [
	" Answer a <Collection> of <String> representing each one an asset base URL "
	
	^ {
		('https://github.com/' , self findCurrentOwner , '/cormas/raw/master/resources/')
		}
]

{ #category : #doits }
BaselineOfCormas >> platformFilesUrl [
	" Private - See superimplementor's comment "

	^ self platformAssetsUrls collect: [ :urlPath | 
			String streamContents: [ :stream | 
					stream
						nextPutAll: urlPath;
						nextPutAll: 'assets';
						nextPutAll:
							(Smalltalk os isWin32
								ifTrue: [ '.zip' ]
								ifFalse: [ '.tar.gz' ]) ] ]
]

{ #category : #doits }
BaselineOfCormas >> postLoad [
	" Private - Execute post install actions "

	self closePharoWelcomeWindow.
	(Smalltalk at: #PFProjectApplication) applicationClass: (Smalltalk at: #CMApplicationProject).
	self loadBgImage.	
	(Smalltalk at: #FDMorphicUIManager) new beDefault.
	"TaskbarMorph showTaskbar: false."
	self unloadPackages.
	self openPlaygroundWindow.
]

{ #category : #doits }
BaselineOfCormas >> preLoadConfigurationforPharo7 [

	Smalltalk tools debugger
		alwaysOpenFullDebugger: true;
		filterCommonMessageSends: true.
	PharoLightTheme beCurrent
]

{ #category : #doits }
BaselineOfCormas >> preLoadConfigurationforPharo8 [

	Smalltalk tools debugger
		filterCommonMessageSends: true.
	PharoLightTheme beCurrent
]

{ #category : #doits }
BaselineOfCormas >> preLoadConfigurationforPharo9 [

	Smalltalk tools debugger
		filterCommonMessageSends: true.
	PharoLightTheme beCurrent
]

{ #category : #doits }
BaselineOfCormas >> preLoadForPharo7 [
	" Private - Execute post install actions "

	self ensureMetacelloFileDownload.
	super preLoad.
	self preLoadConfigurationforPharo7 	

]

{ #category : #doits }
BaselineOfCormas >> preLoadForPharo8 [
	" Private - Execute post install actions "

	self ensureMetacelloFileDownload.
	super preLoad.
	self preLoadConfigurationforPharo8	

]

{ #category : #doits }
BaselineOfCormas >> preLoadForPharo9 [
	" Private - Execute post install actions "

	self ensureMetacelloFileDownload.
	super preLoad.
	self preLoadConfigurationforPharo9	

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
