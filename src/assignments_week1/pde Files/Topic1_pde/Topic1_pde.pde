import java.util.Scanner;

/**
 * Assignments of Topic 1 (week 1) - Algorithms for Creative Technology
 * University of Twente - Creative Technology
 * 2020-2021
 *
 * @author Antoine Moghaddar
 */

public void setup() {
}

//Assignment 1.1.1
//Assignment 1.2
public void LetterByLetter(char[] arr) {
  char[] word;

  if (arr == null) {
    print("Type in a word below: ");
    Scanner in = new Scanner(System.in);
    word = in.nextLine().toCharArray();
  } else
    word = arr;

  for (Character c : word) {
    println(c);
  }
}

//Assignment 1.1.2
//Assignment 1.2
public void LetterByLetterReversed(char[] arr) {
  char[] word;

  if (arr == null) {
    print("Type in a word below: ");
    Scanner in = new Scanner(System.in);
    word = in.nextLine().toCharArray();
  } else
    word = arr;

  for (int i = 0, wordLength = word.length; i < wordLength; i++) {
    Character c = word[(wordLength - 1) - i];
    println(c);
  }
}

//Assignment 1.1.3
//Assignment 1.2
public void occurencesLetter(char[] arr) {
  int count = 0;
  char[] word;
  Scanner in = new Scanner(System.in);

  if (arr == null) {
    print("Type in a word below: ");
    word = in.nextLine().toCharArray();
  } else
    word = arr;

  print("What letter do you want to count the occurences of? (One symbol only):");
  char ch = in.nextLine().charAt(0);

  for (Character c : word) {
    if (c.equals(ch)) {
      count++;
    }
  }

  println("The amount of occurences of the letter " + ch + " is equal to " + count);
}

//Assignment 1.1.4
//Assignment 1.2
public void checkPalindrome(char[] arr) {
  StringBuilder str = new StringBuilder();
  char[] word;

  if (arr == null) {
    print("Type in a word below: ");
    Scanner in = new Scanner(System.in);
    word = in.nextLine().toCharArray();
  } else
    word = arr;

  for (int i = 0, wordLength = word.length; i < wordLength; i++) {
    Character c = word[(wordLength - 1) - i];
    str.append(c);
  }

  println("This word is" + (str.toString().equals(new String(word)) ? " a " : " not a ") + "palindrome");
}

//Assignment 1.3
public int[] setupRandomIntArray() {
  int[] ints = new int[500];

  for (int i = 0; i < ints.length; i++) {
    ints[i] = (int) (Math.random() * 100);
  }

  return ints;
}

//Assignment 1.3
public void randomIntegers() {
  int[] ints = setupRandomIntArray();
  int count = 0;

  for (int i : ints) {
    if (i > 50) count++;
  }

  println("The amount of numbers in this list above the value 50 is equal to " + count);
}

//Assignment 1.4
public boolean isMultipleOfFive(int number) {
  return (number % 5 == 0);
}

//Assignment 1.5
public boolean isMultipleOfThree(int number) {
  return (number % 3 == 0);
}

//Assignment 1.4
public void sumMultiplesOfFive() {
  println("What is the top-value you want to calculate the multiples below (e.g 1000)? ");
  Scanner in = new Scanner(System.in);
  int max = in.nextInt(), count = 0;

  for (int i = 0; i < max; i++) {
    if (isMultipleOfFive(i)) {
      count = count + i;
      //                println("[DEBUG] adding " + i + " | New count: " + count); //TODO uncomment when wanting to see summation
    }
  }

  println("The total sum at the end of the trip for a maximum of " + max + " is " + count);
}

//Assignment 1.5
@SuppressWarnings("DuplicatedCode")
  public void sumMultiplesOfThreeAndFive() {
  println("What is the top-value you want to calculate the multiples below (e.g 1000)? ");
  Scanner in = new Scanner(System.in);
  int max = in.nextInt(), count = 0;

  for (int i = 0; i < max; i++) {
    if ((isMultipleOfFive(i) && !isMultipleOfThree(i))
      || (isMultipleOfThree(i) && !isMultipleOfFive(i))) {
      count = count + i;
      //                println("[DEBUG] adding " + i + " | New count: " + count); //TODO uncomment when wanting to see summation
    }
  }

  println("The total sum at the end of the trip for a maximum of " + max + " is " + count);
}

//Assignment 1.6
public void binaryTransform() {
  long total = 0;

  Scanner in = new Scanner(System.in);
  String bin = in.nextLine();

  for (int i = 0; i < bin.length(); i++) {
    total = (long) (total + (bin.charAt(i) - '0') * Math.pow(2, bin.length() - i - 1));
  }

  println("The total sum at the end of the trip is " + total);
}

//Assignment 1.2
public void draw() {
  char[] chars = null;

  print(assigmentMenu());
  print("\nPlease give your menu choice below: ");
  Scanner in = new Scanner(System.in);

  int opt = in.nextInt();

  if (opt != -1) {

    if (!(opt >= 5)) { // && opt != 6 && opt != 7 && opt != 8
      println("Is there already a word you have in mind? Type below..\n(Type 'no' if you have no word in mind.)");
      Scanner inp = new Scanner(System.in);
      String input = inp.nextLine();

      chars = input.equals("no") ? null : input.toCharArray();
    }

    switch (opt) {
    case 1: 
      LetterByLetter(chars); 
      break;
    case 2 : 
      LetterByLetterReversed(chars);
      break;
    case 3: 
      occurencesLetter(chars);
      break;
    case 4 :
      checkPalindrome(chars);
      break;
    case 5 :
      randomIntegers();
      break;
    case 6 :
      sumMultiplesOfFive();
      break;
    case 7 :
      sumMultiplesOfThreeAndFive();
      break;
    case 8 :
      binaryTransform();
      break;
    default :
      println("[Error] Not a valid option");
      break;
    }

    print(assigmentMenu());
    print("Please give your menu choice below: ");
    opt = in.nextInt();
  } else {
    print("Have a nice day!");
    System.exit(2);
  }
}

public String assigmentMenu() {
  return "\n\n//------------------------------------------------------\n" +
    "\t\tAssignments Antoine Moghaddar Topic 1\n" +
    "//------------------------------------------------------\n" +
    "1)\t(1.1.1) - Print word letter by letter\n" +
    "2)\t(1.1.2) - Print word letter by letter in reverse\n" +
    "3)\t(1.1.3) - Print amount occurenses of letter in word\n" +
    "4)\t(1.1.4) - Check if word is a palindrome\n" +
    "5)\t  (1.3) - Give the count of random integers in list above value 50\n" +
    "6)\t  (1.4) - Sum the mulitples of 5\n" +
    "7)\t  (1.5) - Sum the mulitples of 3 and 5\n" +
    "8)\t  (1.6) - Binary Calculator\n" +
    "-)\t (1.10) - Red Dot [Check other pde files]\n" +
    "-)\t(1.11) - Bouncing Ball[Check other pde files]\n" +
    "\n-1) Exit program\n\n";
}
