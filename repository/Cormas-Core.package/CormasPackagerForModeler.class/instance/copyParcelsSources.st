private actions
copyParcelsSources
	"copy all neededs parcels source and change the location to a relative one"
	
	| mgr targetDir |
	mgr := SourceFileManager default.
	targetDir := self targetFile directory \ 'parcels'.
	targetDir ensureDirectory.
	mgr allFiles
		keysAndValuesDo:
			[:i :each | 
			(self shouldBeCopiedSource: each)
				ifTrue:
					[each copyTo: targetDir \ each tail.
					mgr
						file: i
						name: 'parcels\' , each tail
						writable: false]]