managing classes
spatialClasses
	" Answer a <Collection> of spatial classes of the model. Aldready configured in #initializeWithoutVS "
	"self allClassesInPackage select: [ :aClass | aClass inheritsFrom: CMSpatialEntityCell ]"
	^ spatialClasses