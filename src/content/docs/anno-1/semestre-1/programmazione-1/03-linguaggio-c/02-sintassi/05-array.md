---
title: Array
---

Sono variabili che memorizzano un insieme di elementi, sono il più semplice tipo
di dato strutturato.

In memoria gli elementi sono disposti sequenzialmente e devono essere tutti
dello stesso tipo.

Per accedere a ciascun elemento di un array si usa il suo indice (un numero che
va da 0 alla lunghezza dell'array - 1).

```c
// Dichiara l'array.
int a[10];

// Inserisci il valore 5 nel secondo elemento.
a[1] = 5;

// Inserisci il valore 10 nell'ultimo elemento dell'array.
a[sizeof(a) / sizeof(int) - 1] = 10;
```

## Dichiarazione

Il primo modo di dichiarare una variabile array è:

```c
int a[100];
```

Esso riserva uno spazio in memoria che può contenere 100 valori di tipo `int`.
Gli indici degli elementi vanno da 0 a 99.

## Inizializzazione

Un array può anche essere inizializzato durante la sua dichiarazione.

```c
int a = { 2, 4, 5, 7, 3 };
```

## Array di dimensione dinamica

Il compilatore non ha bisogno di conoscere le dimensioni di un array durante la
compilazione:

```c
int size = get_array_size_from_user();

// La variabile size ottiene il suo valore dopo l'inizio dell'esecuzione del programma.
int a[size];
```

Per modificare le dimensioni di un array già esistente è necessario usare
l'allocazione dinamica della memoria con `malloc()` e `free()`.

## Array multidimensionali

Un array multidimensionale è un array che contiene una serie di altri array. Può
essere dichiarato così:

```c
// Dichiara un array di 10 righe e 15 colonne.
int a[10][15];

// Array a 3 dimensioni.
int b[4][16][5];
```
