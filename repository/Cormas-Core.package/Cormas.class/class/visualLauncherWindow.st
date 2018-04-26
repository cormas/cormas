util_window
visualLauncherWindow
	"return the actual VisualLauncher window if exists. Return one of them if multiple windows exists.
	return nil if no VisualLauncher is actually open.
	This method is inspired from ApplicationModel class>>raiseSingleInstance
	Cormas visualLauncherWindow
	"
	
	Screen default
		allScheduledWindowsDo:
			[:each | (each model isKindOf: VisualLauncher) ifTrue: [^each]].
	^nil