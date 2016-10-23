defmodule TestApp.Router do
  use TestApp.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", TestApp do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/hello", HelloController, :index
    get "/hello/:messenger", HelloController, :show
    get "/test", HelloController, :test
    resources "/users", UserController
    # resources "/users", UserController do
    #   resources "/comments", CommentsController
    # end
  end

  # The router is perfectly fine with two scopes defined for the same path
  scope "/", AnotherApp do
    pipe_through :browser

    get "/posts", PostController, :index
  end

  scope "/admin", TestApp.Admin, as: :admin do
    pipe_through :browser

    resources "/users", UserController
  end

  # Custom pipelines
  # pipeline :review_checks do
  #   plug :ensure_authenticated_user
  #   plug :ensure_user_owns_review
  # end

  # Other scopes may use custom stacks.
  # scope "/api", TestApp do
  #   pipe_through :api
  # end
end
