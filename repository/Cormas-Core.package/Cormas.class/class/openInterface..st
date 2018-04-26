actions
openInterface: anInterfaceName
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