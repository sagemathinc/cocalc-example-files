︠31c5aaba-292e-4761-9ce2-419e9ecea4adi︠
%md
# RPy2
[RPy2](http://rpy.sourceforge.net/) is a Python module for interacting with R from Python.
It exposes functions, packages and more in Python and allows to reference them.
Dots $\dots{}$ in R functions are automatically converted to underscores.
Additionally, data conversions for various types can be enabled - first and foremost for NumPy arrays.
︡129d0dfd-5571-4e53-855a-c3169fdc3539︡{"done":true,"md":"# RPy2\n[RPy2](http://rpy.sourceforge.net/) is a Python module for interacting with R from Python.\nIt exposes functions, packages and more in Python and allows to reference them.\nDots $\\dots{}$ in R functions are automatically converted to underscores.\nAdditionally, data conversions for various types can be enabled - first and foremost for NumPy arrays."}
︠f151961f-082d-44a6-a403-c7706a0d6bb4as︠
%auto
%default_mode python #pure python mode
import numpy as np
import rpy2
import rpy2.robjects as robjects
from rpy2.robjects import r, pandas2ri
pandas2ri.activate()

rpy2.__version__
︡1c2e57c1-7d84-4fb6-b2cb-fc281f58e057︡{"stdout":"'2.8.5'\n"}︡{"done":true}︡
︠a3bb2d3d-b5f3-42b6-a94c-0add5b823b54i︠
%md
### Referencing R functions
RPy2's `robjects` (or sometimes just imported as `ro`) exposes the R instance as `.r`.
It is rather easy to get hold of functions and reference them from Python:
︡913ef0e0-7aba-47d0-8dc0-767f3ad0fa85︡{"done":true,"md":"### Referencing R functions\nRPy2's `robjects` (or sometimes just imported as `ro`) exposes the R instance as `.r`.\nIt is rather easy to get hold of functions and reference them from Python:"}
︠08150b38-b19e-4975-b9e4-470916ea8f28s︠
c = robjects.r['c']
summary = robjects.r['summary']
︡064c0344-db30-4ecb-8c66-28421737caef︡{"done":true}︡
︠753c2844-6bd8-4199-bdbd-41aba057798cs︠
v1 = c(5,4.4,1,-1.8)
sumv1 = summary(v1)
print sumv1.__repr__()
︡aee8ebda-47c7-4dd9-9a73-e2a59a739564︡{"stdout":"R object with classes: ('summaryDefault', 'table') mapped to:\n<FloatVector - Python:0x7f506223f4d0 / R:0x634af40>\n[-1.800000, 0.300000, 2.700000, 2.150000, 4.550000, 5.000000]\n"}︡{"done":true}︡
︠2a554e52-b207-4eb2-a6ad-0ce14f5d0adcs︠
print sumv1
︡a581f6cd-bff1-406d-98c6-9016850d0a81︡{"stdout":"   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. \n  -1.80    0.30    2.70    2.15    4.55    5.00 \n\n"}︡{"done":true}︡
︠c1883ade-70ce-4b99-aa5e-adba5a2d84fas︠
sumv1[3]
︡e16c367b-8cba-4e18-b03f-88b3719ca61c︡{"stdout":"2.15\n"}︡{"done":true}︡
︠ba9d8e2e-283f-456b-8c66-24242ea614e5i︠
%md
### Evaluating R code directly
︡58e56e03-d1c1-404f-bfbf-e25ec0a99970︡{"done":true,"md":"### Evaluating R code directly"}
︠65244f5f-3779-42b3-a734-24c7ae2a5a96s︠
robjects.reval("""\
zz <- 1:10
print(paste("sd(zz) = ", sd(zz)))
""")
︡649dbaf1-93a7-440f-9a18-c040584d8ade︡{"stdout":"[1] \"sd(zz) =  3.02765035409749\"\n<rpy2.rinterface.StrSexpVector - Python:0x7f506e5eac00 / R:0x5a8ceb8>\n"}︡{"done":true}︡
︠bc70060d-092f-4742-95f3-c3ae64527fdds︠
myfunc = robjects.r("""\
function(x) {
   a <- x^2 + rnorm(1)
   k <- 2 * a + 1
   return(k)
}""")
︡ee3c8a90-d245-4b3a-bbb9-a4e0f56a71cb︡{"done":true}︡
︠668eb0b4-6b64-4522-91ea-42426e1a859bs︠
myfunc(2.5)
︡870c4abf-2d68-4e3a-bf72-727779a5150d︡{"stdout":"R object with classes: ('numeric',) mapped to:\n<FloatVector - Python:0x7f506223fb48 / R:0x56db568>\n[12.440484]\n"}︡{"done":true}︡
︠a4d4c5cd-c609-4fc3-a7ef-93bb94939387i︠
%md
### Vectorization
First, enable automatic conversion from NumPy arrays to R arrays.
Then, even the custom function works out of the box.
︡a8bf98ee-4cd1-4b16-9378-658413d798dd︡{"done":true,"md":"### Vectorization\nFirst, enable automatic conversion from NumPy arrays to R arrays.\nThen, even the custom function works out of the box."}
︠f899be96-cbb3-468c-946a-af4b125ed1cds︠
xx = np.array([5,4,2.2,-1,-5.5])
print "Data Type:   ", type(xx)
print "Element Type:", xx.dtype
print "Array Shape: ", xx.shape
︡224b7b6f-fbe8-4b1d-8c58-a8afe52f1f78︡{"stdout":"Data Type:    <type 'numpy.ndarray'>\n"}︡{"stdout":"Element Type: float64\n"}︡{"stdout":"Array Shape:  (5,)\n"}︡{"done":true}︡
︠5260ca95-2c50-4572-acf9-726ccf08549bs︠
summary(xx)
︡bb7d70d9-321b-4e17-ac1e-41d50c1ab6da︡{"stdout":"R object with classes: ('summaryDefault', 'table') mapped to:\n<FloatVector - Python:0x7f506223fd40 / R:0x5bdd258>\n[-5.500000, -1.000000, 2.200000, 0.940000, 4.000000, 5.000000]\n"}︡{"done":true}︡
︠173bcae2-8d69-447f-b590-0fcaf954e08cs︠
myfunc(xx)
︡21491b93-d052-4b4e-b82a-3229a229db74︡{"stdout":"R object with classes: ('array',) mapped to:\n<Array - Python:0x7f506223fc20 / R:0x5b0df58>\n[52.274453, 34.274453, 11.954453, 4.274453, 62.774453]\n"}︡{"done":true}︡
︠6a8a0aa9-dfbb-4dca-b80d-502019d2c6d7i︠
%md
### Types of Vectors
### `[ ]` and `[[  ]]` are `rx` and `rx2`
︡c1f25193-6090-40bd-b4b9-20aa76ee4ef8︡{"done":true,"md":"### Types of Vectors\n### `[ ]` and `[[  ]]` are `rx` and `rx2`"}
︠5b13feb3-bd97-49fc-81c7-c63a13c20599s︠
# Python style: (10 exclusive)
# v1 = robjects.IntVector(range(1,10))
# R style: (10 inclusive)
v1 = robjects.r.seq(1,10)
print v1
︡a03871d3-4b60-43eb-9e05-6fd30c21f273︡{"stdout":" [1]  1  2  3  4  5  6  7  8  9 10\n\n"}︡{"done":true}︡
︠eec9f3a7-f203-4891-869f-91f78414d76ds︠
# Python style, 0-based indexing of vectors
print v1[0]
v1[0] = -99
print v1
︡74583c29-b71b-4e06-8bac-3ef755b905ab︡{"stdout":"1\n"}︡{"stdout":" [1] -99   2   3   4   5   6   7   8   9  10\n\n"}︡{"done":true}︡
︠0c3cec50-9aa9-4e40-8ea9-ea9725a65d7es︠
# R style, 1-based indexing
v1.rx[3] = 99
print v1.rx(3)

︡e970c444-8c87-4d21-bb03-0ee5975c2f70︡{"stdout":"[1] 99\n\n"}︡{"done":true}︡
︠c503120f-0a11-441b-b2a6-9a6227c57994s︠
print v1
︡a35ff778-4439-42c2-a1e7-ecae3d079abc︡{"stdout":" [1] -99   2  99   4   5   6   7   8   9  10\n\n"}︡{"done":true}︡
︠ace975cd-4964-4d26-88fb-2532e88d1784s︠
l1 = robjects.r("list(aa = c(1,2,3), bb = c(-5,5), cc = 'help')")
print l1
︡66a8bdde-79ca-4621-9014-747465686f80︡{"stdout":"$aa\n[1] 1 2 3\n\n$bb\n[1] -5  5\n\n$cc\n[1] \"help\"\n\n\n"}︡{"done":true}︡
︠e47cf3dc-037b-4b34-8fc4-c2e9a5c240ccs︠
# R's [[1]]
print l1.rx2(1)
︡f3421546-b1dd-4ab0-aa81-c280d5a3b303︡{"stdout":"[1] 1 2 3\n\n"}︡{"done":true}︡
︠351f9c74-2ea3-4a59-b6d3-dbd3b5c623c6s︠
# indexing into the element [[1]]
print l1.rx2(1).rx(2)
︡70d3dafa-14b6-4bb3-954a-8ad3aac5472a︡{"stdout":"[1] 2\n\n"}︡{"done":true}︡
︠eb8dcbb6-b6fb-47b1-ab64-7ca701da89bfs︠
# versus
print l1.rx2(1)[1]
︡9af11812-dcd9-4906-85ac-1f93cdf7878d︡{"stdout":"2.0\n"}︡{"done":true}︡
︠b95270c9-5ccf-420b-8f67-065b8afba88fs︠
# Constructing the same from Python is harder, since we need an ordered dictionary
import rpy2.rlike.container as rlc
l2 = robjects.ListVector(
         rlc.OrdDict((
              ('aa', robjects.IntVector([1,2,3])),
              ('bb', robjects.IntVector([-5,5])),
              ('cc', "help"))))
print l2
︡1f475868-a430-449b-b0be-cbd2d3cfd8cf︡{"stdout":"$aa\n[1] 1 2 3\n\n$bb\n[1] -5  5\n\n$cc\n[1] \"help\"\n\n\n"}︡{"done":true}︡
︠34423b7d-e08a-4926-ab23-9ff3489367f9s︠
# assigning a new string vector to "bb"
l1.rx2["bb"] = robjects.StrVector("this is a short sentence".split())
print(l1[l1.names.index("bb")])
︡ca78fb90-3268-4c70-bcc6-4b78406dd12b︡{"stdout":"[1] \"this\"     \"is\"       \"a\"        \"short\"    \"sentence\"\n\n"}︡{"done":true}︡
︠059cd82a-e06f-45cf-b0a1-2915fc4c7561s︠
# Matrix

m = robjects.r.matrix(range(10), nrow=5)
print(m)
︡4a24d8bd-5379-43bd-acb9-bf4b83576f17︡{"stdout":"     [,1] [,2]\n[1,] 0    5   \n[2,] 1    6   \n[3,] 2    7   \n[4,] 3    8   \n[5,] 4    9   \n\n"}︡{"done":true}︡
︠a3fb456d-cea3-4c96-81a2-2e87fb52a72cs︠
type(m)
︡45a45097-c0b9-4334-993f-2b51e1aff144︡{"stdout":"<class 'rpy2.robjects.vectors.Matrix'>\n"}︡{"done":true}︡
︠c38456a9-ca79-4eb4-a2aa-ee92c8d01d29s︠
m.rx2(4,2)
︡525e38a1-66d5-4c79-bce7-1cb780f58b6e︡{"stdout":"R object with classes: ('integer',) mapped to:\n<IntVector - Python:0x7f506224acf8 / R:0x60528c8>\n[       8]\n"}︡{"done":true}︡
︠b32fe8d8-2858-4294-91af-79b35f64aee2s︠
# R-operators work, too
print(m.ro > 5)
︡b7e78b11-0af1-4e54-8bdc-de55671e6665︡{"stdout":"      [,1]  [,2]\n[1,] FALSE FALSE\n[2,] FALSE  TRUE\n[3,] FALSE  TRUE\n[4,] FALSE  TRUE\n[5,] FALSE  TRUE\n\n"}︡{"done":true}︡
︠abae6f14-40ca-4f05-981d-e57612d7da93s︠
print m.rx((m.ro > 3).ro & (m.ro <= 6))
︡0e6e1371-a79e-4037-a0c0-17528ef387a5︡{"stdout":"[[1]]\n[1] 4\n\n[[2]]\n[1] 5\n\n[[3]]\n[1] 6\n\n\n"}︡{"done":true}︡
︠550279d0-1a4a-43c7-bd75-6c2751cea175s︠
sv = robjects.StrVector('xyyyxyzyzyxx')
fac = robjects.FactorVector(sv)
print(fac)
︡d528a33b-ed3f-448a-aafa-a7e12f463849︡{"stdout":" [1] x y y y x y z y z y x x\nLevels: x y z\n\n"}︡{"done":true}︡
︠a77083a8-8fb4-4b80-9de0-785117661439s︠
print(summary(fac))
︡81cf595d-1824-4c06-981e-0ec974d0c035︡{"stdout":"x y z \n4 6 2 \n\n"}︡{"done":true}︡
︠80eb1a00-4234-4592-99c2-ffa247175a80i︠
%md
### Packages
The idea is to get hold of a reference to a package.
The reference is like a module-namespace and populated with all the members.
︡3117f017-a654-437a-ae06-ac46aaef80af︡{"done":true,"md":"### Packages\nThe idea is to get hold of a reference to a package.\nThe reference is like a module-namespace and populated with all the members."}
︠a18c1e66-7233-45c1-8483-754271f71f31s︠
from rpy2.robjects.packages import importr
r_base = importr("base")
︡25dee48f-a6aa-4168-912f-0081e487dc5e︡{"done":true}︡
︠0cb28cfe-4b10-4ec2-a83f-14344c2f7c64s︠
# a bit of the namespace
print(dir(r_base)[-50:-40])
︡723c1fd8-dcb1-4b1c-a933-43506b84d6fb︡{"stdout":"['upper_tri', 'url', 'utf8ToInt', 'vapply', 'vector', 'version', 'warning', 'warnings', 'weekdays', 'weekdays_Date']\n"}︡{"done":true}︡
︠029ee09a-8694-42bd-8fa7-2d67fca9ba75s︠
print(r_base.version)
︡25a975a0-48ea-4963-ab47-b69950c9c4da︡{"stdout":"               _                                          \nplatform       x86_64-pc-linux-gnu                        \narch           x86_64                                     \nos             linux-gnu                                  \nsystem         x86_64, linux-gnu                          \nstatus         Revised                                    \nmajor          3                                          \nminor          2.4                                        \nyear           2016                                       \nmonth          03                                         \nday            16                                         \nsvn rev        70336                                      \nlanguage       R                                          \nversion.string R version 3.2.4 Revised (2016-03-16 r70336)\nnickname       Very Secure Dishes                         \n\n"}︡{"done":true}︡
︠48f4324e-90e9-4ac7-a79c-d011c2553685s︠
# use Python's `getattr` to access non-standard named identifyers.
# e.g. matrix multiplication
A = np.array([[1, 1],
              [1, 7]])
B = np.array([[4, 5],
              [6, 7]])
matrix_mult = getattr(r_base, "%*%")
print(matrix_mult(A, B))
︡f8f1c609-9392-4be7-9dc2-4bef6101a614︡{"stdout":"     [,1] [,2]\n[1,]   10   12\n[2,]   46   54\n\n"}︡{"done":true}︡
︠ddf7c8a4-ad4d-4c0a-9a04-b08cafc324a9s︠
r_base.rep(r_base.c("x", "y", "z"), 10)
︡c9c7a90d-0be0-47b4-8c36-bf28f451b946︡{"stdout":"R object with classes: ('character',) mapped to:\n<StrVector - Python:0x7f5061ddff80 / R:0x65295e0>\n[str, str, str, ..., str, str, str]\n"}︡{"done":true}︡
︠9de9d3fe-48f4-45db-982d-f70540ec11ccs︠
from rpy2.robjects.packages import importr
︡15b70a6a-3f4a-4e49-b988-48eea326337a︡{"done":true}︡
︠905e1b00-c8bd-404e-9df3-72e6cdc4a512s︠
# datasets
datasets = importr('datasets')
# Note: the __rdata__ should be a plain "data", but doesn't work in this development version.
faithful = datasets.__rdata__.fetch("faithful")["faithful"]
print type(faithful)
︡f6468256-e543-46c0-b29e-3667583d5b63︡{"stdout":"<class 'rpy2.robjects.vectors.DataFrame'>\n"}︡{"done":true}︡
︠39844a2d-56b6-4c72-8506-c54b6c3cda0ds︠
# number of columns!
len(faithful)
︡68430702-f277-4cbc-8b0f-f99395c26e09︡{"stdout":"2\n"}︡{"done":true}︡
︠cc50e34b-1dd8-4243-b7af-01ac7bf0b5d0s︠
# S3 datatypes in R for each column
[column.rclass[0] for column in faithful]
︡05b0e91d-8c7a-48b9-805a-f422ad122012︡{"stdout":"['numeric', 'numeric']\n"}︡{"done":true}︡
︠552ce8f0-2ffe-41e3-a283-6cdfc41d97d5s︠
# extract some rows
print(faithful.rx(robjects.IntVector([2,3,4,10]), True))
︡9f394981-072c-4a9f-b3cc-ad40734bce00︡{"stdout":"   eruptions waiting\n2      1.800      54\n3      3.333      74\n4      2.283      62\n10     4.350      85\n\n"}︡{"done":true}︡
︠8605de22-3ba6-467f-a5d8-4dddee8910eas︠
# extract part of a column
print(faithful.rx2("eruptions")[:10])
︡bd99e84f-7e76-4539-ae53-0aa28e7c9017︡{"stdout":" [1] 3.600 1.800 3.333 2.283 4.533 2.883 4.700 3.600 1.950 4.350\n\n"}︡{"done":true}︡
︠b481efd9-6fe3-46d0-93ce-10f630e1fee2i︠
%md
### Example: `lm`
︡866d4722-61c5-43f6-9ae0-4b3f94f10bdb︡{"done":true,"md":"### Example: `lm`"}
︠45ca2419-9840-4d06-ba7b-f61ec648367ds︠
data = robjects.DataFrame({
       'y' : np.array([4, 5, 5.5, 7, 7.6, 8, 11, 12, 13]),
       'x' : np.array([1, 2,   3, 4, 4.4, 5, 7,  8, 8.5])
       })
︡bccf5c50-8897-42ce-bc65-62c5aa25ad60︡{"done":true}︡
︠0bb9dbd0-bde4-448a-b461-e4a4f3669f85s︠
lmod = robjects.r.lm("y ~ x", data = data)
︡9e182f25-8f25-4ec6-9954-d53e6530e6c5︡{"done":true}︡
︠aa5ef93b-b8d6-4b17-bca4-77df4598aaa7s︠
print lmod.names
︡2906e2b1-678f-40d8-87f8-f1bd5af031fe︡{"stdout":" [1] \"coefficients\"  \"residuals\"     \"effects\"       \"rank\"         \n [5] \"fitted.values\" \"assign\"        \"qr\"            \"df.residual\"  \n [9] \"xlevels\"       \"call\"          \"terms\"         \"model\"        \n\n"}︡{"done":true}︡
︠31a546ad-4be7-41cc-a53b-1d3dc93f9a09s︠
coeffs = lmod.rx2("coefficients")
print "R's representation via 'print'"
print(coeffs)
print
print "Same coefficients in Python's floats:"
print ([x for x in coeffs])
︡2ff6e28e-1b79-4d2e-bf36-87f3097f232d︡{"stdout":"R's representation via 'print'\n"}︡{"stdout":"(Intercept)           x \n   2.328485    1.215469 \n\n"}︡{"stdout":"\n"}︡{"stdout":"Same coefficients in Python's floats:\n"}︡{"stdout":"[2.3284853249475894, 1.2154692791485244]\n"}︡{"done":true}︡
︠6137da7a-683b-49ef-94f8-f8e5580ef91es︠
# max is from Python, iterates naturally over the entries in all residuals
print max(lmod.rx2("residuals"))
︡4ad324c7-cd52-4905-87f8-4b4cea7d6c4a︡{"stdout":"0.456045395904\n"}︡{"done":true}︡
︠d0d1f20f-f0e2-4383-8467-e0031c20c52bi︠
%md
### Plot
︡f0baaf66-7c6e-4d0c-b58b-f43a067e3402︡{"done":true,"md":"### Plot"}
︠306277e0-2893-456d-982c-b6befa27356fs︠
grdevices = importr('grDevices')
︡0a03da0c-e214-4a2f-a42e-9aec9de62b51︡{"done":true}︡
︠803df10d-4d5c-48ab-b5a8-dcae626705a0s︠
# just calling "plot" on the dataframe

_ = grdevices.png(file="rpy2_plot.png", width=640, height=320)
_ = robjects.r.plot(data)
grdevices.dev_off()
︡c03072da-69e0-4069-a6dc-bc15162345d6︡{"stdout":"R object with classes: ('integer',) mapped to:\n<IntVector - Python:0x7f5061dfb830 / R:0x75524b8>\n[       1]\n"}︡{"done":true}︡
︠d456b05e-1f32-478e-9f00-1f9ccc13163ds︠
salvus.file("rpy2_plot.png")
︡cf19b28a-0610-4aa9-ae4d-21f3714b0a7a︡{"file":{"filename":"rpy2_plot.png","show":true,"text":null,"uuid":"d26a1038-8cdf-4813-8dad-d1f81e438899"},"once":false}︡{"done":true}︡
︠18a8d0d2-616a-4fb3-adaf-ee93f51d6ba4s︠
# Plot of the linear model lmod

_ = grdevices.png(file="rpy2_plot_2.png", width=640, height=520)
_ = robjects.reval("par(mfrow=c(2,2))")
_ = robjects.r.plot(lmod)
grdevices.dev_off()
︡1519bfbd-b90d-48de-86dd-51b6e7210eea︡{"stdout":"R object with classes: ('integer',) mapped to:\n<IntVector - Python:0x7f5061ec8878 / R:0x78dad28>\n[       1]\n"}︡{"done":true}︡
︠2ca81aa8-a93b-47e4-b479-45a44dde46d7s︠
salvus.file("rpy2_plot_2.png")
︡9ccbd02c-2bd0-41e7-817b-f011918e9c29︡{"file":{"filename":"rpy2_plot_2.png","show":true,"text":null,"uuid":"6a63c198-745c-4422-aa77-0c7b1246c9ec"},"once":false}︡{"done":true}︡
︠b65b1434-1389-4443-8ad9-7cd993074e50s︠
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
︡533d05fa-ff81-4e0d-90fc-4115b2cc31bd︡{"stdout":"R object with classes: ('integer',) mapped to:\n<IntVector - Python:0x7f5061ebcd40 / R:0x83f4d78>\n[       1]\n"}︡{"done":true}︡
︠eaa7e691-df96-43fd-972e-d4b20669b5eas︠
salvus.file("rpy2_plot_wireframe.png")
︡bffc281c-df3e-4eae-9fe8-67650f7a9ea1︡{"file":{"filename":"rpy2_plot_wireframe.png","show":true,"text":null,"uuid":"31434dc2-31d5-4989-bad7-8dd13854aab6"},"once":false}︡{"done":true}︡
︠d3f9382b-5534-4772-a67d-33d98b4ffa61i︠
%md
## Advanced: PCA
︡fd50438a-5e67-43fd-a857-4535eb5bc978︡{"done":true,"md":"## Advanced: PCA"}
︠6ed487c6-db02-47b3-8258-ae454e59d580s︠
USArrests = datasets.__rdata__.fetch("USArrests")["USArrests"]
r_stats = importr("stats")
pca_usarrest = r_stats.princomp(USArrests, cor=True)
print(summary(pca_usarrest))
︡b2916a47-aff5-4812-975a-c169ec8b8d5b︡{"stdout":"Importance of components:\n                          Comp.1    Comp.2    Comp.3     Comp.4\nStandard deviation     1.5748783 0.9948694 0.5971291 0.41644938\nProportion of Variance 0.6200604 0.2474413 0.0891408 0.04335752\nCumulative Proportion  0.6200604 0.8675017 0.9566425 1.00000000\n\n"}︡{"done":true}︡
︠fe930f75-717d-48ab-8c1e-79e550ca32fds︠
grdevices = importr('grDevices')
_ = grdevices.png(file="rpy2_plot_pca.png", width=480, height=480)
_ = robjects.r.biplot(pca_usarrest)
_ = grdevices.dev_off()
salvus.file("rpy2_plot_pca.png")
︡d64751c7-8be4-4c3e-a1ad-d2bee109c23e︡{"file":{"filename":"rpy2_plot_pca.png","show":true,"text":null,"uuid":"7ed1aab7-8a6c-49f4-b450-95d31fba06e2"},"once":false}︡{"done":true}︡
︠e678e368-c95b-41bd-9223-8a40c661e42fs︠
#low level

print(robjects.r.help("sum"))
︡f89f1d59-e591-4bee-8255-644a3db7fb1e︡{"stdout":"R Help on ‘sum’"}︡{"stdout":"sum                    package:base                    R Documentation\n\n_\bS_\bu_\bm _\bo_\bf _\bV_\be_\bc_\bt_\bo_\br _\bE_\bl_\be_\bm_\be_\bn_\bt_\bs\n\n_\bD_\be_\bs_\bc_\br_\bi_\bp_\bt_\bi_\bo_\bn:\n\n     ‘sum’ returns the sum of all the values present in its arguments.\n\n_\bU_\bs_\ba_\bg_\be:\n\n     sum(..., na.rm = FALSE)\n     \n_\bA_\br_\bg_\bu_\bm_\be_\bn_\bt_\bs:\n\n     ...: numeric or complex or logical vectors.\n\n   na.rm: logical.  Should missing values (including ‘NaN’) be removed?\n\n_\bD_\be_\bt_\ba_\bi_\bl_\bs:\n\n     This is a generic function: methods can be defined for it directly\n     or via the ‘Summary’ group generic.  For this to work properly,\n     the arguments ‘...’ should be unnamed, and dispatch is on the\n     first argument.\n\n     If ‘na.rm’ is ‘FALSE’ an ‘NA’ or ‘NaN’ value in any of the\n     arguments will cause a value of ‘NA’ or ‘NaN’ to be returned,\n     otherwise ‘NA’ and ‘NaN’ values are ignored.\n\n     Logical true values are regarded as one, false values as zero.\n     For historical reasons, ‘NULL’ is accepted and treated as if it\n     were ‘integer(0)’.\n\n     Loss of accuracy can occur when summing values of different signs:\n     this can even occur for sufficiently long integer inputs if the\n     partial sums would cause integer overflow.  Where possible\n     extended-precision accumulators are used, but this is\n     platform-dependent.\n\n_\bV_\ba_\bl_\bu_\be:\n\n     The sum. If all of ‘...’ are of type integer or logical, then the\n     sum is integer, and in that case the result will be ‘NA’ (with a\n     warning) if integer overflow occurs.  Otherwise it is a length-one\n     numeric or complex vector.\n\n     *NB:* the sum of an empty set is zero, by definition.\n\n_\bS_\b4 _\bm_\be_\bt_\bh_\bo_\bd_\bs:\n\n     This is part of the S4 ‘Summary’ group generic.  Methods for it\n     must use the signature ‘x, ..., na.rm’.\n\n     ‘plotmath’ for the use of ‘sum’ in plot annotation.\n\n_\bR_\be_\bf_\be_\br_\be_\bn_\bc_\be_\bs:\n\n     Becker, R. A., Chambers, J. M. and Wilks, A. R. (1988) _The New S\n     Language_.  Wadsworth & Brooks/Cole.\n\n_\bS_\be_\be _\bA_\bl_\bs_\bo:\n\n     ‘colSums’ for row and column sums.\n\n_\bE_\bx_\ba_\bm_\bp_\bl_\be_\bs:\n\n     ## Pass a vector to sum, and it will add the elements together.\n     sum(1:5)\n     \n     ## Pass several numbers to sum, and it also adds the elements.\n     sum(1, 2, 3, 4, 5)\n     \n     ## In fact, you can pass vectors into several arguments, and everything gets added.\n     sum(1:2, 3:5)\n     \n     ## If there are missing values, the sum is unknown, i.e., also missing, ....\n     sum(1:5, NA)\n     ## ... unless  we exclude missing values explicitly:\n     sum(1:5, NA, na.rm = TRUE)\n     \n\n"}︡{"done":true}︡
︠78350d46-d172-4f57-ad72-771514a731c3s︠
# via RPy2 wrappers
help_sum = robjects.help.Package("base").fetch("sum")
︡2366f132-63cc-4c53-aa3d-b48a8af65971︡{"done":true}︡
︠269928db-b217-4167-aed7-43d38d5d83b6s︠
print(help_sum.title())
︡85cf3344-7b09-4a04-96ac-51d320e0090c︡{"stdout":"Sum of Vector Elements\n"}︡{"done":true}︡
︠7a7c4321-ffe2-41dd-964c-25b841810beds︠
print(help_sum.description())
︡45921a2e-8b78-4bb4-b92b-4600b44b8b99︡{"stdout":"\n  \\code{sum} returns the sum of all the values\n  present in its arguments.\n\n"}︡{"done":true}︡
︠9fdaece2-9975-4a3d-ba4f-64f514f6ffdbs︠
print(help_sum.usage())
︡671fdce3-cafe-4025-82bc-b69bb71c388e︡{"stdout":"\nsum(\\dots, na.rm = FALSE)\n\n"}︡{"done":true}︡
︠a735f44a-9169-40ff-bc30-b0fef56d75dcs︠
for arg, descr in help_sum.arguments():
    print("%-10s: %s" % (arg, descr))

︡a4c3b1cc-8c28-44f8-9d21-315e8c36a7be︡{"stdout":"...       : numeric or complex or logical vectors.\nna.rm     : logical.  Should missing values (including \\code{NaN}) be\n    removed?\n"}︡{"done":true}︡
︠635d8f68-596e-4ab2-9e89-eb62ad43e5b2s︠
print(help_sum.seealso())
︡dd2d6a8e-82b6-4bcb-9036-fb080e5ddd7c︡{"stdout":"\n  \\code{\\link{colSums}} for row and column sums.\n\n"}︡{"done":true}︡
︠8103bb26-39dd-4d25-8d19-85077add355ds︠
print(help_sum.value())
︡6a157a94-1762-4788-a97f-ce80979c5d54︡{"stdout":"\n  The sum. If all of \\code{\\dots} are of type integer or logical, then\n  the sum is integer, and in that case the result will be \\code{NA} (with a\n  warning) if integer overflow occurs.  Otherwise it is a length-one\n  numeric or complex vector.\n\n  \\strong{NB:} the sum of an empty set is zero, by definition.\n\n"}︡{"done":true}︡
︠99f2775e-bb1f-403c-ba92-123ee98053b2s︠
help_sum.sections.keys()
︡e3d46e9b-81aa-4ee2-be39-a0b90bdc3196︡{"stdout":"('title', 'name', 'alias', 'keyword', 'description', 'usage', 'arguments', 'details', 'value', 'section', 'references', 'seealso', 'examples')\n"}︡{"done":true}︡
︠6486f5a3-cbf3-4c87-80af-e282aac8f31fs︠
print(''.join(help_sum.to_docstring(("title", "usage", 'details', "references", "section"))))
︡fecce130-c13c-4d70-afb4-506711b642dd︡{"stdout":"title\n-----\n\nSum of Vector Elements \n\nusage\n-----\n\n\n sum( , na.rm = FALSE)\n \n\ndetails\n-------\n\n\n   This is a generic function: methods can be defined for it\n   directly or via the  Summary  group generic.\n   For this to work properly, the arguments   should be\n   unnamed, and dispatch is on the first argument.\n \n   If  na.rm  is  FALSE  an  NA  or  NaN  value in\n   any of the arguments will cause a value of  NA  or  NaN  to\n   be returned, otherwise  NA  and  NaN  values are ignored.\n \n   Logical true values are regarded as one, false values as zero.\n   For historical reasons,  NULL  is accepted and treated as if it\n   were  integer(0) .\n \n   Loss of accuracy can occur when summing values of different signs:\n   this can even occur for sufficiently long integer inputs if the\n   partial sums would cause integer overflow.  Where possible\n   extended-precision accumulators are used, but this is\n   platform-dependent.\n \n\nreferences\n----------\n\n\n   Becker, R. A., Chambers, J. M. and Wilks, A. R. (1988)\n    The New S Language .\n   Wadsworth & Brooks/Cole.\n \n\nsection\n-------\n\nS4 methods \n   This is part of the S4  Summary \n   group generic.  Methods for it must use the signature\n    x,  , na.rm .\n \n    plotmath  for the use of  sum  in plot annotation.\n \n\n\n"}︡{"done":true}︡
︠62086caf-60f3-494e-867e-5ab1e40bd65fs︠
︡d7003aec-1d44-4f3e-af87-cfa28aad4c61︡{"done":true}︡









