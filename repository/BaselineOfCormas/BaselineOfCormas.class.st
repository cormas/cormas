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
	spec for: #common do: [ 
		
		spec preLoadDoIt: #preLoad.
		spec postLoadDoIt: #postLoad.
		
		self 
			specForBaselines: spec;
			specForPackages: spec;
			specForGroups: spec ].

]

{ #category : #doits }
BaselineOfCormas >> loadBackgroundImage [
	"Load Cormas logo as background image"

	(CMGitBridge imagesPath / 'CormasLogoFull.png') ifExists: [ :file |
		PolymorphSystemSettings desktopLogoFileName: file fullName ].
]

{ #category : #doits }
BaselineOfCormas >> postLoad [
	
	PFProjectApplication applicationClass: CMApplicationProject.
	
	self class environment at: #CMSpApplication ifPresent: [ 
		self loadBackgroundImage ].	
		
	FDMorphicUIManager new beDefault.
	ShortcutReminder enabled: false.
	TaskbarMorph showTaskbar: true.

]

{ #category : #doits }
BaselineOfCormas >> preLoad [

	PharoLightTheme beCurrent.
]

{ #category : #specs }
BaselineOfCormas >> specForBaselines: spec [

	spec
		baseline: 'CollectionExtensions'
		with: [ spec loads: 'Core'; repository: 'github://pharo-contributions/CollectionExtensions:v1.x.x/src' ];

		baseline: 'SMark'
		with: [ spec repository: 'github://smarr/SMark:v1.0.4' ];	
	
		baseline: 'PetitParser'
		with: [ spec repository: 'github://moosetechnology/PetitParser/src'; loads: #('YAML') ];
			
		baseline: 'FileDialog'
		with: [ spec repository: 'github://peteruhnak/file-dialog:v1.x/repository' ];

		baseline: 'ProjectFramework'
		with: [ spec repository: 'github://cormas/ProjectFramework/repository' ];
		
		baseline: 'CodeGenerator'
		with: [ spec repository: 'github://cormas/CodeGenerator' ];
		
		baseline: 'PharoCodeGenerator'
		with: [ spec repository: 'github://juliendelplanque/PharoCodeGenerator' ];

		baseline: 'MathRandomNumbers'
		with: [ spec repository: 'github://PolyMathOrg/random-numbers:v1.x.x/src' ];

		baseline: 'GitBridge'
		with: [ spec repository: 'github://jecisc/GitBridge/src' ];

		baseline: 'ESRIASCIIRaster'
		with: [ spec repository: 'github://pharo-GIS/ESRI-ASCII-Raster/' ];
		
		baseline: 'Tabular'
		with: [ spec repository: 'github://VincentBlondeau/Tabular' ];
		
		baseline: 'Roassal3'
		with: [ spec loads: #('Full'); repository: 'github://ObjectProfile/Roassal3:v0.9.9m' ];
		
		baseline: 'Roassal3Exporters'
		with: [ spec repository: 'github://ObjectProfile/Roassal3Exporters' ];
		
		baseline: 'UrucuNavigator'
		with: [ spec repository: 'github://tinchodias/pharo-urucu-navigator' ];
		
		baseline: 'SingularizePluralize'
		with: [ spec repository: 'github://pharo-contributions/SingularizePluralize:v1.1' ].

]

{ #category : #specs }
BaselineOfCormas >> specForGroups: spec [

	spec
		group: 'Core' with: #('Cormas-Core' 'Cormas-Tests' 'Cormas-Mocks' 'Cormas-Deprecated');
		group: 'UI' with: #('Core' 'Cormas-UI' 'Cormas-UI-Roassal3' 'Cormas-UI-Tests' 'Cormas-UI-Deprecated');
		group: 'default' with: #('UI')
]

{ #category : #specs }
BaselineOfCormas >> specForPackages: spec [

	spec
		package: 'Cormas-Core'
		with: [ spec requires: #(
			'MathRandomNumbers' 'PetitParser' 'GitBridge' 'ESRIASCIIRaster' 'SMark'
			'CodeGenerator' 'PharoCodeGenerator' 'ProjectFramework' 'CollectionExtensions'
			'SingularizePluralize') ];
		
		package: 'Cormas-Deprecated'
		with: [ spec requires: #('Cormas-Core') ];
		
		package: 'Cormas-Mocks'
		with: [ spec requires: #('Cormas-Core') ];
		
		package: 'Cormas-Tests'
		with: [ spec requires: #('Cormas-Core' 'Cormas-Mocks') ];
		
		package: 'Cormas-UI'
		with: [ spec requires: #(
			'Cormas-Core' 'FileDialog' 'ProjectFramework'
			'CodeGenerator' 'UrucuNavigator') ];
		
		package: 'Cormas-UI-Roassal3'
		with: [ spec requires: #('Cormas-UI' 'Roassal3' 'Roassal3Exporters') ];
		
		package: 'Cormas-UI-Deprecated'
		with: [ spec requires: #('Cormas-Core' 'Cormas-UI' 'Cormas-UI-Roassal3') ];
		
		package: 'Cormas-UI-Tests'
		with: [ spec requires: #('Cormas-Tests' 'Cormas-UI' 'Cormas-Mocks') ].
]
