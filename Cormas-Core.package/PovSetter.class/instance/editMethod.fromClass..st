action
editMethod: aSelector fromClass: aClass
	
	| browser |
	browser := RefactoringBrowser open.
	browser navigator selectClass: aClass.
	browser navigator beHierarchy.
	browser navigator setSelector: aSelector