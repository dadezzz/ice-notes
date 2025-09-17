---
title: Libreria standard
---

Programma che legge 2 numeri, li moltiplica e poi stampa il risultato:

```c
#include <stdio.h>

int main() {
  int n1 = 0;
  int n2 = 0;

  printf("Inserire un numero: ");
  scanf("%d", &n1);
  printf("Inserire un altro numero: ");
  scanf("%d", &n2);

  int result = n1 * n2;
  printf("Risultato: %d", result);

  return 0;
}
```

Programma che legge una temperatura in Fahrenheit e la converte in Celsius:

```c
#include <stdio.h>

int main() {
  float temp_f = 0;

  printf("Inserire una temperatura in Fahrenheit: ");
  scanf("%g", &temp_f);

  // Se 5 e 9 non fossero scritti come float, la divisione verrebbe fatta tra 2
  // int e il risultato sarebbe 0.
  float temp_c = (5.0 / 9.0) * (temp_f - 32.0);
  printf("Temperatura in Celsius: %d", temp_c);

  return 0;
}
```
