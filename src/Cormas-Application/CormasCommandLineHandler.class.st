Class {
	#name : 'CormasCommandLineHandler',
	#superclass : 'CommandLineHandler',
	#category : 'Cormas-Application',
	#package : 'Cormas-Application'
}

{ #category : 'accessing' }
CormasCommandLineHandler class >> commandName [

	^ 'cormas'
]

{ #category : 'icons' }
CormasCommandLineHandler class >> cormasIcon [

	| icon m left right top bottom r logo |
	icon := Form extent: 128 @ 128 depth: 32.
	m := 4.
	left := 4.
	right := 128 - 4.
	top := 4.
	bottom := 128 - 4.
	r := 32.
	icon getCanvas
		fillColor: Color transparent;
		fillRectangle: (left + r @ top corner: right - r @ bottom)
		color: Color white;
		fillRectangle: (left @ (top + r) corner: right @ (bottom - r))
		color: Color white;
		fillOval: (left @ top extent: r @ r * 2) color: Color white;
		fillOval: (right - r - r @ top extent: r @ r * 2)
		color: Color white;
		fillOval: (left @ (bottom - r - r) extent: r @ r * 2)
		color: Color white;
		fillOval: (right - r - r @ (bottom - r - r) extent: r @ r * 2)
		color: Color white.
	logo := (BaselineOfCormas cormasLogo form contentsOfArea:
		         (0 @ 0 extent: 400 @ 400)) scaledToSize: 124 @ 124.
	icon getCanvas translucentImage: logo at: 4 @ -2.
	^ icon
]

{ #category : 'utilities' }
CormasCommandLineHandler class >> deploy [

	<script>
	MCRepositoryGroup allSubInstancesDo: [ :group |
		group repositories do: [ :repo | group removeRepository: repo ] ].
	IceRepository registry removeAll.
	IceCredentialStore current in: [ :store |
		store allCredentials do: [ :each | each removeFrom: store ] ].
	self currentWorld closeAllWindowsDiscardingChanges.
	Deprecation
		raiseWarning: false;
		showWarning: false.
	NoChangesLog install.
	"NoPharoFilesOpener install."
	FFICompilerPlugin install.
	Stdio useNullStreams.
	MCCacheRepository uniqueInstance disable.
	EpMonitor reset.
	SessionManager default registerSystemClassNamed: #FreeTypeFileInfo.
	5 timesRepeat: [ "PharoCommandLineHandler forcePreferencesOmission: true"
		Smalltalk garbageCollect ]
]

{ #category : 'generating' }
CormasCommandLineHandler class >> generate [

	<script: 'CormasCommandLineHandler generate'>
	PhleeterOnOSX new
		properties: {
				(#AppName -> 'Cormas').
				(#InfoString
				 -> 'COmmon pool Ressources and Multi-Agent Simulations').
				(#BundleIdentifier -> 'com.github.cormas.cormas').
				(#ShortVersion -> '1.0.0').
				(#DisplayName -> 'Cormas').
				(#IconSetFile
				 -> ((IceRepository repositoryNamed: 'cormas') location / 'icons'
					  / 'Cormas.icns')).
				(#DiskIconSetFile
				 -> ((IceRepository repositoryNamed: 'cormas') location / 'icons'
					  / 'Cormas.icns')).
				(#DeployPharoExpression -> 'CormasCommandLineHandler deploy').
				(#CommandLineHandler -> self commandName).
				(#CompanyName -> 'Cormas project') } asDictionary;
		targetPlatforms:
			#( 'Darwin-arm64' 'Darwin-x86_64' 'Windows-x86_64' );
		outputDirectory: FileLocator home / 'src' / 'Cormas' / 'build';
		generate
]

{ #category : 'activation' }
CormasCommandLineHandler >> activate [

	self
		installMenu;
		installIcon
]

{ #category : 'initialization' }
CormasCommandLineHandler >> installIcon [

	self currentWorld worldState worldRenderer osWindow icon:
		self class cormasIcon
]

{ #category : 'initialization' }
CormasCommandLineHandler >> installMenu [

	OSWindowDriver current startUp: true.
	OSPlatform current isMacOSX ifTrue: [
		| main |
		main := CocoaMenu new.
		main
			title: 'MainMenu';
			addSubmenu: 'Cormas' with: [ :m |
				m
					addItemWithTitle: 'Settings...'
					action: [ SettingBrowser new open ];
					addItemWithTitle: 'Quit' action: [ WorldState quitSession ] ].
		main setAsMainMenu ]
]
