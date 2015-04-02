deprecated
updateFile: t1 dataCollection: t2 separator: t3
	"Deprecated. Should use CormasModel updateFile: t1 dataCollection: t2 separator: t3"
	
	| t4 t5 t6 t7 |
	t5 := t3 asSymbol asString.
	t4 := t1 appendStream.
	t6 := 1.
	t7 := t2 size - 1.
	[t6 <= t7]
		whileTrue:
			[t4 nextPutAll: (t2 at: t6) printString , t5.
			t6 := t6 + 1].
	t4 nextPutAll: t2 last printString.
	t4 nextPutAll: '\' withCRs.
	t4 close.
	^self