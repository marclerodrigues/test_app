defmodule TestApp.ErrorViewTest do
  use TestApp.ConnCase, async: true

  # Bring render/3 and render_to_string/3 for testing custom views
  import Phoenix.View

  test "renders not_found.html" do
    conn = get build_conn, "/not/found"
    assert html_response(conn, 404) =~
           "Sorry, the page you are looking for does not exist"
  end

  test "render 500.html" do
    assert render_to_string(TestApp.ErrorView, "500.html", []) ==
           "Internal server error"
  end

  test "render any other" do
    assert render_to_string(TestApp.ErrorView, "505.html", []) ==
           "Internal server error"
  end
end
