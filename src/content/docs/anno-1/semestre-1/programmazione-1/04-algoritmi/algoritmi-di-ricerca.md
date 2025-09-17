---
title: Algoritmi di ricerca
---

## Ricerca in un archivio ordinato

Posso cercare in 2 modi:

- **ricerca sequenziale**: scorro **dall'inizio dell'array** fino a trovare
  l'elemento cercato, se arrivo **alla fine** e non ho trovato l'elemento,
  allora esso non esiste.

  Nel caso migliore l'elemento si trova all'inizio dell'array e lo trovo dopo un
  passaggio, nel peggiore devo analizzare tutto l'array prima di sapere che
  l'elemento non esiste.

- **ricerca binaria**: confronto l'elemento cercato con quello al centro
  dell'array. Se l'elemento cercato viene prima allora considero **solo la
  metà** inferiore dell'array, oppure quella superiore se viene dopo. Quando
  l'elemento corrisponde all'elemento cercato o non ci sono più elementi sopra o
  sotto l'elemento centrale, allora l'algoritmo finisce.

  Il caso peggiore richiede un tempo massimo pari a $log_{2}(n)$.

### Implementazione di un algoritmo di ricerca binaria

```c
// Ritorna l'indice dell'elemento cercato.
int bynary_search(int array[], int array_lenght, int search_key) {
  int bottom = 0;
  int top = array_lenght - 1;

  while (bottom <= top) {
    int middle = (top + bottom) / 2;

    if (array[middle] == search_key) {
      return middle;
    }

    if (array[middle] > search_key) {
      bottom = middle;
    } else {
      top = middle;
    }
  }

  return -1;
}
```
