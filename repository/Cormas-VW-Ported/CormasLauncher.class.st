Class {
	#name : #CormasLauncher,
	#superclass : #UIApplicationModel,
	#classInstVars : [
		'theVisualLauncher'
	],
	#category : 'Cormas-VW-Ported'
}

{ #category : #settings }
CormasLauncher class >> adaptSettings [
	"self adaptSettings   (called from the ''postLoadActions'') "
	
	self checkVwHomeDirectory.
	self setMessagesPath.
	self setSourceFilePath.
	self setCormasParcelPath.
	self setParcelPathForModels
]

{ #category : #settings }
CormasLauncher class >> checkVwHomeDirectory [
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
]

{ #category : #resources }
CormasLauncher class >> cormasEn [
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 13 @ 11
				depth: 2
				bitsPerPixel: 2
				palette:
					(MappedPalette
						withColors:
							((Array new: 3)
								at: 1
									put: ColorValue red;
								at: 2
									put: ColorValue blue;
								at: 3
									put: ColorValue white;
								yourself))
				usingBits:
					#[37 98 85 0 73 98 84 128 82 98 82 64 84 162 73 64 85 34 42 128 0 0 0 0 170 2 21 64 88 98 133 64 97 98 97 64 133 98 88 64 21 98 86 0])
]

{ #category : #resources }
CormasLauncher class >> cormasFr [
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 11 @ 8
				depth: 2
				bitsPerPixel: 2
				palette:
					(MappedPalette
						withColors:
							((Array new: 3)
								at: 1
									put: ColorValue blue;
								at: 2
									put: ColorValue red;
								at: 3
									put: ColorValue white;
								yourself))
				usingBits:
					#[0 169 84 0 0 169 84 0 0 169 84 0 0 169 84 0 0 169 84 0 0 169 84 0 0 169 84 0 0 169 84 0])
]

{ #category : #init }
CormasLauncher class >> launchCormas [
	"self launchCormas"
	
	Cormas openEn
]

{ #category : #init }
CormasLauncher class >> loadLocaleFile [
	"FILE_IN de Locale.st, car la parcellisation de Locale provoque au chargement un plantage complet de VW5 ! (???)"
	
	| stFileName |
	stFileName := Cormas cormasPath construct: 'Kernel'.
	stFileName := stFileName construct: 'Locale.st'.
	(stFileName asFilename withEncoding: #Source) fileIn
]

{ #category : #settings }
CormasLauncher class >> setCormasParcelPath [
	"Add the Parcel paths : $(VISUALWORKS)/cormas/ "
	
	| parcelPath fileSeparator |
	fileSeparator := String with: Filename separator.
	parcelPath := ('$(VISUALWORKS)' , fileSeparator , 'cormas') asFilename.	"ex: a NTFSFilename('$(VISUALWORKS)\cormas')"	"parcelPath := (SystemUtils getEnvironmentVariable: 'VISUALWORKS') asFilename construct: 'cormas'.   ex: a NTFSFilename('d:\vw7.3nc\cormas')"
	self setParcelPath: parcelPath
]

{ #category : #settings }
CormasLauncher class >> setMessagesPath [
	"Add Messages path"
	
	| messagePath fileSeparator |
	fileSeparator := String with: Filename separator.
	messagePath := '$(VISUALWORKS)' , fileSeparator , 'cormas' , fileSeparator
		, 'Messages'.
	((UISettings preferenceModelFor: #messagesListEditing) value includes:
			messagePath)
		ifFalse:
			[(UISettings preferenceModelFor: #messagesListEditing) value
				add: messagePath asString.
			UISettings messagesAccept]
]

{ #category : #settings }
CormasLauncher class >> setParcelPath: aDirectory [
	"Add aDirectory to the Parcel paths
	aDirectory = <Filename> "
	
	| list |
	"((UISettings preferenceModelFor: #parcelPathEditing) value "
	((UISettings preferenceModelFor: #parcelPath) value includes: aDirectory)
		ifFalse:
			[(UISettings preferenceModelFor: #parcelPath) value add: aDirectory.	"UISettings parcelPathAccept"	"ne marche pas..."
			list := (UISettings preferenceModelFor: #parcelPath) value.
			(UISettings preferenceModelFor: #parcelPath) value: list.
			SequenceSettingPage new accept]
]

{ #category : #settings }
CormasLauncher class >> setParcelPathForModel: aModelAsString [
	"Add Parcel path"
	
	| aPath |
	aPath := Cormas modelPath: aModelAsString.
	self setParcelPath: aPath
]

{ #category : #settings }
CormasLauncher class >> setParcelPathForModels [
	"Add the Parcel paths :  $(VISUALWORKS)\cormas\Models\*"
	
	| parcelPath fileSeparator |
	fileSeparator := String with: Filename separator.
	parcelPath := '$(VISUALWORKS)' , fileSeparator , 'cormas' , fileSeparator
		, 'Models' , fileSeparator , '*' , fileSeparator.	"pourquoi le parcelManager (touche F3) ne les voit pas ???"
	parcelPath := (((SystemUtils getEnvironmentVariable: 'VISUALWORKS')
		asFilename construct: 'cormas') construct: 'Models') construct: '*'.	"le pb de cette ligne c est qu'elle met le chemin en dur = d:\vw7.3nc\cormas\Models\* "
	self setParcelPath: parcelPath asFilename
]

{ #category : #settings }
CormasLauncher class >> setSourceFilePath [
	"Add the Source paths : $(VISUALWORKS)/cormas/cormas.cha "
	
	| sourcePath fileSeparator |
	fileSeparator := String with: Filename separator.
	sourcePath := '$(VISUALWORKS)' , fileSeparator , 'cormas' , fileSeparator
		, Cormas cormasName , '.cha'.
	((UISettings preferenceModelFor: #sourcesEditing) value includes:
			sourcePath)
		ifFalse:
			[(UISettings preferenceModelFor: #sourcesEditing) value
				add: sourcePath asString]
]

{ #category : #acces }
CormasLauncher class >> theVisualLauncher [
	
	^theVisualLauncher
]

{ #category : #acces }
CormasLauncher class >> theVisualLauncher: aVisualLauncher [
	
	theVisualLauncher := aVisualLauncher
]

{ #category : #'interface specs' }
CormasLauncher class >> windowSpec [
	"Tools.UIPainter new openOnClass: self andSelector: #windowSpec"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#label: 'Cormas Launcher' 
			#min: #(Point 185 126) 
			#max: #(Point 185 126) 
			#bounds: #(Rectangle 640 427 825 553)) 
		#component: #(SpecCollection 
			#collection: #(#(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(Rectangle 106 84 143 113) 
				#name: #ActionButton1 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white)) 
				#model: #launchCormasInFrench 
				#helpText: 'Ouvrir Cormas en Francais' 
				#label: #cormasFr 
				#hasCharacterOrientedLabel: false 
				#style: #small) #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(Rectangle 106 42 143 71) 
				#name: #ActionButton2 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white)) 
				#model: #launchCormasInEnglish 
				#helpText: 'Open Cormas in English' 
				#label: #cormasEn 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(LabelSpec 
				#layout: #(Point 8 2) 
				#name: #Label1 
				#label: 'Open Cormas' 
				#style: #large) #(LabelSpec 
				#layout: #(Point 19 47) 
				#name: #Label2 
				#label: 'in English') #(LabelSpec 
				#layout: #(Point 19 89) 
				#name: #Label3 
				#label: 'en Francais'))))
]

{ #category : #actions }
CormasLauncher >> launchCormas [
	
	Cormas openEn
]

{ #category : #actions }
CormasLauncher >> launchCormasInEnglish [
	
	Cormas openCormasEn.
	self closeRequest
]

{ #category : #actions }
CormasLauncher >> launchCormasInFrench [
	
	Cormas openCormasFr.
	self closeRequest
]
