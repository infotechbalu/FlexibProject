F:
cd "F:\Flexib\Eclipse Workspace\Flexib_Automation\WebContent\ShoppingCart_Demo"
set ProjectPath=F:\Flexib\Eclipse Workspace\Flexib_Automation\WebContent\ShoppingCart_Demo
echo %ProjectPath%
set classpath=%ProjectPath%\bin;%ProjectPath%\lib\*
echo %classpath%
java org.testng.TestNG "%ProjectPath%\testng.xml"