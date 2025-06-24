local ffi = require("ffi")

local fs = {}

fs.read_file = function(filename)
  local f = assert(io.open(filename, "rb"))
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
  local namelist = ffi.new("dirent **[1]")
  local count = ffi.C.scandir(path, namelist, nil, ffi.C.alphasort)  -- TODO scandir -> readdir

  for i = 0, count - 1 do
    local entry = namelist[0][i]
    result[i] = {
      inode = tonumber(entry.d_ino),
      name = ffi.string(entry.d_name)
    }
    ffi.C.free(entry)
  end
  ffi.C.free(namelist[0])

  return result
end

return fs
