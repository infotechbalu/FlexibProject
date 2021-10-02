Feature:Adding new product and validating same product through user login credentials

@productlogin
Scenario Outline: Verifying adding a new product 
Given Open the Chrome and launch product application			
When Enter the "<username>" and "<password>" 			
Then Adding a new product


Examples:

|username| |password|
|admin| |123|


@ShoppingCart
Scenario Outline: Verify ShoppingCart Login details 
Given Chrome and launch shoppingCart application			
When Provide the "<AgentName>" and "<PWord>" 			
Then Close the ShoppingCart application


Examples:

|AgentName| |PWord|
|user1| |123|



@productExistornot
Scenario Outline: Verifying required product exist or not 
Given Browser Chrome and launch shoppingCart application			
When Give "<Loginid>" and "<pwd>" 			
Then validate required product exist or not

Examples:

|Loginid| |pwd|
|user1| |123|


