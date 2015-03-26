probes
rearmOneshotProbes
	
	self probesToActUpon do: [:each | each isOneshot ifTrue: [each rearm]].
	self updateContents