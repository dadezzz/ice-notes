---
title: Istruzioni iterative
---

Ripetono un blocco di istruzioni al verificarsi di una condizione.

# Ciclo `for`

L'intestazione di un ciclo `for` può contenere espressioni arbitrarie.
Analogamente al ciclo `while`.

È convenzione usare:

- `expr 1`: inizializzazione della variabile del ciclo;
- `expr 2`: condizione di uscita del ciclo;
- `expr 3`: aggiornamento della variabile del ciclo;

```c
#include <stdio.h>

int main() {
  int a = 0;
  int i;

  // Aggiunge 1 ad `a` per 50 volte.
  for (i = 0; i < 50; ++i) {
    ++a;
  }

  printf("%d", a);

  return 0;
}
```

# Ciclo `while {}` e `do {} while`

```c
#include <stdio.h>

int main() {
  int a = 0;

  // Aggiunge 1 ad `a` fino a quando il suo valore è 50.
  while (a < 50) {
    ++a;
  }

  // Rimuove 1 da `a` fino a quando il suo valore è 0.
  do {
    --a
  } while (a >= 0);

  printf("%d", a);

  return 0;
}
```

# `break` e `continue` nei cicli

Nei cicli `for`, `while {}`, `do {} while`:

- `break`: interrompe il ciclo e salta immediatamente all'istruzione dopo il
  ciclo.
- `continue`: interrompe questo giro del ciclo e inizia il giro successivo se
  l'espressione condizionale lo consente.
