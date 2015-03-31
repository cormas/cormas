private
generateSkeletonXMLFileAttributes: aStream
	"Generate the attributes part of the skeleton XML file"
	
	aStream
		nextPutAll: '<attributs>';
		cr.
	aStream
		nextPutAll: '</attributs>';
		cr