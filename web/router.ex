defmodule ShiftManage.Router do
  use ShiftManage.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug ShiftManage.Auth, repo: ShiftManage.Repo 
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ShiftManage do
    pipe_through :browser # Use the default browser stack
    get "/", PageController, :index 
   
    resources "/users", UserController do
      pipe_through [:authenticate_user] 
    end

    get "/shifts/:id/new_shifts", ShiftController, :new_shifts
    get "/shifts/:id/index_shifts", ShiftController, :index_shifts 
    get "/shifts/:id/new", ShiftController, :new 

    resources "/sessions", SessionController, only: [:new, :create, :delete]
  end

  # Other scopes may use custom stacks.
  # scope "/api", ShiftManage do
  #   pipe_through :api
  # end
end
