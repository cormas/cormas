getParameters
getDefaultValueOfAttribut: anAttribut ofClass: aClass
	"Returns the default value of anAttribut (static or instance) of aClass, using the  'anAttribut_default' accessor  located into the ' - default value ' protocol.
Compatibility with previous Cormas version: before changing, it tests if the default class method exists otherwise compiles it

	anAttribut = <Symbol>
	aClass = <Class>"
	
	| default classLevel inst |
	aClass isMeta
		ifTrue: [classLevel := aClass instanceBehavior]
		ifFalse: [classLevel := aClass].
	default := self
		tryMethod: (anAttribut , '_default') asSymbol
		onClass: classLevel.
	default = 'Non ca n a pas marche du tout. VA falloir traiter ca'
		ifTrue:
			[classLevel isGenericEntity ifTrue: [^nil].
			aClass isMeta
				ifTrue:
					[default := self
						tryMethod: anAttribut asSymbol
						onClass: classLevel]
				ifFalse:
					[inst := aClass basicNew.
					default := self
						tryMethod: anAttribut asSymbol
						onClass: inst].
			default = 'Non ca n a pas marche du tout. VA falloir traiter ca'
				ifTrue: [^nil]
				ifFalse:
					[default isLiteral
						ifTrue:
							[self
								defineDefaultClassMethod: anAttribut asString
								ofClass: aClass
								withDefaultValue: default]]].
	^default