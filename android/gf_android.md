# Using GF grammars in Android applications
Prerequisites:
- Java Development Kit
- GF C runtime
- the grammar you want to use in `.pgf` format

## Step 1: Compile the Java bindings

> __NOTE:__ You might be able to skip this step if you have installed a GF binary.

Even if you have installed GF and its C runtime, you might have never needed to compile the Java bindings.
If this is the case, follow these steps:

1. move to the Java bindings folder:
    ```
    cd WHEREVER-YOU-CLONED-GF-CORE/gf-core/src/runtime/java
    ```
2. try running `make`. If this fails with an error such as
   ```
   Makefile:33: *** No JNI headers found.  Stop.
   ```
   that means that the `Makefile` was unable to locate your `jni.h` and `jni_md.h` files. What are they, you might well be wondering? Well, they are some `jdk` things we don't really need to understand. We just need to `locate` them:
   ```
   locate jni.h
   ```
   In my case, as I messed up with different versions of Java for different projects, this returns various locations:
   ```
   /home/harisont/.cache/yay/android-studio/src/android-studio/jre/include/jni.h
   /home/harisont/.jdks/corretto-1.8.0_292/include/jni.h
   /usr/include/libavcodec/jni.h
   /usr/lib/jvm/java-11-openjdk/include/jni.h
   /usr/lib/jvm/java-16-openjdk/include/jni.h
   ```
   and the results are similar if I try to `locate jni_md.h`:
   ```
    /home/harisont/.cache/yay/android-studio/src/android-studio/jre/include/linux/jni_md.h
    /home/harisont/.jdks/corretto-1.8.0_292/include/linux/jni_md.h
    /usr/lib/jvm/java-11-openjdk/include/linux/jni_md.h
    /usr/lib/jvm/java-16-openjdk/include/linux/jni_md.h
   ```
   Common sense suggests me that I should use the first path, as it seems to be the one of the JDK used by Android Studio. But this might as well make no difference.
   Once you have decided what path to try and use, modify the `Makefile`: replace whatever is assigned to `JNI_INCLUDES` with `-I FOLDER-CONTAINING-jni.h FOLDER-CONTAINING-jni_md.h`. In my case, this means
   ```
   JNI_INCLUDES = -I /home/harisont/.cache/yay/android-studio/src/android-studio/jre/include/ -I /home/harisont/.cache/yay/android-studio/src/android-studio/jre/include/linux
   ```
   > __NOTE:__ on Windows, the syntax varies slightly, but the `Makefile` offers some good examples
3. run `make install`. You should get something like
   ```
   ----------------------------------------------------------------------
   Libraries have been installed in:
      /usr/local/lib
   
   If you ever happen to want to link against installed libraries
   in a given directory, LIBDIR, you must either use libtool, and
   specify the full pathname of the library, or use the '-LLIBDIR'
   flag during linking and do at least one of the following:
      - add LIBDIR to the 'LD_LIBRARY_PATH' environment variable
        during execution
      - add LIBDIR to the 'LD_RUN_PATH' environment variable
        during linking
      - use the '-Wl,-rpath -Wl,LIBDIR' linker flag
      - have your system administrator add LIBDIR to '/etc/ld.so.   conf'
   
   See any operating system documentation about shared libraries    for
   more information, such as the ld(1) and ld.so(8) manual pages.
   ----------------------------------------------------------------------
   install jpgf.jar /usr/local/lib
   ```

## Step 2: Import `jpgf` in Android Studio

