interface actions
switchInterface
	
	| model |
	model := self cormasModelClass.
	self closeModel.
	self dependents
		do:
			[:win | 
			win
				release;
				close].
	self closeRequest.	"closeAndUnschedule"	"ScheduledControllers scheduledControllers removeAllSuchThat:[: sc|sc view application isNil]."
	(self builder bindings at: #__specName) = #windowSpec_old
		ifFalse:
			[Cormas
				openInterface: #windowSpec_old
				WithLanguage: Locale current name
				ofModel: self]
		ifTrue:
			[Cormas
				openInterface: #windowSpec
				WithLanguage: Locale current name
				ofModel: self].
	self openModel: model