︠31c5aaba-292e-4761-9ce2-419e9ecea4adi︠
%md
# RPy2
[RPy2](http://rpy.sourceforge.net/) is a Python module for interacting with R from Python.
It exposes functions, packages and more in Python and allows to reference them.
Dots in R functions are automatically converted to underscores.
Additionally, data conversions for various types can be enabled - first and foremost for NumPy arrays.
︡1b0cdb5a-1475-4782-9419-395d8a7ccbd2︡{"html":"<h1>RPy2</h1>\n\n<p><a href=\"http://rpy.sourceforge.net/\">RPy2</a> is a Python module for interacting with R from Python.\nIt exposes functions, packages and more in Python and allows to reference them.\nDots in R functions are automatically converted to underscores.\nAdditionally, data conversions for various types can be enabled - first and foremost for NumPy arrays.</p>\n"}︡
︠f151961f-082d-44a6-a403-c7706a0d6bb4a︠
%auto
%default_mode python #pure python mode
import numpy as np
import rpy2
import rpy2.robjects as robjects
from rpy2.robjects.packages import importr
rpy2.__version__
︡75016008-a409-40b5-a813-a5a409208075︡{"auto":true}︡{"stdout":"'2.3.8'\n"}︡
︠a3bb2d3d-b5f3-42b6-a94c-0add5b823b54i︠
%md
### Referencing R functions
RPy2's `robjects` (or sometimes just imported as `ro`) exposes the R instance as `.r`.
It is rather easy to get hold of functions and reference them from Python:
︡86ee80c6-760a-4024-9f65-36844f66d75f︡{"html":"<h3>Referencing R functions</h3>\n\n<p>RPy2&#8217;s <code>robjects</code> (or sometimes just imported as <code>ro</code>) exposes the R instance as <code>.r</code>.\nIt is rather easy to get hold of functions and reference them from Python:</p>\n"}︡
︠08150b38-b19e-4975-b9e4-470916ea8f28︠
c = robjects.r['c']
summary = robjects.r['summary']
︠753c2844-6bd8-4199-bdbd-41aba057798c︠
v1 = c(5,4.4,1,-1.8)
sumv1 = summary(v1)
print sumv1.__repr__()
︡fb8b71ec-001f-4f58-ad48-a13e32697193︡{"stdout":"<FloatVector - Python:0x993d4d0 / R:0xcceffd0>\n[-1.800000, 0.300000, 2.700000, 2.150000, 4.550000, 5.000000]\n"}︡
︠2a554e52-b207-4eb2-a6ad-0ce14f5d0adc︠
print sumv1
︡e9c4347d-7986-4df1-9f2c-ab99bc724f33︡{"stdout":"   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. \n  -1.80    0.30    2.70    2.15    4.55    5.00 \n\n"}︡
︠c1883ade-70ce-4b99-aa5e-adba5a2d84fa︠
sumv1[3]
︡87f4ffcf-5f32-410d-9feb-18b67e450fcc︡{"stdout":"2.15\n"}︡
︠ba9d8e2e-283f-456b-8c66-24242ea614e5i︠
%md
### Evaluating R code directly
︡1e41724d-428f-46a2-9766-aaa95c5e6b92︡{"html":"<h3>Evaluating R code directly</h3>\n"}︡
︠65244f5f-3779-42b3-a734-24c7ae2a5a96︠
robjects.reval("""\
zz <- 1:10
print(paste("sd(zz) = ", sd(zz)))
""")
︡3f4c427e-6f73-48a8-bd46-c70f49d556f7︡{"stdout":"[1] \"sd(zz) =  3.02765035409749\"\n<rpy2.rinterface.SexpVector - Python:0x8e6df90 / R:0xec85f58>\n"}︡
︠4057441f-b896-49c1-99eb-ae23a50032d4︠
︡d3000352-0e75-452b-a467-38c164638e32︡{"html":"<h3>Custom Functions</h3>\n\n<p>The following unnamed function object is generated in R and its referenced passed back into Python and stored in the <code>myfunc</code> varianble.</p>\n"}︡
︠bc70060d-092f-4742-95f3-c3ae64527fdd︠
myfunc = robjects.r("""\
function(x) {
   k <- x^2 + rnorm(1)
   k <- 2 * k + 1
   return(k)
}""")
︡05c57b8c-325e-4d66-ab2d-92b803cea21a︡
︠668eb0b4-6b64-4522-91ea-42426e1a859b︠
myfunc(2.)
︡fa8e8f23-950e-41d0-9b83-676f9afe5b87︡{"stdout":"<FloatVector - Python:0x993d440 / R:0xca9e1a8>\n[7.645941]\n"}︡
︠a4d4c5cd-c609-4fc3-a7ef-93bb94939387i︠
%md
### Vectorization
First, enable automatic conversion from NumPy arrays to R arrays.
Then, even the custom function works out of the box.
︡6422aa24-bc36-4800-aefd-bde93cf83014︡{"html":"<h3>Vectorization</h3>\n\n<p>First, enable automatic conversion from NumPy arrays to R arrays.\nThen, even the custom function works out of the box.</p>\n"}︡
︠f899be96-cbb3-468c-946a-af4b125ed1cd︠
from rpy2.robjects.numpy2ri import numpy2ri
robjects.conversion.py2ri = numpy2ri
︡247821ed-ea98-4756-965d-161dff1b3aa3︡
︠c4a06e88-a79d-4713-a981-e14d50d8704b︠
xx = np.array([5,4,2.2,-1,-5.5])
print "Data Type:   ", type(xx)
print "Element Type:", xx.dtype
print "Array Shape: ", xx.shape
︡7a946ba2-a71f-40d7-9838-5aad43634402︡{"stdout":"Data Type:    <type 'numpy.ndarray'>\n"}︡{"stdout":"Element Type: float64\n"}︡{"stdout":"Array Shape:  (5,)\n"}︡
︠5260ca95-2c50-4572-acf9-726ccf08549b︠
summary(xx)
︡c597ee16-9813-44db-ab6c-e924eaa5071f︡{"stdout":"<FloatVector - Python:0xce8de18 / R:0xbdbc768>\n[-5.500000, -1.000000, 2.200000, 0.940000, 4.000000, 5.000000]\n"}︡
︠173bcae2-8d69-447f-b590-0fcaf954e08c︠
myfunc(xx)
︡7aa107de-761c-4ed3-a745-668a4fa9775b︡{"stdout":"<Array - Python:0xce8def0 / R:0xb88ada0>\n[53.485802, 35.485802, 13.165802, 5.485802, 63.985802]\n"}︡
︠15e91fea-9588-4637-b429-a88b75970afd︠

︠040cbcd3-100d-4aaf-9fc9-92b3dff3200fi︠
%md
### Types of Vectors
### `[ ]` and `[[  ]]` are `rx` and `rx2`
︡f961e838-437f-4c93-9629-386a7f40cdee︡{"html":"<h3>Types of Vectors</h3>\n\n<h3><code>[ ]</code> and <code>[[  ]]</code> are <code>rx</code> and <code>rx2</code></h3>\n"}︡
︠147bd829-d78b-4ecb-9f3d-0a6c8a980f88︠
# Python style: (10 exclusive)
# v1 = robjects.IntVector(range(1,10))
# R style: (10 inclusive)
v1 = robjects.r.seq(1,10)
print v1
︡ec0898b3-25a5-456c-ae9e-1d8494f16f80︡{"stdout":" [1]  1  2  3  4  5  6  7  8  9 10\n\n"}︡
︠eec9f3a7-f203-4891-869f-91f78414d76d︠
# Python style, 0-based indexing of vectors
print v1[0]
v1[0] = -99
print v1
︡1b13c4c5-2bb5-4632-bfe3-961fe6eb099d︡{"stdout":"1\n"}︡{"stdout":" [1] -99   2   3   4   5   6   7   8   9  10\n\n"}︡
︠0c3cec50-9aa9-4e40-8ea9-ea9725a65d7e︠
# R style, 1-based indexing
v1.rx[3] = 99
print v1.rx(3)

︡5ddb4fef-f2c2-4081-83a4-644668e12ae9︡{"stdout":"[1] 99\n\n"}︡
︠ace975cd-4964-4d26-88fb-2532e88d1784︠
l1 = robjects.r("list(aa = c(1,2,3), bb = c(-5,5), cc = 'help')")
print l1
︡14448762-54e7-44c5-a5a8-791688308168︡{"stdout":"$aa\n[1] 1 2 3\n\n$bb\n[1] -5  5\n\n$cc\n[1] \"help\"\n\n\n"}︡
︠e47cf3dc-037b-4b34-8fc4-c2e9a5c240cc︠
# R's [[1]]
print l1.rx2(1)
︡f762c995-bef1-48d2-8f46-4e0695c2894b︡{"stdout":"[1] 1 2 3\n\n"}︡
︠b95270c9-5ccf-420b-8f67-065b8afba88f︠
# Constructing the same from Python is harder, since we need an ordered dictionary
import rpy2.rlike.container as rlc
l2 = robjects.ListVector(
         rlc.OrdDict((
              ('aa', robjects.IntVector([1,2,3])),
              ('bb', robjects.IntVector([-5,5])),
              ('cc', "help"))))
print l2
︡5d6b2890-1d7a-449f-924a-cd4474b6e010︡{"stdout":"$aa\n[1] 1 2 3\n\n$bb\n[1] -5  5\n\n$cc\n[1] \"help\"\n\n\n"}︡
︠34423b7d-e08a-4926-ab23-9ff3489367f9︠
# assigning a new string vector to "bb"
l1.rx2["bb"] = robjects.StrVector("this is a short sentence".split())
print(l1[l1.names.index("bb")])
︡e4fdd101-0ef2-46a4-b983-9015d1192f47︡{"stdout":"[1] \"this\"     \"is\"       \"a\"        \"short\"    \"sentence\"\n\n"}︡
︠059cd82a-e06f-45cf-b0a1-2915fc4c7561︠
# Matrix
︠caa26080-2351-4bb2-897a-940d071da6b5︠
m = robjects.r.matrix(range(10), nrow=5)
print(m)
︡0e7f97ce-dcd4-42d0-a160-b575a19dc25f︡{"stdout":"     [,1] [,2]\n[1,] 0    5   \n[2,] 1    6   \n[3,] 2    7   \n[4,] 3    8   \n[5,] 4    9   \n\n"}︡
︠c38456a9-ca79-4eb4-a2aa-ee92c8d01d29︠
m.rx2(4,2)
︡33c23ac5-70db-411a-9bfb-710f3081a075︡{"stdout":"<IntVector - Python:0xd9365f0 / R:0xefe4bf8>\n[       8]\n"}︡
︠b32fe8d8-2858-4294-91af-79b35f64aee2︠
# R-operators work, too
print(m.ro > 5)
︡8c14f48d-9d3d-4e43-8cdb-ad92e17c6842︡{"stdout":"      [,1]  [,2]\n[1,] FALSE FALSE\n[2,] FALSE  TRUE\n[3,] FALSE  TRUE\n[4,] FALSE  TRUE\n[5,] FALSE  TRUE\n\n"}︡
︠abae6f14-40ca-4f05-981d-e57612d7da93︠
print m.rx((m.ro > 3).ro & (m.ro <= 6))

︡65e18cf7-6e20-4441-97cd-80af76dc15fb︡{"stdout":"[[1]]\n[1] 4\n\n[[2]]\n[1] 5\n\n[[3]]\n[1] 6\n\n\n"}︡
︠57064f6d-44ac-4ade-97ef-081a26832c1ai︠
%md
### Bonus: Factors
︡e22474db-4bce-4fb2-906e-e300a5c5fab5︡{"html":"<h3>Bonus: Factors</h3>\n"}︡
︠a45684b3-6f03-4571-9529-65c5ce39ce24︠
sv = robjects.StrVector('xyyyxyzyzyxx')
fac = robjects.FactorVector(sv)
print(fac)
︡ae748769-bb53-4bdf-81d4-29a4f2a5a140︡{"stdout":" [1] x y y y x y z y z y x x\nLevels: x y z\n\n"}︡
︠a77083a8-8fb4-4b80-9de0-785117661439︠
print(summary(fac))
︡cad8a349-6fc2-4207-b2b8-d89ba7907932︡{"stdout":"x y z \n4 6 2 \n\n"}︡
︠914d8922-a802-412d-a3ad-c544ad1903dci︠
%md
### Packages
The idea is to get hold of a reference to a package.
The reference is like a module-namespace and populated with all the members.
︡857fdb1a-4562-432d-857c-2dd778afc020︡{"html":"<h3>Packages</h3>\n\n<p>The idea is to get hold of a reference to a package.\nThe reference is like a module-namespace and populated with all the members.</p>\n"}︡
︠a18c1e66-7233-45c1-8483-754271f71f31︠
from rpy2.robjects.packages import importr
r_base = importr("base")
print("a bit of the namespace:")
print(dir(r_base)[-50:-40])
︡473836a9-f735-432d-b75d-dcaa2b3b617d︡{"stdout":"a bit of the namespace:\n"}︡{"stdout":"['upper_tri', 'url', 'utf8ToInt', 'vapply', 'vector', 'version', 'warning', 'warnings', 'weekdays', 'weekdays_Date']\n"}︡
︠029ee09a-8694-42bd-8fa7-2d67fca9ba75︠
print(r_base.version)
︡b67851c4-dbb9-43e4-8137-8225f516a1fe︡{"stdout":"               _                            \nplatform       x86_64-unknown-linux-gnu     \narch           x86_64                       \nos             linux-gnu                    \nsystem         x86_64, linux-gnu            \nstatus                                      \nmajor          2                            \nminor          15.2                         \nyear           2012                         \nmonth          10                           \nday            26                           \nsvn rev        61015                        \nlanguage       R                            \nversion.string R version 2.15.2 (2012-10-26)\nnickname       Trick or Treat               \n\n"}︡
︠60345945-875a-454e-8952-a0f0df6272b0︠
# use Python's `getattr` to access non-standard named identifyers.
# e.g. matrix multiplication applied to two integers.
getattr(r_base, "%*%")(65,9)
︡6e34447d-7ba1-4a98-9e40-260bb88415ad︡{"stdout":"<Matrix - Python:0xd915758 / R:0xed57fe8>\n[585.000000]\n"}︡
︠ddf7c8a4-ad4d-4c0a-9a04-b08cafc324a9︠

︠1dbf1da9-2c8d-497d-9b16-1721438f1118︠
r_base.rep(r_base.c("x", "y", "z"), 10)
︡fb19afa5-a3db-4894-a996-b65bb8f5a68f︡{"stdout":"<StrVector - Python:0xdff1908 / R:0xfc7a170>\n['x', 'y', 'z', ..., 'x', 'y', 'z']\n"}︡
︠3da353d4-4bd4-413f-bea1-8d585f6d1725︠
︡470b543d-4e73-414f-aae8-f2be5fe19620︡
︠440dc108-dfa3-4279-83c8-352845d54ebc︠
r_stats = importr("stats")
︠905e1b00-c8bd-404e-9df3-72e6cdc4a512︠
# datasets
datasets = importr('datasets')
faithful = datasets.__rdata__.fetch("faithful")["faithful"]
print type(faithful)
︡7ccf9bde-9989-48ea-b717-35ddab063652︡{"stdout":"<class 'rpy2.robjects.vectors.DataFrame'>\n"}︡
︠6dc17296-b581-4a6c-aa31-34237e79d88d︠
# number of columns!
len(faithful)
︡ea5ea548-1245-4bba-b0fd-f36fead3886b︡{"stdout":"2\n"}︡
︠cc50e34b-1dd8-4243-b7af-01ac7bf0b5d0︠
# datatypes in R for each column
[column.rclass[0] for column in faithful]
︡5ae4a1f9-f098-405c-a82b-4b4ac5f4b3de︡{"stdout":"['numeric', 'numeric']\n"}︡
︠552ce8f0-2ffe-41e3-a283-6cdfc41d97d5︠
# extract some rows
print(faithful.rx(robjects.IntVector([2,3,4,10]), True))
︡25fc3dc0-796b-401f-9000-cf03b8d944e5︡{"stdout":"   eruptions waiting\n2      1.800      54\n3      3.333      74\n4      2.283      62\n10     4.350      85\n\n"}︡
︠8605de22-3ba6-467f-a5d8-4dddee8910ea︠
# extract part of a column
print(faithful.rx2("eruptions")[:10])
︡f361c185-10cd-4a01-b182-616184ce0fcb︡{"stdout":" [1] 3.600 1.800 3.333 2.283 4.533 2.883 4.700 3.600 1.950 4.350\n\n"}︡
︠cc19b123-5e29-4c0f-ad98-61c6359cc3b9︠

︠bf24cb62-c1b6-4fcc-b920-327abd230720i︠
%md
### Example: `lm`
︡fd33798a-d2f7-40ce-8f85-8ca26fdd0dd5︡{"html":"<h3>Example: <code>lm</code></h3>\n"}︡
︠45ca2419-9840-4d06-ba7b-f61ec648367d︠
data = robjects.DataFrame({
       'y' : np.array([4, 5, 5.5, 7, 7.6, 8, 11, 12, 13]),
       'x' : np.array([1, 2,   3, 4, 4.4, 5, 7,  8, 8.5])
       })
︡61295947-6696-4c1b-a00a-38a09e208610︡
︠0bb9dbd0-bde4-448a-b461-e4a4f3669f85︠
lmod = robjects.r.lm("y ~ x", data = data)
︡f212db05-17b3-421d-9f44-5437ba444e14︡
︠aa5ef93b-b8d6-4b17-bca4-77df4598aaa7︠
print lmod.names
︡05d9ff62-0a34-46e2-8eeb-b46a3961f3ef︡{"stdout":" [1] \"coefficients\"  \"residuals\"     \"effects\"       \"rank\"         \n [5] \"fitted.values\" \"assign\"        \"qr\"            \"df.residual\"  \n [9] \"xlevels\"       \"call\"          \"terms\"         \"model\"        \n\n"}︡
︠31a546ad-4be7-41cc-a53b-1d3dc93f9a09︠
coeffs = lmod.rx2("coefficients")
print "R's representation via 'print'"
print(coeffs)
print
print "Same coefficients in Python's floats:"
print ([x for x in coeffs])
︡b322dfef-8b28-459f-81c0-05056d7973db︡{"stdout":"R's representation via 'print'\n"}︡{"stdout":"(Intercept)           x \n   2.328485    1.215469 \n\n"}︡{"stdout":"\n"}︡{"stdout":"Same coefficients in Python's floats:\n"}︡{"stdout":"[2.328485324947587, 1.2154692791485247]\n"}︡
︠6137da7a-683b-49ef-94f8-f8e5580ef91e︠
# max is from Python, iterates naturally over the entries in all residuals
print max(lmod.rx2("residuals"))

︡95896fce-54d3-4bcb-9b8d-b8fd383878bc︡{"stdout":"0.456045395904\n"}︡
︠8e2f0f08-172c-4aed-985b-49eeef268e32i︠
%md
### Plot
︡765aad12-2bf7-4b3c-9760-eed512ee04fc︡{"html":"<h3>Plot</h3>\n"}︡
︠306277e0-2893-456d-982c-b6befa27356f︠
from rpy2.robjects.packages import importr
grdevices = importr('grDevices')
︡9383a0c9-8fca-436d-85ab-f30202cdcb15︡
︠803df10d-4d5c-48ab-b5a8-dcae626705a0︠
# just calling "plot" on the dataframe
︡9f242b31-733f-4546-8ee1-5bc0e1e4da98︡
︠2158b6a8-07d6-4875-85ef-2cbbda125559︠
_ = grdevices.png(file="rpy2_plot.png", width=640, height=320)
_ = robjects.r.plot(data)
grdevices.dev_off()
︡3d8e84b3-f3e0-4331-8bcb-87d506988f01︡{"stdout":"<IntVector - Python:0xeb4aea8 / R:0x114d0488>\n[       2]\n"}︡
︠d456b05e-1f32-478e-9f00-1f9ccc13163d︠
salvus.file("rpy2_plot.png")
︡ca08b67e-8068-41cc-8a10-1bbf1a5469a1︡{"once":false,"file":{"show":true,"uuid":"c9ae0343-c983-49f3-9018-f8c0b053c189","filename":"rpy2_plot.png"}}︡
︠18a8d0d2-616a-4fb3-adaf-ee93f51d6ba4︠
# Plot of the linear model lmod
︡9e33cb7c-6553-492f-8448-e29a939f0f94︡
︠91a26196-5439-4a7e-9d38-83c4834da04a︠
_ = grdevices.png(file="rpy2_plot_2.png", width=640, height=320)
_ = robjects.r.plot(lmod)
grdevices.dev_off()
︡5ec017d1-944a-48ce-94ba-08ff8647f571︡{"stdout":"<IntVector - Python:0xeb2e8c0 / R:0xf87c808>\n[       2]\n"}︡
︠2ca81aa8-a93b-47e4-b479-45a44dde46d7︠
salvus.file("rpy2_plot_2.png")
︡a1e19d93-101a-4fa0-8212-dfa76b15ae37︡{"once":false,"file":{"show":true,"uuid":"f7d91100-bb88-4532-8085-6d744c312c07","filename":"rpy2_plot_2.png"}}︡
︠b65b1434-1389-4443-8ad9-7cd993074e50︠
# plot of the volcano data, via the "print" identifyer in R
︡eee9e554-d195-4b4d-b78d-aa5877af384d︡
︠8be2bd14-aa69-45bb-867b-da2232ad8121︠
rprint = robjects.globalenv.get("print")
volcano = datasets.__rdata__.fetch("volcano")["volcano"]

_ = grdevices.png(file="rpy2_plot_wireframe.png", width=480, height=480)
p = lattice.wireframe(volcano,
                      shade = True,
                      zlab = "",
                      aspect = robjects.FloatVector((61.0/87, 0.5)),
                      light_source = robjects.IntVector((10,0,10)))
_ = rprint(p)
grdevices.dev_off()
︡b0849451-bf6d-49f7-a511-acd877e313f9︡{"stdout":"<IntVector - Python:0xeb50ef0 / R:0x118de858>\n[       2]\n"}︡
︠eaa7e691-df96-43fd-972e-d4b20669b5ea︠
salvus.file("rpy2_plot_wireframe.png")
︡1eb5856d-a0ff-43d4-8471-17323170006c︡{"once":false,"file":{"show":true,"uuid":"c0058558-2665-4674-a05e-8ed461e85bd9","filename":"rpy2_plot_wireframe.png"}}︡
︠f54e76e3-954b-41f4-b5a8-cf53b03b5a53︠
︡89a9c068-3273-4954-8071-5d113681116a︡{"html":"<h3>Help?</h3>\n"}︡
︠f525166d-28b0-4e0e-9a23-c3f6c01d77e7︠
#low level
︠6c76dd7a-200c-43bc-b30f-2e2aabd1c959︠
print(robjects.r.help("sum"))
︡0db3bc6b-9548-4956-b701-07f874d78ac7︡{"stdout":"R Help on ‘sum’sum                    package:base                    R Documentation\n\n_\bS_\bu_\bm _\bo_\bf _\bV_\be_\bc_\bt_\bo_\br _\bE_\bl_\be_\bm_\be_\bn_\bt_\bs\n\n_\bD_\be_\bs_\bc_\br_\bi_\bp_\bt_\bi_\bo_\bn:\n\n     ‘sum’ returns the sum of all the values present in its arguments.\n\n_\bU_\bs_\ba_\bg_\be:\n\n     sum(..., na.rm = FALSE)\n     \n_\bA_\br_\bg_\bu_\bm_\be_\bn_\bt_\bs:\n\n     ...: numeric or complex or logical vectors.\n\n   na.rm: logical.  Should missing values (including ‘NaN’) be removed?\n\n_\bD_\be_\bt_\ba_\bi_\bl_\bs:\n\n     This is a generic function: methods can be defined for it directly\n     or via the ‘Summary’ group generic.  For this to work properly,\n     the arguments ‘...’ should be unnamed, and dispatch is on the\n     first argument.\n\n     If ‘na.rm’ is ‘FALSE’ an ‘NA’ or ‘NaN’ value in any of the\n     arguments will cause a value of ‘NA’ or ‘NaN’ to be returned,\n     otherwise ‘NA’ and ‘NaN’ values are ignored.\n\n     Logical true values are regarded as one, false values as zero.\n     For historical reasons, ‘NULL’ is accepted and treated as if it\n     were ‘integer(0)’.\n\n_\bV_\ba_\bl_\bu_\be:\n\n     The sum. If all of ‘...’ are of type integer or logical, then the\n     sum is integer, and in that case the result will be ‘NA’ (with a\n     warning) if integer overflow occurs.  Otherwise it is a length-one\n     numeric or complex vector.\n\n     *NB:* the sum of an empty set is zero, by definition.\n\n_\bS_\b4 _\bm_\be_\bt_\bh_\bo_\bd_\bs:\n\n     This is part of the S4 ‘Summary’ group generic.  Methods for it\n     must use the signature ‘x, ..., na.rm’.\n\n     ‘plotmath’ for the use of ‘sum’ in plot annotation.\n\n_\bR_\be_\bf_\be_\br_\be_\bn_\bc_\be_\bs:\n\n     Becker, R. A., Chambers, J. M. and Wilks, A. R. (1988) _The New S\n     Language_.  Wadsworth & Brooks/Cole.\n\n_\bS_\be_\be _\bA_\bl_\bs_\bo:\n\n     ‘colSums’ for row and column sums.\n\n\n"}︡
︠78350d46-d172-4f57-ad72-771514a731c3︠
# via RPy2 wrappers
help_sum = robjects.help.Package("base").fetch("sum")
︡fefe1e5c-ac6c-46f0-b830-dd8c0af3929a︡
︠269928db-b217-4167-aed7-43d38d5d83b6︠
print(help_sum.title())
︡10976858-0137-409d-9c6e-449b4fbd47de︡{"stdout":"Sum of Vector Elements\n"}︡
︠7a7c4321-ffe2-41dd-964c-25b841810bed︠
print(help_sum.description())
︡f5115a29-794f-43dc-b5e3-74b0fe99f383︡{"stdout":"\n  \\code{sum} returns the sum of all the values\n  present in its arguments.\n\n"}︡
︠9fdaece2-9975-4a3d-ba4f-64f514f6ffdb︠
print(help_sum.usage())
︠a735f44a-9169-40ff-bc30-b0fef56d75dc︠
for arg, descr in help_sum.arguments():
    print("%-10s: %s" % (arg, descr))

︡d39077bc-496c-4d27-93fc-31627dc7da69︡{"stdout":"...       : numeric or complex or logical vectors.\nna.rm     : logical.  Should missing values (including \\code{NaN}) be\n    removed?\n"}︡
︠635d8f68-596e-4ab2-9e89-eb62ad43e5b2︠
print(help_sum.seealso())
︡340973c5-bbc6-49d0-acf7-e75039dd551d︡{"stdout":"\n  \\code{\\link{colSums}} for row and column sums.\n\n"}︡
︠8103bb26-39dd-4d25-8d19-85077add355d︠
print(help_sum.value())
︡4e22e380-25a9-4aa4-b14f-1ece88425e52︡{"stdout":"\n  The sum. If all of \\code{\\dots} are of type integer or logical, then\n  the sum is integer, and in that case the result will be \\code{NA} (with a\n  warning) if integer overflow occurs.  Otherwise it is a length-one\n  numeric or complex vector.\n\n  \\strong{NB:} the sum of an empty set is zero, by definition.\n\n"}︡
︠99f2775e-bb1f-403c-ba92-123ee98053b2︠
help_sum.sections.keys()
︡de5568aa-dbc6-4006-9345-12bcbae7c84e︡{"stdout":"('title', 'name', 'alias', 'keyword', 'description', 'usage', 'arguments', 'details', 'value', 'section', 'references', 'seealso')\n"}︡
︠6486f5a3-cbf3-4c87-80af-e282aac8f31f︠
print(''.join(help_sum.to_docstring(("title", "usage", 'details', "references", "section"))))
︡19196fd6-3ce1-42b5-88e0-f26f61d214ed︡{"stdout":"title\n-----\n\nSum of Vector Elements \n\nusage\n-----\n\n\n sum( , na.rm = FALSE)\n \n\ndetails\n-------\n\n\n   This is a generic function: methods can be defined for it\n   directly or via the  Summary  group generic.\n   For this to work properly, the arguments   should be\n   unnamed, and dispatch is on the first argument.\n \n   If  na.rm  is  FALSE  an  NA  or  NaN  value in\n   any of the arguments will cause a value of  NA  or  NaN  to\n   be returned, otherwise  NA  and  NaN  values are ignored.\n \n   Logical true values are regarded as one, false values as zero.\n   For historical reasons,  NULL  is accepted and treated as if it\n   were  integer(0) .\n \n\nreferences\n----------\n\n\n   Becker, R. A., Chambers, J. M. and Wilks, A. R. (1988)\n    The New S Language .\n   Wadsworth & Brooks/Cole.\n \n\nsection\n-------\n\nS4 methods \n   This is part of the S4  Summary \n   group generic.  Methods for it must use the signature\n    x,  , na.rm .\n \n    plotmath  for the use of  sum  in plot annotation.\n \n\n\n"}︡
︠62086caf-60f3-494e-867e-5ab1e40bd65f︠









