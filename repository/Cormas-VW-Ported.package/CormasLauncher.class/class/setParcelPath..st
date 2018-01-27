settings
setParcelPath: aDirectory
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