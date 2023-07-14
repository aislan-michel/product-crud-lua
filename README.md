## CRUD of products in [Lua Lang](https://www.lua.org/)

### What is a product?
Is a object with id, name and price.

* Id or identifier - Unique value of three chars.
* Name - Name of product, like a bike, computer etc.
* Price - The value of product sell, represents a decimal like a 12.00, 5.99 etc.

### What are the rules?

* Create - The id is generated of the system, name and price a user insert
* Read - Print a list of created products in this template: {{id}} - {{{name}}} - ${{price}}
* Update - User insert id of product, the system finded, show template of information and user can update the price. if system not found product, print "not found".
* Delete -  User insert id of product, the system finded and deleted. if system not found product, print "not found".


