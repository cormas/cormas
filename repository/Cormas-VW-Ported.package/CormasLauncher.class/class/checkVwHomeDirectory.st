settings
checkVwHomeDirectory
	"Set VISUALWORKS home to DISK/vw/"
	
	| VISUALWORKSpath |
	VISUALWORKSpath := (SystemUtils
		getEnvironmentVariable: 'VISUALWORKS'
		ifAbsent: [Filename defaultDirectoryName]) asFilename.
	VISUALWORKSpath tail = 'cormas'
		ifTrue:
			[SystemUtils
				setEnvironmentVariable: 'VISUALWORKS'
				value: VISUALWORKSpath directory asString.
			VISUALWORKSpath := (SystemUtils getEnvironmentVariable: 'VISUALWORKS')
				asFilename].
	^VISUALWORKSpath	"	| whatIsSet directories newSetting |
	whatIsSet := SystemUtils getEnvironmentVariable: 'VISUALWORKS'
				ifAbsent: [nil].
	whatIsSet notNil 
		ifTrue: 
			[directories := whatIsSet tokensBasedOn: Filename separator.
			('cormas' match: directories last) 
				ifTrue: 
					[directories remove: directories last.
					newSetting := directories first.
					2 to: directories size
						do: 
							[:i | 
							newSetting := newSetting , Filename separator asSymbol asString 
										, (directories at: i)].
					(newSetting asFilename definitelyExists 
						and: [newSetting asFilename isDirectory]) 
							ifTrue: 
								[SourceFileManager default close.
								SystemUtils setEnvironmentVariable: 'VISUALWORKS' value: newSetting.
								ObjectMemory snapshot]]] "