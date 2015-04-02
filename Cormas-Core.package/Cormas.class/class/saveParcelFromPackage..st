util_export
saveParcelFromPackage: aPackage
	
	aPackage name = 'Cormas'
		ifTrue: [PublishAsParcelDialog publishAsParcel: aPackage]
		ifFalse:
			[| parcel |
			parcel := aPackage asParcel.
			self silentlySaveParcel: parcel]