+ user interface
timeStepWithUnit
	"return a String describing the current time + the time unit name.
the modelers may redefine timeUnitName.
Ex: 
timeUnitName
	^'days'     "
	
	^self timeStep printString , ' ' , self timeUnitName