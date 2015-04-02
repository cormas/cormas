private_aleat
initRandomSeed
	"Release the randomSeed. 
For example, if the initilizations of the simulations were done with fixed random seed (identical initial state for each simulation), then with #initRandomSeed called after initilization, the  simulations may be different"
	
	seed := nil.
	Rand := nil