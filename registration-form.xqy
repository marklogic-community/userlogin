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

xdmp:set-response-content-type("text/html; charset=utf-8");

<html>
 <body>
  <h1>Self Registration Sample Form</h1>
  <form action="register.xqy" method="post">
  User Name: <br />
  <input type="text" name="user" size="20" />
  <br />
   Password: <br />
    <input type="password" name="password" size="20" />
  <br />
   Confirm: <br />
    <input type="password" name="password2" size="20" />
  <br />
   Description: <br />
      <input type="text" name="desc" size="20" />
    <br />
  
  <input type="submit" name="submit" value="Submit" />
  <input type="reset" name="reset" value="Clear" />
  </form>
  
  </body>
</html>
