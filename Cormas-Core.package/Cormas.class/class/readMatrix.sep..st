+ utilities - files
readMatrix: fileName sep: aSepChar
	"Returns a collection of collections (a Matrix), each one containing the values between the separator of the file.
	Example: file = 
		time;0;1;2;3;4;5;6;7;8;9;10;
		energy;50.0;48.1;47.5;46.5;46.2;44.2;44.4;44.9;45;46;	
	the Matrix = 
		OrderedCollection (	OrderedCollection ('time' 0 1 2 3 4 5 6 7 8 9 10) 
							OrderedCollection ('energy' 50.0 48.1 47.5 46.5 46.2 44.2 44.4 44.9 45 46)   )
The file name must be complete.
fileName = <String>
aSepChar = <Character> or <String>
Ex: Cormas readMatrix: 'D:\vw7.6\cormas\Models\Ecec\data\test.csv' sep: $;    or
Ex: Cormas readMatrix: 'D:\vw7.6\cormas\Models\Ecec\data\test.csv' sep: ';'   "
	
	| lines stream line sep subCollection matrix nbColumns |
	aSepChar isString
		ifTrue: [sep := aSepChar first]
		ifFalse: [sep := aSepChar].
	lines := OrderedCollection new.
	stream := fileName asFilename readStream.	"On devine le format des lignes"
	stream lineEndAuto.	" Lecture du fichier, ligne par ligne "
	nbColumns := 0.
	[stream atEnd]
		whileFalse:
			[line := Cormas splitLine: stream sep: sep.
			nbColumns < line size ifTrue: [nbColumns := line size].
			lines add: line].
	stream close.	"creates the Matrix"
	matrix := OrderedCollection new.
	lines
		do:
			[:aLine | 
			"coll removeAllSuchThat:[:x| x isEmpty]."
			subCollection := OrderedCollection new.
			aLine do: [:x | subCollection add: (Cormas stringAsObjectType: x)].
			[subCollection size < nbColumns] whileTrue: [subCollection add: nil].
			matrix add: subCollection].
	^matrix