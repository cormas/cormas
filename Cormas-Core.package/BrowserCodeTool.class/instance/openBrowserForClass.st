global variables
openBrowserForClass
	
	| binding |
	binding := self selectedVariableBinding.
	binding isNil ifTrue: [^self].
	(RefactoringBrowser open navigator)
		setBinding: binding;
		changed