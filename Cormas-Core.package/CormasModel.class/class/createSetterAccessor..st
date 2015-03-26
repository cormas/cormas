compiling
createSetterAccessor: aClass
	"creates a setter accessor such as :
theXXXs: aNewCollection 
	theXXXs := aNewCollection.
aClassName = <String> or <Symbol>.
(aClassName ('XXX') is completed as theXXXs)"
	
	| pop |
	pop := self getterForEntityClass: aClass.
	self
		compile:
			(pop , ': aNewCollection\	"Set a new collection for theXXXs attribute.\'
				, Cormas automaticCommentString , '"\\	' , pop , ' := aNewCollection')
				withCRs
		classified: 'accessing'
		notifying: nil