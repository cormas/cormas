interface closing
requestForWindowClose
	"The ApplicationWindow's controller is checking to see if the 
	application is in a state such that it can be closed."
	
	accept value
		and:
			[action = #remove | action isNil
				and:
					[self diagramList selection isNil
						ifTrue:
							[action = #remove
								ifTrue: [Dialog warn: 'Please select a diagram to be removed']
								ifFalse: [Dialog warn: 'Please select a diagram to open'].
							^false]]].
	^super requestForWindowClose