util_parcels
displayCormasParcelsOnly
	"Write the name of the loaded parcels on the Transcript.
		Cormas displayCormasParcelsOnly"
	
	self CormasParcelsOnly do: [:p | Cormas println: p]