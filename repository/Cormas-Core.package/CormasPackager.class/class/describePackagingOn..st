description accessing
describePackagingOn: aTextStream
	
	| redStyle |
	redStyle := Array
		with: #underline
		with: #color -> ColorValue red.
	aTextStream
		emphasize: #bold;
		nextPutAll:
				'Packaging a Cormas installation for ' , self targetPublic , '.';
		deemphasize: #bold;
		crtab;
		nextPutAll:
				'Please, note that it is usually far better to package from a ';
		emphasize: redStyle;
		nextPutAll: 'fresh rebuilded';
		deemphasize: redStyle;
		nextPutAll: ' image.';
		crtab;
		nextPutAll:
				'This operation will produces a directory with an installation ready to copy and use.';
		cr;
		cr;
		emphasize: #bold;
		nextPutAll: 'In order to execute this procedure, you should : '