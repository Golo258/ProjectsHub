CREATE TABLE IF NOT EXISTS employees
(
    id        INTEGER PRIMARY KEY AUTOINCREMENT,
    firstName VARCHAR(100) UNIQUE,
    lastName  VARCHAR(255),
    email     VARCHAR(255) UNIQUE,
    hireDate  DATE
);

INSERT INTO employees (firstName, lastName, email, hireDate)
VALUES ('John', 'Doe', 'john.doe@example.com', '2023-01-15'),
       ('Jane', 'Smith', 'jane.smith@example.com', '2023-02-20');


CREATE TABLE IF NOT EXISTS projects
(
    id        INTEGER PRIMARY KEY AUTOINCREMENT,
    name      VARCHAR(100) UNIQUE,
    startDate DATE,
    endDAte   DATE
);


INSERT INTO projects (name, startDate, endDAte)
VALUES ('Tick tack toe ', '2023-01-15', '2023-08-30'),
       ('Training app', '2022-05-20', '2023-02-12');


CREATE TABLE IF NOT EXISTS tasks
(
    id        INTEGER PRIMARY KEY AUTOINCREMENT,
    description      VARCHAR(255),
    dueDate DATE,
    status  TEXT CHECK( status IN ('TODO', 'IN PROGRESS', 'DONE', 'COMPLETED')),
    projectId INT,
    FOREIGN KEY (projectId) REFERENCES projects(id)
);
--  relacja one-to-many - projekt moze miec wiele taskow, task moze miec jeden projekt
