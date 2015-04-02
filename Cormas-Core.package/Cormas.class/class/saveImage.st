util_export
saveImage
	"save the vw image with Cormas. Usually called when Cormas has just been installed or updated.
Cormas saveImage"
	
	| stringName |
	(self current
		confirm:
			'Cormas has been loaded successfully. \ Do you want to save Cormas now?'
				withCRs)
		ifTrue:
			[ObjectMemory verboseGlobalCompactingGC.
			Transcript clear.
			stringName := Dialog requestNewFileName: 'Save image as' default:
					'cormas.im'.
			stringName isEmpty ifTrue: [^nil].
			stringName := (self
				removeExtensionOf: stringName asFilename tail asFilename) asString.
			ObjectMemory saveAs: stringName thenQuit: false.
			Cormas visualLauncherWindow
				ifNotNil: [:w | w label: VisualLauncher title]]