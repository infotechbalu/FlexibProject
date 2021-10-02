package StepDefinition;



import java.io.IOException;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;


import org.testng.annotations.Listeners;
import org.testng.annotations.Test;


@Listeners(TestListener.class)
public class Takescreenshot extends TestListener {

	@Test
	public void screenshot() throws IOException
	{
		System.setProperty("webdriver.chrome.driver", "C:\\Users\\74713\\Desktop\\DMCC\\chromedriver.exe");
		WebDriver driver = new ChromeDriver();
		driver.get("https:\\www.google.com");
		driver.findElement(By.xpath(".//*[@id='tsf']/div[2]/div[3]/center/input[5]")).click();
		
		
		
	}
	
	





}
