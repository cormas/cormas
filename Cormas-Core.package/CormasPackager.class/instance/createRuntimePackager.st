packager facility
createRuntimePackager
	"initialize a runtimePackager.
	This facility is specifically for subclasses using the RuntimePackager.
	We load the parcel only if the RTP is used
	"
	
	self ensureRuntimePackagerLoaded.
	runtimePackager := RuntimeBuilderUI value new