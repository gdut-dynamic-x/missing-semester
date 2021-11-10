# 系列课程笔记

## 第一课：Shell

### 环境变量

终端通过环境变量（$PATH）来搜索程序的位置

![image-20211016115838831](/home/lht/.config/Typora/typora-user-images/image-20211016115838831.png)

which 程序可以帮助你搜索命令的可执行文件所在位置

![image-20211016120017328](https://typoranote-lht.oss-cn-guangzhou.aliyuncs.com/image/image-20211016120017328.png)

sudo su ：进入root模式，$ 符号在开头说明还不是root模式	

![image-20211016150023645](https://typoranote-lht.oss-cn-guangzhou.aliyuncs.com/image/image-20211016150023645.png)

**@**符号前面是**主机名**，用于在局域网中识别不同设备

### 切换登陆模式

Ctrl+Alt+F1：图形界面登陆方式

Ctrl+Alt+F2：纯命令行登陆方式

两种登陆方式在同一时间内只能存在一种，切换模式需要重新登陆。

### Linux文件系统

![img](https://typoranote-lht.oss-cn-guangzhou.aliyuncs.com/image/files_tree.jpg)

### 文件链接

#### 硬链接

相当于是指针，硬链接通过**索引节点号（Inode index）**指向磁盘分区中的一块内存。一块内存可以由多个硬链接指向（即一个文件可以有多个有效地址），当最后一个硬链接被删除时，这块内存才会被释放。

因为硬链接指向同一块内存，所以其中一个硬链接文件被修改，其他的硬链接文件也会被修改。

**创建方式**

**ln <源文件绝对路径> <链接文件路径>**

#### 软链接

相当于是快捷方式，包含这指向文件的位置信息

**创建方式**

**ln -s <源文件绝对路径> <链接文件路径>**

### 权限系统

sudo其实是切换用户的命令，用切换后的用户执行后面的命令，sudo后不加用户名则默认切换到root

**举例**
用sudo创建的文件，**其用户是root**，当我在当前用户时是修改不了这个文件的

![image-20211016161358051](https://typoranote-lht.oss-cn-guangzhou.aliyuncs.com/image/image-20211016161358051.png)

### 小知识

- ctrl -L可以清空终端


- copy两个文件的第二种方法：cat < hello1.txt > hello2.txt

### 常用命令

#### source 命令

**功能：**这个命令其实只是简单地读取脚本里面的语句**依次在当前 shell 里面执行**，没有建立新的子shell。那么脚本里面所有新建、改变变量的语句都会保存在当前 shell 里面。相当于是将脚本“**注册**”到了当前 shell 里面，脚本里面写的函数都可以**直接**在当前 shell 里面调用。

**实例：**

```shell
#bash.sh脚本内容
#!/usr/bin/bash
marco(){
	echo "hello shell "
}
#终端调用
source bash.sh
#source该脚本之后就可以直接调用marco函数了
marco
hello shell		#输出
```

#### xargs 命令

**功能：**

`xargs`命令的作用，是将标准输入**转为命令行参数**。

xargs命令常配合**管道 | **使用，因为有些命令不接受管道传来的标准输入，只接受命令行参数（如echo命令）。真正执行的命令大多跟在 xargs 后面

默认情况下：xargs 将空格作为命令分隔符，将标准输入以空格分隔为一个个命令行参数。 例如：` echo "one two three" | xargs mkdir`，这条命令的执行结果是创建了**3个文件夹**（one、two、three），因为字符串中间有空格，所以上条命令相当于:` mkdir one two three` 

**参数列表：**

`-d`参数

` -d `参数可以更改分隔符。例如`find . -name "*.txt" | xargs -d '\n' tar -cxvf txt.zip `，命令执行的结果为将本目录下所有的 txt 文件打包为一个 txt.zip 压缩包，因为find命令的标准输出是以换行符为分隔的各个文件，所以这里用`-d`参数换成 \n 分隔符。

**实例：**

```shell
echo "world" | xargs echo "hello"
#输出：hello world
echo "test_dir" | xargs mkdir
#输出：创建了一个名为“test_dir”的文件夹
find . -name "*.txt" | xargs -d '\n' tar -cxvf txt.zip
#输出：将本目录下所有的 txt 文件打包为一个 txt.zip 压缩包
```

#### grep 命令

常用的过滤命令。

**grep的使用规则:**

-  -n：表示显示行号
-  -i ：表示不区分大小写
-  -v：表示反向过滤
-  -E：允许使用延伸的正则表达式
-  [ ]：查找集合字符

#### sed 命令

sed 是一种在线编辑器，**它一次处理一行内容**。处理时，把当前处理的行存储在临时缓冲区中，称为“模式空间”（pattern space），接着用sed命令处理缓冲区中的内容，**处理完成后，把缓冲区的内容送往屏幕**。接着处理下一行，这样不断重复，直到文件末尾。文件内容并没有改变，除非你使用重定向存储输出。Sed主要用来自动编辑一个或多个文件；简化对文件的反复操作；编写转换程序等。

**格式：**

`sed [选项] [脚本命令] 文件名`

**选项：**

- -n：使用安静(silent)模式。在一般 sed 的用法中，所有来自 STDIN 的数据一般都会被列出到终端上。但如果加上 -n 参数后，则只有经过sed 特殊处理的那一行(或者动作)才会被列出来。
- -e：脚本命令：该选项会将其后跟的脚本命令添加到已有的命令中。 
- -f：脚本命令：该选项会将其后**文件**中的脚本命令添加到已有的命令中。
- -i [.后缀] ：直接**修改读取的文件内容**，而不是输出到终端。并且可以创建对应文件的备份（如果后缀正确）如 `sed -i.bak `。

**命令**

- **s**：替换指定字符（常搭配正则表达式使用）

- a：在当前行下面插入文本。

- i：在当前行上面插入文本。

- c：选定的行改为新的文本。

- d：删除，删除选择的行。

**实例：**

```shell

```

#### tee 命令

功能：

将一个标准输出写入到一个文件中。




## 第二课：Shell脚本

### 为什么是Shell脚本？

大多数shell都有自己的一套脚本语言，包括变量、控制流和自己的语法。shell脚本与其他脚本语言不同之处在于，shell脚本针对shell所从事的相关工作进行来优化。因此，创建命令流程（pipelines）、将结果保存到文件、从标准输入中读取输入，这些都是shell脚本中的原生操作，这让它比通用的脚本语言更易用。本节中，我们会专注于bash脚本，因为它最流行，应用更为广泛。

### 使用姿势

#### 变量赋值与访问

在bash中为变量**赋值**的语法是`foo=bar`；**访问**变量中存储的数值，其语法为 `$foo`。 需要注意的是，`foo = bar` （使用空格隔开）是不能正确工作的，因为解释器会调用程序`foo` 并将 `=` 和 `bar`作为参数。 总的来说，在shell脚本中使用**空格**会起到**分割参数**的作用，有时候可能会造成混淆，请务必多加检查。

#### 字符串

Bash中的字符串通过`'` 和 `"`分隔符来定义，但是它们的含义并不相同。以`'`定义的字符串为**原义字符串**，其中的变量不会被转义，而 `"`定义的字符串会**将变量值进行替换**。

```shell
foo=bar
echo "$foo"
# 打印 bar
echo '$foo'
# 打印 $foo
```

#### 控制流

和其他大多数的编程语言一样，`bash`也支持`if`, `case`, `while` 和 `for` 这些控制流关键字。同样地， , `bash` 也支持**函数**，它可以接受参数并基于参数进行操作。下面这个函数是一个例子，它会创建一个文件夹并使用`cd`进入该文件夹。

```shell
mcd () {
    mkdir -p "$1"
    cd "$1"
}
```

##### if 语句

**格式：**

```bash
if [[判断条件]]; then
执行条件
elif 
执行条件
else
执行条件
fi			#终止符
```

shell 编程中使用到得 if 语句内**判断参数**

　　–b 当file存在并且是块文件时返回真

　　-c 当file存在并且是字符文件时返回真

　　-d 当pathname存在并且是一个目录时返回真

　　-e 当pathname指定的文件或目录存在时返回真

　　-f 当file存在并且是正规文件时返回真

　　-g 当由pathname指定的文件或目录存在并且设置了SGID位时返回为真

　　-h 当file存在并且是符号链接文件时返回真，该选项在一些老系统上无效

　　-k 当由pathname指定的文件或目录存在并且设置了“粘滞”位时返回真

　　-p 当file存在并且是命令管道时返回为真

　　-r 当由pathname指定的文件或目录存在并且可读时返回为真

　　-s 当file存在文件大小大于0时返回真

　　-u 当由pathname指定的文件或目录存在并且设置了SUID位时返回真

　　-w 当由pathname指定的文件或目录存在并且可执行时返回真。一个目录为了它的内容被访问必然是可执行的。

　　-o 当由pathname指定的文件或目录存在并且被子当前进程的有效用户ID所指定的用户拥有时返回真。

　　UNIX Shell 里面比较字符写法：

　　-eq  等于

　　-ne  不等于

　　-gt  大于

　　-lt  小于

　　-le  小于等于

　　-ge  大于等于

　　-z  空串

　　=  两个字符相等

　　!=  两个字符不等

　　-n  非空串

##### for 语句

**格式：**

```bash
for XXX in XXX
do
	xxxxxx
done
```

#### 参数

上文的 `$1` 是脚本的第一个**参数**。与其他脚本语言不同的是，bash使用了很多特殊的变量来表示参数、错误代码和相关变量。下面是列举来其中一些变量，更完整的列表可以参考 [这里](https://www.tldp.org/LDP/abs/html/special-chars.html)。

- `$0` - 脚本名
- `$1` ～ `$9` - 脚本的参数。 `$1` 是第一个参数，依此类推。
- `$@` - 所有参数
- `$#` - 参数个数
- `$?` - 前一个命令的返回值
- `$$` - 当前脚本的进程识别码
- `!!` - 完整的上一条命令，包括参数。常见应用：当你因为权限不足执行命令失败时，可以使用 `sudo !!`再尝试一次。
- `$_` - 上一条命令的最后一个参数。如果你正在使用的是交互式shell，你可以通过按下 `Esc` 之后键入 . 来获取这个值。

#### 命令

命令通常使用 `STDOUT`来返回输出值，使用`STDERR` 来返回错误及错误码，便于脚本以更加友好的方式报告错误。 返回码或退出状态是脚本/命令之间交流执行状态的方式。**返回值0表示正常执行**，**其他所有非0的返回值都表示有错误发生。**

#### 短路运算符

退出码可以搭配`&&` (与操作符) 和 `||` (或操作符)使用，用来进行条件判断，决定是否执行其他程序。它们都属于短路[运算符](https://en.wikipedia.org/wiki/Short-circuit_evaluation)（short-circuiting） 同一行的多个命令可以用` ; `分隔。程序 `true` 的返回码永远是`0`，`false` 的返回码永远是`1`。

> 短路运算符的意思是，当运算符左边的命令为真时，右边的命令将**不会**再被执行

**实例：**

```shell
false || echo "Oops, fail"
# Oops, fail

true || echo "Will not be printed"
#

true && echo "Things went well"
# Things went well

false && echo "Will not be printed"
#

false ; echo "This will always run"
# This will always run
```

#### 命令替换

以变量的形式获取一个命令的输出，这可以通过 *命令替换* (*command substitution*)实现。

当您通过 `$( CMD )` 这样的方式来执行`CMD` 这个命令时，它的输出结果会替换掉 `$( CMD )` 。例如，如果执行 `for file in $(ls)` ，shell首先将调用`ls` ，然后遍历得到的这些返回值。还有一个冷门的类似特性是 *进程替换*（*process substitution*）， `<( CMD )` 会执行 `CMD` 并将结果输出到一个临时文件中，并将 `<( CMD )` 替换成临时文件名。这在我们希望返回值通过文件而不是STDIN传递时很有用。例如， `diff <(ls foo) <(ls bar)` 会显示文件夹 `foo` 和 `bar` 中文件的区别。

**例子：**

```shell
#!/bin/bash

echo "Starting program at $(date)" # date会被替换成日期和时间
#打印脚本名，输入参数个数，脚本进程号
echo "Running program $0 with $# arguments with pid $$"
#循环所有参数
for file in "$@"; do
    grep foobar "$file" > /dev/null 2> /dev/null
    # 如果模式没有找到，则grep退出状态为 1
    # 我们将标准输出流和标准错误流重定向到Null，因为我们并不关心这些信息
    if [[ $? -ne 0 ]]; then
        echo "File $file does not have any foobar, adding one"
        echo "# foobar" >> "$file"
    fi
done
```

本例实现的功能：

使用`grep` 搜索字符串 `foobar`，如果没有找到，则将其作为注释追加到文件中。

在条件语句中，我们比较 `$?` 是否等于0。 Bash实现了许多类似的比较操作，您可以查看 [`test 手册`](https://man7.org/linux/man-pages/man1/test.1.html)。 在bash中进行比较时，尽量使用双方括号 `[[ ]]` 而不是单方括号 `[ ]`，这样会降低犯错的几率

#### 通配符（globbing）

当执行脚本时，我们经常需要提供**形式类似**的参数。bash使我们可以轻松的实现这一操作，它可以基于文件扩展名展开表达式。这一技术被称为shell的 通配（ globbing）

当你想要利用通配符进行匹配时，你可以使用`?`来**匹配一个字符**，使用`*`号来**匹配任意多个字符**。例如，对于文件`foo`, `foo1`, `foo2`, `foo10` 和 `bar`, `rm foo?`这条命令会删除`foo1` 和 `foo2` ，而`rm foo*` 则会删除除了`bar`之外的所有文件。

**实例：**

```shell
convert image.{png,jpg}
# 会展开为
convert image.png image.jpg

cp /path/to/project/{foo,bar,baz}.sh /newpath
# 会展开为
cp /path/to/project/foo.sh /path/to/project/bar.sh /path/to/project/baz.sh /newpath

# 也可以结合通配使用
mv *{.py,.sh} folder
# 会移动所有 *.py 和 *.sh 文件

mkdir foo bar

# 下面命令会创建foo/a, foo/b, ... foo/h, bar/a, bar/b, ... bar/h这些文件
touch {foo,bar}/{a..h}
touch foo/x bar/y
# 比较文件夹 foo 和 bar 中包含文件的不同
diff <(ls foo) <(ls bar)
# 输出
# < x
# ---
# > y
```

#### shebang

shebang通常写在shell脚本的第一行，用于让内核知道用什么可执行文件去执行这个脚本，格式为`#![可执行文件路径]`

**实例：**

```bash
#!/usr/bin/bash
echo '这是一个shell脚本'
```

注意：一般只能选择一个可执行文件去解释这个脚本，不能像加入头文件一样混合使用。

#### 正则表达式

**简介：**

正则表达式是一种**匹配字符串**的方法，通过一些特殊符号，实现快速查找、删除、替换某个特定字符串。

字符分为：

普通字符：大小写字母、数字、标点符号及一些其他符号

元字符：在正则表达式中具有**特殊意义的专用字符**

元字符如下：

- ` .` 号：匹配除'\n'之外的任意**一个字符**(匹配一次)
- `[list]`：匹配 list 列表中的任意**一个字符** (方括号中如果是序列，则需要用`-`隔开，如[A-Z]代表A到Z的序列)
- `[^list]`：匹配**不在**list列表中的一个字符。
- `^`：匹配字符串**开始**的位置(注意这里的字符串指的是查找目标文本的字符串)
- `$`：匹配字符串**结束**的位置
- `*`：匹配前面子表达式**0次或者多次** 
- `\{n,m\}` ：匹配前面的子表达式n到m次，有\{n\}、 \{n,\\}、\\{n,m\\}三种格式(注意这里的匹配是**连续匹配**)
- \w 元字符:它相当于字符范围 [A-Za-z0-9_]
- \大写字母：大写字母代表小写字母的反义，\D 代表任何非数字字符，\S 代表任何非空白字符，而 \W 代表任何非字母数字字符（例如标点符号）
- \D 元字符：代表任何非数字字符
- ?：问号前面的一个字符可选可不选（如：ab?c代表abc或ac）

**实例：**

```shell
ls -l| grep -n "[A-Z]"	#查找含有A～Z中任意一个字符的字符串
ls -l | grep -n "A.*"	#查找以A为开头，\n为结尾的一段字符
ls -l | grep -n ".sh$"	#查找以.sh为结尾的字符串
ls -t | grep -n "^P"	#查找以P为开头的字符串
```

#### alias 命令

功能：修改其他命令的调用方式，相当于给其他命令改名字。

**格式：**

`alias [修改后]=[命令]`

**实例：**

```shell
alias sl=ls 	#使sl字符等价于ls的功能
unalias sl 		#删除sl命令
```



### 小知识

- z我们在写脚本时通常都是用重定向来进行写入的，很少用vim编辑器，所以重定向要熟练掌握

## VIM使用

### 三种模式

#### 命令模式

打开vim时自动进入，编辑模式下按“ESC”进入。此模式下，可使用方向键（上、下、左、右键）或 k、j、h、i 移动光标的位置，还可以对文件内容进行**复制、粘贴、替换、删除**等操作。

#### 输入模式

命令模式下按 i、I、a、A、o、O 等字符金均可进入。

#### 编辑模式

命令模式下输入冒号：即可进入

### 常用操作

- vim -r filenaVIM使用me ：恢复上一次打开时崩溃的文件
- vim -R filename ：以只读模式打开文件

- vim + filename ：打开文件并将光标置于最后一行行首
- vim +n filename ：打开文件并将光标至于第 n 行行首

### 常用命令

:term：新建一个终端并使vim和新终端**分屏显示**。通过输入exit命令终止新终端进程返回vim

## SSH 

用来连接远程服务器的命令。格式是：`ssh [主机名]@[主机地址]`

ssh的简单使用请查看[这里](https://www.digitalocean.com/community/tutorials/how-to-set-up-ssh-keys-2)

### .ssh目录介绍

#### id_rsa（私钥）文件

服务器上经过rsa算法生成的**私钥**。与公钥是一对的密钥对，**用于连接其他服务器**。这个文件很重要，**相当于是银行卡密码**。

#### id_rsa.pub（公钥）文件

服务器上经过rsa算法生成的**公钥**。与私钥是一对的密钥对，用于连接其他服务器用。这个文件相对不重要，相当于是**银行卡账号**。

> 将主机A的id_rsa.pub内容copy到B主机的authorized_keys文件中，这样A主机就能不通过密码连接到B主机。

#### authorized_keys（授权文件）

当把你的主机的**公钥**添加到服务器的`authorized_keys`文件中后，下次连接直接输入ssh master即可，不需要再次输入密码。

#### known_hosts（注册文件）

ssh会把你每个**你访问过计算机的公钥**(public key)都记录在~/.ssh/known_hosts文件中。当下次访问相同计算机时，OpenSSH会核对公钥。如果公钥不同，OpenSSH会发出警告， 避免你受到DNS Hijack之类的攻击。

#### config（配置文件）

开始可能没有config文件，我们需要自己新建一个config文件。在使用ssh连接服务器时，经常要输入一些不同的主机地址和密码，使用config文件可以很好的解决这个问题，也就是说我们能够通过**config文件能够实现免密登录**。

**配置内容：**
Host：服务名【可以随意取】
HostName：linux服务器ip/主机名/域名
User：用户名
Port：端口号默认为22

### 无需输入密码登陆服务器的方式

在服务器的`/home/.shh`目录下找到或创建一个名为` authorized_keys`的文件，将你的主机的公钥信息保存到该文件下，那么下次登陆时就无需输入密码了。

## 执行命令

`ssh` 的一个经常被忽视的特性是它可以直接远程执行命令。 `ssh foobar@server ls` 可以直接在用foobar的命令下执行 `ls` 命令。 想要配合管道来使用也可以， `ssh foobar@server ls | grep PATTERN` 会在本地查询远端 `ls` 的输出而 `ls | ssh foobar@server grep PATTERN` 会在远端对本地 `ls` 输出的结果进行查询。

## GPG工具简介

[中文简介](https://chengpengzhao.com/2020-03-04-ssh-yu-gpg-de-xue-xi-yu-shi-yong/#toc-heading-16)

[英文简介](https://www.digitalocean.com/community/tutorials/how-to-use-gpg-to-encrypt-and-sign-messages)

非对称加密简介：

非对称加密有两个基本概念：公钥和私钥。

公钥可以看作是邮箱地址，**数据接收方**将**公钥**发放给你，你根据这个**公钥加密数据**，相当于用这个邮箱地址发给指定用户；私钥相当于邮箱密码，当**数据接收方**收到数据时，会用**私钥去解密该数据**，如果成功解密，说明是由持有公钥的一方发过来的数据，相当于数据接收方用密码登陆邮箱去查看邮件。

另一种情况是，**数据发送方**为了让**数据接收方**确信该数据确实是由他发出的，发送方会提前给你一份“证书”（通常是你自己从发送方那里下载），称为“**数字证书**”。发送方在发送数据时，会用**私钥**加密制作一份“**数字签名**”，你接受到这份数字签名后用数字证书解密，成功解密则证明该数据确实是由指定发送方发出的。

### Git + GPG

初始配置：

```shell
#首先要给git config 配置GPG的密钥ID
gpg --list-keys 			#列出创建好的密钥，复制其中的ID
git config --global user.signingkey [public key ID]
```

1. 给 commit 提交加上数字签名：

```shell
git commit -S -m "sign"
```

2. 给 tag 标签加上数字签名：

```shell
git tag -s v1.5 -m 'my signed 1.5 tag'
```



## screen工具

**功能：**

当我们在服务器中跑一些大型的工程时，如果突然间服务器与本地断连，很容易导致某些关键文件被损坏，而screen工具能避免这种问题的出现。

- **会话恢复**

  只要Screen本身没有终止，在其**内部运行的会话都可以恢复**。这一点对于远程登录的用户特别有用——即使网络连接中断，用户也不会失去对已经打开的命令行会话的控制。只要再次登录到主机上执行`screen -r`就可以恢复会话的运行。同样在暂时离开的时候，也可以执行分离命令`detach`，在保证里面的程序正常运行的情况下让Screen挂起（切换到后台）。

- **多窗口**

  在Screen环境下，所有的会话都**独立地运行**，并拥有各自的编号、输入、输出和窗口缓存。用户可以通过快捷键在不同的窗口下切换，并可以自由的**重定向各个窗口的输入和输出**。Screen实现了基本的文本操作，如复制粘贴等；还提供了类似滚动条的功能，可以查看窗口状况的历史记录。窗口还可以被分区和命名，还可以监视后台窗口的活动。

- **会话共享**

  Screen可以让一个或多个用户**从不同终端多次登录一个会话**，**并共享会话的所有特性（比如可以看到完全相同的输出）**。它同时提供了窗口访问权限的机制，可以对窗口进行密码保护。

### 常见screen参数

`screen -S yourname`： 新建一个叫yourname的session
`screen -ls` -> 列出当前所有的session
`screen -r yourname`： 回到yourname这个session
`screen -d yourname`： 远程detach某个session
`screen -d -r yourname`： 结束当前session并回到yourname这个session

## 终端多路复用——tmux工具

- 会话

  \- 每个会话都是一个独立的工作区，其中包含一个或多个窗口

  - `tmux` 开始一个新的会话
  - `tmux new -s NAME` 以指定名称开始一个新的会话
  - `tmux ls` 列出当前所有会话
  - 在 `tmux` 中输入 `<C-b> d` ，将当前会话分离
  - `tmux a` 重新连接最后一个会话。您也可以通过 `-t` 来指定具体的会话

- 窗口

   

  \- 相当于编辑器或是浏览器中的标签页，从视觉上将一个会话分割为多个部分

  - `<C-b> c` 创建一个新的窗口，使用 `<C-d>`关闭
  - `<C-b> N` 跳转到第 *N* 个窗口，注意每个窗口都是有编号的
  - `<C-b> p` 切换到前一个窗口
  - `<C-b> n` 切换到下一个窗口
  - `<C-b> ,` 重命名当前窗口
  - `<C-b> w` 列出当前所有窗口

- 面板

   

  \- 像 vim 中的分屏一样，面板使我们可以在一个屏幕里显示多个 shell

  - `<C-b> "` 水平分割
  - `<C-b> %` 垂直分割
  - `<C-b> <方向>` 切换到指定方向的面板，<方向> 指的是键盘上的方向键
  - `<C-b> z` 切换当前面板的缩放
  - `<C-b> [` 开始往回卷动屏幕。您可以按下空格键来开始选择，回车键复制选中的部分
  - `<C-b> <空格>` 在不同的面板排布间切换

## 配置文件

很多程序的配置都是通过纯文本格式的被称作*点文件*的配置文件来完成的（之所以称为点文件，是因为它们的文件名以 `.` 开头，例如 `~/.vimrc`。也正因为此，它们默认是隐藏文件，`ls`并不会显示它们）。

shell 的配置也是通过这类文件完成的。在启动时，您的 shell 程序会读取很多文件以加载其配置项。根据 shell 本身的不同，您从登录开始还是以交互的方式完成这一过程可能会有很大的不同。

对于 `bash`来说，在大多数系统下，您可以通过编辑 `.bashrc` 或 `.bash_profile` 来进行配置。在文件中您可以添加需要在启动时执行的命令，例如上文我们讲到过的别名，或者是您的环境变量。

实际上，很多程序都要求您在 shell 的配置文件中包含一行类似 `export PATH="$PATH:/path/to/program/bin"` 的命令，这样才能确保这些程序能够被 shell 找到。

**还有一些其他的工具也可以通过点文件进行配置：**

- `bash` - `~/.bashrc`, `~/.bash_profile`
- `git` - `~/.gitconfig`
- `vim` - `~/.vimrc` 和 `~/.vim` 目录
- `ssh` - `~/.ssh/config`
- `tmux` - `~/.tmux.conf`

### 配置文件可移植性

配置文件的一个常见的痛点是它可能并不能在多种设备上生效。例如，如果您在不同设备上使用的操作系统或者 shell 是不同的，则配置文件是无法生效的。或者，有时您仅希望特定的配置只在某些设备上生效。

有一些技巧可以轻松达成这些目的。如果配置文件 if 语句，则您可以借助它针对不同的设备编写不同的配置。例如，您的 shell 可以这样做：

```shell
if [[ "$(uname)" == "Linux" ]]; then {do_something}; fi

# 使用和 shell 相关的配置时先检查当前 shell 类型
if [[ "$SHELL" == "zsh" ]]; then {do_something}; fi

# 您也可以针对特定的设备进行配置
if [[ "$(hostname)" == "myServer" ]]; then {do_something}; fi
```

## Git版本管理工具

### 常用命令

#### merge

merge 通常是将别人的分支合并到自己的分支上，当两个分支的代码没有冲突时（即代码上的修改不在同一行），你的代码和其他分支的代码将会拼接在一起。

#### git blame 

显示**文件的每一行**最后修改的版本和作者

格式：

```shell
git blame [option] [file_name]
```

...



## OpenSSL工具

`openssl`可以实现：秘钥证书管理、对称加密和非对称加密。

### genrsa 指令

**格式：**

```shell
openssl genrsa [args] [numbits] 
```

```shell
args1 对生成的私钥文件是否要使用加密算法进行对称加密: 
    -des : CBC模式的DES加密 
    -des3 : CBC模式的3DES加密 
    -aes128 : CBC模式的AES128加密 
    -aes192 : CBC模式的AES192加密 
    -aes256 : CBC模式的AES256加密 
args2 对称加密密码
    -passout passwords
    其中passwords为对称加密(des、3des、aes)的密码(使用这个参数就省去了console交互提示输入密码的环节) 
args3 输出文件
    -out file : 输出证书私钥文件 
[numbits]: 密钥长度，理解为私钥长度 
```



