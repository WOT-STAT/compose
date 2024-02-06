local base64 = require "ngx.base64"


local function decode_credentials()
  local auth_header = ngx.var.http_authorization
  if not auth_header then
    return nil, nil
  end

  local _, _, encoded_credentials = string.find(auth_header, "Basic%s+(.+)")
  if not encoded_credentials then
    return nil, nil
  end

  local decoded_credentials = base64.decode_base64url(encoded_credentials)
  local username, password = decoded_credentials:match("([^:]+):(.*)")
  return username, password
end

local username, password = decode_credentials()
if username and password then
  ngx.req.set_header("X-ClickHouse-User", username)
  ngx.req.set_header("X-ClickHouse-Key", password)
end
