package StepDefinition;



import java.util.List;
import java.util.Random;


import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.ui.Select;

import cucumber.api.DataTable;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;


public class salesforceLoginapp {

	WebDriver driver;
	
	
	@Given("^Open the Chrome and launch salesforce application$")
	public void open_the_Firefox_and_launch_salesforce_application() throws Throwable {
		
		System.out.println("Launch Chrome Browser");
		/*System.setProperty("webdriver.gecko.driver", "C:\\Users\\74713\\workspace\\CAF\\cucumberwithmaven\\drivder\\geckodriver.exe");*/
		
		
		System.setProperty("webdriver.chrome.driver", System.getProperty("user.dir")+"\\Driver\\chromedriver.exe");
		driver = new ChromeDriver();
		
		driver.manage().window().maximize();
		driver.get("https://login.salesforce.com/");
		
		
		
	}
	
	@When("^Input the \"([^\"]*)\" and \"([^\"]*)\"$")
	public void enter_the_Username_and_Password(String username,String password) throws Exception {
		
		Thread.sleep(3000);
		driver.findElement(By.xpath(".//*[@id='username']")).sendKeys(username);
		driver.findElement(By.xpath(".//*[@id='password']")).sendKeys(password);
		driver.findElement(By.xpath(".//*[@id='Login']")).click();
		
		Thread.sleep(60000);
		driver.findElement(By.xpath(".//*[@id='save']")).click();
		Thread.sleep(2000);
		
		driver.findElement(By.xpath(".//*[@id='tryLexDialogX']")).click();
		
		
		//click on Accounts tab
		driver.findElement(By.xpath(".//*[@id='Account_Tab']/a")).click();
		//click on new button
		Thread.sleep(60000);
		driver.findElement(By.xpath(".//*[@id='hotlist']/table/tbody/tr/td[2]/input")).click();
		Thread.sleep(60000);
	}
	
	@And("^Enter all the mandatory fields$")
	public void create_a_contact(DataTable table) throws Exception{
		
		System.out.println("Table values are" + table);
		
		List<List<String>> data = table.raw();
		
	
		Thread.sleep(5000);
		
		driver.findElement(By.xpath(".//*[@id='acc2']")).sendKeys(data.get(1).get(2));
		
				
		Select dropdown = new Select(driver.findElement(By.xpath(".//*[@id='acc6']")));
		dropdown.selectByVisibleText("Customer");
		
		
		driver.findElement(By.xpath(".//*[@id='acc12']")).sendKeys(data.get(2).get(2));
		driver.findElement(By.xpath(".//*[@id='acc20']")).sendKeys(data.get(3).get(2));
		
		driver.findElement(By.xpath(".//*[@id='acc17street']")).sendKeys(data.get(4).get(2));
		
		driver.findElement(By.xpath(".//*[@id='acc17city']")).sendKeys(data.get(5).get(2));
		
		driver.findElement(By.xpath(".//*[@id='acc17state']")).sendKeys(data.get(6).get(2));
		
		driver.findElement(By.xpath(".//*[@id='acc17zip']")).sendKeys(data.get(7).get(2));
		
		driver.findElement(By.xpath(".//*[@id='acc17country']")).sendKeys(data.get(8).get(2));
		
		driver.findElement(By.xpath(".//*[@id='head_2_ep']/span/span/a")).click();
		
		//click on save button
		driver.findElement(By.xpath(".//*[@id='bottomButtonRow']/input[1]")).click();
		

	
	
		
	}
	
/*	@Then("^close the browser$")
	public void close_the_browser() throws Throwable {
		
		
		driver.close();
		driver.quit();
			
		
	}*/
	
	
	
}
	

	
	
	
	
	
	
	
	

