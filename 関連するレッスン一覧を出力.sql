-- 生徒に関連するレッスン一覧を取得
SELECT
  ls.day_of_week AS 曜日,
  ls.start_time AS 時間帯,
  l.name AS 拠点名,
  lr.room_name AS レッスン室名,
  c.name AS コース名, 
  s.name AS 生徒名,
  p.name AS 保護者名,
  t.name AS 指導者名 
FROM lessons le
JOIN lesson_schedules ls ON le.schedule_id = ls.id
JOIN locations l ON lr.location_id = l.id
JOIN lesson_rooms lr ON le.room_id = lr.id
JOIN courses c ON le.course_id = c.id
JOIN students s ON le.student_id = s.id 
LEFT JOIN parents p ON s.parent_id = p.id
JOIN teachers t ON le.teacher_id = t.id
WHERE s.id = 1
ORDER BY l.name, ls.day_of_week, ls.start_time;

-- 保護者に関連するレッスン一覧を取得  
SELECT
  ls.day_of_week AS 曜日,
  ls.start_time AS 時間帯,
  l.name AS 拠点名,
  lr.room_name AS レッスン室名,
  c.name AS コース名,
  s.name AS 生徒名,
  p.name AS 保護者名,
  t.name AS 指導者名
FROM lessons le
JOIN lesson_schedules ls ON le.schedule_id = ls.id 
JOIN locations l ON lr.location_id = l.id
JOIN lesson_rooms lr ON le.room_id = lr.id
JOIN courses c ON le.course_id = c.id
JOIN students s ON le.student_id = s.id
JOIN parents p ON s.parent_id = p.id
JOIN teachers t ON le.teacher_id = t.id  
WHERE p.id = 2
ORDER BY l.name, ls.day_of_week, ls.start_time;

-- 指導者に関連するレッスン一覧を取得
SELECT 
  ls.day_of_week AS 曜日,
  ls.start_time AS 時間帯,
  l.name AS 拠点名,
  lr.room_name AS レッスン室名, 
  c.name AS コース名,
  s.name AS 生徒名,
  p.name AS 保護者名,
  t.name AS 指導者名
FROM lessons le
JOIN lesson_schedules ls ON le.schedule_id = ls.id
JOIN locations l ON lr.location_id = l.id
JOIN lesson_rooms lr ON le.room_id = lr.id 
JOIN courses c ON le.course_id = c.id
JOIN students s ON le.student_id = s.id
LEFT JOIN parents p ON s.parent_id = p.id
JOIN teachers t ON le.teacher_id = t.id
WHERE t.id = 3 
ORDER BY l.name, ls.day_of_week, ls.start_time;