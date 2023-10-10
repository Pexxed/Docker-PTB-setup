-- Enable pgcrypto extension, required for JWT
CREATE EXTENSION IF NOT EXISTS pgcrypto;

-- custom additions
CREATE USER readonly_user WITH PASSWORD '1234';
CREATE USER adminuser WITH PASSWORD '12345';


-- Grant permissions
GRANT pg_read_all_data TO readonly_user;
GRANT ALL PRIVILEGES ON DATABASE students TO adminuser;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO adminuser;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO adminuser;

CREATE TABLE accounts (			
	user_id serial PRIMARY KEY,		
	username VARCHAR ( 50 ) UNIQUE NOT NULL,		
	password VARCHAR ( 50 ) NOT NULL,		
	email VARCHAR ( 255 ) UNIQUE NOT NULL,		
	created_on TIMESTAMP NOT NULL,		
        last_login TIMESTAMP			
);			
INSERT INTO accounts (username, password, email, created_on, last_login) 
VALUES 
('user1', 'password123', 'user1@example.com', '2023-08-22 08:00:00', '2023-08-22 08:05:00'),
('user2', 'password456', 'user2@example.com', '2023-08-22 08:10:00', '2023-08-22 08:15:00'),
('user3', 'password789', 'user3@example.com', '2023-08-22 08:20:00', '2023-08-22 08:25:00'),
('user4', 'password101', 'user4@example.com', '2023-08-22 08:30:00', '2023-08-22 08:35:00'),
('user5', 'password112', 'user5@example.com', '2023-08-22 08:40:00', '2023-08-22 08:45:00');


docker exec -it praktischerteil-postgres_new-1 psql -U postgres -d students