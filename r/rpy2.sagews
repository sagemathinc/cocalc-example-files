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
︡21dac77a-6633-4dcf-9cf7-26d6b62b13b6︡{"auto":true}︡{"stdout":"'2.3.8'\n"}︡
︠a3bb2d3d-b5f3-42b6-a94c-0add5b823b54i︠
%md
### Referencing R functions
RPy2's `robjects` (or sometimes just imported as `ro`) exposes the R instance as `.r`.
It is rather easy to get hold of functions and reference them from Python:
︡31edbbb3-8f4e-4230-b9cf-35a5348057e9︡{"html":"<h3>Referencing R functions</h3>\n\n<p>RPy2&#8217;s <code>robjects</code> (or sometimes just imported as <code>ro</code>) exposes the R instance as <code>.r</code>.\nIt is rather easy to get hold of functions and reference them from Python:</p>\n"}︡
︠08150b38-b19e-4975-b9e4-470916ea8f28︠
c = robjects.r['c']
summary = robjects.r['summary']
︡eb7bbe96-7a16-4349-9dd1-bb2879a528b4︡
︠753c2844-6bd8-4199-bdbd-41aba057798c︠
v1 = c(5,4.4,1,-1.8)
sumv1 = summary(v1)
print sumv1.__repr__()
︡e850fc6f-e63d-4f51-b2a0-7b8820c275a4︡{"stdout":"<FloatVector - Python:0xcb87ef0 / R:0xb909818>\n[-1.800000, 0.300000, 2.700000, 2.150000, 4.550000, 5.000000]\n"}︡
︠2a554e52-b207-4eb2-a6ad-0ce14f5d0adc︠
print sumv1
︡2735446b-12e5-49cc-8c2f-46261839a697︡{"stdout":"   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. \n  -1.80    0.30    2.70    2.15    4.55    5.00 \n\n"}︡
︠c1883ade-70ce-4b99-aa5e-adba5a2d84fa︠
sumv1[3]
︡9686fa19-c86a-42a6-bb3e-61fdaecec7da︡{"stdout":"2.15\n"}︡
︠ba9d8e2e-283f-456b-8c66-24242ea614e5i︠
%md
### Evaluating R code directly
︡0155f3eb-aca1-4ddf-a837-c1c0bb96bd74︡{"html":"<h3>Evaluating R code directly</h3>\n"}︡
︠65244f5f-3779-42b3-a734-24c7ae2a5a96︠
robjects.reval("""\
zz <- 1:10
print(paste("sd(zz) = ", sd(zz)))
""")
︡5cf5c9fc-d6fb-42fc-a907-9fbd554c4244︡{"stdout":"[1] \"sd(zz) =  3.02765035409749\"\n<rpy2.rinterface.SexpVector - Python:0x7f712f0e0de0 / R:0xc367758>\n"}︡
︠4057441f-b896-49c1-99eb-ae23a50032d4︠
︡4f4c945f-90b3-44ee-9a12-37f7f562db63︡
︠bc70060d-092f-4742-95f3-c3ae64527fdd︠
myfunc = robjects.r("""\
function(x) {
   k <- x^2 + rnorm(1)
   k <- 2 * k + 1
   return(k)
}""")
︡59c1b254-cb01-45fc-9a28-1fa24d7d945e︡
︠668eb0b4-6b64-4522-91ea-42426e1a859b︠
myfunc(2.)
︡a59a44db-50ff-4af6-ad71-7544287c87ef︡{"stdout":"<FloatVector - Python:0xcb840e0 / R:0xc36a608>\n[9.414012]\n"}︡
︠a4d4c5cd-c609-4fc3-a7ef-93bb94939387i︠
%md
### Vectorization
First, enable automatic conversion from NumPy arrays to R arrays.
Then, even the custom function works out of the box.
︡2ff068cd-acd4-4aae-9d42-2d42842ff64a︡{"html":"<h3>Vectorization</h3>\n\n<p>First, enable automatic conversion from NumPy arrays to R arrays.\nThen, even the custom function works out of the box.</p>\n"}︡
︠f899be96-cbb3-468c-946a-af4b125ed1cd︠
from rpy2.robjects.numpy2ri import numpy2ri
robjects.conversion.py2ri = numpy2ri
︡f401579f-d5da-4c09-b7b3-16f0ad1a21f5︡
︠c4a06e88-a79d-4713-a981-e14d50d8704b︠
xx = np.array([5,4,2.2,-1,-5.5])
print "Data Type:   ", type(xx)
print "Element Type:", xx.dtype
print "Array Shape: ", xx.shape
︡b744a090-56ba-4708-9e54-6a043720db93︡{"stdout":"Data Type:    <type 'numpy.ndarray'>\n"}︡{"stdout":"Element Type: float64\n"}︡{"stdout":"Array Shape:  (5,)\n"}︡
︠5260ca95-2c50-4572-acf9-726ccf08549b︠
summary(xx)
︡0ca3d01b-65b7-4c19-be94-0e032c5d99ea︡{"stdout":"<FloatVector - Python:0xcb84cb0 / R:0xccc36e8>\n[-5.500000, -1.000000, 2.200000, 0.940000, 4.000000, 5.000000]\n"}︡
︠173bcae2-8d69-447f-b590-0fcaf954e08c︠
myfunc(xx)
︡220a2b28-c2b4-4d77-b574-5d83ec761ddf︡{"stdout":"<Array - Python:0xcb844d0 / R:0xcce7470>\n[51.160216, 33.160216, 10.840216, 3.160216, 61.660216]\n"}︡
︠15e91fea-9588-4637-b429-a88b75970afd︠

︡7d160ec6-32bd-49d2-8995-83ae27b8b917︡
︠040cbcd3-100d-4aaf-9fc9-92b3dff3200fi︠
%md
### Types of Vectors
### `[ ]` and `[[  ]]` are `rx` and `rx2`
︡903aa975-c2c0-429b-b83f-528003c48909︡{"html":"<h3>Types of Vectors</h3>\n\n<h3><code>[ ]</code> and <code>[[  ]]</code> are <code>rx</code> and <code>rx2</code></h3>\n"}︡
︠147bd829-d78b-4ecb-9f3d-0a6c8a980f88︠
# Python style: (10 exclusive)
# v1 = robjects.IntVector(range(1,10))
# R style: (10 inclusive)
v1 = robjects.r.seq(1,10)
print v1
︡c00d1291-9d36-47c6-bc69-0fdec728d4e3︡{"stdout":" [1]  1  2  3  4  5  6  7  8  9 10\n\n"}︡
︠eec9f3a7-f203-4891-869f-91f78414d76d︠
# Python style, 0-based indexing of vectors
print v1[0]
v1[0] = -99
print v1
︡993e7a9b-e7ef-4541-affb-20e03f848c76︡{"stdout":"1\n"}︡{"stdout":" [1] -99   2   3   4   5   6   7   8   9  10\n\n"}︡
︠0c3cec50-9aa9-4e40-8ea9-ea9725a65d7e︠
# R style, 1-based indexing
v1.rx[3] = 99
print v1.rx(3)

︡698e4572-9905-4fb0-b8c1-59f4cb7aa26b︡{"stdout":"[1] 99\n\n"}︡
︠ace975cd-4964-4d26-88fb-2532e88d1784︠
l1 = robjects.r("list(aa = c(1,2,3), bb = c(-5,5), cc = 'help')")
print l1
︡78b7ce6f-4fe4-40e6-9d64-cb2ed8849481︡{"stdout":"$aa\n[1] 1 2 3\n\n$bb\n[1] -5  5\n\n$cc\n[1] \"help\"\n\n\n"}︡
︠e47cf3dc-037b-4b34-8fc4-c2e9a5c240cc︠
# R's [[1]]
print l1.rx2(1)
︡e2f5aef6-f570-4590-a3ae-ff1fab9ce09e︡{"stdout":"[1] 1 2 3\n\n"}︡
︠b95270c9-5ccf-420b-8f67-065b8afba88f︠
# Constructing the same from Python is harder, since we need an ordered dictionary
import rpy2.rlike.container as rlc
l2 = robjects.ListVector(
         rlc.OrdDict((
              ('aa', robjects.IntVector([1,2,3])),
              ('bb', robjects.IntVector([-5,5])),
              ('cc', "help"))))
print l2
︡dc31a2c6-a068-49ec-9792-7c209effab16︡{"stdout":"$aa\n[1] 1 2 3\n\n$bb\n[1] -5  5\n\n$cc\n[1] \"help\"\n\n\n"}︡
︠34423b7d-e08a-4926-ab23-9ff3489367f9︠
# assigning a new string vector to "bb"
l1.rx2["bb"] = robjects.StrVector("this is a short sentence".split())
print(l1[l1.names.index("bb")])
︡217e2f9e-4c80-4e19-9247-dcdcc7ed3602︡{"stdout":"[1] \"this\"     \"is\"       \"a\"        \"short\"    \"sentence\"\n\n"}︡
︠059cd82a-e06f-45cf-b0a1-2915fc4c7561︠
# Matrix
︡62f4c32b-bc09-494e-bfa1-ef29ee6ff23d︡
︠caa26080-2351-4bb2-897a-940d071da6b5︠
m = robjects.r.matrix(range(10), nrow=5)
print(m)
︡59ece7a5-c97b-4cbb-8da1-7084e705214d︡{"stdout":"     [,1] [,2]\n[1,] 0    5   \n[2,] 1    6   \n[3,] 2    7   \n[4,] 3    8   \n[5,] 4    9   \n\n"}︡
︠c38456a9-ca79-4eb4-a2aa-ee92c8d01d29︠
m.rx2(4,2)
︡3af47175-1551-489a-acc2-3a9c86969eca︡{"stdout":"<IntVector - Python:0xcb879e0 / R:0xc657388>\n[       8]\n"}︡
︠b32fe8d8-2858-4294-91af-79b35f64aee2︠
# R-operators work, too
print(m.ro > 5)
︡dafb7c4c-d0ef-4e1d-a9f6-8119abd87ff2︡{"stdout":"      [,1]  [,2]\n[1,] FALSE FALSE\n[2,] FALSE  TRUE\n[3,] FALSE  TRUE\n[4,] FALSE  TRUE\n[5,] FALSE  TRUE\n\n"}︡
︠abae6f14-40ca-4f05-981d-e57612d7da93︠
print m.rx((m.ro > 3).ro & (m.ro <= 6))

︡bd3d87a6-1a62-4758-b771-6510868e2b08︡{"stdout":"[[1]]\n[1] 4\n\n[[2]]\n[1] 5\n\n[[3]]\n[1] 6\n\n\n"}︡
︠57064f6d-44ac-4ade-97ef-081a26832c1ai︠
%md
### Bonus: Factors
︡7a1b16fd-86c0-44ad-93cd-4f44e74e6e58︡{"html":"<h3>Bonus: Factors</h3>\n"}︡
︠a45684b3-6f03-4571-9529-65c5ce39ce24︠
sv = robjects.StrVector('xyyyxyzyzyxx')
fac = robjects.FactorVector(sv)
print(fac)
︡753b70b0-7130-4c9a-bded-0afb13c0c64d︡{"stdout":" [1] x y y y x y z y z y x x\nLevels: x y z\n\n"}︡
︠a77083a8-8fb4-4b80-9de0-785117661439︠
print(summary(fac))
︡cf09381f-7b63-4523-81d7-24074533196d︡{"stdout":"x y z \n4 6 2 \n\n"}︡
︠914d8922-a802-412d-a3ad-c544ad1903dci︠
%md
### Packages
The idea is to get hold of a reference to a package.
The reference is like a module-namespace and populated with all the members.
︡b525a8f6-931c-4a7d-9882-57e27015c692︡{"html":"<h3>Packages</h3>\n\n<p>The idea is to get hold of a reference to a package.\nThe reference is like a module-namespace and populated with all the members.</p>\n"}︡
︠a18c1e66-7233-45c1-8483-754271f71f31︠
from rpy2.robjects.packages import importr
r_base = importr("base")
print("a bit of the namespace:")
print(dir(r_base)[-50:-40])
︡f8b1c5cc-9134-456e-a9a0-900ab5f5faee︡{"stdout":"a bit of the namespace:\n"}︡{"stdout":"['upper_tri', 'url', 'utf8ToInt', 'vapply', 'vector', 'version', 'warning', 'warnings', 'weekdays', 'weekdays_Date']\n"}︡
︠029ee09a-8694-42bd-8fa7-2d67fca9ba75︠
print(r_base.version)
︡2a66644e-16d4-4f37-b7a4-f09e064b9f35︡{"stdout":"               _                            \nplatform       x86_64-unknown-linux-gnu     \narch           x86_64                       \nos             linux-gnu                    \nsystem         x86_64, linux-gnu            \nstatus                                      \nmajor          2                            \nminor          15.2                         \nyear           2012                         \nmonth          10                           \nday            26                           \nsvn rev        61015                        \nlanguage       R                            \nversion.string R version 2.15.2 (2012-10-26)\nnickname       Trick or Treat               \n\n"}︡
︠60345945-875a-454e-8952-a0f0df6272b0︠
# use Python's `getattr` to access non-standard named identifyers.
# e.g. matrix multiplication applied to two integers.
getattr(r_base, "%*%")(65,9)
︡17e001b8-0072-467a-837a-8da7d5000401︡{"stdout":"<Matrix - Python:0xd0158c0 / R:0xcd55ed8>\n[585.000000]\n"}︡
︠ddf7c8a4-ad4d-4c0a-9a04-b08cafc324a9︠

︡8110be28-3055-4e11-a105-ebc18988d4e0︡
︠1dbf1da9-2c8d-497d-9b16-1721438f1118︠
r_base.rep(r_base.c("x", "y", "z"), 10)
︡441d4362-a221-43a7-b533-e4eac92b6dbd︡{"stdout":"<StrVector - Python:0xd015a70 / R:0xcf2e0b0>\n['x', 'y', 'z', ..., 'x', 'y', 'z']\n"}︡
︠3da353d4-4bd4-413f-bea1-8d585f6d1725︠
︡73357c15-3a90-4122-97fa-cb1cad1e0146︡
︠440dc108-dfa3-4279-83c8-352845d54ebc︠
r_stats = importr("stats")
︡71ab8603-c7be-4ea9-bf86-ddec1fe4464a︡
︠380c0cee-b403-49b7-ae25-2348eba51f71︠

︠5591a3dd-a31e-4b68-b41f-12b19595b549︠

︠0d5766e0-12c8-4c2d-a646-398a8147c804︠

︠905e1b00-c8bd-404e-9df3-72e6cdc4a512︠
# datasets
datasets = importr('datasets')
faithful = datasets.__rdata__.fetch("faithful")["faithful"]
print type(faithful)
︡ce4e3a68-7ded-47b4-ad91-6448cd0ef651︡{"stdout":"<class 'rpy2.robjects.vectors.DataFrame'>\n"}︡
︠6dc17296-b581-4a6c-aa31-34237e79d88d︠
# number of columns!
len(faithful)
︡ed073903-bf3d-423c-a42c-331565617afc︡{"stdout":"2\n"}︡
︠cc50e34b-1dd8-4243-b7af-01ac7bf0b5d0︠
# datatypes in R for each column
[column.rclass[0] for column in faithful]
︡33f70cd5-a593-443d-a568-fd3f626ef255︡{"stdout":"['numeric', 'numeric']\n"}︡
︠552ce8f0-2ffe-41e3-a283-6cdfc41d97d5︠
# extract some rows
print(faithful.rx(robjects.IntVector([2,3,4,10]), True))
︡53ecc233-1064-4703-8646-3e66530458aa︡{"stdout":"   eruptions waiting\n2      1.800      54\n3      3.333      74\n4      2.283      62\n10     4.350      85\n\n"}︡
︠8605de22-3ba6-467f-a5d8-4dddee8910ea︠
# extract part of a column
print(faithful.rx2("eruptions")[:10])
︡b0d2ed65-e847-4771-92f6-c1104072843a︡{"stdout":" [1] 3.600 1.800 3.333 2.283 4.533 2.883 4.700 3.600 1.950 4.350\n\n"}︡
︠816aaeaf-3b20-46a9-bb0c-1e745de14650︠

︠f7c03b20-ebb6-4368-abc5-8b96d9c7c3e1︠

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
︡33b20016-abf4-45ed-b5a6-4b65e3339e6c︡
︠0bb9dbd0-bde4-448a-b461-e4a4f3669f85︠
lmod = robjects.r.lm("y ~ x", data = data)
︡a7e851bd-25fb-4528-98eb-49e112011999︡
︠aa5ef93b-b8d6-4b17-bca4-77df4598aaa7︠
print lmod.names
︡95c208c6-b910-4329-a1c7-f448a05548c1︡{"stdout":" [1] \"coefficients\"  \"residuals\"     \"effects\"       \"rank\"         \n [5] \"fitted.values\" \"assign\"        \"qr\"            \"df.residual\"  \n [9] \"xlevels\"       \"call\"          \"terms\"         \"model\"        \n\n"}︡
︠31a546ad-4be7-41cc-a53b-1d3dc93f9a09︠
coeffs = lmod.rx2("coefficients")
print "R's representation via 'print'"
print(coeffs)
print
print "Same coefficients in Python's floats:"
print ([x for x in coeffs])
︡f34c7456-d198-486d-9e56-8409393eed3b︡{"stdout":"R's representation via 'print'\n"}︡{"stdout":"(Intercept)           x \n   2.328485    1.215469 \n\n"}︡{"stdout":"\n"}︡{"stdout":"Same coefficients in Python's floats:\n"}︡{"stdout":"[2.328485324947587, 1.2154692791485247]\n"}︡
︠6137da7a-683b-49ef-94f8-f8e5580ef91e︠
# max is from Python, iterates naturally over the entries in all residuals
print max(lmod.rx2("residuals"))

︡37dbe7e8-c3f9-481a-b09e-ed9acc5e16e8︡{"stdout":"0.456045395904\n"}︡
︠8e2f0f08-172c-4aed-985b-49eeef268e32i︠
%md
### Plot
︡856a0bb5-d7bc-4680-b788-f7cc2e046816︡{"html":"<h3>Plot</h3>\n"}︡
︠306277e0-2893-456d-982c-b6befa27356f︠
from rpy2.robjects.packages import importr
grdevices = importr('grDevices')
︡fbbca808-7d7c-4f7c-bbff-ac09b1fb6053︡
︠803df10d-4d5c-48ab-b5a8-dcae626705a0︠
# just calling "plot" on the dataframe
︡bd16efc1-f82b-44db-b8a3-4c5ccc555207︡
︠2158b6a8-07d6-4875-85ef-2cbbda125559︠
_ = grdevices.png(file="rpy2_plot.png", width=640, height=320)
_ = robjects.r.plot(data)
grdevices.dev_off()
︡96235ec3-9224-4f40-94e4-b0ffd3856876︡{"stdout":"<IntVector - Python:0xe2f9908 / R:0xe3c7a68>\n[       1]\n"}︡
︠d456b05e-1f32-478e-9f00-1f9ccc13163d︠
salvus.file("rpy2_plot.png")
︡ca08b67e-8068-41cc-8a10-1bbf1a5469a1︡{"once":false,"file":{"show":true,"uuid":"c9ae0343-c983-49f3-9018-f8c0b053c189","filename":"rpy2_plot.png"}}︡
︠18a8d0d2-616a-4fb3-adaf-ee93f51d6ba4︠
# Plot of the linear model lmod
︡9e33cb7c-6553-492f-8448-e29a939f0f94︡
︠91a26196-5439-4a7e-9d38-83c4834da04a︠
_ = grdevices.png(file="rpy2_plot_2.png", width=640, height=520)
_ = robjects.reval("par(mfrow=c(2,2))")
_ = robjects.r.plot(lmod)
grdevices.dev_off()
︡1c6943cc-2475-4ddb-b40e-ee5a98512058︡{"stdout":"<IntVector - Python:0xe2e6320 / R:0xd9015f8>\n[       2]\n"}︡
︠2ca81aa8-a93b-47e4-b479-45a44dde46d7︠
salvus.file("rpy2_plot_2.png")
︡0c424ed6-c476-4801-aca4-7699d1a35a47︡{"once":false,"file":{"show":true,"uuid":"1072bec5-2c10-4172-bc10-7299c3bc138c","filename":"rpy2_plot_2.png"}}︡
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









