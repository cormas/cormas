compiling
defineGetterMethod: attributName ofClass: aClass withRandom: defaultValue protocol: protocol
	"Build the getter accessor method code with random generator

ex: self defineGetterMethod: 'truc' ofClass: Agent withDefaultValue: 'random' protocol: 'accessing' . Then, the code will be:
truc
	''Getter accessor with default value = Cormas random ''
	^bidon ifNil:[bidon := Cormas random]
attributName = <String> 
aClass = <Class> 
defaultValue = <Object> 
protocol = <String> "
	
	| code defaultValueString anArray |
	aClass isMeta
		ifTrue:
			[anArray := aClass instanceBehavior randomAttributes
				detect:
					[:line | (line at: 1) = attributName and: [(line at: 2) = #class]]]
		ifFalse:
			[anArray := aClass randomAttributes
				detect:
					[:line | (line at: 1) = attributName and: [(line at: 2) = #instance]]].
	defaultValueString := 'Cormas ' , (anArray at: 3) asString , 'From: '.
	defaultValueString := defaultValueString , (anArray at: 4) printString.
	defaultValueString := defaultValueString , ' to: '.
	defaultValueString := defaultValueString , (anArray at: 5) printString.
	code := (attributName , '\	"Getter accessor with random value = ' ,
			defaultValueString , ' "\' , Cormas automaticCommentString , '\	^' ,
			attributName , ' ifNil:[' , attributName , ' := ' , defaultValueString ,
			']') withCRs.
	aClass
		compile: code
		classified: protocol asString
		notifying: nil