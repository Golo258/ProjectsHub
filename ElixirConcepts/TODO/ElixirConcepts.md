# Plan Nauki Elixira - Przygotowanie do Pracy

## Spis Treści
1. [Podstawy Elixira](#1-podstawy-elixira)
2. [Zaawansowane Koncepty Elixira](#2-zaawansowane-koncepty-elixira)
3. [Praca z Kolekcjami](#3-praca-z-kolekcjami)
4. [Concurrency (Współbieżność)](#4-concurrency-współbieżność)
5. [OTP (Open Telecom Platform)](#5-otp-open-telecom-platform)
6. [Testowanie](#6-testowanie)
7. [Debugowanie i Optymalizacja](#7-debugowanie-i-optymalizacja)
8. [Integracja z Erlangiem](#8-integracja-z-erlangiem)
9. [Zarządzanie Projektami](#9-zarządzanie-projektami)

---

## 1. Podstawy Elixira

- [x] **Moduły i Funkcje:**
  - [x] Tworzenie modułów (`defmodule`).
  - [x] Definiowanie funkcji (`def`, `defp`).
  - [x] Arity (liczba argumentów funkcji) i jej znaczenie.
  - [x] Rekursja i wywołania ogonowe (tail call recursion).

- [x] **Wzorce Dopasowania (Pattern Matching):**
  - [x] Dopasowanie wzorców w przypisaniach.
  - [x] Dopasowanie w funkcjach.
  - [x] `case`, `cond`, `if` - różnice i zastosowanie.

- [x] **Funkcje Anonimowe (Lambdy):**
  - [x] Definiowanie i używanie funkcji anonimowych.
  - [x] Skrócona notacja `&`.

- [x] **Pipelining (`|>`):**
  - [x] Łańcuchy operacji z wykorzystaniem operatora pipe.
  - [x] Tworzenie bardziej czytelnego i zwięzłego kodu.

---

## 2. Zaawansowane Koncepty Elixira

- [x] **Comprehensions:**
  - [x] Tworzenie i filtrowanie kolekcji za pomocą comprehensions.

- [x] **Metaprogramowanie (Makra):**
  - [x] Podstawy makr (`defmacro`).
  - [x] Tworzenie własnych makr.

- [x] **Protokół (`Protocol`):**
  - [x] Definiowanie i implementacja protokołów.
  - [x] Korzystanie z protokołów w kontekście polimorfizmu.

---

## 3. Praca z Kolekcjami

- [x] **Listy:**
  - [x] Operacje na listach: `map`, `reduce`, `filter`.
  - [x] Wzorce na listach (`[head | tail]`).

- [x] **Mapy i Słowniki:**
  - [x] Tworzenie i aktualizowanie map.
  - [x] Dostęp do wartości i wzorce na mapach.

- [x] **Tuple i Structs:**
  - [x] Różnice między tuple i struct.
  - [x] Tworzenie i używanie struct.

---

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

---

## 5. OTP (Open Telecom Platform)

- [x] **GenServer i Supervisors:**
  - [x] Zaawansowane wzorce projektowe z użyciem GenServer.
  - [x] Tworzenie i zarządzanie Supervisorami.

- [ ] **Application:**
  - [ ] Tworzenie aplikacji OTP.
  - [ ] Start i zatrzymywanie aplikacji.

---

## 6. Testowanie

- [x] **ExUnit:**
  - [x] Tworzenie testów jednostkowych.
  - [x] Testowanie z użyciem mocków i stubbów.
    - [x] Korzystanie z `Mox` do mockowania i stubbowania.

---

## 7. Debugowanie i Optymalizacja

- [ ] **IEx:**
  - [ ] Interaktywne testowanie kodu.
  - [ ] Debugowanie w IEx.

- [ ] **Profiling i optymalizacja:**
  - [ ] Użycie narzędzi do profilowania kodu (np. `:fprof`).
  - [ ] Optymalizacja kodu pod kątem wydajności.

---

## 8. Integracja z Erlangiem

- [ ] **Wywoływanie kodu Erlanga z Elixira:**
  - [ ] Interoperacyjność między Elixirem a Erlangiem.
  - [ ] Korzystanie z bibliotek napisanych w Erlangu.

- [ ] **Supervisory Trees w Erlangu i Elixirze:**
  - [ ] Tworzenie drzew nadzorujących w obu językach.
  - [ ] Migracja kodu między Elixirem a Erlangiem.

---

## 9. Zarządzanie Projektami

- [ ] **Mix:**
  - [ ] Tworzenie i zarządzanie projektami z użyciem Mix.
  - [ ] Definiowanie zależności i zarządzanie środowiskiem.

- [ ] **Releases:**
  - [ ] Tworzenie i zarządzanie wydaniami aplikacji.

---

## Notatki Dodatkowe

- Jeśli jesteś zainteresowany, warto również opanować podstawy **Phoenix** w kontekście budowania aplikacji webowych oraz **Ecto** do zarządzania bazami danych, jednak priorytetem mogą być bardziej ogólne i zaawansowane narzędzia, których możesz używać w Nokii.
