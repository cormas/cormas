Trait {
	#name : #TCMUIUtils,
	#category : #'Cormas-UI-Core'
}

{ #category : #accessing }
TCMUIUtils >> defaultWindowTitle [
	" Private - See superimplementor's comment "

	^ 'CORMAS'
]

{ #category : #accessing }
TCMUIUtils >> formattedWindowTitle [
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

{ #category : #accessing }
TCMUIUtils >> formattedWindowTitle: aTitleSting [
	" Answer a <String> suitable for sub-application window titles "

	^ String streamContents: [ : stream | 
		stream 
			<< 'CORMAS - ';
			<< aTitleSting;
			<< ' - ';
			<< self projectManager cormasModelName;
			<< ' (';
			<< self projectManager currentProjectVersion;
			<< ')' ]

]
