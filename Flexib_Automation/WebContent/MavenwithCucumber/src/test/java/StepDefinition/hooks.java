package StepDefinition;
 
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;

import org.apache.commons.io.FileUtils;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.remote.Augmenter;


 
public class hooks {
	
	static WebDriver driver;
		
	public static void takeScreenshotimage(WebDriver driver,String FileNameWithExtension) throws IOException, InterruptedException{
				
	{
		
		WebDriver driver1 = new Augmenter().augment(driver);
		File acutalFile = ((TakesScreenshot)driver1).getScreenshotAs(OutputType.FILE);
		try{
			BufferedImage fullImg = ImageIO.read(acutalFile);
			FileUtils.copyFile(acutalFile, new File(System.getProperty("user.dir")+"\\target\\screenshots\\"+FileNameWithExtension+".png"));
		}catch (IOException e){
			e.printStackTrace();
		}
	}
		
		
	}
	}

	
	
	

	
	
	
 
