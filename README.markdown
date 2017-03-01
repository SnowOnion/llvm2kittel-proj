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

## 现在可以用API构造一组重写规则了:
```
std::list<ref<Rule> > myKittelizedRules({
    Rule::create(
            Term::create("eval_main_start",std::list<ref<Polynomial> >({Polynomial::create("v_y.0"),Polynomial::create("v_r.0"),Polynomial::create("v_1")})),
            Term::create("eval_main_bb0_in",std::list<ref<Polynomial> >({Polynomial::create("v_y.0"),Polynomial::create("v_r.0"),Polynomial::create("v_1")})),
            True::create())
    ,Rule::create(
            Term::create("eval_main_bb0_in",std::list<ref<Polynomial> >({Polynomial::create("v_y.0"),Polynomial::create("v_r.0"),Polynomial::create("v_1")})),
            Term::create("eval_main_bb1_in",std::list<ref<Polynomial> >({Polynomial::create("nondef.0"),Polynomial::create("1"),Polynomial::create("v_1")})),
            True::create())
    ,Rule::create(
            Term::create("eval_main_bb1_in",std::list<ref<Polynomial> >({Polynomial::create("v_y.0"),Polynomial::create("v_r.0"),Polynomial::create("v_1")})),
            Term::create("eval_main_bb1_in",std::list<ref<Polynomial> >({Polynomial::create("v_y.0")->sub(Polynomial::one),Polynomial::create("0"),Polynomial::create("v_y.0")->sub(Polynomial::one)})),
            Atom::create(Polynomial::create("v_y.0"),Polynomial::null,Atom::AType::Gtr))
    ,Rule::create(
            Term::create("eval_main_bb1_in",std::list<ref<Polynomial> >({Polynomial::create("v_y.0"),Polynomial::create("v_r.0"),Polynomial::create("v_1")})),
            Term::create("eval_main_bb2_in",std::list<ref<Polynomial> >({Polynomial::create("v_y.0"),Polynomial::create("v_r.0"),Polynomial::create("v_y.0")->sub(Polynomial::one)})),
            Atom::create(Polynomial::create("v_y.0"),Polynomial::null,Atom::AType::Leq))
    ,Rule::create(
            Term::create("eval_main_bb2_in",std::list<ref<Polynomial> >({Polynomial::create("v_y.0"),Polynomial::create("v_r.0"),Polynomial::create("v_1")})),
            Term::create("eval_main_stop",std::list<ref<Polynomial> >({Polynomial::create("v_y.0"),Polynomial::create("v_r.0"),Polynomial::create("v_1")})),
            True::create())
});
```

这个 myKittelizedRules 完全模仿了 llvm2kittel 生成的 kittelizedRules。

可喜的是，把 myKittelizedRules 喂给原来的 slicer，能得到预期的化简结果。

但是构造 slicer （llvm2kittel.cpp [718行](https://github.com/SnowOnion/llvm2kittel-proj/blob/d2a5c9eeb9b93f14c1c6d4ea2080518a50a665e6/tools/llvm2kittel.cpp#L718)）
```
Slicer slicer(curr, converter.getPhiVariables());
```
需要指向该函数的指针 `curr` 以及之前转换过程中得到的 phi 语句中的变量 `converter.getPhiVariables()`。

## 啊

```
➜  cmake-build-debug git:(master) ✗ clang -S -emit-llvm -o power.ll -c power.c -O3
➜  cmake-build-debug git:(master) ✗ clang -emit-llvm -o power.bc -c power.c -O3

-O0 没有 phi, -O3 有 phi。

```

想过用 kittel 里的 parse 模块（它肯定要parse的吧），但是似乎是 OCaml 写的，残念。 https://github.com/s-falke/kittel-koat/search?utf8=%E2%9C%93&q=parse

## 2017-2-10实验

myKittelizedRulesWithMoreRule, slice 不会去掉 more rule。那是 condense 的活儿。

myKittelizedRulesWithMoreVar, slice 会去掉那个 baka 变量！本来就是做这个事的……

myKittelizedRulesIsoVar // 变量同构地改名，仍然能slice

myKittelizedRulesIsoVarAndFunc // 状态(还是叫函数？)同构地改名，不能slice了！得到slicedRules为空

`slicedRules = slicer.sliceStillUsed(slicedRules, conservativeSlicing);` // conservativeSlicing 的默认值是 false，导致 sliceStillUsed 函数从来用不到 m_phiVars。slicer 里唯一用到 m_phiVars 的就是 sliceStillUsed 函数。所以，构造 slicer 时传入的 phiVars 没用……

在找 Converter.m_controlPoints 被那些地方修改时，发现
`void Converter::visitCallInst(llvm::CallInst &I)`
和
`void Converter::visitSelectInst(llvm::SelectInst &I)``
都没有被使用…… 什么心态

## slice 纯ness 分析 && 纯化尝试

+ 1 sliceUsage
+ 2 sliceConstraint
+ 3 sliceDefined
+ 4 sliceStillUsed
+ 5 sliceTrivialNondefConstraints
+ 6 sliceDuplicates 太好了！纯函数

## 下一些结论 2017-02-22

### [1/2] condense 阶段
+ m_controlPoints 里的状态名是：
    + 所有 eval_<函数名>_<Basic Block 名>_in
    + eval_<函数名>_start
    + eval_<函数名>_stop
    + （或者说，排除了所有 eval_<函数名>_<Basic Block 名>_out）
+ condense 之后，留下的 rule 的左右两边，都只有 m_controlPoints 里的状态。

后果（Consequence）：如果自己构造 rule、自己给状态命名，则需要输入如下信息：要在 condense 后的 rules 里保留哪些状态。

于是，似乎，condense 算法做的重要工作是：在合并 rule 的时候，计算各个参数的值的变化效果之和。

+ m_var 里总是第一条 rule 的左手边的全部参数

后果：我们可以从输入的 rules 里轻松提取出 m_var。

### [2/2] slice 阶段


## 纯化的slicer测试结果

### 1. myKittelizedRulesWithMoreVar

```
====Outputting myKittelizedRulesWithMoreVar:
eval_main_start(v_y.0, v_r.0, v_1, baka) -> eval_main_bb0_in(v_y.0, v_r.0, v_1, baka)
eval_main_bb0_in(v_y.0, v_r.0, v_1, baka) -> eval_main_bb1_in(nondef.0, 1, v_1, baka)
eval_main_bb1_in(v_y.0, v_r.0, v_1, baka) -> eval_main_bb1_in(v_y.0 - 1, 0, v_y.0 - 1, baka) [ v_y.0 > 0 ]
eval_main_bb1_in(v_y.0, v_r.0, v_1, baka) -> eval_main_bb2_in(v_y.0, v_r.0, v_y.0 - 1, baka) [ v_y.0 <= 0 ]
eval_main_bb2_in(v_y.0, v_r.0, v_1, baka) -> eval_main_stop(v_y.0, v_r.0, v_1, baka)
====Outputting myKittelizedRulesWithMoreVar done.
====Outputting [6/6] after sliceDuplicates:
eval_main_start() -> eval_main_bb0_in()
eval_main_bb0_in() -> eval_main_bb1_in(nondef.0)
eval_main_bb1_in(v_y.0) -> eval_main_bb1_in(v_y.0 - 1) [ v_y.0 > 0 ]
eval_main_bb1_in(v_y.0) -> eval_main_bb2_in() [ v_y.0 <= 0 ]
eval_main_bb2_in() -> eval_main_stop()
====Outputting [6/6] after sliceDuplicates done.
```

### 2. myKittelizedRulesIsomorphismVar

```
====Outputting myKittelizedRulesIsomorphismVar:
eval_main_start(yyy, rrr, ichi) -> eval_main_bb0_in(yyy, rrr, ichi)
eval_main_bb0_in(yyy, rrr, ichi) -> eval_main_bb1_in(nondef.0, 1, ichi)
eval_main_bb1_in(yyy, rrr, ichi) -> eval_main_bb1_in(yyy - 1, 0, yyy - 1) [ yyy > 0 ]
eval_main_bb1_in(yyy, rrr, ichi) -> eval_main_bb2_in(yyy, rrr, yyy - 1) [ yyy <= 0 ]
eval_main_bb2_in(yyy, rrr, ichi) -> eval_main_stop(yyy, rrr, ichi)
====Outputting myKittelizedRulesIsomorphismVar done.
====Outputting [6/6] after sliceDuplicates:
eval_main_start() -> eval_main_bb0_in()
eval_main_bb0_in() -> eval_main_bb1_in(nondef.0)
eval_main_bb1_in(yyy) -> eval_main_bb1_in(yyy - 1) [ yyy > 0 ]
eval_main_bb1_in(yyy) -> eval_main_bb2_in() [ yyy <= 0 ]
eval_main_bb2_in() -> eval_main_stop()
====Outputting [6/6] after sliceDuplicates done.
```

### 3. myKittelizedRulesIsoVarAndFunc

```
====Outputting myKittelizedRulesIsoVarAndFunc:
state0(yyy, rrr, ichi) -> state1(yyy, rrr, ichi)
state1(yyy, rrr, ichi) -> state2(nondef.0, 1, ichi)
state2(yyy, rrr, ichi) -> state2(yyy - 1, 0, yyy - 1) [ yyy > 0 ]
state2(yyy, rrr, ichi) -> state3(yyy, rrr, yyy - 1) [ yyy <= 0 ]
state3(yyy, rrr, ichi) -> state4(yyy, rrr, ichi)
====Outputting myKittelizedRulesIsoVarAndFunc done.
====Outputting [6/6] after sliceDuplicates:
state0() -> state1()
state1() -> state2(nondef.0)
state2(yyy) -> state2(yyy - 1) [ yyy > 0 ]
state2(yyy) -> state3() [ yyy <= 0 ]
state3() -> state4()
====Outputting [6/6] after sliceDuplicates done.
```

## Author

原作: Stephan Falke, Jeroen Ketema, Marc Brockschmidt

改造：SnowOnion

## Papers

Stephan Falke, Deepak Kapur, Carsten Sinz:
[Termination Analysis of C Programs Using Compiler Intermediate Languages](http://dx.doi.org/10.4230/LIPIcs.RTA.2011.41).
RTA 2011: 41-50

Stephan Falke, Deepak Kapur, Carsten Sinz:
[Termination Analysis of Imperative Programs Using Bitvector Arithmetic](http://dx.doi.org/10.1007/978-3-642-27705-4_21).
VSTTE 2012: 261-277
