drawing description
iconNames
	"If the icon names don't follow the convention of removing white space from the tool name, 
	making the first letter lowercase, and then replacing 'Tool' with 'Icon'; you might need to 
	override this.

	Normally the icon names can be converted from the tool names:
		Selection Tool -> selectionIcon
		Bring To Front Tool -> bringToFrontIcon"
	
	^self toolNames collect: [:each | self iconNameFor: each]