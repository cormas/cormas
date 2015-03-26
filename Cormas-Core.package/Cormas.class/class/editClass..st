util_files
editClass: aClass
	"open a RefactoryBrowser for aClass"
	"self editClass: AgentLocation"
	
	| browser |
	browser := RefactoringBrowser open.
	browser navigator selectClass: aClass.
	browser navigator beHierarchy.
	^browser