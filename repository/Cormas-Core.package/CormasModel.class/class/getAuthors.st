description - primitives
getAuthors
	
	| authors lesAuteurs lesEMails |
	authors := OrderedCollection new.
	lesAuteurs := Cormas textAsList: self authors.
	lesEMails := Cormas textAsList: self emails.
	lesAuteurs size > lesEMails size
		ifTrue:
			[lesEMails size + 1
				to: lesAuteurs size
				do: [:i | lesEMails add: ' ']].
	lesAuteurs
		with: lesEMails
		do:
			[:a :e | 
			authors
				add:
					((CMAuthor new)
						name: a;
						email: e)].
	^authors