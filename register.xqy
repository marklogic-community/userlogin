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

xquery version "1.0-ml";

declare default element namespace "http://www.w3.org/1999/xhtml";

import module namespace sec = "http://marklogic.com/xdmp/security" at 
    "/MarkLogic/security.xqy";

import module namespace userlib = "http://www.w3.org/2003/05/xpath-functions" at "/user-lib.xqy";

let $user := xdmp:get-request-field("user", ""),
    $password := xdmp:get-request-field("password", ""),
    $password2 := xdmp:get-request-field("password2", ""),
    $desc := xdmp:get-request-field("desc", "")

return
if (($password != $password2) or ($password = "")) then
    <html>
      <body>
	{ if (($password = "") and ($password2 = "")) then
		<h2>You did not provide a password</h2>
          else
		<h2>You did not type the same password both times</h2>
	}
        <p>
        Please hit the "Back" button and re-type your password
        </p>
      </body>
    </html>
	
else if (userlib:register-user($user,$desc,$password)) then
    <html>
      <body>
        <h2>Congratulations! You are successfully registered with the site</h2>
        <p>
        Please login by clicking <a href="login.xqy"> login </a>
        </p>
      </body>
    </html>

else 
    <html>
      <body>
        There are problems in registering. Please contact the site administrator at <a href="mailto:admin@yourdomain.com">admin@yourdomain.com</a>
      </body>
    </html>
