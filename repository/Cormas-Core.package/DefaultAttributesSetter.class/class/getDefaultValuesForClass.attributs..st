getParameters
getDefaultValuesForClass: aKlass attributs: attributs
	"attributs is a Set of static attributs or instance attributs"
	"Returns the default value of anAttribut (static or instance) of aClass, using the  'anAttribut_default' accessor  located into the ' - default value ' protocol.
	anAttribut = <Symbol>
	aClass = <Class>"
	
	| infoList default defaultParameters |
	defaultParameters := OrderedCollection new: attributs size.
	attributs
		do:
			[:anAttribut | 
			(aKlass findSelector: anAttribut asSymbol) isNil
				ifFalse:
					[infoList := Array new: 3.
					default := self getDefaultValueOfAttribut: anAttribut ofClass: aKlass.
					infoList
						at: 1 put: aKlass;
						at: 2
							put: anAttribut asSymbol;
						at: 3 put: default.
					defaultParameters add: infoList	"default isNil 
						ifFalse: [defaultParameters add: infoList]"]].
	^defaultParameters