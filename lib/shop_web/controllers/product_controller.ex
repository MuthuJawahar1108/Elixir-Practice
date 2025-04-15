defmodule ShopWeb.ProductController do
  use ShopWeb, :controller



  # Module attribute
  # @products [
  #   # This is a module attribute, which is a constant value that is
  #   # available at compile time. It is used to store the list of products.
  #   # The @products attribute is defined at the module level and can be
  #   # accessed throughout the module.
  #   %{id: "1", name: "God of war"},
  #   %{id: "2", name: "Horizon"},
  #   %{id: "3", name: "Final Fantasy"},
  #   %{id: "4", name: "Street Fighter"}
  # ]

  alias Shop.Products

  def index(conn, _params) do

    products = Products.list_products()
    conn
    |> assign(:products, products)
    |> render(:index)

  end

  def show(conn, %{"slug" => slug}) do
    
    product = Products.find_product_by_slug(slug)

    conn
    |> assign(:product, product)
    |> render(:show)
  end
end
