shortcut key
makeShortcutDisplayOnly
	
	self
		shortcutModifiers:
			(self shortcutModifiers bitOr: MenuItemAdornment displayOnlyShortcutMask)