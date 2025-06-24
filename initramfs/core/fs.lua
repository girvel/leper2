local fs = {}

fs.read_file = function(filename)
  local f = assert(io.open(filename, "rb"))
  local result = f:read("*a")
  f:close()
  return result
end

return fs
