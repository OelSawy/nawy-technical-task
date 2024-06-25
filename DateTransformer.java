import java.util.ArrayList;
import java.util.Scanner;

public class DateTransformer {

    public static ArrayList<String> transformDateFormat(String[] dates) {
        ArrayList<String> transformedDates = new ArrayList<>();
        for (int i = 0; i < dates.length; i++) {
            String temp = dates[i];
            String[] parts = null;
            if (temp.contains("/")) {
                parts = temp.split("/");
            } else if (temp.contains("-")) {
                parts = temp.split("-");
            } else {
                continue;
            }
            if (temp.matches("\\d{4}/\\d{2}/\\d{2}")) {
                transformedDates.add(parts[0] + parts[1] + parts[2]);
            } else if (temp.matches("\\d{2}/\\d{2}/\\d{4}")) {
                transformedDates.add(parts[2] + parts[1] + parts[0]);
            } else if (temp.matches("\\d{2}-\\d{2}-\\d{4}")) {
                transformedDates.add(parts[2] + parts[0] + parts[1]);
            }
        }
        return transformedDates;
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter number of dates : ");
        int numOfDates = sc.nextInt();
        String[] dates = new String[numOfDates];
        for (int i = 0; i < dates.length; i++) {
            System.out.print("Insert date number " + (i + 1) + " : ");
            dates[i] = sc.next();
            System.out.println();
        }
        ArrayList<String> outputDates = transformDateFormat(dates);
        System.out.println(outputDates);
        sc.close();
    }
}
