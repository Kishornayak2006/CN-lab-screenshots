import java.util.Scanner;

public class CRC1 {
    public static void main(String args[]) {
        Scanner sc = new Scanner(System.in);


        System.out.print("Enter message bits: ");
        String message = sc.nextLine(); // Use nextLine() to read the entire line
        System.out.print("Enter generator: ");
        String generator = sc.nextLine();

        int[] data = new int[message.length() + generator.length() - 1];
        int[] divisor = new int[generator.length()];


        for (int i = 0; i < message.length(); i++) {
            data[i] = Integer.parseInt(String.valueOf(message.charAt(i)));
        }

        for (int i = 0; i < generator.length(); i++) {
            divisor[i] = Integer.parseInt(String.valueOf(generator.charAt(i)));
        }


        for (int i = 0; i < message.length(); i++) {
            if (data[i] == 1) {
                for (int j = 0; j < divisor.length; j++) {
                    data[i + j] ^= divisor[j];
                }
            }
        }

        System.out.print("The checksum code: ");
        
        for (int i = 0; i < message.length(); i++) {
            System.out.print(Integer.parseInt(String.valueOf(message.charAt(i))));
        }

        for (int i = message.length(); i < data.length; i++) {
            System.out.print(data[i]);
        }
        System.out.println();


        System.out.print("Enter received checksum code (message + CRC): ");
        message = sc.nextLine();
        System.out.print("Enter generator: ");
        generator = sc.nextLine();

        data = new int[message.length() + generator.length() - 1]; 
        divisor = new int[generator.length()];


        for (int i = 0; i < message.length(); i++) {
            data[i] = Integer.parseInt(String.valueOf(message.charAt(i)));
        }

        for (int i = 0; i < generator.length(); i++) {
            divisor[i] = Integer.parseInt(String.valueOf(generator.charAt(i)));
        }


        for (int i = 0; i < message.length(); i++) {
            if (data[i] == 1) {
                for (int j = 0; j < divisor.length; j++) {
                    data[i + j] ^= divisor[j];
                }
            }
        }

        boolean valid = true;

        for (int i = message.length(); i < data.length; i++) { // Check only the remainder part
            if (data[i] == 1) {
                valid = false;
                break;
            }
        }

        if (valid) {
            System.out.println("Data stream is valid. No CRC error detected.");
        } else {
            System.out.println("Data stream is invalid. CRC error occurred.");
        }

        sc.close();
    }
}
