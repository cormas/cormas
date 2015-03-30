shortcut key
shortcutString
	"Answer the String representing the shortcut key combination for this menu item."
	
	^self realAdornment shortcutModifierString
		expandMacrosWith: self realAdornment shortcutKeyString asUppercase