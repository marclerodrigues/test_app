defmodule TestApp.HelloController do
  use TestApp.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  # If need to access all the params just pattern match like this:
  # show(conn, %{"messenger" => messenger} = params)
  def show(conn, %{"messenger" => messenger}) do
    render conn, "show.html", messenger: messenger
  end
end
