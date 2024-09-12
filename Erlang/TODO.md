# Erlang Learning Roadmap
Koncepcje Erlanga


## 1. Podstawy Erlanga

- [ ] **Składnia:**
  - [ ] Tworzenie modułów (`-module()`).
  - [ ] Definiowanie funkcji (`-export()`).
  - [ ] Zmienność zmiennych (jednokrotne przypisanie).
  - [ ] Operacje arytmetyczne i logiczne.
  - [ ] Typy danych: atomy, liczby, listy, krotki (tuples), mapy, rekordy.

- [ ] **Pattern Matching:**
  - [ ] Dopasowanie wzorców w przypisaniach.
  - [ ] Pattern matching w funkcjach.
  - [ ] `case` oraz `if` — różnice i zastosowanie.

- [ ] **Listy:**
  - [ ] Operacje na listach: `map`, `filter`, `foldl`, `foldr`.
  - [ ] List comprehensions.

- [ ] **Mapy i Krotki:**
  - [ ] Tworzenie i aktualizacja map.
  - [ ] Użycie krotek i różnice między nimi a mapami.

---

## 2. Współbieżność w Erlangu

- [ ] **Procesy:**
  - [ ] Tworzenie procesów (`spawn`).
  - [ ] Komunikacja między procesami (`send`, `receive`).
  - [ ] Obsługa wielu procesów w aplikacji.

- [ ] **Linki i Monitory:**
  - [ ] Monitorowanie procesów (`monitor`).
  - [ ] Linkowanie procesów (`link`).
  - [ ] Obsługa awarii w systemach rozproszonych.

- [ ] **Supervisory:**
  - [ ] Tworzenie mechanizmów nadzorowania (Supervisory).
  - [ ] Model aktorów i ich zastosowanie.

---

## 3. OTP (Open Telecom Platform)

- [ ] **GenServer:**
  - [ ] Tworzenie procesów GenServer w Erlangu.
  - [ ] Obsługa wiadomości w GenServer (`handle_call`, `handle_cast`, `handle_info`).
  
- [ ] **Supervisory:**
  - [ ] Tworzenie i zarządzanie drzewami nadzoru (Supervisory Trees).
  - [ ] Definiowanie strategii restartu.

- [ ] **Aplikacje OTP:**
  - [ ] Tworzenie aplikacji OTP.
  - [ ] Start i zatrzymywanie aplikacji.
  - [ ] Korzystanie z `application` do zarządzania stanem aplikacji.

---

## 4. Debugowanie i Optymalizacja

- [ ] **IEx i Shell:**
  - [ ] Interaktywne testowanie kodu w powłoce Erlanga.
  - [ ] Debugowanie procesów w powłoce Erlanga.

- [ ] **Profiling:**
  - [ ] Użycie narzędzi do profilowania kodu (`:fprof`, `:eprof`).
  - [ ] Analiza zużycia zasobów i optymalizacja kodu pod kątem wydajności.

---

## 5. Testowanie

- [ ] **EUnit:**
  - [ ] Tworzenie testów jednostkowych za pomocą EUnit.
  - [ ] Struktura testów w EUnit.

- [ ] **Common Test:**
  - [ ] Tworzenie i zarządzanie testami integracyjnymi.
  - [ ] Użycie `common_test` do testowania rozproszonych systemów.

---

## 6. Interoperacyjność z Elixirem

- [ ] **Wywoływanie kodu Elixira z Erlanga:**
  - [ ] Użycie modułów Elixira w kodzie Erlanga.

- [ ] **Korzystanie z bibliotek Erlanga w Elixirze:**
  - [ ] Integracja kodu napisane w Erlangu z projektami Elixira.

---

## 7. Tworzenie i Zarządzanie Projektami

- [ ] **Rebar3:**
  - [ ] Zarządzanie projektami i zależnościami za pomocą `rebar3`.
  - [ ] Konfiguracja środowiska, budowanie i uruchamianie projektów.

---

## 8. Zaawansowane Koncepcje

- [ ] **Procesy rozproszone:**
  - [ ] Tworzenie systemów rozproszonych (distributed systems) w Erlangu.
  - [ ] Komunikacja między procesami na różnych węzłach (nodes).

- [ ] **Gorące aktualizacje:**
  - [ ] Umożliwienie gorących aktualizacji kodu bez przerywania działania systemu.
  - [ ] Definiowanie wersji aplikacji i migracja stanu.

- [ ] **Kompilacja i wydania:**
  - [ ] Kompilowanie aplikacji i zarządzanie wersjami.
  - [ ] Tworzenie wydania aplikacji z `release` i `sys.config`.

---

## 9. Narzędzia Erlanga

- [ ] **Observer:**
  - [ ] Monitorowanie procesów, komunikacji i zużycia zasobów.
  - [ ] Wizualizacja topologii aplikacji rozproszonych.

- [ ] **Dialyzer:**
  - [ ] Analiza statyczna kodu w celu wykrywania potencjalnych błędów.
  - [ ] Używanie typów i kontraktów (specyfikacja typów w funkcjach).

---

### Dodatkowe Zasoby:

- [ ] **Dokumentacja Erlanga:**
  - [ ] [Oficjalna dokumentacja Erlanga](https://www.erlang.org/docs).
  - [ ] Zasoby związane z OTP i współbieżnością.
  - [ ] Przykłady użycia.

---

