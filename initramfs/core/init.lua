local fs = require("core.fs")

print("\027[2J\027[1;1H")
print("Welcome to Leper Linux")

local ffi = require("ffi")
ffi.cdef [[
  typedef struct {
    long d_ino;
    long d_off;
    unsigned short d_reclen;
    unsigned char d_type;
    char d_name[256];
  } dirent;

  int scandir(
    const char *dirp,
    dirent ***namelist,
    int (*filter)(const dirent *),
    int (*compar)(const dirent **, const dirent **)
  );

  int alphasort(const dirent **a, const dirent **b);
  void free(void *ptr);
]]

-- TODO free

print("Functions loaded")

local namelist = ffi.new("dirent **[1]")
local count = ffi.C.scandir("/", namelist, nil, ffi.C.alphasort)
print(count)

for i = 0, count - 1 do
  local entry = namelist[0][i]
  print(ffi.string(entry.d_name))
  ffi.C.free(entry)
end
ffi.C.free(namelist[0])

while true do
  _ = io.stdin:read()
end
