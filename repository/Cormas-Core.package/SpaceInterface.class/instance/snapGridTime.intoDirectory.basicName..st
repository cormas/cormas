grid recorder
snapGridTime: t intoDirectory: directory basicName: aName
	"Creates a image file (.JPG) of the grid at time t, into the 'video' directory of the model.
t = time <Integer>; directory = <Filename>; aName = <String>"
	
	| filename num4 |
	t = 9999
		ifTrue:
			[(self cormas confirm: 'Hoops, what a huge movie !!!!!!... Continue ?')
				ifFalse: [^nil]].
	num4 := WriteStream on: (String new: 4).
	t printOn: num4 base: 10 digitsToPad: 4 highDigit: 4.
	filename := directory construct: aName , num4 contents , '.jpg'.
	self snapGridInJpgFile: filename