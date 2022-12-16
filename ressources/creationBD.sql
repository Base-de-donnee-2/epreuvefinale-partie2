-- Création de la base de données
DROP DATABASE IF EXISTS bd2_examenfinal;
CREATE DATABASE bd2_examenfinal;
USE bd2_examenfinal;

-- Création de la table artiste
CREATE TABLE artiste (
	id INT AUTO_INCREMENT NOT NULL,
	nom VARCHAR(50),
	image_cover_url VARCHAR(255),
	localisation VARCHAR(50),
	CONSTRAINT PRIMARY KEY (id)
);
-- Insertion des données dans la table artiste
INSERT INTO artiste(id, nom, image_cover_url, localisation) 
VALUES 
(1, 'Yob', 'https://f4.bcbits.com/img/0013170886_10.jpg', 'Eugene, Oregon'),
(2, 'All The Empires Of The World','https://f4.bcbits.com/img/0004617091_10.jpg', 'London, UK'),
(3, 'Kenoma','https://f4.bcbits.com/img/0009452628_10.jpg', 'Dayton, Ohio'),
(4, 'Chelsea Wolfe','https://f4.bcbits.com/img/0025635467_10.jpg', 'California');

-- Création de la table album
CREATE TABLE album (
	id INT AUTO_INCREMENT NOT NULL,
	artiste_id INT,
	titre VARCHAR(50),
	description TEXT,
	image_cover_url VARCHAR(255),
	prix_minimum NUMERIC(8,2),
	date_parution DATE,
	CONSTRAINT PRIMARY KEY (id),
	CONSTRAINT FOREIGN KEY (artiste_id) REFERENCES artiste(id) ON DELETE CASCADE ON UPDATE CASCADE
);
-- Insertion des données dans la table album
INSERT INTO album(id, artiste_id, titre, description, image_cover_url, prix_minimum, date_parution)
VALUES
(1, 1, 'Atma (Deluxe Edition)', 'YOB have unveiled a fully remixed and remastered version of Atma. Atma (Deluxe Version) sees Billy Barnett make the album volume-wide and monolithic in detail and space while keeping all of Jeff Olsen’s original amazing raw-punch production.', 'https://f4.bcbits.com/img/a0314920659_10.jpg', 9.99, '2022-04-08'),
(2, 4, 'Abyss', 'ABYSS CREDITS\nMusicians: Chelsea Wolfe, Ben Chisholm on all tracks\nwith Dylan Fujioka, Mike Sullivan, Ezra Buchla\n& D.H. Phillips on select tracks\nAll Songs written by Chelsea Wolfe\nexcept track 2 was co-written by Karlos Rene Ayala\ntrack 10 music written by Jesse K. Phillips\nRecorded & Mixed by John Congleton\nIn Dallas, TX at Elmwood Recording Studio\nMastered by Alan Douches\nCover and back paintings by: Henrik Uldalen\nPhotographs & layout by Ben Chisholm \nArtist management by Cathy Pellow ', 'https://f4.bcbits.com/img/a0829041222_10.jpg', 10, '2015-08-07'),
(3, 2, 'A Trap For Giants, A Grave For Judges', 'Final release RIP All The Empires Of The World 2007 - 2015', 'https://f4.bcbits.com/img/a0169067467_10.jpg', 0, '2015-09-26'),
(4, 3, 'The Tides Will Prevail', 'Eleven years in the making, KENOMA release their highly anticipated debut full length record entitled, "The Tides Will Prevail". Known for their contribution to the 2006 split release with Mouth Of The Architect, KENOMA now offer over fifty minutes of stunning, spiraling waves of progressive and atmospheric instrumental doom/post rock.', 'https://f4.bcbits.com/img/a3403824776_10.jpg', 8.99, '2017-04-28');

-- Création de la table piste
CREATE TABLE piste (
	id INT AUTO_INCREMENT NOT NULL,
	album_id INT,
	titre VARCHAR(50),
	ordre INT,
	duree_secondes INT,
	CONSTRAINT PRIMARY KEY (id),
	CONSTRAINT FOREIGN KEY (album_id) REFERENCES album(id) ON DELETE CASCADE ON UPDATE CASCADE
);
-- Insertion des données dans la table piste
INSERT INTO piste(id, album_id, titre, ordre, duree_secondes)
VALUES
(1, 1, 'Prepare The Ground (2021 Mix)', 1, 545),
(2, 1, 'Atma (2021 Mix) ', 2, 536),
(3, 1, 'Before We Dreamed Of Two (2021 Mix)', 3, 962),
(4, 1, 'Upon The Sight Of The Other Shore (2021 Mix)', 4, 454),
(5, 1, 'Adrift In The Ocean (2021 Mix)', 5, 811),
(6, 1, 'Prepare The Ground (2011 Mix)', 6, 545),
(7, 1, 'Atma (2011 Mix) ', 7, 536),
(8, 1, 'Before We Dreamed Of Two (2011 Mix)', 8, 959),
(9, 1, 'Upon The Sight Of The Other Shore (2011 Mix)', 9, 453),
(10, 1, 'Adrift In The Ocean (2011 Mix)', 10, 813),
(11, 2, 'Carrion Flowers', 1, 290),
(12, 2, 'Iron Moon', 2, 346),
(13, 2, 'Dragged Out', 3, 260),
(14, 2, 'Maw', 4, 354),
(15, 2, 'Grey Days', 5, 319),
(16, 2, 'After the Fall', 6, 335),
(17, 2, 'Crazy Love', 7, 213),
(18, 2, 'Simple Death', 8, 322),
(19, 2, 'Survive', 9, 338),
(20, 2, 'Color of Blood', 10, 288),
(21, 2, 'The Abyss', 11, 252),
(22, 3, 'A Trap For Giants', 1, 361),
(23, 3, 'They Will Not See Through The Darkened Glass', 2, 488),
(24, 3, 'Lathe Of Heaven', 3, 521),
(25, 3, 'Roads To Rome', 4, 313),
(26, 3, 'Solomon\'s Rope', 5, 216),
(27, 3, 'A Grave For Judges', 6, 605),
(28, 3, 'St Peter Does Not Return', 7, 307),
(29, 3, 'Caterwaul', 8, 168),
(30, 4, '33rd Parallel', 1, 643),
(31, 4, '1913', 2, 678),
(32, 4, 'Curse of Tecumseh', 3, 544),
(33, 4, 'Sleeping Prophet', 4, 409),
(34, 4, 'Nature of Empire', 5, 828);

-- Création de la table mot_cle
CREATE TABLE mot_cle (
	id INT AUTO_INCREMENT NOT NULL,
	mot VARCHAR(50),
	CONSTRAINT PRIMARY KEY (id)
);
-- Insertion des données dans la table mot_cle
INSERT INTO mot_cle(id, mot)
VALUES 
(1, 'metal'),
(2, 'doom metal'),
(3, 'post-metal'),
(4, 'progressive'),
(5, 'stoner metal'),
(6, 'Eugene'),
(7, 'acoustic'),
(8, 'alternative'),
(9, 'experimental'),
(10, 'folk'),
(11, 'industrial rock alternative'),
(12, 'California'),
(13, 'doom'),
(14, 'post-rock'),
(15, 'London'),
(16, 'instrumental'),
(17, 'sludge'),
(18, 'Dayton');

-- Création de la table album_mot_cle
CREATE TABLE album_mot_cle (
	id INT AUTO_INCREMENT NOT NULL,
	album_id INT,
	mot_cle_id INT,
	principal BIT,
	CONSTRAINT PRIMARY KEY (id),
	CONSTRAINT FOREIGN KEY (album_id) REFERENCES album(id) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT FOREIGN KEY (mot_cle_id) REFERENCES mot_cle(id) ON DELETE CASCADE ON UPDATE CASCADE
);
-- Insertion des données dans la table album_mot_cle
INSERT INTO album_mot_cle(album_id, mot_cle_id, principal)
VALUES
(1,1,0),
(1,2,1),
(1,3,0),
(1,4,0),
(1,5,0),
(1,6,0),
(2,7,0),
(2,8,0),
(2,9,0),
(2,10,1),
(2,11,0),
(2,12,0),
(3,13,0),
(3,1,0),
(3,3,1),
(3,14,0),
(3,15,0),
(4,1,0),
(4,13,0),
(4,2,0),
(4,16,1),
(4,3,0),
(4,14,0),
(4,17,0),
(4,18,0);
-- Création de la table usager
CREATE TABLE usager (
	id INT AUTO_INCREMENT NOT NULL,
	nom_usager VARCHAR(50),
	texte_apropos VARCHAR(500),
	CONSTRAINT PRIMARY KEY (id)
);
-- Insertion des données dans la table usager
INSERT INTO usager(id, nom_usager, texte_apropos)
VALUES 
(1, 'Math', 'Juste un gars qui aime la musique'),
(2, 'CharlyBoy', 'C\'est mon papa qui a créé mon compte, j\'ai juste 5 ans.'),
(3, 'Loulou', 'J\'ai aucune idée de ce que je fais ici');

-- Création de la table collection
CREATE TABLE collection (
	id INT AUTO_INCREMENT NOT NULL,
	usager_id INT,
	album_id INT,
	piste_favorite_id INT NULL,
	commentaire VARCHAR(500) NULL,
	prix_paye NUMERIC(8,2),
	CONSTRAINT PRIMARY KEY (id),
	CONSTRAINT FOREIGN KEY (usager_id) REFERENCES usager(id) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT FOREIGN KEY (album_id) REFERENCES album(id) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT FOREIGN KEY (piste_favorite_id) REFERENCES piste(id) ON DELETE CASCADE ON UPDATE CASCADE
);
-- Insertion des données dans la table collection
INSERT INTO collection(usager_id, album_id, piste_favorite_id, commentaire, prix_paye)
VALUES
(1, 1, 7, 'Adrift in the ocean est tout simplement un chef d\'oeuvre', 9.99),
(1, 2, 20, null, 8.99),
(1, 3, null, 'Un band qui aura resté dans l\'ombre, merci pour votre musique.', 10),
(2, 1, null, 'Wow c\'est super bon', 9.99),
(3, 2, 1, 'Quand je vais être grande je veux être comme Chelsea!!', 8.99);

-- Création de la table liste_souhait
CREATE TABLE liste_souhait (
	id INT AUTO_INCREMENT NOT NULL,
	usager_id INT,
	album_id INT,
	CONSTRAINT PRIMARY KEY (id),
	CONSTRAINT FOREIGN KEY (usager_id) REFERENCES usager(id) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT FOREIGN KEY (album_id) REFERENCES album(id) ON DELETE CASCADE ON UPDATE CASCADE
);
-- Insertion des données dans la table liste_souhait
INSERT INTO liste_souhait(usager_id, album_id)
VALUES
(1,4),
(2,3),
(3,1),
(3,2),
(3,3);

-- Création des Triggers qui valident la piste favorite lors de l'insertion et la mise à jour d'un album d'une collection
DROP TRIGGER IF EXISTS collection_before_insert;
DROP TRIGGER IF EXISTS collection_before_update;

DELIMITER $$

CREATE TRIGGER collection_before_insert
BEFORE INSERT
ON collection FOR EACH ROW
BEGIN
	
	DECLARE _album_id INT DEFAULT 0;
	
	IF (NEW.piste_favorite_id IS NOT NULL) THEN 
		SET _album_id = (SELECT a.id FROM album a INNER JOIN piste p ON p.album_id = a.id WHERE p.id = NEW.piste_favorite_id);
		
		IF (_album_id != NEW.album_id) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "La piste favorite indiquée n'est pas présente dans cet album";
		END IF;
	END IF;
END$$


	
CREATE TRIGGER collection_before_update
BEFORE UPDATE
ON collection FOR EACH ROW
BEGIN
	
	DECLARE _album_id INT DEFAULT 0;
	
	IF (NEW.piste_favorite_id IS NOT NULL) THEN 
		SET _album_id = (SELECT a.id FROM album a INNER JOIN piste p ON p.album_id = a.id WHERE p.id = NEW.piste_favorite_id);
		
		IF (_album_id != NEW.album_id) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "La piste favorite indiquée n'est pas présente dans cet album";
		END IF;
	END IF;
END$$

DELIMITER ;