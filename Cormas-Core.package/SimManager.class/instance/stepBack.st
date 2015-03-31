replay-backward
stepBack
	"Replay a step backward using BOS file"
	
	self currentTime <= 0 ifTrue: [^false].
	^self restoreOrganizationAt: self currentTime - 1