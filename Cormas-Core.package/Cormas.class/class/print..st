+ utilities - string
print: aString
	"Purpose: A Java-like print method. Writes aString on the Transcript Withour carriage return.
Example: Cormas print: 'Hello World'   "
	
	(Cormas objectTypeAsString: aString) printOn: Transcript.
	Transcript flush