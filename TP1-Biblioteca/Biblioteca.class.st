"
Es la clase que representa el dominio completo, por lo cual solo podrá crearse una única instancia.
Todo lo que se le pide al sistema se le pide a una instancia de Biblioteca: es la fachada del sistema. Coordina toda la interacción y lleva el registro de préstamos

*nombre: el de la biblioteca
*catalogo: lista material catalogado (Hay un solo ejemplar de cada material)
*lectores: lista socios/lectores
*prestamos: lista historial de prestamos (activos y no activos).
"
Class {
	#name : 'Biblioteca',
	#superclass : 'Object',
	#instVars : [
		'nombre',
		'datePort',
		'catalogo',
		'lectores',
		'prestamos'
	],
	#category : 'TP1-Biblioteca',
	#package : 'TP1-Biblioteca'
}

{ #category : 'accessing' }
Biblioteca class >> nombre: unNombre [
"new biblioteca + nombre"
|unaBiblioteca|
unaBiblioteca := self new.
unaBiblioteca nombrar: unNombre.
^unaBiblioteca 
]

{ #category : 'as yet unclassified' }
Biblioteca >> catalogar: unMaterial [
"catalogar recibe un material(libro o revista) y lo coloca en el catálogo. Si es el primer material crea un catálogo primero"

"retorno devuelve nil si el material ya existía y unMaterial si se acaba de agregar"
|retorno|

		catalogo ifNil: [catalogo:= OrderedCollection new. catalogo add: unMaterial. retorno :=unMaterial].
		catalogo	ifNotNil: [
						(catalogo includes: unMaterial) ifFalse: [catalogo add: unMaterial.retorno :=unMaterial]
																  ifTrue: [Transcript open; show: 'el material ingresado ya estaba previamente en el catálogo.'] ].

^retorno
]

{ #category : 'accessing' }
Biblioteca >> catalogo [
	"getter catalogo"
	
^catalogo 
]

{ #category : 'as yet unclassified' }
Biblioteca >> devolver: unNumeroIdentificador [
	"devuelve una instancia de préstamo correspondiente al numero de id del material pero cerrada"

	| prestamoAcerrar fechaActual|
	
	"busca un préstamo relacionado al material identificado que no esté cerrado."
	prestamoAcerrar:= prestamos detect:[:cadaPrestamo | 
		cadaPrestamo identificador==unNumeroIdentificador and: cadaPrestamo devolucion isNil].
	
	fechaActual := Time now. "capaz haya que modificar esto con la librería que nos pidieron"
	prestamoAcerrar devolucion: fechaActual.
	
	^prestamoAcerrar 
	
	"esto supone que el préstamo existe. hay que preguntar si puede pasar que no exista"
]

{ #category : 'accessing' }
Biblioteca >> lectores [
	"getter lectores"
	
^lectores 
]

{ #category : 'accessing' }
Biblioteca >> nombrar: unNombre [
"setter nombre"
nombre:=unNombre.
]

{ #category : 'accessing' }
Biblioteca >> nombre [
"getter nombre"
^nombre
]

{ #category : 'accessing' }
Biblioteca >> prestamos [
	"getter prestamos"
	
^prestamos 
]
