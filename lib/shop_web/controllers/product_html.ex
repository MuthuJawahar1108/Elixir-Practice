defmodule ShopWeb.ProductHTML do
  use ShopWeb, :html
  alias Shop.Products.Product

  embed_templates "product_html/*"

  attr :product, Product, required: true

  def product(assigns) do
    ~H"""
    <%!-- <h1>Product : {@name}</h1> --%>
    <.link href={~p"/products/#{@product.slug}"} class="block"> {@product.name}  </.link>
    """
  end
end
