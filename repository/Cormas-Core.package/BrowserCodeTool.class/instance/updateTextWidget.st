private
updateTextWidget
	
	| widget prefs |
	builder isNil ifTrue: [^self].
	widget := builder componentAt: #textEditor.
	widget isNil ifTrue: [^self].
	modified
		= (widget lookPreferences foregroundColor = self modifiedTextColor)
		ifTrue: [^self].
	prefs := modified
		ifTrue: [initialLookPrefs copy foregroundColor: self modifiedTextColor]
		ifFalse: [initialLookPrefs].
	widget lookPreferences: prefs