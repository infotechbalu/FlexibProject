package StepDefinition;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.Map;

import org.apache.commons.io.FileUtils;

import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;
import org.openqa.selenium.WebDriver;

import com.aventstack.extentreports.ExtentReports;
import com.aventstack.extentreports.ExtentTest;

import com.aventstack.extentreports.reporter.ExtentHtmlReporter;

import cucumber.api.Scenario;


public class screenCapture {

	
	static String methodName = "";
	public static ExtentHtmlReporter htmlReporter;
	public static ExtentReports extent;
	public static ExtentTest test;
	protected Map<String, Object[]> testresultdata;
	
	
	
	public static String capture(WebDriver driver,String screenShotName) throws IOException
	{
		TakesScreenshot ts = (TakesScreenshot)driver;
		File source = ts.getScreenshotAs(OutputType.FILE);
		String dest = "D:\\screenshot.png";
		File destination = new File(dest);
		FileUtils.copyFile(source, destination);        
		return dest;
	}

	

		public  File screenShoot(String screenshot,String scenarioname) throws Exception {
			
			TakesScreenshot driver = null;
			TakesScreenshot ts = (TakesScreenshot)driver;
			File source = ts.getScreenshotAs(OutputType.FILE);

				File file = new File(scenarioname);
				if(!file.exists())
				try
				{
				file.mkdirs();
				}
				catch (Exception e)
				{
					System.out.println("Failed to create scenarioName directory");
				}

				String dest = file+"\\"+screenshot+".png";
				File destination = new File(dest);
				FileUtils.copyFile(source, destination);
				return destination;
			
			

			
			}
		
		
			
}
		


