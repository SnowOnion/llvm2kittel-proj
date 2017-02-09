# llvm2KITTeL

llvm2KITTeL is a converter from LLVM's intermediate representation
into a format that can be handled by the automatic termination prover
[KITTeL](https://github.com/s-falke/kittel-koat).

## SnowOnion 的折腾

llvm2KITTeL 是用 CMake 组织起来的项目。为了看清代码的流程呢，我寻思着把本工程导入 Jetbrains 家的 IDE CLion 来断点调试。因为支持 CMake 的 IDE 我只用过 CLion（而且 CLion 新建项目默认就是用 CMake 来组织）。VS 和 Eclipse 大概也行，但是没用过。

在 macOS 上尝试失败了。因为缺 llvm-config 这个命令/程序。没搞懂，放弃了。

在 Linux (ubuntu 14.04) 上成功了。现在这个repo是编译之后的状态。如果你需要自己编译:

+ 下载或 git clone [s-falke/llvm2kittel](https://github.com/s-falke/llvm2kittel)
+ `sudo apt install clang llvm` 以满足 [llvm2kittel 的安装需求](INSTALL)
+ 下载 [CLion](https://www.jetbrains.com/clion/download/#section=linux-version) 并用 clion-版本号/bin/clion.sh 启动
+ 在 CLion 中新建 Project，并以 llvm2kittel 的根目录为 Location.
+ Run 菜单 - Run... - llvm2kittel，它会利用 CMakeList.txt 来编译
+ 编译成功则应该看到 llvm2kittel 执行并报出缺少输入文件的错误。在 Run 菜单 - Edit Configuration 配置一个带命令行参数的 run，[如图](doc/Pure3Phase_true-termination.bc.png) 。这个 Pure3Phase_true-termination.bc 在 [cmake-build-debug](cmake-build-debug) 目录下。
+ 执行和断点调试的样子见 [doc](doc)

##
对 [power.c](cmake-build-debug/power.c)的转换：

```
====Outputting kittelizedRules:
eval_main_start(v_y.0, v_r.0, v_1) -> eval_main_bb0_in(v_y.0, v_r.0, v_1)
eval_main_bb0_in(v_y.0, v_r.0, v_1) -> eval_main_bb1_in(nondef.0, 1, v_1)
eval_main_bb1_in(v_y.0, v_r.0, v_1) -> eval_main_bb1_in(v_y.0 - 1, 0, v_y.0 - 1) [ v_y.0 > 0 ]
eval_main_bb1_in(v_y.0, v_r.0, v_1) -> eval_main_bb2_in(v_y.0, v_r.0, v_y.0 - 1) [ v_y.0 <= 0 ]
eval_main_bb2_in(v_y.0, v_r.0, v_1) -> eval_main_stop(v_y.0, v_r.0, v_1)
====Outputting kittelizedRules done.
====Outputting slicedRules:
eval_main_start() -> eval_main_bb0_in()
eval_main_bb0_in() -> eval_main_bb1_in(nondef.0)
eval_main_bb1_in(v_y.0) -> eval_main_bb1_in(v_y.0 - 1) [ v_y.0 > 0 ]
eval_main_bb1_in(v_y.0) -> eval_main_bb2_in() [ v_y.0 <= 0 ]
eval_main_bb2_in() -> eval_main_stop()
====Outputting slicedRules done.
```

## 啊

```
➜  cmake-build-debug git:(master) ✗ clang -S -emit-llvm -o power.ll -c power.c -O3
➜  cmake-build-debug git:(master) ✗ clang -emit-llvm -o power.bc -c power.c -O3

-O0 没有 phi, -O3 有 phi。

```


## Author

Stephan Falke, Jeroen Ketema, Marc Brockschmidt

## Papers

Stephan Falke, Deepak Kapur, Carsten Sinz:
[Termination Analysis of C Programs Using Compiler Intermediate Languages](http://dx.doi.org/10.4230/LIPIcs.RTA.2011.41).
RTA 2011: 41-50

Stephan Falke, Deepak Kapur, Carsten Sinz:
[Termination Analysis of Imperative Programs Using Bitvector Arithmetic](http://dx.doi.org/10.1007/978-3-642-27705-4_21).
VSTTE 2012: 261-277
