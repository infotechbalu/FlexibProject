package com.onlinestore.tests;

import org.testng.annotations.AfterClass;
import org.testng.annotations.Test;
import org.testng.annotations.BeforeClass;
import com.onlinestore.reportutils.ReportUtil;
import com.onlinestore.tests.Keywords;
import com.onlinestore.utils.Resources;
import com.onlinestore.utils.TestUtils;
import com.relevantcodes.extentreports.ExtentReports;
import com.relevantcodes.extentreports.ExtentTest;
import com.relevantcodes.extentreports.LogStatus;
import com.onlinestore.data.*;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.concurrent.TimeUnit;

import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.support.events.EventFiringWebDriver;
import org.testng.Assert;
import org.testng.annotations.AfterClass;
import org.testng.annotations.AfterMethod;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.Test;

public class TestController extends Resources {
	public static String Result_File = System.getProperty("user.dir")+"\\src\\com\\onlinestore\\data\\TestSuite1.xlsx";
	public static String sheetName = "TestCases";
	public static FileInputStream fis;
	public static FileOutputStream fileOut;
	public static XSSFWorkbook workbook;
	public static XSSFSheet sheet;
	public static XSSFRow rowWrite;
	public XSSFCell cell;
	private static ExtentReports reports;
	private static ExtentTest logger;

	@BeforeClass
	public void initBrowser() throws IOException {
		File directory = new File(System.getProperty("user.dir")+"\\src\\com\\onlinestore\\Reports");
		File[] files = directory.listFiles();
		for (File file : files)
		{
		   if (!file.delete())
		   {
		      System.out.println("");
		   }
		} 
		
		Initialize();
		reports = new ExtentReports(
				System.getProperty("user.dir")+"\\src\\com\\onlinestore\\Reports\\Onlinestore.html", false);
		reports.loadConfig(new File("./extent-config.xml"));
		reports.addSystemInfo("Selenium", "3.0.1").addSystemInfo("Environment", "Test");
		System.setProperty("webdriver.chrome.driver", System.getProperty("user.dir")+"\\src\\com\\onlinestore\\config\\chromedriver.exe");
		dr = new ChromeDriver();
		driver = new EventFiringWebDriver(dr);
		driver.manage().timeouts().implicitlyWait(20, TimeUnit.SECONDS);
		driver.manage().window().maximize();
		
	}
	

	@Test
	public void TestCaseController() throws NoSuchMethodException, SecurityException, IllegalAccessException,
			IllegalArgumentException, InvocationTargetException, IOException {

		String startTime = TestUtils.now("dd.MMMM.yyyy hh.mm.ss aaa");
		ReportUtil.startTesting(System.getProperty("user.dir")+"\\src\\com\\onlinestore\\Reports\\index.html",
				startTime, "Test", "2.1");
		ReportUtil.startSuite("Suite1");
		String TCStatus = "Pass";

		File src = new File(Result_File);
		FileInputStream file = new FileInputStream(src);
		workbook = new XSSFWorkbook(file);
		sheet = workbook.getSheetAt(0);
		// count number of active rows
		int totalRow = sheet.getLastRowNum() + 1;
		System.out.println("Total rows in Sheet ---->" + totalRow);

		// loop through the test cases
		for (int TC = 2; TC <= SuiteData.getRowCount("TestCases"); TC++) {
			String TCstartTime = TestUtils.now("dd.MMMM.yyyy hh.mm.ss aaa");
			String TestCaseID = SuiteData.getCellData("TestCases", "TCID", TC);
			String RunMode = SuiteData.getCellData("TestCases", "RunMode", TC);
			rowWrite = sheet.getRow(TC - 1);
			logger = reports.startTest(TestCaseID);

			if (RunMode.equals("Y")) {
				String TSStatus = "Pass";
				/*System.setProperty("webdriver.chrome.driver", "D:\\Winium\\ChromeDriver_Latest\\chromedriver.exe");
				dr = new ChromeDriver();
				driver = new EventFiringWebDriver(dr);
				driver.manage().timeouts().implicitlyWait(20, TimeUnit.SECONDS);
				driver.manage().window().maximize();*/

				int rows = TestStepData.getRowCount(TestCaseID);
				System.out.println("rows--->" + rows);
				/*if (rows > 2) {
					rows = rows;
					//rows = rows - 1;
				}*/
				/*
				 * if (rows <= 2) { rows = 2; }
				 */
				System.out.println("After rows Assigned-->" + rows);
				// loop through test data
				for (int TD = 2; TD <= rows; TD++) {

					// loop through the test steps
					System.out.println("SuiteData.getRowCount(TestCaseID)" + SuiteData.getRowCount(TestCaseID));

					for (int TS = 2; TS <= SuiteData.getRowCount(TestCaseID); TS++) {
						keyword = SuiteData.getCellData(TestCaseID, "Keyword", TS);
						webElement = SuiteData.getCellData(TestCaseID, "WebElement", TS);
						ProceedOnFail = SuiteData.getCellData(TestCaseID, "ProceedOnFail", TS);
						TSID = SuiteData.getCellData(TestCaseID, "TSID", TS);
						Description = SuiteData.getCellData(TestCaseID, "Description", TS);
						TestDataField = SuiteData.getCellData(TestCaseID, "TestDataField", TS);
						TestData = TestStepData.getCellData(TestCaseID, TestDataField, TD);
						
						/*if (TestDataField.equals("email")) { 
							TestData = "test" + System.currentTimeMillis() + "@gmail.com";
						}*/

						/*
						 * if (TestDataField.equals("email")) { TestData =
						 * "test" + System.currentTimeMillis() + "@gmail.com"; }
						 */

						Method method = Keywords.class.getMethod(keyword);
						TSStatus = (String) method.invoke(method);

						if (TSStatus.contains("Failed")) {
							// take the screenshot
							// String filename =
							// TestCaseID+"["+(TD-1)+"]"+TSID+"["+TestData+"]";
							String filename = TestCaseID + "[" + (TD - 1) + "]" + TSID;
							TestUtils.getScreenShot(filename);

							TCStatus = TSStatus;
							// report error
							ReportUtil.addKeyword(Description, keyword, TSStatus,
									System.getProperty("user.dir")+"\\src\\com\\onlinestore\\screenshots\\" + filename
											+ ".jpg");
							logger.log(LogStatus.FAIL, Description,
									TSStatus + logger.addScreenCapture(new File(
											System.getProperty("user.dir")+"\\src\\com\\onlinestore\\screenshots\\"
													+ filename + ".jpg").getPath()));
							if (ProceedOnFail.equals("N")) {
								break;
							}
						} else {
							// take the screenshot
							String filename = TestCaseID + "[" + (TD - 1) + "]" + TSID;
							TestUtils.getScreenShot(filename);

							TCStatus = TSStatus;
							ReportUtil.addKeyword(Description, keyword, TSStatus,
									System.getProperty("user.dir")+"\\src\\com\\onlinestore\\screenshots\\" + filename
											+ ".jpg");
							logger.log(LogStatus.PASS, Description,
									TSStatus + logger.addScreenCapture(new File(
											System.getProperty("user.dir")+"\\src\\com\\onlinestore\\screenshots\\"
													+ filename + ".jpg").getPath()));
						}

					}
					ReportUtil.addTestCase(TestCaseID, TCstartTime, TestUtils.now("dd.MMMM.yyyy hh.mm.ss aaa"), TCStatus);

					if (TCStatus.contains("Pass")) {
						rowWrite.createCell(3).setCellValue("Pass");
					} else if (TCStatus.contains("Failed")) {

						rowWrite.createCell(3).setCellValue("Fail");
					} else {

						System.out.println("No Rows and columns found...");
					}

					//driver.quit();
				}
			} else {
				// skip the test case
				ReportUtil.addTestCase(TestCaseID, TCstartTime, TestUtils.now("dd.MMMM.yyyy hh.mm.ss aaa"), "Skipped");
				rowWrite.createCell(3).setCellValue("Skipped");
				// driver.quit();
			}
			//driver.quit();
		}

		ReportUtil.endSuite();
		ReportUtil.updateEndTime(TestUtils.now("dd.MMMM.yyyy hh.mm.ss aaa"));

		// Now this Write the output to a file
		file.close();
		FileOutputStream outFile = new FileOutputStream(new File(Result_File));
		workbook.write(outFile);
		outFile.close();
		workbook.close();
		reports.endTest(logger);
		reports.flush();
	}

	@AfterClass
	public void quitBrowser() {
		System.out.println("In quitBrowser---------------------------");
		driver.quit();
	}

}
