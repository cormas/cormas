shortcut key
shortcutKeyCharacter
	"Answer the Character that is the shortcut key for this menu item.  Answer nil if none."
	
	adornment == nil
		ifTrue: [^nil]
		ifFalse: [^adornment shortcutKeyCharacter]