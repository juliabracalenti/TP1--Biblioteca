"
Representa a una persona que particularmente es socio de la biblioteca

*numero: numero de socio (único para cada lector)
*moroso: booleano que representa si el lector está penalizado actualmente (de ser true no se puede llevar libros)
"
Class {
	#name : 'Lector',
	#superclass : 'Object',
	#instVars : [
		'numero',
		'cuit',
		'nombre',
		'apellido',
		'moroso'
	],
	#category : 'TP1-Biblioteca',
	#package : 'TP1-Biblioteca'
}

{ #category : 'instance creation' }
Lector class >> numero: unNumero cuit: unCuit nombre: unNombre apellido: unApellido [
	|instancia|
	instancia := self new.
	instancia
		numero: unNumero;
		cuit: unCuit;
		nombre: unNombre;
		apellido: unApellido.
	^instancia.
]

{ #category : 'accessing' }
Lector >> apellido [
	"getter apellido"
	^apellido 
]

{ #category : 'accessing' }
Lector >> apellido: unApellido [
	"setter apellido"
	apellido := unApellido.
]

{ #category : 'accessing' }
Lector >> cuit [
	"getter cuit"
	^cuit
]

{ #category : 'accessing' }
Lector >> cuit: unCuit [
	"setter cuit"
	cuit := unCuit.
]

{ #category : 'accessing' }
Lector >> nombre [
	"getter nombre"
	^nombre 
]

{ #category : 'accessing' }
Lector >> nombre: unNombre [
	"setter nombre"
	nombre := unNombre.
]

{ #category : 'accessing' }
Lector >> numero [
	"getter numero de socio"
	^numero 
	
]

{ #category : 'accessing' }
Lector >> numero: unNumeroDeSocio [
	"setter numero de socio"
	numero := unNumeroDeSocio.
]
