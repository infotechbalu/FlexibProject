package StepDefinition;

import org.openqa.selenium.By;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.testng.Assert;

import com.aventstack.extentreports.ExtentReports;
import com.aventstack.extentreports.ExtentTest;
import com.cucumber.listener.Reporter;

import cucumber.api.Scenario;
import cucumber.api.java.After;
import cucumber.api.java.Before;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;


public class productExistornot  {
	
	private static ExtentReports extent;
    private static ExtentTest test;
    
    productlogin pl = new productlogin();

	WebDriver driver;
	hooks hk = new hooks();
	
    //public Scenario scenario; 
    private Scenario scenario; 
    @Before("@productExistornot") 
    
    public void Initalize(Scenario scenario){ 
            
    	//System.setProperty("webdriver.chrome.driver", "C:\\Users\\74713\\Desktop\\DMCC\\chromedriver.exe");
    	System.setProperty("webdriver.chrome.driver", System.getProperty("user.dir")+"\\Driver\\chromedriver.exe");
    	driver=new ChromeDriver(); 
            driver.manage().window().maximize();
    		driver.get("http://localhost:8070/SpringMVCAnnotationShoppingCart/");
    				//"http://10.1.125.109:8080/"
    		
    		
            this.scenario =scenario; 
            System.out.println("Executing Scenario" + scenario.getName()); 
            
            
            
    } 
    
    @After("@productExistornot") 
    
    public void killBrowser(){ 
            scenario.write("Finished the Scenario"); 
            if(scenario.isFailed()){ 
            scenario.embed(((TakesScreenshot)driver).getScreenshotAs(OutputType.BYTES),"image/png");                 
            } 

            driver.close(); 
            driver.quit(); 
    } 
	
	
	@Given("^Browser Chrome and launch shoppingCart application$")
	public void Browser_Firefox_and_launch_product_application() {
		
		System.out.println("Launched the Chrome Browser");
		/*System.setProperty("webdriver.gecko.driver", "C:\\Users\\74713\\workspace\\CAF\\cucumberwithmaven\\drivder\\geckodriver.exe");
		driver = new FirefoxDriver();*/
		/*System.setProperty("webdriver.chrome.driver", "C:\\Users\\74713\\Desktop\\DMCC\\chromedriver.exe");
		driver = new ChromeDriver();
		*/
		
		driver.findElement(By.xpath("/html/body/div[1]/div[2]/a")).click();
		
	}
	
	
	@When("^Give \"([^\"]*)\" and \"([^\"]*)\"$")
	public void Give_the_Loginid_and_pwd(String Loginid,String pwd) throws Exception {
		
		
		Thread.sleep(3000);
		driver.findElement(By.xpath("//input[@name='userName']")).sendKeys(Loginid);
		driver.findElement(By.xpath("//input[@name='password']")).sendKeys(pwd);
		
		driver.findElement(By.xpath("//input[@value='Login']")).click();
		
		
	}
	
	//@SuppressWarnings("static-access")
	@Then("^validate required product exist or not$")
	public void validate_required_product_exist_or_not() throws Exception{
		driver.findElement(By.xpath("html/body/div[2]/a[2]")).click();
		//click on MyCart 
		//driver.findElement(By.xpath("html/body/div[2]/a[3]")).click();
		
		Thread.sleep(3000);
		//click on Show product list
		//driver.findElement(By.xpath("html/body/a")).click();
		//Thread.sleep(3000);
		
		String NewProduct1 = driver.findElement(By.xpath("html/body/div[5]/ul/li[3]")).getText();
		System.out.println(NewProduct1);

		hk.takeScreenshotimage(driver, "product_exist_or_not");
		
		Reporter.addScreenCaptureFromPath(System.getProperty("user.dir")+"\\target\\screenshots\\product_exist_or_not.png");
		//Assert.assertEquals(pl.NewProduct, NewProduct1);
		
		Assert.assertEquals("Name: Nokia1130", NewProduct1);
		Assert.fail();
		
		driver.findElement(By.linkText("Logout")).click();
		driver.close();
	//	driver.quit();
		
	}
	

	
	
	

}
