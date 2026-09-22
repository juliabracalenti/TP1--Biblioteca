"
Clase para TESTING.responde now con un instante fijado de antemano. Es el que usan los casos de prueba.
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

{ #category : 'initialization' }
FakeDateAdapter class >> en: unDateAndTime [
"Crea un reloj detenido ese instante"
| fakeDate |

fakeDate := self new.
fakeDate instante: unDateAndTime.
^fakeDate 
]

{ #category : 'as yet unclassified' }
FakeDateAdapter class >> enDia: unDia enMes: unMes enAnio: unAnio [
"devuelve un dateAndTime a las 00:00 del día elegido"
|fakeDate|

fakeDate := DateAndTime new.
fakeDate year: unAnio month: unMes day:unDia hour: 0 minute:0  second:0.

^ fakeDate
]

{ #category : 'testing' }
FakeDateAdapter class >> isAbstract [
	^false.
]

{ #category : 'updating' }
FakeDateAdapter >> avanzarDias: unaCantidadDeDias [
	"avanza el tiempo la cantidad de días solicitado"

instante forzarFecha: instante + (unaCantidadDeDias ) days.

^self
]

{ #category : 'updating' }
FakeDateAdapter >> avanzarHoras: unaCantidadDeHoras [
	"avanza el tiempo la cantidad de horas solicitadas"

instante forzarFecha: instante + (unaCantidadDeHoras ) hours .

^self
]

{ #category : 'updating' }
FakeDateAdapter >> forzarDia: unDia mes: unMes anio: unAnio [
"planta el reloj en el dia elegido a las 00:00"
|fakeDate|

fakeDate := DateAndTime new.
fakeDate year: unAnio month: unMes day:unDia hour: 0 minute:0  second:0.

^ fakeDate
]

{ #category : 'updating' }
FakeDateAdapter >> forzarDia: unDia mes: unMes anio: unAnio hora: unaHora minuto: unMinuto [
"planta el reloj en el dia elegido a la hora deseada"

|fakeDate|
fakeDate := DateAndTime new.
fakeDate forzarDia: unDia mes: unMes  anio: unAnio.
fakeDate hour: unaHora minute: unMinuto  second: 0.

^self
]

{ #category : 'updating' }
FakeDateAdapter >> forzarFecha: unDateAndTime [
"Planta el reloj en ese instante exacto. Es el mensaje para poner el sistema en la fecha que haga falta"
instante:= unDateAndTime.

^self
]

{ #category : 'accessing' }
FakeDateAdapter >> instante: unReloj [
"setter instante"
instante := unReloj .


]

{ #category : 'accessing' }
FakeDateAdapter >> now [
	"devuelve fecha y hora actual"
^ instante
]
