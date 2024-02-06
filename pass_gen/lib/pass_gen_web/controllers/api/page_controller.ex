defmodule PassGenWeb.Api.PageController do
  use PassGenWeb, :controller

  def api_generate(conn, params)do
    case PassGenerator.generate(params) do
      {:ok, pass} -> json(conn, %{password: pass})
      {:error, error} -> json(conn, %{error: error})
    end
  end

end
