defmodule EntryAdTest do
  # Import helpers
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
    assert open_page("https://the-internet.herokuapp.com/entry_ad", "The Internet") == true
    #Confirm the ad popped up
    assert visible_in_page?(~r/THIS IS A MODAL WINDOW/) == true
    #Close the ad
    div_Close = find_element(:xpath, "//p[text()='Close']")
    click(div_Close)
    :timer.sleep(500)
    #Confirm the popup is gone
    assert visible_in_page?(~r/THIS IS A MODAL WINDOW/) == false
    #In the requirements, we are told "If closed, it will not appear on subsequent page loads."
    #To test this, we'll refresh the page a few times to ensure that the popup does not return
    Enum.each(0..2, fn(_x) ->
      refresh_page()
      wait_for_page_load()
      assert visible_in_page?(~r/THIS IS A MODAL WINDOW/) == false
    end)
  end
end
