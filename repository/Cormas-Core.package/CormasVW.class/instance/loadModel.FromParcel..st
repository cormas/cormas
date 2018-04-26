model saving&loading
loadModel: aModelName FromParcel: parcelFileName
	"modelName = <String>; aFileName = <Filename>"
	
	| parcel |
	parcelFileName asFilename exists
		ifFalse:
			[self warn: 'No parcel in : ' , parcelFileName directory asString.
			^nil].
	parcel := Parcel parcelNamed: aModelName.
	parcel
		ifNotNil:
			[Notice
				show: 'Removing previous version... in progress'
				while:
					[parcel isLoaded
						ifTrue: [parcel unload]
						ifFalse: [parcel remove]]].
	CormasLauncher setCormasParcelPath.	"Il m'est arriv√© que le unload supprime le path vers vw/cormas/ !  ??"
	Notice
		show: 'Loading Model... in progress'
		while:
			[[parcel := Parcel loadParcelFrom: parcelFileName]
				on: OsError
				do:
					[:ex | 
					Dialog
						report:
							(#ErrorLoadingParcel1S << #dialogs >> 'Error loading parcel <1s>'
								expandMacrosWith: parcelFileName asString)
						withTextSignalledBy: ex]].
	self cormasModelClass: ((Models at: aModelName) at: aModelName asSymbol).	"Adapting the VW parcels path Settings"
	CormasLauncher setParcelPath: parcelFileName directory.
	self cormasModelClass initialize.
	self cormasModel: self cormasModelClass newSimulation.
	self updateModelToCurrentCormasVersion