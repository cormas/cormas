compiling
defineSetterMethodWithObserverNotification: attributName ofClass: aClass protocol: protocol
	"Build the setter accessor method code and adds a 'self changed' command to notify the oberservers when changed.

ex: self defineSetterMethod: 'truc' ofClass: Agent protocol: 'accessing'  		
then, the code will be:
truc: anObject
	''Setter accessor of attribute truc''
	truc := anObject

attributName = <String> 
aClass = <Class> 
protocol = <String> "
	
	| code setterMethod |
	setterMethod := (attributName asString , ':') asSymbol.
	(aClass canUnderstand: setterMethod)
		ifTrue:
			[(Dialog
				confirm:
					'Setter accessor of ' , attributName asString
						, ' already defined. \Overwrite it  ?' withCRs) ifFalse: [^nil]].
	code := (attributName , ': anObject' , '\	"Setter accessor of attribute '
		, attributName , '. \' , Cormas automaticCommentString , '  "\	' ,
			attributName , ' = anObject ifTrue:[^nil].   "for optimization"\	' ,
			attributName , ' := anObject.' , '\	self changed') withCRs.
	aClass
		compile: code
		classified: protocol asString
		notifying: nil