json.extract! item, :id, :name, :photo_url, :stocks, :price, :created_at, :updated_at
json.url item_url(item, format: :json)
