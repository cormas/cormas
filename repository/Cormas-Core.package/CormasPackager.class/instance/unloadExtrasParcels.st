private
unloadExtrasParcels
	"unload undesired parcels"
	
	self extraParcelsNamesToUnload
		do: [:each | Parcel unloadParcelNamed: each]