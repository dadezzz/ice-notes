---
title: Rappresentazione di dati
---

Definizione astratta: è un insieme di valori su cui si possono applicare
operazioni.

Riguardo alla memoria, i tipi indicano come interpretare la sequenza di bit ad
un certo indirizzo e anche le dimensioni di quella sequenza.

Ogni linguaggio di programmazione offre dei tipi predefiniti e la possibilità di
creare tipi composti a partire da essi.

# Tipi semplici

## Numeri interi

Sono sequenze finite di byte.

Nel sistema decimale le cifre vanno da 1 a 10 e sono ordinate dalla più
significativa (a sinistra) alla meno significativa.

Anche nella rappresentazione binaria dei numeri si usa questo ordinamento,
quindi il numero `10011` equivale a
`1 * 2^4 + 0 * 2^3 + 0 * 2^2 + 1 * 2^1 + 1 * 2^0`.

Il bit più a sinistra è detto MSB (most significant bit).

Modi di rappresentare il segno:

- Aggiungendo un altro bit all'inizio del numero (non conviene perché si usa un
  bit in più).
- Complemento a 2: se il MSB è 0, procedi normalmente, se è 1 procedi
  normalmente e poi sottrai $2^{n-1}$ dove $n$ è il numero di bit usati per
  rappresentare il numero.

  Con questa tecnica non c'è bisogno di implementare circuiti apposta, le
  operazioni tra numeri negativi e positivi vengono giuste in qualsiasi caso.

### `int`

Rappresentano numeri positivi o negativi interi.

Di solito usano 2 o 4 bytes in memoria.

Qualificatori (cambiano le proprietà di una variabile int):

- spazio in memoria:
  - `short`: occupa meno spazio in memoria;
  - `long`: occupa più spazio in memoria;
- segno
  - `signed`: il numero può essere negativo;
  - `unsigned`: contiene il doppio dei numeri ma non possono essere negativi;

È possibile conoscere i limiti di valore che un `int` può contenere con le
costanti nella testata `limits.h`: `INT_MIN` e `INT_MAX`.

I qualificatori si usano durante la dichiarazione di una variabile, prima della
parola chiave `int`:

```c
unsigned long a = 393939;
```

Anche i `char` possono essere usati come `int` molto piccoli, in ordine
crescente di grandezza:

- `char`
- `short`
- `int`
- `long`

### `char` (caratteri ascii)

Rappresentano i caratteri della tabella ASCII.

Sono praticamente interi e condividono tutte le loro proprietà.

Anche un `char` può essere `signed` o `unsigned`.

## Numeri frazionari

I numeri con una parte decimale sono codificati diversamente dai numeri interi
in 2 modi:

- tecnica a virgola fissa: non viene usata spesso;
- tecnica a virgola mobile: usata in quasi tutti i computer;

Standard IEEE-754 semplificato (in un float i bit sono distribuiti così da
sinistra a destra):

- 1 (1 bit): segno;
- 2-9 (8 bit): esponente $x$ in forma di complemento a 2;
- 10-32 (23 bit): mantissa $m$;

Il numero si ottiene calcolando $\pm 2^{x} m$. La mantissa rappresenta le cifre
significative, l'esponente indica dove mettere la virgola.

### `float` e `double`

Rappresentano numeri frazionari, la precisione è data da un numero massimo di
cifre significative.

- `float`
- `double`
- `long double`

I `double` hanno una precisione maggiore di un `float`.

Per codificare questi numeri dalla forma decimale a quella binaria si usa lo
standard IEEE-754.

:::info Per confrontare 2 `float` non si può usare l'operatore `==`, infatti,
vista la loro imprecisione, il risultato potrebbe essere falso anche se i 2
numeri sono praticamente identici.

:::

# Definizione di tipi aggiuntivi

In C ci sono 5 modi di definire altri tipi partendo da quelli elementari:

- `struct`: Dati memorizzati sequenzialmente e ottenibili attraverso una
  relazione 'field = value'.
- `bit-field`: Manipolazione dei singoli bit in memoria per risparmiare spazio.
- `union`: Dati di tipo diverso che possono essere immagazzinati allo stesso
  indirizzo di memoria.
- `enum`: Definizione di un numero limitato di varianti.
- `typedef`: Alias del nome di un altro tipo.

## `struct`

Permettono di definire variabili strutturate che aggregano informazioni anche di
tipo diverso.

Le proprietà di uno `struct` sono chiamate 'campi'.

```c

struct Impiegato {
  char nome[20];
  char cognome[20];
  float stipendio;
  char codicefiscale[16];
}

int main() {
  struct Impiegato impiegato1;
  struct Impiegato impiegati[20];

  // Inizializzare variabili

  // Per accedere ai campi di uno struct si usa l'operatore `.` .
  float stipendio1 = impiegato1.stipendio;
  float stipendio2 = impiegati[3].stipendio;
}
```

## `typedef`

Attraverso un `typedef` è possibile definire un sinonimo di un tipo.

Questo 'nuovo' tipo eredita direttamente tutte le proprietà del tipo di
partenza.

## `enum`

I tipi `enum` rappresentano una serie finita di varianti.

```c
enum DayOfTheWeek {
  Mon,
  Tue,
  Wed,
  Thu,
  Fri,
  Sat,
  Sun,
}
```

Le varianti sono rappresentate come constanti `int` con un nome, con valori che
solitamente partono da 0.

# Conversioni di tipo

Durante un assegnazione, il compilatore converte automaticamente alcuni tipi
numerici tra `int` e `float`.

Le conversioni implicite usano il seguente ordine, quando una variabile è di un
tipo più piccolo, viene convertita in uno più grande e si riprova l'operazione.

`(char = short) < int < long < unsigned < unsigned long < float < double < long double`
