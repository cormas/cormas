accessing
emails
	" Answer a <Collection> of <String> with author's emails "

	| authWidgets authCollection |

	authWidgets := self widgets collect: #authorEmail.
	authCollection := (authWidgets collect: #pendingText) values.
	^ (authCollection joinUsing: Character cr) asString.