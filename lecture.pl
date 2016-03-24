lectures(norman, 9020).
lectures(john, 9311).
lectures(anne, 9315).
lectures(bill, 9414).
lectures(john, 9331).

studies(fred, 9020).
studies(jack, 9311).
studies(jill, 9315).
studies(jill, 9414).
studies(henry, 9414).
studies(henry, 9331).

stage(fred, 1).
stage(jack, 2).
stage(jill, 2).
stage(henry, 3).

teaches(Teacher, Student) :-
    lectures(Teacher, Subject), studies(Student, Subject).
