+ control
stepSynchronouslyCA: t
	"Purpose: To active the transition function and to update synchronously a cellular automata
Example: See the models Conway http://cormas.cirad.fr/en/applica/conway.htm or Fire http://cormas.cirad.fr/en/applica/fireautomata.htm"
	
	self theESE do: [:a | a newState].
	self theESE do: [:a | a updateState]