private
copyVMFiles
	"copy the vm and its dll. The vm is renamed for an automatic loading of the corresponding image.
	manage the special case of the modeler environment (not a fully vw installation)"
	
	| winDir aFilename targetDir exeFile junQTDir |
	aFilename := self targetFile.
	targetDir := aFilename directory.
	targetDir ensureDirectory.
	Cormas isModelerMode
		ifTrue:
			[exeFile := CEnvironment commandLine first asFilename.
			winDir := exeFile directory.
			exeFile copyTo: aFilename.
			junQTDir := winDir]
		ifFalse:
			[winDir := '$(VisualWorks)\bin\win' asLogicalFileSpecification asFilename.
			winDir \ 'vwnt.exe' copyTo: aFilename.
			junQTDir := '$(VisualWorks)\contributed\Jun\Jun569WinQT'
				asLogicalFileSpecification asFilename].
	winDir \ 'vwntoe.dll' copyTo: targetDir \ 'vwntoe.dll'.
	winDir \ 'linkmaster.dll' copyTo: targetDir \ 'linkmaster.dll'.
	junQTDir \ 'JunWinQT.dll' copyTo: targetDir \ 'JunWinQT.dll'