save
prepareFiles
	
	| directory dico |
	directory := self setDirectory.
	directory ifNil: [^nil].
	self fileFormat value = #csv
		ifTrue:
			[dataSaver := DataSaver_Asci newOnFolder: directory model: cormasModel].
	self fileFormat value = #excel
		ifTrue:
			[dataSaver := DataSaver_MultiFilesExcel newOnFolder: directory model:
					cormasModel].
	self fileFormat value = #access ifTrue: [self halt].
	dico := Dictionary new.
	self listProbes selections
		do:
			[:c | 
			dico
				at: (c tokensBasedOn: $>) last asSymbol
				put: nil].
	dataSaver probes: dico.
	self dataSaver timeSteps: self timeSteps.	"'time series' ; 'last value' ; 'average per simulation' ;  'average on period...' ;  'averaged over repetitions' ."
	self filesExist ifTrue: [self filesExist: self hasAlreadySavedTheFiles].
	self initFiles