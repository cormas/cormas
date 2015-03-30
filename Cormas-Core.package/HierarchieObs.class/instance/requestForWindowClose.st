actions
requestForWindowClose
	
	super requestForWindowClose ifTrue: [appelant actionCloseHierarchie].
	^super requestForWindowClose