SELECT *
FROM lessons le
JOIN lesson_schedules ls ON le.schedule_id = ls.id
JOIN lesson_rooms lr ON le.room_id = lr.id
JOIN locations l ON lr.location_id = l.id 
JOIN courses c ON le.course_id = c.id
JOIN students s ON le.student_id = s.id
LEFT JOIN parents p ON s.parent_id = p.id
JOIN teachers t ON le.teacher_id = t.id  
WHERE l.name = 'みやび音楽教室 新宿校'
  AND lr.room_name = 'ピアノ室A';