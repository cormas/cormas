model saving&loading EV
loadOldImageOf: entity line: line
	
	| lw nbs t rm ev colR colG colB aNewImage |
	lw := line upTo: Character space.
	lw = 'figurine' ifTrue: [^nil].
	lw := lw asNumber.
	nbs := (line upTo: Character space) asNumber.
	t := (line upTo: Character space) asNumber.	"?"
	rm := (line upTo: Character space) asNumber.
	ev := (line upTo: Character space) asBoolean.
	colR := (line upTo: Character space) asNumber.
	colG := (line upTo: Character space) asNumber.
	colB := (line upTo: Character space) asNumber.
	aNewImage := VectorialElementaryPOV new.
	aNewImage lineWidth: lw nbSegments: nbs sizeRatio: t ev: ev colR: colR
		colG: colG colB: colB.	"load image (old format) as a VectorialPov of the entity"
	entity povDict
		at: entity name
		put: aNewImage.	"set image (old format) as a the defaultImage of the entity"
	entity class
		compile:
			('defaultImage' ,
					'\"defaultImage adapted for Cormas versions previous to 2010. Returns a copy of the POV image stored in the povDict of the class at a specifed symbol key"\^((self povDict keys includes: #'
				, entity name , ') ifTrue:[self povDict at:#' , entity name ,
					'] ifFalse:[super defaultImage]) copy') withCRs
		classified: 'image'
		notifying: nil