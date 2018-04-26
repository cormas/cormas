+ utilities - string
println: aString
	"Purpose: A Java-like println method. Writes aString on the Transcript
Example: Cormas println: 'Hello World'   "
	
	(Cormas objectTypeAsString: aString) printOn: Transcript.
	Transcript
		flush;
		cr