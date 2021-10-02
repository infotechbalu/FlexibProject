D:
cd "D:\Kondal Thummeti\Eclipse Workspace\Flexib_Automation\WebContent\Flexib_Onlinestore"
set ProjectPath=D:\Kondal Thummeti\Eclipse Workspace\Flexib_Automation\WebContent\Flexib_Onlinestore
echo %ProjectPath%
set classpath=%ProjectPath%\bin;%ProjectPath%\lib\*
echo %classpath%
java org.testng.TestNG "%ProjectPath%\testng.xml"