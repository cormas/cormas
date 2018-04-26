private
ensureRuntimePackagerLoaded
	
	RuntimeBuilderUI isDefined
		ifFalse: [Parcel loadParcelByName: 'RuntimePackager']