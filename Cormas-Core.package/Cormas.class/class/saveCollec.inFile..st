deprecated
saveCollec: t1 inFile: t2
	"Deprecated. Should use CormasModel updateFile: t1 dataCollection: t2 separator: t3"
	
	| t3 |
	t3 := t2 asFilename appendStream.
	t1 do: [:t4 | t3 nextPutAll: t4 printString , ';'].
	t3 nextPutAll: '\' withCRs.
	t3 close.
	^self