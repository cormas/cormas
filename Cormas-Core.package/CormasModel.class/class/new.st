instance creation
new
	
	| sim |
	sim := super new.	"sim initialize.   d√©ja appel√© par new"	"self currentSimulation: sim.   Il ne faut pas affecter sim ici car ce #new peut √™tre appel√© √† l'ouverture de n'importe quelle interface. Ex: self class openWithSpec: #windowActividades	"
	^sim