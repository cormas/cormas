Extension { #name : #I18NTranslationViewer }

{ #category : #'*Cormas-UI' }
I18NTranslationViewer class >> open [

	self flag:
		'Warning: this is a hack to open this tool on Cormas. Because Cormas uses Pharo 9 and a old Spec version. When Cormas will be updated to use Pharo > 10, thus the new version of Spec, one can simply remove this method.'.
	^ self new
		  defaultLayout;
		  openWithSpec
]
