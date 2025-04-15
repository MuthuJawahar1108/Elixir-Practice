defmodule ShopWeb.RandomController do
  use ShopWeb, :controller

  def random(conn, _params) do
    # text(conn,"This is a random text")
    render(conn, :random)
  end
end
