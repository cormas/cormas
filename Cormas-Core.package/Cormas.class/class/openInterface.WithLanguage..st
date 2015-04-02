actions
openInterface: anInterface WithLanguage: languageCode
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