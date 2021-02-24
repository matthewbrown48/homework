defmodule Helper_functions do
    # Import helpers
    use test_helper.visible_on_mouse_over
    use Hound.Helpers
    use ExUnit.Case


    def visible_on_mouse_over(elem_mouseover, elem_visible) do
        elem_mouseover == elem_mouseover
        #move_to(elem_mouseover, 0, 0)
        #element_displayed?(elem_visible)
    end
  end
  