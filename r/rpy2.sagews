︠31c5aaba-292e-4761-9ce2-419e9ecea4adi︠
%md
# RPy2
[RPy2](http://rpy.sourceforge.net/) is a Python module for interacting with R from Python.
It exposes functions, packages and more in Python and allows to reference them.
Dots $\dots{}$ in R functions are automatically converted to underscores.
Additionally, data conversions for various types can be enabled - first and foremost for NumPy arrays.
︡129d0dfd-5571-4e53-855a-c3169fdc3539︡{"html":"<h1>RPy2</h1>\n\n<p><a href=\"http://rpy.sourceforge.net/\">RPy2</a> is a Python module for interacting with R from Python.\nIt exposes functions, packages and more in Python and allows to reference them.\nDots $\\dots{}$ in R functions are automatically converted to underscores.\nAdditionally, data conversions for various types can be enabled - first and foremost for NumPy arrays.</p>\n"}︡
︠f151961f-082d-44a6-a403-c7706a0d6bb4a︠
%auto
%default_mode python #pure python mode
import numpy as np
import rpy2
import rpy2.robjects as robjects
from rpy2.robjects.packages import importr
rpy2.__version__
︡c90c864e-fcc5-4b30-8ccb-a67551ad01c6︡{"auto":true}︡{"stdout":"'2.3.8'\n"}︡
︠a3bb2d3d-b5f3-42b6-a94c-0add5b823b54i︠
%md
### Referencing R functions
RPy2's `robjects` (or sometimes just imported as `ro`) exposes the R instance as `.r`.
It is rather easy to get hold of functions and reference them from Python:
︡913ef0e0-7aba-47d0-8dc0-767f3ad0fa85︡{"html":"<h3>Referencing R functions</h3>\n\n<p>RPy2&#8217;s <code>robjects</code> (or sometimes just imported as <code>ro</code>) exposes the R instance as <code>.r</code>.\nIt is rather easy to get hold of functions and reference them from Python:</p>\n"}︡
︠08150b38-b19e-4975-b9e4-470916ea8f28︠
c = robjects.r['c']
summary = robjects.r['summary']
︡f9d974dd-f228-4492-94ad-1a138d352ff5︡
︠753c2844-6bd8-4199-bdbd-41aba057798c︠
v1 = c(5,4.4,1,-1.8)
sumv1 = summary(v1)
print sumv1.__repr__()
︡6fd98103-f623-4504-8366-6d53aeb7f218︡{"stdout":"<FloatVector - Python:0x92155f0 / R:0xcc41fa0>\n[-1.800000, 0.300000, 2.700000, 2.150000, 4.550000, 5.000000]\n"}︡
︠2a554e52-b207-4eb2-a6ad-0ce14f5d0adc︠
print sumv1
︡718a442a-b0e3-4018-83d8-5126079b5787︡{"stdout":"   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. \n  -1.80    0.30    2.70    2.15    4.55    5.00 \n\n"}︡
︠c1883ade-70ce-4b99-aa5e-adba5a2d84fa︠
sumv1[3]
︡79366639-f5ce-4b81-8cb2-a319fda91a23︡{"stdout":"2.15\n"}︡
︠ba9d8e2e-283f-456b-8c66-24242ea614e5i︠
%md
### Evaluating R code directly
︡58e56e03-d1c1-404f-bfbf-e25ec0a99970︡{"html":"<h3>Evaluating R code directly</h3>\n"}︡
︠65244f5f-3779-42b3-a734-24c7ae2a5a96︠
robjects.reval("""\
zz <- 1:10
print(paste("sd(zz) = ", sd(zz)))
""")
︡5268d9d6-e221-4a4b-9ec5-ede7b50ed9f3︡{"stdout":"[1] \"sd(zz) =  3.02765035409749\"\n<rpy2.rinterface.SexpVector - Python:0x68177f8 / R:0xc1150e8>\n"}︡
︠4057441f-b896-49c1-99eb-ae23a50032d4︠
︡ab877a2a-b4a2-4bf7-a390-6e9b63a909ac︡
︠bc70060d-092f-4742-95f3-c3ae64527fdd︠
myfunc = robjects.r("""\
function(x) {
   a <- x^2 + rnorm(1)
   k <- 2 * a + 1
   return(k)
}""")
︡4a766bcf-9c05-4fdb-a696-e353fde786c5︡
︠668eb0b4-6b64-4522-91ea-42426e1a859b︠
myfunc(2.5)
︡c496214f-ec48-4fde-a19f-390d14826703︡{"stdout":"<FloatVector - Python:0xcc7f3b0 / R:0xc0c8778>\n[15.198918]\n"}︡
︠a4d4c5cd-c609-4fc3-a7ef-93bb94939387i︠
%md
### Vectorization
First, enable automatic conversion from NumPy arrays to R arrays.
Then, even the custom function works out of the box.
︡a8bf98ee-4cd1-4b16-9378-658413d798dd︡{"html":"<h3>Vectorization</h3>\n\n<p>First, enable automatic conversion from NumPy arrays to R arrays.\nThen, even the custom function works out of the box.</p>\n"}︡
︠f899be96-cbb3-468c-946a-af4b125ed1cd︠
from rpy2.robjects.numpy2ri import numpy2ri
robjects.conversion.py2ri = numpy2ri
︡e5056e08-8c61-4ab9-b1e5-48fa71d998b4︡
︠c4a06e88-a79d-4713-a981-e14d50d8704b︠
xx = np.array([5,4,2.2,-1,-5.5])
print "Data Type:   ", type(xx)
print "Element Type:", xx.dtype
print "Array Shape: ", xx.shape
︡84f05ad0-a8fa-4c89-b3b9-6b5c5fd3fe93︡{"stdout":"Data Type:    <type 'numpy.ndarray'>\n"}︡{"stdout":"Element Type: float64\n"}︡{"stdout":"Array Shape:  (5,)\n"}︡
︠5260ca95-2c50-4572-acf9-726ccf08549b︠
summary(xx)
︡db5de027-7b5e-42eb-9348-11419d9d50f0︡{"stdout":"<FloatVector - Python:0xcc9b9e0 / R:0xbd2cae0>\n[-5.500000, -1.000000, 2.200000, 0.940000, 4.000000, 5.000000]\n"}︡
︠173bcae2-8d69-447f-b590-0fcaf954e08c︠
myfunc(xx)
︡3dd4315f-2eb4-4221-98b5-cc2e802eba26︡{"stdout":"<Array - Python:0xcc9b758 / R:0xb7fb220>\n[50.887895, 32.887895, 10.567895, 2.887895, 61.387895]\n"}︡
︠15e91fea-9588-4637-b429-a88b75970afd︠

︡9c2332b7-2b02-45cc-8eb5-543ebb9d692c︡
︠040cbcd3-100d-4aaf-9fc9-92b3dff3200fi︠
%md
### Types of Vectors
### `[ ]` and `[[  ]]` are `rx` and `rx2`
︡c1f25193-6090-40bd-b4b9-20aa76ee4ef8︡{"html":"<h3>Types of Vectors</h3>\n\n<h3><code>[ ]</code> and <code>[[  ]]</code> are <code>rx</code> and <code>rx2</code></h3>\n"}︡
︠147bd829-d78b-4ecb-9f3d-0a6c8a980f88︠
# Python style: (10 exclusive)
# v1 = robjects.IntVector(range(1,10))
# R style: (10 inclusive)
v1 = robjects.r.seq(1,10)
print v1
︡0fe402a4-6794-4b0e-92c6-67e39962cfcd︡{"stdout":" [1]  1  2  3  4  5  6  7  8  9 10\n\n"}︡
︠eec9f3a7-f203-4891-869f-91f78414d76d︠
# Python style, 0-based indexing of vectors
print v1[0]
v1[0] = -99
print v1
︡1ccdadd2-09c4-4248-ba97-b36ee327c01b︡{"stdout":"1\n"}︡{"stdout":" [1] -99   2   3   4   5   6   7   8   9  10\n\n"}︡
︠0c3cec50-9aa9-4e40-8ea9-ea9725a65d7e︠
# R style, 1-based indexing
v1.rx[3] = 99
print v1.rx(3)

︡5328d4ed-9e26-49cb-8516-cd09aafe0154︡{"stdout":"[1] 99\n\n"}︡
︠c503120f-0a11-441b-b2a6-9a6227c57994︠
print v1
︡3e88e8fe-dc80-4a88-8b5a-0fba15f6e619︡{"stdout":" [1] -99   2  99   4   5   6   7   8   9  10\n\n"}︡
︠ace975cd-4964-4d26-88fb-2532e88d1784︠
l1 = robjects.r("list(aa = c(1,2,3), bb = c(-5,5), cc = 'help')")
print l1
︡7cae42f8-84e9-4652-9e5a-b80718984ece︡{"stdout":"$aa\n[1] 1 2 3\n\n$bb\n[1] -5  5\n\n$cc\n[1] \"help\"\n\n\n"}︡
︠e47cf3dc-037b-4b34-8fc4-c2e9a5c240cc︠
# R's [[1]]
print l1.rx2(1)
︡1cea2509-eaad-4739-8209-ed14581fa1a1︡{"stdout":"[1] 1 2 3\n\n"}︡
︠351f9c74-2ea3-4a59-b6d3-dbd3b5c623c6︠
# indexing into the element [[1]]
print l1.rx2(1).rx(2)
︡3d1d845a-91df-410b-b81a-6ea19a381c6e︡{"stdout":"[1] 2\n\n"}︡
︠eb8dcbb6-b6fb-47b1-ab64-7ca701da89bf︠
# versus
print l1.rx2(1)[1]
︡ef79a856-5906-4c06-a192-998aac6472f2︡{"stdout":"2.0\n"}︡
︠b95270c9-5ccf-420b-8f67-065b8afba88f︠
# Constructing the same from Python is harder, since we need an ordered dictionary
import rpy2.rlike.container as rlc
l2 = robjects.ListVector(
         rlc.OrdDict((
              ('aa', robjects.IntVector([1,2,3])),
              ('bb', robjects.IntVector([-5,5])),
              ('cc', "help"))))
print l2
︡6e1c7066-d487-48b4-b01a-89e8217e80ef︡{"stdout":"$aa\n[1] 1 2 3\n\n$bb\n[1] -5  5\n\n$cc\n[1] \"help\"\n\n\n"}︡
︠34423b7d-e08a-4926-ab23-9ff3489367f9︠
# assigning a new string vector to "bb"
l1.rx2["bb"] = robjects.StrVector("this is a short sentence".split())
print(l1[l1.names.index("bb")])
︡0c113fbe-8d07-4a29-b861-0fb3063b5fb4︡{"stdout":"[1] \"this\"     \"is\"       \"a\"        \"short\"    \"sentence\"\n\n"}︡
︠059cd82a-e06f-45cf-b0a1-2915fc4c7561︠
# Matrix
︡cacb5111-bdb1-424e-a0cf-dc64013cf46e︡
︠caa26080-2351-4bb2-897a-940d071da6b5︠
m = robjects.r.matrix(range(10), nrow=5)
print(m)
︡14033b63-9d4f-4c84-93fc-b093cd6927d2︡{"stdout":"     [,1] [,2]\n[1,] 0    5   \n[2,] 1    6   \n[3,] 2    7   \n[4,] 3    8   \n[5,] 4    9   \n\n"}︡
︠a3fb456d-cea3-4c96-81a2-2e87fb52a72c︠
type(m)
︡e7f4b9ed-1c55-47c8-89e9-54b867106a43︡{"stdout":"<class 'rpy2.robjects.vectors.Matrix'>\n"}︡
︠c38456a9-ca79-4eb4-a2aa-ee92c8d01d29︠
m.rx2(4,2)
︡f405d75c-0603-4d7e-8047-832866b63e78︡{"stdout":"<IntVector - Python:0xccaa560 / R:0xbfdf248>\n[       8]\n"}︡
︠b32fe8d8-2858-4294-91af-79b35f64aee2︠
# R-operators work, too
print(m.ro > 5)
︡2e0ae91d-b9e4-4f86-a751-a970c5e3b3ad︡{"stdout":"      [,1]  [,2]\n[1,] FALSE FALSE\n[2,] FALSE  TRUE\n[3,] FALSE  TRUE\n[4,] FALSE  TRUE\n[5,] FALSE  TRUE\n\n"}︡
︠abae6f14-40ca-4f05-981d-e57612d7da93︠
print m.rx((m.ro > 3).ro & (m.ro <= 6))

︡4f6cd9dd-9c3c-462b-9672-2e425a09a3b2︡{"stdout":"[[1]]\n[1] 4\n\n[[2]]\n[1] 5\n\n[[3]]\n[1] 6\n\n\n"}︡
︠f1795e05-8a39-4b15-800a-8dba13fbeac2︠
︡799e57bc-4522-4732-885f-0a71efd045f7︡{"html":"<h3>Bonus: Factors</h3>\n"}︡
︠a45684b3-6f03-4571-9529-65c5ce39ce24︠
sv = robjects.StrVector('xyyyxyzyzyxx')
fac = robjects.FactorVector(sv)
print(fac)
︡3c76637f-c34f-44f0-873c-1add80b75176︡{"stdout":" [1] x y y y x y z y z y x x\nLevels: x y z\n\n"}︡
︠a77083a8-8fb4-4b80-9de0-785117661439︠
print(summary(fac))
︡2dda74ff-9b22-4b29-acef-65ff64f439c7︡{"stdout":"x y z \n4 6 2 \n\n"}︡
︠d39364fb-6992-47fc-a044-0d5fd49109a3︠
︠914d8922-a802-412d-a3ad-c544ad1903dci︠
%md
### Packages
The idea is to get hold of a reference to a package.
The reference is like a module-namespace and populated with all the members.
︡3117f017-a654-437a-ae06-ac46aaef80af︡{"html":"<h3>Packages</h3>\n\n<p>The idea is to get hold of a reference to a package.\nThe reference is like a module-namespace and populated with all the members.</p>\n"}︡
︠a18c1e66-7233-45c1-8483-754271f71f31︠
from rpy2.robjects.packages import importr
r_base = importr("base")
︡1b9e2921-3208-442a-87fe-c78dd3d56e72︡
︠0cb28cfe-4b10-4ec2-a83f-14344c2f7c64︠
# a bit of the namespace
print(dir(r_base)[-50:-40])
︡606e615e-95fd-4e9c-8b08-fb2b49bab801︡{"stdout":"['upper_tri', 'url', 'utf8ToInt', 'vapply', 'vector', 'version', 'warning', 'warnings', 'weekdays', 'weekdays_Date']\n"}︡
︠029ee09a-8694-42bd-8fa7-2d67fca9ba75︠
print(r_base.version)
︡88297cb1-a09f-48cf-8f68-60404c2eebc4︡{"stdout":"               _                            \nplatform       x86_64-unknown-linux-gnu     \narch           x86_64                       \nos             linux-gnu                    \nsystem         x86_64, linux-gnu            \nstatus                                      \nmajor          2                            \nminor          15.2                         \nyear           2012                         \nmonth          10                           \nday            26                           \nsvn rev        61015                        \nlanguage       R                            \nversion.string R version 2.15.2 (2012-10-26)\nnickname       Trick or Treat               \n\n"}︡
︠48f4324e-90e9-4ac7-a79c-d011c2553685︠
# use Python's `getattr` to access non-standard named identifyers.
# e.g. matrix multiplication
A = np.array([[1, 1],
              [1, 7]])
B = np.array([[4, 5],
              [6, 7]])
matrix_mult = getattr(r_base, "%*%")
print(matrix_mult(A, B))
︡e55763ae-4ba0-4255-b68a-c1d2d8aff87c︡{"stdout":"     [,1] [,2]\n[1,]   10   12\n[2,]   46   54\n\n"}︡
︠ddf7c8a4-ad4d-4c0a-9a04-b08cafc324a9︠
r_base.rep(r_base.c("x", "y", "z"), 10)
︡73531a68-a71c-4cfc-8f47-04141148c627︡{"stdout":"<StrVector - Python:0xcd00ea8 / R:0xce81440>\n['x', 'y', 'z', ..., 'x', 'y', 'z']\n"}︡
︠3da353d4-4bd4-413f-bea1-8d585f6d1725︠
︡a933f884-c525-47a4-af3c-187e388dc8da︡
︠440dc108-dfa3-4279-83c8-352845d54ebc︠
︡851e3117-50d4-4ffd-9165-192daafcacfe︡{"html":"<h2>Datasets</h2>\n\n<p>Use <code>importr</code> from <code>rpy2.robjects.packages</code> to get hold of the dataset package.\nThen fetch a dataset and retrieve the named entry to get hold of the dataframe.</p>\n"}︡
︠cd4ec889-84b0-406c-87f0-c88c121512bd︠
from rpy2.robjects.packages import importr
︡25678a7e-d737-40c7-b580-ee3bcc64589b︡
︠905e1b00-c8bd-404e-9df3-72e6cdc4a512︠
# datasets
datasets = importr('datasets')
# Note: the __rdata__ should be a plain "data", but doesn't work in this development version.
faithful = datasets.__rdata__.fetch("faithful")["faithful"]
print type(faithful)
︡a93ab51c-6bd6-4ecd-a430-5f7c6198686d︡{"stdout":"<class 'rpy2.robjects.vectors.DataFrame'>\n"}︡
︠b3e1b77c-27af-4369-a966-67dfca0852bc︠

︠6dc17296-b581-4a6c-aa31-34237e79d88d︠
# number of columns!
len(faithful)
︡4c074bdb-3349-48b2-a944-9a5f326290bc︡{"stdout":"2\n"}︡
︠cc50e34b-1dd8-4243-b7af-01ac7bf0b5d0︠
# S3 datatypes in R for each column
[column.rclass[0] for column in faithful]
︡47269b09-5ad8-44ba-86fd-f520afabb4b1︡{"stdout":"['numeric', 'numeric']\n"}︡
︠552ce8f0-2ffe-41e3-a283-6cdfc41d97d5︠
# extract some rows
print(faithful.rx(robjects.IntVector([2,3,4,10]), True))
︡d64224c8-f3e4-4359-8f73-e40489f1a71f︡{"stdout":"   eruptions waiting\n2      1.800      54\n3      3.333      74\n4      2.283      62\n10     4.350      85\n\n"}︡
︠8605de22-3ba6-467f-a5d8-4dddee8910ea︠
# extract part of a column
print(faithful.rx2("eruptions")[:10])
︡e7fb2c7a-3d85-49c6-80b4-7575e3b7ccd4︡{"stdout":" [1] 3.600 1.800 3.333 2.283 4.533 2.883 4.700 3.600 1.950 4.350\n\n"}︡
︠816aaeaf-3b20-46a9-bb0c-1e745de14650︠

︡1c46a3e3-1134-4ac6-9872-5d0521608bee︡
︠f7c03b20-ebb6-4368-abc5-8b96d9c7c3e1︠

︡2c2bdd78-6b87-4628-98c2-c40de173b400︡
︠cc19b123-5e29-4c0f-ad98-61c6359cc3b9︠

︡eee3c0c3-d961-413b-ab16-c5a39cbbefa0︡
︠bf24cb62-c1b6-4fcc-b920-327abd230720i︠
%md
### Example: `lm`
︡866d4722-61c5-43f6-9ae0-4b3f94f10bdb︡{"html":"<h3>Example: <code>lm</code></h3>\n"}︡
︠45ca2419-9840-4d06-ba7b-f61ec648367d︠
data = robjects.DataFrame({
       'y' : np.array([4, 5, 5.5, 7, 7.6, 8, 11, 12, 13]),
       'x' : np.array([1, 2,   3, 4, 4.4, 5, 7,  8, 8.5])
       })
︡9771a2cf-7d9f-42f1-9982-9e5791eabd6c︡
︠0bb9dbd0-bde4-448a-b461-e4a4f3669f85︠
lmod = robjects.r.lm("y ~ x", data = data)
︡0c8dc212-ca0a-4862-8c80-03c6954a5e62︡
︠aa5ef93b-b8d6-4b17-bca4-77df4598aaa7︠
print lmod.names
︡81dcc35a-2147-4b69-99c0-80cae468879e︡{"stdout":" [1] \"coefficients\"  \"residuals\"     \"effects\"       \"rank\"         \n [5] \"fitted.values\" \"assign\"        \"qr\"            \"df.residual\"  \n [9] \"xlevels\"       \"call\"          \"terms\"         \"model\"        \n\n"}︡
︠31a546ad-4be7-41cc-a53b-1d3dc93f9a09︠
coeffs = lmod.rx2("coefficients")
print "R's representation via 'print'"
print(coeffs)
print
print "Same coefficients in Python's floats:"
print ([x for x in coeffs])
︡e8d7f76f-9463-4030-8ab3-72641c790bbb︡{"stdout":"R's representation via 'print'\n"}︡{"stdout":"(Intercept)           x \n   2.328485    1.215469 \n\n"}︡{"stdout":"\n"}︡{"stdout":"Same coefficients in Python's floats:\n"}︡{"stdout":"[2.328485324947587, 1.2154692791485247]\n"}︡
︠6137da7a-683b-49ef-94f8-f8e5580ef91e︠
# max is from Python, iterates naturally over the entries in all residuals
print max(lmod.rx2("residuals"))

︡7b2e9e9c-e84d-42d6-ba00-be1275bf9ea1︡{"stdout":"0.456045395904\n"}︡
︠ed5b8c7a-d154-498a-af31-b7a30faed8b4︠

︡b8dfc80f-f9b1-4e3d-92a9-373e9197ae1c︡
︠8e2f0f08-172c-4aed-985b-49eeef268e32i︠
%md
### Plot
︡f0baaf66-7c6e-4d0c-b58b-f43a067e3402︡{"html":"<h3>Plot</h3>\n"}︡
︠306277e0-2893-456d-982c-b6befa27356f︠
from rpy2.robjects.packages import importr
grdevices = importr('grDevices')
︡c7aa4e5e-1eaf-43b4-a43c-b25fd449667b︡
︠803df10d-4d5c-48ab-b5a8-dcae626705a0︠
# just calling "plot" on the dataframe
︡70e010ae-b5a6-4636-bc0e-62ac53c38f67︡
︠2158b6a8-07d6-4875-85ef-2cbbda125559︠
_ = grdevices.png(file="rpy2_plot.png", width=640, height=320)
_ = robjects.r.plot(data)
grdevices.dev_off()
︡14d0a1e4-93bd-4f3a-a03c-a0e993a28735︡{"stdout":"<IntVector - Python:0xb6beab8 / R:0xab10878>\n[       2]\n"}︡
︠d456b05e-1f32-478e-9f00-1f9ccc13163d︠
salvus.file("rpy2_plot.png")
︡71576b6d-3889-4135-b603-595cd25838e1︡{"once":false,"file":{"show":true,"uuid":"c9ae0343-c983-49f3-9018-f8c0b053c189","filename":"rpy2_plot.png"}}︡
︠18a8d0d2-616a-4fb3-adaf-ee93f51d6ba4︠
# Plot of the linear model lmod
︡a0d5ebe0-c4d1-482b-a5c9-476698c704c0︡
︠91a26196-5439-4a7e-9d38-83c4834da04a︠
_ = grdevices.png(file="rpy2_plot_2.png", width=640, height=520)
_ = robjects.reval("par(mfrow=c(2,2))")
_ = robjects.r.plot(lmod)
grdevices.dev_off()
︡01341153-9516-4666-9560-5b2d2445ea52︡{"stdout":"<IntVector - Python:0xb6da1b8 / R:0xb073838>\n[       2]\n"}︡
︠2ca81aa8-a93b-47e4-b479-45a44dde46d7︠
salvus.file("rpy2_plot_2.png")
︡cc061697-34b9-4f26-bc63-167493861ac3︡{"once":false,"file":{"show":true,"uuid":"1072bec5-2c10-4172-bc10-7299c3bc138c","filename":"rpy2_plot_2.png"}}︡
︠b65b1434-1389-4443-8ad9-7cd993074e50︠
# get R's "print" via globalenv, otherwise it's a syntax error in Python!
rprint = robjects.globalenv.get("print")
volcano = datasets.__rdata__.fetch("volcano")["volcano"]
lattice = importr("lattice")

_ = grdevices.png(file="rpy2_plot_wireframe.png", width=480, height=480)
p = lattice.wireframe(volcano,
                      shade = True,
                      zlab = "",
                      aspect = robjects.FloatVector((61.0/87, 0.5)),
                      light_source = robjects.IntVector((10,0,10)))
_ = rprint(p)
grdevices.dev_off()
︡8fed5a03-8db9-48a7-9bbb-b238dc8264e1︡{"stdout":"<IntVector - Python:0xc559d40 / R:0xc7bcc38>\n[       2]\n"}︡
︠eaa7e691-df96-43fd-972e-d4b20669b5ea︠
salvus.file("rpy2_plot_wireframe.png")
︡96b2f6f6-820c-4698-9020-ad576d646307︡{"once":false,"file":{"show":true,"uuid":"c0058558-2665-4674-a05e-8ed461e85bd9","filename":"rpy2_plot_wireframe.png"}}︡
︠45e0af49-2e39-4d3f-a59d-fc0944a622ac︠
︡d3d97e02-c1fc-4553-9c8a-623951791ba5︡
︠ec325a13-5ce9-4f4f-8fdb-017048167bf8i︠
%md
## Advanced: PCA
︡fd50438a-5e67-43fd-a857-4535eb5bc978︡{"html":"<h2>Advanced: PCA</h2>\n"}︡
︠6ed487c6-db02-47b3-8258-ae454e59d580︠
USArrests = datasets.__rdata__.fetch("USArrests")["USArrests"]
r_stats = importr("stats")
pca_usarrest = r_stats.princomp(USArrests, cor=True)
print(summary(pca_usarrest))
︡a7268202-ff35-42fb-87f6-d98b723b3ba4︡{"stdout":"Importance of components:\n                          Comp.1    Comp.2    Comp.3     Comp.4\nStandard deviation     1.5748783 0.9948694 0.5971291 0.41644938\nProportion of Variance 0.6200604 0.2474413 0.0891408 0.04335752\nCumulative Proportion  0.6200604 0.8675017 0.9566425 1.00000000\n\n"}︡
︠fe930f75-717d-48ab-8c1e-79e550ca32fd︠
grdevices = importr('grDevices')
_ = grdevices.png(file="rpy2_plot_pca.png", width=480, height=480)
_ = robjects.r.biplot(pca_usarrest)
_ = grdevices.dev_off()
salvus.file("rpy2_plot_pca.png")
︡7ac4446a-8b81-43e1-bd4b-df5b07004fc9︡{"once":false,"file":{"show":true,"uuid":"f7d847bc-c620-4f78-89db-014d9e7014f9","filename":"rpy2_plot_pca.png"}}︡
︠c9c1a7f3-9b2e-4392-95c6-872cc892a7fd︠
︡75922976-a0c9-471e-b4e8-173eed6d5edf︡
︠f54e76e3-954b-41f4-b5a8-cf53b03b5a53︠
︡e071bcdd-8bae-440d-96b5-a4b5718334ae︡
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









