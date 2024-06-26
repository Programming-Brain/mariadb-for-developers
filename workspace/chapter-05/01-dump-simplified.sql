DROP TABLE IF EXISTS items_tags, tags, items, projects, winners, users, prizes;

CREATE TABLE users(
    id INT NOT NULL AUTO_INCREMENT,
    email VARCHAR(254) NOT NULL,
    password VARCHAR(500) NOT NULL,
    name VARCHAR(750) NOT NULL,
    blocked BOOLEAN NOT NULL DEFAULT FALSE,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY pk_users (id),
    UNIQUE KEY uq_users_email (email),
    CONSTRAINT users_name_not_empty CHECK (TRIM(name) != ""),
    CONSTRAINT users_password_valid CHECK (LENGTH(password) >= 5),
    CONSTRAINT users_email_valid CHECK (email REGEXP '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
);

CREATE TABLE projects(
    id INT NOT NULL AUTO_INCREMENT,
    parent_id INT,
    name VARCHAR (250) NOT NULL,
    description TEXT,
    status ENUM ("NOT_STARTED", "IN_PROGRESS", "DONE", "CANCELED", "DEACTIVATED") NOT NULL DEFAULT "NOT_STARTED",
    PRIMARY KEY pk_projects (id),
    FOREIGN KEY fk_projects_parent_id (parent_id) REFERENCES projects (id),
    UNIQUE KEY uq_projects_name (name),
    CONSTRAINT projects_name_valid CHECK (TRIM(name) != ""),
    CONSTRAINT projects_description_valid CHECK (TRIM(description) != "")
);

CREATE TABLE items(
    id INT NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL,
    project_id INT,
    description VARCHAR(250) NOT NULL,
    due_date DATE,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    completed_at DATETIME,
    status ENUM ("IN_PROGRESS", "DONE"),
    priority BOOLEAN NOT NULL DEFAULT FALSE,
    PRIMARY KEY pk_items (id),
    FOREIGN KEY fk_items_user_id (user_id) REFERENCES users (id),
    FOREIGN KEY fk_items_project_id (project_id) REFERENCES projects (id),
    CONSTRAINT items_description_valid CHECK (TRIM(description) != ""),
    INDEX idx_status (status)
);

CREATE TABLE tags(
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    PRIMARY KEY pk_tags (id),
    UNIQUE KEY uq_tags_name (name),
    CONSTRAINT tags_name_valid CHECK (TRIM(name) != "")
);

CREATE TABLE items_tags(
    item_id INT NOT NULL,
    tag_id INT NOT NULL,
    PRIMARY KEY pk_items_tags (item_id, tag_id),
    FOREIGN KEY fk_items_tags_item_id (item_id) REFERENCES items (id),
    FOREIGN KEY fk_items_tags_tag_id (tag_id) REFERENCES tags (id)
);

CREATE TABLE prizes(
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(250) NOT NULL,
    quantity INT UNSIGNED NOT NULL,
    PRIMARY KEY pk_prizes (id),
    UNIQUE KEY uq_prizes_name (name),
    CONSTRAINT prizes_name_valid CHECK (TRIM(name) != "")
);

CREATE TABLE winners(
    id INT NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL,
    prize_id INT NOT NULL,
    awarded_date DATE NOT NULL,
    PRIMARY KEY pk_winners (id),
    FOREIGN KEY fk_winners_user_id (user_id) REFERENCES users (id),
    FOREIGN KEY fk_winners_prize_id (prize_id) REFERENCES prizes (id)
);

INSERT INTO users (email, password, name, blocked, created_at) VALUES
('kvoase0@indiegogo.com', 'cR0"7U8*u%j', 'Kittie Voase', FALSE, '2024-03-22'),
('ylawty1@flickr.com', 'xJ5*H34m', 'Yul Lawty', FALSE, '2023-06-02'),
('jaxleby2@scientificamerican.com', 'xJ0=K3>O', 'Joey Axleby', FALSE, '2023-06-04'),
('mfransoni3@rediff.com', 'pP4{ccA', 'Moll Fransoni', FALSE, '2024-01-05'),
('mpiddick4@example.com', 'xW3*Yg~tp`Ds', 'Moe Piddick', FALSE, '2024-02-24'),
('bwarters5@yellowpages.com', 'xE8,nO>VjPk5', 'Brenda Warters', FALSE, '2023-12-23'),
('sgallgher6@facebook.com', 'cL6>Kr''Tg6Zv', 'Sancho Gallgher', FALSE, '2024-02-22'),
('kstonner7@mlb.com', 'tZ4}NI', 'Krisha Stonner', FALSE, '2023-02-14'),
('dseale8@loc.gov', 'vU8*k$xcc', 'Devondra Seale', TRUE, '2023-05-06'),
('ijephson9@sakura.ne.jp', 'dT4!|"QC', 'Ivan Jephson', FALSE, '2024-01-18'),
('jderlea@hc360.com', 'yU9}!#r=c5', 'Janet Derle', FALSE, '2024-01-09'),
('fsellimanb@apache.org', 'hT3/>G*z', 'Fayette Selliman', FALSE, '2023-12-10'),
('imistryc@gov.uk', 'rO4#TTrgg@', 'Irene Mistry', FALSE, '2023-01-15'),
('jfalkinderd@ebay.com', 'lH8$a\/f@', 'Jackqueline Falkinder', FALSE, '2023-08-29'),
('gbinnse@phoca.cz', 'nD8#Zxm', 'Gerhardt Binns', FALSE, '2023-06-06'),
('mcontif@free.fr', 'xM0_6H''50', 'Margi Conti', FALSE, '2023-08-14'),
('lkieferg@google.com.au', 'cT1.lgXAS', 'Leo Kiefer', TRUE, '2024-02-04'),
('ngoldieh@ed.gov', 'tC8*{7e''+J_', 'Nani Goldie', FALSE, '2023-07-31'),
('tcollini@tripadvisor.com', 'aA7=P_JT1', 'Tildy Collin', FALSE, '2023-02-27'),
('gpitonej@bbb.org', 'pG0*,WYD1', 'Goldarina Pitone', FALSE, '2023-11-10'),
('bmilesk@reference.com', 'fK6#L/', 'Bari Miles', FALSE, '2023-01-02'),
('jrippinl@google.it', 'wG2`4d', 'Julita Rippin', TRUE, '2023-06-14'),
('cgrewcockm@feedburner.com', 'vZ9+BI}2e?O', 'Corrie Grewcock', FALSE, '2023-11-15'),
('hfebvren@nasa.gov', 'tM9%}q', 'Horacio Febvre', FALSE, '2023-07-12'),
('anestero@php.net', 'hR6(`B', 'Astrix Nester', FALSE, '2022-12-22'),
('adurberp@newyorker.com', 'bP9#t"<', 'Adham Durber', FALSE, '2024-01-01'),
('coreaganq@istockphoto.com', 'aU4@iMXY{3!O', 'Celestyna O''Reagan', FALSE, '2023-06-13'),
('fmarqueser@intel.com', 'nM4_thA2', 'Filia Marquese', FALSE, '2024-03-06'),
('sspellissys@xing.com', 'mH8#ljU', 'Selby Spellissy', FALSE, '2023-06-13'),
('mdaymondt@cbslocal.com', 'fR1=%a%2''', 'Mart Daymond', FALSE, '2023-12-11'),
('dmcquorkelu@wikia.com', 'tD6{w|vJQw', 'Darda McQuorkel', FALSE, '2023-12-18'),
('labbisonv@simplemachines.org', 'xV3~`+uyy?J', 'Leontyne Abbison', FALSE, '2023-05-18'),
('swhelanw@technorati.com', 'mA5.GV', 'Sandi Whelan', TRUE, '2023-04-25'),
('smaccaheex@free.fr', 'tV9\<`hU', 'Skylar MacCahee', FALSE, '2024-01-19'),
('fmityushiny@pen.io', 'vT4~B''T}&_(', 'Fallon Mityushin', FALSE, '2022-12-06'),
('rchesneyz@usda.gov', 'oE6@hM(0M7{G', 'Raffarty Chesney', FALSE, '2023-11-06'),
('nidale10@ezinearticles.com', 'eG5''A/FB', 'Nona Idale', FALSE, '2023-05-03'),
('rmanilo11@amazzon.de', 'cT3.U)8omcrb', 'Raye Manilo', FALSE, '2023-02-11'),
('tcampelli12@purevolume.com', 'gS9_e?3S7S', 'Tiffie Campelli', FALSE, '2023-10-16'),
('pwelden13@miitbeian.gov.cn', 'zM6''Y@=#!M_', 'Prescott Welden', FALSE, '2023-02-23'),
('jorcott14@usa.gov', 'kJ9.6)', 'Junie Orcott', FALSE, '2023-01-28'),
('plambdin15@weather.com', 'sZ5>%")', 'Pamelina Lambdin', FALSE, '2023-07-23'),
('tbeeching16@google.it', 'kP8.XyUL3\tE', 'Tiffany Beeching', FALSE, '2024-04-28'),
('fbeidebeke17@nba.com', 'dL2!wwzl$9', 'Fairlie Beidebeke', FALSE, '2024-01-27'),
('bsommerland18@dot.gov', 'nE7)}F{{!Fr', 'Brittne Sommerland', FALSE, '2023-03-07'),
('badrian19@comsenz.com', 'gD3(q7g#tbzr', 'Barbette Adrian', FALSE, '2023-02-06'),
('kpaffitt1a@about.me', 'xE7*fW', 'Kory Paffitt', FALSE, '2023-08-07'),
('dissard1b@deliciousdays.com', 'wM4+G5)''yqc', 'Demetre Issard', FALSE, '2023-09-09'),
('bjeacock1c@abc.net.au', 'dF0"dW', 'Birgit Jeacock', FALSE, '2023-02-20'),
('lmouncher1d@answers.com', 'bE8/hbj({l`', 'Lorrin Mouncher', FALSE, '2023-07-31');

INSERT INTO projects (parent_id, name, description, status) VALUES
(NULL, 'Orion Network Optimization', 'Developing a network enhancement tool for optimizing data traffic and reducing latency across distributed systems.', 'IN_PROGRESS'),
(NULL, 'Quantum Data Analysis', 'Implementing quantum computing techniques to solve complex data analysis problems more efficiently than classical computing allows.', 'IN_PROGRESS'),
(NULL, 'Cloud Migration Suite', 'Provides a comprehensive solution for migrating various workloads to cloud environments with minimal downtime and continuous integration support.', 'IN_PROGRESS'),
(NULL, 'Blockchain Ledger System', 'Creating a secure, scalable blockchain-based ledger system to provide immutable transaction records for financial institutions.', 'IN_PROGRESS'),
(NULL, 'AI Customer Support', 'Utilizing artificial intelligence to automate customer support, enabling real-time responses and increasing overall customer satisfaction.', 'IN_PROGRESS'),
(NULL, 'Cybersecurity Threat Detection', 'Developing advanced machine learning models to detect and respond to cybersecurity threats in real time.', 'IN_PROGRESS'),
(NULL, 'Mobile App Deployment Platform', 'Enables businesses to build, test, and deploy mobile applications quickly across multiple platforms with a focus on user experience and performance.', 'IN_PROGRESS'),
(2, 'Quantum Algorithm Development', 'Focuses on the creation and optimization of quantum algorithms that enhance data processing speeds and accuracy, pushing the boundaries of current quantum computing capabilities.', 'IN_PROGRESS'),
(2, 'Quantum Computing Security', 'Aims to develop robust security protocols specifically for quantum computing environments to safeguard sensitive data against quantum and classical threats.', 'IN_PROGRESS'),
(4, 'Hybrid Cloud Integration', 'Design and implement solutions for integrating hybrid cloud environments, focusing on seamless connectivity between on-premises infrastructure and cloud services.', 'IN_PROGRESS'),
(4, 'Cloud Data Compliance', 'Ensures that all data migration strategies adhere to global compliance standards, including GDPR and HIPAA, to safeguard data integrity and privacy.', 'IN_PROGRESS'),
(4, 'Cloud Automation Tools', 'Develop automation tools to streamline the migration process, reduce manual tasks and minimize the potential for human error.', 'IN_PROGRESS'),
(4, 'Performance Optimization', 'Optimize cloud configurations to ensure high performance and cost efficiency, analyzing resource usage and adjusting provisioning as necessary.', 'IN_PROGRESS'),
(5, 'Chatbot Development', 'Develop AI-powered chatbots designed to handle customer inquiries automatically, providing responses based on natural language processing and machine learning.', 'IN_PROGRESS'),
(5, 'Voice Recognition Integration', 'Integrate advanced voice recognition capabilities into customer support systems to allow voice-driven interactions, improving accessibility and user experience.', 'IN_PROGRESS'),
(5, 'Predictive Customer Analytics', 'Utilize AI to analyze customer data and predict future support needs, enabling proactive support and personalized customer service strategies.', 'IN_PROGRESS'),
(16, 'Behavioral Pattern Recognition', 'Develop algorithms to identify and analyze behavioral patterns in customer interactions, enabling more accurate predictions of customer needs and behaviors.', 'IN_PROGRESS'),
(16, 'Customer Sentiment Analysis', 'Implement sentiment analysis tools to gauge customer emotions from textual feedback, enhancing the responsiveness and personalization of support services.', 'IN_PROGRESS'),
(16, 'Analytics Dashboard Development', 'Create a comprehensive analytics dashboard that provides real-time insights into customer behavior and support performance metrics.', 'IN_PROGRESS');

INSERT INTO tags (name) VALUES
('Finance'),
('Health Care'),
('Miscellaneous'),
('Technology'),
('Consumer Services'),
('Basic Industries');

INSERT INTO prizes (name, quantity) VALUES
('Wine - White, Schroder And Schyl', 90),
('Instant Coffee', 85),
('Soup Bowl Clear 8oz92008', 72),
('Oyster - In Shell', 90),
('Muffin - Carrot Individual Wrap', 64),
('Crackers - Graham', 91),
('Icecream Bar - Del Monte', 72),
('Bagelers', 8),
('Black Currants', 72),
('Pail For Lid 1537', 69),
('Cake - Dulce De Leche', 56),
('Persimmons', 19),
('Pasta - Fettuccine, Egg, Fresh', 62),
('Mikes Hard Lemonade', 57),
('Beer - Fruli', 86),
('Tomatoes - Diced, Canned', 26),
('Soup - Tomato Mush. Florentine', 1),
('Coffee - 10oz Cup 92961', 68),
('Table Cloth 62x120 White', 53),
('Compound - Rum', 26);

INSERT INTO winners (user_id, prize_id, awarded_date) VALUES
(37, 20, '2024-03-15'),
(12, 5, '2024-04-26'),
(23, 1, '2024-02-17'),
(45, 13, '2024-04-09'),
(9, 7, '2024-02-01'),
(14, 18, '2024-05-21'),
(22, 11, '2024-05-15'),
(6, 8, '2024-03-20'),
(30, 14, '2024-04-18');

INSERT INTO items (user_id, project_id, description, due_date, created_at, completed_at, status, priority) VALUES
(31, 1, 'Develop API endpoints', '2024-09-18', '2024-02-19 00:00:00', NULL, 'IN_PROGRESS', FALSE),
(9, 18, 'Refactor database schema', '2024-03-22', '2024-03-13 00:00:00', '2024-03-26 00:00:00', 'DONE', TRUE),
(18, 16, 'Migrate to microservices architecture', '2024-05-01', '2024-01-14 00:00:00', NULL, 'IN_PROGRESS', FALSE),
(43, 3, 'Design user interface for mobile app', '2024-09-26', '2024-02-21 00:00:00', NULL, 'IN_PROGRESS', FALSE),
(5, 7, 'Design user interface for mobile app', '2024-03-24', '2024-03-14 00:00:00', '2024-04-03 00:00:00', 'DONE', FALSE),
(45, 6, 'Optimize network throughput', '2024-04-06', '2024-03-20 00:00:00', '2024-04-08 00:00:00', 'DONE', FALSE),
(22, 17, 'Develop API endpoints', '2023-12-14', '2023-11-27 00:00:00', '2023-12-28 00:00:00', 'DONE', FALSE),
(4, 1, 'Refactor database schema', '2024-04-23', '2024-03-25 00:00:00', '2024-04-27 00:00:00', 'DONE', FALSE),
(43, 13, 'Implement OAuth2 authentication', '2024-08-09', '2023-12-20 00:00:00', NULL, 'IN_PROGRESS', FALSE),
(12, 15, 'Implement OAuth2 authentication', '2024-07-15', '2024-03-03 00:00:00', NULL, 'IN_PROGRESS', FALSE),
(26, 9, 'Develop API endpoints', '2024-07-14', '2024-02-29 00:00:00', NULL, 'IN_PROGRESS', TRUE),
(46, 17, 'Enhance cybersecurity measures', '2024-09-24', '2024-03-05 00:00:00', NULL, 'IN_PROGRESS', FALSE),
(9, 8, 'Migrate to microservices architecture', '2024-05-16', '2023-11-18 00:00:00', NULL, 'IN_PROGRESS', FALSE),
(3, 8, 'Migrate to microservices architecture', '2024-07-23', '2023-11-10 00:00:00', NULL, 'IN_PROGRESS', FALSE),
(27, 13, 'Upgrade server hardware', '2024-04-02', '2024-03-26 00:00:00', '2024-04-12 00:00:00', 'DONE', FALSE),
(33, 17, 'Enhance cybersecurity measures', '2024-01-19', '2024-01-04 00:00:00', '2024-01-26 00:00:00', 'DONE', FALSE),
(28, 5, 'Set up continuous integration', '2023-12-20', '2023-12-07 00:00:00', '2024-01-04 00:00:00', 'DONE', FALSE),
(45, 6, 'Optimize network throughput', '2024-05-28', '2024-03-15 00:00:00', NULL, 'IN_PROGRESS', FALSE),
(17, 12, 'Enhance cybersecurity measures', '2023-11-16', '2023-10-31 00:00:00', '2023-11-18 00:00:00', 'DONE', FALSE),
(26, 14, 'Optimize network throughput', '2024-10-20', '2023-11-04 00:00:00', NULL, 'IN_PROGRESS', FALSE),
(29, 6, 'Enhance cybersecurity measures', '2023-11-17', '2023-11-09 00:00:00', '2023-11-18 00:00:00', 'DONE', FALSE),
(23, 14, 'Develop API endpoints', '2023-11-19', '2023-10-27 00:00:00', '2023-11-26 00:00:00', 'DONE', FALSE),
(28, 14, 'Implement OAuth2 authentication', '2024-10-15', '2024-03-14 00:00:00', NULL, 'IN_PROGRESS', FALSE),
(32, 6, 'Set up continuous integration', '2024-05-12', '2024-02-08 00:00:00', NULL, 'IN_PROGRESS', FALSE),
(18, 12, 'Migrate to microservices architecture', '2024-08-31', '2023-12-11 00:00:00', NULL, 'IN_PROGRESS', FALSE),
(30, 13, 'Optimize network throughput', '2024-09-11', '2024-03-07 00:00:00', NULL, 'IN_PROGRESS', FALSE),
(44, 13, 'Migrate to microservices architecture', '2024-03-10', '2024-02-11 00:00:00', '2024-03-11 00:00:00', 'DONE', TRUE),
(28, 9, 'Set up continuous integration', '2023-12-31', '2023-12-29 00:00:00', '2024-01-15 00:00:00', 'DONE', FALSE),
(37, 4, 'Upgrade server hardware', '2024-09-10', '2024-01-13 00:00:00', NULL, 'IN_PROGRESS', FALSE),
(48, 4, 'Develop API endpoints', '2023-11-02', '2023-10-09 00:00:00', '2023-11-17 00:00:00', 'DONE', FALSE),
(23, 17, 'Refactor database schema', '2024-07-12', '2024-01-09 00:00:00', NULL, 'IN_PROGRESS', TRUE),
(37, 8, 'Create user documentation', '2024-01-19', '2023-12-23 00:00:00', '2024-01-31 00:00:00', 'DONE', FALSE),
(49, 1, 'Upgrade server hardware', '2024-10-14', '2023-11-05 00:00:00', NULL, 'IN_PROGRESS', FALSE),
(14, 18, 'Migrate to microservices architecture', '2023-12-09', '2023-12-04 00:00:00', '2023-12-22 00:00:00', 'DONE', FALSE),
(1, 15, 'Upgrade server hardware', '2024-09-03', '2023-12-30 00:00:00', NULL, 'IN_PROGRESS', FALSE),
(26, 1, 'Enhance cybersecurity measures', '2023-11-14', '2023-10-22 00:00:00', '2023-11-26 00:00:00', 'DONE', FALSE),
(21, 19, 'Optimize network throughput', '2024-08-05', '2024-01-01 00:00:00', NULL, 'IN_PROGRESS', TRUE),
(2, 1, 'Set up continuous integration', '2024-08-20', '2024-03-15 00:00:00', NULL, 'IN_PROGRESS', FALSE),
(11, 10, 'Enhance cybersecurity measures', '2023-12-13', '2023-12-03 00:00:00', '2023-12-14 00:00:00', 'DONE', FALSE),
(32, 10, 'Migrate to microservices architecture', '2024-06-12', '2023-12-08 00:00:00', NULL, 'IN_PROGRESS', FALSE),
(32, 8, 'Upgrade server hardware', '2024-07-16', '2023-11-06 00:00:00', NULL, 'IN_PROGRESS', FALSE),
(27, 17, 'Migrate to microservices architecture', '2024-08-19', '2024-03-22 00:00:00', NULL, 'IN_PROGRESS', FALSE),
(49, 4, 'Refactor database schema', '2024-03-10', '2024-02-16 00:00:00', '2024-03-23 00:00:00', 'DONE', FALSE),
(42, 2, 'Refactor database schema', '2024-04-16', '2024-03-22 00:00:00', '2024-04-28 00:00:00', 'DONE', FALSE),
(5, 18, 'Develop API endpoints', '2024-06-04', '2023-12-28 00:00:00', NULL, 'IN_PROGRESS', FALSE),
(39, 19, 'Implement OAuth2 authentication', '2024-03-17', '2024-03-09 00:00:00', '2024-03-25 00:00:00', 'DONE', FALSE),
(27, 15, 'Design user interface for mobile app', '2024-02-26', '2024-02-23 00:00:00', '2024-03-11 00:00:00', 'DONE', FALSE),
(5, 10, 'Refactor database schema', '2024-01-26', '2024-01-08 00:00:00', '2024-01-29 00:00:00', 'DONE', FALSE),
(14, 16, 'Design user interface for mobile app', '2024-10-15', '2024-01-05 00:00:00', NULL, 'IN_PROGRESS', FALSE),
(10, 10, 'Migrate to microservices architecture', '2024-05-07', '2024-01-22 00:00:00', NULL, 'IN_PROGRESS', FALSE),
(1, 10, 'Implement OAuth2 authentication', '2024-07-31', '2023-11-22 00:00:00', NULL, 'IN_PROGRESS', FALSE),
(48, 7, 'Create user documentation', '2024-08-02', '2023-12-02 00:00:00', NULL, 'IN_PROGRESS', TRUE),
(2, 4, 'Implement OAuth2 authentication', '2024-08-17', '2023-12-29 00:00:00', NULL, 'IN_PROGRESS', FALSE),
(1, 17, 'Upgrade server hardware', '2024-04-18', '2024-03-22 00:00:00', '2024-04-30 00:00:00', 'DONE', FALSE),
(21, 11, 'Develop API endpoints', '2024-10-04', '2024-01-24 00:00:00', NULL, 'IN_PROGRESS', FALSE),
(26, 18, 'Optimize network throughput', '2024-03-05', '2024-02-13 00:00:00', '2024-03-18 00:00:00', 'DONE', FALSE),
(31, 15, 'Enhance cybersecurity measures', '2024-09-23', '2023-12-27 00:00:00', NULL, 'IN_PROGRESS', TRUE),
(41, 13, 'Upgrade server hardware', '2023-12-23', '2023-12-11 00:00:00', '2023-12-28 00:00:00', 'DONE', TRUE),
(24, 12, 'Optimize network throughput', '2024-08-30', '2023-11-30 00:00:00', NULL, 'IN_PROGRESS', FALSE),
(28, 14, 'Enhance cybersecurity measures', '2023-12-15', '2023-12-11 00:00:00', '2023-12-27 00:00:00', 'DONE', FALSE),
(35, 10, 'Design user interface for mobile app', '2024-02-18', '2024-01-29 00:00:00', '2024-02-28 00:00:00', 'DONE', FALSE),
(19, 6, 'Upgrade server hardware', '2024-07-13', '2024-03-03 00:00:00', NULL, 'IN_PROGRESS', FALSE),
(2, 14, 'Create user documentation', '2024-04-18', '2024-04-05 00:00:00', '2024-04-25 00:00:00', 'DONE', FALSE),
(31, 16, 'Enhance cybersecurity measures', '2024-06-17', '2024-03-12 00:00:00', NULL, 'IN_PROGRESS', FALSE),
(39, 13, 'Implement OAuth2 authentication', '2024-07-03', '2023-11-20 00:00:00', NULL, 'IN_PROGRESS', FALSE),
(41, 2, 'Migrate to microservices architecture', '2024-01-02', '2023-12-28 00:00:00', '2024-01-04 00:00:00', 'DONE', TRUE),
(13, 3, 'Set up continuous integration', '2024-03-30', '2024-03-08 00:00:00', '2024-04-06 00:00:00', 'DONE', FALSE),
(14, 17, 'Design user interface for mobile app', '2024-10-05', '2023-12-25 00:00:00', NULL, 'IN_PROGRESS', FALSE),
(24, 9, 'Upgrade server hardware', '2023-12-09', '2023-11-24 00:00:00', '2023-12-24 00:00:00', 'DONE', FALSE),
(38, 8, 'Implement OAuth2 authentication', '2023-11-21', '2023-11-08 00:00:00', '2023-11-23 00:00:00', 'DONE', FALSE),
(50, 16, 'Develop API endpoints', '2024-02-07', '2024-01-26 00:00:00', '2024-02-22 00:00:00', 'DONE', FALSE),
(41, 18, 'Enhance cybersecurity measures', '2024-04-05', '2024-03-27 00:00:00', '2024-04-20 00:00:00', 'DONE', FALSE),
(41, 16, 'Set up continuous integration', '2024-05-29', '2024-01-31 00:00:00', NULL, 'IN_PROGRESS', TRUE),
(1, 19, 'Develop API endpoints', '2024-10-04', '2023-12-01 00:00:00', NULL, 'IN_PROGRESS', TRUE),
(22, 16, 'Enhance cybersecurity measures', '2023-11-13', '2023-11-05 00:00:00', '2023-11-27 00:00:00', 'DONE', TRUE),
(29, 14, 'Optimize network throughput', '2024-07-21', '2024-03-03 00:00:00', NULL, 'IN_PROGRESS', FALSE),
(3, 1, 'Develop API endpoints', '2024-04-27', '2024-04-10 00:00:00', '2024-05-11 00:00:00', 'DONE', FALSE),
(13, 1, 'Implement OAuth2 authentication', '2023-12-02', '2023-11-23 00:00:00', '2023-12-03 00:00:00', 'DONE', TRUE),
(15, 17, 'Set up continuous integration', '2024-01-13', '2023-12-24 00:00:00', '2024-01-25 00:00:00', 'DONE', FALSE),
(11, 1, 'Create user documentation', '2024-05-16', '2024-02-10 00:00:00', NULL, 'IN_PROGRESS', FALSE),
(8, 2, 'Refactor database schema', '2024-02-14', '2024-02-05 00:00:00', '2024-02-15 00:00:00', 'DONE', FALSE),
(38, 11, 'Enhance cybersecurity measures', '2024-02-06', '2024-01-25 00:00:00', '2024-02-08 00:00:00', 'DONE', TRUE),
(48, 6, 'Upgrade server hardware', '2023-12-16', '2023-12-03 00:00:00', '2023-12-31 00:00:00', 'DONE', FALSE),
(2, 4, 'Enhance cybersecurity measures', '2024-08-06', '2024-03-01 00:00:00', NULL, 'IN_PROGRESS', TRUE),
(14, 14, 'Refactor database schema', '2024-01-31', '2024-01-11 00:00:00', '2024-02-12 00:00:00', 'DONE', FALSE),
(46, 2, 'Refactor database schema', '2024-03-24', '2024-03-21 00:00:00', '2024-04-06 00:00:00', 'DONE', FALSE),
(22, 1, 'Develop API endpoints', '2024-03-21', '2024-03-02 00:00:00', '2024-03-22 00:00:00', 'DONE', FALSE),
(11, 5, 'Optimize network throughput', '2024-09-11', '2024-02-15 00:00:00', NULL, 'IN_PROGRESS', FALSE),
(32, 5, 'Refactor database schema', '2024-10-11', '2023-11-13 00:00:00', NULL, 'IN_PROGRESS', FALSE),
(48, 9, 'Optimize network throughput', '2024-05-04', '2023-12-26 00:00:00', NULL, 'IN_PROGRESS', FALSE),
(13, 19, 'Optimize network throughput', '2024-03-07', '2024-02-29 00:00:00', '2024-03-15 00:00:00', 'DONE', FALSE),
(17, 7, 'Set up continuous integration', '2024-07-08', '2024-03-06 00:00:00', NULL, 'IN_PROGRESS', FALSE),
(14, 6, 'Upgrade server hardware', '2024-03-24', '2024-03-12 00:00:00', '2024-04-08 00:00:00', 'DONE', FALSE),
(3, 17, 'Migrate to microservices architecture', '2024-02-13', '2024-02-02 00:00:00', '2024-02-22 00:00:00', 'DONE', TRUE),
(12, 17, 'Develop API endpoints', '2023-12-04', '2023-12-03 00:00:00', '2023-12-07 00:00:00', 'DONE', FALSE),
(33, 17, 'Design user interface for mobile app', '2024-01-13', '2024-01-05 00:00:00', '2024-01-22 00:00:00', 'DONE', FALSE),
(11, 16, 'Refactor database schema', '2024-04-11', '2024-04-05 00:00:00', '2024-04-23 00:00:00', 'DONE', FALSE),
(35, 14, 'Create user documentation', '2024-07-24', '2024-03-25 00:00:00', NULL, 'IN_PROGRESS', TRUE),
(21, 11, 'Enhance cybersecurity measures', '2024-09-18', '2023-11-02 00:00:00', NULL, 'IN_PROGRESS', FALSE),
(30, 9, 'Create user documentation', '2024-04-04', '2024-03-28 00:00:00', '2024-04-07 00:00:00', 'DONE', FALSE),
(39, 19, 'Design user interface for mobile app', '2024-05-28', '2023-11-04 00:00:00', NULL, 'IN_PROGRESS', FALSE),
(26, 2, 'Implement OAuth2 authentication', '2024-05-15', '2023-11-20 00:00:00', NULL, 'IN_PROGRESS', FALSE),
(6, 5, 'Design user interface for mobile app', '2023-12-03', '2023-11-24 00:00:00', '2023-12-15 00:00:00', 'DONE', FALSE),
(20, 10, 'Optimize network throughput', '2023-11-02', '2023-10-29 00:00:00', '2023-11-13 00:00:00', 'DONE', FALSE),
(38, 14, 'Migrate to microservices architecture', '2023-11-09', '2023-10-16 00:00:00', '2023-11-21 00:00:00', 'DONE', TRUE),
(46, 15, 'Implement OAuth2 authentication', '2024-03-31', '2024-03-13 00:00:00', '2024-04-10 00:00:00', 'DONE', FALSE),
(26, 3, 'Develop API endpoints', '2024-08-02', '2024-01-03 00:00:00', NULL, 'IN_PROGRESS', FALSE),
(48, 8, 'Set up continuous integration', '2024-06-14', '2023-11-15 00:00:00', NULL, 'IN_PROGRESS', TRUE),
(36, 3, 'Design user interface for mobile app', '2024-03-22', '2024-02-25 00:00:00', '2024-03-31 00:00:00', 'DONE', FALSE),
(39, 2, 'Implement OAuth2 authentication', '2024-08-17', '2024-03-28 00:00:00', NULL, 'IN_PROGRESS', FALSE),
(2, 4, 'Optimize network throughput', '2023-11-25', '2023-11-08 00:00:00', '2023-11-26 00:00:00', 'DONE', FALSE),
(29, 11, 'Set up continuous integration', '2023-12-15', '2023-12-11 00:00:00', '2023-12-19 00:00:00', 'DONE', FALSE),
(47, 7, 'Enhance cybersecurity measures', '2024-06-26', '2024-02-08 00:00:00', NULL, 'IN_PROGRESS', TRUE),
(27, 2, 'Design user interface for mobile app', '2024-07-04', '2024-01-23 00:00:00', NULL, 'IN_PROGRESS', FALSE),
(47, 5, 'Optimize network throughput', '2024-02-28', '2024-02-14 00:00:00', '2024-03-10 00:00:00', 'DONE', FALSE),
(33, 12, 'Refactor database schema', '2024-04-19', '2024-03-20 00:00:00', '2024-05-01 00:00:00', 'DONE', FALSE),
(18, 13, 'Migrate to microservices architecture', '2023-11-05', '2023-10-15 00:00:00', '2023-11-10 00:00:00', 'DONE', FALSE),
(18, 18, 'Migrate to microservices architecture', '2024-02-07', '2024-01-17 00:00:00', '2024-02-17 00:00:00', 'DONE', FALSE),
(21, 3, 'Implement OAuth2 authentication', '2024-06-15', '2024-01-05 00:00:00', NULL, 'IN_PROGRESS', FALSE),
(26, 2, 'Create user documentation', '2024-01-30', '2024-01-23 00:00:00', '2024-02-14 00:00:00', 'DONE', FALSE),
(31, 2, 'Optimize network throughput', '2024-02-09', '2024-01-30 00:00:00', '2024-02-16 00:00:00', 'DONE', FALSE),
(47, 12, 'Enhance cybersecurity measures', '2023-12-18', '2023-11-22 00:00:00', '2023-12-27 00:00:00', 'DONE', FALSE),
(33, 13, 'Set up continuous integration', '2024-04-14', '2024-04-06 00:00:00', '2024-04-28 00:00:00', 'DONE', FALSE),
(30, 9, 'Develop API endpoints', '2024-07-31', '2024-02-19 00:00:00', NULL, 'IN_PROGRESS', FALSE),
(11, 15, 'Refactor database schema', '2024-10-02', '2023-12-28 00:00:00', NULL, 'IN_PROGRESS', FALSE),
(9, 15, 'Create user documentation', '2024-05-07', '2024-02-27 00:00:00', NULL, 'IN_PROGRESS', FALSE),
(3, 8, 'Enhance cybersecurity measures', '2024-02-11', '2024-01-16 00:00:00', '2024-02-17 00:00:00', 'DONE', FALSE),
(5, 19, 'Set up continuous integration', '2024-10-19', '2023-11-14 00:00:00', NULL, 'IN_PROGRESS', FALSE),
(11, 17, 'Develop API endpoints', '2024-09-11', '2024-01-10 00:00:00', NULL, 'IN_PROGRESS', FALSE),
(48, 2, 'Create user documentation', '2024-06-07', '2024-02-24 00:00:00', NULL, 'IN_PROGRESS', FALSE),
(14, 8, 'Create user documentation', '2023-12-15', '2023-11-17 00:00:00', '2023-12-30 00:00:00', 'DONE', FALSE),
(30, 3, 'Enhance cybersecurity measures', '2024-05-24', '2024-02-08 00:00:00', NULL, 'IN_PROGRESS', FALSE),
(39, 5, 'Set up continuous integration', '2024-01-17', '2023-12-23 00:00:00', '2024-01-24 00:00:00', 'DONE', FALSE),
(38, 7, 'Develop API endpoints', '2024-06-08', '2023-11-17 00:00:00', NULL, 'IN_PROGRESS', FALSE),
(23, 14, 'Refactor database schema', '2024-05-29', '2024-02-15 00:00:00', NULL, 'IN_PROGRESS', FALSE),
(10, 5, 'Design user interface for mobile app', '2024-02-06', '2024-01-26 00:00:00', '2024-02-21 00:00:00', 'DONE', FALSE),
(22, 7, 'Implement OAuth2 authentication', '2024-02-17', '2024-01-31 00:00:00', '2024-03-03 00:00:00', 'DONE', FALSE),
(41, 1, 'Design user interface for mobile app', '2024-01-19', '2024-01-03 00:00:00', '2024-02-03 00:00:00', 'DONE', FALSE),
(32, 2, 'Optimize network throughput', '2023-12-18', '2023-12-16 00:00:00', '2023-12-24 00:00:00', 'DONE', FALSE),
(42, 19, 'Create user documentation', '2024-05-03', '2024-02-08 00:00:00', NULL, 'IN_PROGRESS', FALSE),
(36, 7, 'Create user documentation', '2024-02-12', '2024-02-02 00:00:00', '2024-02-20 00:00:00', 'DONE', TRUE),
(11, 17, 'Upgrade server hardware', '2024-08-29', '2024-02-27 00:00:00', NULL, 'IN_PROGRESS', FALSE),
(44, 4, 'Upgrade server hardware', '2024-05-10', '2023-12-28 00:00:00', NULL, 'IN_PROGRESS', FALSE),
(6, 3, 'Migrate to microservices architecture', '2024-04-01', '2024-03-21 00:00:00', '2024-04-09 00:00:00', 'DONE', FALSE),
(35, 9, 'Upgrade server hardware', '2024-02-24', '2024-02-21 00:00:00', '2024-02-29 00:00:00', 'DONE', FALSE),
(22, 17, 'Implement OAuth2 authentication', '2023-11-06', '2023-10-10 00:00:00', '2023-11-11 00:00:00', 'DONE', FALSE),
(21, 5, 'Develop API endpoints', '2024-05-11', '2023-11-29 00:00:00', NULL, 'IN_PROGRESS', FALSE),
(16, 14, 'Set up continuous integration', '2024-02-19', '2024-01-20 00:00:00', '2024-02-24 00:00:00', 'DONE', FALSE),
(12, 4, 'Enhance cybersecurity measures', '2024-10-19', '2024-03-04 00:00:00', NULL, 'IN_PROGRESS', FALSE),
(7, 8, 'Set up continuous integration', '2023-12-31', '2023-12-04 00:00:00', '2024-01-05 00:00:00', 'DONE', FALSE),
(34, 10, 'Upgrade server hardware', '2023-12-30', '2023-12-20 00:00:00', '2024-01-14 00:00:00', 'DONE', TRUE),
(18, 8, 'Design user interface for mobile app', '2024-01-01', '2023-12-16 00:00:00', '2024-01-15 00:00:00', 'DONE', FALSE),
(11, 12, 'Design user interface for mobile app', '2024-10-21', '2024-02-13 00:00:00', NULL, 'IN_PROGRESS', FALSE),
(20, 5, 'Create user documentation', '2024-08-08', '2023-11-11 00:00:00', NULL, 'IN_PROGRESS', FALSE),
(34, 18, 'Optimize network throughput', '2024-09-14', '2024-01-27 00:00:00', NULL, 'IN_PROGRESS', FALSE),
(11, 18, 'Enhance cybersecurity measures', '2023-11-13', '2023-10-17 00:00:00', '2023-11-21 00:00:00', 'DONE', FALSE),
(8, 15, 'Implement OAuth2 authentication', '2024-01-17', '2024-01-10 00:00:00', '2024-01-23 00:00:00', 'DONE', TRUE),
(25, 12, 'Implement OAuth2 authentication', '2024-06-13', '2024-01-07 00:00:00', NULL, 'IN_PROGRESS', FALSE),
(44, 5, 'Develop API endpoints', '2023-12-31', '2023-12-28 00:00:00', '2024-01-04 00:00:00', 'DONE', FALSE),
(27, 18, 'Optimize network throughput', '2023-12-28', '2023-12-09 00:00:00', '2024-01-07 00:00:00', 'DONE', TRUE),
(42, 4, 'Set up continuous integration', '2024-06-13', '2024-01-18 00:00:00', NULL, 'IN_PROGRESS', FALSE),
(38, 9, 'Create user documentation', '2024-03-26', '2024-03-24 00:00:00', '2024-03-30 00:00:00', 'DONE', FALSE),
(8, 3, 'Optimize network throughput', '2024-03-23', '2024-02-26 00:00:00', '2024-04-03 00:00:00', 'DONE', FALSE),
(5, 11, 'Optimize network throughput', '2024-05-24', '2023-11-16 00:00:00', NULL, 'IN_PROGRESS', FALSE),
(19, 12, 'Set up continuous integration', '2024-07-13', '2024-02-01 00:00:00', NULL, 'IN_PROGRESS', FALSE),
(45, 16, 'Refactor database schema', '2024-08-23', '2024-03-01 00:00:00', NULL, 'IN_PROGRESS', FALSE),
(49, 1, 'Enhance cybersecurity measures', '2024-01-11', '2024-01-04 00:00:00', '2024-01-15 00:00:00', 'DONE', FALSE),
(22, 3, 'Enhance cybersecurity measures', '2023-12-12', '2023-12-03 00:00:00', '2023-12-26 00:00:00', 'DONE', FALSE),
(11, 2, 'Design user interface for mobile app', '2023-12-21', '2023-12-16 00:00:00', '2023-12-28 00:00:00', 'DONE', TRUE),
(37, 19, 'Optimize network throughput', '2024-07-19', '2024-01-05 00:00:00', NULL, 'IN_PROGRESS', TRUE),
(2, 13, 'Refactor database schema', '2024-07-11', '2024-02-25 00:00:00', NULL, 'IN_PROGRESS', FALSE),
(38, 12, 'Design user interface for mobile app', '2024-07-31', '2024-01-19 00:00:00', NULL, 'IN_PROGRESS', FALSE),
(17, 11, 'Refactor database schema', '2024-03-14', '2024-03-02 00:00:00', '2024-03-18 00:00:00', 'DONE', FALSE),
(45, 16, 'Create user documentation', '2024-08-01', '2023-11-19 00:00:00', NULL, 'IN_PROGRESS', FALSE),
(36, 5, 'Migrate to microservices architecture', '2023-12-17', '2023-11-24 00:00:00', '2023-12-20 00:00:00', 'DONE', FALSE),
(10, 13, 'Refactor database schema', '2024-09-20', '2024-03-20 00:00:00', NULL, 'IN_PROGRESS', FALSE),
(34, 8, 'Upgrade server hardware', '2023-12-25', '2023-12-02 00:00:00', '2024-01-06 00:00:00', 'DONE', FALSE),
(33, 9, 'Develop API endpoints', '2024-09-06', '2024-03-21 00:00:00', NULL, 'IN_PROGRESS', FALSE),
(43, 15, 'Upgrade server hardware', '2024-03-20', '2024-03-11 00:00:00', '2024-03-30 00:00:00', 'DONE', FALSE),
(40, 15, 'Optimize network throughput', '2024-07-20', '2024-02-11 00:00:00', NULL, 'IN_PROGRESS', FALSE),
(9, 16, 'Refactor database schema', '2024-05-27', '2023-11-20 00:00:00', NULL, 'IN_PROGRESS', FALSE),
(28, 4, 'Optimize network throughput', '2024-03-15', '2024-03-01 00:00:00', '2024-03-29 00:00:00', 'DONE', FALSE),
(24, 8, 'Enhance cybersecurity measures', '2024-09-26', '2024-02-23 00:00:00', NULL, 'IN_PROGRESS', FALSE),
(24, 4, 'Implement OAuth2 authentication', '2023-12-11', '2023-11-17 00:00:00', '2023-12-24 00:00:00', 'DONE', TRUE),
(19, 4, 'Enhance cybersecurity measures', '2024-08-03', '2024-01-10 00:00:00', NULL, 'IN_PROGRESS', FALSE),
(24, 6, 'Upgrade server hardware', '2024-10-18', '2024-03-14 00:00:00', NULL, 'IN_PROGRESS', FALSE),
(12, 11, 'Design user interface for mobile app', '2024-06-14', '2024-03-07 00:00:00', NULL, 'IN_PROGRESS', TRUE),
(40, 2, 'Design user interface for mobile app', '2024-06-22', '2023-12-30 00:00:00', NULL, 'IN_PROGRESS', FALSE),
(23, 8, 'Implement OAuth2 authentication', '2024-10-02', '2024-03-03 00:00:00', NULL, 'IN_PROGRESS', FALSE),
(33, 3, 'Develop API endpoints', '2024-08-04', '2024-03-01 00:00:00', NULL, 'IN_PROGRESS', FALSE),
(25, 19, 'Migrate to microservices architecture', '2023-12-24', '2023-12-17 00:00:00', '2024-01-08 00:00:00', 'DONE', FALSE),
(28, 19, 'Refactor database schema', '2024-10-21', '2024-03-02 00:00:00', NULL, 'IN_PROGRESS', FALSE),
(33, 10, 'Design user interface for mobile app', '2024-08-23', '2024-03-28 00:00:00', NULL, 'IN_PROGRESS', FALSE),
(37, 15, 'Refactor database schema', '2024-03-12', '2024-03-03 00:00:00', '2024-03-17 00:00:00', 'DONE', TRUE),
(10, 18, 'Optimize network throughput', '2023-11-23', '2023-11-13 00:00:00', '2023-11-27 00:00:00', 'DONE', FALSE),
(29, 19, 'Optimize network throughput', '2024-02-24', '2024-02-14 00:00:00', '2024-02-25 00:00:00', 'DONE', FALSE),
(26, 3, 'Design user interface for mobile app', '2024-02-13', '2024-02-03 00:00:00', '2024-02-22 00:00:00', 'DONE', FALSE),
(20, 14, 'Refactor database schema', '2024-03-05', '2024-02-27 00:00:00', '2024-03-10 00:00:00', 'DONE', FALSE),
(37, 7, 'Implement OAuth2 authentication', '2024-03-29', '2024-03-19 00:00:00', '2024-04-05 00:00:00', 'DONE', FALSE),
(9, 17, 'Refactor database schema', '2023-12-31', '2023-12-03 00:00:00', '2024-01-02 00:00:00', 'DONE', TRUE),
(6, 18, 'Migrate to microservices architecture', '2024-07-21', '2024-03-01 00:00:00', NULL, 'IN_PROGRESS', FALSE),
(41, 9, 'Refactor database schema', '2023-12-10', '2023-11-13 00:00:00', '2023-12-25 00:00:00', 'DONE', FALSE),
(35, 4, 'Optimize network throughput', '2024-09-12', '2023-11-02 00:00:00', NULL, 'IN_PROGRESS', FALSE),
(43, 9, 'Implement OAuth2 authentication', '2024-05-16', '2023-11-26 00:00:00', NULL, 'IN_PROGRESS', TRUE),
(18, 11, 'Design user interface for mobile app', '2024-08-07', '2024-02-25 00:00:00', NULL, 'IN_PROGRESS', FALSE),
(46, 5, 'Upgrade server hardware', '2023-11-18', '2023-11-01 00:00:00', '2023-11-19 00:00:00', 'DONE', FALSE),
(12, 7, 'Upgrade server hardware', '2024-09-18', '2024-03-19 00:00:00', NULL, 'IN_PROGRESS', FALSE),
(42, 15, 'Refactor database schema', '2024-04-11', '2024-03-15 00:00:00', '2024-04-25 00:00:00', 'DONE', FALSE),
(36, 6, 'Design user interface for mobile app', '2024-08-29', '2024-02-15 00:00:00', NULL, 'IN_PROGRESS', FALSE),
(10, 7, 'Migrate to microservices architecture', '2024-08-14', '2024-02-05 00:00:00', NULL, 'IN_PROGRESS', FALSE),
(21, 4, 'Enhance cybersecurity measures', '2024-04-02', '2024-03-23 00:00:00', '2024-04-07 00:00:00', 'DONE', TRUE),
(46, 9, 'Optimize network throughput', '2024-04-25', '2024-03-26 00:00:00', '2024-05-06 00:00:00', 'DONE', FALSE),
(31, 18, 'Set up continuous integration', '2024-07-10', '2024-02-29 00:00:00', NULL, 'IN_PROGRESS', TRUE),
(21, 15, 'Migrate to microservices architecture', '2024-10-16', '2023-12-26 00:00:00', NULL, 'IN_PROGRESS', FALSE),
(8, 16, 'Enhance cybersecurity measures', '2023-11-10', '2023-10-15 00:00:00', '2023-11-22 00:00:00', 'DONE', FALSE),
(13, 3, 'Optimize network throughput', '2024-06-23', '2023-11-21 00:00:00', NULL, 'IN_PROGRESS', FALSE),
(39, 12, 'Migrate to microservices architecture', '2023-11-03', '2023-10-20 00:00:00', '2023-11-04 00:00:00', 'DONE', TRUE),
(36, 6, 'Create user documentation', '2024-10-11', '2024-02-18 00:00:00', NULL, 'IN_PROGRESS', FALSE),
(33, 17, 'Implement OAuth2 authentication', '2024-06-14', '2024-03-09 00:00:00', NULL, 'IN_PROGRESS', FALSE),
(13, 5, 'Upgrade server hardware', '2024-04-23', '2024-04-02 00:00:00', '2024-05-03 00:00:00', 'DONE', FALSE),
(25, 10, 'Enhance cybersecurity measures', '2024-05-08', '2024-01-20 00:00:00', NULL, 'IN_PROGRESS', FALSE),
(7, 4, 'Enhance cybersecurity measures', '2024-02-15', '2024-02-03 00:00:00', '2024-02-19 00:00:00', 'DONE', FALSE),
(41, 3, 'Create user documentation', '2024-02-17', '2024-01-28 00:00:00', '2024-02-24 00:00:00', 'DONE', TRUE),
(28, 12, 'Migrate to microservices architecture', '2024-04-20', '2024-04-02 00:00:00', '2024-04-29 00:00:00', 'DONE', TRUE),
(7, 17, 'Upgrade server hardware', '2024-01-18', '2024-01-11 00:00:00', '2024-01-25 00:00:00', 'DONE', FALSE),
(50, 12, 'Migrate to microservices architecture', '2024-08-29', '2024-01-21 00:00:00', NULL, 'IN_PROGRESS', TRUE),
(39, 16, 'Optimize network throughput', '2024-09-17', '2023-10-31 00:00:00', NULL, 'IN_PROGRESS', FALSE);
