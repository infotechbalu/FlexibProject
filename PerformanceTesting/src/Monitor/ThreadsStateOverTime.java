package Monitor;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;

public class ThreadsStateOverTime {
	public static void ThreadsStateOverTime1(){
		String[] command;
		String line=null;
		
		//System.out.println("test");
		String path="D:/Tools/apache-jmeter-3.1/apache-jmeter-3.1/bin/";
		command=new String[]{"CMD","/C","D:/Tools/apache-jmeter-3.1/apache-jmeter-3.1/bin/JMeterPluginsCMD.bat --generate-png \"D:/Kondal Thummeti/Eclipse Workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/PerformanceTesting/img/ThreadsStateOverTime.png\" --input-jtl D:/Tools/apache-jmeter-3.1/apache-jmeter-3.1/sampleProject/RESULT/result.jtl --plugin-type ThreadsStateOverTime --width 600 --height 300"};
		ProcessBuilder buildProcess=new ProcessBuilder(command);
		buildProcess.directory(new File(path+"/"));
		try {
			Process p=buildProcess.start();
			//Thread.sleep(2000);
			BufferedReader inputBuf=new BufferedReader(new InputStreamReader(p.getInputStream()));
			while((line=inputBuf.readLine())!=null){
	/*			out.println(line);
				out.println("\n");
				out.flush();*/
			}
			inputBuf.close();
		} catch (IOException e) {
			e.printStackTrace();
			//return false;
		}
	}
}
