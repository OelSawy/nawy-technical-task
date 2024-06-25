import java.util.Scanner;
import java.util.Stack;

public class StringValidator {

    public static boolean isValid(String s) {
        Stack<Character> tempStack = new Stack<Character>();

        for (int i = 0; i < s.length(); i++) {
            if (s.charAt(i) == '(' || s.charAt(i) == '{' || s.charAt(i) == '[') {
                tempStack.push(s.charAt(i));
                continue;
            } else {
                if (tempStack.isEmpty()) {
                    return false;
                }
                char tempChar = tempStack.pop();
                if (s.charAt(i) == ')' && tempChar != '(' || s.charAt(i) == '}' && tempChar != '{'
                        || s.charAt(i) == ']' && tempChar != '[') {
                    return false;
                }
            }
        }

        return tempStack.isEmpty();
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter a string: ");
        String s = sc.nextLine();
        System.out.println(isValid(s) ? "Your string is valid" : "Your string isn't valid");
        sc.close();
    }
}