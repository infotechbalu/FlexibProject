package StepDefinition;

import java.io.File;

import org.apache.commons.io.FileUtils;
import org.junit.runner.Description;
import org.junit.runner.notification.RunListener;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

public class CommonListener extends RunListener{
	
	WebDriver driver = null;
	String filepath = System.getProperty("user.dir")+"\\target\\screenshots";

	public void StartedMethod (Description description) 
	{
		System.out.println("Starting the method " + description.getMethodName());
		
	}
	
	public void FinishedMethod (Description description) 
	{
		System.out.println("Finished the method " + description.getMethodName());
		
	}
	
	public void testRunFailed(Description description)
	{
		System.out.println("**Error"+ description.getMethodName()  + "Test case has been failed" );
		String methodname = description.getMethodName().toString().trim();
		takeScreenshot(driver,methodname);
	}

	public void takeScreenshot(WebDriver driver, String methodname) {
		
		driver = new ChromeDriver();
		System.out.println("driver as "+ driver);
		File srcfile = ((TakesScreenshot)driver).getScreenshotAs(OutputType.FILE);
		try
		{
			FileUtils.copyFile(srcfile, new File(methodname + ".png"));
			
			
		}catch (Exception e){
			e.printStackTrace();
		}
		
		
		
		
	}
	
	
	
	
	

}
