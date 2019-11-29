BEGIN {
D["PACKAGE_NAME"]=" \"\""
D["PACKAGE_TARNAME"]=" \"\""
D["PACKAGE_VERSION"]=" \"\""
D["PACKAGE_STRING"]=" \"\""
D["PACKAGE_BUGREPORT"]=" \"\""
D["PACKAGE_URL"]=" \"\""
D["PACKAGE"]=" \"libxml2\""
D["VERSION"]=" \"2.9.10\""
D["STDC_HEADERS"]=" 1"
D["HAVE_SYS_TYPES_H"]=" 1"
D["HAVE_SYS_STAT_H"]=" 1"
D["HAVE_STDLIB_H"]=" 1"
D["HAVE_STRING_H"]=" 1"
D["HAVE_MEMORY_H"]=" 1"
D["HAVE_STRINGS_H"]=" 1"
D["HAVE_INTTYPES_H"]=" 1"
D["HAVE_STDINT_H"]=" 1"
D["HAVE_UNISTD_H"]=" 1"
D["HAVE_DLFCN_H"]=" 1"
D["LT_OBJDIR"]=" \".libs/\""
D["HAVE_DIRENT_H"]=" 1"
D["STDC_HEADERS"]=" 1"
D["HAVE_FCNTL_H"]=" 1"
D["HAVE_UNISTD_H"]=" 1"
D["HAVE_CTYPE_H"]=" 1"
D["HAVE_DIRENT_H"]=" 1"
D["HAVE_ERRNO_H"]=" 1"
D["HAVE_STDARG_H"]=" 1"
D["HAVE_SYS_STAT_H"]=" 1"
D["HAVE_SYS_TYPES_H"]=" 1"
D["HAVE_STDINT_H"]=" 1"
D["HAVE_INTTYPES_H"]=" 1"
D["HAVE_TIME_H"]=" 1"
D["HAVE_MATH_H"]=" 1"
D["HAVE_LIMITS_H"]=" 1"
D["HAVE_FLOAT_H"]=" 1"
D["HAVE_STDLIB_H"]=" 1"
D["HAVE_SYS_SOCKET_H"]=" 1"
D["HAVE_NETINET_IN_H"]=" 1"
D["HAVE_ARPA_INET_H"]=" 1"
D["HAVE_NETDB_H"]=" 1"
D["HAVE_SYS_TIME_H"]=" 1"
D["HAVE_SYS_SELECT_H"]=" 1"
D["HAVE_POLL_H"]=" 1"
D["HAVE_SYS_MMAN_H"]=" 1"
D["HAVE_SYS_TIMEB_H"]=" 1"
D["HAVE_SIGNAL_H"]=" 1"
D["HAVE_ARPA_NAMESER_H"]=" 1"
D["HAVE_RESOLV_H"]=" 1"
D["HAVE_DLFCN_H"]=" 1"
D["HAVE_STRFTIME"]=" 1"
D["HAVE_STRFTIME"]=" 1"
D["HAVE_LOCALTIME"]=" 1"
D["HAVE_GETTIMEOFDAY"]=" 1"
D["HAVE_FTIME"]=" 1"
D["HAVE_STAT"]=" 1"
D["HAVE_SIGNAL"]=" 1"
D["HAVE_RAND"]=" 1"
D["HAVE_RAND_R"]=" 1"
D["HAVE_SRAND"]=" 1"
D["HAVE_TIME"]=" 1"
D["HAVE_ISASCII"]=" 1"
D["HAVE_MMAP"]=" 1"
D["HAVE_MUNMAP"]=" 1"
D["HAVE_PUTENV"]=" 1"
D["HAVE_VA_COPY"]=" 1"
D["VA_LIST_IS_ARRAY"]=" 1"
D["XML_SOCKLEN_T"]=" socklen_t"
D["GETHOSTBYNAME_ARG_CAST"]=" /**/"
D["SEND_ARG2_CAST"]=" /**/"
D["SUPPORT_IP6"]=" /**/"
D["HAVE_GETADDRINFO"]=" /**/"
D["HAVE_ISNAN"]=" /**/"
D["HAVE_ISINF"]=" /**/"
D["HAVE_DLOPEN"]=" /**/"
D["HAVE_LIBPTHREAD"]=" /**/"
D["HAVE_PTHREAD_H"]=" /**/"
D["ICONV_CONST"]=" "
D["HAVE_PRINTF"]=" 1"
D["HAVE_SPRINTF"]=" 1"
D["HAVE_FPRINTF"]=" 1"
D["HAVE_SNPRINTF"]=" 1"
D["HAVE_VFPRINTF"]=" 1"
D["HAVE_VSPRINTF"]=" 1"
D["HAVE_VSNPRINTF"]=" 1"
D["HAVE_SSCANF"]=" 1"
  for (key in D) D_is_set[key] = 1
  FS = ""
}
/^[\t ]*#[\t ]*(define|undef)[\t ]+[_abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ][_abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789]*([\t (]|$)/ {
  line = $ 0
  split(line, arg, " ")
  if (arg[1] == "#") {
    defundef = arg[2]
    mac1 = arg[3]
  } else {
    defundef = substr(arg[1], 2)
    mac1 = arg[2]
  }
  split(mac1, mac2, "(") #)
  macro = mac2[1]
  prefix = substr(line, 1, index(line, defundef) - 1)
  if (D_is_set[macro]) {
    # Preserve the white space surrounding the "#".
    print prefix "define", macro P[macro] D[macro]
    next
  } else {
    # Replace #undef with comments.  This is necessary, for example,
    # in the case of _POSIX_SOURCE, which is predefined and required
    # on some systems where configure will not decide to define it.
    if (defundef == "undef") {
      print "/*", prefix defundef, macro, "*/"
      next
    }
  }
}
{ print }
