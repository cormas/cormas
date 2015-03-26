deprecated
update: aCollec with: newCollec
	"DEPRECATED. You should rather use newAndCollect to create and collect new entities"
	
	| theDeadAgents |
	theDeadAgents := aCollec select: [:a | a dead].
	theDeadAgents
		do:
			[:a | 
			(self class occupantClasses includes: a class) ifTrue: [a leave].
			aCollec remove: a].
	aCollec addAll: newCollec