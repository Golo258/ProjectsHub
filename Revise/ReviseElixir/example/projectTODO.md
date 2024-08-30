Projekt: 
    System Zarządzania Zadaniami w Linii Komend

Użytkownik i zadania:
    [ ] tworzy
    [ ] przeglada
    [ ] edytuje
    [ ] usuwa 
    [ ] oznacza jako zrobione

Funkcjonalności:
1.Dodawanie zadania:
    dodawanie zadania z tytulem i opisem
    zadanie zapisane do jsona z unique id i done

2. Przegladanie zadań:
    Lista wszystkich zadan, z opcja filtrowania
    done / undone

3. Edytowanie zadania:
    zmiana danych zadania 

4. Usuwanie 
    Usuwanie zadania based on id

6. Zarzadzanie zadaniami w róznych kategoriach:
    tworzenie kategori i przypisywanie zadan

Co się naucze:
    Moduły i Funkcje:
    Struktury danych:
        Listy, mapy, keyword lists – jak używać tych struktur w praktyce.
    Pattern matching
        Dopasowywanie wzorców przy pracy z danymi, w szczególności przy pracy z JSON-em.
    Processy i Współbieżność:
        Tworzenie procesów do zarządzania zadaniami, zadań wykonywanych równolegle (np. zapis do pliku w tle).
    GenServer i OTP:
        Używanie OTP do zarządzania stanem aplikacji i implementacja GenServer do zarządzania stanem zadań.
    Pliki:
        Odczyt i zapis do plików, serializacja danych do formatu JSON.
    Error Handling:
        Zarządzanie błędami, np. brak dostępu do pliku, błędne dane wejściowe.

#-------------------
Etap 1: Podstawowa Struktura

    Stwórz moduły i podstawowe funkcje: dodawanie, przeglądanie, edycja, usuwanie zadań.

    Pracuj nad logiką zarządzania zadaniami w pamięci.
Etap 2: Zarządzanie Stanem z GenServer
    Implementuj GenServer do zarządzania stanem aplikacji.
    
    Naucz się, jak uruchamiać procesy i zarządzać stanem za pomocą OTP.

Etap 3: Praca z Plikami
    Dodaj obsługę zapisu i odczytu z pliku JSON.
    Naucz się serializacji i deserializacji danych.

Etap 4: Rozbudowa Funkcjonalności
    Dodaj kategorie i rozbudowane filtry.
    Dodaj obsługę wyjątków i zaawansowane funkcje współbieżności.