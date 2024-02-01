defmodule PassGenWeb.PageController do
  use PassGenWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
