(:
 : Copyright (c) 2004 Mark Logic Corporation
 :
 : Licensed under the Apache License, Version 2.0 (the "License");
 : you may not use this file except in compliance with the License.
 : You may obtain a copy of the License at
 :
 : http://www.apache.org/licenses/LICENSE-2.0
 :
 : Unless required by applicable law or agreed to in writing, software
 : distributed under the License is distributed on an "AS IS" BASIS,
 : WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 : See the License for the specific language governing permissions and
 : limitations under the License.
 :
 : The use of the Apache License does not indicate that this project is
 : affiliated with the Apache Software Foundation.
 :)

(: This module should be placed in the server's Modules
   directory.  You must also amp the register-user function
   with admin privilege.
      Admin Console -> Amps -> Add
         Local Name = register-user
         Namespace = http://www.w3.org/2003/05/xpath-functions
         Document URI = /user-lib.xqy
      Check admin role
:)

module "http://www.w3.org/2003/05/xpath-functions"

default element namespace = "http://www.w3.org/1999/xhtml"

import module "http://marklogic.com/xdmp/security" at "/security.xqy"


(:
**************************************************************
*    This function registers a user
*    
*    $user - User Name as string
*    $desc - User Description    
*    $password - Password as string
*     
*    - if the registration is successful then true
*    - else returns false
*    
*    Need to be in modules directory and have to be an amp function
*    with admin privileges.
***************************************************************
:)

define function register-user (
	$user as xs:string,
	$desc as xs:string,
	$password as xs:string) as xs:boolean
{
	if (xdmp:eval-in (concat ('import module "http://marklogic.com/xdmp/security" at "/security.xqy" sec:create-user("',$user,'","',$desc,'","',$password,'",(),(),())'),xdmp:security-database())) then
		true()
	else
		false()
}


(:
**************************************************************
*    This function logs a user into the server.
*    
*    $user - User Name as string
*    $password - Password as string
*     
*    - if the login is successful then true
*    - else returns false
*    
*    Does not necessarily need to be there in modules directory, 
*    can be in a normal directory like "Docs" etc.
***************************************************************
:)

define function checkLogin ($user as xs:string, $password as xs:string)
	as xs:boolean
{

	if (xdmp:login ($user,$password)) then
		true()
	else
		false()
}

