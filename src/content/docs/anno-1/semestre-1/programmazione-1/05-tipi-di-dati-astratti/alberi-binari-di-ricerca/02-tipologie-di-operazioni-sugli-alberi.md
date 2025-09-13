---
title: Tipologie di operazioni sugli alberi
---

Esistono 4 modi di attraversare un albero binario ed eseguire operazioni sui
suoi nodi che si distinguono in base al momento in cui si esegue l'operazione
sul nodo corrente rispetto ai figli:

- pre-ordine:

  ```none
  operazione()
  nodosx()
  nododx()
  ```

- post-ordine:

  ```none
  nodosx()
  nododx()
  operazione()
  ```

- in-ordine:

  ```none
  nodosx()
  operazione()
  nododx()
  ```

- level-ordine: le operazioni vengono eseguite per tutti i nodi di un certo
  livello, prima di passare al successivo;
