util_files
checkIfNameContainsBlank: aName
	"Check if aName contains blanks. If yes, removes them and returns the new name"
	
	| newName |
	aName isEmpty ifTrue: [^aName].
	newName := aName reject: [:ch | ch = Character space].
	aName = newName
		ifFalse:
			[Dialog
				warn:
					(UserMessage defaultString: 'The name has been renamed as ' key: #renameAs)
						asString withCRs , newName].
	^newName