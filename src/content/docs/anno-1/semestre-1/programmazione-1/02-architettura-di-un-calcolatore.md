---
title: Architettura di un calcolatore
---

# Livelli di astrazione di un calcolatore

Un computer è composto da diversi livelli di astrazione:

- applicazioni;
- software di sistema;
- sistema operativo;
- hardware;

Per ogni livello c'è un interfaccia sempre più astratta per comunicare con
quello sotto.

# Hardware

Macchina di Von Neumann: componenti del calcolatore comunicano attraverso un bus
di sistema. È l'architettura più diffusa al giorno d'oggi.

```none
 ----------bus di sistema---------
 |     |         |               |
CPU   RAM   periferiche   memoria di massa
```

- **bus di sistema**: consente la comunicazione tra componenti;
- **CPU**: elaborazione delle istruzioni;
- **RAM**: memorizza dati e istruzioni mentre il computer è acceso;
- **memoria di massa**: memorizza dati in maniera persistente;
- **periferiche**: mouse, tastiera, schermo, …;

# CPU

La velocità di un processore è determinata dal numero di transistors e da quante
istruzioni al secondo riesce a completare.

- **Legge di Moore**: ogni 18 mesi la dimensione di un transistor si dimezza.
- **Clock speed**: rimasta circa la stessa dall'inizio degli anni 2000.

## Fetch, decode, execute

La CPU esegue sempre lo stesso ciclo:

1. carica le istruzioni da eseguire dalla RAM;
2. interpreta le istruzioni;
3. esegue le istruzioni;

Il suo lavoro è regolato da un clock, più è elevata la frequenza, più
(teoricamente) è alta la velocità.

Le fasi di elaborazione si susseguono sempre in modo sequenziale.

# RAM

La RAM, o memoria centrale, è un tipo di memoria non persistente, ad ogni avvio
i suoi contenuti si resettano e assumono valori casuali.

Nella RAM sono caricati i programmi al loro avvio in modo che essi possano poi
essere letti dalla CPU.

Si chiama RAM (Random Access Memory) perché è possibile accedere a qualsiasi
elemento nella stessa quantità di tempo indipendentemente dalla posizione in cui
esso si trova.

## Rappresentazione dei dati

La RAM è composta da una sequenza di celle, ognuna delle quali contiene una
parola (word). La grandezza di una word dipende dal processore (32/64 bit).

I computer rappresentano l'informazione in modo binario `0` o `1`, quindi una
memoria da 64 bit indica che in ogni cella si trova una sequenza di 64 `0` o
`1`.
