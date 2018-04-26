- activityDiagram
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
					(ex isKindOf: MessageNotUnderstood)
						ifTrue:
							[^self cormas warn: 'No Activity Diagram found for <1p>' with:
									instanceOperationName]
						ifFalse:
							[(self class
								whichClassIncludesSelector:
									(self activitySelectorOf: instanceOperationName)) isNil
								ifTrue:
									[^self cormas warn: 'No Activity Diagram found for <1p>' with:
											instanceOperationName]
								ifFalse:
									[self
										refactorActivityDiagram:
											(self activitySelectorOf: instanceOperationName)
										forClass: self.
									(Cormas current
										confirm:
											'Bug in Activity Diagram '
												, (self activitySelectorOf: instanceOperationName) printString
												,
													'. 
The diagram has been refactored. 
Please try again?')
										ifTrue: [^self activityDiagramsAt: instanceOperationName]
										ifFalse: [^false]]]].
			self activityDiagrams at: instanceOperationName put: ad].
	^ad