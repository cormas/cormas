probes
basicReinsertProbesAndIndices: probesAndIndices into: probedMethod
	
	| probesInError |
	probesInError := OrderedCollection new.
	probesAndIndices
		do:
			[:ac | 
			| probe index newRecord |
			probe := ac key baseParent copy.
			index := ac value.
			newRecord := probedMethod probeRecordFor: (index to: index).
			probe record: newRecord.
			(probe updateTempVarIndexForMethod: probedMethod)
				ifTrue: [probedMethod addProbe: probe]
				ifFalse:
					[newRecord updateMethod: probedMethod.	"update mclass and selector for reporting"
					probesInError add: probe]].
	probesInError addAll: probedMethod recompileProbes.
	ProbedCompiledMethod reportOnFailedProbes: probesInError