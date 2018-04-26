+ activityDiagram - editor
openActivityDiagram: operationName
	"Purpose: to edit a given activity diagram 
Argument: operationName = <Symbol>
Example: CormasNS.Kernel.Agent openActivityDiagram: #exampleTest   "
	
	| ad |
	"le diagramme en m√©moire s'ouvre mais les activit√©s ne sont plus connect√©es. Il faut donc recr√©er"
	"self activityDiagrams removeKey: operationName ifAbsent: [nil]."
	ad := self getActivityDiagram: operationName.
	ad open.
	ad setTitle.	"le diagramme ouvert ne doit pas interf√©rer avec le diagramme utilis√© par l'agent qui tourne, donc on l'oublie (l'agent le recr√©era si besoin)"	"	self activityDiagrams removeKey: operationName ifAbsent: [nil]."
	^ad