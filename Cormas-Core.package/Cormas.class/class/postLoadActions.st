util_export
postLoadActions
	"Finalize Cormas installation by adapting the VW settings, loading Excel (COM), closing all windows, launching Cormas and saving the image"
	"Cormas postLoadActions"
	
	Notice
		showNotice: 'Finalizing Cormas installation... in progress'
		complete: 4
		while:
			["**  1  **   Close all the GF windows"
			IncrementNotification raiseSignal.
			CormasLauncher adaptSettings.
			GFDemoLauncher allInstances do: [:inst | inst closeRequest].	"**  2  **   Close the Workspace window"
			(Delay forMilliseconds: 40) wait.
			IncrementNotification raiseSignal.
			Workspace allInstances do: [:inst | inst closeRequest].	"**  3  **   Close the Hotdraw windows"
			(Delay forMilliseconds: 40) wait.
			IncrementNotification raiseSignal.
			[(ScheduledWindow allInstances
				select:
					[:w | w label = 'HotDraw Installation Workspace' and: [w model isNil not]])
				do: [:w | w controller closeAndUnschedule]]
				on: GenericException
				do: [:ex | ex return: 'plantage'].
			[(ApplicationWindow allInstances
				select:
					[:w | w label = 'Welcome to VisualWorks' and: [w model isNil not]])
				do: [:w | w controller closeAndUnschedule]]
				on: GenericException
				do: [:ex | ex return: 'plantage'].	"**  4  **   Load COM"
			(Delay forMilliseconds: 40) wait.
			IncrementNotification raiseSignal.
			ParcelManager allInstances do: [:w | w closeRequest].
			FileBrowser allInstances do: [:w | w closeRequest].
			OSHandle platformMoniker = #win
				ifTrue:
					[(Parcel findParcelNamed: 'Com- All') isNil
						ifFalse: [Parcel loadParcelByName: 'Com- All']].	"**  5  **   Specify Memory Policy"
			(Delay forMilliseconds: 40) wait.
			IncrementNotification raiseSignal.
			ObjectMemory currentMemoryPolicy growthRegimeUpperBound: 128000000.
			ObjectMemory sizesAtStartup: #(10.0 10.0 1.0 1.0 1.0 10.0 1.0).
			(Delay forMilliseconds: 40) wait.
			IncrementNotification raiseSignal]
		title: 'Cormas'.	"**  6  **   Settings for Mac OSX:  change default button aspects"
	Screen default platformName = 'MacOSX'
		ifTrue:
			[Dialog warn:
					'For Mac OS X users, the ''Aqua'' style buttons are hardly readable.

We recommand to set the ''Look & Feel'' settings of the ''User interface look'' to:

	***    Macintosh (OS-8)    *** '.
			SettingsManager openOrRaise: VisualWorksSettings].
	Cormas open.
	Cormas saveImage