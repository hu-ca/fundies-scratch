use context dcic2024

include csv
include data-source
include lists

student_score = 
  load-table: name, surname, email, score
    source: csv-table-file("students_gate_exam_score.csv", default-options)
    sanitize score using num-sanitizer
  end

ordered-student_score = order-by(student_score, "score", false)
ordered-student_score

first-student-name = ordered-student_score.row-n(0)["name"]
first-student-name
first-student-surname = ordered-student_score.row-n(0)["surname"]
first-student-surname
first-student-score = ordered-student_score.row-n(0)["score"]
first-student-score

second-student-name = ordered-student_score.row-n(1)["name"]
second-student-name
second-student-surname = ordered-student_score.row-n(1)["surname"]
second-student-surname
second-student-score = ordered-student_score.row-n(1)["score"]
second-student-score

third-student-name = ordered-student_score.row-n(2)["name"]
third-student-name
third-student-surname = ordered-student_score.row-n(2)["surname"]
third-student-surname
third-student-score = ordered-student_score.row-n(2)["score"]
third-student-score

data Student:
  |student(name :: String, surname :: String, score :: Number)
end

s1 = student("Ethan", "Gray", 97)
s2 = student("Oscar", "Young", 92)
s3 = student("Adrian", "Bennett", 80)

scores :: List<Number> = link(s1.score, link(s2.score, link(s3.score, empty)))


fun count-top3-above-90(l):
  cases (List) l:
    | empty => 0
    | link(f,r) =>
      if length(l) > 3:
        count-top3-above-90(take(l, 3))
      else:
        (if f > 90: 1 else: 0 end) + count-top3-above-90(r)
      end
  end
where:
    count-top3-above-90([list: 92, 0, 100]) is 2
end

count-top3-above-90(scores)

all-emails :: List<String> = link(student_score.row-n(0)["email"], link(student_score.row-n(1)["email"], link(student_score.row-n(2)["email"], link(student_score.row-n(3)["email"], link(student_score.row-n(4)["email"], link(student_score.row-n(5)["email"], link(student_score.row-n(6)["email"], link(student_score.row-n(7)["email"], link(student_score.row-n(8)["email"], link(student_score.row-n(9)["email"], link(student_score.row-n(10)["email"], link(student_score.row-n(11)["email"], link(student_score.row-n(12)["email"], link(student_score.row-n(13)["email"], link(student_score.row-n(14)["email"], empty)))))))))))))))

all-emails

fun get-domain(email):
  string-substring(email, string-index-of(email, "@")