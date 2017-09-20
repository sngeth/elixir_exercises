defmodule WebsiteGenerator do
  import Input

  def run do
    site_name = get_string_input "Site name: "
    author = get_string_input "Author: "
    js = get_y_or_n_input "Do you want a folder for JavaScript?(y/n) "
    css = get_y_or_n_input "Do you want a folder for CSS?(y/n) "

    create_root_folder(site_name)
    create_index(site_name, author)
    if js == "Y", do: create_js_folder(site_name)
    if css == "Y", do: create_css_folder(site_name)
  end

  def create_root_folder(site_name) do
    project_path = Path.expand("./#{site_name}")

    case File.mkdir(project_path) do
      :ok -> IO.puts "Created ./#{site_name}"
      {:error, reason} -> IO.puts "Error: #{reason}"
    end
  end

  def create_index(site_name, author) do
    index_file = Path.expand("./#{site_name}/index.html")
    file = File.open!(index_file, [:write])

    IO.puts(file, """
     <html>
     <head>
       <meta name="author" content="#{author}">
       <title>
       #{site_name}
       </title>
     </head>
     </html>
     """)

    IO.puts "Created ./#{site_name}/index.html"
  end


  def create_js_folder(site_name) do
    js_path = Path.expand("./#{site_name}/js")

    case File.mkdir(js_path) do
      :ok -> IO.puts "Created ./#{site_name}/js/"
      {:error, reason} -> IO.puts "Error: #{reason}"
    end

  end

  def create_css_folder(site_name) do
    css_path = Path.expand("./#{site_name}/css")

    case File.mkdir(css_path) do
      :ok -> IO.puts "Created ./#{site_name}/css/"
      {:error, reason} -> IO.puts "Error: #{reason}"
    end
  end
end
