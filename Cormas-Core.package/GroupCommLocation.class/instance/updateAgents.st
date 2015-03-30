+ control
updateAgents
	"Purpose: get rid of dead components"
	
	| theDeadAgents |
	theDeadAgents := self components select: [:a | a dead].
	theDeadAgents
		do:
			[:a | 
			a patch notNil ifTrue: [a leave].
			self deleteComponent: a]