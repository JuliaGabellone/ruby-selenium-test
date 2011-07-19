require "test/unit"
require "rubygems"
require "selenium/client"

class Untitled < Test::Unit::TestCase

 def setup
   @verification_errors = []
   @selenium = Selenium::Client::Driver.new \
     :host => "localhost",
     :port => 4444,
     :browser => "*chrome",
     :url => "https://login.live.com/",
     :timeout_in_second => 60

   @selenium.start_new_browser_session
 end
 
 def teardown
   #@selenium.close_current_browser_session
   assert_equal [], @verification_errors
 end
 
 def test_julia
   @selenium.open "/login.srf?wa=wsignin1.0&rpsnv=11&ct=1309790984&rver=6.1.6206.0&wp=MBI&wreply=http:%2F%2Fmail.live.com%2Fdefault.aspx&lc=1033&id=64855&mkt=en-us&cbcxt=mai&snsc=1"


   #Sign in page
   @selenium.click "idDiv_PWD_UsernameExample0Pwd"
   @selenium.type "i0116", "uno.prueba@hotmail.com"
   @selenium.type "i0118", "julia12"
   @selenium.click "idSIButton9"
   @selenium.wait_for_page_to_load "30000"

   #Inbox page
   @selenium.wait_for_element "link=Bandeja de entrada"
   @selenium.click "link=Bandeja de entrada"
   @selenium.wait_for_page_to_load "30000"

   #Mail page
   @selenium.wait_for_element "xpath=//tr[1]/td[6]/a"
   @selenium.click "xpath=//tr[1]/td[6]/a"
   #@selenium.wait_for_page_to_load "30000"


	 #Test infobox
   @selenium.wait_for_element "xpath=//div[@class = 'FBA']"
   @selenium.click "xpath=//div[@class = 'FBA']"

   begin
	   assert @selenium.is_element_present "xpath=//div[@class = 'HdrDetails']"
	  end

 end
end
