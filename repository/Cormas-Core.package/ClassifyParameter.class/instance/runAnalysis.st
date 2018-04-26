actions_buttons
runAnalysis
	
	zeroError := nil.
	dataSaver isNil
		ifTrue:
			[self labelForProcess value:
					'Please, create a folder for the output files...'.
			Dialog
				warn:
					'All the output files will be saved in a single folder.\Please, create this folder ...'
						withCRs.
			self prepareFiles ifNil: [^nil]].	"Running the Standard analysis"
	(standardAnalysis filesExist
		and:
			[Dialog confirm:
					'	The standard analysis has already been done. 
Do you want to use the output files of this previous analysis 
and ignore this session (in order to speed up the analysis) ?'])
		ifFalse:
			[standardAnalysis openInterface: #runAnalysisWindow.
			self labelForProcess value: '1) standardAnalysis is running...'.
			standardAnalysis runSilently: true.
			standardAnalysis runAnalysis.
			standardAnalysis closeAndUnschedule].	"Running the analysis for modified parameters"
	self labelForProcess value:
			'2) standardAnalysis ended. Now Classifier Analysis is running...'.
	(self filesExist
		and:
			[Dialog confirm:
					'	The modified analysis has already been done. 
Do you want to use the output files of this previous analysis 
and ignore this session (in order to speed up the analysis) ?'])
		ifFalse:
			[self runSilently: true.
			super runAnalysis.
			self backToDefaultValues].	"calculate and store the Sensitivity"
	self labelForProcess
		value: 'Outputs: ' , self dataSaver directory asString.
	(dataSaver isKindOf: DataSaver_Excel) ifTrue: [dataSaver save].
	self calculateSensitivity.
	self runSilently: false.
	self simNumero: self simNumero + 1.
	self endAnalysis