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

{ #category : 'creation' }
FakeDateAdapter class >> en: unDateAndTime [
	"Crea un reloj detenido ese instante"
	| fakeDate |
	fakeDate := self new.
	fakeDate instante: unDateAndTime.
	^fakeDate 

]

{ #category : 'creation' }
FakeDateAdapter class >> enDia: unDia mes: unMes anio: unAnio [
	"devuelve un dateAndTime a las 00:00 del día elegido"
	| fakeDate fakePort |
	fakePort:= self new.
	 fakeDate:= DateAndTime year: unAnio month: unMes day:unDia hour: 0 minute:0  second:0.
	fakePort forzarFecha: fakeDate .
	^fakePort
]

{ #category : 'testing' }
FakeDateAdapter class >> isAbstract [
	^false.
]

{ #category : 'updating' }
FakeDateAdapter >> avanzarDias: unaCantidadDeDias [ 
	"avanza el tiempo la cantidad de días solicitado"
	self forzarFecha: instante + (Duration days: unaCantidadDeDias ).
	^self

]

{ #category : 'updating' }
FakeDateAdapter >> avanzarHoras: unaCantidadDeHoras [
	"avanza el tiempo la cantidad de horas solicitadas"
	self forzarFecha: instante + (Duration hours: unaCantidadDeHoras ).
	^self.
]

{ #category : 'updating' }
FakeDateAdapter >> forzarDia: unDia mes: unMes anio: unAnio [
	"planta el reloj en el dia elegido a las 00:00"
	|fakeDate|
	fakeDate := DateAndTime year: unAnio month: unMes day:unDia hour: 0 minute:0  second:0.
	instante := fakeDate .

]

{ #category : 'updating' }
FakeDateAdapter >> forzarDia: unDia mes: unMes anio: unAnio hora: unaHora minuto: unMinuto [
	"planta el reloj en el dia elegido a la hora deseada"
	|fakeDate|
	fakeDate := DateAndTime new.
	fakeDate forzarDia: unDia mes: unMes  anio: unAnio.
	fakeDate hour: unaHora minute: unMinuto  second: (Duration seconds: 0).
	instante := fakeDate .
	^self

]

{ #category : 'updating' }
FakeDateAdapter >> forzarFecha: unDateAndTime [
	"Planta el reloj en ese instante exacto. Es el mensaje para poner el sistema en la fecha que haga falta"
	instante:= unDateAndTime.
	^self

]

{ #category : 'setter' }
FakeDateAdapter >> instante: unReloj [
	"setter instante"
	instante := unReloj.



]

{ #category : 'getter' }
FakeDateAdapter >> now [
	"devuelve fecha y hora actual"
	^ instante 
]
