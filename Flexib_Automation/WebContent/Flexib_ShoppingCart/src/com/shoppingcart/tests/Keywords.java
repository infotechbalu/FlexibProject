package com.shoppingcart.tests;

import java.awt.Robot;
import java.awt.Toolkit;
import java.awt.datatransfer.StringSelection;
import java.awt.event.KeyEvent;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.concurrent.TimeUnit;

import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedCondition;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.FluentWait;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.testng.Assert;

import com.google.common.base.Function;
import com.shoppingcart.uiactions.RegistrationPage;
import com.shoppingcart.utils.Resources;

public class Keywords extends Resources {

	public static String Navigate() {
		System.out.println("Navigate is called");
		driver.get(webElement);
		return "Pass";
	}

	public static String selectRadioButton() {
		System.out.println("InputText is called");
		try {
			getWebElement(webElement).click();
		} catch (Throwable t) {
			return "Failed - Element not found " + webElement;
		}
		return "Pass";
	}

	public static String InputText() {
		System.out.println("InputText is called");
		try {
			getWebElement(webElement).sendKeys(TestData);
		} catch (Throwable t) {
			return "Failed - Element not found " + webElement;
		}
		return "Pass";
	}

	public static String ClickField() {
		System.out.println("ClickField is called");
		try {
			getWebElement(webElement).click();
		} catch (Throwable t) {
			return "Failed - Element not found " + webElement;
		}
		return "Pass";
	}

	public static String ClickOnLink() {
		System.out.println("ClickOnLink is called");
		try {
			getWebElement(webElement).click();
		} catch (Throwable t) {
			t.printStackTrace();
			return "Failed - Element not found " + webElement;
		}
		return "Pass";
	}
	public static String ClickBuyNow() {
		System.out.println("ClickOnLink is called");
		try {
			//getWebElement(webElement).click();
			driver.findElement(By.xpath("//a[@href='/SpringMVCAnnotationShoppingCart/buyProduct?code=" + TestData + "']")).click();
		} catch (Throwable t) {
			t.printStackTrace();
			return "Failed - Element not found " + webElement;
		}
		return "Pass";
	}

	public static String ClearField() {
		System.out.println("ClickOnLink is called");
		try {
			getWebElement(webElement).clear();
		} catch (Throwable t) {
			t.printStackTrace();
			return "Failed - Element not found " + webElement;
		}
		return "Pass";
	}

	public static String VerifyText() {
		System.out.println("VerifyText is called");
		try {
			String ActualText = getWebElement(webElement).getText();
			System.out.println(ActualText);
			if (!ActualText.contains(TestData)) {
				return "Failed - Actual text " + ActualText + " is not equal to to expected text " + TestData;
			}
		} catch (Throwable t) {
			return "Failed - Element not found " + webElement;
		}
		return "Pass";
	}

	public static String IsDisplayed() {
		System.out.println("IsDisplayed is called");
		try {
			getWebElement(webElement).isDisplayed();
		} catch (Throwable t) {
			return "Failed - Element not found " + webElement;
		}
		return "Pass";
	}
	
	public static String GetPageSourceContains() {
		System.out.println("GetPageSourceContains is called");
		try {
			if(driver.getPageSource().contains(TestData)){
				return "Pass";
			}
		} catch (Throwable t) {
			return "Failed - Element not found " + TestData;
		}
		return "Pass";
	}

	public static String VerifyAppText() {
		System.out.println("VerifyText is called");
		try {
			String ActualText = getWebElement(webElement).getText();
			if (!ActualText.equals(AppText.getProperty(webElement))) {
				return "Failed - Actual text " + ActualText + " is not equal to expected text "
						+ AppText.getProperty(webElement);
			}
		} catch (Throwable t) {
			return "Failed - Element not found " + webElement;
		}
		return "Pass";
	}

	public static String UploadFile() {
		System.out.println("Upload File is called");
		try {
			// File Upload
			StringSelection stringSelection = new StringSelection(System.getProperty("user.dir")+"\\src\\com\\shoppingcart\\data\\"+ TestData +"");
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
			
		} catch (Throwable t) {
			return "Failed to upload a file";
		}
		return "Pass";
	}

	/**
	 * This Method will return web element.
	 * 
	 * @param locator
	 * @return
	 * @throws Exception
	 */
	public static WebElement getLocator(String locator) throws Exception {
		String[] split = locator.split(":");
		String locatorType = split[0];
		String locatorValue = split[1];

		if (locatorType.toLowerCase().equals("id"))
			return driver.findElement(By.id(locatorValue));
		else if (locatorType.toLowerCase().equals("name"))
			return driver.findElement(By.name(locatorValue));
		else if ((locatorType.toLowerCase().equals("classname")) || (locatorType.toLowerCase().equals("class")))
			return driver.findElement(By.className(locatorValue));
		else if ((locatorType.toLowerCase().equals("tagname")) || (locatorType.toLowerCase().equals("tag")))
			return driver.findElement(By.className(locatorValue));
		else if ((locatorType.toLowerCase().equals("linktext")) || (locatorType.toLowerCase().equals("link")))
			return driver.findElement(By.linkText(locatorValue));
		else if (locatorType.toLowerCase().equals("partiallinktext"))
			return driver.findElement(By.partialLinkText(locatorValue));
		else if ((locatorType.toLowerCase().equals("cssselector")) || (locatorType.toLowerCase().equals("css")))
			return driver.findElement(By.cssSelector(locatorValue));
		else if (locatorType.toLowerCase().equals("xpath"))
			return driver.findElement(By.xpath(locatorValue));
		else
			throw new Exception("Unknown locator type '" + locatorType + "'");
	}

	public static List<WebElement> getLocators(String locator) throws Exception {
		String[] split = locator.split(":");
		String locatorType = split[0];
		String locatorValue = split[1];

		if (locatorType.toLowerCase().equals("id"))
			return driver.findElements(By.id(locatorValue));
		else if (locatorType.toLowerCase().equals("name"))
			return driver.findElements(By.name(locatorValue));
		else if ((locatorType.toLowerCase().equals("classname")) || (locatorType.toLowerCase().equals("class")))
			return driver.findElements(By.className(locatorValue));
		else if ((locatorType.toLowerCase().equals("tagname")) || (locatorType.toLowerCase().equals("tag")))
			return driver.findElements(By.className(locatorValue));
		else if ((locatorType.toLowerCase().equals("linktext")) || (locatorType.toLowerCase().equals("link")))
			return driver.findElements(By.linkText(locatorValue));
		else if (locatorType.toLowerCase().equals("partiallinktext"))
			return driver.findElements(By.partialLinkText(locatorValue));
		else if ((locatorType.toLowerCase().equals("cssselector")) || (locatorType.toLowerCase().equals("css")))
			return driver.findElements(By.cssSelector(locatorValue));
		else if (locatorType.toLowerCase().equals("xpath"))
			return driver.findElements(By.xpath(locatorValue));
		else
			throw new Exception("Unknown locator type '" + locatorType + "'");
	}

	public static WebElement getWebElement(String locator) throws Exception {
		System.out.println("locator data:-" + locator + "is---" + Repository.getProperty(locator));
		return getLocator(Repository.getProperty(locator));
	}

	public static List<WebElement> getWebElements(String locator) throws Exception {
		return getLocators(Repository.getProperty(locator));
	}

	public static String expliciteWait() throws Exception {
		WebDriverWait wait = new WebDriverWait(driver, 60);
		wait.until(ExpectedConditions.visibilityOf(getWebElement(webElement)));
		return "Pass";
	}

	/*
	 * public static String expliciteWait(){ try { Thread.sleep(5000); } catch
	 * (InterruptedException e) { return "Failed - unable to load the page"; }
	 * return "Pass"; }
	 */

	public static String clickWhenReady(By locator, int timeout) {
		WebElement element = null;
		WebDriverWait wait = new WebDriverWait(driver, timeout);
		element = wait.until(ExpectedConditions.elementToBeClickable(locator));
		element.click();
		return "Pass";

	}

	public static String waitFor() throws InterruptedException {
		try {
			Thread.sleep(5000);
		} catch (InterruptedException e) {
			return "Failed - unable to load the page";
		}
		return "Pass";
	}

	/*
	 * public static String selectDaysInDropDown() throws Exception{
	 * RegistrationPage reg = new RegistrationPage(); String status =
	 * reg.selectDaysInDropDown(); return status; }
	 * 
	 * public static String selectMonthInDropDown() throws Exception{
	 * RegistrationPage reg = new RegistrationPage(); return
	 * reg.selectMonthInDropDown(); }
	 * 
	 * public static String selectYearInDropDown() throws Exception{
	 * RegistrationPage reg = new RegistrationPage(); return
	 * reg.selectYearInDropDown(); }
	 * 
	 * public static String selectYourAddressCountry() throws Exception{
	 * RegistrationPage reg = new RegistrationPage(); return
	 * reg.selectYourAddressCountry(); }
	 */

	public static void closeBrowser() {
		driver.quit();
	}

}
