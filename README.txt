Χρησιμοποιεί:
java-cup-11b.jar
java-cup-11b-runtime.jar
jflex-full-1.8.2.jar

Τα παραπάνω αρχεία πρέπει να βρίσκονται στον ίδιο φάκελο με τα αρχεία .java ώστα να λειτουργήσει σωστά το makefile.

Εντολές Makefile:
make compile για παραγωγή των .class αρχείων		(jflex scanner.flex
														java -jar java-cup-11b.jar -interface -parser Parser parser.cup
														javac -cp java-cup-11b-runtime.jar *.java)
make execute για να τρέξει το πρόγραμμα				(java -cp java-cup-11b-runtime.jar:. Main)
make clean για να σβήσει τα .class αρχεία			(rm -f *.class *~)


Τρέχει σωστά και για τα 3 παραδείγματα της εκφώνησης, και παράγει προγράμματα java που τρέχουν δίνοντας το επιθυμητό αποτέλεσμα.

Για την εκτύπωση του prefix και suffix, το προγράμμα εκτυπώνει τις συναρτήσεις της Java: startsWith, endsWith
Για το if, το πρόγραμμα εκτυπώνει τα if statements, σε μορφή ternary:πχ. ((string0).startsWith(string1) ? statement0 : statement1;