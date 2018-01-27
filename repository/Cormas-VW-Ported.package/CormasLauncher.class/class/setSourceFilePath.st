settings
setSourceFilePath
	"Add the Source paths : $(VISUALWORKS)/cormas/cormas.cha "
	
	| sourcePath fileSeparator |
	fileSeparator := String with: Filename separator.
	sourcePath := '$(VISUALWORKS)' , fileSeparator , 'cormas' , fileSeparator
		, Cormas cormasName , '.cha'.
	((UISettings preferenceModelFor: #sourcesEditing) value includes:
			sourcePath)
		ifFalse:
			[(UISettings preferenceModelFor: #sourcesEditing) value
				add: sourcePath asString]