deprecated
initFile: t1 dataCollection: t2 separator: t3
	"Deprecated. Should use CormasModel initFile: t1 dataCollection: t2 separator: t3"
	
	t1 exists ifTrue: [t1 delete].
	self updateFile: t1 dataCollection: t2 separator: t3.
	^self