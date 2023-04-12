defmodule FuzzyblogWeb.ErrorJSONTest do
  use FuzzyblogWeb.ConnCase, async: true

  test "renders 404" do
    assert FuzzyblogWeb.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert FuzzyblogWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
