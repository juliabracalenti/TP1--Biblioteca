"
responde now con un instante fijado de antemano. Es el que usan los casos de prueba.
"
Class {
	#name : 'FakeDateAdapter',
	#superclass : 'DatePort',
	#instVars : [
		'instante'
	],
	#category : 'TP1-Biblioteca',
	#package : 'TP1-Biblioteca'
}

{ #category : 'as yet unclassified' }
FakeDateAdapter class >> en: unDateAndTime [
"Crea un reloj detenido ese instante"

^self new
forzarFecha: unDateAndTime.
]

{ #category : 'testing' }
FakeDateAdapter class >> isAbstract [
	^false.
]

{ #category : 'as yet unclassified' }
FakeDateAdapter >> forzarFecha: unDateAndTime [
"Planta el reloj en ese instante exacto. Es el mensaje para poner el sistema en la fecha que haga falta"

]

{ #category : 'as yet unclassified' }
FakeDateAdapter >> now [
	"devuelve fecha y hora actual"

^ DateAndTime now
]
