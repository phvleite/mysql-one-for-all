-- SpotifyClone

CREATE SCHEMA IF NOT EXISTS SpotifyClone DEFAULT CHARACTER SET utf8 ;
USE SpotifyClone;

-- Table assinaturas
CREATE TABLE IF NOT EXISTS assinaturas(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  plano VARCHAR(50),
  valor DECIMAL(8,2)
);

-- Table usuarios
CREATE TABLE IF NOT EXISTS usuarios(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  usuario VARCHAR(100),
  idade CHAR(2),
  data_assinatura DATE NULL,
  id_assinatura INT NOT NULL,
  FOREIGN KEY (id_assinatura) REFERENCES assinaturas (id)
);

-- Table artistas
CREATE TABLE IF NOT EXISTS artistas (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(150)
);

-- Table albuns
CREATE TABLE IF NOT EXISTS albuns (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  album VARCHAR(150),
  ano_lancamento CHAR(4),
  id_artista INT NOT NULL,
  FOREIGN KEY (id_artista) REFERENCES artistas (id)
);

-- Table cancoes
CREATE TABLE IF NOT EXISTS cancoes (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  cancao VARCHAR(150),
  duracao_segundos CHAR(4),
  id_album INT NOT NULL,
  FOREIGN KEY (id_album) REFERENCES albuns (id)
);

-- Table seguindo_artista
CREATE TABLE IF NOT EXISTS seguindo_artista (
  id_usuario INT NOT NULL,
  id_artista INT NOT NULL,
  CONSTRAINT PRIMARY KEY (`id_usuario`, `id_artista`),
  FOREIGN KEY (id_usuario) REFERENCES usuarios (id),
  FOREIGN KEY (id_artista) REFERENCES artistas (id)
);

-- Table historico_reproducoes
CREATE TABLE IF NOT EXISTS historico_reproducoes (
  id_usuario INT NOT NULL,
  id_cancao INT NOT NULL,
  dt_reproducao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT PRIMARY KEY (`id_usuario`, `id_cancao`),
  FOREIGN KEY (id_usuario) REFERENCES usuarios (id),
  FOREIGN KEY (id_cancao) REFERENCES cancoes (id)
);

INSERT INTO assinaturas (plano, valor) VALUES
('gratuito', 0),
('universitário', 5.99),
('pessoal', 6.99),
('familiar', 7.99);

INSERT INTO usuarios (usuario, idade, data_assinatura, id_assinatura) VALUES
('Thati', '23', '2019-10-20', 1 ),
('Cintia', '35', '2017-12-30', 4 ),
('Bill', '20', '2019-06-05', 2 ),
('Roger', '45', '2020-05-13', 3 ),
('Norman', '58', '2017-02-17', 3 ),
('Patrick', '33', '2017-01-06', 4 ),
('Vivian', '26', '2018-01-05', 2 ),
('Carol', '19', '2018-02-14', 2 ),
('Angelina', '42', '2018-04-29', 4 ),
('Paul', '46', '2017-01-17', 4 );

INSERT INTO artistas (nome) VALUES
('Fog'),
('Freedie Shannon'),
('Lance Day'),
('Peter Strong'),
('Tyler Isle'),
('Walter Phoenix');

INSERT INTO albuns (album, ano_lancamento, id_artista) VALUES
('Envious', '1990' ,6),
('Exuberant', '1993' ,6),
('Hallowed Steam', '1995' ,4),
('Incandescent', '1998' ,3),
('Temporary Culture', '2001' ,2),
('Library of liberty', '2003' ,2),
('Chained Down', '2007' ,5),
('Cabinet of fools', '2012' ,5),
('No guarantees', '2015' ,5),
('Apparatus', '2015' ,1);

INSERT INTO cancoes (cancao, duracao_segundos, id_album) VALUES
('Soul For Us', '200', 1),
('Reflections Of Magic', '163', 1),
('Dance With Her Own', '116', 1),
('Troubles Of My Inner Fire', '202', 2),
('Time Fireworks', '152', 2),
('Magic Circus', '105', 3),
('Honey, So Do I', '207', 3),
("Sweetie, Let's Go Wild", '139', 3),
('She Knows', '244', 3),
('Fantasy For Me', '100', 4),
('Celebration Of More', '146', 4),
('Rock His Everything', '223', 4),
('Home Forever', '231', 4),
('Diamond Power', '241', 4),
("Let's Be Silly", '132', 4),
('Thang Of Thunder', '240', 5),
('Words Of Her Life', '185', 5),
('Without My Streets', '176', 5),
('Need Of The Evening', '190', 6),
('History Of My Roses', '222', 6),
('Without My Love', '111', 6),
('Walking And Game', '123', 6),
('Young And Father', '197', 6),
('Finding My Traditions', '179', 7),
('Walking And Man', '229', 7),
('Hard And Time', '135', 7),
("Honey, I'm A Lone Wolf", '150', 7),
("She Thinks I Won't Stay Tonight", '166', 8),
("He Heard You're Bad For Me", '154', 8),
("He Hopes We Can't Stay", '210', 8),
('I Know I Know', '117', 8),
("He's Walking Away", '159', 9),
("He's Trouble", '138', 9),
('I Heard I Want To Bo Alone', '120', 9),
('I Ride Alone', '151', 9),
('Hone', '79', 10),
('You Cheated On M', '95', 10),
("Wouldn't It Be Nice", '213', 10),
('Baby', '136', 10),
('You Make Me Feel So..', '83', 10);

INSERT INTO seguindo_artista (id_usuario, id_artista) VALUES
(1, 6), (1, 2), (1, 3), (2, 6), (2, 3), (3, 4),
(3, 6), (4, 2), (5, 5), (5, 1), (6, 1), (6, 3),
(6, 6), (7, 4), (7, 5), (8, 6), (8, 5), (9, 1),
(9, 2), (9, 3), (10, 4), (10, 1);

INSERT INTO historico_reproducoes (id_usuario, id_cancao, dt_reproducao) VALUES
(1, 36, '2020-02-28  10:45:55'), (1, 25, '2020-05-02 05:30:35'),
(1, 23, '2020-03-06 11:22:33'), (1, 14, '2020-08-05 08:05:17'),
(1, 15, '2020-09-14 16:32:22'), (2, 34, '2020-01-02  07:40:33'),
(2, 24, '2020-05-16 06:16:22'), (2, 21, '2020-10-09 12:27:48'),
(2, 39, '2020-09-21 13:14:46'), (3, 6, '2020-11-13  16:55:13'),
(3, 3, '2020-12-05 18:38:30'), (3, 26, '2020-07-30 10:00:00'),
(4, 2, '2021-08-15  17:10:10'), (4, 35, '2021-07-10 15:20:30'),
(4, 27, '2021-01-09 01:44:33'), (5, 7, '2020-07-03  19:33:28'),
(5, 12, '2017-02-24 21:14:22'), (5, 14, '2020-08-06 15:23:43'),
(5, 1, '2020-11-10 13:52:27'), (6, 38, '2019-02-07  20:33:48'),
(6, 29, '2017-01-24 00:31:17'), (6, 30, '2017-10-12 12:35:20'),
(6, 22, '2018-05-29 14:56:41'), (7, 5, '2018-05-09  22:30:49'),
(7, 4, '2020-07-27 12:52:58'), (7, 11, '2018-01-16 18:40:43'),
(8, 39, '2018-03-21  16:56:40'), (8, 40, '2020-10-18 13:38:05'),
(8, 32, '2019-05-25 08:14:03'), (8, 33, '2021-08-15 21:37:09'),
(9, 16, '2021-05-24  17:23:45'), (9, 17, '2018-12-07 22:48:52'),
(9, 8, '2021-03-14 06:14:26'), (9, 9, '2020-04-01 03:36:00'),
(10, 20, '2017-02-06 08:21:34'), (10, 21, '2017-12-04 05:33:43'),
(10, 12, '2017-07-27 05:24:49'), (10, 13, '2017-12-25 01:03:57');
