-- Active: 1692178359314@@127.0.0.1@3306@test_chat_api

/*
Kelompok 3 SBD kelas TI4 hari SELASA jam 9.40 pagi.
1. M. Agung Maulana
2. Iskandar Muhammad Agung
3. M. Gatan Anugrah
4. Nur Dela Handayani
5. Rosmawati
6. M. Maftuhi
7. M. Ridho Alfaridzi
8. Khaisar Rizki Maulana

*Note: semua anggota telah menyelesaikan tugasnya masing-masing
*/

-- BAGIAN DDL

-- CREATE DATABASE
CREATE DATABASE "achatt";

-- CREATE TABLE user
CREATE TABLE `user` (
  `userId` varchar(15) NOT NULL,
  `username` varchar(15) NOT NULL,
  `password` varchar(15) NOT NULL,
  `photoIndex` int DEFAULT '0',
  `isOnline` tinyint(1) NOT NULL DEFAULT '0',
  `status` varchar(30) DEFAULT 'Hello, Im using AChatt!',
  `dateCreated` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`userId`)
);

-- CREATE TABLE contacts
CREATE TABLE `contacts` (
  `contactId` int NOT NULL AUTO_INCREMENT,
  `groupIds` json DEFAULT NULL,
  `userIds` json DEFAULT NULL,
  `userId` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`contactId`),
  KEY `userId` (`userId`),
  FOREIGN KEY (`userId`) REFERENCES `user` (`userId`)
);

-- CREATE TABLE group_chat
 CREATE TABLE `group_chat` (
  `groupName` varchar(31) NOT NULL,
  `kind` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`groupName`)
);

-- CREATE TABLE chat_table
CREATE TABLE `chat_table` (
  `id` int NOT NULL AUTO_INCREMENT,
  `chatAddress` varchar(31) DEFAULT NULL,
  `chats` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `chatAddress` (`chatAddress`),
  FOREIGN KEY (`chatAddress`) REFERENCES `group_chat` (`groupName`)
);
-- AKHIR AKHIR DDL

-- BAGIAN DML

-- INSERT user
INSERT INTO user (userId, username, password)
VALUES ("MyID", 'John Doe', 'secret');

INSERT INTO user (userId, username, password)
VALUES ("agung", 'ultraman', '1');

-- INSERT group_chat
INSERT INTO group_chat (groupName, kind) VALUES ("global", "public");

INSERT INTO group_chat (groupName, kind) VALUES ("agung&MyID", "private");

-- INSERT contacts
INSERT INTO contacts (groupIds, userIds, userId) values ('["global"]', '["agung"]', "MyID");

INSERT INTO contacts (groupIds, userIds, userId) values ('["global"]', '["MyId"]', "agung");

-- INSERT chat_table
INSERT INTO chat_table (chatAddress, chats) VALUES ("global", '[]');

INSERT INTO chat_table (chatAddress, chats) VALUES ("agung&MyID", '[]');

-- SELECT user
SELECT * FROM user;

-- SELECT contacts
SELECT * FROM contacts;

-- SELECT group_chat
SELECT * FROM group_chat;

-- SELECT chat_table
SELECT * FROM chat_table;

-- UPDATE user
UPDATE user 
    SET 'username' = "Changed", 'photoIndex' = "4", 'status' = "Status changed"
    WHERE userId = 'agung';

-- DELETE user
DELETE FROM user WHERE id = "MyID" --Ini akan menghapus row user dengan userId "MyID"

-- AKHIR DML
