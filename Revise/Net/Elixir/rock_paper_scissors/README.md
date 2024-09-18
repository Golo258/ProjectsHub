# Kamień, Papier, Nożyce - Gra Wieloosobowa w Elixirze

## Opis

Projekt implementuje system rozgrywki w kamień, papier, nożyce, gdzie kilku graczy rozgrywa wiele rund między sobą. Gra toczy się w trybie turowym — w każdej turze wszyscy gracze podejmują decyzję (kamień, papier lub nożyce), a następnie porównywane są ich wyniki. Na koniec każdej rundy:

- Gracz, który wygrał najwięcej pojedynków, dostaje punkt.
- Po zadanej liczbie rund (np. 5) wybierany jest zwycięzca na podstawie liczby punktów.

## Założenia

1. **Gracze**: Każdy gracz wybiera swoją opcję losowo.
2. **Rozgrywka**: Musisz stworzyć system, który porównuje wybory graczy i określa, kto wygrał daną rundę.
3. **Kolejki**: Gra toczy się w turach i musisz obsługiwać logikę każdej tury.
4. **Zwycięzca**: Zwycięzcą jest ten, kto wygra najwięcej rund.

## Funkcje do zaimplementowania

1. **Struktura Danych na Graczy**
    - Stwórz moduł `Player`, który będzie reprezentować pojedynczego gracza.

2. **Funkcja Rozgrywająca Jedną Rundę**
    - Zaimplementuj funkcję w module `Game`, która obsługuje jedną rundę gry. Porównuj wybory graczy i przyznawaj punkty zwycięzcom.

3. **Funkcja Symulująca Serię Rund**
    - Zaimplementuj funkcję, która przeprowadza zadaną liczbę rund (np. 5) i wyłania zwycięzcę na podstawie liczby zdobytych punktów.

4. **Wyświetlanie Wyników**
    - Wyświetl wynik po każdej rundzie oraz na koniec gry.

## Struktura Katalogów i Plików

1. `lib/rock_paper_scissors/player.ex`:
    - Moduł `Player`, który reprezentuje gracza i losowo wybiera opcję (kamień, papier lub nożyce).

2. `lib/rock_paper_scissors/game.ex`:
    - Moduł `Game`, który zarządza rozgrywką, porównuje wybory graczy, przyznaje punkty i ogłasza zwycięzcę.

3. `lib/rock_paper_scissors.ex`:
    - Główny moduł aplikacji, który uruchamia grę i symuluje rozgrywkę.

## Instrukcje Użytkowania

1. **Inicjalizacja projektu**:
   ```sh
   mix new rock_paper_scissors --module RockPaperScissors
   cd rock_paper_scissors
