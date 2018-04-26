+ instance creation - groups
createN: n groups: classGroup from: aCollec
	"Purpose: Creates and returns n instances of classGroup. Each group is composed of X agents (X=aCollec size / n). The agents (included into aCollec) are randomly distributed into the groups
Example: self createN: 5 groups: Village from: self theIndividuals"
	
	| collection groupSize index newGroup groupsCollec |
	groupsCollec := OrderedCollection new.
	collection := Cormas mixt: aCollec.
	groupSize := (aCollec size / n) asInteger.
	index := 1.
	1
		to: n - 1
		do:
			[:i | 
			newGroup := self newEntity: classGroup.
			newGroup init.
			index
				to: groupSize * i
				do: [:j | newGroup addComponent: (collection at: j)].
			groupsCollec add: newGroup.
			index := groupSize * i + 1].
	newGroup := self newEntity: classGroup.
	newGroup init.
	index
		to: collection size
		do: [:j | newGroup addComponent: (collection at: j)].
	groupsCollec add: newGroup.
	^groupsCollec