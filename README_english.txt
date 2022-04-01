The program uses:
java-cup-11b.jar
java-cup-11b-runtime.jar
jflex-full-1.8.2.jar

The files above must be inside the same folder as the .java files, so that the makefile can be successful.

Makefile commands:
make compile, for creating the .class files		(jflex scanner.flex
														java -jar java-cup-11b.jar -interface -parser Parser parser.cup
														javac -cp java-cup-11b-runtime.jar *.java)
make execute, for running the program				(java -cp java-cup-11b-runtime.jar:. Main)
make clean, for deleting the .class files			(rm -f *.class *~)

It creates java programs that run correctly, given the appropriate input.

for printing the prefix and suffix, the program prints the Java functions: startsWith, endsWith
For the "if" command, the program prints the "if" statements, in the form ternary: for example,  ((string0).startsWith(string1) ? statement0 : statement1;