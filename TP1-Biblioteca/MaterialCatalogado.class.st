"
Representa todos los libros y revistas que son propiedad de la biblioteca que pueden estar relacionados con un préstamo 
"
Class {
	#name : 'MaterialCatalogado',
	#superclass : 'Object',
	#instVars : [
		'identificador',
		'titulo',
		'autores',
		'editorial',
		'anioDeEdicion',
		'paginas'
	],
	#category : 'TP1-Biblioteca',
	#package : 'TP1-Biblioteca'
}

{ #category : 'testing' }
MaterialCatalogado class >> isAbstract [
	^true.
]

{ #category : 'accessing' }
MaterialCatalogado >> anioDeEdicion [
"getter año de edición"
^anioDeEdicion 
]

{ #category : 'accessing' }
MaterialCatalogado >> autores [
"getter autores copia"
	|autorescopia|
autorescopia:=autores.
^autorescopia 
]

{ #category : 'accessing' }
MaterialCatalogado >> autores: unAutor [
"setter autores"

autores ifNil: [ autores:= OrderedCollection new. ].
autores add: unAutor. 
]

{ #category : 'accessing' }
MaterialCatalogado >> autorPrincipal [
"getter autorPrincipal"
|autorPrincipal|
autores ifNil: [ autorPrincipal:= nil. ] ifNotNil: [autorPrincipal:= autores at: 1.]
^autorPrincipal 
]

{ #category : 'accessing' }
MaterialCatalogado >> esDeAutor: unnombre [
"Bool que dice si esta un unnombre entre los autores"
|estaAutor|
autores 
	ifNil: [estaAutor=false.] 
	ifNotNil: [estaAutor:= autores anySatisfy [:autor | autor = unnombre ]
^estaAutor 
]


{ #category : 'accessing' }
MaterialCatalogado >> editorial [
"getter editorial"
^editorial 
]


{ #category : 'accessing' }
MaterialCatalogado >> identificador [
"devuelve el ISBN o el ISSN+num según corresponda"
^identificador 
]

{ #category : 'accessing' }
MaterialCatalogado >> identificador: unIdentificador [
 "setter identificador"
identificador :=unIdentificador .
]

{ #category : 'accessing' }
MaterialCatalogado >> paginas [
"getter paginas"
^paginas 
]

{ #category : 'as yet unclassified' }
MaterialCatalogado >> plazoVencimiento [
	"getter días de vencimiento de material para devolver"
^self subclassResponsibility 
]

{ #category : 'accessing' }
MaterialCatalogado >> titulo [
"getter titulo"
^titulo 
]

