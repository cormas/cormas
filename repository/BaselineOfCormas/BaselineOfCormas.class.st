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

	spec for: #'pharo11.x' do: [ spec package: 'Cormas-Pharo11' ].
	
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
	
	self loadBackgroundImage.
]

{ #category : #doits }
BaselineOfCormas >> preLoad [

	PharoLightTheme beCurrent.
]

{ #category : #specs }
BaselineOfCormas >> specForBaselines: spec [

	spec
		baseline: 'MathRandomNumbers'
		with: [ spec repository: 'github://PolyMathOrg/random-numbers:v1.x.x/src' ];

		baseline: 'GitBridge'
		with: [ spec repository: 'github://jecisc/GitBridge/src' ].

]

{ #category : #specs }
BaselineOfCormas >> specForGroups: spec [

	spec
		group: 'Core' with: #('Cormas-Tests');
		group: 'UI' with: #('Cormas-UI-Tests');
		group: 'default' with: #('UI')
]

{ #category : #specs }
BaselineOfCormas >> specForPackages: spec [

	spec
		package: 'Cormas-Core'
		with: [ spec requires: #('MathRandomNumbers' 'GitBridge') ];
		
		package: 'Cormas-Mocks'
		with: [ spec requires: #('Cormas-Core') ];
		
		package: 'Cormas-Tests'
		with: [ spec requires: #('Cormas-Core' 'Cormas-Mocks') ];
		
		package: 'Cormas-UI-Roassal3';
		
		package: 'Cormas-UI-Translator';
		package: 'Cormas-UI' with: [ spec requires: #('Cormas-Core' 'Cormas-UI-Roassal3' 'Cormas-UI-Translator') ];
		
		package: 'Cormas-UI-Tests'
		with: [ spec requires: #('Cormas-UI' 'Cormas-Tests') ].
]
