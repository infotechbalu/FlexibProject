package Flexib;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;

public class SecurityDemo {
	public static void startDemo(){
		String directory=System.getProperty("user.dir");
		String[] command;
		String line=null;
		command=new String[]{"CMD","/C","D:/Flexib/Security Testing/Framework/start.bat"};
		ProcessBuilder buildProcess=new ProcessBuilder(command);
		buildProcess.directory(new File("D:/Flexib/Security Testing/Framework"));
		try {
			Process p=buildProcess.start();
			Thread.sleep(3000);
			BufferedReader inputBuf=new BufferedReader(new InputStreamReader(p.getInputStream()));
			while((line=inputBuf.readLine())!=null){
				System.out.println(line);
			}
			inputBuf.close();
			
			System.out.println("INFO : Successfully Security Framework has Completed.");
			//return true;
		} catch (IOException | InterruptedException e) {
			System.out.println("WARNING : Security Framework was unable to start.");
			e.printStackTrace();
			//return false;
		}
	}
}
