toptal
======

tech2assignment


1. Install Visual Studio 2013

2. Add SpecFlow add-in in Visual studio
   2.1 Download SpecFlow for Visual Studio 2013:
       http://visualstudiogallery.msdn.microsoft.com/90ac3587-7466-4155-b591-2cd4cc4401bc
   2.2 Install SpecFlow for Visual Studio 2013:
       just double click on the downloaded .msi file from point 2.1

3. Download the project from github: 
   https://github.com/vericab/toptal

4. Open the project with Visual Studio 2013

5. Add reference to SpecFlow
   5.1 Open Visual Studio 2013 Ultimate
   5.2 Open Package Manager Console:
       Tools -> Libraries Package Manager -> Package Manager Consol
   5.3 From Default project dropdown, choose project TopTalWebTest
   5.4 Run following command in the console:
       PM> Install-Package SpecFlow

6. Add reference to Selenium Webdriver
   6.1 Open Package Manager Console:
       Tools -> Libraries Package Manager -> Package Manager Consol
   6.2 Run following command in the console:
       PM> Install-Package Selenium.WebDriver - Version 2.41.0

7. Install google Chrome browser
