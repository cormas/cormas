util_export
export
	"Export Cormas. 
The cormas version is updated.
ST files (kernel.st, VisualLauncher...) are save on disk.
A parcel is generated "
	"update version name and comments"
	
	self
		setDescriptionFor: 'kernelFileName'
		withText: 'Kernel-v.' , self versionAsString.
	self updateVersion.
	Notice
		show: 'Saving Cormas as ST files...'
		while: [self saveAsST].
	Notice
		show: 'Saving Cormas as Parcel...'
		while:
			[self
				saveParcelFromPackage:
					(Registry containingPackageForNameSpace: self environment)]	"parcels := Parcel parcelsForClass: self.
	parcels ifNotNil: [parcels do: [:parcel | parcel saveParcelDialogFor: nil]]"