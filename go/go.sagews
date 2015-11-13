︠a507d2c5-2bcb-47b7-bca3-cf16eeabc7dai︠
%md
# The Official Go Language Tutorial
(Actually, this is an **unofficial** in SageMathCloud of the official tutorial.)
︡633a2d0e-fb94-4acd-b3c0-9d5e12426a71︡{"html":"<h1>The Official Go Language Tutorial</h1>\n\n<p>(Actually, this is an <strong>unofficial</strong> in SageMathCloud of the official tutorial.)</p>\n"}︡
︠b2ee82ef-ac42-4121-8001-38b8e7edf2e4i︠
%html <img src="http://golang.org/doc/gopher/gopherbw.png" style='width:128px'>
%md
Let's take the official Go tour: <http://tour.golang.org> using SageMathCloud.

**Instructions:**

- To use this, open the file `go.sagews` in any SageMathCloud project at <https://cloud.sagemath.com>

- Edit code in cells and press shift+enter to evaluate it.

- Insert new cells by clicking the blue bar between cells.

- Put %go at the beggining of cells to evaluate code using go.

- Double click on text if you want to change it.


︡a6cf955b-fbd4-4d62-b50a-f33ac3fdb619︡{"html":"<img src=\"http://golang.org/doc/gopher/gopherbw.png\" style='width:128px'>"}︡{"html":"<p>Let&#8217;s take the official Go tour: <a href=\"http://tour.golang.org\">http://tour.golang.org</a> using SageMathCloud.</p>\n\n<p><strong>Instructions:</strong></p>\n\n<ul>\n<li><p>To use this, open the file <code>go.sagews</code> in any SageMathCloud project at <a href=\"https://cloud.sagemath.com\">https://cloud.sagemath.com</a></p></li>\n<li><p>Edit code in cells and press shift+enter to evaluate it.</p></li>\n<li><p>Insert new cells by clicking the blue bar between cells.</p></li>\n<li><p>Put %go at the beggining of cells to evaluate code using go.</p></li>\n<li><p>Double click on text if you want to change it.</p></li>\n</ul>\n"}︡
︠d4d6060e-9990-49e9-b1d0-e0699b49cf9c︠
# Here's the documentation for the "%go" magic command.  Put %go at the beginning of each cell
# (or put '%default_mode go' in a cell)
go?
︡073dbca2-b879-4153-bf7f-87b6bc6035ca︡{"stdout":"   File: /projects/ebf87cdc-c0e2-46c9-b242-87d96eaee5f6\n   Docstring:\n   x.__init__(...) initializes x; see help(type(x)) for signature\n\n"}︡
︠b0fc8db6-a923-4c6b-b2ea-3bfd3827a133i︠
%md
# Hello, 世界
︡4033400a-4dc0-4266-b983-58756560bb1e︡{"html":"<h1>Hello, 世界</h1>\n"}︡
︠a9ab947a-33ab-44b3-8a6c-044118d6b474︠
%go

func main() {
    fmt.Println("Hello, 世界")
}
︡83049d0c-256c-41f2-97a3-1d054724b232︡{"stdout":"Hello, 世界\n"}︡
︠98a4076b-4e1d-4e46-ba2a-74a141cc5dd9i︠
%md
# This Go Playground

The SageMathCloud "sandbox" is actually **not** restrictive like the official go one.  You can do anything.
︡c676201f-7ba9-46fb-a386-822f4d468dec︡{"html":"<h1>This Go Playground</h1>\n\n<p>The SageMathCloud &#8220;sandbox&#8221; is actually <strong>not</strong> restrictive like the official go one.  You can do anything.</p>\n"}︡
︠39bbae34-982e-4ded-bc61-239c0206e8c8︠
%go
import (
    "net"
    "os"
    "time"
)

func main() {
    fmt.Println("Welcome to the playground!")

    fmt.Println("The time is", time.Now())

    fmt.Println("And if you try to open a file:")
    fmt.Println(os.Open("filename"))

    fmt.Println("Or access the network:")
    fmt.Println(net.Dial("tcp", "google.com"))
}
︡4cc20eb0-05f2-4d8a-b940-02a51c4cc767︡{"stdout":"Welcome to the playground!\nThe time is 2014-06-04 15:42:37.395352624 +0000 UTC\nAnd if you try to open a file:\n<nil> open filename: no such file or directory\nOr access the network:\n<nil> dial tcp: missing port in address google.com\n"}︡
︠1403d0ee-14cd-4f37-9dfc-6879895e7a7ei︠
%md
# Packages
Every Go program is made up of packages.

Programs start running in package main.

This program is using the packages with import paths `"fmt"` and `"math/rand"`.

By convention, the package name is the same as the last element of the import path. For instance, the `"math/rand"` package comprises files that begin with the statement package rand.
︡b453c6b5-2c1a-44ea-ab9c-682f8775284e︡{"html":"<h1>Packages</h1>\n\n<p>Every Go program is made up of packages.</p>\n\n<p>Programs start running in package main.</p>\n\n<p>This program is using the packages with import paths <code>\"fmt\"</code> and <code>\"math/rand\"</code>.</p>\n\n<p>By convention, the package name is the same as the last element of the import path. For instance, the <code>\"math/rand\"</code> package comprises files that begin with the statement package rand.</p>\n"}︡
︠da8d83ff-bad3-4f2d-a333-fc5e024e3730︠
%go

import (
    "time"
    "math/rand"
)

func main() {
    rand.Seed(2);
    fmt.Println("My favorite number is", rand.Intn(10))
    fmt.Println("The time is", time.Now())
}
︡747ef475-5938-4d9f-b4f7-ad277648c2cf︡{"stdout":"My favorite number is 6\nThe time is 2014-06-04 15:43:14.665529256 +0000 UTC\n"}︡
︠7f8a7197-b463-4f9c-81fb-e51c414a7e5ci︠
%md
# Imports

The above code groups the imports into a parenthesized, "factored" import statement. You can also write multiple import statements, like this:
︡33f9eed6-6f5d-46cb-851a-03648c4179e3︡{"html":"<h1>Imports</h1>\n\n<p>The above code groups the imports into a parenthesized, &#8220;factored&#8221; import statement. You can also write multiple import statements, like this:</p>\n"}︡
︠942827bb-76ac-4a0b-bf20-9a0f7f7e5d39︠
%go

import "time"
import "math"

func main() {
    fmt.Printf("Now you have %g problems.",
        math.Nextafter(2, 3))
    fmt.Println("The time is", time.Now())
}
︡c963cf4c-dc39-496e-b7ea-0c43854cae26︡{"stdout":"Now you have 2.0000000000000004 problems.The time is 2014-06-04 15:43:27.118208726 +0000 UTC\n"}︡
︠17f2ba92-75b6-4770-9389-5a8ffb7efb36i︠
%md
# Exported names

After importing a package, you can refer to the names it exports.

In Go, a name is exported if it begins with a capital letter.

Foo is an exported name, as is FOO. The name foo is not exported.

Run the code. Then rename math.pi to math.Pi and try it again.

**You should see an error below before you change math.pi to math.Pi, then press shift+enter.**
︡f7a648ed-47b0-4223-acd3-4743463b701e︡{"html":"<h1>Exported names</h1>\n\n<p>After importing a package, you can refer to the names it exports.</p>\n\n<p>In Go, a name is exported if it begins with a capital letter.</p>\n\n<p>Foo is an exported name, as is FOO. The name foo is not exported.</p>\n\n<p>Run the code. Then rename math.pi to math.Pi and try it again.</p>\n\n<p><strong>You should see an error below before you change math.pi to math.Pi, then press shift+enter.</strong></p>\n"}︡
︠d00bad60-c3c2-41f1-b730-b8fda6212b64︠
%go
import (
    "math"
)

func main() {
    fmt.Println(math.pi)
}
︡1b353f8e-adbb-4c36-aa24-b440c226c91a︡{"stderr":"# command-line-arguments\n./616efe99-b8c6-4979-a40b-d7147925506e.go:8: cannot refer to unexported name math.pi\n./616efe99-b8c6-4979-a40b-d7147925506e.go:8: undefined: math.pi\n"}︡
︠726d13ca-d322-4aae-a6c9-115d65426964i︠
%md

# Functions
A function can take zero or more arguments.

In this example, add takes two parameters of type int.

Notice that the type comes after the variable name.
︡75a3fc7b-78f0-4f9d-beea-9e0fc71d1122︡{"html":"<h1>Functions</h1>\n\n<p>A function can take zero or more arguments.</p>\n\n<p>In this example, add takes two parameters of type int.</p>\n\n<p>Notice that the type comes after the variable name.</p>\n"}︡
︠ebcb8f76-fa31-4a7d-b161-086092da607c︠
%go

func add(x int, y int) int {
    return x + y
}


func main() {
    fmt.Println(add(42, 13))
}
︡33ae5396-32a5-4dce-b264-34703e0f58b3︡{"stdout":"55\n"}︡
︠ef2e9cd4-7fa7-4d7d-bac2-958ffe3fc419i︠

%md
# Functions continued

When two or more consecutive named function parameters share a type, you can omit the type from all but the last.

In this example, we shortened

    x int, y int

to

    x, y int
︡67df1e5c-7377-4dc3-a629-1337776d0045︡{"html":"<h1>Functions continued</h1>\n\n<p>When two or more consecutive named function parameters share a type, you can omit the type from all but the last.</p>\n\n<p>In this example, we shortened</p>\n\n<pre><code>x int, y int\n</code></pre>\n\n<p>to</p>\n\n<pre><code>x, y int\n</code></pre>\n"}︡
︠f5d5b2b4-dc27-41f5-886a-24bbce62c4d2︠
%go

func add(x, y int) int {
    return x + y
}

func main() {
    fmt.Println(add(42, 13))
}
︡f88fe49a-0df6-4a26-abab-3e70947714f6︡{"stdout":"55\n"}︡
︠dd18ca77-be96-4399-bda6-94f78f5a1e0bi︠

%md

# Multiple results

A function can return any number of results.

This function returns two strings.
︡ea65b551-111d-4b16-8379-86cf4773e66b︡{"html":"<h1>Multiple results</h1>\n\n<p>A function can return any number of results.</p>\n\n<p>This function returns two strings.</p>\n"}︡
︠f5c5446d-2463-4f41-aaa9-d9c74dd4517b︠
%go

func swap(x, y string) (string, string) {
    return y, x
}

func main() {
    a, b := swap("hello", "world")
    fmt.Println(a, b)
}
︡332b933b-b25f-47ca-97e0-94b6f11407af︡{"stdout":"world hello\n"}︡
︠336b908b-5246-4a93-b8da-5db30da500b4i︠
%md
# Named results

Functions take parameters. In Go, functions can return multiple "result parameters", not just a single value. They can be named and act just like variables.

If the result parameters are named, a return statement without arguments returns the current values of the results.
︡bc7d538c-3c49-4eac-b38a-7dfdbb95da34︡{"html":"<h1>Named results</h1>\n\n<p>Functions take parameters. In Go, functions can return multiple &#8220;result parameters&#8221;, not just a single value. They can be named and act just like variables.</p>\n\n<p>If the result parameters are named, a return statement without arguments returns the current values of the results.</p>\n"}︡
︠c1b32003-c671-448b-839b-b1bc83e8b07a︠
%go

func split(sum int) (x, y int) {
    x = sum * 4 / 9
    y = sum - x
    return
}

func main() {
    fmt.Println(split(17))
}
︡2ec82183-c07e-47c7-a4f6-07d1fcfafcf5︡{"stdout":"7 10\n"}︡
︠dc6d5e85-4ef1-476a-aef4-1ccd872aebadi︠

%md
# Variables

The `var` statement declares a list of variables; as in function argument lists, the type is last.
︡f45dccfd-dbd6-445c-8006-750af4e06ec3︡{"html":"<h1>Variables</h1>\n\n<p>The <code>var</code> statement declares a list of variables; as in function argument lists, the type is last.</p>\n"}︡
︠397a4a38-4f0c-4b2c-9422-b4d34771bcea︠
%go

var i int
var c, python, java bool

func main() {
    fmt.Println(i, c, python, java)
}
︡f81e46bf-e016-4a36-b1a8-9b991178ff13︡{"stdout":"0 false false false\n"}︡
︠03b52590-fcd1-4abf-b47e-8f0adfc0106ai︠
%md
# Variables with initializers

A var declaration can include initializers, one per variable.

If an initializer is present, the type can be omitted; the variable will take the type of the initializer.
︡a7b46461-53e1-4a9b-92b7-76492b0054c0︡{"html":"<h1>Variables with initializers</h1>\n\n<p>A var declaration can include initializers, one per variable.</p>\n\n<p>If an initializer is present, the type can be omitted; the variable will take the type of the initializer.</p>\n"}︡
︠1ebd232c-93ee-464a-9a7d-a2f548be598f︠
%go

var i, j int = 1, 2
var c, python, java = true, false, "no!"

func main() {
    fmt.Println(i, j, c, python, java)
}
︡7a8803dd-f5fe-4f13-a2af-6ee3b5fa2283︡{"stdout":"1 2 true false no!\n"}︡
︠5ecf011b-e8c0-46d5-950c-1f97839e4ecdi︠
%md
# Short variable declarations

Inside a function, the := short assignment statement can be used in place of a var declaration with implicit type.

Outside a function, every construct begins with a keyword (var, func, and so on) and the := construct is not available.
︡10985086-f7ce-4dcb-a449-f30f7896001a︡{"html":"<h1>Short variable declarations</h1>\n\n<p>Inside a function, the := short assignment statement can be used in place of a var declaration with implicit type.</p>\n\n<p>Outside a function, every construct begins with a keyword (var, func, and so on) and the := construct is not available.</p>\n"}︡
︠4aca37c2-5b00-4be8-aff3-255bb7747a7fs︠
%go
func main() {
    var i, j int = 1, 2
    k := 3
    c, python, java := true, false, "no!"

    fmt.Println(i, j, k, c, python, java)
}
︡ededb9dd-177c-498f-809e-bb1582b19f46︡︡{"stdout":"1 2 3 true false no!\n","done":false}︡{"done":true}
︠5b887c9c-2ca9-49f4-9ca1-2242e203c29bi︠
%md
# Basic types

Go's basic types are

    bool

    string

    int  int8  int16  int32  int64
    uint uint8 uint16 uint32 uint64 uintptr

    byte // alias for uint8

    rune // alias for int32
         // represents a Unicode code point

    float32 float64

    complex64 complex128

︡39cebb0b-38c0-49f0-ae9e-73b1eb9522d4︡{"html":"<h1>Basic types</h1>\n\n<p>Go&#8217;s basic types are</p>\n\n<pre><code>bool\n\nstring\n\nint  int8  int16  int32  int64\nuint uint8 uint16 uint32 uint64 uintptr\n\nbyte // alias for uint8\n\nrune // alias for int32\n     // represents a Unicode code point\n\nfloat32 float64\n\ncomplex64 complex128\n</code></pre>\n"}︡
︠360bb0b3-30c4-4271-91a7-96a87431e5c3s︠
%go

import "math/cmplx"

var (
    ToBe   bool       = false
    MaxInt uint64     = 1<<64 - 1
    z      complex128 = cmplx.Sqrt(-5 + 12i)
)

func main() {
    const f = "%T(%v)\n"
    fmt.Printf(f, ToBe, ToBe)
    fmt.Printf(f, MaxInt, MaxInt)
    fmt.Printf(f, z, z)
}
︡78d13852-4e8a-4584-aba5-670f8724d0be︡︡{"stdout":"bool(false)\nuint64(18446744073709551615)\ncomplex128((2+3i))\n","done":false}︡{"done":true}
︠c2fbf1a4-d61e-40cb-bd43-ca154ba3b06ei︠
%md
# Type conversions

The expression T(v) converts the value v to the type T.

Some numeric conversions:

    var i int = 42
    var f float64 = float64(i)
    var u uint = uint(f)

Or, put more simply:

    i := 42
    f := float64(i)
    u := uint(f)

Unlike in C, in Go assignment between items of different type requires an explicit conversion. Try removing the float64 or int conversions in the example and see what happens.
︡73a905f2-8216-4378-8ba4-4265cc074c19︡{"html":"<h1>Type conversions</h1>\n\n<p>The expression T(v) converts the value v to the type T.</p>\n\n<p>Some numeric conversions:</p>\n\n<pre><code>var i int = 42\nvar f float64 = float64(i)\nvar u uint = uint(f)\n</code></pre>\n\n<p>Or, put more simply:</p>\n\n<pre><code>i := 42\nf := float64(i)\nu := uint(f)\n</code></pre>\n\n<p>Unlike in C, in Go assignment between items of different type requires an explicit conversion. Try removing the float64 or int conversions in the example and see what happens.</p>\n"}︡
︠09b03af4-8108-4b74-9a6b-13650c7f41b9s︠
%go
import "math"

func main() {
    var x, y int = 3, 4
    var f float64 = math.Sqrt(float64(3*3 + 4*4 + 5*5))
    var z int = int(f)
    fmt.Println(x, y, z)
}
︡e6789c1f-e730-4168-b96c-c7ac4135d736︡︡{"stdout":"3 4 7\n","done":false}︡{"done":true}
︠c4fc8c59-1872-4a60-a5c3-986d86e8f1b4i︠
%md
# Constants

- Constants are declared like variables, but with the const keyword.

- Constants can be character, string, boolean, or numeric values.

- Constants cannot be declared using the := syntax.
︡102bb4fc-57bf-4533-90f5-811c9e407de0︡{"html":"<h1>Constants</h1>\n\n<ul>\n<li><p>Constants are declared like variables, but with the const keyword.</p></li>\n<li><p>Constants can be character, string, boolean, or numeric values.</p></li>\n<li><p>Constants cannot be declared using the := syntax.</p></li>\n</ul>\n"}︡
︠8c2153eb-8fd6-451c-9f37-1ce5ee86f730︠
%go

const Pi = 3.14

func main() {
    const World = "世界"
    fmt.Println("Hello", World)
    fmt.Println("Happy", Pi, "Day")

    const Truth = true
    fmt.Println("Go rules?", Truth)
}
︡5768a414-aabf-40df-a149-c249e70bdedc︡{"stdout":"Hello 世界\nHappy 3.14 Day\nGo rules? true\n"}︡
︠4a71badf-c966-4aca-8171-5db028e08bb4i︠
%md
# Numeric Constants

- Numeric constants are high-precision values.

- An untyped constant takes the type needed by its context.

- Try printing needInt(Big) too.
︡a3aaefb5-0685-4adc-b6a6-61c468ff9b7a︡{"html":"<h1>Numeric Constants</h1>\n\n<ul>\n<li><p>Numeric constants are high-precision values.</p></li>\n<li><p>An untyped constant takes the type needed by its context.</p></li>\n<li><p>Try printing needInt(Big) too.</p></li>\n</ul>\n"}︡
︠04bd6e2f-50c3-46d3-b3ec-4eb161b769f8︠
%go
const (
    Big   = 1 << 100
    Small = Big >> 99
)

func needInt(x int) int { return x*10 + 1 }
func needFloat(x float64) float64 {
    return x * 0.1
}

func main() {
    fmt.Println(needInt(Small))
    fmt.Println(needFloat(Small))
    fmt.Println(needFloat(Big))
}
︡03aaccc4-628d-4028-bd6c-2760802c3436︡{"stdout":"21\n0.2\n1.2676506002282295e+29\n"}︡
︠1079021b-11fc-417f-a9e2-bf981d29f6c0i︠
%md
# For

- Go has only one looping construct, the for loop.

- The basic for loop looks as it does in C or Java, except that the ( ) are gone (they are not even optional) and the { } are required.
︡0fb29925-36a9-40ad-9d0d-c7361f6b2528︡{"html":"<h1>For</h1>\n\n<ul>\n<li><p>Go has only one looping construct, the for loop.</p></li>\n<li><p>The basic for loop looks as it does in C or Java, except that the ( ) are gone (they are not even optional) and the { } are required.</p></li>\n</ul>\n"}︡
︠8179c6f5-5fe0-43e8-ba35-a929636c36cc︠
%go

func main() {
    sum := 0
    for i := 0; i < 10; i++ {
        sum += i
    }
    fmt.Println(sum)
}
︡696e0646-a5b0-43d6-ab0f-f0636d92220e︡{"stdout":"45\n"}︡
︠e9b6fa76-bf91-44ff-85a0-b5bc000139bci︠
%md
(Aside: you can combine Sage's time and go magics to find the total time to compile **and** run the program...)
︡c72ed448-29cd-45d8-9d7e-604ac2537343︡{"html":"<p>(Aside: you can combine Sage&#8217;s time and go magics to find the total time to compile <strong>and</strong> run the program&#8230;)</p>\n"}︡
︠30063e95-21f5-4bcc-ab44-d2536ec39959︠
%time
%go
func main() {
    sum := 0
    for i := 0; i < 10; i++ {
        sum += i
    }
    fmt.Println(sum)
}
︡b590e457-ed03-4526-8e0e-2932e7063b80︡{"stdout":"45\n"}︡{"stdout":"CPU time: 0.03 s, Wall time: 0.63 s\n"}︡
︠43991d87-39cc-469c-96ac-aae70236934ci︠
%md
# For continued

As in C or Java, you can leave the pre and post statements empty.
︡e5b042b4-0334-4c2c-a488-b2c3942a41cd︡{"html":"<h1>For continued</h1>\n\n<p>As in C or Java, you can leave the pre and post statements empty.</p>\n"}︡
︠c5659617-fea2-4608-9c0c-8151e0b7d6c3︠
%go
func main() {
    sum := 1
    for ; sum < 1000; {
        sum += sum
    }
    fmt.Println(sum)
}
︡a2fbca1f-b455-4502-845d-b1d9255fb50e︡{"stdout":"1024\n"}︡
︠6718ee37-ba5d-4e8d-9625-192c05a093b5i︠
%md
# For is Go's "while"

At that point you can drop the semicolons: C's while is spelled for in Go.
︡a5674bc4-86f8-4810-b198-1efca2db71c5︡{"html":"<h1>For is Go&#8217;s &#8220;while&#8221;</h1>\n\n<p>At that point you can drop the semicolons: C&#8217;s while is spelled for in Go.</p>\n"}︡
︠cb539b3f-c6d4-4460-9ad1-40e71849c253︠
%go
func main() {
    sum := 1
    for sum < 1000 {
        sum += sum
    }
    fmt.Println(sum)
}
︡850c5ce9-a0e4-4153-8577-d63da6a68641︡{"stdout":"1024\n"}︡
︠76dcc13f-69cd-4480-a60d-24530049c469i︠
%md
# Forever

If you omit the loop condition it loops forever, so an infinite loop is compactly expressed.

**HINT:** In SageMathCloud, interrupt this by clicking the Stop button above.
︡45bdec28-3580-43b0-a105-2c158ab8b66d︡{"html":"<h1>Forever</h1>\n\n<p>If you omit the loop condition it loops forever, so an infinite loop is compactly expressed.</p>\n\n<p><strong>HINT:</strong> In SageMathCloud, interrupt this by clicking the Stop button above.</p>\n"}︡
︠0ce43e3e-d942-4621-bd90-793ceefe91f7︠
%go

func main() {
    for {
    }
}
︠c9c893c0-e8d9-4cf1-a55d-74b5aa0d1139i︠

%md
# If

The if statement looks as it does in C or Java, except that the ( ) are gone and the { } are required.

(Sound familiar?)
︡8ee9a3bf-a1ef-44e1-9e9c-2808e9f67b80︡{"html":"<h1>If</h1>\n\n<p>The if statement looks as it does in C or Java, except that the ( ) are gone and the { } are required.</p>\n\n<p>(Sound familiar?)</p>\n"}︡
︠c05ed00d-1358-4146-a1f1-693396351ab4︠
%go

import "math"

func sqrt(x float64) string {
    if x < 0 {
        return sqrt(-x) + "i"
    }
    return fmt.Sprint(math.Sqrt(x))
}

func main() {
    fmt.Println(sqrt(2), sqrt(-4))
}
︡9a1b2b3f-2052-4ee4-8166-b08c139e9bef︡{"stdout":"1.4142135623730951 2i\n"}︡
︠db2420c3-3b31-4f9a-abba-b389b5a84605i︠
%md
# If with a short statement

Like for, the if statement can start with a short statement to execute before the condition.

Variables declared by the statement are only in scope until the end of the if.

(Try using v in the last return statement.)
︡be50273e-eb36-4bb9-afc2-42b1ea04f205︡{"html":"<h1>If with a short statement</h1>\n\n<p>Like for, the if statement can start with a short statement to execute before the condition.</p>\n\n<p>Variables declared by the statement are only in scope until the end of the if.</p>\n\n<p>(Try using v in the last return statement.)</p>\n"}︡
︠a6d323b7-ad85-43f2-a52b-8c0da7828638︠
%go

import (
    "fmt"
    "math"
)

func pow(x, n, lim float64) float64 {
    if v := math.Pow(x, n); v < lim {
        return v
    }
    return lim
}

func main() {
    fmt.Println(
        pow(3, 2, 10),
        pow(3, 3, 20),
    )
}
︡5d76f3bb-f586-41fd-adaf-75086dc9ad85︡{"stdout":"9 20\n"}︡
︠a02280a0-3f5b-4109-8c3c-d84929440bd5i︠
%md
# If and else

Variables declared inside an if short statement are also available inside any of the else blocks.
︡f3a6a5b5-8d40-465a-8235-9746f1283ec5︡{"html":"<h1>If and else</h1>\n\n<p>Variables declared inside an if short statement are also available inside any of the else blocks.</p>\n"}︡
︠01d647a6-0cc9-4955-8d96-f2e4843413e7︠
%go
import (
    "fmt"
    "math"
)

func pow(x, n, lim float64) float64 {
    if v := math.Pow(x, n); v < lim {
        return v
    } else {
        fmt.Printf("%g >= %g\n", v, lim)
    }
    // can't use v here, though
    return lim
}

func main() {
    fmt.Println(
        pow(3, 2, 10),
        pow(3, 3, 20),
    )
}
︡bec7977c-5a1b-49d4-ae7f-2af998f17ec7︡{"stdout":"27 >= 20\n9 20\n"}︡
︠3f9a9652-3d24-4889-b434-bb2800d869e3i︠
%md
# Exercise: Loops and Functions

As a simple way to play with functions and loops, implement the square root function using Newton's method.

In this case, Newton's method is to approximate `Sqrt(x)` by picking a starting point `z` and then repeating:
$$
z = z - \frac{z^2 - x}{2z}
$$

To begin with, just repeat that calculation 10 times and see how close you get to the answer for various values (1, 2, 3, ...).

Next, change the loop condition to stop once the value has stopped changing (or only changes by a very small delta). See if that's more or fewer iterations. How close are you to the math.Sqrt?

Hint: to declare and initialize a floating point value, give it floating point syntax or use a conversion:

    z := float64(1)
    z := 1.0
︡0148fbe6-ac13-45b7-8bd6-20187cad1b9f︡{"html":"<h1>Exercise: Loops and Functions</h1>\n\n<p>As a simple way to play with functions and loops, implement the square root function using Newton&#8217;s method.</p>\n\n<p>In this case, Newton&#8217;s method is to approximate <code>Sqrt(x)</code> by picking a starting point <code>z</code> and then repeating:\n$$\nz = z - \\frac{z^2 - x}{2z}\n$$</p>\n\n<p>To begin with, just repeat that calculation 10 times and see how close you get to the answer for various values (1, 2, 3, &#8230;).</p>\n\n<p>Next, change the loop condition to stop once the value has stopped changing (or only changes by a very small delta). See if that&#8217;s more or fewer iterations. How close are you to the math.Sqrt?</p>\n\n<p>Hint: to declare and initialize a floating point value, give it floating point syntax or use a conversion:</p>\n\n<pre><code>z := float64(1)\nz := 1.0\n</code></pre>\n"}︡
︠55dd7335-0cff-4fcd-a4a4-aadfa8770b8e︠
%go

func Sqrt(x float64) float64 {
}

func main() {
    fmt.Println(Sqrt(2))
}
︡86c3aa10-4d49-4ec7-80ab-24b5874adcf4︡{"stderr":"# command-line-arguments\n./9f3a5c04-7754-4606-8005-b90ee486d2c4.go:5: missing return at end of function\n"}︡
︠c4e772d2-3e30-4090-aa9d-d754a690bad7i︠

%md
# Structs

A struct is a collection of fields.

(And a type declaration does what you'd expect.)
︡eaf28353-30f7-4edf-8f07-9ca9c1e66830︡{"html":"<h1>Structs</h1>\n\n<p>A struct is a collection of fields.</p>\n\n<p>(And a type declaration does what you&#8217;d expect.)</p>\n"}︡
︠783d89ea-3845-4f90-9086-3eeedf353a28︠
%go

type Vertex struct {
    X int
    Y int
}

func main() {
    fmt.Println(Vertex{1, 2})
}
︡384acc90-bff4-4652-9e86-2adb67c2d044︡{"stdout":"{1 2}\n"}︡
︠22f1c9f6-fa94-420c-b9b0-f5904ed8bcd7i︠
%md
# Pointers

Go has pointers, but no pointer arithmetic.

Struct fields can be accessed through a struct pointer. The indirection through the pointer is transparent.
︡9fe9d722-282c-4c9c-bc89-885d94e2cf58︡{"html":"<h1>Pointers</h1>\n\n<p>Go has pointers, but no pointer arithmetic.</p>\n\n<p>Struct fields can be accessed through a struct pointer. The indirection through the pointer is transparent.</p>\n"}︡
︠c52d52c1-70a0-4aeb-af40-150b8813ec14︠
%go

type Vertex struct {
    X int
    Y int
}

func main() {
    p := Vertex{1, 2}
    q := &p
    q.X = 1e9
    fmt.Println(p)
}
︡990cb7aa-4580-4d57-b31c-1ec564107760︡{"stdout":"{1000000000 2}\n"}︡
︠867f1c07-65de-44ed-8672-4f22e04aee0fi︠
%md
# Struct Literals

A struct literal denotes a newly allocated struct value by listing the values of its fields.

You can list just a subset of fields by using the Name: syntax. (And the order of named fields is irrelevant.)

The special prefix & constructs a pointer to a newly allocated struct.
︡5a4cb25b-9747-4c0f-be3a-752be67759dd︡{"html":"<h1>Struct Literals</h1>\n\n<p>A struct literal denotes a newly allocated struct value by listing the values of its fields.</p>\n\n<p>You can list just a subset of fields by using the Name: syntax. (And the order of named fields is irrelevant.)</p>\n\n<p>The special prefix &amp; constructs a pointer to a newly allocated struct.</p>\n"}︡
︠a5233030-63b0-4a34-98d7-74229cfa62af︠
%go
type Vertex struct {
    X, Y int
}

var (
    p = Vertex{1, 2}  // has type Vertex
    q = &Vertex{1, 2} // has type *Vertex
    r = Vertex{X: 1}  // Y:0 is implicit
    s = Vertex{}      // X:0 and Y:0
)

func main() {
    fmt.Println(p, q, r, s)
}
︡316fa0bc-b16f-4a58-bf77-1fd0bb70f6f9︡{"stdout":"{1 2} &{1 2} {1 0} {0 0}\n"}︡
︠405d8413-3706-4ffa-bb24-1e7a79f25d53i︠
%md
# The new function

The expression `new(T)` allocates a zeroed `T` value and returns a pointer to it.

    var t *T = new(T)

or

    t := new(T)
︡2118f4be-034f-47d9-8cb2-4b0cc2d201f8︡{"html":"<h1>The new function</h1>\n\n<p>The expression <code>new(T)</code> allocates a zeroed <code>T</code> value and returns a pointer to it.</p>\n\n<pre><code>var t *T = new(T)\n</code></pre>\n\n<p>or</p>\n\n<pre><code>t := new(T)\n</code></pre>\n"}︡
︠f8f3186c-95aa-4e8e-bd8f-f475aec2b043︠
%go

type Vertex struct {
    X, Y int
}

func main() {
    v := new(Vertex)
    fmt.Println(v)
    v.X, v.Y = 11, 9
    fmt.Println(v)
}
︡f49af910-3436-411d-be65-86cbf140f283︡{"stdout":"&{0 0}\n&{11 9}\n"}︡
︠5fd14914-d72f-4dae-b914-14d2e270a811i︠
%md
# Arrays

The type `[n]T` is an array of `n` values of type `T`.

The expression

    var a [10]int

declares a variable `a` as an array of ten integers.

An array's length is part of its type, so arrays cannot be resized. This seems limiting, but don't worry; Go provides a convenient way of working with arrays.
︡9eb83f9e-6952-43b0-a04d-c0b8fbd88878︡{"html":"<h1>Arrays</h1>\n\n<p>The type <code>[n]T</code> is an array of <code>n</code> values of type <code>T</code>.</p>\n\n<p>The expression</p>\n\n<pre><code>var a [10]int\n</code></pre>\n\n<p>declares a variable <code>a</code> as an array of ten integers.</p>\n\n<p>An array&#8217;s length is part of its type, so arrays cannot be resized. This seems limiting, but don&#8217;t worry; Go provides a convenient way of working with arrays.</p>\n"}︡
︠830330a7-de33-47fc-a2a0-3bfbf0ea9457︠
%go
func main() {
    var a [2]string
    a[0] = "Hello"
    a[1] = "World"
    fmt.Println(a[0], a[1])
    fmt.Println(a)
}
︡40d20af3-9500-4095-8d30-53a751457efa︡{"stdout":"Hello World\n[Hello World]\n"}︡
︠f8412400-a707-4d0e-9555-8dba62e4dbfei︠
%md
# Slices

A slice points to an array of values and also includes a length.

`[]T` is a slice with elements of type `T`.
︡84cb46a8-3921-4512-ba5e-95d521d041f1︡{"html":"<h1>Slices</h1>\n\n<p>A slice points to an array of values and also includes a length.</p>\n\n<p><code>[]T</code> is a slice with elements of type <code>T</code>.</p>\n"}︡
︠6cad202f-1e28-4a97-9c3b-fdf3df1627a2︠
%go
func main() {
    p := []int{2, 3, 5, 7, 11, 13}
    fmt.Println("p ==", p)

    for i := 0; i < len(p); i++ {
        fmt.Printf("p[%d] == %d\n", i, p[i])
    }
}
︡fa406dcd-ee87-4a9b-a88b-1e116a6e0962︡{"stdout":"p == [2 3 5 7 11 13]\np[0] == 2\np[1] == 3\np[2] == 5\np[3] == 7\np[4] == 11\np[5] == 13\n"}︡
︠9b9a2b7f-5a28-49d7-b907-60bc4033fee5i︠
%md
# Slicing slices

Slices can be re-sliced, creating a new slice value that points to the same array.

The expression

    s[lo:hi]

evaluates to a slice of the elements from lo through hi-1, inclusive. Thus

    s[lo:lo]

is empty and

    s[lo:lo+1]

has one element.
︡475d58e0-f0e6-493f-878f-e67da19c4a8c︡{"html":"<h1>Slicing slices</h1>\n\n<p>Slices can be re-sliced, creating a new slice value that points to the same array.</p>\n\n<p>The expression</p>\n\n<pre><code>s[lo:hi]\n</code></pre>\n\n<p>evaluates to a slice of the elements from lo through hi-1, inclusive. Thus</p>\n\n<pre><code>s[lo:lo]\n</code></pre>\n\n<p>is empty and</p>\n\n<pre><code>s[lo:lo+1]\n</code></pre>\n\n<p>has one element.</p>\n"}︡
︠05aa6659-a8f2-429e-9b2d-b92a1d7c4901︠
%go

func main() {
    p := []int{2, 3, 5, 7, 11, 13}
    fmt.Println("p ==", p)
    fmt.Println("p[1:4] ==", p[1:4])

    // missing low index implies 0
    fmt.Println("p[:3] ==", p[:3])

    // missing high index implies len(s)
    fmt.Println("p[4:] ==", p[4:])
}
︡f5e62467-e693-4da7-97e1-e5f210c60780︡{"stdout":"p == [2 3 5 7 11 13]\np[1:4] == [3 5 7]\np[:3] == [2 3 5]\np[4:] == [11 13]\n"}︡
︠5b1d1f9a-b1d6-4998-8e8f-9e07b5efb62bi︠
%md
# Making slices

Slices are created with the make function. It works by allocating a zeroed array and returning a slice that refers to that array:

    a := make([]int, 5)  // len(a)=5


To specify a capacity, pass a third argument to make:

    b := make([]int, 0, 5) // len(b)=0, cap(b)=5
    b = b[:cap(b)] // len(b)=5, cap(b)=5
    b = b[1:]      // len(b)=4, cap(b)=4

︡0b71fe81-9e31-4200-b75e-7f0276bacbca︡{"html":"<h1>Making slices</h1>\n\n<p>Slices are created with the make function. It works by allocating a zeroed array and returning a slice that refers to that array:</p>\n\n<pre><code>a := make([]int, 5)  // len(a)=5\n</code></pre>\n\n<p>To specify a capacity, pass a third argument to make:</p>\n\n<pre><code>b := make([]int, 0, 5) // len(b)=0, cap(b)=5\nb = b[:cap(b)] // len(b)=5, cap(b)=5\nb = b[1:]      // len(b)=4, cap(b)=4\n</code></pre>\n"}︡
︠7ecfd096-23eb-495d-9df0-b15ee6ecf474︠
%go
func main() {
    a := make([]int, 5)
    printSlice("a", a)
    b := make([]int, 0, 5)
    printSlice("b", b)
    c := b[:2]
    printSlice("c", c)
    d := c[2:5]
    printSlice("d", d)
}

func printSlice(s string, x []int) {
    fmt.Printf("%s len=%d cap=%d %v\n",
        s, len(x), cap(x), x)
}
︡b3d32104-b02c-4518-8f61-f443be66d5d8︡{"stdout":"a len=5 cap=5 [0 0 0 0 0]\nb len=0 cap=5 []\nc len=2 cap=5 [0 0]\nd len=3 cap=3 [0 0 0]\n"}︡
︠6774e11c-683f-464b-a127-7bc9931f808ei︠
%md
# Nil slices

The zero value of a slice is nil.

A nil slice has a length and capacity of 0.

(To learn more about slices, read the [Slices: usage and internals article](http://golang.org/doc/articles/slices_usage_and_internals.html).)
︡78e85678-7ccc-4f25-93ac-244af4cb510c︡{"html":"<h1>Nil slices</h1>\n\n<p>The zero value of a slice is nil.</p>\n\n<p>A nil slice has a length and capacity of 0.</p>\n\n<p>(To learn more about slices, read the <a href=\"http://golang.org/doc/articles/slices_usage_and_internals.html\">Slices: usage and internals article</a>.)</p>\n"}︡
︠ade17391-983d-44a4-9f7a-e4519a7bae09︠
%go

func main() {
    var z []int
    fmt.Println(z, len(z), cap(z))
    if z == nil {
        fmt.Println("nil!")
    }
}
︡e462db49-4db3-4ce5-ba3e-096ab6dc81c3︡{"stdout":"[] 0 0\nnil!\n"}︡
︠9415d266-5758-427d-b120-eb4a30c8dadbi︠
%md
# Range

The range form of the for loop iterates over a slice or map.
︡e783bd8f-5396-4636-b9ff-fd72fbd48010︡{"html":"<h1>Range</h1>\n\n<p>The range form of the for loop iterates over a slice or map.</p>\n"}︡
︠1590ff6b-1340-4f83-af17-2e1930ccf84a︠
%go

var pow = []int{1, 2, 4, 8, 16, 32, 64, 128}

func main() {
    for i, v := range pow {
        fmt.Printf("2**%d = %d\n", i, v)
    }
}
︡8567beab-569b-4ca8-a09a-12f0f32365e0︡{"stdout":"2**0 = 1\n2**1 = 2\n2**2 = 4\n2**3 = 8\n2**4 = 16\n2**5 = 32\n2**6 = 64\n2**7 = 128\n"}︡
︠a88afd11-d69b-4dc3-9d36-3d4bf06af6a7i︠
%md
# Exercise: Slices

Implement `Pic`. It should return a slice of length `dy`, each element of which is a slice of `dx` 8-bit unsigned integers. When you run the program, it will display your picture, interpreting the integers as grayscale (well, bluescale) values.

The choice of image is up to you. Interesting functions include `x^y`, `(x+y)/2`, and `x*y`.

(You need to use a loop to allocate each `[]uint8` inside the `[][]uint8`.)

(Use `uint8(intValue)` to convert between types.)

**NOTE:** I wasn't even able to figure out how to import that pic library; and I doubt it would work...  Email wstein@uw.edu if you figure out how to make this work.
︡8193ece0-9ebd-4e46-b06e-0351d5b4be22︡{"html":"<h1>Exercise: Slices</h1>\n\n<p>Implement <code>Pic</code>. It should return a slice of length <code>dy</code>, each element of which is a slice of <code>dx</code> 8-bit unsigned integers. When you run the program, it will display your picture, interpreting the integers as grayscale (well, bluescale) values.</p>\n\n<p>The choice of image is up to you. Interesting functions include <code>x^y</code>, <code>(x+y)/2</code>, and <code>x*y</code>.</p>\n\n<p>(You need to use a loop to allocate each <code>[]uint8</code> inside the <code>[][]uint8</code>.)</p>\n\n<p>(Use <code>uint8(intValue)</code> to convert between types.)</p>\n\n<p><strong>NOTE:</strong> I wasn&#8217;t even able to figure out how to import that pic library; and I doubt it would work&#8230;  Email wstein@uw.edu if you figure out how to make this work.</p>\n"}︡
︠f570bb4c-a6ec-42e5-846e-f9a5384c4edb︠
%go

import "code.google.com/p/go-tour/pic"

func Pic(dx, dy int) [][]uint8 {
}

func main() {
    pic.Show(Pic)
}
︡9d10ec58-4415-4e4a-8ab4-f15ba5553f4b︡{"stderr":"9212d767-eb6d-4980-9425-8e882e33df76.go:3:8: cannot find package \"code.google.com/p/go-tour/pic\" in any of:\n\t/usr/lib/go/src/pkg/code.google.com/p/go-tour/pic (from $GOROOT)\n\t($GOPATH not set)\n"}︡
︠ec5c0aed-8f9c-4db9-962d-3985fe36258ci︠
%md
# Maps

- A map maps keys to values.

- Maps must be created with make (not new) before use; the nil map is empty and cannot be assigned to.
︡3b808f44-7b37-4731-8247-afa5f17b94a9︡{"html":"<h1>Maps</h1>\n\n<ul>\n<li><p>A map maps keys to values.</p></li>\n<li><p>Maps must be created with make (not new) before use; the nil map is empty and cannot be assigned to.</p></li>\n</ul>\n"}︡
︠5da3d8ce-2fda-4c99-a063-4c987542ca44︠
%go

type Vertex struct {
    Lat, Long float64
}

var m map[string]Vertex

func main() {
    m = make(map[string]Vertex)
    m["Bell Labs"] = Vertex{
        40.68433, -74.39967,
    }
    fmt.Println(m["Bell Labs"])
}
︡84f0c333-852d-4535-ac4e-75375a642a88︡{"stdout":"{40.68433 -74.39967}\n"}︡
︠0a90a63c-ef77-4c91-bbbe-fb4e35fc608di︠
%md
# Map literals

Map literals are like struct literals, but the keys are required.
︡c3e6cc31-a2a3-43e5-965b-21d9625696aa︡{"html":"<h1>Map literals</h1>\n\n<p>Map literals are like struct literals, but the keys are required.</p>\n"}︡
︠6e702738-2a38-45b1-80cb-5598367b8d6f︠
%go

type Vertex struct {
    Lat, Long float64
}

var m = map[string]Vertex{
    "Bell Labs": Vertex{
        40.68433, -74.39967,
    },
    "Google": Vertex{
        37.42202, -122.08408,
    },
}

func main() {
    fmt.Println(m)
}
︡5e61f950-4e76-4897-9d93-006d3cd13b61︡{"stdout":"map[Bell Labs:{40.68433 -74.39967} Google:{37.42202 -122.08408}]\n"}︡
︠c6a860f6-3049-4c0f-b2a2-7e08c49897c7i︠
%md
# Map literals continued

If the top-level type is just a type name, you can omit it from the elements of the literal.
︡fd7614dc-7177-4eba-a457-3c3c3a29fb7c︡{"html":"<h1>Map literals continued</h1>\n\n<p>If the top-level type is just a type name, you can omit it from the elements of the literal.</p>\n"}︡
︠b3bbbc11-df42-4a02-895e-6ef5461bd78d︠
%go

type Vertex struct {
    Lat, Long float64
}

var m = map[string]Vertex{
    "Bell Labs": {40.68433, -74.39967},
    "Google":    {37.42202, -122.08408},
}

func main() {
    fmt.Println(m)
}
︡683d5329-2a35-4571-8588-5eab05565b17︡{"stdout":"map[Bell Labs:{40.68433 -74.39967} Google:{37.42202 -122.08408}]\n"}︡
︠6edaff2f-352b-4b48-a663-7001292a68eai︠
%md
# Mutating Maps

Insert or update an element in map m:

    m[key] = elem




Retrieve an element:

    elem = m[key]


Delete an element:

    delete(m, key)


Test that a key is present with a two-value assignment:

    elem, ok = m[key]

If key is in m, ok is true. If not, ok is false and elem is the zero value for the map's element type.

Similarly, when reading from a map if the key is not present the result is the zero value for the map's element type.
︡054b65e6-eaf9-4ce9-aa34-8c652ca9ef51︡{"html":"<h1>Mutating Maps</h1>\n\n<p>Insert or update an element in map m:</p>\n\n<pre><code>m[key] = elem\n</code></pre>\n\n<p>Retrieve an element:</p>\n\n<pre><code>elem = m[key]\n</code></pre>\n\n<p>Delete an element:</p>\n\n<pre><code>delete(m, key)\n</code></pre>\n\n<p>Test that a key is present with a two-value assignment:</p>\n\n<pre><code>elem, ok = m[key]\n</code></pre>\n\n<p>If key is in m, ok is true. If not, ok is false and elem is the zero value for the map&#8217;s element type.</p>\n\n<p>Similarly, when reading from a map if the key is not present the result is the zero value for the map&#8217;s element type.</p>\n"}︡
︠75d51bbc-194e-413c-951a-8ad44ef3f347︠
%go
func main() {
    m := make(map[string]int)

    m["Answer"] = 42
    fmt.Println("The value:", m["Answer"])

    m["Answer"] = 48
    fmt.Println("The value:", m["Answer"])

    delete(m, "Answer")
    fmt.Println("The value:", m["Answer"])

    v, ok := m["Answer"]
    fmt.Println("The value:", v, "Present?", ok)
}
︡0faf87b9-2710-4d77-9104-2f03d2605f81︡{"stdout":"The value: 42\nThe value: 48\nThe value: 0\nThe value: 0 Present? false\n"}︡
︠c54ccea2-348c-4170-8241-d77da99fdec7i︠
%md
# Exercise: Maps

Implement WordCount. It should return a map of the counts of each “word” in the string s. The wc.Test function runs a test suite against the provided function and prints success or failure.

You might [find strings.Fields](http://golang.org/pkg/strings/#Fields) helpful.
︡57411dee-0f4e-4cb0-8ac1-69bc3ebab859︡{"html":"<h1>Exercise: Maps</h1>\n\n<p>Implement WordCount. It should return a map of the counts of each “word” in the string s. The wc.Test function runs a test suite against the provided function and prints success or failure.</p>\n\n<p>You might <a href=\"http://golang.org/pkg/strings/#Fields\">find strings.Fields</a> helpful.</p>\n"}︡
︠61ec484a-0a4e-4361-9824-a5294d8e82d7︠
%go

// WARNING: I don't know how to import this...
import (
    "code.google.com/p/go-tour/wc"
)

func WordCount(s string) map[string]int {
    return map[string]int{"x": 1}
}

func main() {
    wc.Test(WordCount)
}
︡9394349b-e425-4fc0-ade9-c7ef06b5a6e0︡{"stderr":"fdac019e-be43-4660-9194-dfaf97f543e3.go:5:5: cannot find package \"code.google.com/p/go-tour/wc\" in any of:\n\t/usr/lib/go/src/pkg/code.google.com/p/go-tour/wc (from $GOROOT)\n\t($GOPATH not set)\n"}︡
︠079c3a22-73ba-4fe8-a9fb-806a335472b9i︠
%md
# Function values

Functions are values too.
︡ccf433ee-c4bc-48dd-8840-0f9e6b2d88dd︡{"html":"<h1>Function values</h1>\n\n<p>Functions are values too.</p>\n"}︡
︠1489fb86-a58f-4920-807b-9301b8204230︠

%go

import (
    "fmt"
    "math"
)

func main() {
    hypot := func(x, y float64) float64 {
        return math.Sqrt(x*x + y*y)
    }

    fmt.Println(hypot(3, 4))
}
︡40d6eacd-4ea1-4911-b416-05abee8b4682︡{"stdout":"5\n"}︡
︠90ce5ff0-638c-42eb-bcb0-3af468880b58i︠
%md
# Function closures

Go functions may be closures. A closure is a function value that references variables from outside its body. The function may access and assign to the referenced variables; in this sense the function is "bound" to the variables.

For example, the adder function returns a closure. Each closure is bound to its own sum variable.
︡cd3ca0ca-6647-48bd-8021-9c81bf4070d5︡{"html":"<h1>Function closures</h1>\n\n<p>Go functions may be closures. A closure is a function value that references variables from outside its body. The function may access and assign to the referenced variables; in this sense the function is &#8220;bound&#8221; to the variables.</p>\n\n<p>For example, the adder function returns a closure. Each closure is bound to its own sum variable.</p>\n"}︡
︠11d0095e-a0fb-478e-ba93-2f55f0660c91︠
%go
func adder() func(int) int {
    sum := 0
    return func(x int) int {
        sum += x
        return sum
    }
}

func main() {
    pos, neg := adder(), adder()
    for i := 0; i < 10; i++ {
        fmt.Println(
            pos(i),
            neg(-2*i),
        )
    }
}
︡e04f1f60-a770-4fb0-8637-a4b0f17e64a2︡{"stdout":"0 0\n1 -2\n3 -6\n6 -12\n10 -20\n15 -30\n21 -42\n28 -56\n36 -72\n45 -90\n"}︡
︠73288bc0-931c-4a70-b545-1b3bee438e0ai︠
%md
# Exercise: Fibonacci closure

Let's have some fun with functions.

Implement a fibonacci function that returns a function (a closure) that returns successive fibonacci numbers.
︡5785dbe7-55e6-4a53-a87e-c8bcbb26c9c8︡{"html":"<h1>Exercise: Fibonacci closure</h1>\n\n<p>Let&#8217;s have some fun with functions.</p>\n\n<p>Implement a fibonacci function that returns a function (a closure) that returns successive fibonacci numbers.</p>\n"}︡
︠93dcf2ca-075f-4a91-b180-8bcf1579518bs︠
%go

// fibonacci is a function that returns
// a function that returns an int.
func fibonacci() func() int {
	x := 0
	y := 1
	return func() int {
		x,y = y,x+y
		return x
	}
}

func main() {
    f := fibonacci()
    for i := 0; i < 10; i++ {
        fmt.Println(f())
    }
}
︡65bc8657-2ce5-41d7-b48f-f0fcdbbc712c︡︡{"stdout":"1\n1\n2\n3\n5\n8\n13\n21\n34\n55\n","done":false}︡{"done":true}
︠9640ed4b-54d4-419b-8872-fe3290b2ea0di︠

%md
# Switch

You probably knew what switch was going to look like.

A case body breaks automatically, unless it ends with a fallthrough statement.
︡1cb61a21-b4c7-442c-9685-555ae7761ed5︡{"html":"<h1>Switch</h1>\n\n<p>You probably knew what switch was going to look like.</p>\n\n<p>A case body breaks automatically, unless it ends with a fallthrough statement.</p>\n"}︡
︠3bc93d0a-5aa7-4ecc-8608-5d8662e948d4︠
%go

import (
    "fmt"
    "runtime"
)

func main() {
    fmt.Print("SageMathCloud is running ")
    switch os := runtime.GOOS; os {
    case "darwin":
        fmt.Println("OS X.")
    case "linux":
        fmt.Println("Linux.")
    default:
        // freebsd, openbsd,
        // plan9, windows...
        fmt.Printf("%s.", os)
    }
}
︡e9aef326-2a23-4d4d-9868-79a6afba8683︡{"stdout":"SageMathCloud is running Linux.\n"}︡
︠fb85702c-ddbd-4e29-b4dd-cf7b9b6e8cd7i︠
%md
# Switch evaluation order

Switch cases evaluate cases from top to bottom, stopping when a case succeeds.

For example,

    switch i {
    case 0:
    case f():
    }

does not call `f` if `i==0`.
︡00dd624e-a603-4d17-b35f-0f63aa676f5d︡{"html":"<h1>Switch evaluation order</h1>\n\n<p>Switch cases evaluate cases from top to bottom, stopping when a case succeeds.</p>\n\n<p>For example,</p>\n\n<pre><code>switch i {\ncase 0:\ncase f():\n}\n</code></pre>\n\n<p>does not call <code>f</code> if <code>i==0</code>.</p>\n"}︡
︠e42d3b2c-c5ec-4e5e-b754-889781fdd935︠
%go
import (
    "fmt"
    "time"
)

func main() {
    fmt.Println("When's Saturday?")
    today := time.Now().Weekday()
    switch time.Saturday {
    case today + 0:
        fmt.Println("Today.")
    case today + 1:
        fmt.Println("Tomorrow.")
    case today + 2:
        fmt.Println("In two days.")
    case today + 3:
        fmt.Println("In three days.")
    default:
        fmt.Println("Too far away.")
    }
}
︡a79db5a1-18cf-4b9d-834e-951c473c4ca2︡{"stdout":"When's Saturday?\nIn three days.\n"}︡
︠974db797-c198-495f-a0ee-a50a039c4b69i︠
%md
# Switch with no condition

Switch without a condition is the same as switch true.

This construct can be a clean way to write long if-then-else chains.

**NOTE:** In SageMathCloud the clock is set to the UTC time zone (i.e., England).
︡fdfcc409-e510-42dd-a774-bff5623ac4f7︡{"html":"<h1>Switch with no condition</h1>\n\n<p>Switch without a condition is the same as switch true.</p>\n\n<p>This construct can be a clean way to write long if-then-else chains.</p>\n\n<p><strong>NOTE:</strong> In SageMathCloud the clock is set to the UTC time zone (i.e., England).</p>\n"}︡
︠69e49783-ac29-422c-b6bc-bab0d24a9933︠

%go

import (
    "fmt"
    "time"
)

func main() {
    t := time.Now()
    switch {
    case t.Hour() < 12:
        fmt.Println("Good morning!")
    case t.Hour() < 17:
        fmt.Println("Good afternoon.")
    default:
        fmt.Println("Good evening.")
    }
}
︡9aaef900-f8a3-4d07-b55d-6d313c70b704︡{"stdout":"Good afternoon.\n"}︡
︠07363bea-9501-45f9-ade3-43ad5286b0a5i︠
%md
# Advanced Exercise: Complex cube roots

Let's explore Go's built-in support for complex numbers via the `complex64` and `complex128` types. For cube roots, Newton's method amounts to repeating:
$$
z = z- \frac{z^3-x}{3z^2}
$$


Find the cube root of 2, just to make sure the algorithm works. There is a [Pow](http://golang.org/pkg/math/cmplx/#Pow) function in the math/cmplx package.
︡4ce5402c-fc34-472a-aebd-ca6198f3ca1f︡{"html":"<h1>Advanced Exercise: Complex cube roots</h1>\n\n<p>Let&#8217;s explore Go&#8217;s built-in support for complex numbers via the <code>complex64</code> and <code>complex128</code> types. For cube roots, Newton&#8217;s method amounts to repeating:\n$$\nz = z- \\frac{z^3-x}{3z^2}\n$$</p>\n\n<p>Find the cube root of 2, just to make sure the algorithm works. There is a <a href=\"http://golang.org/pkg/math/cmplx/#Pow\">Pow</a> function in the math/cmplx package.</p>\n"}︡
︠18e1aef0-48bf-4db4-b9c4-ffdc68204bf9s︠
%go

import (
	"fmt"
	"math/cmplx"
)

func Cbrt(x complex128) complex128 {
	z := complex128(2)
	s := complex128(0)
	for {
		z = z - (cmplx.Pow(z,3) - x)/(3 * (z * z))
		if cmplx.Abs(s-z) < 1e-17 {
			break
		}
		s = z
	}
	return z
}

func main() {
    fmt.Println(Cbrt(2))
}
︡9401f4ba-4a57-4e59-a195-0e919e2e7103︡︡{"stdout":"(1.2599210498948732+0i)\n","done":false}︡{"done":true}
︠d308b105-6ccb-4ac7-bb75-8a14c88fcc2fi︠
%md
# Methods and Interfaces

The next group of slides covers methods and interfaces, the constructs that define objects and their behavior.
︡537726c8-3c4a-4b8f-9a48-eeef2902bde0︡{"html":"<h1>Methods and Interfaces</h1>\n\n<p>The next group of slides covers methods and interfaces, the constructs that define objects and their behavior.</p>\n"}︡
︠d4b86d2a-9bd9-4c11-8208-15aae9c471bfi︠
%md
# Methods

Go does not have classes. However, you can define methods on struct types.

The method receiver appears in its own argument list between the func keyword and the method name.
︡81d05ae3-73b8-484d-b340-66b9333d9ef5︡{"html":"<h1>Methods</h1>\n\n<p>Go does not have classes. However, you can define methods on struct types.</p>\n\n<p>The method receiver appears in its own argument list between the func keyword and the method name.</p>\n"}︡
︠a8321160-7b5d-4e5e-a135-804701d47178︠
%go
import (
    "fmt"
    "math"
)

type Vertex struct {
    X, Y float64
}

func (v *Vertex) Abs() float64 {
    return math.Sqrt(v.X*v.X + v.Y*v.Y)
}

func main() {
    v := &Vertex{3, 4}
    fmt.Println(v.Abs())
}
︡4c35f9f7-fc2e-4da8-9948-2f2b42b01eb9︡{"stdout":"5\n"}︡
︠4c9710cd-054d-48e8-b387-837282cbfb38i︠
%md
# Methods continued

In fact, you can define a method on any type you define in your package, not just structs.

You cannot define a method on a type from another package, or on a basic type.

︡4396e878-5e2d-432d-86aa-d0c95e798314︡{"html":"<h1>Methods continued</h1>\n\n<p>In fact, you can define a method on any type you define in your package, not just structs.</p>\n\n<p>You cannot define a method on a type from another package, or on a basic type.</p>\n"}︡
︠8c9e3454-f193-452d-b47a-b4e0ae7b5eb9︠
%go
import (
    "fmt"
    "math"
)

type MyFloat float64

func (f MyFloat) Abs() float64 {
    if f < 0 {
        return float64(-f)
    }
    return float64(f)
}

func main() {
    f := MyFloat(-math.Sqrt2)
    fmt.Println(f.Abs())
}
︡6cd5aec3-a258-441b-9028-a5f7a5d6e329︡{"stdout":"1.4142135623730951\n"}︡
︠1ab8fe9b-e81f-436b-8138-aa7b53ef0f33i︠
%md
# Methods with pointer receivers

Methods can be associated with a named type or a pointer to a named type.

We just saw two Abs methods. One on the *Vertex pointer type and the other on the MyFloat value type.

There are two reasons to use a pointer receiver. First, to avoid copying the value on each method call (more efficient if the value type is a large struct). Second, so that the method can modify the value that its receiver points to.

Try changing the declarations of the Abs and Scale methods to use Vertex as the receiver, instead of *Vertex.

The Scale method has no effect when v is a Vertex. Scale mutates v. When v is a value (non-pointer) type, the method sees a copy of the Vertex and cannot mutate the original value.

Abs works either way. It only reads v. It doesn't matter whether it is reading the original value (through a pointer) or a copy of that value.
︡4e847489-538a-4e33-89dd-5e443ee87d8a︡{"html":"<h1>Methods with pointer receivers</h1>\n\n<p>Methods can be associated with a named type or a pointer to a named type.</p>\n\n<p>We just saw two Abs methods. One on the *Vertex pointer type and the other on the MyFloat value type.</p>\n\n<p>There are two reasons to use a pointer receiver. First, to avoid copying the value on each method call (more efficient if the value type is a large struct). Second, so that the method can modify the value that its receiver points to.</p>\n\n<p>Try changing the declarations of the Abs and Scale methods to use Vertex as the receiver, instead of *Vertex.</p>\n\n<p>The Scale method has no effect when v is a Vertex. Scale mutates v. When v is a value (non-pointer) type, the method sees a copy of the Vertex and cannot mutate the original value.</p>\n\n<p>Abs works either way. It only reads v. It doesn&#8217;t matter whether it is reading the original value (through a pointer) or a copy of that value.</p>\n"}︡
︠98ae0fde-0bc5-40af-878d-60d9007999e9︠
%go
import (
    "fmt"
    "math"
)

type Vertex struct {
    X, Y float64
}

func (v *Vertex) Scale(f float64) {
    v.X = v.X * f
    v.Y = v.Y * f
}

func (v *Vertex) Abs() float64 {
    return math.Sqrt(v.X*v.X + v.Y*v.Y)
}

func main() {
    v := &Vertex{3, 4}
    v.Scale(5)
    fmt.Println(v, v.Abs())
}
︡bfb7d44e-8925-4e27-9ad2-1a541214ccdd︡{"stdout":"&{15 20} 25\n"}︡
︠59d516b1-2e8a-4a40-aceb-f4ea1261bb6di︠
%md
# Interfaces

An interface type is defined by a set of methods.

A value of interface type can hold any value that implements those methods.

**Note:** The code below fails to compile.

Vertex doesn't satisfy Abser because the Abs method is defined only on `*Vertex`, not `Vertex`.
Fix this by changing `(v *Vertex)` to `(v Vertex)`.
︡8c96ffb5-7bc5-4dbd-a965-f8037371d92d︡{"html":"<h1>Interfaces</h1>\n\n<p>An interface type is defined by a set of methods.</p>\n\n<p>A value of interface type can hold any value that implements those methods.</p>\n\n<p><strong>Note:</strong> The code below fails to compile.</p>\n\n<p>Vertex doesn&#8217;t satisfy Abser because the Abs method is defined only on <code>*Vertex</code>, not <code>Vertex</code>. <br />\nFix this by changing <code>(v *Vertex)</code> to <code>(v Vertex)</code>.</p>\n"}︡
︠6f81a49d-3abf-4d52-8a0a-bc7fb453de90︠
%go

import (
    "fmt"
    "math"
)

type Abser interface {
    Abs() float64
}

func main() {
    var a Abser
    f := MyFloat(-math.Sqrt2)
    v := Vertex{3, 4}

    a = f  // a MyFloat implements Abser
    a = &v // a *Vertex implements Abser

    // In the following line, v is a Vertex (not *Vertex)
    // and does NOT implement Abser.
    a = v

    fmt.Println(a.Abs())
}

type MyFloat float64

func (f MyFloat) Abs() float64 {
    if f < 0 {
        return float64(-f)
    }
    return float64(f)
}

type Vertex struct {
    X, Y float64
}

func (v *Vertex) Abs() float64 {
    return math.Sqrt(v.X*v.X + v.Y*v.Y)
}
︡3126f710-25d0-40b7-aa66-3d0104859aa9︡{"stderr":"# command-line-arguments\n./ddbdfba8-0e23-4052-991d-ae6075709bf8.go:22: cannot use v (type Vertex) as type Abser in assignment:\n\tVertex does not implement Abser (Abs method has pointer receiver)\n"}︡
︠b9a0c987-1e6a-4a84-b6d0-d2c9479141a5i︠
%md
# Interfaces are satisfied implicitly

A type implements an interface by implementing the methods.

There is no explicit declaration of intent.

Implicit interfaces decouple implementation packages from the packages that define the interfaces: neither depends on the other.

It also encourages the definition of precise interfaces, because you don't have to find every implementation and tag it with the new interface name.

[Package io](http://golang.org/pkg/io/) defines Reader and Writer; you don't have to.
︡30caac98-d3be-459e-bd13-83ab46364752︡{"html":"<h1>Interfaces are satisfied implicitly</h1>\n\n<p>A type implements an interface by implementing the methods.</p>\n\n<p>There is no explicit declaration of intent.</p>\n\n<p>Implicit interfaces decouple implementation packages from the packages that define the interfaces: neither depends on the other.</p>\n\n<p>It also encourages the definition of precise interfaces, because you don&#8217;t have to find every implementation and tag it with the new interface name.</p>\n\n<p><a href=\"http://golang.org/pkg/io/\">Package io</a> defines Reader and Writer; you don&#8217;t have to.</p>\n"}︡
︠f4962929-7431-4662-8ef2-8f3f5dee17af︠
%go
import (
    "fmt"
    "os"
)

type Reader interface {
    Read(b []byte) (n int, err error)
}

type Writer interface {
    Write(b []byte) (n int, err error)
}

type ReadWriter interface {
    Reader
    Writer
}

func main() {
    var w Writer

    // os.Stdout implements Writer
    w = os.Stdout

    fmt.Fprintf(w, "hello, writer\n")
}
︡6a0cd868-3fed-4871-9f3a-263c30608a25︡{"stdout":"hello, writer\n"}︡
︠112a79be-4f53-4808-b20c-3390eb45e8f1i︠
%md
# Errors

An error is anything that can describe itself as an error string. The idea is captured by the predefined, built-in interface type, error, with its single method, Error, returning a string:

    type error interface {
        Error() string
    }

The fmt package's various print routines automatically know to call the method when asked to print an error.
︡bf5b419a-8e1f-4d9b-a15a-d0e092c2a179︡{"html":"<h1>Errors</h1>\n\n<p>An error is anything that can describe itself as an error string. The idea is captured by the predefined, built-in interface type, error, with its single method, Error, returning a string:</p>\n\n<pre><code>type error interface {\n    Error() string\n}\n</code></pre>\n\n<p>The fmt package&#8217;s various print routines automatically know to call the method when asked to print an error.</p>\n"}︡
︠10d36371-b9d9-438c-ab55-5843535513c6︠
%go

import (
    "fmt"
    "time"
)

type MyError struct {
    When time.Time
    What string
}

func (e *MyError) Error() string {
    return fmt.Sprintf("at %v, %s",
        e.When, e.What)
}

func run() error {
    return &MyError{
        time.Now(),
        "it didn't work",
    }
}

func main() {
    if err := run(); err != nil {
        fmt.Println(err)
    }
}
︡a28167f0-2b53-49f2-b392-2a17de745939︡{"stdout":"at 2014-06-04 17:04:19.051890965 +0000 UTC, it didn't work\n"}︡
︠f9177f2d-2b42-41f3-be68-c8c7ca7b8728i︠
%md
# Exercise: Errors

Copy your `Sqrt function from the earlier exercises and modify it to return an error value.

`Sqrt` should return a non-nil error value when given a negative number, as it doesn't support complex numbers.

Create a new type

    type ErrNegativeSqrt float64

and make it an error by giving it a

    func (e ErrNegativeSqrt) Error() string

method such that `ErrNegativeSqrt(-2).Error()` returns `"cannot Sqrt negative number: -2"`.

Note: a call to `fmt.Print(e)` inside the `Error` method will send the program into an infinite loop. You can avoid this by converting `e` first: `fmt.Print(float64(e))`. Why?

Change your `Sqrt` function to return an `ErrNegativeSqrt` value when given a negative number.
︡365088e0-08b5-4590-aed3-2ed034dfac70︡{"html":"<h1>Exercise: Errors</h1>\n\n<p>Copy your `Sqrt function from the earlier exercises and modify it to return an error value.</p>\n\n<p><code>Sqrt</code> should return a non-nil error value when given a negative number, as it doesn&#8217;t support complex numbers.</p>\n\n<p>Create a new type</p>\n\n<pre><code>type ErrNegativeSqrt float64\n</code></pre>\n\n<p>and make it an error by giving it a</p>\n\n<pre><code>func (e ErrNegativeSqrt) Error() string\n</code></pre>\n\n<p>method such that <code>ErrNegativeSqrt(-2).Error()</code> returns <code>\"cannot Sqrt negative number: -2\"</code>.</p>\n\n<p>Note: a call to <code>fmt.Print(e)</code> inside the <code>Error</code> method will send the program into an infinite loop. You can avoid this by converting <code>e</code> first: <code>fmt.Print(float64(e))</code>. Why?</p>\n\n<p>Change your <code>Sqrt</code> function to return an <code>ErrNegativeSqrt</code> value when given a negative number.</p>\n"}︡
︠2a8ec934-00ae-47de-9f5f-7306c1f50ad4i︠
%md
# Web servers

[Package http](http://golang.org/pkg/net/http/) serves HTTP requests using any value that implements `http.Handler`:

    package http

    type Handler interface {
        ServeHTTP(w ResponseWriter, r *Request)
    }

In this example, the type Hello implements http.Handler.

**IMPORTANT**

- Visit `https://cloud.sagemath.com/<project_id>/port/4000/` to see the greeting, where `project_id` is the uuid of the project you're using right now (it's in the url or you can get it by evaluating the line directly below).

- Click the Stop button above to terminate the server and continue being able to edit code in the worksheet.
︡3fb4082c-b9b2-4a64-b0fd-429087745ab4︡{"html":"<h1>Web servers</h1>\n\n<p><a href=\"http://golang.org/pkg/net/http/\">Package http</a> serves HTTP requests using any value that implements <code>http.Handler</code>:</p>\n\n<pre><code>package http\n\ntype Handler interface {\n    ServeHTTP(w ResponseWriter, r *Request)\n}\n</code></pre>\n\n<p>In this example, the type Hello implements http.Handler.</p>\n\n<p><strong>IMPORTANT</strong></p>\n\n<ul>\n<li><p>Visit <code>https://cloud.sagemath.com/&lt;project_id&gt;/port/4000/</code> to see the greeting, where <code>project_id</code> is the uuid of the project you&#8217;re using right now (it&#8217;s in the url or you can get it by evaluating the line directly below).</p></li>\n<li><p>Click the Stop button above to terminate the server and continue being able to edit code in the worksheet.</p></li>\n</ul>\n"}︡
︠49c1fdab-05d2-40f6-9c2d-3842dcf68ca4︠
salvus.project_info()['project_id']
︡7326e14e-05c1-4132-978f-86859ad0f4b3︡{"stdout":"u'ebf87cdc-c0e2-46c9-b242-87d96eaee5f6'\n"}︡
︠4b37ce47-0a38-4112-8645-7673353219ab︠
%go
import (
    "fmt"
    "net/http"
)

type Hello struct{}

func (h Hello) ServeHTTP(
    w http.ResponseWriter,
    r *http.Request) {
    fmt.Fprint(w, "Hello!")
}

func main() {
    var h Hello
    http.ListenAndServe(":4000", h)
}
︠3c6df77d-75ab-4e85-97c0-1426684cee18i︠

%md
# Exercise: HTTP Handlers

Implement the following types and define ServeHTTP methods on them. Register them to handle specific paths in your web server.

    type String string

    type Struct struct {
        Greeting string
        Punct    string
        Who      string
    }

For example, you should be able to register handlers using:

    http.Handle("/string", String("I'm a frayed knot."))
    http.Handle("/struct", &Struct{"Hello", ":", "Gophers!"})

<br><br>
**WARNING:** In SageMathCloud you have to instead handle urls like `/<project_id>/port/4000/string`, unfortunately.
︡f0e0265b-d10e-472e-ae44-30f5e69313e1︡{"html":"<h1>Exercise: HTTP Handlers</h1>\n\n<p>Implement the following types and define ServeHTTP methods on them. Register them to handle specific paths in your web server.</p>\n\n<pre><code>type String string\n\ntype Struct struct {\n    Greeting string\n    Punct    string\n    Who      string\n}\n</code></pre>\n\n<p>For example, you should be able to register handlers using:</p>\n\n<pre><code>http.Handle(\"/string\", String(\"I'm a frayed knot.\"))\nhttp.Handle(\"/struct\", &amp;Struct{\"Hello\", \":\", \"Gophers!\"})\n</code></pre>\n\n<p><br><br>\n<strong>WARNING:</strong> In SageMathCloud you have to instead handle urls like <code>/&lt;project_id&gt;/port/4000/string</code>, unfortunately.</p>\n"}︡
︠ba1fc0a0-e2a2-43bf-82f7-9dc6b6065f01︠
%go

import (
    "net/http"
)

func main() {
    // your http.Handle calls here
    http.ListenAndServe("localhost:4000", nil)
}
︠15fe4319-0460-4748-939b-7a87c709be4bi︠
%md
# Images

Package image defines the Image interface:

    package image

    type Image interface {
        ColorModel() color.Model
        Bounds() Rectangle
        At(x, y int) color.Color
    }

(See [the documentation](http://golang.org/pkg/image/#Image) for all the details.)

Also, `color.Color` and `color.Model` are interfaces, but we'll ignore that by using the predefined implementations `color.RGBA` and `color.RGBAModel`. These interfaces and types are specified by the [image/color package](http://golang.org/pkg/image/color/).
︡9a5d1cbb-adad-4485-9e5d-fb64fc5aea98︡{"html":"<h1>Images</h1>\n\n<p>Package image defines the Image interface:</p>\n\n<pre><code>package image\n\ntype Image interface {\n    ColorModel() color.Model\n    Bounds() Rectangle\n    At(x, y int) color.Color\n}\n</code></pre>\n\n<p>(See <a href=\"http://golang.org/pkg/image/#Image\">the documentation</a> for all the details.)</p>\n\n<p>Also, <code>color.Color</code> and <code>color.Model</code> are interfaces, but we&#8217;ll ignore that by using the predefined implementations <code>color.RGBA</code> and <code>color.RGBAModel</code>. These interfaces and types are specified by the <a href=\"http://golang.org/pkg/image/color/\">image/color package</a>.</p>\n"}︡
︠a9c2dec6-0352-4411-8c29-3525730696eb︠
%go
import (
    "fmt"
    "image"
)

func main() {
    m := image.NewRGBA(image.Rect(0, 0, 100, 100))
    fmt.Println(m.Bounds())
    fmt.Println(m.At(0, 0).RGBA())
}
︡fc268c70-9e5d-4182-899a-2fa5b5fceddb︡{"stdout":"(0,0)-(100,100)\n0 0 0 0\n"}︡
︠fceae8db-c562-4096-a57b-86be1c3dddeei︠
%md
# Exercise: Images

Remember the picture generator you wrote earlier? Let's write another one, but this time it will return an implementation of image.Image instead of a slice of data.

Define your own Image type, implement [the necessary methods](http://golang.org/pkg/image/#Image), and call `pic.ShowImage`.

Bounds should return a image.Rectangle, like `image.Rect(0, 0, w, h)`.

ColorModel should return color.RGBAModel.

At should return a color; the value v in the last picture generator corresponds to color.RGBA{v, v, 255, 255} in this one.

**WARNING:** I have no idea how to make this work in SageMathCloud.
︡aa2af1bf-0edd-4873-9855-bc915503110b︡{"html":"<h1>Exercise: Images</h1>\n\n<p>Remember the picture generator you wrote earlier? Let&#8217;s write another one, but this time it will return an implementation of image.Image instead of a slice of data.</p>\n\n<p>Define your own Image type, implement <a href=\"http://golang.org/pkg/image/#Image\">the necessary methods</a>, and call <code>pic.ShowImage</code>.</p>\n\n<p>Bounds should return a image.Rectangle, like <code>image.Rect(0, 0, w, h)</code>.</p>\n\n<p>ColorModel should return color.RGBAModel.</p>\n\n<p>At should return a color; the value v in the last picture generator corresponds to color.RGBA{v, v, 255, 255} in this one.</p>\n\n<p><strong>WARNING:</strong> I have no idea how to make this work in SageMathCloud.</p>\n"}︡
︠4f53f40d-4371-49b7-8cb3-398e83029772︠
%go

import (
    "code.google.com/p/go-tour/pic"
    "image"
)

type Image struct{}

func main() {
    m := Image{}
    pic.ShowImage(m)
}
︠4e8ced92-27a7-4443-84a3-d06cc1a23febi︠
%md
# Exercise: Rot13 Reader

A common pattern is an `io.Reader` that wraps another `io.Reader`, modifying the stream in some way.

For example, the `gzip.NewReader` function takes an `io.Reader` (a stream of gzipped data) and returns a `*gzip.Reader` that also implements `io.Reader` (a stream of the decompressed data).

Implement a `rot13Reader` that implements `io.Reader` and reads from an `io.Reader`, modifying the stream by applying the ROT13 substitution cipher to all alphabetical characters.

The `rot13Reader` type is provided for you. Make it an `io.Reader` by implementing its `Read` method.
︡f79d5829-49de-4f62-bd15-447963d64575︡{"html":"<h1>Exercise: Rot13 Reader</h1>\n\n<p>A common pattern is an <code>io.Reader</code> that wraps another <code>io.Reader</code>, modifying the stream in some way.</p>\n\n<p>For example, the <code>gzip.NewReader</code> function takes an <code>io.Reader</code> (a stream of gzipped data) and returns a <code>*gzip.Reader</code> that also implements <code>io.Reader</code> (a stream of the decompressed data).</p>\n\n<p>Implement a <code>rot13Reader</code> that implements <code>io.Reader</code> and reads from an <code>io.Reader</code>, modifying the stream by applying the ROT13 substitution cipher to all alphabetical characters.</p>\n\n<p>The <code>rot13Reader</code> type is provided for you. Make it an <code>io.Reader</code> by implementing its <code>Read</code> method.</p>\n"}︡
︠f264369f-15eb-4b63-966b-38c3f7e3eebcs︠
%go


import (
    "io"
    "os"
    "strings"
)

type rot13Reader struct {
    r io.Reader
}

func (rot *rot13Reader) Read(p []byte) (n int, err error) {
	n,err = rot.r.Read(p)
	for i := 0; i < len(p); i++ {
		if (p[i] >= 'A' && p[i] < 'N') || (p[i] >='a' && p[i] < 'n') {
			p[i] += 13
		} else if (p[i] > 'M' && p[i] <= 'Z') || (p[i] > 'm' && p[i] <= 'z'){
			p[i] -= 13
		}
	}
	return
}

func main() {
    s := strings.NewReader(
        "Lbh penpxrq gur pbqr!")
    r := rot13Reader{s}
    io.Copy(os.Stdout, &r)
}
︡34a2c829-73e0-4a6c-a5e1-52348dd91f94︡︡{"stdout":"You cracked the code!","done":false}︡{"done":true}
︠109c999b-00bf-4e6c-893a-b3260fb3a6aai︠
%md
# Concurrency

The next section covers Go's concurrency primitives.
︡c5fb3023-5923-4c26-9d80-2ca4b7782d0e︡{"html":"<h1>Concurrency</h1>\n\n<p>The next section covers Go&#8217;s concurrency primitives.</p>\n"}︡
︠b6645450-6575-40f3-aaa5-9726811d1514i︠
%md
# Goroutines

A goroutine is a lightweight thread managed by the Go runtime.

    go f(x, y, z)

starts a new goroutine running

    f(x, y, z)

The evaluation of f, x, y, and z happens in the current goroutine and the execution of f happens in the new goroutine.

Goroutines run in the same address space, so access to shared memory must be synchronized. The sync package provides useful primitives, although you won't need them much in Go as there are other primitives. (See the next slide.)
︡b2022b74-0a2d-4a9e-a11f-55080116c3b8︡{"html":"<h1>Goroutines</h1>\n\n<p>A goroutine is a lightweight thread managed by the Go runtime.</p>\n\n<pre><code>go f(x, y, z)\n</code></pre>\n\n<p>starts a new goroutine running</p>\n\n<pre><code>f(x, y, z)\n</code></pre>\n\n<p>The evaluation of f, x, y, and z happens in the current goroutine and the execution of f happens in the new goroutine.</p>\n\n<p>Goroutines run in the same address space, so access to shared memory must be synchronized. The sync package provides useful primitives, although you won&#8217;t need them much in Go as there are other primitives. (See the next slide.)</p>\n"}︡
︠fe281648-ca7c-4ed2-8aa3-4d31790f4eed︠
%go

import (
    "fmt"
    "time"
)

func say(s string) {
    for i := 0; i < 5; i++ {
        time.Sleep(100 * time.Millisecond)
        fmt.Println(s)
    }
}

func main() {
    go say("sage")
    go say("world")
    say("hello")
}
︡f40c3302-06b8-4e15-b544-6621e85bc1b5︡{"stdout":"hello\nsage\nworld\nhello\nsage\nworld\nhello\nsage\nworld\nhello\nsage\nworld\nhello\n"}︡
︠16dc5732-8b73-4e05-a6b0-0411d61eb0a4i︠
%md
# Channels

Channels are a typed conduit through which you can send and receive values with the channel operator, <-.

    ch <- v    // Send v to channel ch.
    v := <-ch  // Receive from ch, and
               // assign value to v.

(The data flows in the direction of the arrow.)

Like maps and slices, channels must be created before use:

    ch := make(chan int)

By default, sends and receives block until the other side is ready. This allows goroutines to synchronize without explicit locks or condition variables.
︡529d8ccc-c78a-4465-a493-fe53f6e2f239︡{"html":"<h1>Channels</h1>\n\n<p>Channels are a typed conduit through which you can send and receive values with the channel operator, &lt;-.</p>\n\n<pre><code>ch &lt;- v    // Send v to channel ch.\nv := &lt;-ch  // Receive from ch, and\n           // assign value to v.\n</code></pre>\n\n<p>(The data flows in the direction of the arrow.)</p>\n\n<p>Like maps and slices, channels must be created before use:</p>\n\n<pre><code>ch := make(chan int)\n</code></pre>\n\n<p>By default, sends and receives block until the other side is ready. This allows goroutines to synchronize without explicit locks or condition variables.</p>\n"}︡
︠8e7c83f2-c98a-4053-b52e-50e224195fe9︠
%go

func sum(a []int, c chan int) {
    sum := 0
    for _, v := range a {
        sum += v
    }
    c <- sum // send sum to c
}

func main() {
    a := []int{7, 2, 8, -9, 4, 0}

    c := make(chan int)
    go sum(a[:len(a)/2], c)
    go sum(a[len(a)/2:], c)
    x, y := <-c, <-c // receive from c

    fmt.Println(x, y, x+y)
}
︡390d3b13-630d-48c9-8944-fc439f8815be︡{"stdout":"17 -5 12\n"}︡
︠e2868dd4-a520-4fdb-8d5b-08c504ffe46ei︠
%md
# Buffered Channels

Channels can be buffered. Provide the buffer length as the second argument to make to initialize a buffered channel:

    ch := make(chan int, 100)

Sends to a buffered channel block only when the buffer is full. Receives block when the buffer is empty.

Modify the example to overfill the buffer and see what happens.
︡37fb95e0-0014-4793-9689-19a4bcaf4d85︡{"html":"<h1>Buffered Channels</h1>\n\n<p>Channels can be buffered. Provide the buffer length as the second argument to make to initialize a buffered channel:</p>\n\n<pre><code>ch := make(chan int, 100)\n</code></pre>\n\n<p>Sends to a buffered channel block only when the buffer is full. Receives block when the buffer is empty.</p>\n\n<p>Modify the example to overfill the buffer and see what happens.</p>\n"}︡
︠1c95ce30-0a3e-4ea9-a39c-1122f40d5784︠
%go

func main() {
    c := make(chan int, 2)
    c <- 1
    c <- 2
    fmt.Println(<-c)
    fmt.Println(<-c)
}
︡65d199a2-ae63-4f80-b2a7-869fc11e084a︡{"stdout":"1\n2\n"}︡
︠14e1fca0-ebd1-460d-8cef-f438a435674fi︠
%md

# Range and Close

A sender can close a channel to indicate that no more values will be sent. Receivers can test whether a channel has been closed by assigning a second parameter to the receive expression: after

    v, ok := <-ch

ok is false if there are no more values to receive and the channel is closed.

The `loop for i := range c` receives values from the channel repeatedly until it is closed.

**Note:** Only the sender should close a channel, never the receiver. Sending on a closed channel will cause a panic.

**Another note:** Channels aren't like files; you don't usually need to close them. Closing is only necessary when the receiver must be told there are no more values coming, such as to terminate a range loop.

︡3c53dc67-b363-422c-8f6f-f27b26f374bf︡{"html":"<h1>Range and Close</h1>\n\n<p>A sender can close a channel to indicate that no more values will be sent. Receivers can test whether a channel has been closed by assigning a second parameter to the receive expression: after</p>\n\n<pre><code>v, ok := &lt;-ch\n</code></pre>\n\n<p>ok is false if there are no more values to receive and the channel is closed.</p>\n\n<p>The <code>loop for i := range c</code> receives values from the channel repeatedly until it is closed.</p>\n\n<p><strong>Note:</strong> Only the sender should close a channel, never the receiver. Sending on a closed channel will cause a panic.</p>\n\n<p><strong>Another note:</strong> Channels aren&#8217;t like files; you don&#8217;t usually need to close them. Closing is only necessary when the receiver must be told there are no more values coming, such as to terminate a range loop.</p>\n"}︡
︠b134742f-9022-429f-a839-011e83cd6a5a︠
%go

func fibonacci(n int, c chan int) {
    x, y := 0, 1
    for i := 0; i < n; i++ {
        c <- x
        x, y = y, x+y
    }
    close(c)
}

func main() {
    c := make(chan int, 10)
    go fibonacci(cap(c), c)
    for i := range c {
        fmt.Println(i)
    }
}
︡8eac2f82-6715-4ccf-a523-83aa0a8306bf︡{"stdout":"0\n1\n1\n2\n3\n5\n8\n13\n21\n34\n"}︡
︠ba541fca-e133-4010-bfbb-94aeb35fd979i︠
%md

# Select

The select statement lets a goroutine wait on multiple communication operations.

A select blocks until one of its cases can run, then it executes that case. It chooses one at random if multiple are ready.
︡7771a1c8-ab48-43f9-8ced-28d1d0feff43︡{"html":"<h1>Select</h1>\n\n<p>The select statement lets a goroutine wait on multiple communication operations.</p>\n\n<p>A select blocks until one of its cases can run, then it executes that case. It chooses one at random if multiple are ready.</p>\n"}︡
︠3d297ec4-6214-4719-b65c-a8256720b615︠
%go

func fibonacci(c, quit chan int) {
    x, y := 0, 1
    for {
        select {
        case c <- x:
            x, y = y, x+y
        case <-quit:
            fmt.Println("quit")
            return
        }
    }
}

func main() {
    c := make(chan int)
    quit := make(chan int)
    go func() {
        for i := 0; i < 10; i++ {
            fmt.Println(<-c)
        }
        quit <- 0
    }()
    fibonacci(c, quit)
}
︡deea3cf8-6350-4e8e-8edc-e595438c645f︡{"stdout":"0\n1\n1\n2\n3\n5\n8\n13\n21\n34\nquit\n"}︡
︠d6399ba0-6603-4c64-8b61-7f25cbf4d225i︠
%md
# Default Selection

The default case in a select is run if no other case is ready.

Use a default case to try a send or receive without blocking:

    select {
    case i := <-c:
        // use i
    default:
        // receiving from c would block
    }
︡e76b3723-bf06-432e-80ea-de97a64e0153︡{"html":"<h1>Default Selection</h1>\n\n<p>The default case in a select is run if no other case is ready.</p>\n\n<p>Use a default case to try a send or receive without blocking:</p>\n\n<pre><code>select {\ncase i := &lt;-c:\n    // use i\ndefault:\n    // receiving from c would block\n}\n</code></pre>\n"}︡
︠2f25ba16-038f-4527-adb6-a89c29df6a32︠
%go

import (
    "fmt"
    "time"
)

func main() {
    tick := time.Tick(100 * time.Millisecond)
    boom := time.After(500 * time.Millisecond)
    for {
        select {
        case <-tick:
            fmt.Println("tick.")
        case <-boom:
            fmt.Println("BOOM!")
            return
        default:
            fmt.Println("    .")
            time.Sleep(50 * time.Millisecond)
        }
    }
}
︡7883bd76-d4f0-4038-a2f5-b18fb50d9a01︡{"stdout":"    .\n    .\ntick.\n    .\n    .\ntick.\n    .\n    .\ntick.\n    .\n    .\ntick.\n    .\n    .\nBOOM!\n"}︡
︠5e79146e-f801-44fd-af3c-b91f126708cc︠

︠ceececa9-ad05-4215-ab56-6c6140a7cca0i︠
%md

# Exercise: Equivalent Binary Trees

There can be many different binary trees with the same sequence of values stored at the leaves. For example, here are two binary trees storing the sequence 1, 1, 2, 3, 5, 8, 13.

<img src="http://tour.golang.org/static/tree.png">


A function to check whether two binary trees store the same sequence is quite complex in most languages. We'll use Go's concurrency and channels to write a simple solution.

This example uses the tree package, which defines the type:

    type Tree struct {
        Left  *Tree
        Value int
        Right *Tree
    }
︡29b7741a-7b10-42a4-bce7-b1cf8d3f4ffd︡{"html":"<h1>Exercise: Equivalent Binary Trees</h1>\n\n<p>There can be many different binary trees with the same sequence of values stored at the leaves. For example, here are two binary trees storing the sequence 1, 1, 2, 3, 5, 8, 13.</p>\n\n<p><img src=\"http://tour.golang.org/static/tree.png\"></p>\n\n<p>A function to check whether two binary trees store the same sequence is quite complex in most languages. We&#8217;ll use Go&#8217;s concurrency and channels to write a simple solution.</p>\n\n<p>This example uses the tree package, which defines the type:</p>\n\n<pre><code>type Tree struct {\n    Left  *Tree\n    Value int\n    Right *Tree\n}\n</code></pre>\n"}︡
︠d2981976-62e9-4b17-a27a-634fcd2743cbi︠
%md
# Exercise: Equivalent Binary Trees

1. Implement the Walk function.

2. Test the Walk function.

The function tree.New(k) constructs a randomly-structured binary tree holding the values k, 2k, 3k, ..., 10k.

Create a new channel ch and kick off the walker:

go Walk(tree.New(1), ch)
Then read and print 10 values from the channel. It should be the numbers 1, 2, 3, ..., 10.

3. Implement the Same function using Walk to determine whether t1 and t2 store the same values.

4. Test the Same function.

Same(tree.New(1), tree.New(1)) should return true, and Same(tree.New(1), tree.New(2)) should return false.
︡8ad77c0c-7d11-4d2c-a5f1-83534e3ae025︡{"html":"<h1>Exercise: Equivalent Binary Trees</h1>\n\n<ol>\n<li><p>Implement the Walk function.</p></li>\n<li><p>Test the Walk function.</p></li>\n</ol>\n\n<p>The function tree.New(k) constructs a randomly-structured binary tree holding the values k, 2k, 3k, &#8230;, 10k.</p>\n\n<p>Create a new channel ch and kick off the walker:</p>\n\n<p>go Walk(tree.New(1), ch)\nThen read and print 10 values from the channel. It should be the numbers 1, 2, 3, &#8230;, 10.</p>\n\n<ol>\n<li><p>Implement the Same function using Walk to determine whether t1 and t2 store the same values.</p></li>\n<li><p>Test the Same function.</p></li>\n</ol>\n\n<p>Same(tree.New(1), tree.New(1)) should return true, and Same(tree.New(1), tree.New(2)) should return false.</p>\n"}︡
︠d7e62288-03eb-421c-b6c0-db931e0da8f3︠
%go

import "code.google.com/p/go-tour/tree"

// Walk walks the tree t sending all values
// from the tree to the channel ch.
func Walk(t *tree.Tree, ch chan int)

// Same determines whether the trees
// t1 and t2 contain the same values.
func Same(t1, t2 *tree.Tree) bool

func main() {
}
︡f6352592-46e4-4c4d-8139-8704b53b0410︡{"stderr":"dee55870-8c5d-4cdd-848e-52794891c767.go:3:8: cannot find package \"code.google.com/p/go-tour/tree\" in any of:\n\t/usr/lib/go/src/pkg/code.google.com/p/go-tour/tree (from $GOROOT)\n\t($GOPATH not set)\n"}︡
︠f1910dc8-d054-4be7-b653-6b6c97dafc42i︠
%md

# Exercise: Web Crawler

In this exercise you'll use Go's concurrency features to parallelize a web crawler.

Modify the Crawl function to fetch URLs in parallel without fetching the same URL twice.

**NOTE:** Heh, I'm not sure I want you running this in SageMathCloud... :-)
︡44462e4a-835a-4edc-8cb3-1598f5938ab6︡{"html":"<h1>Exercise: Web Crawler</h1>\n\n<p>In this exercise you&#8217;ll use Go&#8217;s concurrency features to parallelize a web crawler.</p>\n\n<p>Modify the Crawl function to fetch URLs in parallel without fetching the same URL twice.</p>\n\n<p><strong>NOTE:</strong> Heh, I&#8217;m not sure I want you running this in SageMathCloud&#8230; :-)</p>\n"}︡
︠b90a7db5-7eb2-4024-b6b0-5df33cd92045︠
%go

import (
    "fmt"
)

type Fetcher interface {
    // Fetch returns the body of URL and
    // a slice of URLs found on that page.
    Fetch(url string) (body string, urls []string, err error)
}

// Crawl uses fetcher to recursively crawl
// pages starting with url, to a maximum of depth.
func Crawl(url string, depth int, fetcher Fetcher) {
    // TODO: Fetch URLs in parallel.
    // TODO: Don't fetch the same URL twice.
    // This implementation doesn't do either:
    if depth <= 0 {
        return
    }
    body, urls, err := fetcher.Fetch(url)
    if err != nil {
        fmt.Println(err)
        return
    }
    fmt.Printf("found: %s %q\n", url, body)
    for _, u := range urls {
        Crawl(u, depth-1, fetcher)
    }
    return
}

func main() {
    Crawl("http://golang.org/", 4, fetcher)
}

// fakeFetcher is Fetcher that returns canned results.
type fakeFetcher map[string]*fakeResult

type fakeResult struct {
    body string
    urls []string
}

func (f fakeFetcher) Fetch(url string) (string, []string, error) {
    if res, ok := f[url]; ok {
        return res.body, res.urls, nil
    }
    return "", nil, fmt.Errorf("not found: %s", url)
}

// fetcher is a populated fakeFetcher.
var fetcher = fakeFetcher{
    "http://golang.org/": &fakeResult{
        "The Go Programming Language",
        []string{
            "http://golang.org/pkg/",
            "http://golang.org/cmd/",
        },
    },
    "http://golang.org/pkg/": &fakeResult{
        "Packages",
        []string{
            "http://golang.org/",
            "http://golang.org/cmd/",
            "http://golang.org/pkg/fmt/",
            "http://golang.org/pkg/os/",
        },
    },
    "http://golang.org/pkg/fmt/": &fakeResult{
        "Package fmt",
        []string{
            "http://golang.org/",
            "http://golang.org/pkg/",
        },
    },
    "http://golang.org/pkg/os/": &fakeResult{
        "Package os",
        []string{
            "http://golang.org/",
            "http://golang.org/pkg/",
        },
    },
}

︠6617b840-a653-4f55-9031-903f4ea69548i︠

%md
# Where to Go from here...

- See <http://tour.golang.org/#74> for documentation and other resources.

- In SageMathCloud you can write go code in files such as `foo.go`, then compile and run them using the command line terminal by typing `go build foo.go`.  To create a file, click "+New", type the file name, then press enter.
︡8de22416-d4cc-43c1-9217-7f473846994e︡{"html":"<h1>Where to Go from here&#8230;</h1>\n\n<ul>\n<li><p>See <a href=\"http://tour.golang.org/#74\">http://tour.golang.org/#74</a> for documentation and other resources.</p></li>\n<li><p>In SageMathCloud you can write go code in files such as <code>foo.go</code>, then compile and run them using the command line terminal by typing <code>go build foo.go</code>.  To create a file, click &#8220;+New&#8221;, type the file name, then press enter.</p></li>\n</ul>\n"}︡
︠e2d23dae-b9dc-41d3-a9e1-2eac6a3dc133︠









