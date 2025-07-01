return {
  define = function()
    local ffi = require("ffi")
    ffi.cdef [[
      typedef struct {
        long d_ino;
        long d_off;
        unsigned short d_reclen;
        unsigned char d_type;
        char d_name[256];
      } dirent;

      void *opendir(const char *name);
      dirent *readdir(void *dirp);
      int closedir(void *dirp);
    ]]
  end
}
