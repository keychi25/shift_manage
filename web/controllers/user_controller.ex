defmodule ShiftManage.UserController do
    use ShiftManage.Web, :controller
    alias ShiftManage.User
    alias ShiftManage.OpenCloses
    plug :authenticate_user when action in [:index, :show, :edit, :update, :delete] 
   
    def index(conn, _params) do
      users = Repo.all(User)
      render conn, "index.html", users: users
    end

    def new(conn, _params) do
        changeset = User.changeset(%User{})
        render conn, "new.html", changeset: changeset
    end

    def create(conn, %{"user" => user_params}) do
        changeset = User.registration_changeset(%User{}, user_params)
        case Repo.insert(changeset) do
          {:ok, user} ->
            conn
            |> put_flash(:info, "#{user.name}を作成しました")
            |> redirect(to: user_path(conn, :index))
     
          {:error, changeset} ->
            render(conn, "new.html", changeset: changeset)
        end
    end

    def show(conn, %{"id" => id}) do
        user = Repo.get(User, id)
        render conn, "show.html", user: user
    end

    def edit(conn, %{"id" => id}) do
        user = Repo.get(User, id)
        changeset = User.changeset(user)
        render(conn, "edit.html", user: user, changeset: changeset)
    end
     
    def update(conn, %{"id" => id, "user" => user_params}) do
        user = Repo.get(User, id)
        changeset = User.changeset(user, user_params)
     
        case Repo.update(changeset) do
          {:ok, user} ->
            conn
            |> put_flash(:info, "更新しました")
            |> redirect(to: page_path(conn, :index))
          {:error, changeset} ->
            render(conn, "edit.html", user: user, changeset: changeset)
        end
    end

    def delete(conn, %{"id" => id}) do
        user = Repo.get(User, id)
        Repo.delete(user)
     
        conn
        |> put_flash(:info, "削除しました")
        |> redirect(to: user_path(conn, :index))
    end

    def edit_password(conn, %{"id" => id}) do
      user = Repo.get(User, id)
      changeset = User.changeset(user)
      render(conn, "edit_password.html", user: user, changeset: changeset)
    end

    # def update_password(conn, %{"id" => id, "user" => user_params, "current_pass" => current_pass, "new_pass" => new_pass}) do
    #   user = Repo.get(User, id)
    #   changeset = User.changeset(user, user_params)
    #   put_pass_hash(changeset)
    #   case Repo.get_by(User, password_hash: current_pass) do
    #     {:ok, user} ->
    #       conn
    #       |> put_flash(:info, "更新しました")
    #       |> redirect(to: page_path(conn, :index))
    #     {:error, changeset} ->
    #       render(conn, "edit_password.html", user: user, changeset: changeset)
    #   end
    # end
end
  