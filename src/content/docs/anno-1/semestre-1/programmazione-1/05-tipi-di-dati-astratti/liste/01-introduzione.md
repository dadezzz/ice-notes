---
title: Liste
---

Insieme di elementi in memoria che contengono un riferimento all'elemento
seguente (o anche precedente) dell'insieme.

- **Stack**: struttura dove l'ultimo elemento inserito è il primo ad essere
  rimosso.
- **Coda**: struttura dove il primo elemento inserito è il primo ad essere
  rimosso.

## Vantaggi e svantaggi

Uno svantaggio degli array è che è difficile trovare una regione libera di
memoria per immagazzinare grandi dimensioni di dati. Le liste risolvono questo
problema; ogni elemento della lista contiene informazioni sulla posizione in
memoria dell'elemento successivo, quindi i dati possono essere immagazzinati in
maniera frammentata.

Inoltre diventa molto facile modificare la dimensione dell'insieme, rimuovendo o
aggiungendo elementi al suo interno.

Lo svantaggio delle liste è che non si può accedere ad un elemento senza
scorrere attraverso tutti i precedenti.

Serve un caso speciale per rappresentare una lista vuota e un valore speciale
che rappresenta la fine della lista.

## Liste semplicemente concatenate

Contengono informazioni solo sulla posizione dell'elemento successivo (a
differenza di quelle che conoscono anche la posizione dell'elemento precedente).
In queste liste è possibile scorrere solo in avanti.

### Struttura generale di una lista

```c
typedef struct ListNode {
  Data data;
  ListNode* next;
} ListNode
```

Il campo `data` può essere di un tipo qualsiasi.

Il campo `next` contiene un puntatore all'indirizzo del prossimo elemento della
lista. Se `next` è l'ultimo elemento della lista, allora il suo valore sarà
`NULL`.

## Implementazione di una lista

```c
typedef struct ListNode {
  int data;
  ListNode* next;
} ListNode

// Inizializza il nodo di una lista.
void init_list(ListNode** first_node) {
  *first_node = NULL;
}

// Controlla se la lista contiene elementi o se è vuota.
int list_empty(ListNode* node) {
  if (node == NULL) {
    return 1;
  }

  return 0;
}

int main() {
  ListNode* list;

  init_list(&list);

  if (list_empty(list)) {
    printf("List empty");
  }

  return 0;
}
```
