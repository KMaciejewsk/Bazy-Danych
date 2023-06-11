CREATE TABLE Klient (
  ID_klienta INT PRIMARY KEY,
  Imię VARCHAR(50),
  Nazwisko VARCHAR(50),
  Email VARCHAR(50),
  Numer_telefonu VARCHAR(20),
  ID_adresu INT,
  FOREIGN KEY (ID_adresu) REFERENCES Adres(ID_adresu)
);

CREATE TABLE Zamówienie (
  ID_zamówienia INT PRIMARY KEY,
  Data_zamówienia DATE,
  Status VARCHAR(20),
  ID_klienta INT,
  FOREIGN KEY (ID_klienta) REFERENCES Klient(ID_klienta)
);

CREATE TABLE Produkt (
  ID_produktu INT PRIMARY KEY,
  Nazwa VARCHAR(100),
  Cena DECIMAL(10, 2),
  Opis TEXT,
  ID_kategorii INT,
  FOREIGN KEY (ID_kategorii) REFERENCES Kategoria(ID_kategorii)
);

CREATE TABLE Kategoria (
  ID_kategorii INT PRIMARY KEY,
  Nazwa_kategorii VARCHAR(50)
);

CREATE TABLE Adres (
  ID_adresu INT PRIMARY KEY,
  Ulica VARCHAR(100),
  Miasto VARCHAR(50),
  Kod_pocztowy VARCHAR(10),
  Kraj VARCHAR(50)
);

CREATE TABLE Magazyn (
  ID_magazynu INT PRIMARY KEY,
  Nazwa_magazynu VARCHAR(100),
  ID_adresu INT,
  FOREIGN KEY (ID_adresu) REFERENCES Adres(ID_adresu)
);

CREATE TABLE Magazyn_Kategoria (
  ID_magazynu INT,
  ID_kategorii INT,
  PRIMARY KEY (ID_magazynu, ID_kategorii),
  FOREIGN KEY (ID_magazynu) REFERENCES Magazyn(ID_magazynu),
  FOREIGN KEY (ID_kategorii) REFERENCES Kategoria(ID_kategorii)
);

CREATE TABLE Zamówienie_Produkt (
  ID_zamówienia INT,
  ID_produktu INT,
  PRIMARY KEY (ID_zamówienia, ID_produktu),
  FOREIGN KEY (ID_zamówienia) REFERENCES Zamówienie(ID_zamówienia),
  FOREIGN KEY (ID_produktu) REFERENCES Produkt(ID_produktu)
);

-- Dodawanie kategorii
INSERT INTO Kategoria (ID_kategorii, Nazwa_kategorii)
VALUES (1, 'Kategoria 1'), (2, 'Kategoria 2');

-- Dodawanie produktów dla Kategorii 1
INSERT INTO Produkt (ID_produktu, Nazwa, Cena, Opis, ID_kategorii)
VALUES
  (1, 'Produkt 1', 10.99, 'Opis produktu 1', 1),
  (2, 'Produkt 2', 15.99, 'Opis produktu 2', 1),
  (3, 'Produkt 3', 20.99, 'Opis produktu 3', 1),
  (4, 'Produkt 4', 12.99, 'Opis produktu 4', 1),
  (5, 'Produkt 5', 9.99, 'Opis produktu 5', 1);

-- Dodawanie produktów dla Kategorii 2
INSERT INTO Produkt (ID_produktu, Nazwa, Cena, Opis, ID_kategorii)
VALUES
  (6, 'Produkt 6', 8.99, 'Opis produktu 6', 2),
  (7, 'Produkt 7', 14.99, 'Opis produktu 7', 2),
  (8, 'Produkt 8', 18.99, 'Opis produktu 8', 2),
  (9, 'Produkt 9', 11.99, 'Opis produktu 9', 2),
  (10, 'Produkt 10', 7.99, 'Opis produktu 10', 2);
