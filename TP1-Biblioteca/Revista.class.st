"
Representa una revista (hereda de material catalogado)

*identificador: numero que identifica el ejemplar
el plazo de un préstamo de una revista es de 7 días sin excepción
"
Class {
	#name : 'Revista',
	#superclass : 'MaterialCatalogado',
	#instVars : [
		'plazoPrestamo',
		'issn',
		'numero',
		'mesDeEdicion'
	],
	#category : 'TP1-Biblioteca',
	#package : 'TP1-Biblioteca'
}

{ #category : 'testing' }
Revista class >> isAbstract [ 
	^false.
]

{ #category : 'instance creation' }
Revista class >> issn: unIssn 
titulo: unTitulo 
autores: unaColeccionDeAutores
editorial: unaEditorial
anio: unAnio 
paginas: numPaginas 
numero: unNumero 
mes: unMes [


|revista|
revista:=self new.

revista 

      inicializarTodosLosAtributosissn: unIssn 
      titulo: unTitulo 
     autores: unaColeccionDeAutores
     editorial: unaEditorial
     anio: unAnio 
     paginas: numPaginas 
     numero: unNumero 
     mesDeEdicion: unMes.

^revista

]

{ #category : 'accessing' }
Revista >> codigo [ 
"devuelve el ISBN o el ISSN+num según corresponda"
^issn, numero asString

]

{ #category : 'initialization' }
Revista >> inicializarTodosLosAtributosissn: unIssn 
      titulo: unTitulo 
     autores: unaColeccionDeAutores
     editorial: unaEditorial
     anio: unAnio 
     paginas: numPaginas 
     numero: unNumero 
     mesDeEdicion: unMes [
issn:= unIssn .
 titulo:= unTitulo .
 autores:= unaColeccionDeAutores.
editorial:= unaEditorial.
 anioDeEdicion := unAnio .
 paginas:= numPaginas .
 numero:= unNumero .
 mesDeEdicion:= unMes.
]

{ #category : 'accessing' }
Revista >> issn [ 
 "getter isbn"
^issn

]

{ #category : 'accessing' }
Revista >> mesDeEdicion [ 
 "getter mesDeEdicion"
^mesDeEdicion

]

{ #category : 'accessing' }
Revista >> numero [ 
 "getter numero"
^numero

]

{ #category : 'accessing' }
Revista >> plazoEnDias [ 
	"getter días de vencimiento de material para devolver"
^7

]

{ #category : 'as yet unclassified' }
Revista >> plazoVencimiento [ 
	"getter días de vencimiento"
^plazoPrestamo 
]

{ #category : 'accessing' }
Revista >> tipo [ 
 "getter tipo"
^'revista'

]

{ #category : 'accessing' }
Revista >> tipoDeIdentificador [ 
 "getter tipoDeIdentificador"
^'ISSN'

]
