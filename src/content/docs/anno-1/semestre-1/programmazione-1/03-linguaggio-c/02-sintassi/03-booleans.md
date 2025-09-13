---
title: Booleans
---

In C il tipo `bool` non esiste, in alternativa un `int` con valore `0` è
interpretato come falso e qualsiasi altro valore è vero.

```c
int main() {
  int data = 2;

  if (data == 3) {
    // Non viene eseguito perchè `data == 2`.
    printf("false");
  }

  // L'istruzione `data = 3` dà come valore `3`, quindi il compilatore lo
  // interpreta come un valore pari a vero. Questo è un errore che si
  // commette spesso.
  if (data = 3) {
    // Viene eseguito e `data` assume valore 3.
    printf("true")
  }

  return 0;
}
```

# Algebra di Boole

Nasce dall'esigenza di stabilire se espressioni sono vere o false, in modo da
condizionare il corso del programma.

Nell'algebra di Boole le variabili possono assumere solo 2 valori (1|0,
true|false).

## Operazioni

- NOT (`!`): inverte il valore di un espressione (operatore unario);
- AND (`&&`): ha valore vero se entrambi gli operandi sono veri (operatore
  binario);
- OR (`||`): ha valore vero se almeno uno degli operandi è vero (operatore
  binario);

## Proprietà

- commutativa:
  - `a || b` = `b || a`;
  - `a && b` = `b && a`;
- distributiva:
  - `a && (b || c)` = `(a && b) || (b && c)`;
  - `a || (b && c)` = `(a || b) && (b || c)`;

## Regole di precedenza

Dall'operatore con precedenza maggiore a quello con la minore:

1. NOT
2. AND
3. OR

## Vocabolario

- contraddizione: espressione sempre falsa;
- tautologia: espressione sempre vera;
