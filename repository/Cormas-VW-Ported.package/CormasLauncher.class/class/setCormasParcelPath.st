settings
setCormasParcelPath
	"Add the Parcel paths : $(VISUALWORKS)/cormas/ "
	
	| parcelPath fileSeparator |
	fileSeparator := String with: Filename separator.
	parcelPath := ('$(VISUALWORKS)' , fileSeparator , 'cormas') asFilename.	"ex: a NTFSFilename('$(VISUALWORKS)\cormas')"	"parcelPath := (SystemUtils getEnvironmentVariable: 'VISUALWORKS') asFilename construct: 'cormas'.   ex: a NTFSFilename('d:\vw7.3nc\cormas')"
	self setParcelPath: parcelPath