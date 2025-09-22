defmodule ShopWeb.PromationControllerTest do
  use ShopWeb.ConnCase

  import Shop.PromationsFixtures

  @create_attrs %{code: "some code", expires_at: ~U[2025-09-21 18:52:00Z], name: "some name"}
  @update_attrs %{code: "some updated code", expires_at: ~U[2025-09-22 18:52:00Z], name: "some updated name"}
  @invalid_attrs %{code: nil, expires_at: nil, name: nil}

  describe "index" do
    test "lists all pronations", %{conn: conn} do
      conn = get(conn, ~p"/pronations")
      assert html_response(conn, 200) =~ "Listing Pronations"
    end
  end

  describe "new promation" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/pronations/new")
      assert html_response(conn, 200) =~ "New Promation"
    end
  end

  describe "create promation" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/pronations", promation: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/pronations/#{id}"

      conn = get(conn, ~p"/pronations/#{id}")
      assert html_response(conn, 200) =~ "Promation #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/pronations", promation: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Promation"
    end
  end

  describe "edit promation" do
    setup [:create_promation]

    test "renders form for editing chosen promation", %{conn: conn, promation: promation} do
      conn = get(conn, ~p"/pronations/#{promation}/edit")
      assert html_response(conn, 200) =~ "Edit Promation"
    end
  end

  describe "update promation" do
    setup [:create_promation]

    test "redirects when data is valid", %{conn: conn, promation: promation} do
      conn = put(conn, ~p"/pronations/#{promation}", promation: @update_attrs)
      assert redirected_to(conn) == ~p"/pronations/#{promation}"

      conn = get(conn, ~p"/pronations/#{promation}")
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, promation: promation} do
      conn = put(conn, ~p"/pronations/#{promation}", promation: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Promation"
    end
  end

  describe "delete promation" do
    setup [:create_promation]

    test "deletes chosen promation", %{conn: conn, promation: promation} do
      conn = delete(conn, ~p"/pronations/#{promation}")
      assert redirected_to(conn) == ~p"/pronations"

      assert_error_sent 404, fn ->
        get(conn, ~p"/pronations/#{promation}")
      end
    end
  end

  defp create_promation(_) do
    promation = promation_fixture()

    %{promation: promation}
  end
end
