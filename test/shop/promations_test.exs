defmodule Shop.PromationsTest do
  use Shop.DataCase

  alias Shop.Promations

  describe "pronations" do
    alias Shop.Promations.Promation

    import Shop.PromationsFixtures

    @invalid_attrs %{code: nil, expires_at: nil, name: nil}

    test "list_pronations/0 returns all pronations" do
      promation = promation_fixture()
      assert Promations.list_pronations() == [promation]
    end

    test "get_promation!/1 returns the promation with given id" do
      promation = promation_fixture()
      assert Promations.get_promation!(promation.id) == promation
    end

    test "create_promation/1 with valid data creates a promation" do
      valid_attrs = %{code: "some code", expires_at: ~U[2025-09-21 18:52:00Z], name: "some name"}

      assert {:ok, %Promation{} = promation} = Promations.create_promation(valid_attrs)
      assert promation.code == "some code"
      assert promation.expires_at == ~U[2025-09-21 18:52:00Z]
      assert promation.name == "some name"
    end

    test "create_promation/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Promations.create_promation(@invalid_attrs)
    end

    test "update_promation/2 with valid data updates the promation" do
      promation = promation_fixture()
      update_attrs = %{code: "some updated code", expires_at: ~U[2025-09-22 18:52:00Z], name: "some updated name"}

      assert {:ok, %Promation{} = promation} = Promations.update_promation(promation, update_attrs)
      assert promation.code == "some updated code"
      assert promation.expires_at == ~U[2025-09-22 18:52:00Z]
      assert promation.name == "some updated name"
    end

    test "update_promation/2 with invalid data returns error changeset" do
      promation = promation_fixture()
      assert {:error, %Ecto.Changeset{}} = Promations.update_promation(promation, @invalid_attrs)
      assert promation == Promations.get_promation!(promation.id)
    end

    test "delete_promation/1 deletes the promation" do
      promation = promation_fixture()
      assert {:ok, %Promation{}} = Promations.delete_promation(promation)
      assert_raise Ecto.NoResultsError, fn -> Promations.get_promation!(promation.id) end
    end

    test "change_promation/1 returns a promation changeset" do
      promation = promation_fixture()
      assert %Ecto.Changeset{} = Promations.change_promation(promation)
    end
  end
end
