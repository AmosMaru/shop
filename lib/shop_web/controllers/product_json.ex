defmodule ShopWeb.ProductJSON do

  def index(_assigns) do
    %{data: [
      %{name: "god of war", price: 50},
      %{name: "xbox series x", price: 499},
      %{name: "ps5", price: 499}
    ]}
  end

end
