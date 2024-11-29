-- 拠点データ
INSERT INTO locations (id, name) VALUES
(1, 'みやび音楽教室 新宿校'),
(2, 'みやび音楽教室 渋谷校'),
(3, 'みやび音楽教室 横浜校');

-- 拠点住所データ
INSERT INTO location_addresses (location_id, address) VALUES
(1, '東京都新宿区'),
(2, '東京都渋谷区'),
(3, '神奈川県横浜市西区');

-- レッスン室データ
INSERT INTO lesson_rooms (id, location_id, room_name) VALUES
(1, 1, 'ピアノ室A'),
(2, 1, 'ピアノ室B'),
(3, 1, 'バイオリン室'),
(4, 2, 'ピアノ室A'),
(5, 2, 'バイオリン室'),
(6, 3, 'ピアノ室A'),
(7, 3, 'ギター室');

-- 楽器データ
INSERT INTO instruments (id, name) VALUES
(1, 'ピアノ'),
(2, 'バイオリン'),
(3, 'ギター');

-- コースデータ
INSERT INTO courses (id, name, instrument_id, age_group) VALUES
(1, '子供ピアノ 入門クラス', 1, '子供'),
(2, '大人ピアノ 入門クラス', 1, '大人'),
(3, '子供バイオリン 入門クラス', 2, '子供'),
(4, '大人バイオリン 入門クラス', 2, '大人'),
(5, 'ギター 入門クラス', 3, '大人');

-- 指導者データ
INSERT INTO teachers (id, name) VALUES
(1, '指導者 壱壱'),  -- ピアノ講師
(2, '指導者 壱弐'),  -- ピアノ講師
(3, '指導者 弐壱'),  -- バイオリン講師
(4, '指導者 参壱');  -- ギター講師

-- 指導者連絡先データ
INSERT INTO teacher_contact_info (teacher_id, address, home_phone, mobile_phone, email) VALUES
(1, '東京都新宿区', '0xx-xxxx-0101', '0xx-xxxx-0102', 'teacher11@example.com'),
(2, '東京都新宿区', '0xx-xxxx-0201', '0xx-xxxx-0202', 'teacher12@example.com'),
(3, '東京都渋谷区', '0xx-xxxx-0301', '0xx-xxxx-0302', 'teacher21@example.com'),
(4, '神奈川県横浜市西区', '0xx-xxxx-0401', '0xx-xxxx-0402', 'teacher31@example.com');

-- 保護者データ
INSERT INTO parents (id, name) VALUES
(1, '保護者 壱壱'),
(2, '保護者 壱弐'),
(3, '保護者 弐壱');

-- 保護者連絡先データ
INSERT INTO parent_contact_info (parent_id, address, home_phone, mobile_phone, email) VALUES
(1, '東京都新宿区', '0xx-xxxx-1101', '0xx-xxxx-1102', 'parent11@example.com'),
(2, '東京都渋谷区', '0xx-xxxx-1201', '0xx-xxxx-1202', 'parent12@example.com'),
(3, '神奈川県横浜市西区', '0xx-xxxx-1301', '0xx-xxxx-1302', 'parent21@example.com');

-- 生徒データ
INSERT INTO students (id, name, parent_id, is_child) VALUES
(1, '生徒 壱壱', 1, 1),  -- 子供（ピアノ）
(2, '生徒 壱弐', 1, 1),  -- 子供（バイオリン）
(3, '生徒 弐壱', 2, 1),  -- 子供（ピアノ）
(4, '生徒 参壱', NULL, 0),  -- 大人（ピアノ）
(5, '生徒 参弐', NULL, 0);  -- 大人（ギター）

-- 生徒連絡先データ
INSERT INTO student_contact_info (student_id, address, home_phone, mobile_phone, email) VALUES
(1, NULL, NULL, '0xx-xxxx-2101', 'student11@example.com'),
(2, NULL, NULL, '0xx-xxxx-2102', 'student12@example.com'),
(3, NULL, NULL, '0xx-xxxx-2201', 'student21@example.com'),
(4, '東京都新宿区', '0xx-xxxx-2301', '0xx-xxxx-2302', 'student31@example.com'),
(5, '神奈川県横浜市西区', '0xx-xxxx-2401', '0xx-xxxx-2402', 'student32@example.com');

-- レッスンスケジュールデータ
INSERT INTO lesson_schedules (id, day_of_week, start_time) VALUES
(1, '月', '14:00'),
(2, '月', '14:30'),
(3, '水', '15:00'),
(4, '水', '15:30'),
(5, '金', '16:00'),
(6, '金', '16:30');

-- レッスンデータ
INSERT INTO lessons (id, room_id, course_id, teacher_id, student_id, schedule_id) VALUES
(1, 1, 1, 1, 1, 1),  -- 新宿校・子供ピアノ
(2, 2, 2, 2, 4, 2),  -- 新宿校・大人ピアノ
(3, 4, 1, 2, 3, 3),  -- 渋谷校・子供ピアノ
(4, 5, 3, 3, 2, 4),  -- 渋谷校・子供バイオリン
(5, 7, 5, 4, 5, 5);  -- 横浜校・ギター