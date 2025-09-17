---
title: Stringhe
---

Ogni carattere rappresenta un numero di 8 bit che viene riconosciuto tramite la
tabella ASCII.

I caratteri non rappresentano solo lettere e numeri, ma anche altri simboli che
controllano come il testo viene interpretato: `\n`, `\t`, ...

Le stringhe in C rappresentano un array di caratteri. L'ultimo elemento di
questo array deve essere il carattere `\0`.

## Inizializzazione

Oltre alla normale forma di inizializzazione di un array, una stringa può essere
dichiarata con una sintassi speciale:

```c
const char[] a = "ciao!";

// L'equivalente sarebbe:
const char[] a = { 'c', 'i', 'a', 'o', '\0' };
```

## Stampa e lettura di una stringa

`scanf()` può leggere una stringa da `stdin` a patto che essa non sia più lunga
della memoria allocata.

```c
char a[20];

scanf("%s", &a);
```

Anche `printf()` contiene un formato speciale per stampare le stringhe terminate
con `\0`:

```c

const char[] a = "ciao!";

prinf("%s\n", a);
```

## Sequenze di caratteri nelle stringhe

- `\n`: newline;
- `\t`: tab;
- `\"`: inserisce una " (una stringa è delimitata da 2 `"`, quindi con `\"` si
  dice al compilatore di non terminare la stringa in questo punto, ma di
  continuare a leggere il resto della stringa);
- `\\`: inserisce una \\;

## Funzioni di libreria

Alcune funzioni utili per manipolare le stringhe sono definite in `<string.h>`.
