DROP DATABASE IF EXISTS e_learning;
CREATE DATABASE e_learning;


CREATE TABLE Instructor(
id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
f_name VARCHAR (30),
m_name VARCHAR (30),
l_name VARCHAR (30),
birth_date DATE,
degree VARCHAR(50)
);

CREATE TABLE Courses(
id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
Course_name VARCHAR(70),
Course_hours INT,
descriptions VARCHAR(500),
price VARCHAR(10) ,
progress VARCHAR(10) -- made it varchar because it is presentage
);

CREATE TABLE Student(
id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
f_name VARCHAR (30),
m_name VARCHAR (30),
l_name VARCHAR (30),
user_name VARCHAR(100),
e_mail VARCHAR(50) unique,
pass_word VARCHAR(20),
birth_date DATE,
address VARCHAR(100)
);

CREATE TABLE Assignment(
id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
Submission_time TIME,
Submission_title VARCHAR(50),
Submission_content LONGTEXT -- files till 4 GB
);

CREATE TABLE Assignment_type(
id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
type_id INT NOT NULL, -- not unique 
type_name VARCHAR(30),
ass_id INT NOT NULL,
FOREIGN KEY (ass_id) REFERENCES Assignment(id)ON DELETE CASCADE
);

CREATE TABLE Manage(
id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
course_id INT NOT NULL,
instructor_id INT NOT NULL,
FOREIGN KEY (course_id) REFERENCES Courses(id) ON DELETE CASCADE,
FOREIGN KEY (instructor_id) REFERENCES Instructor(id) ON DELETE CASCADE
);

CREATE TABLE Enroll(
id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
card_code DECIMAL UNIQUE, -- decimal not INT
payment_date DATE,
payment_steps VARCHAR(1000),
course_id INT NOT NULL,
student_id INT NOT NULL,
FOREIGN KEY (course_id) REFERENCES Courses(id)ON DELETE CASCADE,
FOREIGN KEY (student_id) REFERENCES Student(id) ON DELETE CASCADE
);

CREATE TABLE Adding(
id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
ASS_date DATE,
instructor_id INT NOT NULL,
ass_id INT NOT NULL,
FOREIGN KEY (instructor_id) REFERENCES Instructor(id)ON DELETE CASCADE,
FOREIGN KEY (ass_id) REFERENCES Assignment(id) ON DELETE CASCADE
);

CREATE TABLE Submit(
id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
ass_id INT NOT NULL,
student_id INT NOT NULL,
FOREIGN KEY (student_id) REFERENCES Student(id) ON DELETE CASCADE,
FOREIGN KEY (ass_id) REFERENCES Assignment(id) ON DELETE CASCADE
);


INSERT INTO Instructor (f_name,m_name,l_name,birth_date,degree) VALUES
("Petra","Hall","Leonard","1985-03-29 ","PHD"),  -- 1
("Nehru","Amir","Garrett","1975-12-04 ","PHD"),  -- 2
("Keegan","Salvador","Ashton","1979-11-01 ","master"), -- 3
("Genevieve","Cole","Todd","1967-03-29 ","master"), -- 4
("Colorado","Garrison","Griffin","1974-04-24 ","Bachelor of Engineering"); -- 5

INSERT INTO Courses (Course_name,Course_hours,descriptions,price,progress) VALUES
("Machine Learning","40","Build an army of powerful Machine Learning models and know how to combine them to solve any problem,Handle advanced techniques like Dimensionality Reduction"
,"60$","60%"),
("Python","22","Understand how to create your own Python programs,Add the Python Object-Oriented Programming (OOP) skills to your résumé."
,"55$","90%"),
("Java","14","Learn the core Java skills needed to apply for Java developer positions in just 14 hours,Be able to demonstrate your understanding of Java to future employers."
,"13$","76%"),
("Mysql","20","Create your own database or interact with existing databases,Write complex SQL queries across multiple tables"
,"19$","60%"),
("Data_Structures + Algorithms","21","Ace coding interviews given by some of the top tech companies,Learn, implement, and use different Data Structures"
,"10$","40%"),
("C++","15"," the games industry standard language,How to use the Unreal Engine 4 Editor."
,"10$" ,"52%"),
("Adobe Photoshop CC","11","You will be able to start earning money from your Photoshop Skills,You will create social media post images for Facebook, Instagram, Twitter, Pintrest & Youtube"
,"10$","72%");

INSERT INTO student (f_name,m_name,l_name,user_name,e_mail,pass_word,birth_date,address) VALUES
("Cain","Garrison","David","Cain Garrison","Cain@gmail.com","1997-10-20","1997-10-20","P.O. Box 581, 7445 Duis Street"),
("Louis","Hakeem","Edan","Louis Hakeem","Louis@gmail.com","2000-11-20","2000-11-20","Ap #278-1034 Ullamcorper Ave"),
("Thor","Jerome","Daniel","Thor Jerome","Thor@gmail.com","1998-01-01","1998-01-01","612-1668 Cursus Avenue"),
("Dillon","Camden","Timon","Dillon Camden","Dillonn@gmail.com","1999-11-12","1999-11-12","430-3216 Placerat, Av."),
("Bradley","Kaseem","Barrett","Bradley Kaseem","Bradley@gmail.com","1999-07-10","1999-07-10","5355 Maecenas Rd."),
("Grady","Emerson","Hakeem","Grady Emerson","Grady@gmail.com","2004-10-05","2004-10-05","P.O. Box 551, 5912 Senectus Rd."),
("Nash","Quinn","Victor","Nash Quinn","Nash@gmail.com","2001-03-22","2001-03-22","Ap #597-340 Ac St."),
("Cassidy","Marshall","Brady","Cassidy Marshall","Cassidy@gmail.com","2001-08-29","2001-08-29","Ap #896-4894 Ac Rd."),
("Arsenio","Vernon","whoppi","Arsenio Vernon","Whoopi@gmail.com","1995-12-01","1995-12-01","Ap #117-8448 Pellentesque Road"),
("john","Locas","Legend","john Locas","john@gmail.com","1999-10-07","1999-10-07","Ap #556-4331 A, St."),
("Lael","Ulric","Dexter","Lael Ulric","Lael@gmail.com","2005-06-30","2005-06-30","7348 Cum Ave"),
("Merrill","Ryder","Zane","Merrill Ryder","Merrill@gmail.com","1992-12-20","1992-12-20","P.O. Box 197");


INSERT INTO Assignment(Submission_time,Submission_title,Submission_content) VALUES
("10:15:03","Java ASS","text_file"),   -- 3
("12:13:42","Machine Learning ASS","text_file"),   -- 1
("8:00:13","Python ASS","word_file"),   -- 2
("22:33:54","Data_Structures + Algorithms ASS","word_file"),   -- 5
("9:56:10","Mysql ASS","PDF"), -- 4
("18:10:10","Adobe Photoshop CC ASS","PDF"), -- 7
("4:22:48","C++ ASS","text_file");    -- 6

INSERT INTO Assignment_type(type_id,type_name,ass_id) VALUES
("1","text_file","1"),
("2","word_file","3"),
("3","PDF","5"),
("1","text_file","2"),
("2","word_file","4"),
("3","PDF","6"),
("1","text_file","7");

INSERT INTO Manage(course_id ,instructor_id) VALUES
("1","2"),
("2","2"),
("3","1"),
("4","3"),
("5","1"),
("6","5"),
("7","4");

INSERT INTO Enroll(card_code,payment_date,payment_steps,course_id,student_id) VALUES 
("3528460970","2020,01,10","TEXT","2","1"),
("3567990580","2020,02,9","TEXT","1","2"),
("3486850282","2020,03,10","TEXT","3","3"),
("3638422094","2020,01,01","TEXT","5","4"),
("3348752700","2020,01,30","TEXT","4","5"),
("3317534895","2020,03,12","TEXT","6","6"),
("3390870942","2020,04,21","TEXT","7","7"),
("3972291160","2020,05,23","TEXT","2","8"),
("3416835146","2020,12,15","TEXT","1","9"),
("3658053061","2020,08,21","TEXT","3","10"),
("3905889740","2020,10,3","TEXT","5","11"),
("3943761323","2020,9,29","TEXT","4","12");

INSERT INTO Adding(ASS_date,instructor_id,ass_id) VALUES 
("2021,01,10","1","1"),
("2021,02,9","2","2"),
("2021,03,10","2","3"),
("2021,01,01","1","4"),
("2021,05,30","3","5"),
("2021,03,12","4","6"),
("2021,04,21","5","7");


INSERT INTO Submit(ass_id,student_id) VALUES
("3","1"),
("2","2"),
("1","3"),
("4","4"),
("5","5"),
("7","6"),
("6","7"),
("3","8"),
("2","9"),
("1","10"),
("4","11"),
("5","12");




