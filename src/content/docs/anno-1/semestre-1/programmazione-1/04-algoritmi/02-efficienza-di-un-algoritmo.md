---
title: Efficienza di un algoritmo
---

# Tempo di esecuzione di un algoritmo ($T(n)$)

Un qualsiasi algoritmo può avere un tempo di esecuzione variabile a seconda del
numero di elementi che deve processare (questo numero è detto `n` o 'taglia').

Il tempo di esecuzione dipende dal numero di istruzioni eseguito che varia al
variare di $n$. $n$ è la dimensione dei dati in ingresso.

Il tempo di esecuzione si esprime generalmente per $n$ tendente ad infinito,
quindi gli algoritmi a crescita lenta o con tempo di esecuzione costate saranno
i più veloci.

## Casi dove considerare la velocità

La complessità di un dato algoritmo si esprime in 3 casi:

- **caso peggiore**: tipo di input in cui l'algoritmo esegue più operazioni (ci
  mette più tempo).
- **caso medio**: stima statistica della complessità dell'algoritmo (se il caso
  peggiore succede poche volte e ha comunque una complessità accettabile,
  l'algoritmo si può ancora considerare buono).
- **caso migliore**: tipologia di input per cui l'algoritmo esegue meno
  operazioni.

## Taglia di un problema

$n$ è detta taglia di un problema e il suo significato può variare:

- algoritmo di ordinamento: numero di elementi da ordinare;
- algoritmo di gestione di dati: quantità di dati da processare;
- algoritmo sui grafi: numero di nodi e archi;

## Notazioni della velocità di algoritmo

- La notazione $O$ fornisce un limite superiore ad una funzione (dato un
  algoritmo con complessità $f(n)$, esso non può essere più lento di $O(n)$ a
  per un numero di elementi abbastanza grande).
- Analogamente la notazione $Ω$ definisce un limite inferiore di $f(n)$, ovvero
  un algoritmo non può eseguire meno operazioni di $Ω(n)$.
- Con la notazione $Θ$ si indica che $f(n)$ è compresa tra 2 funzioni $c1​Θ(n)$
  e $c2​Θ(n)$.

## Dimensione massima dell'input

Per fissare una quantità di tempo massima ($t$) in cui l'algoritmo deve finire
devo stabilire quanto è veloce il computer su cui esso viene eseguito.

Con $X$ si indica il numero di operazioni al secondo che un computer può
eseguire.

Per stabilire qual'è l'$n$ massimo per cui l'algoritmo finisca in un secondo è
necessario risolvere l'equazione:

$$
T(n)=X
$$
