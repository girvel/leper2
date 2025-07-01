-- global library initialization
require("core.libc").define()

-- code
local fs = require("core.fs")

print("\027[2J\027[1;1H")
print("Welcome to Leper Linux")


while true do
  io.stdout:write("> ")
  local path = io.stdin:read("*l")
  for _, entry in ipairs(fs.read_dir(path)) do
    print(entry.inode, entry.name)
  end
end
