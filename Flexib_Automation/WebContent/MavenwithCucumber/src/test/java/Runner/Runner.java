package Runner;		

import org.junit.runner.RunWith;


import cucumber.api.CucumberOptions;
import cucumber.api.junit.Cucumber;
import com.cucumber.listener.Reporter;


import java.io.File;
import org.junit.AfterClass;



@RunWith(Cucumber.class)				
@CucumberOptions(features="Feature",glue={"StepDefinition"},
	plugin = { "pretty", "json:target/cucumber-reports/Cucumber.json","html:target/cucumber-report",
"com.cucumber.listener.ExtentCucumberFormatter:target/cucumber-reports/report.html",
"junit:target/cukes/junit.xml"}
,monochrome = true)


public class Runner				
{		
	 @AfterClass
	    public static void writeExtentReport() {
	        Reporter.loadXMLConfig(new File("config/report.xml"));
	        
	    
	    }
	 
	
	 
}






