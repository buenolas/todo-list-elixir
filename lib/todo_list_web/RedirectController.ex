defmodule TodoListWeb.RedirectController do
  use TodoListWeb, :controller

  def redirect_to_login(conn, _params) do
    redirect(conn, to: ~p"/users/log_in")
  end
end
