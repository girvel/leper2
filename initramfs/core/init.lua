-- global library initialization
require("core.libc").define()

-- code
local fs = require("core.fs")

print("\027[2J\027[1;1H")
print("Welcome to Leper Linux")

for _, entry in ipairs(fs.read_dir("/")) do
  print(entry.inode, entry.name)
end

while true do
  _ = io.stdin:read()
end
