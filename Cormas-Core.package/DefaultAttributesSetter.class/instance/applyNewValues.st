actions
applyNewValues
	" set a the new values of the attributes when user has changed them and has clicked on 'applyNewValues' button.
	The attributes of the existing objects are associated to the new values (InitialValues) and the attributes accessors are redefined:
	Note that the default value accessors at class level are not redefined"
	
	(self classAttribValue_List list
		select: [:defAttrib | defAttrib hasBeenModified])
		do:
			[:aClassAttribValue | 
			aClassAttribValue entityInstances isNil
				ifTrue:
					[aClassAttribValue
						entityInstances:
							(aClassAttribValue targetClass isMeta
								ifTrue:
									[OrderedCollection with: aClassAttribValue targetClass instanceBehavior]
								ifFalse:
									[self cormasModel class = aClassAttribValue targetClass
										ifFalse:
											[self cormasModel allTheEntities: aClassAttribValue targetClass]
										ifTrue: [OrderedCollection with: self cormasModel]])].
			self applyNewValue: aClassAttribValue]