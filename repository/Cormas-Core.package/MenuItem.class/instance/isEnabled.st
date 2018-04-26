enabled/disabled
isEnabled
	"Answer whether the menu item should be enabled on the menu.  If its not enabled it can't be selected."
	
	| result im |
	result := enabled evaluate.
	(result isKindOf: Boolean)
		ifFalse:
			[Transcript
				cr;
				show:
						(#MenuEnablementNotBoolean << #dialogs >>
									'Menu enablement for <1s> answers <2s> instead of a Boolean.'
								expandMacrosWith: label printString
								with: result printString);
				cr;
				show: #AnsweringTrue << #dialogs >> 'Answering true'.
			result := true].
	im := self labelImage.
	im isNil ifFalse: [im downcastEvent: #enablement with: result from: self].
	^result