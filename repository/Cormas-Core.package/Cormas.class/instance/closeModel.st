main menu
closeModel
	
	self cormasModel notNil ifTrue: [self closeSimulation].
	self listSocialEntities list: List new.
	self listSpatialEntities list: List new.
	self listPassiveEntities list: List new.
	self mainWin label: 'Cormas'.
	xmlModel isNil
		ifFalse:
			[xmlModel release.
			xmlModel := nil].
	self cormasModelClass: nil.
	self displaySimNumber value: ' '.
	self modelNameField value: ' '.
	self versionField value: ' '	"(self builder componentAt: #SimButton) widget labelString: ' '"