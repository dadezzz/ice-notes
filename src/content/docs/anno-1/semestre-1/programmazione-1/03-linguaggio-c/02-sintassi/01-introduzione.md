---
title: Sintassi
---

## Caratteristiche generali

- C è un linguaggio case sensitive, distingue maiuscole e minuscole.
- Tutti i caratteri di spaziamento sono ignorati.
- Ci sono 2 modi di commentare:
  - `/* commento */`: commenti multilineari;
  - `// commento`: commenti su una singola linea (a partire da C99);

## Elementi del linguaggio

- **keywords**: parole riservate dal linguaggio, usate per definire le
  operazioni di base del programma (if, for, while, ...);
- **identificatori**: nomi di qualsiasi oggetto definito dal programmatore
  (variabili, funzioni, tipi). Un identificatore non può avere un nome che fa
  parte delle keywords.

### Regole di nomenclatura degli identificatori

Un identificatore può assumere un nome qualsiasi (eccetto quelli riservati dalle
parole chiave), ma deve seguire alcune regole:

- Deve essere una successione di lettere, cifre e simbolo `_`.
- Il primo carattere non può essere una cifra.
- Lettere maiuscole e minuscole creano identificatori diversi.

:::tip

Alcune buone pratiche:

- Evitare di utilizzare lo stesso identificatore per variabili diverse o di
  usare

  più identificatori per la stessa variabile.

- Anche se un identificatore non può contenere spazi, le parole possono essere
  divise facendole iniziare con una lettera maiuscola (`macchinaRossa`), oppure
  separandole con un trattino (`macchina_rossa`).
- È meglio mantenere una certa consistenza sullo stile usato per separare le
  parole.

:::

## Istruzione composta

Tutte le istruzioni raggruppate all'interno di 2 `{}` sono semanticamente
equivalenti ad una singola istruzione.

Dopo ogni frase è sempre necessario aggiungere un `;`. Dopo una `}` non è
necessario ma nemmeno un errore aggiungerlo.
