package StepDefinition;



import java.util.Random;

import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.firefox.FirefoxDriver;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;


public class productlogin {

	WebDriver driver;
	static String NewProduct ;
	
	@Given("^Open the Chrome and launch product application$")
	public void open_the_Firefox_and_launch_product_application() throws Throwable {
		
		System.out.println("Launch Chrome Browser");
		/*System.setProperty("webdriver.gecko.driver", "C:\\Users\\74713\\workspace\\CAF\\cucumberwithmaven\\drivder\\geckodriver.exe");
		driver = new FirefoxDriver();*/
		
		System.setProperty("webdriver.chrome.driver", System.getProperty("user.dir")+"\\Driver\\chromedriver.exe");
		driver = new ChromeDriver();
		
		driver.manage().window().maximize();
		driver.get("http://localhost:8070/SpringMVCAnnotationShoppingCart/");
				//"http://10.1.125.109:8080/"
		
			
		driver.findElement(By.xpath("html/body/div[1]/div[2]/a")).click();
	}
	
	@When("^Enter the \"([^\"]*)\" and \"([^\"]*)\"$")
	public void enter_the_Username_and_Password(String username,String password) throws Exception {
		
		
		Thread.sleep(3000);
		driver.findElement(By.xpath("//input[@name='userName']")).sendKeys(username);
		driver.findElement(By.xpath("//input[@name='password']")).sendKeys(password);
		driver.findElement(By.xpath("//input[@value='Login']")).click();
		
	}
	
	@Then("^Adding a new product$")
	public void Adding_a_new_product() throws Exception{
		
		Thread.sleep(3000);
		
				
		driver.findElement(By.linkText("Create Product")).click();
		Thread.sleep(3000);
		
		Random rand= new Random();
        int pickedNumber= rand.nextInt(40) + 1;      
        System.out.println("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&  "+pickedNumber);
        driver.findElement(By.xpath(".//*[@id='code']")).sendKeys("Test"+pickedNumber);
        
        String code = pickedNumber+"";
		driver.findElement(By.name("code")).sendKeys(code);
		
		driver.findElement(By.id("name")).sendKeys("Product"+pickedNumber);
		driver.findElement(By.id("price")).sendKeys("129");
		driver.findElement(By.id("fileData")).sendKeys("D:\\images\\Testingimage.jpg");
		driver.findElement(By.xpath("//input[@value='Submit']")).click();
		
		Thread.sleep(6000);
		NewProduct = driver.findElement(By.xpath("html/body/div[4]/ul/li[3]")).getText();
		System.out.println(NewProduct);
		//Assert.assertEquals("Name: Nokia1167", NewProduct);
		
		//click on Logout from Product Application
		driver.findElement(By.linkText("Logout")).click();
		
		driver.close();
		driver.quit();
		
	}
	

	
	
	
	
	
	
	
	
}
