- activityDiagram
getActivityDiagram: operationName
	"Purpose: return an activity diagram from operationName symbol.
Argument: operationName = <Symbol>
Example: CormasNS.Kernel.Agent getActivityDiagram: #exampleTest   "
	
	| ad |
	ad := [self perform: (self activitySelectorOf: operationName)]
		on: Error
		do:
			[:ex | 
			| s |
			(ex isKindOf: MessageNotUnderstood)
				ifTrue:
					[^self cormas warn: 'No Activity Diagram found for <1p>' with:
							operationName].
			s := self activitySelectorOf: operationName.
			(self class whichClassIncludesSelector: s)
				ifNil:
					[^self cormas warn: 'No Activity Diagram found for <1p> ' with:
							operationName].
			self refactorActivityDiagram: s forClass: self.
			^(self cormas confirm:
					'Bug in Activity Diagram <1p><n>The diagram has been refactored. <n>Please try again?'
				with: s)
				ifTrue: [self getActivityDiagram: operationName]
				ifFalse: [false]].
	^ad