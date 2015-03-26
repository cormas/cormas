probes
probesToActUpon
	
	| probedMethod victims |
	probedMethod := self selectedMethod.
	probedMethod isProbed ifFalse: [^#()].	"Give precedence to selected probes"
	victims := self selectedProbes.
	victims isEmpty ifFalse: [^victims].	"If we have no selection, give probes *near* the cursor a chance, choose the closest."
	victims := self probesNearCursor.
	victims isEmpty ifFalse: [^victims].	"OK, just return 'em all then."
	^self allMethodProbes