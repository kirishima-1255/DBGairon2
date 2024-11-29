-- 生徒を指定して連絡先情報を取得
SELECT
  s.name AS 生徒名,
  s.is_child AS 子どもフラグ,
  sci.address AS 生徒住所,
  sci.home_phone AS 生徒自宅電話,
  sci.mobile_phone AS 生徒携帯,
  sci.email AS 生徒メール,
  p.name AS 保護者名,
  pci.address AS 保護者住所,
  pci.home_phone AS 保護者自宅電話,
  pci.mobile_phone AS 保護者携帯,
  pci.email AS 保護者メール  
FROM students s
LEFT JOIN student_contact_info sci ON s.id = sci.student_id
LEFT JOIN parents p ON s.parent_id = p.id
LEFT JOIN parent_contact_info pci ON p.id = pci.parent_id
WHERE s.id = 1;

-- 保護者を指定して連絡先情報を取得
SELECT 
  p.name AS 保護者名,
  pci.address AS 保護者住所,
  pci.home_phone AS 保護者自宅電話,
  pci.mobile_phone AS 保護者携帯,
  pci.email AS 保護者メール,
  s.name AS 生徒名,  
  s.is_child AS 子どもフラグ,
  sci.address AS 生徒住所,
  sci.home_phone AS 生徒自宅電話,
  sci.mobile_phone AS 生徒携帯,
  sci.email AS 生徒メール
FROM parents p
JOIN parent_contact_info pci ON p.id = pci.parent_id
JOIN students s ON p.id = s.parent_id
LEFT JOIN student_contact_info sci ON s.id = sci.student_id  
WHERE p.id = 2;  

-- 指導者を指定して連絡先情報を取得
SELECT
  t.name AS 指導者名,
  tci.address AS 指導者住所,
  tci.home_phone AS 指導者自宅電話,
  tci.mobile_phone AS 指導者携帯,
  tci.email AS 指導者メール
FROM teachers t 
JOIN teacher_contact_info tci ON t.id = tci.teacher_id
WHERE t.id = 3;