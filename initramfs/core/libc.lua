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

      int scandir(
        const char *dirp,
        dirent ***namelist,
        int (*filter)(const dirent *),
        int (*compar)(const dirent **, const dirent **)
      );

      int alphasort(const dirent **a, const dirent **b);
      void free(void *ptr);
    ]]
  end
}
