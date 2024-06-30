CREATE TABLE member
(
    member_id INT          NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    email     VARCHAR(256) NOT NULL UNIQUE,
    password  VARCHAR(256) NOT NULL,
    name      VARCHAR(256) NOT NULL,
    age       INT          NOT NULL
);

CREATE TABLE role
(
    role_id   INT          NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    role_name VARCHAR(256) NOT NULL
);

CREATE TABLE member_has_role
(
    member_has_role_id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    member_id          INT NOT NULL,
    role_id            INT NOT NULL
);

# password 的值分別為 111, 222, 333
INSERT INTO member(email, password, name, age) VALUES ('test1@gmail.com', '$2a$10$aUfRIOYPn/C2pwjLnz3iMuFgJW.5QSp2aoaj1cL1qMP/dYMsF0Woe', 'Test 1', '20');
INSERT INTO member(email, password, name, age) VALUES ('test2@gmail.com', '$2a$10$cSADPsDTfXcYDjWzzusBHuiI33JYHmI3aFCfP7IF3AkhneRfDlzZS', 'Test 2', '30');
INSERT INTO member(email, password, name, age) VALUES ('test3@gmail.com', '$2a$10$YBV0mwoLiZcx4H.O1crhzesqME/WAR12RZ4vsx3SMy2hFDe.JtMuC', 'Test 3', '22');

INSERT INTO role(role_name) VALUES ('ROLE_ADMIN');
INSERT INTO role(role_name) VALUES ('ROLE_NORMAL_MEMBER');
INSERT INTO role(role_name) VALUES ('ROLE_VIP_MEMBER');

INSERT INTO member_has_role (member_id, role_id) VALUES (1, 1);
INSERT INTO member_has_role (member_id, role_id) VALUES (2, 2);
INSERT INTO member_has_role (member_id, role_id) VALUES (3, 2);
INSERT INTO member_has_role (member_id, role_id) VALUES (3, 3);
