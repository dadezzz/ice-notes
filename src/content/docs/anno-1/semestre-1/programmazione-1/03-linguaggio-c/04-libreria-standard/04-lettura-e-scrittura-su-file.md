---
title: Lettura e scrittura su file
---

# Files in C

Sono un contenitore di informazioni, accessibili con operazioni read e write.

Sono immagazzinati su una periferica (per esempio su un disco).

L'accesso ai file è gestito dal sistema operativo. Per accedervi, un programma
deve usare la sua interfaccia.

In C i files vengono astratti come streams (flussi). Il livello di astrazione è
tale da poter usare le stesse funzioni per accedere a files su periferiche
diverse.

# Streams

Uno stream è una sorgente o destinazione di dati associata ad un file, una
regione di memoria, il bus di una periferica...

Ogni stream deve essere aperto e poi richiuso quando non serve più. Quando si
arriva alla fine di uno stream si trova il carattere `EOF`.

Uno stream può contenere:

- caratteri (non è sicuro che un carattere sia esattamente equivalente quando si
  cambia piattaforma (per esempio windows traduce `\n` in `\r\n`));
- dati binari;

## Ciclo di vita di uno stream

Uno stream deve essere aperto dal programma con la funzione `fopen`. Non è
garantito che questa operazione vada a buon termine (permessi insufficienti,
file inesistente, ...).

L'apertura di uno stream restituisce un puntatore ad una struttura di tipo
`FILE` che indica la regione di memoria in cui il sistema operativo ha caricato
il file.

Al termine dell'utilizzo è necessario chiudere il flusso con `fclose`. Durante
la chiusura i dati vengono forzatamente scritti sul disco (flushing). Se i files
non vengono chiusi, è possibile che alcune informazioni restino in memoria e
vadano perse.

## Standard streams

All'avvio di un programma, vengono aperti automaticamente 3 flussi:

- `stdout` e `stderr`: sono streams di caratteri in direzione output;
- `stdin`: è uno stream di caratteri dati in input al programma;

Le strutture `FILE` di questi 3 flussi sono definite come costanti nell'header
`stdio.h`.

## Funzioni per manipolare gli stream

Le funzioni usate per gestire gli stream si trovano in `stdio.h`.

La libreria è la stessa che si usa per l'IO con schermo e tastiera perché,
seguendo la filosofia UNIX, ogni periferica in C viene rappresentata come un
file.

### `FILE *fopen(const char *filename, const char *mode)`

- Apre un file (o lo crea se non esiste).
- Restituisce un `FILE*`.

Il secondo parametro è la modalità con cui si vuole aprire il file:

- `r`: apre il file in sola lettura;
- `w`: apre il file e permette anche la scrittura;
- `rb` e `wb` sono uguali ma aprono il file come uno stream binario;
- `a` apre il file in modalità scrittura ma `FILE*` punta alla sua fine, in modo
  da poter appendere contenuti ad esso;

### `int fclose(FILE *stream)`

- Chiude lo stream.
- Scrive forzatamente i dati nella loro destinazione (flush).
- Restituisce 0 se ha successo.

### Funzioni di lettura e scrittura

| R/W su standard streams               | R/W su file                                           |
| ------------------------------------- | ----------------------------------------------------- |
| `int getchar()`                       | `int fgetc(FILE *stream)`                             |
| `int putchar(int ch)`                 | `int fputc(int ch, FILE *stream)`                     |
| `int gets()`                          | `char *fgets(char *s, int length, FILE *stream)`      |
| `int puts(char *s)`                   | `int *fputs(char *s, FILE *stream)`                   |
| `int printf(const char *format, ...)` | `int fprintf(FILE *stream, const char *format, ...);` |
| `int scanf(const char *format, ...)`  | `int fscanf(FILE *stream, const char *format, ...);`  |

Tutte restituiscono `EOF` on un valore negativo in caso di errore.

### Lettura e scrittura di file binari

- `size_t fread(void *buffer, size_t size, size_t count, FILE *stream)`: legge
  `count * size` bytes dal file `stream` e li immagazzina in memoria (`buffer`).
- `size_t fwrite(void *buffer, size_t size, size_t count, FILE *stream)`: scrive
  `count * size` bytes di dati da `buffer` ad un file.

Le funzioni restituiscono il numero di elementi letti o scritti. Se il numero è
diverso da `count`, allora bisogna usare `ferror` o `feof`.

### Accesso ad una posizione arbitraria di un file

`int fseek(FILE *stream, long offset, int origin)` permette di spostarsi di
`offset` bytes dalla posizione iniziale (`origin`).

`origin` può ricevere 3 valori:

- `SEEK_SET`: inizio del file;
- `SEEK_CUR`: posizione corrente nel file;
- `SEEK_END`: fine del file;

`void rewind(FILE *stream)` equivale a `fseek(stream, 0, SEEK_SET)`.

# Altre operazioni con i file

- `int rename(const char* old_filename, const char* new_filename)`: rinomina un
  file;
- `int remove(const char* pathname)`: rimuove un file;

# Gestione degli errori

`int ferror(FILE *stream)` restituisce un numero diverso da 0 se c'è stato un
errore durante le operazioni di lettura/scrittura su quel file.

`int feof(FILE *stream)` restituisce un numero diverso da 0 se è stata raggiunta
la fine di un file.

Per capire se si è arrivati alla fine di un file:

- `feof()` ritorna 1;
- `scanf()` non ritorna un numero pari a quello di argomenti da riempire;

# Esempi

Scrittura su file.

```c
#include <stdio.h>

int main(void) {
  int var = 12;

  /* Apre un file in modalità scrittura, se la path non è assoluta allora il
  file è aperto in una posizione relativa alla cartella corrente. */
  FILE *fp = fopen("example.txt", "w");

  /* Controlla che l'apertura del file non abbia avuto errori. */
  if (fp == NULL) {
    printf("failed to open file: %d", ferror(fp));
    return 1;
  }

  /* Scrive il contenuto di var in fp. Se il file fosse binario bisognerebbe
  usare `fwrite()` */
  fprintf(fp, "%d", var);

  /* Chiude il file così i contenuti sono forzatamente scritti sul disco prima
  di uscire. */
  fclose(fp);

  return 0;
}
```

Lettura da file.

```c
#include <stdio.h>

int main(void) {
  int var;

  /* Apre un file in modalità letture, se la path non è assoluta allora il file
  è aperto in una posizione relativa alla cartella corrente. */
  FILE *fp = fopen("example.txt", "r");

  /* Controlla che l'apertura del file non abbia avuto errori. */
  if (fp == NULL) {
    printf("failed to open file: %d", ferror(fp));
    return 1;
  }

  /* Legge il contenuto di fp in var. Se il file fosse binario bisognerebbe
  usare `fread()` */
  fscanf(fp, "%d", &var);

  /* Chiude il file. Meglio farlo anche se non ci sono contenuti da scrivere. */
  fclose(fp);

  return 0;
}
```
