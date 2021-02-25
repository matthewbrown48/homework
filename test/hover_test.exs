defmodule HoverTest do
  #Import helpers
  #import helper_functions
  use Hound.Helpers
  use ExUnit.Case

  # Start hound session and destroy when tests are run
  hound_session()

  def open_page(url, pgTitle) do
    navigate_to url
    wait_for_page_load()
    #Return True if page title is correct
    page_title() == pgTitle
  end

  def visible_on_mouse_over(elem_mouseover, elem_visible) do
    move_to(elem_mouseover, 0, 0)
    element_displayed?(elem_visible)
  end

  def wait_for_page_load() do
    #Quick pause to allow the page to load, before checking if it's loaded
    :timer.sleep(750)
    case execute_script("return document.readyState") do
       "loading"  ->  wait_for_page_load()
       _ -> true 
     end
  end


  test "ClearEntryAd" do
    #Confirm open_page() returns true (page loaded correctly)
    assert open_page("https://the-internet.herokuapp.com/hovers", "The Internet") == true
    #Get the elements we'll be using in this test case
    img_Profile1 = find_element(:xpath, "//div[1]/img[1]")
    img_Profile2 = find_element(:xpath, "//div[2]/img[1]")
    img_Profile3 = find_element(:xpath, "//div[3]/img[1]")
    h_User1 = find_element(:xpath, "//h5[text()='name: user1']")
    h_User2 = find_element(:xpath, "//h5[text()='name: user2']")
    h_User3 = find_element(:xpath, "//h5[text()='name: user3']")
  
    #Call our function confirming the element appears on mouseover for each profile image
    assert visible_on_mouse_over(img_Profile1, h_User1) == true
    assert visible_on_mouse_over(img_Profile2, h_User2) == true
    assert visible_on_mouse_over(img_Profile3, h_User3) == true
    #Confirm that we aren't showing the wrong popup
    assert visible_on_mouse_over(img_Profile1, h_User2) == false
    assert visible_on_mouse_over(img_Profile1, h_User3) == false
    assert visible_on_mouse_over(img_Profile2, h_User1) == false
    assert visible_on_mouse_over(img_Profile2, h_User3) == false
    assert visible_on_mouse_over(img_Profile3, h_User1) == false
    assert visible_on_mouse_over(img_Profile3, h_User2) == false
  end
end
