initialize-release
requestForWindowClose
	
	Dev todo:
			'Mauvaise compr√©hension de #closeRequest, #requestForWindowClose et #noticeOfWindowClose:'.	"#requestForWindowClose est appel√©e lorsqu'on tente de fermer la fen√™tre pour demadne confirmation (retourner false pour emp√™cher la fermeture).
	#noticeOfWindowClose: est appel√©e pour notifier qu'une fen√™tre vient d'√™tre ferm√©e.
	#closeRequest permet de demander par programmation la fermeture de la fen√™tre (passe par les m√©thodes pr√©c√©dentes (peut donc √™tre annul√© par requestForWindowClose)"
	super requestForWindowClose & quitter not ifTrue: [self actionQuitter].
	^super requestForWindowClose