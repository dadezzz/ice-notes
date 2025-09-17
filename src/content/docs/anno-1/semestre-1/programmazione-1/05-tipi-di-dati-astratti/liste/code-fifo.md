---
title: Code FIFO
---

Sono code dove il primo elemento ad essere inserito è il primo ad essere
rimosso.

Una coda FIFO si distingue da una coda LIFO (stack) perché in essa si può
accedere sia al primo che all'ultimo elemento.

## Implementazione di una coda FIFO

```c
// Tipo arbitrario, rappresenta il contenuto di ogni elemento della coda.
typedef Data int;

typedef struct QueueNode {
  Data data;
  QueueNode* next;
} QueueNode;

typedef struct FIFOQueue {
  QueueNode* head;
  QueueNode* tail;
} FIFOQueue;

// Inizializza una coda.
FIFOQueue initQueue() {
  FIFOQueue q;

  q.head = NULL;
  q.tail = NULL;

  return q
}

// De-alloca la memoria utilizzata dagli elementi rimanenti nella coda.
void dropQueue(FIFOQueue* queue) {
  QueueNode* head;

  while (queue->head->next != NULL) {
    head = queue->head;
    queue->head = queue->head->next;

    free(head);
  }
}

// Rimuove il primo elemento della coda.
Data dequeue(FIFOQueue* queue) {
  QueueNode* head = queue->head;

  queue->head = queue->head->next;

  Data data = head->data;
  free(head);

  return data;
}

// Aggiunge un elemento alla fine della coda.
void enqueue(FIFOQueue* queue, Data data) {
  QueueNode* tail = (QueueNode*) malloc(sizeof(QueueNode))

  tail->data = data;
  tail->next = NULL;

  queue->tail->next = tail;
}
```
