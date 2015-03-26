accessing
computeDefaultTargetFile
	"the complete path to the generated exe (directory + imageName + .exe) as a Filename"
	
	| dirName fileName |
	self currentModel
		ifNil:
			[dirName := 'model-version-user'.
			fileName := 'model-version-user.exe']
		ifNotNil:
			[:m | 
			dirName := '<1s>-<2s>'
				expandMacrosWith: m name
				with: m versionName.
			fileName := '<2s>.exe'
				expandMacrosWith: m name
				with: m versionName].
	^self basePackagingDirectory \ dirName \ fileName