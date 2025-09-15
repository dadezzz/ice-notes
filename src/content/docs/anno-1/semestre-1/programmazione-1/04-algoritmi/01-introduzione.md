---
title: Introduzione
---

Un algoritmo è una sequenza **finita** di operazioni da eseguire, che portano
alla realizzazione di un compito.

Un algoritmo deve essere descritto in maniera non ambigua e deve essere
comprensibile al suo esecutore (quindi di solito si usa lo pseudocodice o un
linguaggio di programmazione).

# Proprietà di un algoritmo:

- correttezza;
- efficienza;

# Metodo top-down

Se un passo dell'algoritmo non è direttamente applicabile, occorre definire un
sub-algoritmo per specificare istruzioni di livello più basso.

Questo metodo si chiama top-down, si parte da istruzioni generali e si espandono
fino ad arrivare a quelle specifiche.

# Esempi di Algoritmi

## Somma con un abaco

```text
a = 4
OOOO---OOOOOOOOOO
b = 7
OOOOOOO---OOOOOOO
a + b = 11
OOOOOOOOOOO---OOO
```

1. Nella prima riga spostare un disco da sinistra a destra;
2. Nella terza riga spostare un disco da destra a sinistra;
3. Ripetere 1, 2 fino ad esaurimento dischi;
4. Ripetere 1, 2, 3 sulla seconda riga;
5. I dischi a sinistra sulla terza riga sono la somma;

## Trovare le soluzioni reali del polinomio $ax^{2} + bx + c = 0$ e stamparle

1. calcolare delta;
2. ottenere i valori dei parametri $a$, $b$, $c$ dall'utente;
3. se $\Delta < 0$:
   1. andare a fine;

   se $\Delta = 0$:
   1. calcolare $\frac{-b}{2 a}$;
   2. stampare soluzione;
   3. fine;

   se $\Delta > 0$:
   1. calcolare $\frac{-b + \sqrt{\Delta}}{2 a}$;
   2. stampare soluzione;
   3. calcolare $\frac{-b - \sqrt{\Delta}}{2 a}$;
   4. stampare soluzione;
   5. fine;

## Calcolo della mediana in un insieme $\{ n_{1}, \ldots, n_{n} \}$

Definizione di mediana: dato un insieme ordinato di numeri, la mediana è il
valore più grande della metà dei numeri più piccoli dell'insieme e il valore più
piccolo della metà dei numeri più grandi. Se l'insieme ha una quantità pari di
elementi, la mediana è la media tra i 2 valori al centro dell'insieme.

1. ordina gli elementi dell'insieme;
2. se l'insieme ha un numero dispari di elementi:
   1. stampa il valore centrale;

   altrimenti:
   1. calcola la media tra i 2 elementi al centro;
   2. stampa il valore ottenuto;

# Formulazione induttiva di un algoritmo

Metodo per formulare algoritmi di casi complessi, partendo da quelli facilmente
dimostrabili.

- **Caso base**: istanza sufficientemente piccola da essere direttamente
  dimostrabile.
- **Caso induttivo**: restanti casi che possono essere risolti a partire da un
  algoritmo che si basa sui casi base.

Questo metodo viene spesso utilizzato nelle funzioni ricorsive.
