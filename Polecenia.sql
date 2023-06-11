-- Dodawanie kategorii
INSERT INTO Kategoria (ID_kategorii, Nazwa_kategorii)
VALUES (1, 'Telefony'), (2, 'Meble');

-- Dodawanie produktów dla Kategorii 1
INSERT INTO Produkt (ID_produktu, Nazwa, Cena, Opis, ID_kategorii)
VALUES
  (1, 'iPhone X', 19.99, 'Ajfon 10', 1),
  (2, 'iPhone 11', 1999.99, 'Ajfon 11', 1),
  (3, 'iPhone 12', 2299.99, 'Ajfon 12', 1),
  (4, 'iPhone 13', 2499.99, 'Ajfon 13, 1),
  (5, 'iPhone 14', 3999.99, 'Ajfon 14', 1);

-- Dodawanie produktów dla Kategorii 2
INSERT INTO Produkt (ID_produktu, Nazwa, Cena, Opis, ID_kategorii)
VALUES
  (6, 'krzeslo', 12.99, 'Opis produktu 6', 2),
  (7, 'sofa', 299.99, 'Opis produktu 7', 2),
  (8, 'szafa', 79.99, 'Opis produktu 8', 2),
  (9, 'lampa', 11.99, 'Opis produktu 9', 2),
  (10, 'kuchnia', 5999.99, 'Opis produktu 10', 2);
