private
displayOn: aGC
	
	self halt.
	adaptor level = 0 ifTrue: [^self].
	self state isNil
		ifTrue: [aGC paint: (ColorValue perform: #black)]
		ifFalse: [aGC paint: self state color].
	adaptor imageEtDico remplissage == #vide
		ifTrue:
			[adaptor imageEtDico geometric asStroker displayOn: aGC at: centre]
		ifFalse:
			[adaptor imageEtDico geometric asFiller displayOn: aGC at: centre]