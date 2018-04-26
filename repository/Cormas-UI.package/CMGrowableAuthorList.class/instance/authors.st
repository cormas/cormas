accessing
authors
	" Answer a <Collection> of <String> with author names "

	| authWidgets authCollection |
	authWidgets := self widgets collect: #authorName.
	authCollection := (authWidgets collect: #pendingText) values.
	^ (authCollection joinUsing: Character cr) asString.