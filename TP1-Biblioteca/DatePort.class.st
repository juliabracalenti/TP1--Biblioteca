"
Abstracta. Es el puerto: declara el único mensaje que el modelo le manda al reloj, now, y no lo implementa.
"
Class {
	#name : 'DatePort',
	#superclass : 'Object',
	#category : 'TP1-Biblioteca',
	#package : 'TP1-Biblioteca'
}

{ #category : 'accessing' }
DatePort >> now [
	"devuelve la fecha actual o una fecha forzada en caso de pruebas"
	
^self subclassResponsibility 
]
