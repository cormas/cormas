Class {
	#name : #CMIconCache,
	#superclass : #Object,
	#classVars : [
		'IconCache'
	],
	#category : #'Cormas-UI-Spec2-ProjectBrowser'
}

{ #category : #'private - contents' }
CMIconCache class >> driveIcon [
	<script: 'self driveIcon inspect'>

	^ self iconNamed: #driveIcon
]

{ #category : #'private - contents' }
CMIconCache class >> driveIconContents [

	^'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAA/0lEQVQ4je2RPUoDcRDFf7tI
mjSbE5gUYhoFjSvYSI5i4QFSWHgYIQewELyFX4mF4BfqqmhlSJotdve/8yySbEwhrq34YJjH
K2bem4F//AF4U/IYvdYl9c0UmAwzw0zIZvyL3thsrUYA/myU1wWCkou7U+IDRC9vHQ/av3De
Pjm/3Cki9K9uh3c314GZTWwKyZCETOOOkAAEgqXl5mh7a6O2ADAYfATHR4ckSUKapkVlWYZz
DucceZ4Tr8VUTitIorO3H8zf4Af4LZ/wICQO43m97AC7MHq7Papn1TndA7h/fh9GTw9B8TZZ
kd007kzugEASi/XGaH2lWStr4Ft8AlWZooQwDP14AAAAAElFTkSuQmCC'
]

{ #category : #'private - contents' }
CMIconCache class >> iconCache [

	^ IconCache ifNil: [ IconCache := Dictionary new ]
]

{ #category : #accessing }
CMIconCache class >> iconNamed: aSymbol [
	"Returns the icon with the given name"
	
	| selector |
	selector := (aSymbol , 'Contents') asSymbol.
	(self class canUnderstand: selector) ifFalse: [ ^super iconNamed: aSymbol ].
	^ self iconCache
		at: aSymbol
		ifAbsentPut: [ Form fromBinaryStream: (self perform: selector) base64Decoded readStream ]
]

{ #category : #'private - contents' }
CMIconCache class >> imageIcon [

	<script: 'self imageIcon inspect'>

	^ self iconNamed: #imageIcon
]

{ #category : #'private - contents' }
CMIconCache class >> imageIconContents [
	^'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAuklEQVR4XmOgJrAH4noyMBzUOzTc/k8KVnDI/Q/XrB9Q+58ULK5hBzcA5Iz9pBoAwmADInLr/2+4/Z8kDNKDYQCIJtYwrAbUpwiBMUUu8I7NJd8AXLhlyf7/Omb2xBkAUgzCyHxFPdH/LTvD/vumhuI3oGTCiv/JXQ5gDDMood0OrBmGYYbADBBQMIMYAHIiWCNUoVOMNgof3RCYAbBUSLRmGAZ5C54PgJyTIE0gDJIAYRgfF4YaQB0AAC/AAK2rpwvdAAAAAElFTkSuQmCC'
]

{ #category : #'private - contents' }
CMIconCache class >> propertiesIcon [
	<script: 'self propertiesIcon inspect'>

	^self iconNamed: #propertiesIcon
]

{ #category : #'private - contents' }
CMIconCache class >> propertiesIconContents [

	^'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAACjElEQVR42o2SW0hUURSG/32O
hnhAqJDCzF6kN0lLGtJCtLQyKIMotRjBy1sqVEZS9mKZBdKFHBJpJEKD0urBvAchhqY5kp6M
HkRlMhpHR2fOHuZybu3KxhEr+/fL3g/rWx9rL4Kl1La+ta0XwiNUTVf9sgJF0yB5FVCfAqt9
Lnx8yt7Ph4Qc6btVtIigkN+XJ28s9MTeHQLPETipF3aXB7NOJ2wLXnyamYVlwgq/jN5Fj+9Q
X3WhZxXg8ethmpMSzwA666rDxSBOKsHhViBa7XC5ndgWuRH1PSP9XlnJZJDFFYBHXe/p6bQE
IanoGTZECJDhh98jg6gc5ue+oqwkBXlp8TB3WfBiYLx3yuYwiqbS6QDA3DVEjWk7BZ7n8Kc0
9IzAEBsFm+RG6+BndFsmhsdMxYkBwIO2d7QwI1HIrmgH0XmEMo7MA5qiQ9PZQF0SrDNOpBq2
YPPWcLT0i+KYqTQuALjzvJeePZr8V4Nf0fHF4cD49DzKHnaKo7Uly4Cqpg568WS6kH21GxpR
EIZQEKKxEo4ZaXDJfrgWJBwwxGBPfDTONbxigOJlQLm5jVYaD65hAHgUP77ZKY5fbxI/BAPO
m9vpTWOGkH2lExzHIKwrYYcnPNQwnhnpkKjGukciddcm5N9tFkdNJasBaxnouo5J2wKOVTaK
YjDggrmDVhvThVOX2S9wPOu8tGnk5+zAMRPqk7HfEI2kuEjk32tmvxAEKK1rpTUFh9c00JjB
FDPIYgYrAAW3W2hdcZaQU9GGdWwJOMIFCnRNxY+X5FaxLyEK6ckxOFPzdCUg90YjbbyUK+A/
Mk89yCyvFwfvBy1SbF6VLWF7TIRPUdV/FRNNh6qowsDHyaG5l9d2fwfyXD4gAGnljAAAAABJ
RU5ErkJggg=='
]

{ #category : #'private - contents' }
CMIconCache class >> reset [
	"Reset the icon cache"	
	<script>
	
	IconCache := nil
]

{ #category : #'private - contents' }
CMIconCache class >> simulationContents [
	^'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAABOklEQVR4XmP4//8/w38kfP7kBfv5UxbW48L/0dQzoAtkRuT8Byr8v3TW8v8/fv78/+nz5/9AQ8FiM/tm/0c3BMOAyR1T/8MASBMIgwwAAZBhGAaAnFzU2LMf2QCQhiOeQf/3Tp8P1ghiT0sqQDFg0fbdYC8xAIkc90kT/6O74PS8ZXCbYWxkA5bcvFoPshgecOgGwPwNw+hegOnBGwboAGsYoBsADOn9yDYj42ndM78AbdbBaQDIWZtWbsZpABD/XYDPBfu2769Hj0L0qISGB6oBMH/du3UPbEB207z/0+78wsBIAQp2LQiDNfvt3/of2QCfspn/Iw9/wMDIBiy5dbXevbga4oz8qtb9pBowf8OWerALkP0DM8DCLf2/QUoPBkY2AGsgwgzAB/AasGvznnpQQsKHQbkVWQ8A0kX714lob34AAAAASUVORK5CYII='
]

{ #category : #'private - contents' }
CMIconCache class >> simulationIcon [
	<script: 'self simulationIcon inspect'>

	^self iconNamed: #simulationIcon
]

{ #category : #'private - contents' }
CMIconCache class >> worldIcon [

	<script: 'self worldIcon inspect'>

	^ self iconNamed: #worldIcon
]

{ #category : #'private - contents' }
CMIconCache class >> worldIconContents [
	^'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAABiUlEQVR4XmPAAeyBuJ5BT3KRgJHyHTAbggkCe6Cm/Qwqdv+5PQr+G83I+i8RV/BfecU/MAbK/cdnkD1Dt89/gX0F/8WTHcEaBEMb4Zql6vb9Z2j3+u98uu8/0FX7sWpm2JX23+5UN9hmoCK4ZrBhIfX/2XdngQ3ANATkbKBm9SO1cAUgDegGgNQoHqr6b3SsBWwJNKyABNDPIEnlgnCwQpBzkTUjGwLDYBeDLAYHSs7O/4pTEsAGYNOIDTPEGv8XSLQFukLFbgHj5F//GTRcwM5STHXH8D8yBrlOMiYZrFazLgJogGftTZABQnP/gDWD/A8zSKpmD1abQeEAUme9qfY/2AvoBsAwttjgiIgEhxdIHqQebgDnjN9g56Ebgi060Q0AeeM/yBDpxX/BCmCatfrbsIYBKAZA3kBOlXBXwAwAOR89LaB4I0z/P2paVLHbDzJEZD4kLDQ7a/HGBCwRYRjCkLf7v4Cpxn/FhplYNQv4l+PQjJwvQAYBw0Uwde5/mb6biNSHJScCAA5swgUeRam+AAAAAElFTkSuQmCC'
]
