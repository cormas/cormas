compiling
silentlyDefineSetterMethod: attributName ofClass: aClass protocol: protocol
	"Build the setter accessor method code.

ex: self defineSetterMethod: 'truc' ofClass: Agent protocol: 'accessing'  		
then, the code will be:
truc: anObject
	''Setter accessor of attribute truc''
	truc := anObject

attributName = <String> 
aClass = <Class> 
protocol = <String> "
	
	| code |
	code := (attributName , ': anObject' , '\	"Setter accessor of attribute '
		, attributName , '. \' , Cormas automaticCommentString , '  "\	' ,
			attributName , ' := anObject') withCRs.
	aClass
		compile: code
		classified: protocol asString
		notifying: nil