instance creation
labeled: aString
	"Answer a new MenuItem with the given string as its label with a specified access character.
	The character after the first ampersand (&) will be the access character for the menu item (for LookPolicy's that have the concept of an access character).  The ampersand will not appear in the label, it just marks the character that should be the access character.  To get an ampersand to appear in the label, use two consecutive ampersands (&&).
	Labels ending in an ellipsis (...) (three consecutive periods) denote that the menu item initiates the beginning of an action (rather than the whole action).  When displayed, a LookPolicy may modify the ending ellipsis if another convention is used for that meaning."
	
	^(super new)
		initializeWithRawLabel: aString;
		yourself