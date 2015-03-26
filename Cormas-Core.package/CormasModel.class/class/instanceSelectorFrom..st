- activityEditor
instanceSelectorFrom: activity_selector
	"Return the selector name from #activity_selector without 'activity_'.
	ex: Agent instanceSelectorFrom: #activity_bidon     --> #bidon"
	
	^(activity_selector
		copyFrom: self preStringForActivitySelector size + 1
		to: activity_selector size) asSymbol