private
getColorForPov: aSelectorName
	"Returns a Color according to the POV (aSelectorName).
aSelectorName = <Symbol>.
A color may be define to see an entity on the grid but also on another space (ex: communication space)"
	
	self color: (self entity getColorForPov: aSelectorName).
	^self color