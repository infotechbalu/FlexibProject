D:
cd "D:\Kondal Thummeti\Eclipse Workspace\Flexib_Automation\WebContent\Flexib_ShoppingCart"
set ProjectPath=D:\Kondal Thummeti\Eclipse Workspace\Flexib_Automation\WebContent\Flexib_ShoppingCart
echo %ProjectPath%
set classpath=%ProjectPath%\bin;%ProjectPath%\lib\*
echo %classpath%
java org.testng.TestNG "%ProjectPath%\testng.xml"