util_parcels
CormasParcelsOnly
	"return a collection with the name of the Cormas loaded parcels"
	"Cormas CormasParcelsOnly"
	
	| parcels |
	parcels := Parcel parcelNames copy.
	self VisualncLoadedParcels
		do:
			[:aParcel | 
			parcels
				remove: aParcel
				ifAbsent: [nil]].
	^parcels