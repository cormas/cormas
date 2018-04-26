instance creation
newOnFile: aFile
	
	| x stream line |
	x := super new initialize.
	x file: aFile.
	x fileAsString: aFile tail.
	aFile extension = '.st' ifTrue: [x typeAsString: 'ST'].
	aFile extension = '.pcl' ifTrue: [x typeAsString: 'Parcel'].
	x
		dateAsString:
			((aFile dates at: #modified) first printFormat: #(3 2 1 $- 1 1)).
	x shouldLoad: false.
	x typeAsString = 'ST'
		ifTrue:
			[stream := aFile readStream.
			[stream atEnd]
				whileFalse:
					[line := stream upTo: Character cr.
					(line indexOfSubCollection: '<Add-On-Name>' startingAt: 1) ~= 0
						ifTrue:
							[x
								nameAsString:
									(line
										copyFrom: (line indexOf: $>) + 1
										to: (line indexOfSubCollection: '</' startingAt: 1) - 1)].
					(line indexOfSubCollection: '<Add-On-Version>' startingAt: 1) ~= 0
						ifTrue:
							[x
								versionAsString:
									(line
										copyFrom: (line indexOf: $>) + 1
										to: (line indexOfSubCollection: '</' startingAt: 1) - 1)].
					(line indexOfSubCollection: '<Add-On-Author>' startingAt: 1) ~= 0
						ifTrue:
							[x
								authorAsString:
									(line
										copyFrom: (line indexOf: $>) + 1
										to: (line indexOfSubCollection: '</' startingAt: 1) - 1)].
					(line indexOfSubCollection: '<Add-On-Category>' startingAt: 1) ~= 0
						ifTrue:
							[x
								categoryAsString:
									(line
										copyFrom: (line indexOf: $>) + 1
										to: (line indexOfSubCollection: '</' startingAt: 1) - 1)].
					(line indexOfSubCollection: '<Add-On-Description>' startingAt: 1) ~= 0
						ifTrue:
							[x
								addOnDescription:
									(line
										copyFrom: (line indexOf: $>) + 1
										to: (line indexOfSubCollection: '</' startingAt: 1) - 1)]].
			stream close.
			x nameAsString
				ifNil:
					[x
						nameAsString:
							(x fileAsString
								copyFrom: 1
								to: x fileAsString size - 3)]].
	x typeAsString = 'Parcel'
		ifTrue:
			[x
				nameAsString:
					(aFile tail
						copyFrom: 1
						to: aFile tail size - 4)	"			x versionAsString: 
			x authorAsString: 
			x categoryAsString: 
			x addOnDescription: 			"].
	^x