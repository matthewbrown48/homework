defmodule FormValidationTest do
  # Import helpers
  use Hound.Helpers
  use ExUnit.Case

  # Start hound session and destroy when tests are run
  hound_session()
  #Test credentials can be changed here
  @username :tomsmith
  @password :"SuperSecretPassword!"

  def open_page(url, pgTitle) do
      navigate_to url
      wait_for_page_load()
      #Return True if page title is correct
      page_title() == pgTitle
  end

  def wait_for_page_load() do
    #Quick pause of 500 ms to allow the page to load, before checking if it's loaded
    :timer.sleep(500)
    case execute_script("return document.readyState") do
       "loading"  ->  wait_for_page_load()
       _ -> true 
     end
  end


  test "SubmitWithoutUserName" do
    #navigate_to "https://the-internet.herokuapp.com/login", and confirm that the page loaded correctly
    assert open_page("https://the-internet.herokuapp.com/login", "The Internet") == true
    #Get the elements we'll be using in this test case
    fld_Username = find_element(:id, "username")
    fld_Password = find_element(:id, "password")
    frm_Form = find_element(:id, "login")
    #Fill Password, and submit without username
    fill_field(fld_Password, @password)
    submit_element(frm_Form)   
    assert {:ok, el_alert} = search_element(:id, "flash")
    str_alertText = visible_text(el_alert)
    #Confirm Correct error
    assert str_alertText =~ "Your username is invalid!"
  end
    
  test "SubmitWithoutPassword" do
    #navigate_to "https://the-internet.herokuapp.com/login", and confirm that the page loaded correctly
    assert open_page("https://the-internet.herokuapp.com/login", "The Internet") == true
    #Get the elements we'll be using in this test case
    fld_Username = find_element(:id, "username")
    fld_Password = find_element(:id, "password")
    frm_Form = find_element(:id, "login")
    #Fill username, and submit without password
    fill_field(fld_Username, @username)
    fill_field(fld_Password, "")#Clearing the field
    submit_element(frm_Form)   
    assert {:ok, el_alert} = search_element(:id, "flash")
    str_alertText = visible_text(el_alert)
    #Confirm Correct error
    assert str_alertText =~ "Your password is invalid!"
  end

  test "Login" do
    #navigate_to "https://the-internet.herokuapp.com/login", and confirm that the page loaded correctly
    assert open_page("https://the-internet.herokuapp.com/login", "The Internet") == true
    #Get the elements we'll be using in this test case
    fld_Username = find_element(:id, "username")
    fld_Password = find_element(:id, "password")
    frm_Form = find_element(:id, "login")
    #Fill username, and submit without password
    fill_field(fld_Username, @username)
    fill_field(fld_Password, @password)#Clearing the field
    submit_element(frm_Form)   
    assert {:ok, el_alert} = search_element(:id, "flash")
    str_alertText = visible_text(el_alert)
    #Confirm Correct error
    assert str_alertText =~ "You logged into a secure area!"
  end


end
