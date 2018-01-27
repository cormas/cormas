settings
setParcelPathForModels
	"Add the Parcel paths :  $(VISUALWORKS)\cormas\Models\*"
	
	| parcelPath fileSeparator |
	fileSeparator := String with: Filename separator.
	parcelPath := '$(VISUALWORKS)' , fileSeparator , 'cormas' , fileSeparator
		, 'Models' , fileSeparator , '*' , fileSeparator.	"pourquoi le parcelManager (touche F3) ne les voit pas ???"
	parcelPath := (((SystemUtils getEnvironmentVariable: 'VISUALWORKS')
		asFilename construct: 'cormas') construct: 'Models') construct: '*'.	"le pb de cette ligne c est qu'elle met le chemin en dur = d:\vw7.3nc\cormas\Models\* "
	self setParcelPath: parcelPath asFilename