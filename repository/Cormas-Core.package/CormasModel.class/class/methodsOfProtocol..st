- activityEditor
methodsOfProtocol: protocolName
	"Return a set of all the methods of model classes which are in the given protocol and of all the methods of cormas entity classes which are in the protocol '* protocolName'"
	
	| collModel |
	collModel := OrderedCollection new.
	(self superClassesUntil: CormasModel)
		do:
			[:aClass | 
			collModel
				addAll: (aClass organization listAtCategoryNamed: protocolName) sorted].
	^collModel