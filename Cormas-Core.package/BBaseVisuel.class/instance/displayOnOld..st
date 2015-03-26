private
displayOnOld: aGC
	
	adaptor level ~= 0
		ifTrue:
			[self state notNil
				ifTrue: [aGC paint: self state color]
				ifFalse: [aGC paint: (ColorValue perform: #black)].
			adaptor imageEtDico remplissage == #vide
				ifTrue:
					[adaptor imageEtDico geometric asStroker displayOn: aGC at: centre]
				ifFalse:
					[adaptor imageEtDico geometric asFiller displayOn: aGC at: centre]]