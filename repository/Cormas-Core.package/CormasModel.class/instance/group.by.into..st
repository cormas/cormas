deprecated
group: aCollec by: n into: aGroupClass
	"Creates and returns n instances of classGroup. Each group is composed of X agents (X=aCollec size / n). The agents (included into aCollec) are randomly distributed into the groups"
	
	^self create: n groups: aGroupClass from: aCollec