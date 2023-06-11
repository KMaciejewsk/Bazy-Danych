-- Dodawanie kategorii
INSERT INTO Kategoria (ID_kategorii, Nazwa_kategorii)
VALUES (1, 'Telefony'), (2, 'Meble');

-- Dodawanie produktów dla Kategorii 1
INSERT INTO Produkt (ID_produktu, Nazwa, Cena, Opis, ID_kategorii)
VALUES
  (1, 'iPhone X', 19.99, 'Ajfon 10', 1),
  (2, 'iPhone 11', 1999.99, 'Ajfon 11', 1),
  (3, 'iPhone 12', 2299.99, 'Ajfon 12', 1),
  (4, 'iPhone 13', 2499.99, 'Ajfon 13', 1),
  (5, 'iPhone 14', 3999.99, 'Ajfon 14', 1);

-- Dodawanie produktów dla Kategorii 2
INSERT INTO Produkt (ID_produktu, Nazwa, Cena, Opis, ID_kategorii)
VALUES
  (6, 'krzeslo', 12.99, 'krzeslo', 2),
  (7, 'sofa', 299.99, 'sofa', 2),
  (8, 'szafa', 79.99, 'szafa', 2),
  (9, 'lampa', 11.99, 'swieci', 2),
  (10, 'kuchnia', 5999.99, 'granitowa', 2);

-- Dodawanie adresów
-- Adres 1
INSERT INTO Adres (ID_adresu, Ulica, Miasto, Kod_pocztowy, Kraj)
VALUES (1, 'ul. Przykładowa 1', 'Warszawa', '00-001', 'Polska');

-- Adres 2
INSERT INTO Adres (ID_adresu, Ulica, Miasto, Kod_pocztowy, Kraj)
VALUES (2, 'ul. Testowa 2', 'Kraków', '30-002', 'Polska');

-- Adres 3
INSERT INTO Adres (ID_adresu, Ulica, Miasto, Kod_pocztowy, Kraj)
VALUES (3, 'ul. Nowa 3', 'Gdańsk', '80-003', 'Polska');

-- Adres 4
INSERT INTO Adres (ID_adresu, Ulica, Miasto, Kod_pocztowy, Kraj)
VALUES (4, 'ul. Prosta 4', 'Poznań', '61-004', 'Polska');

-- Dodawanie magazynów
-- Magazyn 1
INSERT INTO Magazyn (ID_magazynu, Nazwa_magazynu, ID_adresu)
VALUES (1, 'Magazyn 1', 1);

-- Magazyn 2
INSERT INTO Magazyn (ID_magazynu, Nazwa_magazynu, ID_adresu)
VALUES (2, 'Magazyn 2', 2);

-- Kategorie dla Magazynu 1
INSERT INTO Magazyn_Kategoria (ID_magazynu, ID_kategorii)
VALUES (1, 1);
INSERT INTO Magazyn_Kategoria (ID_magazynu, ID_kategorii)
VALUES (1, 2);

-- Kategorie dla Magazynu 2
INSERT INTO Magazyn_Kategoria (ID_magazynu, ID_kategorii)
VALUES (2, 2);

-- Dodawanie klientów
-- Klient 1
INSERT INTO Klient (ID_klienta, Imię, Nazwisko, Email, Numer_telefonu, ID_adresu)
VALUES (1, 'Jan', 'Kowalski', 'jan.kowalski@gmail.com', '997', 3);

-- Klient 2
INSERT INTO Klient (ID_klienta, Imię, Nazwisko, Email, Numer_telefonu, ID_adresu)
VALUES (2, 'Anna', 'Nowak', 'anna.nowak@gmail.com', '502456305', 4);

-- Dodawanie zamówień
-- Zamówienie 1 (dla klienta 1)
INSERT INTO Zamówienie (ID_zamówienia, Data_zamówienia, Status, ID_klienta)
VALUES (1, '2023-06-09', 'W trakcie realizacji', 1);

-- Zamówienie 2 (dla klienta 1)
INSERT INTO Zamówienie (ID_zamówienia, Data_zamówienia, Status, ID_klienta)
VALUES (2, '2023-06-10', 'Zakończone', 1);

-- Zamówienie 3 (dla klienta 2)
INSERT INTO Zamówienie (ID_zamówienia, Data_zamówienia, Status, ID_klienta)
VALUES (3, '2023-06-11', 'W trakcie realizacji', 2);

-- Dodawanie produktów do zamówień
-- Produkty dla zamówienia 1
INSERT INTO Zamówienie_Produkt (ID_zamówienia, ID_produktu, Ilość)
VALUES (1, 1, 3); -- Zamówienie 1: Produkt 1, ilość 3
INSERT INTO Zamówienie_Produkt (ID_zamówienia, ID_produktu, Ilość)
VALUES (1, 2, 2); -- Zamówienie 1: Produkt 2, ilość 2

-- Produkty dla zamówienia 2
INSERT INTO Zamówienie_Produkt (ID_zamówienia, ID_produktu, Ilość)
VALUES (2, 1, 5); -- Zamówienie 2: Produkt 1, ilość 5
INSERT INTO Zamówienie_Produkt (ID_zamówienia, ID_produktu, Ilość)
VALUES (2, 3, 1); -- Zamówienie 2: Produkt 3, ilość 1

-- Produkty dla zamówienia 3
INSERT INTO Zamówienie_Produkt (ID_zamówienia, ID_produktu, Ilość)
VALUES (3, 2, 4); -- Zamówienie 3: Produkt 2, ilość 4
INSERT INTO Zamówienie_Produkt (ID_zamówienia, ID_produktu, Ilość)
VALUES (3, 3, 3); -- Zamówienie 3: Produkt 3, ilość 3

-- Tabele
CREATE TABLE Zamówienia_Produkty (
  ID_zamówienia INT,
  ID_produktu INT,
  Ilość INT,
  Cena DECIMAL(10, 2),
  PRIMARY KEY (ID_zamówienia, ID_produktu),
  FOREIGN KEY (ID_zamówienia) REFERENCES Zamówienie(ID_zamówienia),
  FOREIGN KEY (ID_produktu) REFERENCES Produkt(ID_produktu)
);

SELECT Z.ID_zamówienia, P.ID_produktu, P.Nazwa_produktu, ZP.Ilość, P.Cena * ZP.Ilość AS 'Suma_cen'
FROM Zamówienie Z
JOIN Zamówienie_Produkt ZP ON Z.ID_zamówienia = ZP.ID_zamówienia
JOIN Produkt P ON ZP.ID_produktu = P.ID_produktu;
