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

  def generate(conn, params) do
    IO.inspect(params["password"], label: "PARAMS")

    password_lenghts = [
      Weak: Enum.map(1..15, & &1),
      Strong: Enum.map(16..88, & &1),
      Unreal: [100, 150]
    ]

    {:ok, password} = PassGenerator.generate(params["password"])

    render(conn, "index.html", password_length: password_lenghts, password: password)
  end
end
