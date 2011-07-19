require "rubygems" 
require "selenium/client"
require "test/unit"

class Untitled < Test::Unit::TestCase

  def setup
    @selenium = Selenium::Client::Driver.new \
      :host => "localhost",
      :port => 4444,
      :browser => "*firefoxchrome",
      :url => "https://mail.yahoo.com",
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
    @selenium.type "username", "uno.prueba"
    @selenium.type "passwd", "julia12" 
    @selenium.click ".save"

    #Inbox page
    #@selenium.wait_for_page_to_load
    @selenium.wait_for_element "xpath=//a[@class='x-gap']"
    @selenium.click "xpath=//a[@class='x-gap']"
 
    @selenium.wait_for_element "css=.list-view-items .list-view-item:first-of-type"
    @selenium.click "css=.list-view-items .list-view-item:first-of-type"

    #Mail page
    #@selenium.wait_for_element "xpath=//span[@class = 'iD']"
    #@selenium.click_at "xpath=//span[@class = 'iD']", "0,0"
    @selenium.wait_for_page_to_load
  
	  begin
	   assert @selenium.is_element_present "xpath=//ul[@class = 'inline-items']"
	  end

  end

end

