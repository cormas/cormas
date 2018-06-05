simulate
loopRunStep_untilFinalTime
	[[ self currentTime < self finalTime ] whileTrue: [ self runStepByStep ]] fork