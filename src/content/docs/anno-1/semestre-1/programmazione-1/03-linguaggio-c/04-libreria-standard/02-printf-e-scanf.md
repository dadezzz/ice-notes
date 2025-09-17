---
title: printf() e scanf()
---

## `printf(format [, arg1, arg2])`

Funzione che stampa in `stdout` la stringa data come primo argomento e inserendo
i parametri dati successivamente.

```c
#include <stdio.h>
#include <stdint.h>

int main() {
  const uint32_t number = 40;
  const char* string = "stringa a caso";

  printf("This is a number: %d", number);
  printf("This is a string: %s", string);

  return 0;
}
```

### Descrittori

Possono essere usati nella stringa `format` per indicare come stampare le
variabili date negli argomenti successivi.

- `%d`, `%i`: numero intero (`int`);
- `%u`: numero intero senza il segno (`unsigned int`);
- `%f`: numero a precisione variabile (`float`);
- `%e`: numero a precisione variabile in forma esponenziale;
- `%g`: sceglie la migliore tra `%f` e `%e`;
- `%c`: carattere (`char`);
- `%s`: stringa o array di caratteri;
- `%o`: numero intero in base ottale;
- `%x`: numero intero in base esadecimale;

## `scanf(format [, arg1, arg2])`

Si usa per leggere input da `stdin` e convertirlo nel tipo che si specifica con
un descrittore.

```c
#include <stdio.h>

int main() {
  int numero_utente = 0;

  printf("Inserisci un numero: ");
  scanf("%d", &numero_utente);

  printf("Il numero inserito è %d", numero_utente);

  return 0;
}
```

### Problemi nella lettura di caratteri

`scanf` legge solo ciò che coincide con la stringa formato, quindi se si leggono
caratteri e l'utente ne inserisce 1 e poi preme invio, in `stdin` resterà il
carattere `\n` che verrà letto la prossima volta che la funzione sarà chiamata.

Dato che generalmente si vuole ignorare questo carattere, è necessario chiamare
la funzione `fflush(stdin)` prima di `scanf`, essa elimina tutti i caratteri
presenti in `stdin`.

## Esempi

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
