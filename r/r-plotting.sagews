︠bf8be137-6f06-4a1a-8bde-29db2f3b699ci︠
%html
<h1>Graphics using R in the Sagemath Cloud</h1>

This is a Sagemath Cloud worksheet version of Frank McCown's tutorial from <a target="_blank" href="http://www.harding.edu/fmccown/r/">http://www.harding.edu/fmccown/r/</a>.

First, we put the worksheet into R mode (otherwise you would have to type %r at the beginning of each cell):
︡b681936d-d97e-4e2d-8989-45f0ee24bdeb︡︡{"done":true,"html":"<h1>Graphics using R in the Sagemath Cloud</h1>\n\nThis is a Sagemath Cloud worksheet version of Frank McCown's tutorial from <a target=\"_blank\" href=\"http://www.harding.edu/fmccown/r/\">http://www.harding.edu/fmccown/r/</a>.\n\nFirst, we put the worksheet into R mode (otherwise you would have to type %r at the beginning of each cell):"}
︠52916e12-5c4c-4f11-aa93-8014696978b6as︠
%auto
%default_mode r
︡76e93264-b9af-4b13-b0be-66e311e36a4c︡︡{"auto":true}︡{"done":true}
︠39db6a73-5d9c-4399-9bad-1c053b8c433ci︠
%md
Setting up the working directory of R to be the one where the Sage Worksheet is sitting.
︡25a6808d-e2e7-41ba-87c7-3258c5bc7404︡︡{"done":true,"md":"Setting up the working directory of R to be the one where the Sage Worksheet is sitting."}
︠9780d6a9-f8d5-4420-a48f-8ebaa15a98aas︠
%python
r.set("workdir", "'%s'" % os.path.abspath(os.curdir))
︡5b5a3f2d-85e3-4465-bb0e-461a1100d49b︡︡{"done":true}
︠c837c07e-7594-4942-9d2a-6e460cf44066s︠
setwd(workdir)
︡3b3c0d7c-72e2-4678-9e7e-7f257f284763︡︡{"done":true}
︠f21b68be-89d4-4f09-9fb5-37e0b7d7d113i︠

%md

## Line Charts
First we'll produce a very simple graph using the values in the car vector:
︡61cfa1bc-6725-466a-a783-c4e13fcec634︡︡{"done":true,"md":"\n## Line Charts\nFirst we'll produce a very simple graph using the values in the car vector:"}
︠a6d0bfa4-f12f-4d6a-849e-4a4c3b959bces︠
# Define the cars vector with 5 values
cars <- c(1, 3, 6, 4, 9)
# Graph the cars vector with all defaults
plot(cars)
︡3fa4fd2f-7759-410c-b63c-39d72653e86b︡︡{"stdout":"\n","done":false}︡{"once":false,"done":false,"file":{"show":true,"uuid":"345b3bdc-1a13-4cc9-beec-5bbf1ec9fea9","filename":"/tmp/6756b2af-c7f5-454d-8466-d2767505d72e.svg"}}︡{"stdout":"\n","done":false}︡{"done":true}
︠c1cf70ee-1440-46c7-8842-787a4b8ef2a6i︠
%md
Let's add a title, a line to connect the points, and some color:
︡cd48ca58-8e57-4194-90d1-edb2ba42059e︡︡{"done":true,"md":"Let's add a title, a line to connect the points, and some color:"}
︠abb3782a-bd6f-4388-b5fe-75f7ad8bd793s︠
# Graph cars using blue points overlayed by a line
plot(cars, type="o", col="blue")

# Create a title with a red, bold/italic font
title(main="Autos", col.main="red", font.main=4)
︡8172a420-3668-44a0-9d19-9c91e8609efc︡︡{"stdout":"\n","done":false}︡{"once":false,"done":false,"file":{"show":true,"uuid":"d088e4c3-9ab2-42da-b4cd-d0e77d3a97e2","filename":"/tmp/0f322935-0974-4334-a206-33f6fa25fba9.svg"}}︡{"stdout":"\n","done":false}︡{"done":true}
︠69f3e8ee-7d0b-4317-b069-8c8ea4366defi︠
%md
Now let's add a red line for trucks and specify the y-axis range directly so it will be large enough to fit the truck data:
︡9b990857-614a-47bc-929b-be321f28c3ac︡︡{"done":true,"md":"Now let's add a red line for trucks and specify the y-axis range directly so it will be large enough to fit the truck data:"}
︠0d958bec-d38b-4cda-b786-1cedf536d74fs︠
trucks <- c(2, 5, 4, 5, 12)
# Graph cars using a y axis that ranges from 0 to 12
plot(cars, type="o", col="blue", ylim=c(0,12))
# Graph trucks with red dashed line and square points
lines(trucks, type="o", pch=22, lty=2, col="red")
# Create a title with a red, bold/italic font
title(main="Autos", col.main="red", font.main=4)
︡3318c9b0-d46f-4c23-afb1-2100f7098c3a︡︡{"stdout":"\n","done":false}︡{"once":false,"done":false,"file":{"show":true,"uuid":"823dd06a-e3bf-4743-8482-3f7ed3d862ac","filename":"/tmp/3903a362-900d-457b-b7b9-48972d0a4ec3.svg"}}︡{"stdout":"\n","done":false}︡{"done":true}
︠337bc274-2f27-4ca6-aaf7-3090ec48b5cbi︠
%md
Next let's change the axes labels to match our data and add a legend. We'll also compute the $y$-axis values using the max function so any changes to our data will be automatically reflected in our graph.
︡935218b3-5823-4564-a89f-63a93d9c5db1︡︡{"done":true,"md":"Next let's change the axes labels to match our data and add a legend. We'll also compute the $y$-axis values using the max function so any changes to our data will be automatically reflected in our graph."}
︠f46eac61-b35e-4739-a56a-d21c22f6128ds︠
# Calculate range from 0 to max value of cars and trucks
g_range <- range(0, cars, trucks)

# Graph autos using y axis that ranges from 0 to max
# value in cars or trucks vector.  Turn off axes and
# annotations (axis labels) so we can specify them ourself
plot(cars, type="o", col="blue", ylim=g_range, axes=FALSE, ann=FALSE)

# Make x axis using Mon-Fri labels
axis(1, at=1:5, lab=c("Mon","Tue","Wed","Thu","Fri"))

# Make y axis with horizontal labels that display ticks at
# every 4 marks. 4*0:g_range[2] is equivalent to c(0,4,8,12).
axis(2, las=1, at=4*0:g_range[2])

# Create box around plot
box()

# Graph trucks with red dashed line and square points
lines(trucks, type="o", pch=22, lty=2, col="red")

# Create a title with a red, bold/italic font
title(main="Autos", col.main="red", font.main=4)

# Label the x and y axes with dark green text
title(xlab="Days", col.lab=rgb(0,0.5,0))
title(ylab="Total", col.lab=rgb(0,0.5,0))

# Create a legend at (1, g_range[2]) that is slightly smaller
# (cex) and uses the same line colors and points used by
# the actual plots
legend(1, g_range[2], c("cars","trucks"), cex=0.8,
   col=c("blue","red"), pch=21:22, lty=1:2);
︡0e59cdfa-36e2-45e1-864b-580fca51b2d9︡︡{"stdout":"\n","done":false}︡{"once":false,"done":false,"file":{"show":true,"uuid":"e62b525d-713c-470c-8f10-8227d1ae9532","filename":"/tmp/fed6626b-56f3-4c94-aa48-d2b68ee55a7b.svg"}}︡{"stdout":"\n","done":false}︡{"done":true}
︠d3d5af40-30b8-4d57-9e71-4c61b2e7ccf3i︠
%md
Now let's read the graph data directly from a tab-delimited file. The file contains an additional set of values for SUVs.
We'll create the file using the `%sage_saluvs.file cell decorator:
︡93304d5c-e312-4e61-aef0-a7bbf85962c9︡︡{"done":true,"md":"Now let's read the graph data directly from a tab-delimited file. The file contains an additional set of values for SUVs.\nWe'll create the file using the `%sage_saluvs.file cell decorator:"}
︠35248d5e-421c-43f3-a3bd-c8c82d585fcds︠
%sage_salvus.file("autos.dat")
cars	trucks	suvs
1	2	4
3	5	4
6	4	6
4	5	6
9	12	6
3	9	2
4	8	3
︡06f00957-9a0c-4463-b170-f159fa4e30cf︡︡{"done":true}
︠8681a917-4cc5-46c9-a2bb-1661c16d8509i︠
%md
We'll also use a vector for storing the colors to be used in our graph so
if we want to change the colors later on, there's only one place in the file that needs to be modified.
Finally we'll send the figure directly to a PNG file.  (You can also instead just right click on a figure
embedded in the worksheet and click save as if you want.)
︡78392948-6d11-49b1-be76-65d429f4f1a9︡︡{"done":true,"md":"We'll also use a vector for storing the colors to be used in our graph so\nif we want to change the colors later on, there's only one place in the file that needs to be modified.\nFinally we'll send the figure directly to a PNG file.  (You can also instead just right click on a figure\nembedded in the worksheet and click save as if you want.)"}
︠bb3e376d-a028-4c41-a7c9-72682cb48fcas︠
# Read car and truck values from tab-delimited autos.dat
autos_data <- read.table("autos.dat", header=T, sep="\t")

# Compute the largest y value used in the data (or we could
# just use range again)
max_y <- max(autos_data)

# Define colors to be used for cars, trucks, suvs
plot_colors <- c("blue","red","forestgreen")

# Start PNG device driver to save output to figure.png
png(filename="figure.png", height=295, width=300, bg="white")

# Graph autos using y axis that ranges from 0 to max_y.
# Turn off axes and annotations (axis labels) so we can
# specify them ourself
plot(autos_data$cars, type="o", col=plot_colors[1], ylim=c(0,max_y), axes=FALSE, ann=FALSE)

# Make x axis using Mon-Fri labels
axis(1, at=1:5, lab=c("Mon", "Tue", "Wed", "Thu", "Fri"))

# Make y axis with horizontal labels that display ticks at
# every 4 marks. 4*0:max_y is equivalent to c(0,4,8,12).
axis(2, las=1, at=4*0:max_y)

# Create box around plot
box()

# Graph trucks with red dashed line and square points
lines(autos_data$trucks, type="o", pch=22, lty=2, col=plot_colors[2])

# Graph suvs with green dotted line and diamond points
lines(autos_data$suvs, type="o", pch=23, lty=3, col=plot_colors[3])

# Create a title with a red, bold/italic font
title(main="Autos", col.main="red", font.main=4)

# Label the x and y axes with dark green text
title(xlab= "Days", col.lab=rgb(0,0.5,0))
title(ylab= "Total", col.lab=rgb(0,0.5,0))

# Create a legend at (1, max_y) that is slightly smaller
# (cex) and uses the same line colors and points used by
# the actual plots
legend(1, max_y, names(autos_data), cex=0.8, col=plot_colors, pch=21:23, lty=1:3);

# Turn off device driver (to flush output to png)
dev.off()
︡2c08132a-af5e-4d05-8287-02012d666970︡︡{"done":true}
︠7a471525-0410-43fc-b719-fde165f9c968s︠
%sage salvus.file('figure.png')
︡7bbcd97f-c6aa-4b52-81d8-b20c9a74c8fa︡︡{"once":false,"done":false,"file":{"show":true,"uuid":"31c0952b-e252-49fc-a7fe-3d11a9b74165","filename":"figure.png"}}︡{"done":true}
︠bf1a9854-e761-41c8-9715-3dc551f5a7a4i︠
%md
In this next example, we'll save the file to a PDF and chop off extra white space around the graph; this is useful when wanting to use figures in LaTeX (and cloud.sagemath has a very nice integrated latex development environment!).
We'll also increase the line widths, shrink the axis font size, and tilt the x-axis labels by 45 degrees.
︡01e6bd72-8c70-461b-ab53-60f2f3987b6c︡︡{"done":true,"md":"In this next example, we'll save the file to a PDF and chop off extra white space around the graph; this is useful when wanting to use figures in LaTeX (and cloud.sagemath has a very nice integrated latex development environment!).\nWe'll also increase the line widths, shrink the axis font size, and tilt the x-axis labels by 45 degrees."}
︠365555a4-11c2-4208-9e2a-027216b5243fs︠
# Read car and truck values from tab-delimited autos.dat
autos_data <- read.table("autos.dat", header=T, sep="\t")

# Define colors to be used for cars, trucks, suvs
plot_colors <- c(rgb(r=0.0,g=0.0,b=0.9), "red", "forestgreen")

# Start PDF device driver to save output to figure.pdf
pdf(file="figure.pdf", height=4.5, width=7)

# Trim off excess margin space (bottom, left, top, right)
par(mar=c(4.2, 3.8, 0.2, 0.2))

# Graph autos using a y axis that uses the full range of value
# in autos_data. Label axes with smaller font and use larger
# line widths.
plot(autos_data$cars, type="l", col=plot_colors[1],
   ylim=range(autos_data), axes=F, ann=T, xlab="Days",
   ylab="Total", cex.lab=0.8, lwd=2)

# Make x axis tick marks without labels
axis(1, lab=F)

# Plot x axis labels at default tick marks with labels at
# 45 degree angle
text(axTicks(1), par("usr")[3] - 2, srt=45, adj=1,
          labels=c("Mon", "Tue", "Wed", "Thu", "Fri"),
          xpd=T, cex=0.8)

# Plot y axis with smaller horizontal labels
axis(2, las=1, cex.axis=0.8)

# Create box around plot
box()

# Graph trucks with thicker red dashed line
lines(autos_data$trucks, type="l", lty=2, lwd=2, col=plot_colors[2])

# Graph suvs with thicker green dotted line
lines(autos_data$suvs, type="l", lty=3, lwd=2, col=plot_colors[3])

# Create a legend in the top-left corner that is slightly
# smaller and has no border
legend("topleft", names(autos_data), cex=0.8, col=plot_colors, lty=1:3, lwd=2, bty="n");

# Turn off device driver (to flush output to PDF)
dev.off()

# Restore default margins
par(mar=c(5, 4, 4, 2) + 0.1)
︡64284d08-e6a1-4b26-ada6-1283da6a4dc5︡︡{"done":true}
︠ff959c30-69f8-460e-a9ab-201fb7567f5ei︠
%md
We can directly look at the figure in the worksheet (you can also navigate to the pdf file andclick to view it).
︡b3254508-42df-450f-9441-9d5d6ae428e0︡︡{"done":true,"md":"We can directly look at the figure in the worksheet (you can also navigate to the pdf file andclick to view it)."}
︠e44d23d8-4fe9-4707-a6d6-8d087554b168s︠
%sage salvus.file('figure.png')
︡62da1687-4d7b-4390-9cf1-6e656f33d174︡︡{"once":false,"done":false,"file":{"show":true,"uuid":"31c0952b-e252-49fc-a7fe-3d11a9b74165","filename":"figure.png"}}︡{"done":true}
︠1623ce0b-c0cf-4570-b40d-81f2ff789e64i︠
%md
Embedding the generated PDF plot inside a $\LaTeX$ document.

After running this cell, open `r-plot.tex` to compile it.
︡e78b313e-f41d-4ea0-8277-4a9cff1d89d2︡︡{"done":true,"md":"Embedding the generated PDF plot inside a $\\LaTeX$ document.\n\nAfter running this cell, open `r-plot.tex` to compile it."}
︠bd1e067d-6c6b-498a-bddd-420944fc40eas︠
%sage_salvus.file('r-plot.tex')
\documentclass{article}
\usepackage{graphicx}
\usepackage{grffile}
\title{Example of including an R plot}
\author{SageMathCloud}
\begin{document}
\maketitler
\includegraphics[width=.6\textwidth]{{./figure.pdf}}
\end{document}
︡94377d88-979d-4a91-8c85-473f4cc906d1︡︡{"done":true}
︠7ff22d70-cbda-44a1-9744-f69eefc37119i︠
%md
## Bar Charts

Let's start with a simple bar chart graphing the cars vector:
︡9574903e-d548-4523-9300-b5cc400e87de︡︡{"done":true,"md":"## Bar Charts\n\nLet's start with a simple bar chart graphing the cars vector:"}
︠c7638da3-041c-4c62-9ae1-5f08833dbc23s︠
cars <- c(1, 3, 6, 4, 9)
# Graph cars
barplot(cars)
︡ed05a4be-28d5-4523-bfd3-004194064386︡︡{"stdout":"\n","done":false}︡{"once":false,"done":false,"file":{"show":true,"uuid":"95b9b835-de48-49c4-8efc-f37fa1801941","filename":"/tmp/92125fec-5df9-4c99-92c1-95329765baf8.svg"}}︡{"stdout":"\n","done":false}︡{"done":true}
︠2419546e-9b0f-4d4f-8aa7-f5eb4516abbci︠
%md
Let's now read the auto data from the autos.dat data file, add labels, blue borders around the bars, and density lines:
︡9671c89a-38b9-4637-a25b-17bad82acfe9︡︡{"done":true,"md":"Let's now read the auto data from the autos.dat data file, add labels, blue borders around the bars, and density lines:"}
︠580051bd-edaf-4999-91f6-c458354b0fa8s︠
# Read values from tab-delimited autos.dat
autos_data <- read.table("autos.dat", header=T, sep="\t")

# Graph cars with specified labels for axes.  Use blue
# borders and diagnal lines in bars.
barplot(autos_data$cars, main="Cars", xlab="Days",
   ylab="Total", names.arg=c("Mon","Tue","Wed","Thu","Fri"),
   border="blue", density=c(10,20,30,40,50))
︡1406c94e-7054-443c-8614-aa611b2c4224︡︡{"stdout":"\n","done":false}︡{"once":false,"done":false,"file":{"show":true,"uuid":"6fe82856-9c44-4949-8077-1727ca975224","filename":"/tmp/72c0d8e8-6c06-49fe-a573-113b81a8e460.svg"}}︡{"stdout":"\n","done":false}︡{"stdout":"Error in barplot.default(autos_data$cars, main = \"Cars\", xlab = \"Days\",  : \n  incorrect number of names\nIn addition: Warning messages:\n1: closing unused connection 4 (/projects/1041134f-47fb-4a2c-8158-7ba2729f4bc0/.sage/temp/compute3-us/3359/interface/tmp3374) \n2: closing unused connection 3 (/projects/1041134f-47fb-4a2c-8158-7ba2729f4bc0/.sage/temp/compute3-us/3359/interface/tmp3374) ","done":false}︡{"done":true}
︠245ee84a-7805-446f-ba0b-04f218b519b5i︠
%md
Now let's graph the total number of autos per day using some color and show a legend:
︡18bbfde0-e606-4d0c-a94b-53701bc0ebad︡︡{"done":true,"md":"Now let's graph the total number of autos per day using some color and show a legend:"}
︠2c7a50e2-487c-4154-a6b6-9870efe1770ds︠
# Read values from tab-delimited autos.dat
autos_data <- read.table("autos.dat", header=T, sep="\t")

# Graph autos with adjacent bars using rainbow colors
barplot(as.matrix(autos_data), main="Autos", ylab= "Total", beside=TRUE, col=rainbow(5))

# Place the legend at the top-left corner with no frame
# using rainbow colors
legend("topleft", c("Mon","Tue","Wed","Thu","Fri"), cex=0.6, bty="n", fill=rainbow(5));
︡9625f5c3-5f1f-4309-b324-8320a1e98b1b︡︡{"stdout":"\n","done":false}︡{"once":false,"done":false,"file":{"show":true,"uuid":"dfea3e2b-60dd-4e0d-9661-1032280af7a8","filename":"/tmp/295dea6f-c625-4902-b6c4-38935e5dfcfc.svg"}}︡{"stdout":"\n","done":false}︡{"done":true}
︠ff58be13-81b6-45d4-85e0-3fcbf2345a29i︠
%md

Let's graph the total number of autos per day using a stacked bar chart and place the legend outside of the plot area:
︡2b376074-a30b-4a9d-a5ad-0d51e0582e20︡︡{"done":true,"md":"\nLet's graph the total number of autos per day using a stacked bar chart and place the legend outside of the plot area:"}
︠b234e867-1fe9-4754-a5ef-086e4248963cs︠
# Read values from tab-delimited autos.dat
autos_data <- read.table("autos.dat", header=T, sep="\t")

# Expand right side of clipping rect to make room for the legend
par(xpd=T, mar=par()$mar+c(0,0,0,4))

# Graph autos (transposing the matrix) using heat colors,
# put 10% of the space between each bar, and make labels
# smaller with horizontal y-axis labels
barplot(t(autos_data), main="Autos", ylab="Total",
   col=heat.colors(3), space=0.1, cex.axis=0.8, las=1,
   names.arg=c("Mon","Tue","Wed","Thu","Fri"), cex=0.8)

# Place the legend at (6,30) using heat colors
legend(6, 30, names(autos_data), cex=0.8, fill=heat.colors(3));

# Restore default clipping rect
par(mar=c(5, 4, 4, 2) + 0.1)
︡2c41e648-a641-448b-a311-8259f2e150ce︡︡{"stdout":"\n","done":false}︡{"once":false,"done":false,"file":{"show":true,"uuid":"cf81fce0-b7f9-43da-86d6-3a353ab67d2b","filename":"/tmp/c0402705-b645-4bb5-96e5-9482583b2e7f.svg"}}︡{"stdout":"\n","done":false}︡{"stdout":"Error in barplot.default(t(autos_data), main = \"Autos\", ylab = \"Total\",  : \n  incorrect number of names","done":false}︡{"done":true}
︠7f6a76cb-0dc9-4a80-97c3-0d4efe678b4di︠
%md

# Histograms

Let's start with a simple histogram graphing the distribution of the suvs vector:
︡57d7595e-30f2-47c1-9b1b-dcf30f554c2d︡︡{"done":true,"md":"\n# Histograms\n\nLet's start with a simple histogram graphing the distribution of the suvs vector:"}
︠30b2f1be-ccf6-4c3a-b54a-c3b0a1dd5794s︠
# Define the suvs vector with 5 values
suvs <- c(4,4,6,6,16)

# Create a histogram for suvs
hist(suvs)
︡10b9f0d6-e6c9-407e-b3a5-4519260e67cd︡︡{"stdout":"\n","done":false}︡{"once":false,"done":false,"file":{"show":true,"uuid":"45200882-336e-4ba5-ab78-0be170a85924","filename":"/tmp/141d4360-989b-49fa-99c4-c62db4b1bc36.svg"}}︡{"stdout":"\n","done":false}︡{"done":true}
︠89467e86-be24-451e-9c2c-8df09ab1b067i︠
%md
Let's now read the auto data from the autos.dat data file and plot a histogram of the combined car, truck, and suv data in color.
︡99dbedb5-2b92-4d53-93ee-e737ad14524a︡︡{"done":true,"md":"Let's now read the auto data from the autos.dat data file and plot a histogram of the combined car, truck, and suv data in color."}
︠5920e7d1-83b6-496c-a4c5-a1f898d4da12s︠
# Read values from tab-delimited autos.dat
autos_data <- read.table("autos.dat", header=T, sep="\t")

# Concatenate the three vectors
autos <- c(autos_data$cars, autos_data$trucks, autos_data$suvs)

# Create a histogram for autos in light blue with the y axis
# ranging from 0-10
hist(autos, col="lightblue", ylim=c(0,10))
︡a8b78e2e-5c91-4c37-9f4a-8e8e1ec07b60︡︡{"stdout":"\n","done":false}︡{"once":false,"done":false,"file":{"show":true,"uuid":"48f91371-2c4f-409f-bea8-49ece0a2e489","filename":"/tmp/f75edca0-d9fa-4b44-8712-b4f189d29c8a.svg"}}︡{"stdout":"\n","done":false}︡{"done":true}
︠9f494bac-3be1-4dec-970c-f0bcdb118f79i︠
%md
Now change the breaks so none of the values are grouped together and flip the y-axis labels horizontally.
︡8da10571-b921-4e5c-8a21-43ce73f654f9︡︡{"done":true,"md":"Now change the breaks so none of the values are grouped together and flip the y-axis labels horizontally."}
︠4670e530-2e68-4dd4-a5b3-511e6187eee4s︠
# Read values from tab-delimited autos.dat
autos_data <- read.table("autos.dat", header=T, sep="\t")

# Concatenate the three vectors
autos <- c(autos_data$cars, autos_data$trucks, autos_data$suvs)

# Compute the largest y value used in the autos
max_num <- max(autos)

# Create a histogram for autos with fire colors, set breaks
# so each number is in its own group, make x axis range from
# 0-max_num, disable right-closing of cell intervals, set
# heading, and make y-axis labels horizontal
hist(autos, col=heat.colors(max_num), breaks=max_num,
   xlim=c(0,max_num), right=F, main="Autos Histogram", las=1)
︡3b1ab64f-a24d-46e9-bf81-662276cb91a6︡︡{"stdout":"\n","done":false}︡{"once":false,"done":false,"file":{"show":true,"uuid":"bd746c46-d0da-419d-9ecd-e429050beaef","filename":"/tmp/55f3ebb3-f8c8-4be1-8a12-0dba392b2b3c.svg"}}︡{"stdout":"\n","done":false}︡{"done":true}
︠24e5c86f-c2f9-4c61-a7f4-17d941807148i︠
%md
Now let's create uneven breaks and graph the probability density.
︡b3fa531d-c334-4cf9-a837-18a5d72d72b7︡︡{"done":true,"md":"Now let's create uneven breaks and graph the probability density."}
︠279a7afa-fd22-4e27-ab85-3b002759acb7s︠
# Read values from tab-delimited autos.dat
autos_data <- read.table("autos.dat", header=T, sep="\t")

# Concatenate the three vectors
autos <- c(autos_data$cars, autos_data$trucks,
   autos_data$suvs)

# Compute the largest y value used in the autos
max_num <- max(autos)

# Create uneven breaks
brk <- c(0,3,4,5,6,10,16)

# Create a histogram for autos with fire colors, set uneven
# breaks, make x axis range from 0-max_num, disable right-
# closing of cell intervals, set heading, make y-axis labels
# horizontal, make axis labels smaller, make areas of each
# column proportional to the count
hist(autos, col=heat.colors(length(brk)), breaks=brk,
   xlim=c(0,max_num), right=F, main="Probability Density",
   las=1, cex.axis=0.8, freq=F)
︡6220928e-18f0-4b77-98c1-c84d4c487915︡︡{"stdout":"\n","done":false}︡{"once":false,"done":false,"file":{"show":true,"uuid":"e87d551f-ba19-4002-ac56-408757eebfe5","filename":"/tmp/6de93664-4fec-4ca8-9634-c754be062572.svg"}}︡{"stdout":"\n","done":false}︡{"done":true}
︠86eeead4-5d8c-4557-8fc0-2bd3a6ec4b0ci︠
%md

In this example we'll plot the distribution of 1000 random values that have the log-normal distribution.
︡f4ccf090-f51d-4292-8a9a-1502f55fffe6︡︡{"done":true,"md":"\nIn this example we'll plot the distribution of 1000 random values that have the log-normal distribution."}
︠08b6269f-a979-4b8a-8559-ef91153d1c00s︠
# Get a random log-normal distribution
r <- rlnorm(1000)

hist(r)
︡94cee6a4-bf96-42c1-b2aa-9206fbc1405a︡︡{"stdout":"\n","done":false}︡{"once":false,"done":false,"file":{"show":true,"uuid":"31b5e8dc-d34d-443b-ab5b-d1512f791a27","filename":"/tmp/43ba428e-b708-411d-a12f-f887f1131b22.svg"}}︡{"stdout":"\n","done":false}︡{"done":true}
︠b0749977-2085-4355-8021-3c0e1d835b5bi︠
%md
Since log-normal distributions normally look better with log-log axes, let's use the plot function with points to show the distribution.
︡0237a541-2674-40e4-afa5-7c449a4c3cf7︡︡{"done":true,"md":"Since log-normal distributions normally look better with log-log axes, let's use the plot function with points to show the distribution."}
︠aa707814-e098-4d37-8dfd-7a80c4f56136s︠
# Get a random log-normal distribution
r <- rlnorm(1000)

# Get the distribution without plotting it using tighter breaks
h <- hist(r, plot=F, breaks=c(seq(0,max(r)+1, .1)))

# Plot the distribution using log scale on both axes, and use
# blue points
plot(h$counts, log="xy", pch=20, col="blue",
	main="Log-normal distribution",
	xlab="Value", ylab="Frequency")
︡e2c765f5-8185-43e0-8d8c-c8cf31a640f1︡︡{"stdout":"\n","done":false}︡{"once":false,"done":false,"file":{"show":true,"uuid":"54dfe5d0-d70c-42a7-bcc1-1ec168243f1c","filename":"/tmp/cc1a4059-7666-424d-a400-7d2e5cb83108.svg"}}︡{"stdout":"\n","done":false}︡{"stdout":"Warning message:\nIn xy.coords(x, y, xlabel, ylabel, log) :\n  118 y values <= 0 omitted from logarithmic plot","done":false}︡{"done":true}
︠5257d368-01b4-4cbf-b44a-dbc3f280cdcdi︠


%md
# Pie Charts

Let's start with a simple pie chart graphing the cars vector:
︡c73432d6-0168-4c98-a233-74c1e04b355c︡︡{"done":true,"md":"# Pie Charts\n\nLet's start with a simple pie chart graphing the cars vector:"}
︠7e1177d7-03d4-4d59-9257-4566da0af6d8s︠


# Define cars vector with 5 values
cars <- c(1, 3, 6, 4, 9)

# Create a pie chart for cars
pie(cars)
︡8fb5b951-3c2b-4824-89b7-f98e88a9fe5c︡︡{"stdout":"\n","done":false}︡{"once":false,"done":false,"file":{"show":true,"uuid":"c58bd3b1-ea3a-468c-97de-127bfbbf2810","filename":"/tmp/d6712449-00fd-43c6-9cab-22958674b6b1.svg"}}︡{"stdout":"\n","done":false}︡{"done":true}
︠836d4b7c-4c34-4b49-93d8-38b09a385b46i︠
%md
Now let's add a heading, change the colors, and define our own labels:
︡fff2e47a-b86e-4453-aee3-5a380821e268︡︡{"done":true,"md":"Now let's add a heading, change the colors, and define our own labels:"}
︠5a94c4a4-3735-4ee0-8f43-80f1079185f2s︠

# Define cars vector with 5 values
cars <- c(1, 3, 6, 4, 9)

# Create a pie chart with defined heading and
# custom colors and labels
pie(cars, main="Cars", col=rainbow(length(cars)),
   labels=c("Mon","Tue","Wed","Thu","Fri"))
︡8a3d3d1d-4420-4746-8ecd-81806f764dfc︡︡{"stdout":"\n","done":false}︡{"once":false,"done":false,"file":{"show":true,"uuid":"52207b0b-274c-4700-a04d-0cc279d2a31c","filename":"/tmp/d2609000-05e2-4bb6-96ea-9bf543632417.svg"}}︡{"stdout":"\n","done":false}︡{"done":true}
︠d65d6178-c6c7-40bd-9a2c-806519e73dddi︠
%md
Now let's change the colors, label using percentages, and create a legend:
︡e870ac21-da0c-4fb6-b9d4-c3104e0758f4︡︡{"done":true,"md":"Now let's change the colors, label using percentages, and create a legend:"}
︠3facf396-0cee-4b83-a873-33fe6df40a2bs︠
# Define cars vector with 5 values
cars <- c(1, 3, 6, 4, 9)

# Define some colors ideal for black & white print
colors <- c("white","grey70","grey90","grey50","black")

# Calculate the percentage for each day, rounded to one
# decimal place
car_labels <- round(cars/sum(cars) * 100, 1)

# Concatenate a '%' char after each value
car_labels <- paste(car_labels, "%", sep="")

# Create a pie chart with defined heading and custom colors
# and labels
pie(cars, main="Cars", col=colors, labels=car_labels, cex=0.8)

# Create a legend at the right
legend(1.5, 0.5, c("Mon","Tue","Wed","Thu","Fri"), cex=0.8, fill=colors)
︡0dc98a50-020c-4eb4-bb18-82e78b32f46a︡︡{"stdout":"\n","done":false}︡{"once":false,"done":false,"file":{"show":true,"uuid":"d59f33b3-3674-47ac-8885-2ee88cbf0677","filename":"/tmp/e9c388f7-7ed9-4ced-b265-4af239e2fe83.svg"}}︡{"stdout":"\n","done":false}︡{"done":true}
︠62267678-cf6c-4001-a8ac-816b79dd1b2fi︠
%md
# Dotcharts

Let's start with a simple dotchart graphing the autos data:
︡b0f1388d-6738-46dc-bf36-83230e2f8c70︡︡{"done":true,"md":"# Dotcharts\n\nLet's start with a simple dotchart graphing the autos data:"}
︠44aa7a26-7e11-4989-bcdc-3e7b6f3394a3s︠
# Read values from tab-delimited autos.dat
autos_data <- read.table("autos.dat", header=T, sep="\t")

# Create a dotchart for autos
dotchart(t(autos_data))
︡74b11235-59db-4b4f-9fb0-65d3d7016097︡︡{"stdout":"\n","done":false}︡{"once":false,"done":false,"file":{"show":true,"uuid":"55ddd268-6b7e-4d6c-9374-c374cee21724","filename":"/tmp/47d77680-4942-4635-b7a1-6245b566e188.svg"}}︡{"stdout":"\n","done":false}︡{"done":true}
︠9d6d8875-a299-4033-8ee6-de5d9e3cb722i︠
%md
Let's make the dotchart a little more colorful:
︡26e07a9d-f67b-4c16-97ad-c2ecec945343︡︡{"done":true,"md":"Let's make the dotchart a little more colorful:"}
︠5ebbca0e-f6b0-48b5-af1b-d5efcabe1a1fs︠
# Read values from tab-delimited autos.dat
autos_data <- read.table("autos.dat", header=T, sep="\t")

# Create a colored dotchart for autos with smaller labels
dotchart(t(autos_data), color=c("red","blue","darkgreen"),
   main="Dotchart for Autos", cex=0.8)
︡4a469770-af89-4270-ab51-75ac33a70d0b︡︡{"stdout":"\n","done":false}︡{"once":false,"done":false,"file":{"show":true,"uuid":"17719585-b37f-4f8b-94be-bfa40ca08d1f","filename":"/tmp/af8d294f-86ac-4202-91a9-6cab25f0a49f.svg"}}︡{"stdout":"\n","done":false}︡{"done":true}
︠bd0c1da3-be27-4abb-8471-32a77566aac8i︠
%md

# Misc

This example shows all 25 symbols that you can use to produce points in your graphs:
︡68ca930e-0bd1-41d6-b056-c3cb444ce6c8︡︡{"done":true,"md":"\n# Misc\n\nThis example shows all 25 symbols that you can use to produce points in your graphs:"}
︠68244c12-401a-4f91-9a97-8442a29a1315s︠
# Make an empty chart
plot(1, 1, xlim=c(1,5.5), ylim=c(0,7), type="n", ann=FALSE)

# Plot digits 0-4 with increasing size and color
text(1:5, rep(6,5), labels=c(0:4), cex=1:5, col=1:5)

# Plot symbols 0-4 with increasing size and color
points(1:5, rep(5,5), cex=1:5, col=1:5, pch=0:4)
text((1:5)+0.4, rep(5,5), cex=0.6, (0:4))

# Plot symbols 5-9 with labels
points(1:5, rep(4,5), cex=2, pch=(5:9))
text((1:5)+0.4, rep(4,5), cex=0.6, (5:9))

# Plot symbols 10-14 with labels
points(1:5, rep(3,5), cex=2, pch=(10:14))
text((1:5)+0.4, rep(3,5), cex=0.6, (10:14))

# Plot symbols 15-19 with labels
points(1:5, rep(2,5), cex=2, pch=(15:19))
text((1:5)+0.4, rep(2,5), cex=0.6, (15:19))

# Plot symbols 20-25 with labels
points((1:6)*0.8+0.2, rep(1,6), cex=2, pch=(20:25))
text((1:6)*0.8+0.5, rep(1,6), cex=0.6, (20:25))
︡3ce9e17f-e175-47b5-a5e0-a9c07806a304︡︡{"stdout":"\n","done":false}︡{"once":false,"done":false,"file":{"show":true,"uuid":"bcfb2c27-2271-43e8-b5a4-0a2e3f9c7a20","filename":"/tmp/57e09bed-ec0d-46da-b5e1-85583b22cd26.svg"}}︡{"stdout":"\n","done":false}︡{"done":true}
︠f08984b2-29b9-4235-ac13-b254fa10d8f1i︠
%md
# Bonus -- you can also use ggplot2
︡ce1bd901-7c68-4969-9492-bee40ef025f6︡︡{"done":true,"md":"# Bonus -- you can also use ggplot2"}
︠d581385f-4c83-46cc-8145-8e10aaeabda1s︠
require(ggplot2)

qplot(age, circumference, data = Orange, geom = c('point', "line"), colour = Tree,
  main = "How does orange tree circumference vary with age?")
︡cf649cbe-20fc-4928-87ba-ac94a35e50f6︡︡{"stdout":"\n","done":false}︡{"once":false,"done":false,"file":{"show":true,"uuid":"50c8995e-bc6b-435d-b3d7-b47f8650b4b6","filename":"/tmp/83786206-b887-4c47-82eb-b0b7e6be7cf6.svg"}}︡{"stdout":"\n","done":false}︡{"stdout":"Loading required package: ggplot2","done":false}︡{"done":true}
︠26cc2b8d-00c2-4a45-93b5-4ae032d7fa4es︠
︡9c21cc47-973b-449f-8356-96afca639406︡︡{"done":true}
︠04530020-cb0a-47a8-98f2-81988f4d4004s︠

︡a1539fd0-917d-4dc4-b421-e8aa1f357c4f︡︡{"done":true}









