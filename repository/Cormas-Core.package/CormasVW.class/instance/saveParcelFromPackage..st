model saving&loading
saveParcelFromPackage: aPackage
	"Save aParcel into model's directory. Erase previous version"
	
	| aParcel pcl pst fileName |
	aParcel := aPackage asParcel.
	pcl := aParcel class fileExtension.
	pst := aParcel class sourceExtension.
	fileName := self prepareSavingAs: pcl.
	fileName ifNil: [^nil].	"Adapting the VW parcels path Settings"
	CormasLauncher setParcelPath: fileName directory.	"Save the Parcel"
	aParcel
		parcelOutOn: fileName
		withSource:
			((Cormas removeExtensionOf: fileName) asString , pst) asFilename
		hideOnLoad: false
		republish: true
		backup: false