version
dateAsArray
	"Answer an array (6) with current date. 
	Example: #(2010 6 24 8 31 54) . 
	Cormas dateAsArray"
	
	| day array |
	day := Time dateAndTimeNow first day
		- Time dateAndTimeNow first firstDayOfMonth + 1.
	array := Array new: 6.
	array
		at: 1
		put: Time dateAndTimeNow first year.
	array
		at: 2
		put: Time dateAndTimeNow first monthIndex.
	array at: 3 put: day.
	array
		at: 4
		put: (Time dateAndTimeNow at: 2) hours.
	array
		at: 5
		put: (Time dateAndTimeNow at: 2) minutes.
	array
		at: 6
		put: (Time dateAndTimeNow at: 2) seconds.
	^array