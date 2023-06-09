CREATE TABLE "Users" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "name" varchar(30) NOT NULL,
  "email" varchar(35) NOT NULL,
  "password" varchar(16) NOT NULL,
  "age" int NOT NULL,
  "Rol_id" int
);

CREATE TABLE "Courses" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "title" varchar(50) NOT NULL,
  "description" varchar(75) NOT NULL,
  "level_id" varchar(10) NOT NULL,
  "teacher" varchar(30) NOT NULL
);

CREATE TABLE "Course_Video" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "title" varchar(50) NOT NULL,
  "url" varchar NOT NULL,
  "course_id" int
);

CREATE TABLE "Categories" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "name" varchar(20) NOT NULL,
  "video_id" int
);

CREATE TABLE "Roles" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "name" varchar(10) NOT NULL
);

CREATE TABLE "users_curses" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "user_id" int NOT NULL,
  "course_id" int NOT NULL
);

CREATE TABLE "levels" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "level_name" varchar(20) NOT NULL
);

ALTER TABLE "Course_Video" ADD FOREIGN KEY ("course_id") REFERENCES "Courses" ("id");

ALTER TABLE "Course_Video" ADD FOREIGN KEY ("id") REFERENCES "Categories" ("video_id");

ALTER TABLE "Users" ADD FOREIGN KEY ("Rol_id") REFERENCES "Roles" ("id");

ALTER TABLE "users_curses" ADD FOREIGN KEY ("user_id") REFERENCES "Users" ("id");

ALTER TABLE "users_curses" ADD FOREIGN KEY ("course_id") REFERENCES "Courses" ("id");

ALTER TABLE "Courses" ADD FOREIGN KEY ("teacher") REFERENCES "Users" ("id");

ALTER TABLE "Courses" ADD FOREIGN KEY ("level_id") REFERENCES "levels" ("id");


INSERT INTO "Roles" (name) VALUES ('User'), ('Teacher'), ('Admin');
INSERT INTO levels (level_name) VALUES ('Beginner'), ('Intermediate'), ('Advance');


INSERT INTO "Users" (name, email, password, age, "Rol_id" ) VALUES ('Alfredo Fuentes Ojeda', 'fredalf.1234@gmail.com', 'qwerty34', 30, 2);
INSERT INTO "Users" (name, email, password, age, "Rol_id" ) VALUES ('Roberto Ortiz Fuentes', 'dagradai05@gmail.com', 'roberto05', 23, 1);


INSERT INTO "Courses" (title, description, level_id, teacher) VALUES ('Reactjs', 'make pages', 2, 'Yessenia Rosas Castillo'), 
('SQL inyection', 'detect vulnerabilities', 3, 'not aply');

INSERT INTO users_curses (user_id, course_id) VALUES (1, 1), (2, 2);

INSERT INTO  "Course_Video" (title, url, course_id) VALUES ('axios', 'www.axios.com/', 1), ('redux', 'www.redux.com/', 2);



INSERT INTO "Categories" (name, video_id) VALUES ('Frontend', 1 ), ('Backend', 2 ); 

