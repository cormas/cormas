labeling-text
labelText: aText
	"Set a specific Text object to use when displaying the menu item.  This is optional, since the regular label String will be used if no specific label Text object is specified with the method.  
	Typically it is not desirable to set a specific labelText object because the MenuItemView will choose an appropriate one based on the regular label string.
	Labels ending in an ellipsis (...) (three consecutive periods) denote that the menu item initiates the beginning of an action (rather than the whole action).  A particular LookPolicy may modify the ending ellipsis (when the label is displayed) if another convention is used for that meaning."
	
	self realAdornment labelText: aText