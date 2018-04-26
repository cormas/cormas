- activityEditor
activityDiagramsAt: instanceOperationName
	" (Entity activityDiagramsAt: #exampleTest) open   "
	
	| ad |
	ad := self activityDiagrams
		at: instanceOperationName
		ifAbsent:
			[ad := [self perform: (self activitySelectorOf: instanceOperationName)]
				on: Error
				do:
					[:ex | 
					^Cormas current warn: 'No Activity Diagram found for <1p>' with:
							instanceOperationName].
			self activityDiagrams at: instanceOperationName put: ad].
	^ad