---
title: Alberi binari di ricerca
---

# Motivazione

Gli alberi binari ottimizzano il tempo di esecuzione in molte operazioni come:

- inserimento di un elemento;
- eliminazione di un elemento;
- ricerca di un elemento;

## Vantaggi rispetto alle altre strutture

Gli array non possono avere dimensione dinamica (non posso rimuovere o
aggiungere facilmente elementi all'interno.

Le liste non permettono di realizzare algoritmi di ricerca efficiente.

# Definizione ricorsiva

- Un insieme vuoto è un albero binario.
- Se $T_{s}$ e $T_{d}$ sono alberi binari (anche vuoti) e $r$ è un nodo, allora
  la terna ($r$, $T_{s}$, $T_{d}$) è un albero binario, dove $s$ e $d$
  identificano i rami sinistro e destro rispettivamente.

Se un nodo di un albero non ha un padre, allora quel nodo si chiama 'root'.

Se un nodo di un albero non ha altri sottoalberi, allora quel nodo è una foglia
dell'albero.

# Struttura di un albero binario

```cpp
typedef struct TreeNode {
  TreeNode* parent;
  TreeNode* left;
  TreeNode* right;

  Data data;
} TreeNode;
```

Ogni nodo di un albero conosce sia l'indirizzo dei suoi figli, sia quello del
padre.

## Albero binario di ricerca

In un albero binario di ricerca, il valore contenuto nel nodo sinistro è sempre
minore di quello contenuto dal nodo corrente, quello nel nodo destro è sempre
maggiore.

# Livelli, altezza e cammino

In un albero, la radice si trova al livello 0, ogni figlio della radice si
troverà al livello successivo (1) e a sua volta i suoi figli saranno al livello
2…

L'altezza di un albero è il numero massimo di livelli tra una qualsiasi foglia e
la radice dell'albero.

Il cammino di un albero è la somma dei livelli di tutti i nodi dell'albero.
