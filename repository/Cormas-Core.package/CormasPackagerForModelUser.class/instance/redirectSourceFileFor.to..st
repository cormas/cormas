private actions
redirectSourceFileFor: aParcel to: aFilename
	"redirect the source for the aParcel to a relative path to aFilename
	Models\MyModel\MyModel.pcl"
	
	| aStream sourceIndex |
	aStream := String new writeStream.
	aStream
		nextPutAll: aFilename directory directory tail;
		nextPut: $\;
		nextPutAll: aFilename directory tail;
		nextPut: $\;
		nextPutAll: aFilename tail.
	sourceIndex := aParcel propertyAt: #sourceIndex.
	SourceFileManager default
		file: sourceIndex
		name: aStream contents
		writable: false