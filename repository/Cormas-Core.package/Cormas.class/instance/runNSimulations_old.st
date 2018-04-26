simulation
runNSimulations_old
	"Deprecated. Just use for the old 'run: t times: n' method"
	
	| nbOfSim j test i |
	nbOfSim := (self
		request: self numberOfSimul
		initialAnswer: '1') asNumber.
	j := 1.
	nbOfSim
		timesRepeat:
			[self initSimulation.
			i := self stepCounter value.
			test := 'ok'.
			[i <= cycle value and: [test isNil not]]
				whileTrue:
					[test := self cormasModel
						perform: self cormasModel activeControl
						with: i
						with: j.
					self cormasModelClass commClasses isEmpty
						ifFalse: [self cormasModel channel flush].
					self obsWin notNil
						ifTrue:
							[self eraseLinks ifTrue: [self obsWin observateur modeleObs actionClear]].
					self stepCounter value: i.
					i := i + 1].
			test isNil
				ifTrue:
					[self cormasModel
						perform: self cormasModel activeControl
						with: cycle value
						with: j].
			j := j + 1]