---
title: Algoritmi di ordinamento
---

Gli algoritmi di ordinamento sono indipendenti da:

- il tipo di elementi da ordinare;
- il verso dell'ordinamento (crescente o decrescente);

I metodi basati sulla comparazione e scambio sul posto degli elementi (come
l'insertion sort) non possono avere prestazioni migliori di $O(N^{2})$.

I metodi di ordinamento per confronti hanno una velocità $O(n \ log(n))$

## Insertion sort

```c
void insertion_sort(int array[], int array_lenght) {
  int i;
  int tmp;

  for (i = 0; i < array_lenght - 1; ++i) {
    if (array[i] > array[i + 1]) {
      tmp = array[i];
      array[i] = array[i + 1];
      array[i + 1] = tmp;

      if (i > 0) {
        i -= 2;
      }
    }
  }
}
```

La complessità nel caso medio e nel caso peggiore è $\Theta(n^{2})$.

## Merge sort

```c
void merge_sort(int array[], int array_lenght) {
  if (array_lenght < 2) {
    printf("al < 2\n");
    return;
  }

  // Divido l'array in 2 metà.
  int h1_start = 0;
  int h1_end = (array_lenght - 1) / 2;
  int h1_lenght = h1_end - h1_start + 1;
  int h2_start = h1_end + 1;
  int h2_end = array_lenght - 1;
  int h2_lenght = h2_end - h2_start + 1;

  merge_sort(array, h1_lenght);
  merge_sort(array + h2_start, h2_lenght);

  int h1[h1_lenght];
  int h2[h2_lenght];
  memcpy(h1, array, h1_lenght * sizeof(int));
  memcpy(h2, array + h2_start, h2_lenght * sizeof(int));

  int h1_i = 0;
  int h2_i = 0;
  // La somma delle lunghezze dei 2 sottoarray è sempre uguale a quella dell'array iniziale.
  while (h2_i + h1_i < array_lenght) {
    const int i = h1_i + h2_i;

    if (h2_i >= h2_lenght || h1[h1_i] < h2[h2_i]) {
      array[i] = h1[h1_i];
      ++h1_i;
    } else {
      array[i] = h2[h2_i];
      ++h2_i;
    }
  }
}
```

La complessità nel caso medio e nel caso peggiore è $log_{2}(n)$.
