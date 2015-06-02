get '/shirt/random' do
  shirt = Shirt.get(rand(1..Shirt.count))

  cannot_find shirt
  respond_with shirt
end

get '/shirt/:id' do
  shirt = Shirt.get(params[:id])

  cannot_find shirt
  respond_with shirt
end

get '/shirt/filename/:filename' do
  shirt = Shirt.first(filename: params[:filename])

  cannot_find shirt
  respond_with shirt
end

helpers do
  def get_shirt_by_id id
    shirt = Shirt.get(id)

    cannot_find shirt
    respond_with shirt
  end

  def get_shirt_by_filename
    shirt = Shirt.get(id)

    cannot_find shirt
    respond_with shirt
  end

  def respond_with shirt
    url = "http://#{HOST}:#{PORT}/img/#{shirt.filename}"
    data = {filename: shirt.filename, url: url}
    
    respond_to do |f|
      f.json {data.to_json}
      f.html {"<img src=\"#{url}\"/>"}
    end
  end

  def cannot_find shirt
    if shirt.nil?
      halt 404
    end
  end
end
