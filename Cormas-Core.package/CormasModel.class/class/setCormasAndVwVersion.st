description - primitives
setCormasAndVwVersion
	"Creates 2 class methods: #cormasCompatibleVersion and #vwCompatibleVersion"
	
	self class
		compile:
			'cormasCompatibleVersion' ,
					'
^ ' , Cormas version printString
		classified: 'description'
		notifying: nil.
	self setDescriptionFor: 'vwCompatibleVersion' withText: SystemVersionName	"SystemUtils.SystemVersionName     -> '7.6'"	"SystemUtils version   ->  'VisualWorks¬Æ NonCommercial, 7.6 of lundi 3 mars 2008'"