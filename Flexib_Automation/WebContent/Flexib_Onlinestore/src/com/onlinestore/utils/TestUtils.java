package com.onlinestore.utils;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import com.onlinestore.utils.Resources;

import org.apache.commons.io.FileUtils;
import org.openqa.selenium.OutputType;


public class TestUtils extends Resources{

	public static void getScreenShot(String fileName) throws IOException {
		File outputFile = driver.getScreenshotAs(OutputType.FILE);
		FileUtils.copyFile(outputFile,new File(System.getProperty("user.dir")+"\\src\\com\\onlinestore\\screenshots\\"+fileName+".jpg"));
		System.out.printf("Testutil Filename:" + outputFile, fileName);
	}

	public static String now(String format) {
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat fm = new SimpleDateFormat();
		return fm.format(cal.getTime());
	}
	
	
}
