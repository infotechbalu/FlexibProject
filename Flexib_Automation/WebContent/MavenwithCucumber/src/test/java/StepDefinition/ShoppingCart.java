package StepDefinition;


import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.firefox.FirefoxDriver;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;



public class ShoppingCart  {

	WebDriver driver;
	productlogin pl = new productlogin();
	@Given("^Chrome and launch shoppingCart application$")
	public void Firefox_and_launch_shoppingcart_application() {
		
		System.out.println("Launch Chrome Browser");
		/*System.setProperty("webdriver.gecko.driver", "C:\\Users\\74713\\workspace\\CAF\\cucumberwithmaven\\drivder\\geckodriver.exe");
		driver = new FirefoxDriver();*/
		
		//System.setProperty("webdriver.chrome.driver", "C:\\Users\\74713\\Desktop\\DMCC\\chromedriver.exe");
		System.setProperty("webdriver.chrome.driver", System.getProperty("user.dir")+"\\Driver\\chromedriver.exe");
		driver = new ChromeDriver();
		
		driver.manage().window().maximize();
		driver.get("http://localhost:8070/SpringMVCAnnotationShoppingCart/");
				//"http://10.1.125.109:8080/"
		
		driver.findElement(By.xpath("html/body/div[1]/div[2]/a")).click();
	}
	
	@When("^Provide the \"([^\"]*)\" and \"([^\"]*)\"$")
	public void Provide_the_AgentName_and_PWord(String AgentName,String PWord) throws Exception {
		
	
		Thread.sleep(5000);
		driver.findElement(By.xpath("//input[@name='userName']")).sendKeys(AgentName);
		driver.findElement(By.xpath("//input[@name='password']")).sendKeys(PWord);
		
	}
	
	@Then("^Close the ShoppingCart application$")
	public void close_the_shoppingCart_credential() throws Exception{
		driver.findElement(By.xpath("//input[@value='Login']")).click();
		//click on MyCart 
		driver.findElement(By.xpath("html/body/div[2]/a[3]")).click();
		
		Thread.sleep(3000);
		//click on Show product list
		driver.findElement(By.xpath("html/body/a")).click();
		Thread.sleep(3000);
		
		String NewProduct1 = driver.findElement(By.xpath("html/body/div[4]/ul/li[3]")).getText();
		System.out.println(NewProduct1);
		Assert.assertEquals(pl.NewProduct, NewProduct1);
		System.out.println("Validation happening here with Expected  : "+pl.NewProduct+"   Actual  :  "+NewProduct1);
		driver.findElement(By.linkText("Logout")).click();
					
		driver.close();
		//driver.quit();
	}
	

	
}



