compiling
defineGetterMethodFrom: aCAV protocol: protocol
	"Build the getter accessor method code with defaultValue
ex: self defineGetterMethod: 'truc' ofClass: Agent withDefaultValue: 22 protocol: 'accessing'  		
then, the code will be:
truc
	''Getter accessor with default value = 22 ''
	^bidon ifNil:[bidon := 22]
attributName = <String> ; aClass = <Class> ; defaultValue = <Object> ; protocol = <String> "
	
	| code defaultValueString attributName |
	"	theClass := aClass isMeta ifTrue:[aClass instanceBehavior] ifFalse:[aClass].
	(theClass hasRandomAttribute: attributName) ifTrue:[
		aClass isMeta 
			ifTrue:[(aClass instanceBehavior isRandomAttribute: attributName scopeLevel: #class) ifTrue:[^self defineGetterMethod: attributName ofClass: aClass withRandom: defaultValue protocol: protocol]] 
			ifFalse:[(aClass isRandomAttribute: attributName scopeLevel: #instance) ifTrue:[^self defineGetterMethod: attributName ofClass: aClass withRandom: defaultValue protocol: protocol]]]."
	attributName := aCAV targetAttribute asString.
	aCAV valueType = Random
		ifTrue: [^self defineGetterRandomMethodFrom: aCAV protocol: protocol].
	aCAV currentValue isNil
		ifTrue:
			[code := (attributName , '\	"Getter accessor without default value "\	^' ,
					attributName) withCRs]
		ifFalse:
			[defaultValueString := self transformAsString: aCAV currentValue.
			code := (attributName , '\	"Getter accessor with default value = ' ,
					defaultValueString , '. \' , Cormas automaticCommentString , ' "\	^' ,
					attributName , ' ifNil:[' , attributName , ' := ' , defaultValueString
				, ']') withCRs].
	aCAV targetClass
		compile: code
		classified: protocol asString
		notifying: nil