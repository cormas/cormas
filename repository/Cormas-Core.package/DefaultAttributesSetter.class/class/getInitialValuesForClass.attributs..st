getParameters
getInitialValuesForClass: aKlass attributs: attributs
	"Returns the Initial value of anAttribut (static or instance) of aClass, using the  #anAttribut accessor.
	anAttribut = <Symbol> attributs is a Set of static attributs or instance attributs
	aClass = <Class>"
	
	| infoList initialValue initialParameters |
	initialParameters := OrderedCollection new: attributs size.
	attributs
		do:
			[:anAttribut | 
			(Cormas findSelector: anAttribut asSymbol in: aKlass) isNil
				ifFalse:
					[infoList := Array new: 3.
					initialValue := self getInitialValueOfAttribut: anAttribut ofClass:
							aKlass.
					infoList
						at: 1 put: aKlass;
						at: 2
							put: anAttribut asSymbol;
						at: 3 put: initialValue.
					initialParameters add: infoList]].
	^initialParameters