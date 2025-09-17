---
title: rand()
---

Ritorna un numero casuale, se non inizializzato i numeri ritornati sono sempre
uguali ogni volta che il programma viene riavviato.

Per evitare ciò bisogna chiamare `srand(time(0))` all'inizio della funzione
`main`.

## Range di numeri random

`rand()` ritorna sempre un numero compreso tra `0` e `RAND_MAX`.

Per ottenere numeri random all'interno di un range:
`rand() % (max + 1 - min) + min`
