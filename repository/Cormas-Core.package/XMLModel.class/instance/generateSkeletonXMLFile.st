private
generateSkeletonXMLFile
	"Generate a skeleton XML file from the model"
	
	| outputStream |
	outputStream := filepath writeStream.
	outputStream lineEndCRLF.
	self generateSkeletonXMLFileHeader: outputStream.
	self generateSkeletonXMLFileAttributes: outputStream.
	self generateSkeletonXMLFileViews: outputStream.
	self generateSkeletonXMLFileAgents: outputStream.
	self generateSkeletonXMLFileFooter: outputStream.
	outputStream close