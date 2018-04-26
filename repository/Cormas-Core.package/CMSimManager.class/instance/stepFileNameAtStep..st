replay-private
stepFileNameAtStep: aTimeStep
	"return a string for the file, with its extension. 
	aTimeStep: <Integer>
	Example:   stepFileNameAtStep: 22 =>   'step_22.bos'   "
	
	^self stepNameStart , aTimeStep printString , self class bosExtension