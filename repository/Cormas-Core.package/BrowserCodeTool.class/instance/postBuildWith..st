interface opening
postBuildWith: aBuilder
	
	super postBuildWith: aBuilder.
	initialLookPrefs := (builder componentAt: #textEditor) lookPreferences.
	self updateTextWidget.
	self textController doNotHandleLocally: #explain