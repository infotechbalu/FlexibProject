package com.shoppingcart.tests;

import java.awt.AWTException;
import java.awt.Robot;
import java.awt.Toolkit;
import java.awt.datatransfer.StringSelection;
import java.awt.event.KeyEvent;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;
import java.util.List;

import javax.imageio.ImageIO;

import org.apache.commons.io.FileUtils;
import org.openqa.selenium.By;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.remote.Augmenter;
import org.testng.annotations.AfterTest;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.BeforeSuite;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.Test;

import com.relevantcodes.extentreports.ExtentReports;
import com.relevantcodes.extentreports.ExtentTest;
import com.relevantcodes.extentreports.LogStatus;

import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import jxl.write.WriteException;
import jxl.write.biff.RowsExceededException;

public class ShoppingCart {
	static WebDriver driver;
	private static ExtentReports extent;
	private static ExtentTest test;

	File f;
	Workbook rwb;
	WritableWorkbook wwb;
	WritableSheet wsh;
	WritableSheet wsh1;
	WritableSheet wsh2;
	Sheet rsh;
	Sheet rsh1;
	Sheet rsh2;
	int nor;
	int nor1;
	int nor2;

	@BeforeSuite
	public void ShoppingCart() throws MalformedURLException, InterruptedException {
		File directory = new File(System.getProperty("user.dir") + "\\src\\com\\shoppingcart\\Reports");
		File[] files = directory.listFiles();
		for (File file : files) {
			if (!file.delete()) {
				System.out.println("");
			}
		}

		extent = new ExtentReports(
				System.getProperty("user.dir") + "\\src\\com\\shoppingcart\\Reports\\ShoppingCartDemo.html", true);
		extent.loadConfig(new File("./extent-config.xml"));
		extent.addSystemInfo("Selenium", "3.12").addSystemInfo("Environment", "Production");
		/*
		 * test = extent.startTest(Thread.currentThread().getStackTrace()[1].
		 * getMethodName(), "Online Shopping - Create product and Buy Product."
		 * );
		 */

		System.setProperty("webdriver.chrome.driver", System.getProperty("user.dir")+"\\src\\com\\shoppingcart\\config\\chromedriver.exe");
		// Open a Chrome browser.
		driver = new ChromeDriver();
		driver.manage().window().maximize();
		System.out.println("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&*************************");
		//driver.get("http://10.1.129.56:8080/SpringMVCAnnotationShoppingCart/");
		//driver.get("http://localhost:8070/SpringMVCAnnotationShoppingCart/");
		driver.get("http://14.99.175.107:17670/SpringMVCAnnotationShoppingCart/");
		// Read Data from excel
		f = new File(System.getProperty("user.dir") + "\\src\\com\\shoppingcart_testdata\\Shopping Cart.xls");

		try {
			rwb = Workbook.getWorkbook(f);
		} catch (BiffException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		rsh = rwb.getSheet(0);
		rsh1 = rwb.getSheet(1);
		rsh2 = rwb.getSheet(2);
		nor = rsh.getRows();
		nor1 = rsh1.getRows();
		nor2 = rsh2.getRows();

		try {
			wwb = Workbook.createWorkbook(f, rwb);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		wsh = wwb.getSheet(0);
		wsh1 = wwb.getSheet(1);
		wsh2 = wwb.getSheet(2);
	}

	@Test
	public void Createproduct()
			throws AWTException, InterruptedException, RowsExceededException, WriteException, IOException {
		test = extent.startTest(Thread.currentThread().getStackTrace()[1].getMethodName(),
				"Online Shopping - Create product and Buy Product.");
		// For loop
		for (int i = 1; i < nor2; i++) {
			String ProductID = rsh2.getCell(0, i).getContents();
			String ProductName = rsh2.getCell(1, i).getContents();
			String Price = rsh2.getCell(2, i).getContents();

			test.log(LogStatus.INFO, "Login into application");
			// Login into application
			driver.findElement(By.xpath("//*[text()='Login']")).click();
			driver.findElement(By.xpath("//*[@name='userName']")).sendKeys("admin");
			driver.findElement(By.xpath("//*[@name='password']")).sendKeys("123");
			driver.findElement(By.xpath("//*[@value='Login']")).click();
			Thread.sleep(2000);

			String fileName = "Login.png";
			takeScreenshotImage(fileName);

			// Validate login
			if (driver.findElement(By.xpath("//*[contains(text(),'Hello')]")).isDisplayed()) {
				System.out.println(
						"Entered username, password and clicked login button. User navigated to Product listing page.");
				test.log(LogStatus.PASS,
						"Entered username, password and clicked login button. User navigated to Product listing page."
								+ test.addScreenCapture(new File(System.getProperty("user.dir") +
										"\\src\\com\\shoppingcart\\screenshots\\"
												+ fileName).getPath()));
				Label l = new Label(3, 1,
						"Entered username, password and clicked login button. User navigated to Product listing page.");
				wsh1.addCell(l);

				// Writing the status in 2nd sheet
				Label l1 = new Label(4, 1, "Pass");
				wsh1.addCell(l1);

			} else {
				System.out.println(
						"Entered username, password and clicked login button. User not navigated to Product listing page.");
				test.log(LogStatus.FAIL,
						"Entered username, password and clicked login button. User not navigated to Product listing page."
								+ test.addScreenCapture(new File(System.getProperty("user.dir") +
										"\\src\\com\\shoppingcart\\screenshots\\"
												+ fileName).getPath()));
				Label l = new Label(3, 1,
						"Entered username, password and clicked login button. User not navigated to Product listing page.");
				wsh1.addCell(l);

				// Writing the status in 2nd sheet
				Label l1 = new Label(4, 1, "Fail");
				wsh1.addCell(l1);
			}

			test.log(LogStatus.INFO, "Create new Product");
			// Create Product
			driver.findElement(By.xpath("//*[contains(text(),'Create Product')]")).click();
			driver.findElement(By.xpath("//*[@id='code']")).sendKeys(ProductID);
			driver.findElement(By.xpath("//*[@id='name']")).sendKeys(ProductName);
			driver.findElement(By.xpath("//*[@id='price']")).sendKeys(Price);
			driver.findElement(By.xpath("//*[@id='fileData']")).click();
			Thread.sleep(2000);
			// File Upload
			StringSelection stringSelection = new StringSelection("C:\\Users\\1000600\\Pictures\\download (2).jpg");
			Toolkit.getDefaultToolkit().getSystemClipboard().setContents(stringSelection, null);
			Robot r = new Robot();
			r.keyPress(KeyEvent.VK_CONTROL);
			r.keyPress(KeyEvent.VK_V);
			r.keyRelease(KeyEvent.VK_V);
			r.keyRelease(KeyEvent.VK_CONTROL);
			Thread.sleep(1000);
			r.keyPress(KeyEvent.VK_ENTER);
			r.keyRelease(KeyEvent.VK_ENTER);
			Thread.sleep(2000);
			driver.findElement(By.xpath("//*[@value='Submit']")).click();
			Thread.sleep(2000);
			String fileName1 = "CreateProduct.png";
			takeScreenshotImage(fileName1);

			// Validate the Create product
			if (driver.getPageSource().contains(ProductID)) {
				System.out.println(
						"Entered all product related details and clicked submit button. New product created successfully.");
				test.log(LogStatus.PASS,
						"Entered all product related details and clicked submit button. New product created successfully."
								+ test.addScreenCapture(new File(System.getProperty("user.dir") +
										"\\src\\com\\shoppingcart\\screenshots\\"
												+ fileName1).getPath()));
				Label l = new Label(3, 2,
						"Entered all product related details and clicked submit button. New product created successfully.");
				wsh1.addCell(l);

				// Writing the status in 2nd sheet
				Label l1 = new Label(4, 2, "Pass");
				wsh1.addCell(l1);

				// Writing the status in First sheet
				Label l2 = new Label(2, 1, "Pass");
				wsh.addCell(l2);

			} else {
				System.out.println("Product not created successfully.");
				test.log(LogStatus.FAIL, "Product not created successfully." + test.addScreenCapture(new File(System.getProperty("user.dir") +
						"\\src\\com\\shoppingcart\\screenshots\\" + fileName1)
								.getPath()));
				Label l = new Label(3, 2, "Product not created successfully.");
				wsh1.addCell(l);

				// Writing the status in 2nd sheet
				Label l1 = new Label(4, 2, "Fail");
				wsh1.addCell(l1);

				// Writing the status in First sheet
				Label l2 = new Label(2, 1, "Fail");
				wsh.addCell(l2);
			}

			test.log(LogStatus.INFO, "Validate the Product.");
			// Validate the Create product in listing page.
			if (driver.getPageSource().contains(ProductID)) {
				System.out.println("Created product is displayed on Product List page.");
				test.log(LogStatus.PASS,
						"Created product is displayed on Product List page." + test.addScreenCapture(
								new File(System.getProperty("user.dir") +"\\src\\com\\shoppingcart\\screenshots\\"
										+ fileName1).getPath()));
				Label l = new Label(3, 3, "Created product is displayed on Product List page.");
				wsh1.addCell(l);

				// Writing the status in 2nd sheet
				Label l1 = new Label(4, 3, "Pass");
				wsh1.addCell(l1);
			} else {
				System.out.println("Created product is not displayed on Product List page.");
				test.log(LogStatus.FAIL,
						"Created product is not displayed on Product List page." + test.addScreenCapture(
								new File(System.getProperty("user.dir") +"\\src\\com\\shoppingcart\\screenshots\\"
										+ fileName1).getPath()));
				Label l = new Label(3, 3, "Created product is not displayed on Product List page.");
				wsh1.addCell(l);

				// Writing the status in 2nd sheet
				Label l1 = new Label(4, 3, "Fail");
				wsh1.addCell(l1);
			}

			test.log(LogStatus.INFO, "Buy a product");
			// Buy a Product
			Thread.sleep(1000);
			driver.findElement(
					By.xpath("//a[@href='/SpringMVCAnnotationShoppingCart/buyProduct?code=" + ProductID + "']"))
					.click();
			String fileName2 = "Buy a product.png";
			takeScreenshotImage(fileName2);

			// Validate the Buy a product page navigation
			if (driver.findElement(By.xpath("//*[contains(text(),'Continue')]")).isDisplayed()) {
				System.out.println("Clicked 'Buy a Product' link, user navigated to buy a product page.");
				test.log(LogStatus.PASS,
						"Clicked 'Buy a Product' link, user navigated to buy a product page" + test.addScreenCapture(
								new File(System.getProperty("user.dir") +"\\src\\com\\shoppingcart\\screenshots\\"
										+ fileName2).getPath()));
				Label l = new Label(3, 4, "Clicked 'Buy a Product' link, user navigated to buy a product page.");
				wsh1.addCell(l);

				// Writing the status in 2nd sheet
				Label l1 = new Label(4, 4, "Pass");
				wsh1.addCell(l1);
			} else {
				System.out.println("Clicked 'Buy a Product' link, user not navigated to buy a product page.");
				test.log(LogStatus.FAIL, "Clicked 'Buy a Product' link, user not navigated to buy a product page."
						+ test.addScreenCapture(
								new File(System.getProperty("user.dir") +"\\src\\com\\shoppingcart\\screenshots\\"
										+ fileName2).getPath()));
				Label l = new Label(3, 4, "Clicked 'Buy a Product' link, user not navigated to buy a product page.");
				wsh1.addCell(l);

				// Writing the status in 2nd sheet
				Label l1 = new Label(4, 4, "Fail");
				wsh1.addCell(l1);
			}

			driver.findElement(By.xpath("//input[@id='cartLines0.quantity']")).clear();
			driver.findElement(By.xpath("//input[@id='cartLines0.quantity']")).sendKeys("2");
			Thread.sleep(1000);
			driver.findElement(By.xpath("//*[contains(text(),'Continue')]")).click();
			Thread.sleep(1000);
			driver.findElement(By.xpath("//*[contains(text(),'My Cart')]")).click();
			Thread.sleep(2000);
			String fileName3 = "MyCart.png";
			takeScreenshotImage(fileName3);

			test.log(LogStatus.INFO, "Continue Buy a product.");
			// Validate the Create product
			if (driver.getPageSource().contains(ProductID)) {
				System.out.println("Added quantity and clicked 'Continue Buy' link, product placed in 'My Cart' page.");
				test.log(LogStatus.PASS,
						"Added quantity and clicked 'Continue Buy' link, product placed in 'My Cart' page"
								+ test.addScreenCapture(new File(System.getProperty("user.dir") +
										"\\src\\com\\shoppingcart\\screenshots\\"
												+ fileName3).getPath()));
				Label l = new Label(3, 5,
						"Added quantity and clicked 'Continue Buy' link, product placed in 'My Cart' page.");
				wsh1.addCell(l);

				// Writing the status in 2nd sheet
				Label l1 = new Label(4, 5, "Pass");
				wsh1.addCell(l1);
			} else {
				System.out.println(
						"Added quantity and clicked 'Continue Buy' link, product not placed in 'My Cart' page.");
				test.log(LogStatus.FAIL,
						"Added quantity and clicked 'Continue Buy' link, product not placed in 'My Cart' page"
								+ test.addScreenCapture(new File(System.getProperty("user.dir") +
										"\\src\\com\\shoppingcart\\screenshots\\"
												+ fileName3).getPath()));
				Label l = new Label(3, 5,
						"Added quantity and clicked 'Continue Buy' link, product not placed in 'My Cart' page.");
				wsh1.addCell(l);

				// Writing the status in 2nd sheet
				Label l1 = new Label(4, 5, "Fail");
				wsh1.addCell(l1);
			}

			test.log(LogStatus.INFO, "Validate product in My Cart Page");
			// Validate the My Cart product
			if (driver.getPageSource().contains(ProductID)) {
				System.out.println("Purchased product is displayed in My Cart page.");
				test.log(LogStatus.PASS,
						"Purchased product is displayed in My Cart page." + test.addScreenCapture(
								new File(System.getProperty("user.dir") +"\\src\\com\\shoppingcart\\screenshots\\"
										+ fileName3).getPath()));
				Label l = new Label(3, 6, "Purchased product is displayed in My Cart page.");
				wsh1.addCell(l);

				// Writing the status in 2nd sheet
				Label l1 = new Label(4, 6, "Pass");
				wsh1.addCell(l1);

				// Writing the status in First sheet
				Label l2 = new Label(2, 2, "Pass");
				wsh.addCell(l2);
			} else {
				System.out.println("Purchased product is not displayed in My Cart page.");
				test.log(LogStatus.FAIL,
						"Purchased product is not displayed in My Cart page." + test.addScreenCapture(
								new File(System.getProperty("user.dir") +"\\src\\com\\shoppingcart\\screenshots\\"
										+ fileName3).getPath()));
				Label l = new Label(3, 6, "Purchased product is not displayed in My Cart page.");
				wsh1.addCell(l);

				// Writing the status in 2nd sheet
				Label l1 = new Label(4, 6, "Fail");
				wsh1.addCell(l1);

				// Writing the status in First sheet
				Label l2 = new Label(2, 2, "Fail");
				wsh.addCell(l2);
			}

		}
		// For loop end above
		try {
			wwb.write();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (NullPointerException e) {
			System.out.print("NullPointerException caught");
		}
		try {
			wwb.close();
		} catch (WriteException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		rwb.close();
		extent.endTest(test);
		extent.flush();
		extent.close();

		// Close the Browser
		Thread.sleep(2000);
		driver.close();

	}

	public void takeScreenshotImage(String fileNameWithExtention) throws IOException {
		WebDriver driver1 = new Augmenter().augment(driver);
		File actualFile = ((TakesScreenshot) driver1).getScreenshotAs(OutputType.FILE);
		try {
			BufferedImage fullImg = ImageIO.read(actualFile);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		/*
		 * File CreateFolder = new File("Screenshots"); CreateFolder.mkdir();
		 */

		try {

			FileUtils.copyFile(actualFile,
					new File(System.getProperty("user.dir") +"\\src\\com\\shoppingcart\\screenshots\\"
							+ fileNameWithExtention));

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
