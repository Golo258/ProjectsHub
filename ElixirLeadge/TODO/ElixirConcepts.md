
## 1. Podstawy Elixira (poza typami danych)
- [x] **Moduły i Funkcje:**
    - [x] Tworzenie modułów (`defmodule`).
    - [x] Definiowanie funkcji (`def`, `defp`).
    - [x] Arity (liczba argumentów funkcji) i jej znaczenie.
    - [x] Rekursja i wywołania ogonowe (tail call recursion).
- [x] **Wzorce Dopasowania (Pattern Matching):**
    - [x] Dopasowanie wzorców w przypisaniach.
    - [x] Dopasowanie w funkcjach.
    - [x] Case, cond, if - różnice i zastosowanie.
- [x] **Funkcje Anonimowe (Lambdy):**
    - [x] Definiowanie i używanie funkcji anonimowych.
    - [x] Skrócona notacja `&`.
- [x] **Pipelining (`|>`):**
    - [x] Łańcuchy operacji z wykorzystaniem operatora pipe.
    - [x] Tworzenie bardziej czytelnego i zwięzłego kodu.

## 2. Zaawansowane Koncepty Elixira
- [x] **Comprehensions:**
    - [x] Tworzenie i filtrowanie kolekcji za pomocą comprehensions.
- [x] **Metaprogramowanie (Makra):**
    - [x] Podstawy makr (`defmacro`).
    - [x] Tworzenie własnych makr.
- [x] **Protokół (`Protocol`):**
    - [x] Definiowanie i implementacja protokołów.
    - [x] Korzystanie z protokołów w kontekście polimorfizmu.

## 3. Praca z Kolekcjami
- [x] **Listy:**
    - [x] Operacje na listach: map, reduce, filter.
    - [x] Wzorce na listach (`[head | tail]`).
- [x] **Mapy i Słowniki:**
    - [x] Tworzenie i aktualizowanie map.
    - [x] Dostęp do wartości i wzorce na mapach.
- [x] **Tuple i Structs:**
    - [x] Różnice między tuple i struct.
    - [x] Tworzenie i używanie struct.

## 4. Concurrency (Współbieżność)
- [x] **Procesy:**
    - [x] Tworzenie procesów (`spawn`, `Task`).
    - [x] Komunikacja między procesami (`send`, `receive`).
- [x] **GenServer:**
    - [x] Podstawy GenServera.
    - [x] Tworzenie własnych serwerów.
- [x] **Task i Agent:**
    - [x] Zarządzanie stanem za pomocą `Agent`.
    - [x] Asynchroniczne zadania za pomocą `Task`.
- [ ] **Supervisory Trees:**
    - [ ] Tworzenie drzew nadzorujących.
    - [ ] Strategie restartu procesów.

## 5. OTP (Open Telecom Platform)
- [ ] **Podstawy OTP:**
    - [ ] Architektura OTP i jej komponenty.
- [ ] **GenServer i Supervisors:**
    - [x] Zaawansowane wzorce projektowe z użyciem GenServer.
    - [x] Tworzenie i zarządzanie Supervisorami.
- [ ] **Application:**
    - [ ] Tworzenie aplikacji OTP.
    - [ ] Start i zatrzymywanie aplikacji.

## 6. Testowanie
- [x] **ExUnit:**
    - [x] Tworzenie testów jednostkowych.
    - [x] Testowanie z użyciem mocków i stubbów.
- [ ] **Property-Based Testing:**
    - [ ] Testowanie z wykorzystaniem `StreamData`.

## 7. Debugowanie i Optymalizacja
- [ ] **IEx:**
    - [ ] Interaktywne testowanie kodu.
    - [ ] Debugowanie w IEx.
- [ ] **Profiling i optymalizacja:**
    - [ ] Użycie narzędzi do profilowania kodu (np. `:fprof`).
    - [ ] Optymalizacja kodu pod kątem wydajności.

## 8. Integracja z Erlangiem
- [ ] **Wywoływanie kodu Erlanga z Elixira:**
    - [ ] Interoperacyjność między Elixirem a Erlangiem.
    - [ ] Korzystanie z bibliotek napisanych w Erlangu.
- [ ] **Supervisory Trees w Erlangu i Elixirze:**
    - [ ] Tworzenie drzew nadzorujących w obu językach.
    - [ ] Migracja kodu między Elixirem a Erlangiem.

## 9. Tworzenie i Zarządzanie Projektami
- [ ] **Mix:**
    - [ ] Tworzenie i zarządzanie projektami z użyciem Mix.
    - [ ] Definiowanie zależności i zarządzanie środowiskiem.
- [ ] **Releases:**
    - [ ] Tworzenie i zarządzanie wydaniami aplikacji.

## 10. Web Development z Phoenix
- [ ] **Podstawy Phoenix:**
    - [ ] Tworzenie aplikacji webowych z Phoenix.
    - [ ] Routing, kontrolery, widoki.
- [ ] **LiveView:**
    - [ ] Tworzenie dynamicznych aplikacji webowych w czasie rzeczywistym.
    - [ ] Praca z komponentami LiveView.

## 11. Narzędzia i Biblioteki
- [ ] **Ecto:**
    - [ ] ORM dla Elixira, zarządzanie bazami danych.
- [ ] **Nerves:**
    - [ ] Tworzenie aplikacji na urządzenia IoT.
- [ ] **Hex i HexDocs:**
    - [ ] Zarządzanie zależnościami i korzystanie z dokumentacji online.