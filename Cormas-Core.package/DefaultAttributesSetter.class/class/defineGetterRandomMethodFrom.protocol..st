compiling
defineGetterRandomMethodFrom: aCAV protocol: protocol
	"Build the getter accessor method code with default random Value.
truc
	''Getter accessor with default value = 22 ''
	^bidon ifNil:[bidon := 22]
attributName = <String> ; aClass = <Class> ; defaultValue = <Object> ; protocol = <String> "
	
	| code defaultValueString attributName |
	defaultValueString := 'Cormas ' , aCAV intOrFloat value asString ,
			'From: '.
	defaultValueString := defaultValueString
		, aCAV minValueHolder value printString.
	defaultValueString := defaultValueString , ' to: '.
	defaultValueString := defaultValueString
		, aCAV maxValueHolder value printString.
	attributName := aCAV targetAttribute asString.
	code := (attributName , '\	"Getter accessor with random value = '
		, (self transformAsString: aCAV currentValue) , '. \'
		, Cormas automaticCommentString , '  "\	^' , attributName , ' ifNil:[' ,
			attributName , ' := ' , defaultValueString , ']') withCRs.
	aCAV targetClass
		compile: code
		classified: protocol asString
		notifying: nil