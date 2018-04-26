+ control
stepAsynchronouslyCA: t
	"Purpose: To active the transition function and to update asynchronously a cellular automata"
	
	self theESE
		do:
			[:a | 
			a
				newState;
				updateState]