---
title: Tipologie di operazioni sugli alberi
---

Esistono 4 modi di attraversare un albero binario ed eseguire operazioni sui
suoi nodi che si distinguono in base al momento in cui si esegue l'operazione
sul nodo corrente rispetto ai figli:

- pre-ordine:

  ```text
  operazione()
  nodosx()
  nododx()
  ```

- post-ordine:

  ```text
  nodosx()
  nododx()
  operazione()
  ```

- in-ordine:

  ```text
  nodosx()
  operazione()
  nododx()
  ```

- level-ordine: le operazioni vengono eseguite per tutti i nodi di un certo
  livello, prima di passare al successivo;
