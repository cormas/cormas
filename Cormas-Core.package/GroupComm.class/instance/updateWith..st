+ control
updateWith: aCollec
	"Purpose: get rid of dead components and add new ones"
	
	self updateAgents.
	self addComponents: aCollec