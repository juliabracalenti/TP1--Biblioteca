"
Representa a un libro (hereda de material catalogado)

*identificador: numero que identifica el ejemplar
*el plazo de préstamo es de 15 días sin excpeción
"
Class {
	#name : 'Libro',
	#superclass : 'MaterialCatalogado',
	#instVars : [
		'plazoPrestamo',
                'isbn'
	],
	#category : 'TP1-Biblioteca',
	#package : 'TP1-Biblioteca'
}

{ #category : 'testing' }
Libro class >> isAbstract [
	^false.
]
{ #category : 'accessing' }
Libro >> codigo [
"devuelve el ISBN o el ISSN+num según corresponda"
^isbn
]

{ #category : 'as yet unclassified' }
Libro >> plazoEnDias [
	"getter días de vencimiento de material para devolver"
^15
]

{ #category : 'accessing' }
Libro >> tipo [
 "getter tipo"
^'libro'
]

{ #category : 'accessing' }
Libro >> tipoDeIdentificador [
 "getter tipoDeIdentificador"
^'ISBN'
]

{ #category : 'accessing' }
Libro >>  inicializarTodosLosAtributosisbn: unIsbn
     titulo: unTitulo
     autores: unaColeccionDeAutores
     editorial: unaEditorial
     anio: unAnio
     paginas: numPaginas[

    isbn:= unIsbn.
    titulo:= unTitulo.
    autores:= unaColeccionDeAutores.
    editorial:= unaEditorial.
    anio:= unAnio.
    paginas:= numPaginas.



]
{ #category : 'accessing' }
Libro >> isbn [
 "getter isbn"
^isbn
]

{ #category : 'instance creation' }
"devuelve instancia de libro inicializando todas estas variables"
Libro class >> 
isbn: unIsbn
titulo: unTitulo
autores:  unaColeccionDeAutores
editorial: unaEditorial
anio: unAnio
paginas: numPaginas

[
    | libro |
     libro := Libro new.

    libro  inicializarTodosLosAtributosisbn: unIsbn
    titulo: unTitulo
    autores: unaColeccionDeAutores
    editorial: unaEditorial
    anio: unAnio
    paginas: numPaginas.
    ^libro
]
