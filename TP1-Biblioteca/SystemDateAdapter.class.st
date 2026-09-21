"
Adaptador de producción: responde now con la fecha y hora reales, usando lo que provee Pharo (DateAndTime now)
"
Class {
	#name : 'SystemDateAdapter',
	#superclass : 'DatePort',
	#category : 'TP1-Biblioteca',
	#package : 'TP1-Biblioteca'
}

{ #category : 'testing' }
SystemDateAdapter class >> isAbstract [
	^false.
]
