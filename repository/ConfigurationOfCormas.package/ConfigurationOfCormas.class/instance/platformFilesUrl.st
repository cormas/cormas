doits
platformFilesUrl
	" Private - See superimplementor's comment "

	| urlPrefix |
	urlPrefix := 'https://github.com/hernanmd/cormas/raw/master/resources/'.
	^ #('CORMAS_Graphics' 'CORMAS_Models' 'CORMAS_Installer_Bootstrap') collect: [ : file |
		(String streamContents: [ : stream |		
			stream
				nextPutAll: urlPrefix;
				nextPutAll: file;
				nextPutAll: (Smalltalk os isWin32 ifTrue: [ '.zip' ] ifFalse: [ '.tar.gz' ]) ]) ]