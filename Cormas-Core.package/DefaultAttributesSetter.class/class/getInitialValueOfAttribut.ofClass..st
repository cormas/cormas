getParameters
getInitialValueOfAttribut: anAttribut ofClass: aClass
	"Returns the Initial value of anAttribut (static or instance) of aClass, using #anAttribut accessor of aClass.
	anAttribut = <Symbol>
	aClass = <Class>"
	
	| initialValue targetLevel |
	aClass isMeta
		ifTrue: [targetLevel := aClass instanceBehavior]
		ifFalse: [targetLevel := aClass basicNew].
	initialValue := self
		tryMethod: anAttribut asSymbol
		onClass: targetLevel.
	initialValue = 'Non ca n a pas marche du tout. VA falloir traiter ca'
		ifTrue:
			[aClass isMeta
				ifTrue:
					[initialValue := self
						tryMethod: (anAttribut , '_default') asSymbol
						onClass: aClass instanceBehavior]
				ifFalse:
					[initialValue := self
						tryMethod: (anAttribut , '_default') asSymbol
						onClass: aClass].
			initialValue = 'Non ca n a pas marche du tout. VA falloir traiter ca'
				ifTrue: [^nil]
				ifFalse:
					[initialValue isLiteral
						ifTrue:
							[self
								defineDefaultClassMethod: anAttribut asString
								ofClass: aClass
								withDefaultValue: initialValue]]].
	^initialValue