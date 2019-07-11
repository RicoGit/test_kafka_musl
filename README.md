# Solution
```
# apt update && apt -yq install curl musl-dev musl-tools make python g++
$ rustup target add x86_64-unknown-linux-musl
$ CC=musl-gcc CXX=g++ cargo build --target=x86_64-unknown-linux-musl
```

## Solution
```
PATH=/musl/bin:$PATH PKG_CONFIG_ALLOW_CROSS=true PKG_CONFIG_ALL_STATIC=true PKG_CONFIG_PATH=/musl/lib/pkgconfig LIBZ_SYS_STATIC=1 CC=musl-gcc CXX=g++ cargo build -p ticket-storage --release --target x86_64-unknown-linux-musl
```

check https://github.com/fede1024/rust-rdkafka/issues/88

```bash
loomaclin@loomaclin:~/IdeaProjects/test_kafka_musl$ cargo build --target=x86_64-unknown-linux-musl
   Compiling test_kafka_musl v0.1.0 (/home/loomaclin/IdeaProjects/test_kafka_musl)
error: linking with `cc` failed: exit code: 1
  |
  = note: "cc" "-Wl,--as-needed" "-Wl,-z,noexecstack" "-Wl,--eh-frame-hdr" "-m64" "-nostdlib" "/home/loomaclin/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/x86_64-unknown-linux-musl/lib/crt1.o" "/home/loomaclin/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/x86_64-unknown-linux-musl/lib/crti.o" "-L" "/home/loomaclin/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/x86_64-unknown-linux-musl/lib" "/home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/test_kafka_musl-e8db54ab08725aed.19xxn2f9h5imnfyy.rcgu.o" "/home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/test_kafka_musl-e8db54ab08725aed.2mjux11xgcdx2gqn.rcgu.o" "/home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/test_kafka_musl-e8db54ab08725aed.4wpl7wygtl9e6y4n.rcgu.o" "/home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/test_kafka_musl-e8db54ab08725aed.51t4vfgc1semyklj.rcgu.o" "/home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/test_kafka_musl-e8db54ab08725aed.5cuud3zoleobv9sb.rcgu.o" "/home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/test_kafka_musl-e8db54ab08725aed.5eixvxnst499hvcg.rcgu.o" "/home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/test_kafka_musl-e8db54ab08725aed.5g6zdxczddhuhurh.rcgu.o" "/home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/test_kafka_musl-e8db54ab08725aed.8f30qfkj85u8cha.rcgu.o" "-o" "/home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/test_kafka_musl-e8db54ab08725aed" "/home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/test_kafka_musl-e8db54ab08725aed.230k3183yw6b9twg.rcgu.o" "-Wl,--gc-sections" "-no-pie" "-Wl,-zrelro" "-Wl,-znow" "-nodefaultlibs" "-L" "/home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps" "-L" "/home/loomaclin/IdeaProjects/test_kafka_musl/target/debug/deps" "-L" "/home/loomaclin/.cargo/registry/src/github.com-1ecc6299db9ec823/rdkafka-sys-0.11.6-1/librdkafka/src" "-L" "/home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/build/libz-sys-38d0a27451a8265a/out/build" "-L" "/home/loomaclin/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/x86_64-unknown-linux-musl/lib" "-Wl,-Bstatic" "/home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka-7047faa75ffb413c.rlib" "/home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka_sys-4c2ff55f733870e3.rlib" "/home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/liblibz_sys-ec0a785be6943b7e.rlib" "/home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/liblibc-f68f690f19125a5e.rlib" "/home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/libfutures-91415ce1fac5ca58.rlib" "/home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/libserde_json-2dbabd900c7ea1e7.rlib" "/home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/libryu-f05274048849fb45.rlib" "/home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/libitoa-6b9c512811894b2c.rlib" "/home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/libserde-24d9db8aa7b1d207.rlib" "/home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/liblog-579dd7a7f4a35f5f.rlib" "/home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/liblog-f65177196bee5278.rlib" "/home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/libcfg_if-98cb943be0694555.rlib" "/home/loomaclin/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/x86_64-unknown-linux-musl/lib/libstd-c77290dc5a6eb387.rlib" "/home/loomaclin/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/x86_64-unknown-linux-musl/lib/libpanic_unwind-3d30d8b442d427d8.rlib" "/home/loomaclin/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/x86_64-unknown-linux-musl/lib/libbacktrace_sys-c9de005aada93bb1.rlib" "/home/loomaclin/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/x86_64-unknown-linux-musl/lib/libunwind-2198a6632ae1aefb.rlib" "/home/loomaclin/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/x86_64-unknown-linux-musl/lib/librustc_demangle-ef9790f22138d0aa.rlib" "/home/loomaclin/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/x86_64-unknown-linux-musl/lib/liblibc-9f4fff27bb66d64a.rlib" "/home/loomaclin/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/x86_64-unknown-linux-musl/lib/liballoc-ac72c0c93f7653c2.rlib" "/home/loomaclin/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/x86_64-unknown-linux-musl/lib/librustc_std_workspace_core-348629e6cb24b0be.rlib" "/home/loomaclin/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/x86_64-unknown-linux-musl/lib/libcore-c66eac139c2cab65.rlib" "/home/loomaclin/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/x86_64-unknown-linux-musl/lib/libcompiler_builtins-959e4a4251f80613.rlib" "-static" "-Wl,-Bdynamic" "/home/loomaclin/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/x86_64-unknown-linux-musl/lib/crtn.o"
  = note: /usr/bin/ld: /home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka_sys-4c2ff55f733870e3.rlib(rdkafka.o): in function `fprintf':
          /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka_sys-4c2ff55f733870e3.rlib(rdkafka.o):/usr/include/x86_64-linux-gnu/bits/stdio2.h:100: more undefined references to `__fprintf_chk' follow
          /usr/bin/ld: /home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka_sys-4c2ff55f733870e3.rlib(rdkafka.o): in function `vsnprintf':
          /usr/include/x86_64-linux-gnu/bits/stdio2.h:80: undefined reference to `__vsnprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:80: undefined reference to `__vsnprintf_chk'
          /usr/bin/ld: /home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka_sys-4c2ff55f733870e3.rlib(rdkafka.o): in function `fprintf':
          /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka_sys-4c2ff55f733870e3.rlib(rdkafka.o): in function `snprintf':
          /usr/include/x86_64-linux-gnu/bits/stdio2.h:67: undefined reference to `__snprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:67: undefined reference to `__snprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:67: undefined reference to `__snprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:67: undefined reference to `__snprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:67: undefined reference to `__snprintf_chk'
          /usr/bin/ld: /home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka_sys-4c2ff55f733870e3.rlib(rdkafka.o): in function `fprintf':
          /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka_sys-4c2ff55f733870e3.rlib(rdkafka.o): in function `snprintf':
          /usr/include/x86_64-linux-gnu/bits/stdio2.h:67: undefined reference to `__snprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:67: undefined reference to `__snprintf_chk'
          /usr/bin/ld: /home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka_sys-4c2ff55f733870e3.rlib(rdkafka.o): in function `fprintf':
          /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka_sys-4c2ff55f733870e3.rlib(rdkafka.o):/usr/include/x86_64-linux-gnu/bits/stdio2.h:100: more undefined references to `__fprintf_chk' follow
          /usr/bin/ld: /home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka_sys-4c2ff55f733870e3.rlib(rdkafka.o): in function `snprintf':
          /usr/include/x86_64-linux-gnu/bits/stdio2.h:67: undefined reference to `__snprintf_chk'
          /usr/bin/ld: /home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka_sys-4c2ff55f733870e3.rlib(rdkafka.o): in function `vsnprintf':
          /usr/include/x86_64-linux-gnu/bits/stdio2.h:80: undefined reference to `__vsnprintf_chk'
          /usr/bin/ld: /home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka_sys-4c2ff55f733870e3.rlib(rdkafka.o): in function `snprintf':
          /usr/include/x86_64-linux-gnu/bits/stdio2.h:67: undefined reference to `__snprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:67: undefined reference to `__snprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:67: undefined reference to `__snprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:67: undefined reference to `__snprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:67: undefined reference to `__snprintf_chk'
          /usr/bin/ld: /home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka_sys-4c2ff55f733870e3.rlib(rdkafka.o):/usr/include/x86_64-linux-gnu/bits/stdio2.h:67: more undefined references to `__snprintf_chk' follow
          /usr/bin/ld: /home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka_sys-4c2ff55f733870e3.rlib(rdkafka.o): in function `fprintf':
          /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka_sys-4c2ff55f733870e3.rlib(rdkafka.o):/usr/include/x86_64-linux-gnu/bits/stdio2.h:100: more undefined references to `__fprintf_chk' follow
          /usr/bin/ld: /home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka_sys-4c2ff55f733870e3.rlib(rdkafka.o): in function `snprintf':
          /usr/include/x86_64-linux-gnu/bits/stdio2.h:67: undefined reference to `__snprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:67: undefined reference to `__snprintf_chk'
          /usr/bin/ld: /home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka_sys-4c2ff55f733870e3.rlib(rdkafka.o): in function `syslog':
          /usr/include/x86_64-linux-gnu/bits/syslog.h:31: undefined reference to `__syslog_chk'
          /usr/bin/ld: /home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka_sys-4c2ff55f733870e3.rlib(rdkafka_broker.o): in function `snprintf':
          /usr/include/x86_64-linux-gnu/bits/stdio2.h:67: undefined reference to `__snprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:67: undefined reference to `__snprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:67: undefined reference to `__snprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:67: undefined reference to `__snprintf_chk'
          /usr/bin/ld: /home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka_sys-4c2ff55f733870e3.rlib(rdkafka_broker.o): in function `fprintf':
          /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka_sys-4c2ff55f733870e3.rlib(rdkafka_broker.o): in function `snprintf':
          /usr/include/x86_64-linux-gnu/bits/stdio2.h:67: undefined reference to `__snprintf_chk'
          /usr/bin/ld: /home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka_sys-4c2ff55f733870e3.rlib(rdkafka_broker.o): in function `fprintf':
          /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka_sys-4c2ff55f733870e3.rlib(rdkafka_broker.o):/usr/include/x86_64-linux-gnu/bits/stdio2.h:100: more undefined references to `__fprintf_chk' follow
          /usr/bin/ld: /home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka_sys-4c2ff55f733870e3.rlib(rdkafka_broker.o): in function `snprintf':
          /usr/include/x86_64-linux-gnu/bits/stdio2.h:67: undefined reference to `__snprintf_chk'
          /usr/bin/ld: /home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka_sys-4c2ff55f733870e3.rlib(rdkafka_broker.o): in function `vsnprintf':
          /usr/include/x86_64-linux-gnu/bits/stdio2.h:80: undefined reference to `__vsnprintf_chk'
          /usr/bin/ld: /home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka_sys-4c2ff55f733870e3.rlib(rdkafka_broker.o): in function `snprintf':
          /usr/include/x86_64-linux-gnu/bits/stdio2.h:67: undefined reference to `__snprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:67: undefined reference to `__snprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:67: undefined reference to `__snprintf_chk'
          /usr/bin/ld: /home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka_sys-4c2ff55f733870e3.rlib(rdkafka_broker.o): in function `fprintf':
          /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka_sys-4c2ff55f733870e3.rlib(rdkafka_broker.o): in function `snprintf':
          /usr/include/x86_64-linux-gnu/bits/stdio2.h:67: undefined reference to `__snprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:67: undefined reference to `__snprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:67: undefined reference to `__snprintf_chk'
          /usr/bin/ld: /home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka_sys-4c2ff55f733870e3.rlib(rdkafka_broker.o): in function `fprintf':
          /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka_sys-4c2ff55f733870e3.rlib(rdkafka_broker.o):/usr/include/x86_64-linux-gnu/bits/stdio2.h:100: more undefined references to `__fprintf_chk' follow
          /usr/bin/ld: /home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka_sys-4c2ff55f733870e3.rlib(rdkafka_broker.o): in function `snprintf':
          /usr/include/x86_64-linux-gnu/bits/stdio2.h:67: undefined reference to `__snprintf_chk'
          /usr/bin/ld: /home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka_sys-4c2ff55f733870e3.rlib(rdkafka_msg.o): in function `fprintf':
          /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka_sys-4c2ff55f733870e3.rlib(rdkafka_msg.o):/usr/include/x86_64-linux-gnu/bits/stdio2.h:100: more undefined references to `__fprintf_chk' follow
          /usr/bin/ld: /home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka_sys-4c2ff55f733870e3.rlib(rdkafka_conf.o): in function `snprintf':
          /usr/include/x86_64-linux-gnu/bits/stdio2.h:67: undefined reference to `__snprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:67: undefined reference to `__snprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:67: undefined reference to `__snprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:67: undefined reference to `__snprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:67: undefined reference to `__snprintf_chk'
          /usr/bin/ld: /home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka_sys-4c2ff55f733870e3.rlib(rdkafka_conf.o):/usr/include/x86_64-linux-gnu/bits/stdio2.h:67: more undefined references to `__snprintf_chk' follow
          /usr/bin/ld: /home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka_sys-4c2ff55f733870e3.rlib(rdkafka_conf.o): in function `fprintf':
          /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka_sys-4c2ff55f733870e3.rlib(rdkafka_conf.o):/usr/include/x86_64-linux-gnu/bits/stdio2.h:100: more undefined references to `__fprintf_chk' follow
          /usr/bin/ld: /home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka_sys-4c2ff55f733870e3.rlib(rdkafka_conf.o): in function `snprintf':
          /usr/include/x86_64-linux-gnu/bits/stdio2.h:67: undefined reference to `__snprintf_chk'
          /usr/bin/ld: /home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka_sys-4c2ff55f733870e3.rlib(rdkafka_conf.o): in function `fprintf':
          /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka_sys-4c2ff55f733870e3.rlib(rdkafka_conf.o): in function `snprintf':
          /usr/include/x86_64-linux-gnu/bits/stdio2.h:67: undefined reference to `__snprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:67: undefined reference to `__snprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:67: undefined reference to `__snprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:67: undefined reference to `__snprintf_chk'
          /usr/bin/ld: /home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka_sys-4c2ff55f733870e3.rlib(rdkafka_offset.o): in function `fprintf':
          /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka_sys-4c2ff55f733870e3.rlib(rdkafka_offset.o):/usr/include/x86_64-linux-gnu/bits/stdio2.h:100: more undefined references to `__fprintf_chk' follow
          /usr/bin/ld: /home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka_sys-4c2ff55f733870e3.rlib(rdkafka_offset.o): in function `snprintf':
          /usr/include/x86_64-linux-gnu/bits/stdio2.h:67: undefined reference to `__snprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:67: undefined reference to `__snprintf_chk'
          /usr/bin/ld: /home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka_sys-4c2ff55f733870e3.rlib(rdkafka_offset.o): in function `fprintf':
          /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka_sys-4c2ff55f733870e3.rlib(rdkafka_offset.o):/usr/include/x86_64-linux-gnu/bits/stdio2.h:100: more undefined references to `__fprintf_chk' follow
          /usr/bin/ld: /home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka_sys-4c2ff55f733870e3.rlib(rdkafka_offset.o): in function `snprintf':
          /usr/include/x86_64-linux-gnu/bits/stdio2.h:67: undefined reference to `__snprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:67: undefined reference to `__snprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:67: undefined reference to `__snprintf_chk'
          /usr/bin/ld: /home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka_sys-4c2ff55f733870e3.rlib(rdkafka_transport.o): in function `snprintf':
          /usr/include/x86_64-linux-gnu/bits/stdio2.h:67: undefined reference to `__snprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:67: undefined reference to `__snprintf_chk'
          /usr/bin/ld: /home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka_sys-4c2ff55f733870e3.rlib(rdkafka_transport.o):/usr/include/x86_64-linux-gnu/bits/stdio2.h:67: more undefined references to `__snprintf_chk' follow
          /usr/bin/ld: /home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka_sys-4c2ff55f733870e3.rlib(rdkafka_transport.o): in function `poll':
          /usr/include/x86_64-linux-gnu/bits/poll2.h:41: undefined reference to `__poll_chk'
          /usr/bin/ld: /home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka_sys-4c2ff55f733870e3.rlib(rdkafka_buf.o): in function `fprintf':
          /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka_sys-4c2ff55f733870e3.rlib(rdkafka_buf.o): in function `snprintf':
          /usr/include/x86_64-linux-gnu/bits/stdio2.h:67: undefined reference to `__snprintf_chk'
          /usr/bin/ld: /home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka_sys-4c2ff55f733870e3.rlib(rdkafka_buf.o): in function `fprintf':
          /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka_sys-4c2ff55f733870e3.rlib(rdkafka_buf.o):/usr/include/x86_64-linux-gnu/bits/stdio2.h:100: more undefined references to `__fprintf_chk' follow
          /usr/bin/ld: /home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka_sys-4c2ff55f733870e3.rlib(rdkafka_op.o): in function `vsnprintf':
          /usr/include/x86_64-linux-gnu/bits/stdio2.h:80: undefined reference to `__vsnprintf_chk'
          /usr/bin/ld: /home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka_sys-4c2ff55f733870e3.rlib(rdkafka_op.o): in function `fprintf':
          /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka_sys-4c2ff55f733870e3.rlib(rdkafka_op.o):/usr/include/x86_64-linux-gnu/bits/stdio2.h:100: more undefined references to `__fprintf_chk' follow
          /usr/bin/ld: /home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka_sys-4c2ff55f733870e3.rlib(rdkafka_request.o): in function `snprintf':
          /usr/include/x86_64-linux-gnu/bits/stdio2.h:67: undefined reference to `__snprintf_chk'
          /usr/bin/ld: /home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka_sys-4c2ff55f733870e3.rlib(rdkafka_request.o): in function `fprintf':
          /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka_sys-4c2ff55f733870e3.rlib(rdkafka_request.o):/usr/include/x86_64-linux-gnu/bits/stdio2.h:100: more undefined references to `__fprintf_chk' follow
          /usr/bin/ld: /home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka_sys-4c2ff55f733870e3.rlib(rdkafka_request.o): in function `snprintf':
          /usr/include/x86_64-linux-gnu/bits/stdio2.h:67: undefined reference to `__snprintf_chk'
          /usr/bin/ld: /home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka_sys-4c2ff55f733870e3.rlib(rdkafka_request.o): in function `fprintf':
          /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka_sys-4c2ff55f733870e3.rlib(rdkafka_request.o):/usr/include/x86_64-linux-gnu/bits/stdio2.h:100: more undefined references to `__fprintf_chk' follow
          /usr/bin/ld: /home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka_sys-4c2ff55f733870e3.rlib(rdkafka_cgrp.o): in function `snprintf':
          /usr/include/x86_64-linux-gnu/bits/stdio2.h:67: undefined reference to `__snprintf_chk'
          /usr/bin/ld: /home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka_sys-4c2ff55f733870e3.rlib(rdkafka_pattern.o): in function `snprintf':
          /usr/include/x86_64-linux-gnu/bits/stdio2.h:67: undefined reference to `__snprintf_chk'
          /usr/bin/ld: /home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka_sys-4c2ff55f733870e3.rlib(rdkafka_partition.o): in function `fprintf':
          /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka_sys-4c2ff55f733870e3.rlib(rdkafka_partition.o):/usr/include/x86_64-linux-gnu/bits/stdio2.h:100: more undefined references to `__fprintf_chk' follow
          /usr/bin/ld: /home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka_sys-4c2ff55f733870e3.rlib(rdkafka_partition.o): in function `snprintf':
          /usr/include/x86_64-linux-gnu/bits/stdio2.h:67: undefined reference to `__snprintf_chk'
          /usr/bin/ld: /home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka_sys-4c2ff55f733870e3.rlib(rdkafka_partition.o): in function `fprintf':
          /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka_sys-4c2ff55f733870e3.rlib(rdkafka_partition.o):/usr/include/x86_64-linux-gnu/bits/stdio2.h:100: more undefined references to `__fprintf_chk' follow
          /usr/bin/ld: /home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka_sys-4c2ff55f733870e3.rlib(rdkafka_partition.o): in function `snprintf':
          /usr/include/x86_64-linux-gnu/bits/stdio2.h:67: undefined reference to `__snprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:67: undefined reference to `__snprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:67: undefined reference to `__snprintf_chk'
          /usr/bin/ld: /home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka_sys-4c2ff55f733870e3.rlib(rdkafka_assignor.o): in function `snprintf':
          /usr/include/x86_64-linux-gnu/bits/stdio2.h:67: undefined reference to `__snprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:67: undefined reference to `__snprintf_chk'
          /usr/bin/ld: /home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka_sys-4c2ff55f733870e3.rlib(rdkafka_feature.o):/usr/include/x86_64-linux-gnu/bits/stdio2.h:67: more undefined references to `__snprintf_chk' follow
          /usr/bin/ld: /home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka_sys-4c2ff55f733870e3.rlib(crc32c.o): in function `fprintf':
          /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka_sys-4c2ff55f733870e3.rlib(crc32c.o):/usr/include/x86_64-linux-gnu/bits/stdio2.h:100: more undefined references to `__fprintf_chk' follow
          /usr/bin/ld: /home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka_sys-4c2ff55f733870e3.rlib(rdaddr.o): in function `snprintf':
          /usr/include/x86_64-linux-gnu/bits/stdio2.h:67: undefined reference to `__snprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:67: undefined reference to `__snprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:67: undefined reference to `__snprintf_chk'
          /usr/bin/ld: /home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka_sys-4c2ff55f733870e3.rlib(rdaddr.o): in function `memcpy':
          /usr/include/x86_64-linux-gnu/bits/string_fortified.h:34: undefined reference to `__memcpy_chk'
          /usr/bin/ld: /home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka_sys-4c2ff55f733870e3.rlib(rdaddr.o): in function `strcpy':
          /usr/include/x86_64-linux-gnu/bits/string_fortified.h:90: undefined reference to `__memcpy_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/string_fortified.h:90: undefined reference to `__memcpy_chk'
          /usr/bin/ld: /home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka_sys-4c2ff55f733870e3.rlib(rdlist.o): in function `printf':
          /usr/include/x86_64-linux-gnu/bits/stdio2.h:107: undefined reference to `__printf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:107: undefined reference to `__printf_chk'
          /usr/bin/ld: /home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka_sys-4c2ff55f733870e3.rlib(rdstring.o): in function `snprintf':
          /usr/include/x86_64-linux-gnu/bits/stdio2.h:67: undefined reference to `__snprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:67: undefined reference to `__snprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:67: undefined reference to `__snprintf_chk'
          /usr/bin/ld: /home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka_sys-4c2ff55f733870e3.rlib(rdkafka_metadata.o): in function `fprintf':
          /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka_sys-4c2ff55f733870e3.rlib(rdkafka_metadata_cache.o): in function `fprintf':
          /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka_sys-4c2ff55f733870e3.rlib(rdkafka_sasl.o): in function `snprintf':
          /usr/include/x86_64-linux-gnu/bits/stdio2.h:67: undefined reference to `__snprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:67: undefined reference to `__snprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:67: undefined reference to `__snprintf_chk'
          /usr/bin/ld: /home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka_sys-4c2ff55f733870e3.rlib(rdkafka_msgset_reader.o): in function `fprintf':
          /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka_sys-4c2ff55f733870e3.rlib(rdkafka_msgset_reader.o): in function `snprintf':
          /usr/include/x86_64-linux-gnu/bits/stdio2.h:67: undefined reference to `__snprintf_chk'
          /usr/bin/ld: /home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka_sys-4c2ff55f733870e3.rlib(rdvarint.o): in function `fprintf':
          /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka_sys-4c2ff55f733870e3.rlib(rdvarint.o):/usr/include/x86_64-linux-gnu/bits/stdio2.h:100: more undefined references to `__fprintf_chk' follow
          /usr/bin/ld: /home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka_sys-4c2ff55f733870e3.rlib(snappy.o): in function `snprintf':
          /usr/include/x86_64-linux-gnu/bits/stdio2.h:67: undefined reference to `__snprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:67: undefined reference to `__snprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:67: undefined reference to `__snprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:67: undefined reference to `__snprintf_chk'
          /usr/bin/ld: /home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka_sys-4c2ff55f733870e3.rlib(rdhdrhistogram.o): in function `fprintf':
          /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka_sys-4c2ff55f733870e3.rlib(rdhdrhistogram.o):/usr/include/x86_64-linux-gnu/bits/stdio2.h:100: more undefined references to `__fprintf_chk' follow
          /usr/bin/ld: /home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka_sys-4c2ff55f733870e3.rlib(rdkafka_plugin.o): in function `snprintf':
          /usr/include/x86_64-linux-gnu/bits/stdio2.h:67: undefined reference to `__snprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:67: undefined reference to `__snprintf_chk'
          /usr/bin/ld: /home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka_sys-4c2ff55f733870e3.rlib(rdlog.o): in function `fprintf':
          /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka_sys-4c2ff55f733870e3.rlib(rdlog.o): in function `snprintf':
          /usr/include/x86_64-linux-gnu/bits/stdio2.h:67: undefined reference to `__snprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:67: undefined reference to `__snprintf_chk'
          /usr/bin/ld: /home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka_sys-4c2ff55f733870e3.rlib(rdlog.o): in function `fprintf':
          /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
          /usr/bin/ld: /home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka_sys-4c2ff55f733870e3.rlib(rdlog.o): in function `printf':
          /usr/include/x86_64-linux-gnu/bits/stdio2.h:107: undefined reference to `__printf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:107: undefined reference to `__printf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:107: undefined reference to `__printf_chk'
          /usr/bin/ld: /home/loomaclin/IdeaProjects/test_kafka_musl/target/x86_64-unknown-linux-musl/debug/deps/librdkafka_sys-4c2ff55f733870e3.rlib(rddl.o): in function `snprintf':
          /usr/include/x86_64-linux-gnu/bits/stdio2.h:67: undefined reference to `__snprintf_chk'
          /usr/bin/ld: /usr/include/x86_64-linux-gnu/bits/stdio2.h:67: undefined reference to `__snprintf_chk'
          collect2: error: ld returned 1 exit status


error: aborting due to previous error

error: Could not compile `test_kafka_musl`.

To learn more, run the command again with --verbose.
```
