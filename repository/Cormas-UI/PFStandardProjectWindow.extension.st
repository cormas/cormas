Extension { #name : #PFStandardProjectWindow }

{ #category : #'*Cormas-UI' }
PFStandardProjectWindow >> formattedWindowTitle [
	" Answer a <String> suitable for sub-application window titles "

	^ String streamContents: [ : stream | 
		stream 
			<< self defaultWindowTitle;
			<< ' - ';
			<< self projectManager cormasModelName;
			<< ' (';
			<< self projectManager currentProjectVersion;
			<< ')' ]

]
