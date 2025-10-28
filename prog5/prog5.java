import java.util.Scanner;
public class prog5{
  public static void main(String[]args){
    Scanner scanner=new Scanner(System.in);
    String sender;
    char[] receiver;
    int winsize;
    System.out.print("\n ENTER THE WINDOW SIZE :  ");
    winsize=scanner.nextInt();
    scanner.nextLine();
    System.out.println("\n sender window is expanded to store message\n");
    System.out.print("\n ENTER THE DATA TO BE SENT :  ");
    sender=scanner.nextLine();
    receiver=new char[winsize];
    for(int i=0;i<winsize;i++){
    receiver[i]=sender.charAt(i);
    }
    System.out.println("\n MESSAGE SEND BY THE SENDER :  \n" +sender);
    System.out.println("\n window size of receiver is expanded\n");
    System.out.println("\n acknowlegement from receiver\n");
    for(int i=0;i<winsize;i++){
    }
    System.out.println("\n ACK :  " +winsize);
    System.out.println("\n MESSAGE RECEIVED BY THE RECEIVER IS :"+ new String(receiver));
    System.out.println("\n window size of receiver is shrinked\n");
    scanner.close();
    }
    }
