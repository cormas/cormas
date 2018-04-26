action
addPopSizeProbeForClass: aClass
	
	| probeName choice |
	probeName := 'numberOf' , aClass name , 's'.
	choice := Dialog
		choose: 'The probe ' , probeName , ' will be added.'
		labels: (Array with: 'Confirm' with: 'Cancel' with: 'Edit probe name')
		values: #(#confim #cancel #changeName)
		default: #confirm
		for: Dialog defaultParentWindow.
	choice = #cancel ifTrue: [^nil].
	choice = #changeName
		ifTrue: [probeName := self requestProbeNameInitialAnswer: probeName].
	self cormasModel
		compile:
			(probeName asString , '\ "return the populmation size of ' , aClass name ,
					'" \^self the' , aClass name , 's size') withCRs
		classified: 'probes'
		notifying: nil.
	self listEntitiesChanged