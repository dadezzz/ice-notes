---
title: Istruzioni condizionali
---

# `if`

Analizza una condizione e se vera, esegue il codice all'interno del blocco.

```c
#include <stdio.h>

int main() {
  char exec_choice = 'n';

  printf("Execute? (y/n): ");
  scanf("%c", &exec_choice);

  if (exec_choice == 'y') {
    exec_code();

    printf("Code was executed.\n");
  } else {
    // Questo blocco è opzionale.
    printf("Code was not executed\n");
  }

  return 0;
}
```

# `switch`

```c
switch (espressione) {
  case valore1: {
    // istruzioni
  }
  case valore2: {
    // istruzioni
    // Eseguito anche se `espressione` è uguale a `valore1`.
  }
  default: {
    // istruzioni
    // Eseguito anche se `espressione` è uguale a `valore1` o `valore2`.
  }
}
```

Dopo avere valutato l'espressione, se il suo valore corrisponde a `valore1`, il
programma inizia ad eseguire da `valore1` in giù (tutti i casi sotto a `valore1`
vengono eseguiti). Per evitare questa cosa è necessario aggiungere l'istruzione
`break` alla fine del case in cui si vuole interrompere.

Il caso `default` non è obbligatorio ma viene eseguito se il valore di
`espressione` è diverso da tutti gli altri.

```c
switch (espressione) {
  case valore1: {
    // istruzioni
    break;
  }
  default: {
    // istruzioni
    // Non viene eseguito se `espressione` ha valore `valore1`.
  }
}
```

# Operatore ternario

`condizione ? e1 : e2`: se la condizione è vera, dà come risultato e1, sennò e2.

Si usa per scrivere blocchi `if` `else` in maniera compatta.
