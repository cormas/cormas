init
loadLocaleFile
	"FILE_IN de Locale.st, car la parcellisation de Locale provoque au chargement un plantage complet de VW5 ! (???)"
	
	| stFileName |
	stFileName := Cormas cormasPath construct: 'Kernel'.
	stFileName := stFileName construct: 'Locale.st'.
	(stFileName asFilename withEncoding: #Source) fileIn