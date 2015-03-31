actions_buttons
endAnalysis
	
	| msg |
	isAnalysisEnded := true.
	self simNumero: self simNumero - 1.
	msg := 'Analysis ended.\ \Output files have been saved into :\' withCRs.
	msg := msg , self dataSaver directory asString.
	msg := msg
		,
			('\\Information on current analysis are stored into '
				, self analysisSettingsFile , ' file.\') withCRs.
	self runSilently
		ifFalse:
			[(dataSaver isKindOf: DataSaver_Excel)
				ifTrue:
					[msg := msg , '\\            Open Excel files ? ' withCRs.
					(Dialog confirm: msg) ifTrue: [dataSaver displayFiles].
					dataSaver saveAndRelease]
				ifFalse: [Dialog warn: msg]].	"Cormas println: msg."
	self backToDefaultValues