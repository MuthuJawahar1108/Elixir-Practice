defmodule ShopWeb.RandomHTML do
  # Macro to use the HTML helpers and functions
  use ShopWeb, :html

  def random(assigns) do
    ~H"""
    <h1>Random</h1>
    <p>This is a random page!</p>
    """
  end
end
