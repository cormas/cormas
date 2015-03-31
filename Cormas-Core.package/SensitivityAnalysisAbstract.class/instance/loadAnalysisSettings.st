save
loadAnalysisSettings
	
	| fileName fileContent aLine |
	fileName := Dialog
		requestFileName: 'Select a CSV file'
		default:
			((Cormas dataPath: self cormasModel class name) construct:
					'analysisSettings.csv').
	fileName = '' ifTrue: [^nil].
	fileName := fileName asFilename.
	fileContent := Cormas
		readMatrix: fileName
		sep: DataSaver_Asci separator.
	fileContent removeFirst.
	fileContent removeAllSuchThat: [:line | line isEmpty].
	aLine := fileContent
		detect: [:line | line first = 'Repetitions']
		ifNone: [nil].
	aLine isNil
		ifFalse:
			[self nbOfRepeat value: aLine last.
			fileContent remove: aLine].
	aLine := fileContent detect: [:line | line first = 'fixRandomSeed'].
	aLine last = 'no'
		ifTrue: [self fixRandomSeed value: false]
		ifFalse:
			[self fixRandomSeed value: true.
			self randomSeed value: aLine last].
	fileContent remove: aLine.
	aLine := fileContent detect: [:line | line first = 'releaseRandomSeed'].
	self releaseRandomSeed value: aLine last.
	fileContent remove: aLine.
	aLine := fileContent detect: [:line | line first = 'initMethod'].
	self initMethod value: aLine last.
	fileContent remove: aLine.
	aLine := fileContent detect: [:line | line first = 'stepMethod'].
	self stepMethod value: aLine last.
	fileContent remove: aLine.
	aLine := fileContent detect: [:line | line first = 'finalStep'].
	self finalStep value: aLine last.
	fileContent remove: aLine.
	self backToDefaultValues.	"set the values of attributes"
	self setCAVfrom: fileContent.	"refresh"
	self classAttribValue_List list: self classAttribValue_List list