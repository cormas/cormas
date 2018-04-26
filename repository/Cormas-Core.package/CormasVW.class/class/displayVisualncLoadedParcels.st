util_parcels
displayVisualncLoadedParcels
	"Write the name of the default loaded parcels on the Transcript"
	
	self VisualncLoadedParcels do: [:p | Cormas println: p]