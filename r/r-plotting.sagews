︠bf8be137-6f06-4a1a-8bde-29db2f3b699ci︠
%html
<h1>Graphics using R in the Sagemath Cloud</h1>
<h2>William Stein</h2>

This is a Sagemath Cloud worksheet version of Frank McCown's tutorial from <a target="_blank" href="http://www.harding.edu/fmccown/r/">http://www.harding.edu/fmccown/r/</a>.

First, we put the worksheet into R mode (otherwise you would have to type %r at the beginning of each cell):
︡b681936d-d97e-4e2d-8989-45f0ee24bdeb︡{"html":"<h1>Graphics using R in the Sagemath Cloud</h1>\n\nThis is a Sagemath Cloud worksheet version of Frank McCown's tutorial from <a target=\"_blank\" href=\"http://www.harding.edu/fmccown/r/\">http://www.harding.edu/fmccown/r/</a>.\n\nFirst, we put the worksheet into R mode (otherwise you would have to type %r at the beginning of each cell):"}︡
︠52916e12-5c4c-4f11-aa93-8014696978b6a︠
%auto
%default_mode r
︡9727d909-01a4-4199-99e5-dd8e82fd3e66︡{"auto":true}︡
︠27988413-3a2d-4ac7-8608-b9d571d8da54i︠
%md

## Line Charts
First we'll produce a very simple graph using the values in the car vector:
︡61cfa1bc-6725-466a-a783-c4e13fcec634︡{"html":"<h2>Line Charts</h2>\n\n<p>First we&#8217;ll produce a very simple graph using the values in the car vector:</p>\n"}︡
︠a6d0bfa4-f12f-4d6a-849e-4a4c3b959bce︠
# Define the cars vector with 5 values
cars <- c(1, 3, 6, 4, 9)
# Graph the cars vector with all defaults
plot(cars)
︡5da9e9cf-c56b-4f7a-bc4c-9c3e2c9273b3︡{"file":{"show":true,"uuid":"3f62f17c-97ae-4525-8292-f73657fbf2db","filename":"/tmp/b372f0d5-346c-490b-8123-d639bb80427a.png"}}︡{"stdout":"\n\n\n"}︡{"stdout":"\n"}︡
︠c1cf70ee-1440-46c7-8842-787a4b8ef2a6i︠
%md
Let's add a title, a line to connect the points, and some color:
︡cd48ca58-8e57-4194-90d1-edb2ba42059e︡{"html":"<p>Let&#8217;s add a title, a line to connect the points, and some color:</p>\n"}︡
︠abb3782a-bd6f-4388-b5fe-75f7ad8bd793︠
# Graph cars using blue points overlayed by a line
plot(cars, type="o", col="blue")

# Create a title with a red, bold/italic font
title(main="Autos", col.main="red", font.main=4)
︡2189422f-7709-425b-ac19-4dceda5c1d96︡{"file":{"show":true,"uuid":"8fa018aa-64d7-469d-bda1-47e6f5992302","filename":"/tmp/3d6b5036-3e0a-4048-bbda-837b22f29372.png"}}︡{"stdout":"\n\n\n"}︡{"stdout":"\n"}︡
︠69f3e8ee-7d0b-4317-b069-8c8ea4366defi︠
%md
Now let's add a red line for trucks and specify the y-axis range directly so it will be large enough to fit the truck data:
︡9b990857-614a-47bc-929b-be321f28c3ac︡{"html":"<p>Now let&#8217;s add a red line for trucks and specify the y-axis range directly so it will be large enough to fit the truck data:</p>\n"}︡
︠0d958bec-d38b-4cda-b786-1cedf536d74f︠
trucks <- c(2, 5, 4, 5, 12)
# Graph cars using a y axis that ranges from 0 to 12
plot(cars, type="o", col="blue", ylim=c(0,12))
# Graph trucks with red dashed line and square points
lines(trucks, type="o", pch=22, lty=2, col="red")
# Create a title with a red, bold/italic font
title(main="Autos", col.main="red", font.main=4)
︡461ea1bb-6661-4e7c-8bdc-a91cf8d35734︡{"file":{"show":true,"uuid":"fb610eef-5681-4944-8b1c-ac8563ba360f","filename":"/tmp/7e2c788a-929b-45ae-8217-a637e6a9277b.png"}}︡{"stdout":"\n\n\n\n\n\n"}︡{"stdout":"\n"}︡
︠337bc274-2f27-4ca6-aaf7-3090ec48b5cbi︠
%md
Next let's change the axes labels to match our data and add a legend. We'll also compute the $y$-axis values using the max function so any changes to our data will be automatically reflected in our graph.
︡935218b3-5823-4564-a89f-63a93d9c5db1︡{"html":"<p>Next let&#8217;s change the axes labels to match our data and add a legend. We&#8217;ll also compute the $y$-axis values using the max function so any changes to our data will be automatically reflected in our graph.</p>\n"}︡
︠f46eac61-b35e-4739-a56a-d21c22f6128d︠
# Calculate range from 0 to max value of cars and trucks
g_range <- range(0, cars, trucks)

# Graph autos using y axis that ranges from 0 to max
# value in cars or trucks vector.  Turn off axes and
# annotations (axis labels) so we can specify them ourself
plot(cars, type="o", col="blue", ylim=g_range,
   axes=FALSE, ann=FALSE)

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
︡7fee7966-f608-4195-8fad-a9194c45fe02︡{"file":{"show":true,"uuid":"1523ab7a-e902-475d-81b4-fe6a568e9bbc","filename":"/tmp/dc956aef-29d8-4518-8d29-e67515bef392.png"}}︡{"stdout":"\n"}︡
︠d3d5af40-30b8-4d57-9e71-4c61b2e7ccf3i︠
%md
Now let's read the graph data directly from a tab-delimited file. The file contains an additional set of values for SUVs.
We'll create the file using the %file cell decorator:
︡93304d5c-e312-4e61-aef0-a7bbf85962c9︡{"html":"<p>Now let&#8217;s read the graph data directly from a tab-delimited file. The file contains an additional set of values for SUVs.\nWe&#8217;ll create the file using the %file cell decorator:</p>\n"}︡
︠35248d5e-421c-43f3-a3bd-c8c82d585fcd︠
%sage_salvus.file("autos.dat")
cars	trucks	suvs
1	2	4
3	5	4
6	4	6
4	5	6
9	12	16
︡5e281c34-8bd3-4884-bbf6-d0d6016f71b6︡
︠8681a917-4cc5-46c9-a2bb-1661c16d8509i︠
%md
We'll also use a vector for storing the colors to be used in our graph so
if we want to change the colors later on, there's only one place in the file that needs to be modified.
Finally we'll send the figure directly to a PNG file.  (You can also instead just right click on a figure
embedded in the worksheet and click save as if you want.)
︡78392948-6d11-49b1-be76-65d429f4f1a9︡{"html":"<p>We&#8217;ll also use a vector for storing the colors to be used in our graph so\nif we want to change the colors later on, there&#8217;s only one place in the file that needs to be modified.\nFinally we&#8217;ll send the figure directly to a PNG file.  (You can also instead just right click on a figure\nembedded in the worksheet and click save as if you want.)</p>\n"}︡
︠bb3e376d-a028-4c41-a7c9-72682cb48fca︠
# Read car and truck values from tab-delimited autos.dat
autos_data <- read.table("autos.dat", header=T, sep="\t")

# Compute the largest y value used in the data (or we could
# just use range again)
max_y <- max(autos_data)

# Define colors to be used for cars, trucks, suvs
plot_colors <- c("blue","red","forestgreen")

# Start PNG device driver to save output to figure.png
png(filename="figure.png", height=295, width=300,
 bg="white")

# Graph autos using y axis that ranges from 0 to max_y.
# Turn off axes and annotations (axis labels) so we can
# specify them ourself
plot(autos_data$cars, type="o", col=plot_colors[1],
   ylim=c(0,max_y), axes=FALSE, ann=FALSE)

# Make x axis using Mon-Fri labels
axis(1, at=1:5, lab=c("Mon", "Tue", "Wed", "Thu", "Fri"))

# Make y axis with horizontal labels that display ticks at
# every 4 marks. 4*0:max_y is equivalent to c(0,4,8,12).
axis(2, las=1, at=4*0:max_y)

# Create box around plot
box()

# Graph trucks with red dashed line and square points
lines(autos_data$trucks, type="o", pch=22, lty=2,
   col=plot_colors[2])

# Graph suvs with green dotted line and diamond points
lines(autos_data$suvs, type="o", pch=23, lty=3,
   col=plot_colors[3])

# Create a title with a red, bold/italic font
title(main="Autos", col.main="red", font.main=4)

# Label the x and y axes with dark green text
title(xlab= "Days", col.lab=rgb(0,0.5,0))
title(ylab= "Total", col.lab=rgb(0,0.5,0))

# Create a legend at (1, max_y) that is slightly smaller
# (cex) and uses the same line colors and points used by
# the actual plots
legend(1, max_y, names(autos_data), cex=0.8, col=plot_colors,
   pch=21:23, lty=1:3);

# Turn off device driver (to flush output to png)
dev.off()
︡84979618-943c-487f-b9c7-37c1b54300f3︡{"stdout":"\n"}︡
︠7a471525-0410-43fc-b719-fde165f9c968︠
%sage salvus.file('figure.png')
︡f73d16b6-2cc5-412b-8e47-788ec33d4e4f︡{"file":{"show":true,"uuid":"5187fbc1-3231-4146-8208-deed440db96c","filename":"figure.png"}}︡
︠bf1a9854-e761-41c8-9715-3dc551f5a7a4i︠
%md
In this next example, we'll save the file to a PDF and chop off extra white space around the graph; this is useful when wanting to use figures in LaTeX (and cloud.sagemath has a very nice integrated latex development environment!).
We'll also increase the line widths, shrink the axis font size, and tilt the x-axis labels by 45 degrees.
︡01e6bd72-8c70-461b-ab53-60f2f3987b6c︡{"html":"<p>In this next example, we&#8217;ll save the file to a PDF and chop off extra white space around the graph; this is useful when wanting to use figures in LaTeX (and cloud.sagemath has a very nice integrated latex development environment!). \nWe&#8217;ll also increase the line widths, shrink the axis font size, and tilt the x-axis labels by 45 degrees.</p>\n"}︡
︠365555a4-11c2-4208-9e2a-027216b5243f︠
# Read car and truck values from tab-delimited autos.dat
autos_data <- read.table("autos.dat", header=T, sep="\t")

# Define colors to be used for cars, trucks, suvs
plot_colors <- c(rgb(r=0.0,g=0.0,b=0.9), "red", "forestgreen")

# Start PDF device driver to save output to figure.pdf
pdf(file="figure.pdf", height=3.5, width=5)

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
lines(autos_data$trucks, type="l", lty=2, lwd=2,
  col=plot_colors[2])

# Graph suvs with thicker green dotted line
lines(autos_data$suvs, type="l", lty=3, lwd=2,
  col=plot_colors[3])

# Create a legend in the top-left corner that is slightly
# smaller and has no border
legend("topleft", names(autos_data), cex=0.8, col=plot_colors,
   lty=1:3, lwd=2, bty="n");

# Turn off device driver (to flush output to PDF)
dev.off()

# Restore default margins
par(mar=c(5, 4, 4, 2) + 0.1)
︡93b78548-b3d5-403d-91df-69d7062a6ef0︡{"stdout":"\n"}︡
︠ff959c30-69f8-460e-a9ab-201fb7567f5ei︠
%md
We can directly look at the figure in the worksheet (you can also navigate to the pdf file andclick to view it).
︡b3254508-42df-450f-9441-9d5d6ae428e0︡{"html":"<p>We can directly look at the figure in the worksheet (you can also navigate to the pdf file andclick to view it).</p>\n"}︡
︠1623ce0b-c0cf-4570-b40d-81f2ff789e64︠
%load figure.pdf
︡fee20fe8-66f2-4b70-9609-593f6a8e09bd︡{"file":{"show":false,"uuid":"63c801b3-b187-4b33-a884-00aaee14c7ec","filename":"figure.pdf"}}︡{"html":"<object data=\"/blobs/figure.pdf?uuid=63c801b3-b187-4b33-a884-00aaee14c7ec\"  type=\"application/pdf\" width=\"1000\" height=\"600\"> Your browser doesn't support embedded PDF's, but you can <a href=\"/blobs/figure.pdf?uuid=63c801b3-b187-4b33-a884-00aaee14c7ec\">download figure.pdf</a></p> </object>"}︡
︠6c67eb74-f77b-4aa0-be3c-dcb1bde0d5a5i︠
%md
We can also create a latex file that includes the figure.
After running the next cell, you'll find a file called r-plot.tex, which you can click on in the
file browser to open and editor directly, with automatic latexing on save.
︡9c65d488-8f1f-4748-a56e-5bbdfba0fb6d︡{"html":"<p>We can also create a latex file that includes the figure.\nAfter running the next cell, you&#8217;ll find a file called r-plot.tex, which you can click on in the\nfile browser to open and editor directly, with automatic latexing on save.</p>\n"}︡
︠bd1e067d-6c6b-498a-bddd-420944fc40ea︠
%file('r-plot.tex')
\documentclass{article}
\usepackage{graphicx}
\title{Example of including an R plot}
\author{Sagemath Cloud}
\begin{document}
\maketitle
\includegraphics[width=.6\textwidth]{figure.pdf}
\end{document}
︡797014e4-0884-4162-babb-7247e5fb7b3c︡
︠7ff22d70-cbda-44a1-9744-f69eefc37119i︠
%md
## Bar Charts

Let's start with a simple bar chart graphing the cars vector:
︡9574903e-d548-4523-9300-b5cc400e87de︡{"html":"<h2>Bar Charts</h2>\n\n<p>Let&#8217;s start with a simple bar chart graphing the cars vector:</p>\n"}︡
︠c7638da3-041c-4c62-9ae1-5f08833dbc23︠
# Define the cars vector with 5 values
cars <- c(1, 3, 6, 4, 9)
# Graph cars
barplot(cars)
︡796c6c5b-8b12-4dd9-899b-dbe6189ffbfe︡{"file":{"show":true,"uuid":"8fb90f1e-2f4d-48b5-a745-1e63969f4704","filename":"/tmp/aff5a12e-2525-4b8c-a013-8c2e9fe97c9e.png"}}︡{"stdout":"\n\n\n"}︡{"stdout":"\n"}︡
︠2419546e-9b0f-4d4f-8aa7-f5eb4516abbci︠
%md
Let's now read the auto data from the autos.dat data file, add labels, blue borders around the bars, and density lines:
︡9671c89a-38b9-4637-a25b-17bad82acfe9︡{"html":"<p>Let&#8217;s now read the auto data from the autos.dat data file, add labels, blue borders around the bars, and density lines:</p>\n"}︡
︠580051bd-edaf-4999-91f6-c458354b0fa8︠

# Read values from tab-delimited autos.dat
autos_data <- read.table("autos.dat", header=T, sep="\t")

# Graph cars with specified labels for axes.  Use blue
# borders and diagnal lines in bars.
barplot(autos_data$cars, main="Cars", xlab="Days",
   ylab="Total", names.arg=c("Mon","Tue","Wed","Thu","Fri"),
   border="blue", density=c(10,20,30,40,50))
︡49f1421b-c14d-40ab-8970-8a620ef38fd6︡{"file":{"show":true,"uuid":"9f7108ac-7a2d-446a-9d7d-7cb586b8334b","filename":"/tmp/24ad51d0-d203-4831-bfa6-df759c9e0301.png"}}︡{"stdout":"\n\n\n\n\n\n"}︡{"stdout":"\n"}︡
︠245ee84a-7805-446f-ba0b-04f218b519b5i︠
%md
Now let's graph the total number of autos per day using some color and show a legend:
︡18bbfde0-e606-4d0c-a94b-53701bc0ebad︡{"html":"<p>Now let&#8217;s graph the total number of autos per day using some color and show a legend:</p>\n"}︡
︠424788cc-c89a-4634-96c6-7fa86cb5d546︠
# Read values from tab-delimited autos.dat
autos_data <- read.table("autos.dat", header=T, sep="\t")

# Graph autos with adjacent bars using rainbow colors
barplot(as.matrix(autos_data), main="Autos", ylab= "Total",
   beside=TRUE, col=rainbow(5))

# Place the legend at the top-left corner with no frame
# using rainbow colors
legend("topleft", c("Mon","Tue","Wed","Thu","Fri"), cex=0.6,
   bty="n", fill=rainbow(5));
︡2ce9766c-3db4-4a90-9421-943b5b852798︡{"file":{"show":true,"uuid":"f148eea3-d12e-4a51-a833-05ad3754f35e","filename":"/tmp/41f4aae7-e5ba-4f02-ac83-90862642091c.png"}}︡{"stdout":"\n\n\n\n\n\n\n\n"}︡{"stdout":"\n"}︡
︠ff58be13-81b6-45d4-85e0-3fcbf2345a29i︠
%md

Let's graph the total number of autos per day using a stacked bar chart and place the legend outside of the plot area:
︡2b376074-a30b-4a9d-a5ad-0d51e0582e20︡{"html":"<p>Let&#8217;s graph the total number of autos per day using a stacked bar chart and place the legend outside of the plot area:</p>\n"}︡
︠b234e867-1fe9-4754-a5ef-086e4248963c︠

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
︡8c77b91e-fee8-4445-a1ea-534c89f22574︡{"file":{"show":true,"uuid":"e05a2a48-f6f5-4518-82b2-f999741c52a4","filename":"/tmp/d41a8693-017e-40e8-bb93-49dcca34189f.png"}}︡{"stdout":"\n\n\n\n\n\n\n\n\n\n\n\n\n"}︡{"stdout":"\n"}︡
︠7f6a76cb-0dc9-4a80-97c3-0d4efe678b4di︠
%md

# Histograms

Let's start with a simple histogram graphing the distribution of the suvs vector:
︡57d7595e-30f2-47c1-9b1b-dcf30f554c2d︡{"html":"<h1>Histograms</h1>\n\n<p>Let&#8217;s start with a simple histogram graphing the distribution of the suvs vector:</p>\n"}︡
︠fe6282f0-618b-4870-9a3a-e3b911d6d371︠

# Define the suvs vector with 5 values
suvs <- c(4,4,6,6,16)

# Create a histogram for suvs
hist(suvs)
︡84cc9ae9-5a94-4099-b959-4520db8893b8︡{"file":{"show":true,"uuid":"138f0cf6-08ac-4640-ae05-e043c6bd0a34","filename":"/tmp/fbcd2598-4b4f-4f9c-ae35-cd69fb26dfee.png"}}︡{"stdout":"\n\n\n"}︡{"stdout":"\n"}︡
︠89467e86-be24-451e-9c2c-8df09ab1b067i︠
%md
Let's now read the auto data from the autos.dat data file and plot a histogram of the combined car, truck, and suv data in color.
︡99dbedb5-2b92-4d53-93ee-e737ad14524a︡{"html":"<p>Let&#8217;s now read the auto data from the autos.dat data file and plot a histogram of the combined car, truck, and suv data in color.</p>\n"}︡
︠5920e7d1-83b6-496c-a4c5-a1f898d4da12︠

# Read values from tab-delimited autos.dat
autos_data <- read.table("autos.dat", header=T, sep="\t")

# Concatenate the three vectors
autos <- c(autos_data$cars, autos_data$trucks, autos_data$suvs)

# Create a histogram for autos in light blue with the y axis
# ranging from 0-10
hist(autos, col="lightblue", ylim=c(0,10))
︡b7b7c5e3-5292-4b54-8805-c08efcdfca9b︡{"file":{"show":true,"uuid":"335a22cb-fa9d-4587-bef1-d055d90e91b9","filename":"/tmp/bc208fe1-6b59-4b40-8cf9-dc412447d6cd.png"}}︡{"stdout":"\n\n\n\n\n\n"}︡{"stdout":"\n"}︡
︠9f494bac-3be1-4dec-970c-f0bcdb118f79i︠
%md
Now change the breaks so none of the values are grouped together and flip the y-axis labels horizontally.
︡8da10571-b921-4e5c-8a21-43ce73f654f9︡{"html":"<p>Now change the breaks so none of the values are grouped together and flip the y-axis labels horizontally.</p>\n"}︡
︠4670e530-2e68-4dd4-a5b3-511e6187eee4︠
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
︡019df434-f264-492e-bd34-dd5e9569f005︡{"file":{"show":true,"uuid":"e3ce6492-dc3f-4aa3-866f-adb2ffbd572c","filename":"/tmp/f188f2c8-ea40-4d7f-a576-fa41b54d5edd.png"}}︡{"stdout":"\n\n\n\n\n\n\n\n\n\n\n"}︡{"stdout":"\n"}︡
︠24e5c86f-c2f9-4c61-a7f4-17d941807148i︠
%md
Now let's create uneven breaks and graph the probability density.
︡b3fa531d-c334-4cf9-a837-18a5d72d72b7︡{"html":"<p>Now let&#8217;s create uneven breaks and graph the probability density.</p>\n"}︡
︠279a7afa-fd22-4e27-ab85-3b002759acb7︠

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
︡2d70b3c1-ba82-4d96-9ddd-b187fbf59ae7︡{"file":{"show":true,"uuid":"3600f83e-fbb3-4a6b-8c49-36ea0a3dd258","filename":"/tmp/81e50d97-752e-4b1f-8596-e9ee8b067767.png"}}︡{"stdout":"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"}︡{"stdout":"\n"}︡
︠86eeead4-5d8c-4557-8fc0-2bd3a6ec4b0ci︠
%md

In this example we'll plot the distribution of 1000 random values that have the log-normal distribution.
︡f4ccf090-f51d-4292-8a9a-1502f55fffe6︡{"html":"<p>In this example we&#8217;ll plot the distribution of 1000 random values that have the log-normal distribution.</p>\n"}︡
︠08b6269f-a979-4b8a-8559-ef91153d1c00︠

# Get a random log-normal distribution
r <- rlnorm(1000)

hist(r)
︡4c4889fb-fd82-4b43-bee7-59782f670989︡{"file":{"show":true,"uuid":"147550ee-47f9-43fd-a42e-4e7d852ef523","filename":"/tmp/44de6030-e9e9-409f-bbdf-a5513e1099d1.png"}}︡{"stdout":"\n\n"}︡{"stdout":"\n"}︡
︠b0749977-2085-4355-8021-3c0e1d835b5bi︠
%md
Since log-normal distributions normally look better with log-log axes, let's use the plot function with points to show the distribution.
︡0237a541-2674-40e4-afa5-7c449a4c3cf7︡{"html":"<p>Since log-normal distributions normally look better with log-log axes, let&#8217;s use the plot function with points to show the distribution.</p>\n"}︡
︠aa707814-e098-4d37-8dfd-7a80c4f56136︠
# Get a random log-normal distribution
r <- rlnorm(1000)

# Get the distribution without plotting it using tighter breaks
h <- hist(r, plot=F, breaks=c(seq(0,max(r)+1, .1)))

# Plot the distribution using log scale on both axes, and use
# blue points
plot(h$counts, log="xy", pch=20, col="blue",
	main="Log-normal distribution",
	xlab="Value", ylab="Frequency")
︡97ef2aa7-d67c-449c-81ba-aedb38f0850c︡{"file":{"show":true,"uuid":"eb4bc916-d8ef-4951-a4c2-b04ba7622187","filename":"/tmp/0801e514-b825-4fdc-ac41-c75ae9d21246.png"}}︡{"stdout":"\n\n\n\n\n\n\n\nWarning message:\nIn xy.coords(x, y, xlabel, ylabel, log) :\n  156 y values <= 0 omitted from logarithmic plot"}︡{"stdout":"\n"}︡
︠5257d368-01b4-4cbf-b44a-dbc3f280cdcdi︠


%md
# Pie Charts

Let's start with a simple pie chart graphing the cars vector:
︡c73432d6-0168-4c98-a233-74c1e04b355c︡{"html":"<h1>Pie Charts</h1>\n\n<p>Let&#8217;s start with a simple pie chart graphing the cars vector:</p>\n"}︡
︠7e1177d7-03d4-4d59-9257-4566da0af6d8︠


# Define cars vector with 5 values
cars <- c(1, 3, 6, 4, 9)

# Create a pie chart for cars
pie(cars)
︡7e4ae370-4f46-40f1-a15e-03416b7f3633︡{"file":{"show":true,"uuid":"99a09478-38ad-481b-a0b9-e4b3ec506d3e","filename":"/tmp/2ea26929-12eb-493f-991b-b6089f6d8f55.png"}}︡{"stdout":"\n\n\n"}︡{"stdout":"\n"}︡
︠836d4b7c-4c34-4b49-93d8-38b09a385b46i︠
%md
Now let's add a heading, change the colors, and define our own labels:
︡fff2e47a-b86e-4453-aee3-5a380821e268︡{"html":"<p>Now let&#8217;s add a heading, change the colors, and define our own labels:</p>\n"}︡
︠5a94c4a4-3735-4ee0-8f43-80f1079185f2︠

# Define cars vector with 5 values
cars <- c(1, 3, 6, 4, 9)

# Create a pie chart with defined heading and
# custom colors and labels
pie(cars, main="Cars", col=rainbow(length(cars)),
   labels=c("Mon","Tue","Wed","Thu","Fri"))
︡392381df-6b84-4a10-9ad4-c2465d8d4e8a︡{"file":{"show":true,"uuid":"d634ed1c-c024-463e-989d-f2ad155ef36f","filename":"/tmp/ed792e04-8d0b-4bb1-9eee-bb058cd3a56f.png"}}︡{"stdout":"\n\n\n\n\n"}︡{"stdout":"\n"}︡
︠d65d6178-c6c7-40bd-9a2c-806519e73dddi︠
%md
Now let's change the colors, label using percentages, and create a legend:
︡e870ac21-da0c-4fb6-b9d4-c3104e0758f4︡{"html":"<p>Now let&#8217;s change the colors, label using percentages, and create a legend:</p>\n"}︡
︠3facf396-0cee-4b83-a873-33fe6df40a2b︠

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
︡6d9866d4-1a88-47d2-9543-6c24afc9d642︡{"file":{"show":true,"uuid":"1e7e5378-bd5f-40d8-999d-7611cd870f5f","filename":"/tmp/29b0619e-1678-423a-bf81-d26d7f436256.png"}}︡{"stdout":"\n\n\n\n\n\n\n\n\n\n\n\n\n"}︡{"stdout":"\n"}︡
︠62267678-cf6c-4001-a8ac-816b79dd1b2fi︠
%md
# Dotcharts

Let's start with a simple dotchart graphing the autos data:
︡b0f1388d-6738-46dc-bf36-83230e2f8c70︡{"html":"<h1>Dotcharts</h1>\n\n<p>Let&#8217;s start with a simple dotchart graphing the autos data:</p>\n"}︡
︠44aa7a26-7e11-4989-bcdc-3e7b6f3394a3︠

# Read values from tab-delimited autos.dat
autos_data <- read.table("autos.dat", header=T, sep="\t")

# Create a dotchart for autos
dotchart(t(autos_data))
︡a89cd8b8-76c7-4fe5-a83d-034560e3a1c2︡{"file":{"show":true,"uuid":"c7b4a85f-4e57-4c61-bb25-dab5479be931","filename":"/tmp/9fa81ab3-abaa-4318-b45f-530c3c206739.png"}}︡{"stdout":"\n\n\n"}︡{"stdout":"\n"}︡
︠9d6d8875-a299-4033-8ee6-de5d9e3cb722i︠
%md
Let's make the dotchart a little more colorful:
︡26e07a9d-f67b-4c16-97ad-c2ecec945343︡{"html":"<p>Let&#8217;s make the dotchart a little more colorful:</p>\n"}︡
︠5ebbca0e-f6b0-48b5-af1b-d5efcabe1a1f︠
# Read values from tab-delimited autos.dat
autos_data <- read.table("autos.dat", header=T, sep="\t")

# Create a colored dotchart for autos with smaller labels
dotchart(t(autos_data), color=c("red","blue","darkgreen"),
   main="Dotchart for Autos", cex=0.8)
︡0d5f8a22-8cd3-4ae4-8433-3c72d0327129︡{"file":{"show":true,"uuid":"42ca1fbe-b5ac-4756-b201-e6dc13c07f12","filename":"/tmp/dc1acdbd-3019-4a77-bc3c-ad4cd0c3145a.png"}}︡{"stdout":"\n\n\n\n"}︡{"stdout":"\n"}︡
︠bd0c1da3-be27-4abb-8471-32a77566aac8i︠
%md

# Misc

This example shows all 25 symbols that you can use to produce points in your graphs:
︡68ca930e-0bd1-41d6-b056-c3cb444ce6c8︡{"html":"<h1>Misc</h1>\n\n<p>This example shows all 25 symbols that you can use to produce points in your graphs:</p>\n"}︡
︠68244c12-401a-4f91-9a97-8442a29a1315︠

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
︡a226c2f6-94e0-42c3-a754-17f4372437a6︡{"file":{"show":true,"uuid":"d3879f1a-fe53-40fb-9c21-6f3a2be1d44d","filename":"/tmp/cb1be559-0ab1-416a-b28f-5d1e72ea6236.png"}}︡{"stdout":"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"}︡{"stdout":"\n"}︡
︠f08984b2-29b9-4235-ac13-b254fa10d8f1i︠
%md
# Bonus -- you can also use ggplot2
︡ce1bd901-7c68-4969-9492-bee40ef025f6︡{"html":"<h1>Bonus &#8211; you can also use ggplot2</h1>\n"}︡
︠d581385f-4c83-46cc-8145-8e10aaeabda1︠
require(ggplot2)

qplot(age, circumference, data = Orange, geom = c('point', "line"), colour = Tree,
  main = "How does orange tree circumference vary with age?")
︡56e3be97-de3c-4d9a-95cb-a62b47d9e9ae︡{"file":{"show":true,"uuid":"d0519f68-67dc-45d4-b8c4-83f784b1c6e6","filename":"/tmp/6a468e66-864b-4382-b309-8c056b290403.png"}}︡{"stdout":"Loading required package: ggplot2\n\n"}︡{"stdout":"\n"}︡
︠26cc2b8d-00c2-4a45-93b5-4ae032d7fa4e︠









