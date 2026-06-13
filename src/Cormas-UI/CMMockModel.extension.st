Extension { #name : 'CMMockModel' }

{ #category : '*Cormas-UI' }
CMMockModel class >> example [
	<example>
	
	CMSimulationApplication new
		cormasModel: self new;
		run
]

{ #category : '*Cormas-UI' }
CMMockModel >> example [
	<script: 'self example'>
]
