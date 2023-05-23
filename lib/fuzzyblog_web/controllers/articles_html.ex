defmodule FuzzyblogWeb.ArticlesHTML do
  use FuzzyblogWeb, :html
  import Phoenix.HTML.Form

  embed_templates("articles_html/*")
end
