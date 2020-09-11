"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	project:		<Object>


    Implementation Points
"
Class {
	#name : #ConfigurationOfCormas,
	#superclass : #Object,
	#instVars : [
		'project'
	],
	#classVars : [
		'LastVersionLoad'
	],
	#category : 'ConfigurationOfCormas'
}

{ #category : #'development support' }
ConfigurationOfCormas class >> DevelopmentSupport [

"See the methods in the 'development support' category on the class-side of MetacelloBaseConfiguration. Decide what development support methods you would like to use and copy them the the class-side of your configuration."
	<apiDocumentation>

]

{ #category : #private }
ConfigurationOfCormas class >> baseConfigurationClassIfAbsent: aBlock [

	^Smalltalk
		at: #MetacelloBaseConfiguration
		ifAbsent: [ 
			self ensureMetacelloBaseConfiguration.
			Smalltalk at: #MetacelloBaseConfiguration ifAbsent: aBlock ].

]

{ #category : #'metacello tool support' }
ConfigurationOfCormas class >> catalogContactInfo [
	^ 'Serge Stinckwich <serge.stinckwich@gmail.com>'
]

{ #category : #'metacello tool support' }
ConfigurationOfCormas class >> catalogDescription [
	^ 'CORMAS is an agent-based simulation framework. More info on: https://github.com/cormas/cormas'
]

{ #category : #'metacello tool support' }
ConfigurationOfCormas class >> catalogKeywords [
	^ #('simulation' 'agent' 'Roassal')
]

{ #category : #private }
ConfigurationOfCormas class >> ensureMetacello [

	(self baseConfigurationClassIfAbsent: []) ensureMetacello
]

{ #category : #private }
ConfigurationOfCormas class >> ensureMetacelloBaseConfiguration [

	Smalltalk
		at: #MetacelloBaseConfiguration
		ifAbsent: [ 
			| repository version |
			repository := MCHttpRepository location: 'http://seaside.gemstone.com/ss/metacello' user: '' password: ''.
			repository
				versionReaderForFileNamed: 'Metacello-Base-DaleHenrichs.2.mcz'
				do: [ :reader | 
					version := reader version.
					version load.
					version workingCopy repositoryGroup addRepository: repository ] ]
]

{ #category : #'metacello tool support' }
ConfigurationOfCormas class >> isMetacelloConfig [
	"Answer true and the Metacello tools will operate on you"
	
	^true
]

{ #category : #loading }
ConfigurationOfCormas class >> load [
	"Load the #stable version defined for this platform. The #stable version is the version that is recommended to be used on this platform."

	"self load"

	<apiDocumentation>
	^(self project version: #stable) load
]

{ #category : #loading }
ConfigurationOfCormas class >> loadBleedingEdge [
	"Load the latest versions of the mcz files defined for this project. It is not likely that the #bleedingEdge has been tested."

	"self loadBleedingEdge"

	<apiDocumentation>
	^(self project version: #bleedingEdge) load
]

{ #category : #loading }
ConfigurationOfCormas class >> loadDevelopment [
	"Load the #development version defined for this platform. The #development version will change over time and is not expected to be stable."

	"self loadDevelopment"

	<apiDocumentation>
	^(self project version: #development) load
]

{ #category : #accessing }
ConfigurationOfCormas class >> project [

	^self new project
]

{ #category : #'development support' }
ConfigurationOfCormas class >> validate [
	"Check the configuration for Errors, Critical Warnings, and Warnings (see class comment for MetacelloMCVersionValidator for more information). 
	Errors identify specification issues that will result in unexpected behaviour when you load the configuration. 
	Critical Warnings identify specification issues that may result in unexpected behavior when you load the configuration.
	Warnings identify specification issues that are technically correct, but are worth take a look at."

	"self validate"

	<apiDocumentation>
	self ensureMetacello.
	^ ((Smalltalk at: #MetacelloToolBox) validateConfiguration: self debug: #() recurse: false) explore
]

{ #category : #baselines }
ConfigurationOfCormas >> baseline010: spec [
	<version: '0.10-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec preLoadDoIt: #preLoad.
		spec postLoadDoIt: #postLoad.
		spec repository: 'http://ss3.gemtalksystems.com/ss/Cormas'.
		spec 
			baseline: 'ClassEditor' 
			with: [ spec repository: 'github://openponk/class-editor/repository' ];
			baseline: 'FileDialog'
			with: [ spec repository: 'github://peteruhnak/file-dialog/repository' ];
			project: 'CodeGenerator' with: [
				spec
					className: #ConfigurationOfCodeGenerator;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/hernan/CodeGenerator/main/' ];
			project: 'ProjectFramework' with: [
				spec
					className: #ConfigurationOfProjectFramework;
					versionString: #'development';
					repository: 'http://smalltalkhub.com/mc/hernan/ProjectFramework/main/' ];
			project: 'Roassal2' with: [
				spec
					className: #ConfigurationOfRoassal2;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo60/main/' ];
			project: 'SpecUIAddOns' with: [
				spec
					className: #ConfigurationOfSpecUIAddOns;
					versionString: #'bleedingEdge';
					repository: 'http://smalltalkhub.com/mc/hernan/SpecUIAddOns/main/' ];
			project: 'Tabular' with: [
				spec
					className: #ConfigurationOfTabular;
					versionString: #'development';
					repository: 'http://ss3.gemtalksystems.com/ss/Tabular' ].
		spec 
			package: 'Cormas-Core';
			package: 'Cormas-Model-Conway';
			package: 'Cormas-Model-Diffuse';
			package: 'Cormas-Model-ECEC';
			package: 'Cormas-Model-FireAutomata';
			package: 'Cormas-Tests';
			package: 'Cormas-UI' with: [
				spec requires: #('FileDialog' 'ProjectFramework' 'CodeGenerator' 'Roassal2' ). ];
			package: #'Cormas-VW-Ported'.
		spec 
			group: 'All' with: #(#'Cormas-VW-Ported' 'Cormas-UI' 'Cormas-Tests' 'Cormas-Model-FireAutomata' 'Cormas-Model-ECEC' 'Cormas-Model-Conway' 'Cormas-Core' 'ClassEditor' 'Cormas-Model-Diffuse');
			group: 'Core' with: #('Cormas-Core' );
			group: 'Models' with: #('Cormas-Model-Conway' 'Cormas-Core' 'Cormas-Model-ECEC' 'Cormas-Model-FireAutomata' 'Cormas-Model-Diffuse' );
			group: 'Tests' with: #('Cormas-Core' 'Cormas-Tests' );
			group: 'UI' with: #(#'Cormas-UI' 'Cormas-Core' 'Cormas-Model-Conway' 'Cormas-Model-ECEC' 'Cormas-Model-FireAutomata' 'Cormas-Model-Diffuse' ). ].

]

{ #category : #baselines }
ConfigurationOfCormas >> baseline012: spec [
	<version: '0.12-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec preLoadDoIt: #preLoad.
		spec postLoadDoIt: #postLoad.		
		spec repository: 'http://ss3.gemtalksystems.com/ss/Cormas'.
 		spec 
			baseline: 'ClassEditor' 
			with: [ spec repository: 'github://openponk/class-editor/repository' ];
			baseline: 'FileDialog'
			with: [ spec repository: 'github://peteruhnak/file-dialog/repository' ];
			baseline: 'ProjectFramework' 
			with: [ spec repository: 'github://hernanmd/ProjectFramework/repository' ];
			baseline: 'SpecUIAddOns' 
			with: [ spec repository: 'github://hernanmd/SpecUIAddOns/repository' ];
			baseline: 'CodeGenerator' 
			with: [ spec repository: 'github://hernanmd/CodeGenerator/repository' ];

			project: 'Roassal2' with: [
				spec
					className: #ConfigurationOfRoassal2;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo60/main/' ];
			project: 'Tabular' with: [
				spec
					className: #ConfigurationOfTabular;
					versionString: #'development';
					repository: 'http://ss3.gemtalksystems.com/ss/Tabular' ].
		spec 
			package: 'Cormas-Core';
			package: 'Cormas-Model-Conway';
			package: #'Cormas-Model-DemoAggregates';
			package: 'Cormas-Model-Diffuse';
			package: 'Cormas-Model-ECEC';
			package: 'Cormas-Model-FireAutomata';
			package: 'Cormas-Tests';
			package: 'Cormas-UI' with: [
				spec requires: #('FileDialog' 'ProjectFramework' 'CodeGenerator' 'Roassal2' ). ];
			package: #'Cormas-VW-Ported'.
		spec 
			group: 'All' with: #(#'Cormas-VW-Ported' 'Cormas-UI' 'Cormas-Tests' 'Cormas-Model-FireAutomata' 'Cormas-Model-ECEC' 'Cormas-Model-Conway' 'Cormas-Core' 'ClassEditor' 'Cormas-Model-Diffuse' #'Cormas-Model-DemoAggregates' );
			group: 'Core' with: #('Cormas-Core' );
			group: 'Models' with: #('Cormas-Model-Conway' 'Cormas-Core' 'Cormas-Model-ECEC' 'Cormas-Model-FireAutomata' 'Cormas-Model-Diffuse' #'Cormas-Model-DemoAggregates' );
			group: 'Tests' with: #('Cormas-Core' 'Cormas-Tests' );
			group: 'UI' with: #(#'Cormas-UI' 'Cormas-Core' 'Cormas-Model-Conway' 'Cormas-Model-ECEC' 'Cormas-Model-FireAutomata' 'Cormas-Model-Diffuse' #'Cormas-Model-DemoAggregates' ). ].

]

{ #category : #baselines }
ConfigurationOfCormas >> baseline013: spec [
	<version: '0.13-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec preLoadDoIt: #preLoad.
		spec postLoadDoIt: #postLoad.		
		spec repository: 'http://ss3.gemtalksystems.com/ss/Cormas'.
 		spec 
			baseline: 'ClassEditor' 
			with: [ spec repository: 'github://openponk/class-editor/repository' ];
			baseline: 'FileDialog'
			with: [ spec repository: 'github://peteruhnak/file-dialog/repository' ];
			baseline: 'ProjectFramework' 
			with: [ spec repository: 'github://hernanmd/ProjectFramework/repository' ];
			baseline: 'CodeGenerator' 
			with: [ spec repository: 'github://hernanmd/CodeGenerator/repository' ];

			project: 'Roassal2' with: [
				spec
					className: #ConfigurationOfRoassal2;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/ObjectProfile/Roassal2/main/' ];
			project: 'Tabular' with: [
				spec
					className: #ConfigurationOfTabular;
					versionString: #'development';
					repository: 'http://ss3.gemtalksystems.com/ss/Tabular' ];
			project: 'NeoJSON' with: [
				spec
					className: 'ConfigurationOfNeoJSON';
					version: #stable;
					repository: 'http://smalltalkhub.com/mc/SvenVanCaekenberghe/Neo/main' ].		
		spec 
			package: 'Cormas-Core';
			package: 'Cormas-Model-Conway';
			package: #'Cormas-Model-DemoAggregates';
			package: 'Cormas-Model-Diffuse';
			package: 'Cormas-Model-ECEC';
			package: 'Cormas-Model-FireAutomata';
			package: 'Cormas-Tests';
			package: 'Cormas-OpenMole' with: [
				spec requires: #('Cormas-Core')];
			package: 'Cormas-UI' with: [
				spec requires: #('FileDialog' 'ProjectFramework' 'CodeGenerator' 'Roassal2' ). ];
			package: #'Cormas-VW-Ported'.
		spec 
			group: 'All' with: #(#'Cormas-VW-Ported' 'Cormas-UI' 'Cormas-Tests' 'Cormas-Model-FireAutomata' 'Cormas-Model-ECEC' 'Cormas-Model-Conway' 'Cormas-Core' 'ClassEditor' 'Cormas-Model-Diffuse' #'Cormas-Model-DemoAggregates' 'Cormas-OpenMole');
			group: 'Core' with: #('Cormas-Core' );
			group: 'Models' with: #('Cormas-Model-Conway' 'Cormas-Core' 'Cormas-Model-ECEC' 'Cormas-Model-FireAutomata' 'Cormas-Model-Diffuse' #'Cormas-Model-DemoAggregates' );
			group: 'Tests' with: #('Cormas-Core' 'Cormas-Tests' );
			group: 'OpenMole' with:#('Cormas-OpenMole');
			group: 'UI' with: #(#'Cormas-UI' 'Cormas-Core' 'Cormas-Model-Conway' 'Cormas-Model-ECEC' 'Cormas-Model-FireAutomata' 'Cormas-Model-Diffuse' #'Cormas-Model-DemoAggregates' ). ].

]

{ #category : #doits }
ConfigurationOfCormas >> closePharoWelcomeWindow [
	" Pharo 6.x version "

	World submorphs
		select: [ : sm | 
			sm isSystemWindow 
				and: [ sm label = PharoWelcomePage title
					or: [ sm label endsWith: 'Welcome' ] ] ]
		thenDo: [ : window | window delete ].
]

{ #category : #accessing }
ConfigurationOfCormas >> customProjectAttributes [
	 "Edit to return a collection of any custom attributes e.g. for conditional loading: Array with: #'Condition1' with: #'Condition2.
	For more information see: http://code.google.com/p/metacello/wiki/CustomProjectAttrributes"

	^ #().
]

{ #category : #'symbolic versions' }
ConfigurationOfCormas >> development: spec [
	<symbolicVersion: #'development'>

	spec for: #'common' version: '0.13-baseline'.

]

{ #category : #doits }
ConfigurationOfCormas >> ensureMetacelloFileDownload [

	Metacello new
		baseline: 'MetacelloFileDownload';
		repository: 'github://hernanmd/MetacelloFileDownload';
		load.
]

{ #category : #doits }
ConfigurationOfCormas >> platformFilesUrl [
	" Private - See superimplementor's comment "

	| urlPrefix |
	urlPrefix := 'https://github.com/hernanmd/cormas/raw/master/resources/'.
	^ #('CORMAS_Graphics' 'CORMAS_Models' 'CORMAS_Installer_Bootstrap') collect: [ : file |
		(String streamContents: [ : stream |		
			stream
				nextPutAll: urlPrefix;
				nextPutAll: file;
				nextPutAll: (Smalltalk os isWin32 ifTrue: [ '.zip' ] ifFalse: [ '.tar.gz' ]) ]) ]
]

{ #category : #doits }
ConfigurationOfCormas >> postLoad [
	" Private - Execute post install actions "

	self closePharoWelcomeWindow.
	(Smalltalk at: #PFProjectApplication) applicationClass: (Smalltalk at: #CMApplicationProject).
	(Smalltalk at: #FDMorphicUIManager) new beDefault.
	"TaskbarMorph showTaskbar: false."
	self unloadPackages.

]

{ #category : #doits }
ConfigurationOfCormas >> preLoad [
	" Private - Execute post install actions "

	self ensureMetacelloFileDownload.
	super preLoad.
	self preLoadConfiguration.	

]

{ #category : #doits }
ConfigurationOfCormas >> preLoadConfiguration [

	| logoFilename |
	(logoFilename := 'CormasLogoFull.png') asFileReference exists 
		ifTrue: [ PolymorphSystemSettings desktopLogoFileName: logoFilename ].
	Smalltalk tools debugger
		alwaysOpenFullDebugger: true;
		filterCommonMessageSends: true.
	Pharo3Theme beCurrent.



]

{ #category : #accessing }
ConfigurationOfCormas >> project [

	^ project ifNil: [ 
		"Bootstrap Metacello if it is not already loaded"
		(self class baseConfigurationClassIfAbsent: []) ensureMetacello.
		"Construct Metacello project"
		project := MetacelloMCProject new projectAttributes: self customProjectAttributes. 
		(Smalltalk at: #MetacelloVersionConstructor) on: self project: project.
		project loadType: #linear. "change to #atomic if desired"
		project ]
]

{ #category : #'symbolic versions' }
ConfigurationOfCormas >> stable: spec [
	<symbolicVersion: #'stable'>

	spec for: #'common' version: '0.31'.

]

{ #category : #doits }
ConfigurationOfCormas >> unloadPackages [

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

{ #category : #versions }
ConfigurationOfCormas >> version030: spec [
	<version: '0.30' imports: #('0.10-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.30'.
		spec author: 'SergeStinckwich'.
		spec timestamp: '1/9/2018 09:50'.
		spec 
			baseline: 'ClassEditor' ;
			baseline: 'FileDialog' ;
			project: 'CodeGenerator' with: '1.3';
			project: 'ProjectFramework' with: '1.2';
			project: 'Roassal2' with: '1.55';
			"project: 'SpecUIAddOns' with: '1.0';"
			project: 'Tabular' with: '0.2-baseline'.
		spec 
			package: 'Cormas-Core' with: 'Cormas-Core-NickPapoulias.195';
			package: 'Cormas-Model-Conway' with: 'Cormas-Model-Conway-SergeStinckwich.18';
			package: 'Cormas-Model-Diffuse' with: 'Cormas-Model-Diffuse-HernanMoralesDurand.3';
			package: 'Cormas-Model-ECEC' with: 'Cormas-Model-ECEC-NickPapoulias.41';
			package: 'Cormas-Model-FireAutomata' with: 'Cormas-Model-FireAutomata-NickPapoulias.53';
			package: 'Cormas-Tests' with: 'Cormas-Tests-EtienneD.13';
			package: 'Cormas-UI' with: 'Cormas-UI-NickPapoulias.59';
			package: #'Cormas-VW-Ported' with: 'Cormas-VW-Ported-HernanMoralesDurand.9'. ].

]

{ #category : #versions }
ConfigurationOfCormas >> version031: spec [
	<version: '0.31' imports: #('0.13-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.31'.
		spec author: 'SergeStinckwich'.
		spec timestamp: '3:46:00.479129 pm'.
		spec 
			baseline: 'ClassEditor' ;
			baseline: 'FileDialog' ;
			project: 'CodeGenerator' with: '1.3';
			project: 'ProjectFramework' with: '1.2';
			project: 'Roassal2' with: '1.55';
			project: 'Tabular' with: '0.2-baseline'.
		spec 
			package: 'Cormas-Core' with: 'Cormas-Core-SergeStinckwich.207';
			package: 'Cormas-Model-Conway' with: 'Cormas-Model-Conway-NicolasBecu.22';
			package: 'Cormas-Model-DemoAggregates' with:'Cormas-Model-DemoAggregates-NicolasBecu.3';
			package: 'Cormas-Model-Diffuse' with: 'Cormas-Model-Diffuse-NicolasBecu.8';
			package: 'Cormas-Model-ECEC' with: 'Cormas-Model-ECEC-NicolasBecu.46';
			package: 'Cormas-Model-FireAutomata' with: 'Cormas-Model-FireAutomata-EtienneDelay.73';
			package: 'Cormas-OpenMole' with:'Cormas-OpenMole-EtienneDelay.3';
			package: 'Cormas-Tests' with: 'Cormas-Tests-SergeStinckwich.25';
			package: 'Cormas-UI' with: 'Cormas-UI-NicolasBecu.73';
			package: #'Cormas-VW-Ported' with: 'Cormas-VW-Ported-HernanMoralesDurand.9'. ].

]
