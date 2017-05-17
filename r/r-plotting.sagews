︠bf8be137-6f06-4a1a-8bde-29db2f3b699ci︠
%html
<h1>Graphics using R in the Sagemath Cloud</h1>

This is a Sagemath Cloud worksheet version of Frank McCown's tutorial from <a target="_blank" href="http://www.harding.edu/fmccown/r/">http://www.harding.edu/fmccown/r/</a>.

First, we put the worksheet into R mode (otherwise you would have to type %r at the beginning of each cell):
︡b681936d-d97e-4e2d-8989-45f0ee24bdeb︡{"done":true,"html":"<h1>Graphics using R in the Sagemath Cloud</h1>\n\nThis is a Sagemath Cloud worksheet version of Frank McCown's tutorial from <a target=\"_blank\" href=\"http://www.harding.edu/fmccown/r/\">http://www.harding.edu/fmccown/r/</a>.\n\nFirst, we put the worksheet into R mode (otherwise you would have to type %r at the beginning of each cell):"}
︠52916e12-5c4c-4f11-aa93-8014696978b6as︠
%auto
%default_mode r
︡f4290d85-5461-4184-9615-78faab86491d︡{"done":true}︡
︠39db6a73-5d9c-4399-9bad-1c053b8c433ci︠
%md

## Line Charts
First we'll produce a very simple graph using the values in the car vector:
︡61cfa1bc-6725-466a-a783-c4e13fcec634︡{"done":true,"md":"\n## Line Charts\nFirst we'll produce a very simple graph using the values in the car vector:"}
︠a6d0bfa4-f12f-4d6a-849e-4a4c3b959bces︠
# Define the cars vector with 5 values
cars <- c(1, 3, 6, 4, 9)
# Graph the cars vector with all defaults
plot(cars)
︡88882134-77b0-4e2d-9dd4-0efc9e182809︡{"file":{"filename":"/tmp/tmpifIrN_.png","show":false,"text":null,"uuid":"a6308670-7b6e-4d09-897e-2ab28c0f472c"},"once":false}︡{"html":"<img src=\"/blobs//tmp/tmpifIrN_.png?uuid=a6308670-7b6e-4d09-897e-2ab28c0f472c\" smc-image-scaling=\"0.5\" />"}︡{"done":true}︡
︠c1cf70ee-1440-46c7-8842-787a4b8ef2a6i︠
%md
Let's add a title, a line to connect the points, and some color:
︡cd48ca58-8e57-4194-90d1-edb2ba42059e︡{"done":true,"md":"Let's add a title, a line to connect the points, and some color:"}
︠abb3782a-bd6f-4388-b5fe-75f7ad8bd793s︠
# Graph cars using blue points overlayed by a line
plot(cars, type="o", col="blue")

# Create a title with a red, bold/italic font
title(main="Autos", col.main="red", font.main=4)
︡398f8b6a-868d-4f66-8328-7ed6aeb46684︡{"file":{"filename":"/tmp/tmp8j7Oue.png","show":false,"text":null,"uuid":"0812993c-ddf2-47af-8c42-76f766aa567f"},"once":false}︡{"html":"<img src=\"/blobs//tmp/tmp8j7Oue.png?uuid=0812993c-ddf2-47af-8c42-76f766aa567f\" smc-image-scaling=\"0.5\" />"}︡{"done":true}︡
︠69f3e8ee-7d0b-4317-b069-8c8ea4366defi︠
%md
Now let's add a red line for trucks and specify the y-axis range directly so it will be large enough to fit the truck data:
︡9b990857-614a-47bc-929b-be321f28c3ac︡{"done":true,"md":"Now let's add a red line for trucks and specify the y-axis range directly so it will be large enough to fit the truck data:"}
︠0d958bec-d38b-4cda-b786-1cedf536d74fs︠
trucks <- c(2, 5, 4, 5, 12)
# Graph cars using a y axis that ranges from 0 to 12
plot(cars, type="o", col="blue", ylim=c(0,12))
# Graph trucks with red dashed line and square points
lines(trucks, type="o", pch=22, lty=2, col="red")
# Create a title with a red, bold/italic font
title(main="Autos", col.main="red", font.main=4)
︡060dab8d-d617-4b6e-936d-69b4b743665d︡{"file":{"filename":"/tmp/tmpGtQChF.png","show":false,"text":null,"uuid":"77d7f6b6-f08a-4a59-b587-dbf9233138fa"},"once":false}︡{"html":"<img src=\"/blobs//tmp/tmpGtQChF.png?uuid=77d7f6b6-f08a-4a59-b587-dbf9233138fa\" smc-image-scaling=\"0.5\" />"}︡{"done":true}︡
︠337bc274-2f27-4ca6-aaf7-3090ec48b5cbi︠
%md
Next let's change the axes labels to match our data and add a legend. We'll also compute the $y$-axis values using the max function so any changes to our data will be automatically reflected in our graph.
︡935218b3-5823-4564-a89f-63a93d9c5db1︡{"done":true,"md":"Next let's change the axes labels to match our data and add a legend. We'll also compute the $y$-axis values using the max function so any changes to our data will be automatically reflected in our graph."}
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
︡c28ae30b-a938-47ca-aba5-a8c8e36db226︡{"file":{"filename":"/tmp/tmpKT1L3N.png","show":false,"text":null,"uuid":"34f9d847-5c69-43be-99ad-5f53b9d9640b"},"once":false}︡{"html":"<img src=\"/blobs//tmp/tmpKT1L3N.png?uuid=34f9d847-5c69-43be-99ad-5f53b9d9640b\" smc-image-scaling=\"0.5\" />"}︡{"done":true}︡
︠d3d5af40-30b8-4d57-9e71-4c61b2e7ccf3i︠
%md
Now let's read the graph data directly from a tab-delimited file. The file contains an additional set of values for SUVs.
We'll create the file using the `%sage_saluvs.file cell decorator:
︡93304d5c-e312-4e61-aef0-a7bbf85962c9︡{"done":true,"md":"Now let's read the graph data directly from a tab-delimited file. The file contains an additional set of values for SUVs.\nWe'll create the file using the `%sage_saluvs.file cell decorator:"}
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
︡2cda67f6-3825-4300-a04b-a046142221ff︡{"done":true}︡
︠8681a917-4cc5-46c9-a2bb-1661c16d8509i︠
%md
We'll also use a vector for storing the colors to be used in our graph so
if we want to change the colors later on, there's only one place in the file that needs to be modified.
Finally we'll send the figure directly to a PNG file.  (You can also instead just right click on a figure
embedded in the worksheet and click save as if you want.)
︡78392948-6d11-49b1-be76-65d429f4f1a9︡{"done":true,"md":"We'll also use a vector for storing the colors to be used in our graph so\nif we want to change the colors later on, there's only one place in the file that needs to be modified.\nFinally we'll send the figure directly to a PNG file.  (You can also instead just right click on a figure\nembedded in the worksheet and click save as if you want.)"}
︠bb3e376d-a028-4c41-a7c9-72682cb48fcas︠
# Read car and truck values from tab-delimited autos.dat
autos_data <- read.table("autos.dat", header=T, sep="\t")
︡ffb03827-476d-4b90-9c5a-26cdcb7bddf0︡{"done":true}︡
︠81122af4-1653-4acd-b3f4-4f7345a0bbdes︠

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
︡65a0ab67-60b0-4108-bf46-e6386f2cd5d0︡{"html":"<strong>png:</strong> 2"}︡{"done":true}︡
︠7a471525-0410-43fc-b719-fde165f9c968s︠
%sage salvus.file('figure.png')
︡ec517ba0-412e-49ea-b6ec-2de340909a3b︡{"file":{"filename":"figure.png","show":true,"text":null,"uuid":"054ffeea-2e42-4ed0-a3c6-50e77ccad922"},"once":false}︡{"done":true}︡
︠bf1a9854-e761-41c8-9715-3dc551f5a7a4i︠
%md
In this next example, we'll save the file to a PDF and chop off extra white space around the graph; this is useful when wanting to use figures in LaTeX (and cloud.sagemath has a very nice integrated latex development environment!).
We'll also increase the line widths, shrink the axis font size, and tilt the x-axis labels by 45 degrees.
︡01e6bd72-8c70-461b-ab53-60f2f3987b6c︡{"done":true,"md":"In this next example, we'll save the file to a PDF and chop off extra white space around the graph; this is useful when wanting to use figures in LaTeX (and cloud.sagemath has a very nice integrated latex development environment!).\nWe'll also increase the line widths, shrink the axis font size, and tilt the x-axis labels by 45 degrees."}
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
︡9b9dbcfb-99ae-4d2b-979c-000619551acc︡{"html":"<strong>png:</strong> 2"}︡{"done":true}︡
︠ff959c30-69f8-460e-a9ab-201fb7567f5ei︠
%md
We can directly look at the figure in the worksheet (you can also navigate to the pdf file andclick to view it).
︡b3254508-42df-450f-9441-9d5d6ae428e0︡{"done":true,"md":"We can directly look at the figure in the worksheet (you can also navigate to the pdf file andclick to view it)."}
︠e44d23d8-4fe9-4707-a6d6-8d087554b168s︠
%sage salvus.file('figure.png')
︡3dcf8042-7b3c-4421-b331-15e434674776︡{"file":{"filename":"figure.png","show":true,"text":null,"uuid":"054ffeea-2e42-4ed0-a3c6-50e77ccad922"},"once":false}︡{"done":true}︡
︠1623ce0b-c0cf-4570-b40d-81f2ff789e64i︠
%md
Embedding the generated PDF plot inside a $\LaTeX$ document.

After running this cell, open `r-plot.tex` to compile it.
︡e78b313e-f41d-4ea0-8277-4a9cff1d89d2︡{"done":true,"md":"Embedding the generated PDF plot inside a $\\LaTeX$ document.\n\nAfter running this cell, open `r-plot.tex` to compile it."}
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
︡f0e05d8a-7cdf-4af2-9561-9f07013f9942︡{"done":true}︡
︠7ff22d70-cbda-44a1-9744-f69eefc37119i︠
%md
## Bar Charts

Let's start with a simple bar chart graphing the cars vector:
︡9574903e-d548-4523-9300-b5cc400e87de︡{"done":true,"md":"## Bar Charts\n\nLet's start with a simple bar chart graphing the cars vector:"}
︠c7638da3-041c-4c62-9ae1-5f08833dbc23s︠
cars <- c(1, 3, 6, 4, 9)
# Graph cars
barplot(cars)
︡388aa691-bb3c-43a3-b2d3-c893448dc90a︡{"file":{"filename":"/tmp/tmpJdfFih.png","show":false,"text":null,"uuid":"8d174891-c854-490c-baf7-a04ac47fd430"},"once":false}︡{"html":"<img src=\"/blobs//tmp/tmpJdfFih.png?uuid=8d174891-c854-490c-baf7-a04ac47fd430\" smc-image-scaling=\"0.5\" />"}︡{"done":true}︡
︠2419546e-9b0f-4d4f-8aa7-f5eb4516abbci︠
%md
Let's now read the auto data from the autos.dat data file, add labels, blue borders around the bars, and density lines:
︡9671c89a-38b9-4637-a25b-17bad82acfe9︡{"done":true,"md":"Let's now read the auto data from the autos.dat data file, add labels, blue borders around the bars, and density lines:"}
︠580051bd-edaf-4999-91f6-c458354b0fa8s︠
# Read values from tab-delimited autos.dat
autos_data <- read.table("autos.dat", header=T, sep="\t")

# Graph cars with specified labels for axes.  Use blue
# borders and diagnal lines in bars.
barplot(autos_data$cars, main="Cars", xlab="Days",
   ylab="Total", names.arg=c("Mon","Tue","Wed","Thu","Fri","Sat","Sun"),
   border="blue", density=c(10,20,30,40,50))
︡1b481f69-fa7a-48eb-bf69-983d6934377c︡{"file":{"filename":"/tmp/tmpIQQ6M7.png","show":false,"text":null,"uuid":"729f10a2-734f-4fb2-8753-a2797f044d4b"},"once":false}︡{"html":"<img src=\"/blobs//tmp/tmpIQQ6M7.png?uuid=729f10a2-734f-4fb2-8753-a2797f044d4b\" smc-image-scaling=\"0.5\" />"}︡{"done":true}︡
︠245ee84a-7805-446f-ba0b-04f218b519b5i︠
%md
Now let's graph the total number of autos per day using some color and show a legend:
︡18bbfde0-e606-4d0c-a94b-53701bc0ebad︡{"done":true,"md":"Now let's graph the total number of autos per day using some color and show a legend:"}
︠2c7a50e2-487c-4154-a6b6-9870efe1770ds︠
# Read values from tab-delimited autos.dat
autos_data <- read.table("autos.dat", header=T, sep="\t")

# Graph autos with adjacent bars using rainbow colors
barplot(as.matrix(autos_data), main="Autos", ylab= "Total", beside=TRUE, col=rainbow(5))

# Place the legend at the top-left corner with no frame
# using rainbow colors
legend("topleft", c("Mon","Tue","Wed","Thu","Fri"), cex=0.6, bty="n", fill=rainbow(5));
︡6abb3952-a9e6-4135-b929-9d9f5a3a8086︡{"file":{"filename":"/tmp/tmppPsVOk.png","show":false,"text":null,"uuid":"b82ec0c3-1c39-472d-89e0-cfb6d56764c6"},"once":false}︡{"html":"<img src=\"/blobs//tmp/tmppPsVOk.png?uuid=b82ec0c3-1c39-472d-89e0-cfb6d56764c6\" smc-image-scaling=\"0.5\" />"}︡{"done":true}︡
︠ff58be13-81b6-45d4-85e0-3fcbf2345a29i︠
%md

Let's graph the total number of autos per day using a stacked bar chart and place the legend outside of the plot area:
︡2b376074-a30b-4a9d-a5ad-0d51e0582e20︡{"done":true,"md":"\nLet's graph the total number of autos per day using a stacked bar chart and place the legend outside of the plot area:"}
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
   names.arg=c("Mon","Tue","Wed","Thu","Fri","Sat","Sun"), cex=0.8)

# Place the legend at (6,30) using heat colors
legend(6, 30, names(autos_data), cex=0.8, fill=heat.colors(3));

# Restore default clipping rect
par(mar=c(5, 4, 4, 2) + 0.1)
︡ebd965b0-5134-43be-99d8-93e1c362065f︡{"file":{"filename":"/tmp/tmp17jEDE.png","show":false,"text":null,"uuid":"7958704c-5902-4e3e-9d33-b85eb1fa9b57"},"once":false}︡{"html":"<img src=\"/blobs//tmp/tmp17jEDE.png?uuid=7958704c-5902-4e3e-9d33-b85eb1fa9b57\" smc-image-scaling=\"0.5\" />"}︡{"done":true}︡
︠7f6a76cb-0dc9-4a80-97c3-0d4efe678b4di︠
%md

# Histograms

Let's start with a simple histogram graphing the distribution of the suvs vector:
︡57d7595e-30f2-47c1-9b1b-dcf30f554c2d︡{"done":true,"md":"\n# Histograms\n\nLet's start with a simple histogram graphing the distribution of the suvs vector:"}
︠30b2f1be-ccf6-4c3a-b54a-c3b0a1dd5794s︠
# Define the suvs vector with 5 values
suvs <- c(4,4,6,6,16)

# Create a histogram for suvs
hist(suvs)
︡88fdd3b9-69b9-4501-bea7-3aa090954bf1︡{"file":{"filename":"/tmp/tmpUajvIR.png","show":false,"text":null,"uuid":"e444e720-2d99-4a1b-b21f-606620ac862d"},"once":false}︡{"html":"<img src=\"/blobs//tmp/tmpUajvIR.png?uuid=e444e720-2d99-4a1b-b21f-606620ac862d\" smc-image-scaling=\"0.5\" />"}︡{"done":true}︡
︠89467e86-be24-451e-9c2c-8df09ab1b067i︠
%md
Let's now read the auto data from the autos.dat data file and plot a histogram of the combined car, truck, and suv data in color.
︡99dbedb5-2b92-4d53-93ee-e737ad14524a︡{"done":true,"md":"Let's now read the auto data from the autos.dat data file and plot a histogram of the combined car, truck, and suv data in color."}
︠5920e7d1-83b6-496c-a4c5-a1f898d4da12s︠
# Read values from tab-delimited autos.dat
autos_data <- read.table("autos.dat", header=T, sep="\t")

# Concatenate the three vectors
autos <- c(autos_data$cars, autos_data$trucks, autos_data$suvs)

# Create a histogram for autos in light blue with the y axis
# ranging from 0-10
hist(autos, col="lightblue", ylim=c(0,10))
︡c1b53c49-9a65-4f4c-8152-17addff3237e︡{"file":{"filename":"/tmp/tmp7pVkkV.png","show":false,"text":null,"uuid":"71cd0975-5e3d-48f9-80d8-18a29828bc85"},"once":false}︡{"html":"<img src=\"/blobs//tmp/tmp7pVkkV.png?uuid=71cd0975-5e3d-48f9-80d8-18a29828bc85\" smc-image-scaling=\"0.5\" />"}︡{"done":true}︡
︠9f494bac-3be1-4dec-970c-f0bcdb118f79i︠
%md
Now change the breaks so none of the values are grouped together and flip the y-axis labels horizontally.
︡8da10571-b921-4e5c-8a21-43ce73f654f9︡{"done":true,"md":"Now change the breaks so none of the values are grouped together and flip the y-axis labels horizontally."}
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
︡1f00faeb-477e-48fb-b0bc-01e8fe626df4︡{"file":{"filename":"/tmp/tmpU5xQHI.png","show":false,"text":null,"uuid":"e1e61f2b-0867-4d0d-b4c0-e7a50254274f"},"once":false}︡{"html":"<img src=\"/blobs//tmp/tmpU5xQHI.png?uuid=e1e61f2b-0867-4d0d-b4c0-e7a50254274f\" smc-image-scaling=\"0.5\" />"}︡{"done":true}︡
︠24e5c86f-c2f9-4c61-a7f4-17d941807148i︠
%md
Now let's create uneven breaks and graph the probability density.
︡b3fa531d-c334-4cf9-a837-18a5d72d72b7︡{"done":true,"md":"Now let's create uneven breaks and graph the probability density."}
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
︡a84845e2-2c1d-4afc-9121-54f17e7f6d66︡{"file":{"filename":"/tmp/tmp1HosB7.png","show":false,"text":null,"uuid":"a13031c8-546c-45f3-8e8b-10ae98b7f64b"},"once":false}︡{"html":"<img src=\"/blobs//tmp/tmp1HosB7.png?uuid=a13031c8-546c-45f3-8e8b-10ae98b7f64b\" smc-image-scaling=\"0.5\" />"}︡{"done":true}︡
︠86eeead4-5d8c-4557-8fc0-2bd3a6ec4b0ci︠
%md

In this example we'll plot the distribution of 1000 random values that have the log-normal distribution.
︡f4ccf090-f51d-4292-8a9a-1502f55fffe6︡{"done":true,"md":"\nIn this example we'll plot the distribution of 1000 random values that have the log-normal distribution."}
︠08b6269f-a979-4b8a-8559-ef91153d1c00s︠
# Get a random log-normal distribution
r <- rlnorm(1000)

hist(r)
︡aa6ec94d-2b9c-4d83-855a-3d1c96e147df︡{"file":{"filename":"/tmp/tmp69AGFB.png","show":false,"text":null,"uuid":"5d2098ce-35bb-4e47-8d14-2cf1d946825d"},"once":false}︡{"html":"<img src=\"/blobs//tmp/tmp69AGFB.png?uuid=5d2098ce-35bb-4e47-8d14-2cf1d946825d\" smc-image-scaling=\"0.5\" />"}︡{"done":true}︡
︠b0749977-2085-4355-8021-3c0e1d835b5bi︠
%md
Since log-normal distributions normally look better with log-log axes, let's use the plot function with points to show the distribution.
︡0237a541-2674-40e4-afa5-7c449a4c3cf7︡{"done":true,"md":"Since log-normal distributions normally look better with log-log axes, let's use the plot function with points to show the distribution."}
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
︡768df91d-7b94-452c-8cd9-ab0ebdb625bc︡{"stderr":"Warning message in xy.coords(x, y, xlabel, ylabel, log):\n“134 y values <= 0 omitted from logarithmic plot”"}︡{"file":{"filename":"/tmp/tmp4eYuVX.png","show":false,"text":null,"uuid":"34aff6e5-ec62-4437-8385-1681c42c299c"},"once":false}︡{"html":"<img src=\"/blobs//tmp/tmp4eYuVX.png?uuid=34aff6e5-ec62-4437-8385-1681c42c299c\" smc-image-scaling=\"0.5\" />"}︡{"done":true}︡
︠5257d368-01b4-4cbf-b44a-dbc3f280cdcdi︠


%md
# Pie Charts

Let's start with a simple pie chart graphing the cars vector:
︡c73432d6-0168-4c98-a233-74c1e04b355c︡{"done":true,"md":"# Pie Charts\n\nLet's start with a simple pie chart graphing the cars vector:"}
︠7e1177d7-03d4-4d59-9257-4566da0af6d8︠
# Define cars vector with 5 values
cars <- c(1, 3, 6, 4, 9)

# Create a pie chart for cars
pie(cars)
︡61aa5b89-3223-4421-acf7-3f77cb8194e6︡{"file":{"filename":"/tmp/tmpb1wCfj.png","show":false,"text":null,"uuid":"0ae047ef-d9c0-4575-9e3a-f9eff823e5d6"},"once":false}︡{"html":"<img src=\"/blobs//tmp/tmpb1wCfj.png?uuid=0ae047ef-d9c0-4575-9e3a-f9eff823e5d6\" smc-image-scaling=\"0.5\" />"}︡{"done":true}︡
︠836d4b7c-4c34-4b49-93d8-38b09a385b46i︠
%md
Now let's add a heading, change the colors, and define our own labels:
︡fff2e47a-b86e-4453-aee3-5a380821e268︡{"done":true,"md":"Now let's add a heading, change the colors, and define our own labels:"}
︠5a94c4a4-3735-4ee0-8f43-80f1079185f2s︠

# Define cars vector with 5 values
cars <- c(1, 3, 6, 4, 9)

# Create a pie chart with defined heading and
# custom colors and labels
pie(cars, main="Cars", col=rainbow(length(cars)),
   labels=c("Mon","Tue","Wed","Thu","Fri"))
︡774e97fb-3a7a-48f7-99f7-f8a402d36b5c︡{"file":{"filename":"/tmp/tmpNU2a7d.png","show":false,"text":null,"uuid":"953035ce-1efa-42e8-9b1d-0dd49f41d368"},"once":false}︡{"html":"<img src=\"/blobs//tmp/tmpNU2a7d.png?uuid=953035ce-1efa-42e8-9b1d-0dd49f41d368\" smc-image-scaling=\"0.5\" />"}︡{"done":true}︡
︠d65d6178-c6c7-40bd-9a2c-806519e73dddi︠
%md
Now let's change the colors, label using percentages, and create a legend:
︡e870ac21-da0c-4fb6-b9d4-c3104e0758f4︡{"done":true,"md":"Now let's change the colors, label using percentages, and create a legend:"}
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
︡ce4098f4-2a6c-43f5-bf14-04c0644d0420︡{"file":{"filename":"/tmp/tmpRQd9Cz.png","show":false,"text":null,"uuid":"824ee26c-d2c7-40f7-bc1e-31552d24cfb4"},"once":false}︡{"html":"<img src=\"/blobs//tmp/tmpRQd9Cz.png?uuid=824ee26c-d2c7-40f7-bc1e-31552d24cfb4\" smc-image-scaling=\"0.5\" />"}︡{"done":true}︡
︠62267678-cf6c-4001-a8ac-816b79dd1b2fi︠
%md
# Dotcharts

Let's start with a simple dotchart graphing the autos data:
︡b0f1388d-6738-46dc-bf36-83230e2f8c70︡{"done":true,"md":"# Dotcharts\n\nLet's start with a simple dotchart graphing the autos data:"}
︠44aa7a26-7e11-4989-bcdc-3e7b6f3394a3s︠
# Read values from tab-delimited autos.dat
autos_data <- read.table("autos.dat", header=T, sep="\t")

# Create a dotchart for autos
dotchart(t(autos_data))
︡47fc0b4d-3e94-4a59-b2fd-84decfbdbcf7︡{"file":{"filename":"/tmp/tmphMXG1_.png","show":false,"text":null,"uuid":"023c6cbe-b240-4932-ab0e-024af1ea623a"},"once":false}︡{"html":"<img src=\"/blobs//tmp/tmphMXG1_.png?uuid=023c6cbe-b240-4932-ab0e-024af1ea623a\" smc-image-scaling=\"0.5\" />"}︡{"done":true}︡
︠9d6d8875-a299-4033-8ee6-de5d9e3cb722i︠
%md
Let's make the dotchart a little more colorful:
︡26e07a9d-f67b-4c16-97ad-c2ecec945343︡{"done":true,"md":"Let's make the dotchart a little more colorful:"}
︠5ebbca0e-f6b0-48b5-af1b-d5efcabe1a1fs︠
# Read values from tab-delimited autos.dat
autos_data <- read.table("autos.dat", header=T, sep="\t")

# Create a colored dotchart for autos with smaller labels
dotchart(t(autos_data), color=c("red","blue","darkgreen"),
   main="Dotchart for Autos", cex=0.8)
︡2710847a-cadf-4aa1-916d-ab7d30a8d717︡{"file":{"filename":"/tmp/tmpld_qFj.png","show":false,"text":null,"uuid":"4d556f7c-0417-4295-8fd9-fb1b997f59aa"},"once":false}︡{"html":"<img src=\"/blobs//tmp/tmpld_qFj.png?uuid=4d556f7c-0417-4295-8fd9-fb1b997f59aa\" smc-image-scaling=\"0.5\" />"}︡{"done":true}︡
︠bd0c1da3-be27-4abb-8471-32a77566aac8i︠
%md

# Misc

This example shows all 25 symbols that you can use to produce points in your graphs:
︡68ca930e-0bd1-41d6-b056-c3cb444ce6c8︡{"done":true,"md":"\n# Misc\n\nThis example shows all 25 symbols that you can use to produce points in your graphs:"}
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
︡0d2142c5-74df-441d-b555-956dfe99c466︡{"file":{"filename":"/tmp/tmpH8i4j4.png","show":false,"text":null,"uuid":"ba1bf784-6640-4484-81ee-f4ef32af554a"},"once":false}︡{"html":"<img src=\"/blobs//tmp/tmpH8i4j4.png?uuid=ba1bf784-6640-4484-81ee-f4ef32af554a\" smc-image-scaling=\"0.5\" />"}︡{"done":true}︡
︠f08984b2-29b9-4235-ac13-b254fa10d8f1i︠
%md
# Bonus -- you can also use ggplot2
︡ce1bd901-7c68-4969-9492-bee40ef025f6︡{"done":true,"md":"# Bonus -- you can also use ggplot2"}
︠d581385f-4c83-46cc-8145-8e10aaeabda1s︠
require(ggplot2)

qplot(age, circumference, data = Orange, geom = c('point', "line"), colour = Tree,
  main = "How does orange tree circumference vary with age?")
︡6c08bedc-d5df-4749-aed9-6a741650f4f3︡{"file":{"filename":"/tmp/tmpg2BOms.png","show":false,"text":null,"uuid":"fc537b7c-4db5-4f93-b8a0-345b9a8d6946"},"once":false}︡{"html":"<img src=\"/blobs//tmp/tmpg2BOms.png?uuid=fc537b7c-4db5-4f93-b8a0-345b9a8d6946\" smc-image-scaling=\"0.5\" />"}︡{"done":true}︡
︠a06eb499-2043-47f2-a135-157e08a07af5︠









