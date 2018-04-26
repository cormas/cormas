accessing
computeDefaultTargetFile
	"the complete path to the generated exe (directory + imageName + .exe) as a Filename"
	
	| dirName fileName version |
	version := Cormas versionAsString.
	dirName := 'cormas-<1s>-modeler' expandMacrosWith: version.
	fileName := 'cormas-<1s>-modeler.exe' expandMacrosWith: version.
	^self basePackagingDirectory \ dirName \ fileName