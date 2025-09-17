---
title: Variabili
---

Utilizzate per memorizzare un valore in un'area di memoria.

Il valore può essere modificato durante il corso del programma a meno che non si
usi il qualificatore `const`.

È possibile ottenere l'indirizzo di memoria (virtuale) di qualsiasi variabile
scrivendo il simbolo `&` prima del nome: `indirizzo_di_a = &a`.

## Dichiarazione

Prima di essere usata una variabile deve essere dichiarata, bisogna definire il
suo tipo (numero, stringa, struttura di dati), il suo nome e il suo valore
iniziale.

:::note

Se non si definisce un valore iniziale, il compilatore o il sistema operativo
possono darne uno casuale, dando un comportamento indefinito al programma.

:::

Una variabile si dichiara in questo modo:

```c
// Variabile normale.
int var1 = 0;
// Variabile costante. Non può più essere cambiata.
const int var2 = 2;
// Variabile che contiene una stringa (tipo diverso di variabile).
const char* nome = "nome a caso";
```

## Assegnazione

Consente di assegnare ad una variabile il valore di un'espressione.

```c
a = 2;
b = 'a';
c = 10 + 2 * 8;
d = c + 1;
```

Un espressione può essere:

- un valore costante;
- un'altra variabile;
- una combinazione di espressioni mediante operatori;

### Sintassi

`e1 = e2`

`e1` deve avere un l-value, ovvero deve avere un indirizzo in memoria dove
immagazzinare l'r-value (`e2`).

`e1` e `e2` devono essere di tipo compatibile.

### Algoritmo dell'assegnazione

- valutare l'espressione nell'r-value;
- memorizzare l'r-value in nell'l-value;

## Espressioni

Le espressioni vengono valutate seguendo l'AST (Abstract Syntax Tree), dato
dalla priorità e associatività degli operatori e delle parentesi.

Lazy-evaluation: il compilatore può ottenere il valore di un'espressione senza
arrivare alla fine dell'albero sintattico (per esempio quando ho una serie di
`&&` e il primo valore è falso).

### Operatori di assegnazione

- `x = y`
- `x += y`: `x = x + y`;
- `x -= y`: `x = x - y`;
- `x *= y`: `x = x * y`;
- `x /= y`: `x = x / y`;
- `x %= y`: `x = x % y`;

Quelli in forma compatta permettono di aumentare la leggibilità del codice.

### Operatori increment e decrement

- `++`: somma 1 alla variabile;
- `--`: sottrae 1 alla variabile;

La posizione dell'operatore (destra o sinistra) è importante dentro ad
un'espressione:

- a sinistra: prima aggiunge 1 e poi viene dato il valore da usare nel resto
  dell'espressione;
- a destra: prima si usa il valore corrente nell'espressione, dopo aggiunge 1
  alla variabile;

:::tip

È considerato più leggibile usare l'operatore a sinistra della variabile da
modificare, dato il suo comportamento più prevedibile (non bisogna considerare
eventuali effetti collaterali).

:::

```c
##include <stdio.h>

int main() {
  int a = 1;

  printf("%d", a); // Stampa 1;
  printf("%d", ++a); // Stampa 2;
  printf("%d", a++); // Stampa 2;
  printf("%d", a); // Stampa 3;

  return 0;
}
```

### Associatività degli operatori

```c
int a, b, c, d;
a = b = c = d = 5;
```

In un'espressione come questa, dove tutti gli operatori hanno la stessa
priorità, il compilatore valuta gli elementi a seconda della loro associatività.

`=` ha associatività verso destra, quindi il compilatore trasforma il codice
sopra in:

```c
int a, b, c, d;
a = (b = (c = (d = 5)));
```
