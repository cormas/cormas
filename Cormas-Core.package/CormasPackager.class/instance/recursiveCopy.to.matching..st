private
recursiveCopy: sourceFilename to: targetDirectory matching: matchingBlock
	"recursivly copy the sourceFilename into the targetDirectory for filenames which matchingBlock return true.
		CormasPackager new recursiveCopy: 'c:\path\to\mydir' asFilename to: 'c:\tmp' asFilename matching: [:fn | true ]
	Be carefull, the result will be c:\tmp\mydir
	This method accepts file or diretory as sourceFilename
	Caution : This has no been tested for special files nor access rights
	"
	
	| target |
	target := targetDirectory \ sourceFilename tail.
	(matchingBlock value: target) ifFalse: [^self].
	sourceFilename isDirectory
		ifTrue:
			[target ensureDirectory.
			sourceFilename directoryContents
				do:
					[:each | 
					self
						recursiveCopy: sourceFilename \ each
						to: target
						matching: matchingBlock]]
		ifFalse: [sourceFilename copyTo: target]