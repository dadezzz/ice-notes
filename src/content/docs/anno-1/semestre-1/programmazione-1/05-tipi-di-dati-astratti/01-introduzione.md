---
title: Introduzione
---

Sono dei contenitori che permettono delle operazioni su insiemi di contenuti di
un tipo dato.

##

### Struttura generale di una lista

### Inizializzazione di una lista

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
