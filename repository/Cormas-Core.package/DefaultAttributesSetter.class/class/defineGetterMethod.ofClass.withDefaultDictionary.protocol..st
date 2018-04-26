compiling
defineGetterMethod: attributName ofClass: aClass withDefaultDictionary: defaultValue protocol: protocol
	"Build the getter accessor method code with defaultValue (a Dictionary)
ex: self defineGetterMethod: 'truc' ofClass: Agent withDefaultDictionary: aDico protocol: 'accessing'  		
then, the code will be:
truc
	''Getter accessor with default value = Dictionary ''
	^bidon ifNil:[bidon := Dictionary new]

attributName = <String> 
aClass = <Class> 
defaultValue = <Dictionary> 
protocol = <String> "
	
	| code |
	code := (attributName , '\	"Getter accessor with new Dictionary. \'
		, Cormas automaticCommentString , '"\	^' , attributName , ' ifNil:[' ,
			attributName , ' := Dictionary new.') withCRs.
	defaultValue isEmpty
		ifFalse:
			[defaultValue
				keysAndValuesDo:
					[:k :v | 
					code := (code , '\              ' , attributName , ' at: ' , k asString ,
							' put: ' , v asString , '.') withCRs]].
	code := code , ']'.
	aClass
		compile: code
		classified: protocol asString
		notifying: nil