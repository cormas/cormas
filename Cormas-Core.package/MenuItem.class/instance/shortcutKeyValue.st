shortcut key
shortcutKeyValue
	"Answer the Character value that is the shortcut key for this menu item.  Answer nil if none."
	
	^adornment == nil
		ifTrue: [nil]
		ifFalse: [adornment shortcutKeyValue]