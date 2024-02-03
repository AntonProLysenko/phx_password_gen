defmodule PassGenWeb.PageController do
  use PassGenWeb, :controller

  def index(conn, _params) do
    # render(conn, "index.html")
    password_lenghts = [
      Weak: Enum.map(1..15, & &1),
      Strong: Enum.map(16..88, & &1),
      Unreal: [100, 150]
    ]

    password = ""

    render(conn, "index.html", password_length: password_lenghts, password: password )
  end
end
