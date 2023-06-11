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

CREATE TABLE Zamówienie_Produkt (
  ID_zamówienia INT,
  ID_produktu INT,
  Ilość INT,
  PRIMARY KEY (ID_zamówienia, ID_produktu),
  FOREIGN KEY (ID_zamówienia) REFERENCES Zamówienie(ID_zamówienia),
  FOREIGN KEY (ID_produktu) REFERENCES Produkt(ID_produktu)
);

CREATE TABLE Magazyn_Kategoria (
  ID_magazynu INT,
  ID_kategorii INT,
  PRIMARY KEY (ID_magazynu, ID_kategorii),
  FOREIGN KEY (ID_magazynu) REFERENCES Magazyn(ID_magazynu),
  FOREIGN KEY (ID_kategorii) REFERENCES Kategoria(ID_kategorii)
);
