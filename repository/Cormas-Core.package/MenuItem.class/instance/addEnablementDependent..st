private
addEnablementDependent: aSpecWrapper
	"If enablement is a ValueModel add a BlockValue as a dependent to set enablement of aSpecWrapper. Answer the action required to later remove the dependency."
	
	^(enabled isKindOf: ValueModel)
		ifTrue:
			[| blockValue |
			blockValue := enabled compute: [:e | aSpecWrapper isEnabled: e].
			ActionSequence
				with:
					(MessageSend receiver: enabled selector: #removeDependent: argument:
							blockValue)]
		ifFalse: [ActionSequence new]