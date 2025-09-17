---
title: Introduzione
---

## Caratteristiche di un linguaggio di programmazione

Un algoritmo espresso in linguaggio informale, va tradotto in un linguaggio che
un computer può capire (C, C++, Java). Questa sequenza di istruzioni date al
calcolatore viene detta programma.

Un linguaggio è definito da:

- sintassi: regole che descrivono le stringhe di parole riconosciute dal
  linguaggio.
- semantica: regole per interpretazione delle stringhe che descrivono i processi
  computazionali dell'esecutore.

Cosa deve fare un linguaggio di programmazione:

- astrazione della memoria;
- astrazione delle istruzioni;
- astrazione del linguaggio per definire gli algoritmi;

## Hello world

Programma basico usato per testare che il processo di compilazione funzioni.

```c
// Importa la funzione `printf` dalla libreria standard di C.
#include <stdio.h>

int main() {
  // Stampa `Hello World!` nel terminale.
  printf("Hello World!\n");

  return 0;
}
```

## Storia di C

Inventato nel 1972 da Brian Kerninghan e Dennis Ritchie, evoluzione di 2
linguaggi preesistenti (BCPL e B), sempre inventati da Ritchie.

Nel 1989 viene creato uno standard e viene aggiornato nel 1999, 2011, 2017
e 2023.

## Confronto tra C e C++

- C:
  - Evoluzione di linguaggi preesistenti.
  - Utilizzato per scrivere quasi tutti gli OS moderni.
- C++:
  - Evoluzione di C da parte di Bjarne Stroustrup.
  - Fornisce astrazioni sulle strutture dati (templates).
  - È possibile usare l'OOP (object oriented programming).

## Compilazione e interpretazione

- Compilazione:
  - Il programma viene tradotto in un altro linguaggio (di solito di livello
    inferiore).
  - Il compilatore non è necessario per l'esecuzione.
  - Migliori prestazioni, ma la compilazione richiede tempo.
- Interpretazione:
  - Il codice è tradotto ed eseguito allo stesso momento.
  - Oltre al programma serve anche un interprete.
  - L'esecuzione è più lenta.
