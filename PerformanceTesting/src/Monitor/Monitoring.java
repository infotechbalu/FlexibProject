package Monitor;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;

public class Monitoring {
	public static void ResponseTimesOverTime(){
		String[] command;
		String line=null;
		//System.out.println("Test");
		String path="D:/Tools/apache-jmeter-3.1/apache-jmeter-3.1/bin/";
		command=new String[]{"CMD","/C","D:/Tools/apache-jmeter-3.1/apache-jmeter-3.1/bin/JMeterPluginsCMD.bat --generate-png \"D:/Kondal Thummeti/Eclipse Workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/PerformanceTesting/img/ResponseTimesOverTime.png\" --input-jtl D:/Tools/apache-jmeter-3.1/apache-jmeter-3.1/sampleProject/RESULT/result.jtl --plugin-type ResponseTimesOverTime --width 600 --height 300"};
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
	public static void BytesThroughputOverTime(){
		String[] command;
		String line=null;
		
		//System.out.println("test");
		String path="D:/Tools/apache-jmeter-3.1/apache-jmeter-3.1/bin/";
		command=new String[]{"CMD","/C","D:/Tools/apache-jmeter-3.1/apache-jmeter-3.1/bin/JMeterPluginsCMD.bat --generate-png \"D:/Kondal Thummeti/Eclipse Workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/PerformanceTesting/img/BytesThroughputOverTime.png\" --input-jtl D:/Tools/apache-jmeter-3.1/apache-jmeter-3.1/sampleProject/RESULT/result.jtl --plugin-type BytesThroughputOverTime --width 600 --height 300"};
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
	public static void HitsPerSecond(){
		String[] command;
		String line=null;
		
		//System.out.println("test");
		String path="D:/Tools/apache-jmeter-3.1/apache-jmeter-3.1/bin/";
		command=new String[]{"CMD","/C","D:/Tools/apache-jmeter-3.1/apache-jmeter-3.1/bin/JMeterPluginsCMD.bat --generate-png \"D:/Kondal Thummeti/Eclipse Workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/PerformanceTesting/img/HitsPerSecond.png\" --input-jtl D:/Tools/apache-jmeter-3.1/apache-jmeter-3.1/sampleProject/RESULT/result.jtl --plugin-type HitsPerSecond --width 600 --height 300"};
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
	
	public static void LatenciesOverTime(){
		String[] command;
		String line=null;
		
		//System.out.println("test");
		String path="D:/Tools/apache-jmeter-3.1/apache-jmeter-3.1/bin/";
		command=new String[]{"CMD","/C","D:/Tools/apache-jmeter-3.1/apache-jmeter-3.1/bin/JMeterPluginsCMD.bat --generate-png \"D:/Kondal Thummeti/Eclipse Workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/PerformanceTesting/img/LatenciesOverTime.png\" --input-jtl D:/Tools/apache-jmeter-3.1/apache-jmeter-3.1/sampleProject/RESULT/result.jtl --plugin-type LatenciesOverTime --width 600 --height 300"};
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
	public static void ResponseCodesPerSecond(){
		String[] command;
		String line=null;
		
		//System.out.println("test");
		String path="D:/Tools/apache-jmeter-3.1/apache-jmeter-3.1/bin/";
		command=new String[]{"CMD","/C","D:/Tools/apache-jmeter-3.1/apache-jmeter-3.1/bin/JMeterPluginsCMD.bat --generate-png \"D:/Kondal Thummeti/Eclipse Workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/PerformanceTesting/img/ResponseCodesPerSecond.png\" --input-jtl D:/Tools/apache-jmeter-3.1/apache-jmeter-3.1/sampleProject/RESULT/result.jtl --plugin-type ResponseCodesPerSecond --width 600 --height 300"};
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
	public static void ResponseTimesDistribution(){
		String[] command;
		String line=null;
		
		//System.out.println("test");
		String path="D:/Tools/apache-jmeter-3.1/apache-jmeter-3.1/bin/";
		command=new String[]{"CMD","/C","D:/Tools/apache-jmeter-3.1/apache-jmeter-3.1/bin/JMeterPluginsCMD.bat --generate-png \"D:/Kondal Thummeti/Eclipse Workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/PerformanceTesting/img/ResponseTimesDistribution.png\" --input-jtl D:/Tools/apache-jmeter-3.1/apache-jmeter-3.1/sampleProject/RESULT/result.jtl --plugin-type ResponseTimesDistribution --width 600 --height 300"};
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
	public static void ResponseTimesPercentiles(){
		String[] command;
		String line=null;
		
		//System.out.println("test");
		String path="D:/Tools/apache-jmeter-3.1/apache-jmeter-3.1/bin/";
		command=new String[]{"CMD","/C","D:/Tools/apache-jmeter-3.1/apache-jmeter-3.1/bin/JMeterPluginsCMD.bat --generate-png \"D:/Kondal Thummeti/Eclipse Workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/PerformanceTesting/img/ResponseTimesPercentiles.png\" --input-jtl D:/Tools/apache-jmeter-3.1/apache-jmeter-3.1/sampleProject/RESULT/result.jtl --plugin-type ResponseTimesPercentiles --width 600 --height 300"};
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
	public static void ThroughputVsThreads(){
		String[] command;
		String line=null;
		
		//System.out.println("test");
		String path="D:/Tools/apache-jmeter-3.1/apache-jmeter-3.1/bin/";
		command=new String[]{"CMD","/C","D:/Tools/apache-jmeter-3.1/apache-jmeter-3.1/bin/JMeterPluginsCMD.bat --generate-png \"D:/Kondal Thummeti/Eclipse Workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/PerformanceTesting/img/ThroughputVsThreads.png\" --input-jtl D:/Tools/apache-jmeter-3.1/apache-jmeter-3.1/sampleProject/RESULT/result.jtl --plugin-type ThroughputVsThreads --width 600 --height 300"};
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
	public static void TimesVsThreads(){
		String[] command;
		String line=null;
		
		//System.out.println("test");
		String path="D:/Tools/apache-jmeter-3.1/apache-jmeter-3.1/bin/";
		command=new String[]{"CMD","/C","D:/Tools/apache-jmeter-3.1/apache-jmeter-3.1/bin/JMeterPluginsCMD.bat --generate-png \"D:/Kondal Thummeti/Eclipse Workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/PerformanceTesting/img/TimesVsThreads.png\" --input-jtl D:/Tools/apache-jmeter-3.1/apache-jmeter-3.1/sampleProject/RESULT/result.jtl --plugin-type TimesVsThreads --width 600 --height 300"};
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
	public static void TransactionsPerSecond(){
		String[] command;
		String line=null;
		
		//System.out.println("test");
		String path="D:/Tools/apache-jmeter-3.1/apache-jmeter-3.1/bin/";
		command=new String[]{"CMD","/C","D:/Tools/apache-jmeter-3.1/apache-jmeter-3.1/bin/JMeterPluginsCMD.bat --generate-png \"D:/Kondal Thummeti/Eclipse Workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/PerformanceTesting/img/TransactionsPerSecond.png\" --input-jtl D:/Tools/apache-jmeter-3.1/apache-jmeter-3.1/sampleProject/RESULT/result.jtl --plugin-type TransactionsPerSecond --width 600 --height 300"};
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
