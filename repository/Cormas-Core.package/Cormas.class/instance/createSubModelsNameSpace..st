model entities
createSubModelsNameSpace: aName
	"Creates and returns the NameSpace under CormasNS.Models    aName : <String>"
	
	^Models
		defineNameSpace: aName asSymbol
		private: false
		imports:
			'private Smalltalk.* 
						 private CormasNS.Kernel.*'
		category: aName , 'Category'