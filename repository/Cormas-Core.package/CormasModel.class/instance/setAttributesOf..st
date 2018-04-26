- binary storage
setAttributesOf: aClass
	
	| theInstances attributes assos attribValue |
	theInstances := self theEntities: aClass.
	attributes := aClass allInstVarNames.
	theInstances
		do:
			[:inst | 
			1
				to: attributes size
				do:
					[:i | 
					((inst instVarAt: i) isKindOf: Association)
						ifTrue:
							[assos := inst instVarAt: i.
							attribValue := (self theEntities: assos key)
								detect: [:o | o id = assos value]
								ifNone: [nil].
							attribValue isNil
								ifFalse:
									["inst perform: ((attributes at: i), ':') asSymbol with: attribValue."
									inst instVarAt: i put: attribValue]]]]