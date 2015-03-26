actions_buttons
checkSettings
	"return self if ok"
	
	| notAnalysedParameters zeroParameters |
	notAnalysedParameters := self classAttribValue_List list
		select:
			[:defAttrib | 
			defAttrib currentValue = defAttrib finalValue
				or: [defAttrib finalValue isNil]].
	notAnalysedParameters isEmpty
		ifFalse: [(self confirmContinue: notAnalysedParameters) ifFalse: [^nil]].
	notAnalysedParameters do: [:defAttrib | defAttrib hasBeenModified: false].
	zeroParameters := self classAttribValue_List list
		select:
			[:defAttrib | defAttrib currentValue = 0 or: [defAttrib finalValue = 0]].
	zeroParameters removeAllSuchThat: [:e | notAnalysedParameters includes: e].
	zeroParameters isEmpty
		ifFalse: [(self confirmWithZero: zeroParameters) ifFalse: [^nil]].
	zeroParameters do: [:defAttrib | defAttrib hasBeenModified: false].
	self warnExplanations.
	labelForProcess := nil.
	^super checkSettings