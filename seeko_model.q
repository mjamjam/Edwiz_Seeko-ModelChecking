//This file was generated from (Commercial) UPPAAL 4.0.15 rev. CB6BB307F6F681CB, November 2019

/*
Once payment is verified course user will be granted access to quiz
*/
(E<>(payment.transaction_successful) imply payment.access_is_granted)

/*
The transaction process should not start unless the card is verified.
*/
E<> (not(server.verify_card) and payment.transaction_in_process)

/*
The course should not start unless the transction is processed.
*/
E<> (not(payment.transaction_successful)and course.course_started)

/*
Eventually deadlock occurs
*/
E<> deadlock

/*
Quiz must not start before the course ends.
*/
E<> (quiz.start_quiz and not(course.course_ended))

/*
Quiz must end
*/
E<> quiz.end

/*
Question cannot exceed beyond 5.
Questions cannot be less than 0
*/
E<>((quiz.counter<=0 && quiz.counter >5) imply quiz.end)

/*
Deadlock never occurs
*/
A[] not deadlock
