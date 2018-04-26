+ utilities - string
objectTypeAsString: anObject
	"Purpose: convert anObject as a String.
Examples: 
	Cormas objectTypeAsString: 12.3 => '12.3'
	Cormas objectTypeAsString: true => 'true'
	Cormas objectTypeAsString: #truc => 'truc' 
	Cormas objectTypeAsString: 'world' 'world' => 'world'  "
	
	
	^anObject asString