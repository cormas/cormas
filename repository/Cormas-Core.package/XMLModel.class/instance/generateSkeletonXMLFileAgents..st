private
generateSkeletonXMLFileAgents: aStream
	"Generate the attributes part of the skeleton XML file"
	
	aStream
		nextPutAll: '<agents>';
		cr.
	aStream
		nextPutAll: '</agents>';
		cr