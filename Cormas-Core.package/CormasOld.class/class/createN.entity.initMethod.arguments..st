as yet unclassified
createN: t1 entity: t2 initMethod: t3 arguments: t4 

	| t5 t6 t7 |
	t6 := OrderedCollection new.
	t7 := 1.
	[t7 <= t1]
		whileTrue: 
			[(t5 := t2 new) perform: t3 withArguments: t4.
			t6 add: t5.
			t7 := t7 + 1].
	^t6