private
generateSkeletonXMLFileViews: aStream
	"Generate the attributes part of the skeleton XML file"
	
	aStream
		nextPutAll: '<vues>';
		cr.
	aStream
		nextPutAll: '</vues>';
		cr