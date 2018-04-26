util_parcels
displayLoadedParcels
	"Write the name of the loaded parcels on the Transcript"
	
	Parcel parcels do: [:p | Cormas println: p name]