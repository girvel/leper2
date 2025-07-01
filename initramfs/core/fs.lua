local ffi = require("ffi")

local fs = {}

-- TODO error handling

--- @param path string
--- @return string
fs.read_file = function(path)
  local f = assert(io.open(path, "rb"))
  local result = f:read("*a")
  f:close()
  return result
end

--- @class fs_dir_entry
--- @field inode integer
--- @field name string

--- @param path string
--- @return fs_dir_entry[]
fs.read_dir = function(path)
  local result = {}
  local stream = ffi.C.opendir(path)  -- NULL on error +errno

  while true do
    local entry = ffi.C.readdir(stream)
    if entry == nil then break end
    table.insert(result, {
      inode = tonumber(entry[0].d_ino),
      name = ffi.string(entry[0].d_name),
    })
  end

  ffi.C.closedir(stream)  -- TODO returns -1 on error
  return result
end

return fs
