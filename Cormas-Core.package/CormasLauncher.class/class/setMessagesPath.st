settings
setMessagesPath
	"Add Messages path"
	
	| messagePath fileSeparator |
	fileSeparator := String with: Filename separator.
	messagePath := '$(VISUALWORKS)' , fileSeparator , 'cormas' , fileSeparator
		, 'Messages'.
	((UISettings preferenceModelFor: #messagesListEditing) value includes:
			messagePath)
		ifFalse:
			[(UISettings preferenceModelFor: #messagesListEditing) value
				add: messagePath asString.
			UISettings messagesAccept]