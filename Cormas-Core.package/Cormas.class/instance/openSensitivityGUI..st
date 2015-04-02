interface actions
openSensitivityGUI: aSensitivityClass
	"Open the aSensitivityClass GUI "
	
	| gui |
	self cormasModelClass isNil ifTrue: [^self alert_NewModel].
	self cormasModel defaultAttributesSetter modifiedAttribute isEmpty
		ifFalse:
			[(Dialog confirm:
					'Some attributes have been modified.
Before the analysis, Cormas will set them to their default values, OK?')
				ifFalse: [^nil]
				ifTrue: [self cormasModel defaultAttributesSetter backToDefaultValues]].
	gui := self cormasModel openSensitivityInterface: aSensitivityClass.
	gui cormas: self