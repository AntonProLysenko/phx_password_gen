defmodule PassGenWeb.Api.PageControllerTest do
  use PassGenWeb.ConnCase

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "generates a password" do
    test "generates a password with only length" , %{conn: conn} do
      conn = post(conn, Routes.page_path(conn, :api_generate), %{"length" => "5"})
      assert %{"password" => _pass} = json_response(conn, 200)
    end

    test "generates a password with one option", %{conn: conn}do
      options = %{"length"=> "5", "numbers"=> "true"}
      conn = post(conn, Routes.page_path(conn, :api_generate), options)
      assert %{"password" => _pass} = json_response(conn, 200)
    end
  end



  describe "return errors" do
    test "error when no options" , %{conn: conn} do
      conn = post(conn, Routes.page_path(conn, :api_generate), %{})
      assert %{"error" => _error} = json_response(conn, 200)
    end

    test "error when length not int", %{conn: conn}do
      options = %{"length"=> "ab"}
      conn = post(conn, Routes.page_path(conn, :api_generate), options)
      assert %{"error" => _error} = json_response(conn, 200)
    end

    test "error when opts not bools", %{conn: conn}do
      options = %{"length"=> "5", "invalid"=> "invalid"}
      conn = post(conn, Routes.page_path(conn, :api_generate), options)
      assert %{"error" => _error} = json_response(conn, 200)
    end


    test "error when not valid options", %{conn: conn}do
      options = %{"length"=> "5", "invalid"=> "true"}
      conn = post(conn, Routes.page_path(conn, :api_generate), options)
      assert %{"error" => _error} = json_response(conn, 200)
    end
  end

end
