
Instructions to use the sample login and self-registration code:

1. Place the user-lib.xqy xquery library file in the Modules directory.
2. Place the other xuqery files in the HTTP server root directory.
3. Enable application level authentication 
	a. Go to the HTTP Server
	b. Select authentication = application-level
	c. default user = nobody
	d. Save
4. Amp the register-user function
	a. Go to Security-> Amps -> Add
	b. Enter:
		Local Name = register-user
		Namespace = http://www.w3.org/2003/05/xpath-functions
		Document URI = /user-lib.xqy
	c. Check admin role
	d. Save
5. Go to the login page.
6. Sample code contains couple of pages:
	a. login.xqy - Login Page
	b. default.xqy - Default Page, this page requires user
	   to be logged into the system.
	c. self-registration.xqy - Login page provide a link to
	   Self Registration page
	d. logout.xqy - Logout page

This sample code contains very simple functionality and a very basic user
login-logout-self-registration workflow. The core functions are in the
user-lib.xqy, which can be used to build a more complex workflow.

