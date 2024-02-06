defmodule PassGenWeb.PageController do
  use PassGenWeb, :controller

  def index(conn, _params, password_lenghts) do
    #password = ""
    #render(conn, "index.html", password_length: password_lenghts, password: password )

    #BOTH WAYS ARE RIGHT ↑THIS OR THIS↓
    conn
    |>assign(:password_length, password_lenghts)
    |>assign(:password, "")
    |> render("index.html")
  end

  def generate(conn, %{"password" => password_params}, password_lenghts) do
    # IO.inspect(params["password"], label: "PARAMS")

    {:ok, password} = PassGenerator.generate(password_params)

    render(conn, "index.html", password_length: password_lenghts, password: password)
  end

  @doc """
  Slight refactor function for our "action functions", so password_lenghts is not repeated in both
  """
  def action(conn, _)do
    password_lenghts = [
      Weak: Enum.map(3..15, & &1),
      Strong: Enum.map(16..88, & &1),
      Unreal: [100, 150]
    ]

    args = [conn, conn.params, password_lenghts]
    #applying this params to our "action functions"
    apply(__MODULE__, action_name(conn), args)
  end
end
