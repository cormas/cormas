instance creation
onEntities: aCollec
	
	^aCollec collect: [:e | self on: e]