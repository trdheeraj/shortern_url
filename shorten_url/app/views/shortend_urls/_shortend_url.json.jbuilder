json.extract! shortend_url, :id, :short_url, :original_url, :created_at, :updated_at
json.url shortend_url_url(shortend_url, format: :json)
