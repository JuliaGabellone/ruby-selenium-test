require "rubygems" 
require "selenium/client"
require "test/unit"

class Untitled < Test::Unit::TestCase

  def setup
    @selenium = Selenium::Client::Driver.new \
      :host => "localhost",
      :port => 4444,
      :browser => "*firefoxchrome",
      :url => "http://www.gmail.com",
      :timeout_in_second => 60
    @selenium.start
    @selenium.set_context("test_login")
  end

  def teardown
    @selenium.stop
  end

  def test_login
    @selenium.open "/"

    #Sign in page
    @selenium.type "Email", "prueba01.uno"
    @selenium.type "Passwd", "Julia123" 
    @selenium.click "signIn"

    #Inbox page
    @selenium.wait_for_page_to_load
    @selenium.select_frame "canvas_frame"
    @selenium.wait_for_element "xpath=//div[@class = 'y6']/span[contains(.,'RE2-1')]"
    @selenium.click_at "xpath=//div[@class = 'y6']/span[contains(.,'RE2-1')]", "0,0"

    #Mail page
    @selenium.wait_for_element "xpath=//span[@class = 'iD']"
    @selenium.click_at "xpath=//span[@class = 'iD']", "0,0"
    #@selenium.wait_for_page_to_load
  
	  begin
	   assert @selenium.is_element_present "xpath=//td[@class = 'gL']"
	  end

  end

end



