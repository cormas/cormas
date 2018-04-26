action
addPopMetric: metric ofAttribute: att forClass: aClass
	
	| probeName choice |
	probeName := metric , (Cormas upperCaseFirstChar: att asString) , 'Of'
		, aClass name , 's'.
	choice := Dialog
		choose:
			'The probe ' , probeName ,
					' will be added.
(' , att , ' has to be a number)'
		labels: (Array with: 'Confirm' with: 'Cancel' with: 'Edit probe name')
		values: #(#confim #cancel #changeName)
		default: #confirm
		for: Dialog defaultParentWindow.
	choice = #cancel ifTrue: [^nil].
	choice = #changeName
		ifTrue: [probeName := self requestProbeNameInitialAnswer: probeName].
	self cormasModel
		compile:
			(probeName asString , '\ "return the ' , metric , ' value of '
				, aClass name , ' ' , att , ' to be recorded" \^self ' , metric ,
					'OfAttribute: #' , att , ' of: ' , aClass name) withCRs
		classified: 'probes'
		notifying: nil.
	self listEntitiesChanged