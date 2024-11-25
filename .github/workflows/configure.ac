- name: Check for configure.ac
  run: |
    if [ ! -f configure.ac ]; then
      echo "No configure.ac file found, skipping autoreconf.";
      exit 0;
    fi
- name: Generate configure script (if needed)
  if: success()
  run: autoreconf -i
