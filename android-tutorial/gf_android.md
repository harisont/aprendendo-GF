# Using GF grammars in Android applications
Prerequisites:
- Java Development Kit
- GF C runtime
- the grammar you want to use in `.pgf` format
- Android Studio

## Step 1: Compile the Java bindings

> __NOTE:__ You might be able to skip this step if you have installed a GF binary.

Even if you have installed GF and its C runtime, you might have never needed to compile the Java bindings.
If this is the case, follow these steps:

1. __move to the Java bindings folder__:
    ```
    cd WHEREVER-YOU-CLONED-GF-CORE/gf-core/src/runtime/java
    ```
2. __try running `make`__. If this fails with an error such as
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
3. __run `make install`__. You should get something like
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
Alright, at this point you should have something called `jpgf` installed somewhere. In my case, that somewhere is `/usr/local/lib`, as shown in the message above. In fact, I can run

```
~ ls /usr/local/lib | grep jpgf                          
jpgf.jar
libjpgf.la
libjpgf.so
libjpgf.so.0
libjpgf.so.0.0.0
```

The `.jar` file is what we really care about. Time to put it to use in Android Studio!

1. open Android Studio and __create a new project__ (`File > New > New Project`). If you want to reproduce my simple demo app, select `Empty Activity`, then `Next`, and use this screenshot as a reference in the following screen:
   ![New projects](new_project.png)
   
   > __NOTE:__ I set `Language` to `Kotlin` as it is my preferred Android development language and any Java library can also be used as a Kotlin library. Isn't that magic?
   
   Then click on `Finish` and let Gradle do his thing.
2. __copy the `.jar` file to `/app/libs` subfolder of your Android Studio Project__. For instance:
   ```
   cp /usr/local/lib/jpgf.jar GFDemo/app/libs
   ```
3. __add the `.jar` to the project dependencies__: 
   - go to `File > Project Structure`
   - select the `Dependencies` tab
   - click on the `+` button (`Add dependencies`) and select `JAR/AAR dependency`:
     ![Add dependency](dependencies.png)
   - provide the path to the jar file just added. Note that `app` is the default folder where dependencies are stored, so typing in `libs/jpgf.jar` should suffice:
     ![Provide path to JAR file](dependencies_path.png)
   - click on `Ok` (twice) and let Gradle do his job again
4. __check that everything works__ by trying to build (or even run, if you have a physical Android device or emulator already set up).