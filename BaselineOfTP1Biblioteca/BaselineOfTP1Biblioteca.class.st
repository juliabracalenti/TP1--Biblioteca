"
""baseline: spec
    <baseline>
    spec for: #common do: [
        spec package: 'NombreDeTuPaquete'.
    ]""
codigo para clonar el repo
"
Class {
	#name : 'BaselineOfTP1Biblioteca',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfTP1Biblioteca',
	#package : 'BaselineOfTP1Biblioteca'
}

{ #category : 'baselines' }
BaselineOfTP1Biblioteca >> baseline: spec [
    <baseline>
    spec for: #common do: [
        spec package: 'TP1-Biblioteca'.
    ]
]
