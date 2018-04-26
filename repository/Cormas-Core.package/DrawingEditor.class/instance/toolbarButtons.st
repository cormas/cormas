private
toolbarButtons
	
	buttons isNil
		ifTrue:
			[| list |
			list := List new.
			self toolNames
				with: self iconNames
				do:
					[:tool :icon | 
					list
						add:
							(tool isNil
								ifTrue: [ButtonDescription spacer]
								ifFalse: [self buildButtonDescriptionForTool: tool andIcon: icon])].
			buttons := SelectionInList new.
			buttons list: list.
			buttons selection: list first].
	^buttons