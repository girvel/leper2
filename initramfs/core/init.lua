local fs = require("core.fs")

print("\027[2J\027[1;1H")
print("Welcome to Leper Linux")

local ffi = require("ffi")
ffi.cdef [[
  typedef struct DIR DIR;
  struct DIR *opendir(const char *name);
  struct dirent *readdir(DIR *dirp);
  int closedir(DIR *dirp);
  char *strerror(int errno);
]]

-- ffi.C.syscall(257, ffi.cast("int", -100), ".", 0, 0)

local stream = assert(ffi.C.opendir("."))
print(123)
local content = ffi.C.readdir(stream)
while content ~= nil do
  print(content)
  print(ffi.string(content.d_name))
  content = ffi.C.readdir(stream)
end
ffi.C.closedir(stream)

-- print(fs.read_file("/core/init.lua"))
-- print(fs.read_file("/lib/x86_64-linux-gnu/libc.so.6"))

while true do
  _ = io.stdin:read()
end
