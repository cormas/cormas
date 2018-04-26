+ user interface
openEn
	"Cormas openEn"
	"avant c'était #fr mais il fallait recharger (FileIn) Locale.st.
	#fr => #'fr_FR.CP1252' 
	#en => #'en_US.CP1252' "
	"self openInterface: #windowSpec WithLanguage: #'en_US.CP1252'"
	Locale installCLocale.
	^self openInterface: #windowSpec