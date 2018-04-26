- activityDiagram
activitySelectorOf: instanceSelector
	"Return the activity_selector name from #instanceSelector with 'activity_'.
	ex: Agent activitySelectorOf: #exampleTest     --> #activity_exampleTest"
	
	^(self preStringForActivitySelector , instanceSelector) asSymbol