

-- QUERY: create_table
CREATE TABLE IF NOT EXISTS tasks (
    id SERIAL PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    description TEXT,
    completed BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- QUERY: insert_data
INSERT INTO tasks (title, description) VALUES ('Learn SQL', 'Complete the SQL tutorial');
INSERT INTO tasks (title, description) VALUES ('Build Python App', 'Create a ToDo app with Python and PostgreSQL');

-- QUERY: select_all
SELECT * FROM tasks;