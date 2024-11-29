-- 拠点テーブル
CREATE TABLE locations (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL
);

-- 拠点住所テーブル
CREATE TABLE location_addresses (
    location_id INTEGER PRIMARY KEY,
    address TEXT NOT NULL,
    FOREIGN KEY (location_id) REFERENCES locations(id)
);

-- レッスン室テーブル
CREATE TABLE lesson_rooms (
    id INTEGER PRIMARY KEY,
    location_id INTEGER NOT NULL,
    room_name TEXT NOT NULL,
    FOREIGN KEY (location_id) REFERENCES locations(id)
);

-- 楽器テーブル
CREATE TABLE instruments (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL
);

-- コーステーブル
CREATE TABLE courses (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    instrument_id INTEGER NOT NULL,
    age_group TEXT NOT NULL,
    FOREIGN KEY (instrument_id) REFERENCES instruments(id),
    CHECK (age_group IN ('子供', '大人'))
);

-- 指導者テーブル
CREATE TABLE teachers (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL
);

-- 保護者テーブル
CREATE TABLE parents (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL
);

-- 生徒テーブル
CREATE TABLE students (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    parent_id INTEGER,
    is_child BOOLEAN NOT NULL DEFAULT 0,
    FOREIGN KEY (parent_id) REFERENCES parents(id)
);

-- 指導者連絡先テーブル
CREATE TABLE teacher_contact_info (
    teacher_id INTEGER PRIMARY KEY,
    address TEXT,
    home_phone TEXT,
    mobile_phone TEXT,
    email TEXT,
    FOREIGN KEY (teacher_id) REFERENCES teachers(id)
);

-- 生徒連絡先テーブル
CREATE TABLE student_contact_info (
    student_id INTEGER PRIMARY KEY,
    address TEXT,
    home_phone TEXT,
    mobile_phone TEXT,
    email TEXT,
    FOREIGN KEY (student_id) REFERENCES students(id)
);

-- 保護者連絡先テーブル
CREATE TABLE parent_contact_info (
    parent_id INTEGER PRIMARY KEY,
    address TEXT,
    home_phone TEXT,
    mobile_phone TEXT,
    email TEXT,
    FOREIGN KEY (parent_id) REFERENCES parents(id)
);

-- レッスンスケジュールテーブル
CREATE TABLE lesson_schedules (
    id INTEGER PRIMARY KEY,
    day_of_week TEXT NOT NULL,
    start_time TEXT NOT NULL,
    CHECK (day_of_week IN ('月', '火', '水', '木', '金', '土', '日')),
    CHECK (start_time LIKE '__:__' AND (start_time LIKE '%:00' OR start_time LIKE '%:30'))
);

-- レッスンテーブル
CREATE TABLE lessons (
    id INTEGER PRIMARY KEY,
    room_id INTEGER NOT NULL,
    course_id INTEGER NOT NULL,
    teacher_id INTEGER NOT NULL,
    student_id INTEGER NOT NULL,
    schedule_id INTEGER NOT NULL,
    FOREIGN KEY (room_id) REFERENCES lesson_rooms(id),
    FOREIGN KEY (course_id) REFERENCES courses(id),
    FOREIGN KEY (teacher_id) REFERENCES teachers(id),
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (schedule_id) REFERENCES lesson_schedules(id)
);

-- インデックス作成
CREATE INDEX idx_lessons_room ON lessons(room_id);
CREATE INDEX idx_lessons_teacher ON lessons(teacher_id);
CREATE INDEX idx_lessons_student ON lessons(student_id);
CREATE INDEX idx_lessons_schedule ON lessons(schedule_id);
CREATE INDEX idx_students_parent ON students(parent_id);
CREATE INDEX idx_location_addresses_location ON location_addresses(location_id);
CREATE INDEX idx_lesson_rooms_location ON lesson_rooms(location_id);
CREATE INDEX idx_courses_instrument ON courses(instrument_id);