util_export
silentlySaveParcel: aParcel
	"Save aParcel into model's directory. Erase previous version"
	
	| pfe pse parcelName |
	pfe := aParcel class fileExtension.
	pse := aParcel class sourceExtension.
	(parcelName := aParcel name) isNil
		ifTrue:
			[parcelName := self current request: 'Enter a name for the Parcel'].	"Adapting the VW parcels path Settings"
	CormasLauncher setParcelPathForModel: parcelName.	"Save the Parcel"
	aParcel
		parcelOutOn: ((Cormas modelPath: parcelName) construct: parcelName , pfe)
		withSource: ((Cormas modelPath: parcelName) construct: parcelName , pse)
		hideOnLoad: false
		republish: true
		backup: false