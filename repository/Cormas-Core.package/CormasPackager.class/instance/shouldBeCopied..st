private
shouldBeCopied: aFilename
	"indicates if aFilename should be copied during the copyModelFiles step."
	
	| fn |
	fn := aFilename asString.
	('*.pcl' match: fn) ifTrue: [^false].
	('*.pst' match: fn) ifTrue: [^false].
	aFilename tail = 'video' ifTrue: [^false].
	^true