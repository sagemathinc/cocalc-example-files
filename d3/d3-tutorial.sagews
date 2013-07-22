︠0fa01d0a-56ba-4af9-8de6-f4a0c0285c44i︠
%md
# D3 Tutorial and Worksheet Mode
### Based on <http://alignedleft.com/tutorials/d3/> but using CoffeeScript and a Sage Worksheet
#### by William Stein
#### July 22, 2013
︡d04ee827-9fee-483a-9bda-203232a5758e︡{"html":"<h1>D3 Tutorial and Worksheet Mode</h1>\n\n<h3>Based on <a href=\"http://alignedleft.com/tutorials/d3/\">http://alignedleft.com/tutorials/d3/</a> but using CoffeeScript and a Sage Worksheet</h3>\n\n<h4>by William Stein</h4>\n\n<h4>July 22, 2013</h4>\n"}︡
︠7e54acbd-8dd2-4b19-b218-53f0dfb998e9a︠
%auto
import uuid
def d3(s=None,obj=None,css=None):
    def f(s):
        u = 'a'+str(uuid.uuid4())
        h = '<div id="%s" style="background-color:#f0f0f0" class="well"></div>'%u
        if css is not None:
            h += '<style type="text/css">%s</style>'%css
        html(h, hide=False)
        salvus.coffeescript("d=d3.select('#%s')\n%s"%(u,s),obj=obj)
    if s is None:
        return f
    else:
        f(s)
︡5a27027b-13d8-4c5f-8a02-6fc44be59273︡{"auto":true}︡
︠40e660af-ef64-4f8e-a7f7-7eb876abf0dca︠
%auto
%default_mode d3
︡bd285cdd-7264-43bb-8372-f7621f99339d︡{"auto":true}︡
︠f2e20154-2c81-487c-94b9-e8e11c2d6f2e︠
d.append("p")
 .text("hello there, world")
︡c56a49fe-b615-4ead-8367-3082f32ca633︡{"html":"<div id=\"af7137ec4-e49a-4764-98bc-a834bc2bbc45\" style=\"background-color:#f0f0f0\" class=\"well\"></div>"}︡{"obj":"{}","javascript":{"coffeescript":true,"code":"d=d3.select('#af7137ec4-e49a-4764-98bc-a834bc2bbc45')\nd.append(\"p\")\n .text(\"hello there, world\")"},"once":true}︡
︠c05f2903-6676-4af4-9d39-547b8a0d21c3︠
dataset = [ 5, 10, 15, 20, 25 ]
d.selectAll('p')
 .data(dataset)
 .enter()
 .append('p')
 .text((d) -> d)
 .style('color', (d) -> if d > 15 then 'red' else 'blue')
︡c53ff13a-b2fa-4ac7-beb0-ff8ece6a5b13︡{"html":"<div id=\"ac331523e-23a9-4537-a6ef-a76b06a03202\" style=\"background-color:#f0f0f0\" class=\"well\"></div>"}︡{"obj":"{}","javascript":{"coffeescript":true,"code":"d=d3.select('#ac331523e-23a9-4537-a6ef-a76b06a03202')\ndataset = [ 5, 10, 15, 20, 25 ]\nd.selectAll('p')\n .data(dataset)\n .enter()\n .append('p')\n .text((d) -> d)\n .style('color', (d) -> if d > 15 then 'red' else 'blue')"},"once":true}︡
︠a1315cf4-b903-4337-8119-6d945bc69b93︠
dataset = [ 5, 10, 13, 19, 21, 25, 22, 18, 15, 13,
                11, 12, 15, 20, 18, 17, 16, 18, 23, 25 ]
d.selectAll('div')
 .data(dataset)
 .enter()
 .append('div')
 .attr('style', "display: inline-block;width: 20px;height: 75px; background-color: teal; margin-right: 2px;")
 .style('height', (d) -> 5*d+'px')


︡d9f61703-4858-46a3-acfd-bd5aaab846ee︡{"html":"<div id=\"adc4b8238-1cd2-45e7-9d72-1a1d74a6b7e6\" style=\"background-color:#f0f0f0\" class=\"well\"></div>"}︡{"obj":"{}","javascript":{"coffeescript":true,"code":"d=d3.select('#adc4b8238-1cd2-45e7-9d72-1a1d74a6b7e6')\ndataset = [ 5, 10, 13, 19, 21, 25, 22, 18, 15, 13,\n                11, 12, 15, 20, 18, 17, 16, 18, 23, 25 ]\nd.selectAll('div')\n .data(dataset)\n .enter()\n .append('div')\n .attr('style', \"display: inline-block;width: 20px;height: 75px; background-color: teal; margin-right: 2px;\")\n .style('height', (d) -> 5*d+'px')"},"once":true}︡
︠37e7bb98-cc53-4f7e-baa2-a4207baa5f57︠
%html(hide=0)
<svg width="500" height="50">
    <rect x="0" y="0" width="500" height="5"/>
    <circle cx="250" cy="25" r="25"/>
    <ellipse cx="250" cy="25" rx="100" ry="25" fill="purple"/>
    <line x1="0" y1="0" x2="500" y2="50" stroke="black"/>
    <text x="250" y="25">Easy-peasy</text>
</svg>
︡f059ecc7-0333-4640-a772-669bbe44517e︡{"html":"<svg width=\"500\" height=\"50\">\n    <rect x=\"0\" y=\"0\" width=\"500\" height=\"5\"/>\n    <circle cx=\"250\" cy=\"25\" r=\"25\"/>\n    <ellipse cx=\"250\" cy=\"25\" rx=\"100\" ry=\"25\" fill=\"purple\"/>\n    <line x1=\"0\" y1=\"0\" x2=\"500\" y2=\"50\" stroke=\"black\"/>\n    <text x=\"250\" y=\"25\">Easy-peasy</text>\n</svg>"}︡
︠06a4e532-29a3-49e7-82f0-cb7491629161︠
%html(hide=0)
<svg width=500 height=50>
    <circle cx="25" cy="25" r="22" fill="yellow" stroke="orange" stroke-width="5"/>
</svg>
︡7521f596-7ce9-416d-ac19-4cb11e7ab21a︡{"html":"<svg width=500 height=50>\n    <circle cx=\"25\" cy=\"25\" r=\"22\" fill=\"yellow\" stroke=\"orange\" stroke-width=\"5\"/>\n</svg>"}︡
︠5eaa1a43-f114-4fa0-8343-ee230a1cfa81︠
%html(hide=0)
<svg width=500 height=50>
    <rect x="0" y="0" width="30" height="30" fill="purple"/>
    <rect x="20" y="5" width="30" height="30" fill="blue"/>
    <rect x="40" y="10" width="30" height="30" fill="green"/>
    <rect x="60" y="15" width="30" height="30" fill="yellow"/>
    <rect x="80" y="20" width="30" height="30" fill="red"/>
</svg>
︡0e653a94-e136-47f8-8c4a-f8ac91942eaa︡{"html":"<svg width=500 height=50>\n    <rect x=\"0\" y=\"0\" width=\"30\" height=\"30\" fill=\"purple\"/>\n    <rect x=\"20\" y=\"5\" width=\"30\" height=\"30\" fill=\"blue\"/>\n    <rect x=\"40\" y=\"10\" width=\"30\" height=\"30\" fill=\"green\"/>\n    <rect x=\"60\" y=\"15\" width=\"30\" height=\"30\" fill=\"yellow\"/>\n    <rect x=\"80\" y=\"20\" width=\"30\" height=\"30\" fill=\"red\"/>\n</svg>"}︡
︠3abedefe-5dcc-4380-9ebf-bbc3d719a7a0︠
%html(hide=0)
<svg width=500 height=50>

    <circle cx="25" cy="25" r="20" fill="rgba(128, 0, 128, 1.0)"/>
<circle cx="50" cy="25" r="20" fill="rgba(0, 0, 255, 0.75)"/>
<circle cx="75" cy="25" r="20" fill="rgba(0, 255, 0, 0.5)"/>
<circle cx="100" cy="25" r="20" fill="rgba(255, 255, 0, 0.25)"/>
<circle cx="125" cy="25" r="20" fill="rgba(255, 0, 0, 0.1)"/>

</svg>
︡0032ce7d-f6df-4a79-bb4c-34ea54caf329︡{"html":"<svg width=500 height=50>\n\n    <circle cx=\"25\" cy=\"25\" r=\"20\" fill=\"rgba(128, 0, 128, 1.0)\"/>\n<circle cx=\"50\" cy=\"25\" r=\"20\" fill=\"rgba(0, 0, 255, 0.75)\"/>\n<circle cx=\"75\" cy=\"25\" r=\"20\" fill=\"rgba(0, 255, 0, 0.5)\"/>\n<circle cx=\"100\" cy=\"25\" r=\"20\" fill=\"rgba(255, 255, 0, 0.25)\"/>\n<circle cx=\"125\" cy=\"25\" r=\"20\" fill=\"rgba(255, 0, 0, 0.1)\"/>\n\n</svg>"}︡
︠3f2fe26a-c041-4a1c-8056-b29e930f306d︠
%html(hide=0)
<svg width=500 height=50>

   <circle cx="25" cy="25" r="20"
        fill="rgba(128, 0, 128, 0.75)"
        stroke="rgba(0, 255, 0, 0.25)" stroke-width="10"/>
<circle cx="75" cy="25" r="20"
        fill="rgba(0, 255, 0, 0.75)"
        stroke="rgba(0, 0, 255, 0.25)" stroke-width="10"/>
<circle cx="50" cy="25" r="20"
        fill="rgba(0, 255, 0, 0.75)"
        stroke="rgba(0, 0, 255, 0.25)" stroke-width="10"/>
<circle cx="125" cy="25" r="20"
        fill="rgba(255, 255, 0, 0.75)"
        stroke="rgba(255, 0, 0, 0.25)" stroke-width="10"/>
<circle cx="100" cy="25" r="20"
        fill="rgba(255, 255, 0, 0.75)"
        stroke="rgba(255, 0, 0, 0.25)" stroke-width="10"/>
</svg>
︡91edce11-a91e-43e5-94ee-7e577c22f6c7︡{"html":"<svg width=500 height=50>\n\n   <circle cx=\"25\" cy=\"25\" r=\"20\"\n        fill=\"rgba(128, 0, 128, 0.75)\"\n        stroke=\"rgba(0, 255, 0, 0.25)\" stroke-width=\"10\"/>\n<circle cx=\"75\" cy=\"25\" r=\"20\"\n        fill=\"rgba(0, 255, 0, 0.75)\"\n        stroke=\"rgba(0, 0, 255, 0.25)\" stroke-width=\"10\"/>\n<circle cx=\"50\" cy=\"25\" r=\"20\"\n        fill=\"rgba(0, 255, 0, 0.75)\"\n        stroke=\"rgba(0, 0, 255, 0.25)\" stroke-width=\"10\"/>\n<circle cx=\"125\" cy=\"25\" r=\"20\"\n        fill=\"rgba(255, 255, 0, 0.75)\"\n        stroke=\"rgba(255, 0, 0, 0.25)\" stroke-width=\"10\"/>\n<circle cx=\"100\" cy=\"25\" r=\"20\"\n        fill=\"rgba(255, 255, 0, 0.75)\"\n        stroke=\"rgba(255, 0, 0, 0.25)\" stroke-width=\"10\"/>\n</svg>"}︡
︠ca3126b4-0796-4381-9167-c4a3af1d6637︠
dataset = [ 5, 10, 15, 20, 25 ]
h = 100
svg = d.append("svg").attr(width:500,height:h)
circles = svg.selectAll('circle')
   .data(dataset)
   .enter()
   .append("circle")

circles.attr
    cx     : (d,i) -> i*50 + 15
    cy     : h/2
    r      : (d) -> d
    fill   : 'yellow'
    stroke : 'orange'
    'stroke-width' : (d) -> d/2

︡4b954cb6-14b6-4b3e-826e-a0c4b4304fe1︡{"html":"<div id=\"a12dfbbbd-b10e-43b8-8350-53e112738401\" style=\"background-color:#f0f0f0\" class=\"well\"></div>"}︡{"obj":"{}","javascript":{"coffeescript":true,"code":"d=d3.select('#a12dfbbbd-b10e-43b8-8350-53e112738401')\ndataset = [ 5, 10, 15, 20, 25 ]\nh = 100\nsvg = d.append(\"svg\").attr(width:500,height:h)\ncircles = svg.selectAll('circle')\n   .data(dataset)\n   .enter()\n   .append(\"circle\")\n\ncircles.attr\n    cx     : (d,i) -> i*50 + 15\n    cy     : h/2\n    r      : (d) -> d\n    fill   : 'yellow'\n    stroke : 'orange'\n    'stroke-width' : (d) -> d/2"},"once":true}︡
︠8425fc86-f9da-4770-9110-c51e3a8c61bc︠
dataset = [ 5, 10, 13, 19, 21, 25, 22, 18, 15, 13,
                11, 12, 15, 20, 18, 17, 16, 18, 23, 25 ]

for i in [0...20]
    dataset.push(Math.round(Math.random()*20))

w = 500; h = 100
barPadding = 1
svg = d.append("svg").attr(width:w,height:h)

svg.selectAll('rect')
   .data(dataset)
   .enter()
   .append('rect')
   .attr
       x      : (d, i) -> i * (w / dataset.length)
       y      : (d) -> h-d*4
       width  : w / dataset.length - barPadding
       height : (d) -> d*4
       fill   : (d) -> "rgb(0,0,#{d*10})"
︡2f4f06e3-be9c-4679-a24d-47323f47f67b︡{"html":"<div id=\"a7646acce-94b5-41bd-bc85-4a6a7cf1579e\" style=\"background-color:#f0f0f0\" class=\"well\"></div>"}︡{"obj":"{}","javascript":{"coffeescript":true,"code":"d=d3.select('#a7646acce-94b5-41bd-bc85-4a6a7cf1579e')\ndataset = [ 5, 10, 13, 19, 21, 25, 22, 18, 15, 13,\n                11, 12, 15, 20, 18, 17, 16, 18, 23, 25 ]\n\nfor i in [0...20]\n    dataset.push(Math.round(Math.random()*20))\n\nw = 500; h = 100\nbarPadding = 1\nsvg = d.append(\"svg\").attr(width:w,height:h)\n\nsvg.selectAll('rect')\n   .data(dataset)\n   .enter()\n   .append('rect')\n   .attr\n       x      : (d, i) -> i * (w / dataset.length)\n       y      : (d) -> h-d*4\n       width  : w / dataset.length - barPadding\n       height : (d) -> d*4\n       fill   : (d) -> \"rgb(0,0,#{d*10})\""},"once":true}︡
︠f255d616-8f93-4196-8eb6-16c0152ab8cf︠

dataset = [ 5, 10, 13, 19, 21, 25, 22, 18, 15, 13,
                11, 12, 15, 20, 18, 17, 16, 18, 23, 25 ]

for i in [0...10]
    dataset.push(Math.round(Math.random()*20))

w = 700; h = 100
barPadding = 1
svg = d.append("svg").attr(width:w,height:h)

svg.selectAll('rect')
   .data(dataset)
   .enter()
   .append('rect')
   .attr
       x      : (d, i) -> i * (w / dataset.length)
       y      : (d) -> h-d*3
       width  : w / dataset.length - barPadding
       height : (d) -> d*3
       fill   : (d) -> "rgb(0,0,#{d*10})"

svg.selectAll('text')
   .data(dataset)
   .enter()
   .append("text")
   .text( (d) -> d )
   .attr
       x : (d,i) -> i * (w / dataset.length)
       y : (d) -> h - (d * 3)-5
︡ff4a7d80-c6c2-4e62-a26e-0d77e877b759︡{"html":"<div id=\"ae709e3b2-224a-4eb1-adb6-3cfd9c0a3531\" style=\"background-color:#f0f0f0\" class=\"well\"></div>"}︡{"obj":"{}","javascript":{"coffeescript":true,"code":"d=d3.select('#ae709e3b2-224a-4eb1-adb6-3cfd9c0a3531')\ndataset = [ 5, 10, 13, 19, 21, 25, 22, 18, 15, 13,\n                11, 12, 15, 20, 18, 17, 16, 18, 23, 25 ]\n\nfor i in [0...10]\n    dataset.push(Math.round(Math.random()*20))\n\nw = 700; h = 100\nbarPadding = 1\nsvg = d.append(\"svg\").attr(width:w,height:h)\n\nsvg.selectAll('rect')\n   .data(dataset)\n   .enter()\n   .append('rect')\n   .attr\n       x      : (d, i) -> i * (w / dataset.length)\n       y      : (d) -> h-d*3\n       width  : w / dataset.length - barPadding\n       height : (d) -> d*3\n       fill   : (d) -> \"rgb(0,0,#{d*10})\"\n\nsvg.selectAll('text')\n   .data(dataset)\n   .enter()\n   .append(\"text\")\n   .text( (d) -> d )\n   .attr\n       x : (d,i) -> i * (w / dataset.length)\n       y : (d) -> h - (d * 3)-5"},"once":true}︡
︠38132e4b-1fc0-4f25-8e16-d9357cac2294︠

dataset = [ 5, 10, 13, 19, 21, 25, 22, 18, 15, 13,
                11, 12, 15, 20, 18, 17, 16, 18, 23, 25 ]

for i in [0...10]
    dataset.push(Math.round(Math.random()*20))

w = 700; h = 150
barPadding = 1
svg = d.append("svg").attr(width:w,height:h)

svg.selectAll('rect')
   .data(dataset)
   .enter()
   .append('rect')
   .attr
       x      : (d, i) -> i * (w / dataset.length)
       y      : (d) -> h-d*4
       width  : w / dataset.length - barPadding
       height : (d) -> d*4
       fill   : (d) -> "rgb(#{d*10},0,0)"

svg.selectAll('text')
   .data(dataset)
   .enter()
   .append("text")
   .text( (d) -> d )
   .attr
       x : (d,i) -> i * (w / dataset.length) + (w / dataset.length - barPadding) / 2
       y : (d)   -> h - (d * 4) + 15
       "font-family": "sans-serif"
       "font-size"  : "11px"
       "fill"       : "white"
       "text-anchor": "middle"
︡71278e19-5dc2-4a7d-9d7b-787b1219bc6d︡{"html":"<div id=\"a7d7096c5-ef91-477c-aaf4-df0d13215239\" style=\"background-color:#f0f0f0\" class=\"well\"></div>"}︡{"obj":"{}","javascript":{"coffeescript":true,"code":"d=d3.select('#a7d7096c5-ef91-477c-aaf4-df0d13215239')\ndataset = [ 5, 10, 13, 19, 21, 25, 22, 18, 15, 13,\n                11, 12, 15, 20, 18, 17, 16, 18, 23, 25 ]\n\nfor i in [0...10]\n    dataset.push(Math.round(Math.random()*20))\n\nw = 700; h = 150\nbarPadding = 1\nsvg = d.append(\"svg\").attr(width:w,height:h)\n\nsvg.selectAll('rect')\n   .data(dataset)\n   .enter()\n   .append('rect')\n   .attr\n       x      : (d, i) -> i * (w / dataset.length)\n       y      : (d) -> h-d*4\n       width  : w / dataset.length - barPadding\n       height : (d) -> d*4\n       fill   : (d) -> \"rgb(#{d*10},0,0)\"\n\nsvg.selectAll('text')\n   .data(dataset)\n   .enter()\n   .append(\"text\")\n   .text( (d) -> d )\n   .attr\n       x : (d,i) -> i * (w / dataset.length) + (w / dataset.length - barPadding) / 2\n       y : (d)   -> h - (d * 4) + 15\n       \"font-family\": \"sans-serif\"\n       \"font-size\"  : \"11px\"\n       \"fill\"       : \"white\"\n       \"text-anchor\": \"middle\""},"once":true}︡
︠88d06ff6-c275-478e-810a-91b532f4f567i︠
%md
## Making a scatterplot
#### <http://alignedleft.com/tutorials/d3/making-a-scatterplot/>
︡973fa19b-a0e5-4da9-8da1-d1a9377b5593︡{"html":"<h2>Making a scatterplot</h2>\n\n<h4><a href=\"http://alignedleft.com/tutorials/d3/making-a-scatterplot/\">http://alignedleft.com/tutorials/d3/making-a-scatterplot/</a></h4>\n"}︡
︠4a928a72-a577-42f6-99fa-c56d13bc0c12︠
dataset = [
                [5, 20], [480, 90], [250, 50], [100, 33], [330, 95],
                [410, 12], [475, 44], [25, 67], [85, 21], [220, 88]
           ]

w = 700; h = 150
svg = d.append("svg").attr(width:w,height:h)
svg.selectAll('circle')
   .data(dataset)
   .enter()
   .append('circle')
   .attr
       cx : (d) -> d[0]
       cy : (d) -> d[1]
       r  : 5

svg.selectAll("text")
   .data(dataset)
   .enter()
   .append("text")
   .text((d) -> d)
   .attr
       x : (d) -> d[0]+5
       y : (d) -> d[1]-3
       "font-family": "sans-serif"
       "font-size"  : "11px"
       "fill"       : "red"
︡e24e8c33-8e31-4b19-8897-52b008c0aad2︡{"html":"<div id=\"ac92b8c55-3afb-459b-aa78-e3ea125628d2\" style=\"background-color:#f0f0f0\" class=\"well\"></div>"}︡{"obj":"{}","javascript":{"coffeescript":true,"code":"d=d3.select('#ac92b8c55-3afb-459b-aa78-e3ea125628d2')\ndataset = [\n                [5, 20], [480, 90], [250, 50], [100, 33], [330, 95],\n                [410, 12], [475, 44], [25, 67], [85, 21], [220, 88]\n           ]\n\nw = 700; h = 150\nsvg = d.append(\"svg\").attr(width:w,height:h)\nsvg.selectAll('circle')\n   .data(dataset)\n   .enter()\n   .append('circle')\n   .attr\n       cx : (d) -> d[0]\n       cy : (d) -> d[1]\n       r  : 5\n\nsvg.selectAll(\"text\")\n   .data(dataset)\n   .enter()\n   .append(\"text\")\n   .text((d) -> d)\n   .attr\n       x : (d) -> d[0]+5\n       y : (d) -> d[1]-3\n       \"font-family\": \"sans-serif\"\n       \"font-size\"  : \"11px\"\n       \"fill\"       : \"red\""},"once":true}︡
︠9c9be431-0bd3-42a1-b7fc-efb4b868b925i︠
%md
## Scales
#### <http://alignedleft.com/tutorials/d3/scales/>
︡9ee7807e-f94b-411d-a486-dc2eb2302c5b︡{"html":"<h2>Scales</h2>\n\n<h4><a href=\"http://alignedleft.com/tutorials/d3/scales/\">http://alignedleft.com/tutorials/d3/scales/</a></h4>\n"}︡
︠529f2328-0b56-4729-a64f-aa1e53c7de66︠
dataset = [ 100, 200, 300, 400, 500 ]
scale = d3.scale.linear().domain([100, 500]).range([10, 350])

d.text(scale(300)).attr(x:50, y:50)

︡80dbb3ce-b92e-4895-9375-8ba3ac3c5f03︡{"html":"<div id=\"a122a742a-6aa7-46cd-8f12-ffae8be33d0a\" style=\"background-color:#f0f0f0\" class=\"well\"></div>"}︡{"obj":"{}","javascript":{"coffeescript":true,"code":"d=d3.select('#a122a742a-6aa7-46cd-8f12-ffae8be33d0a')\ndataset = [ 100, 200, 300, 400, 500 ]\nscale = d3.scale.linear().domain([100, 500]).range([10, 350])\n\nd.text(scale(300)).attr(x:50, y:50)"},"once":true}︡
︠351a8244-cc89-4b41-b984-29f765c36704︠


dataset = [
                [5, 20], [480, 90], [250, 50], [100, 33], [330, 95],
                [410, 12], [475, 44], [25, 67], [85, 21], [220, 88],
                [600,150]
           ]


w = 600; h = 300; padding = 20

xScale = d3.scale.linear()
    .domain([0, d3.max(dataset, (d) -> d[0])]).range([padding, w-padding*2])
yScale = d3.scale.linear()
    .domain([0, d3.max(dataset, (d) -> d[1])]).range([h-padding, padding])
rScale = d3.scale.linear()
    .domain([0, d3.max(dataset, (d) -> d[1])]).range([2,5])

svg = d.append("svg").attr(width:w,height:h)
svg.selectAll('circle')
   .data(dataset)
   .enter()
   .append('circle')
   .attr
       cx : (d) -> xScale(d[0])
       cy : (d) -> yScale(d[1])
       r  : (d) -> rScale(d[1])

svg.selectAll("text")
   .data(dataset)
   .enter()
   .append("text")
   .text((d) -> d)
   .attr
       x : (d) -> xScale(d[0])
       y : (d) -> yScale(d[1])
       "font-family": "sans-serif"
       "font-size"  : "11px"
       "fill"       : "red"
︡8d8966ad-8ad5-404f-b65f-5d6421f0946b︡{"html":"<div id=\"a11c3a4a6-76ad-4419-b5f1-6c8df0a10c2f\" style=\"background-color:#f0f0f0\" class=\"well\"></div>"}︡{"obj":"{}","javascript":{"coffeescript":true,"code":"d=d3.select('#a11c3a4a6-76ad-4419-b5f1-6c8df0a10c2f')\ndataset = [\n                [5, 20], [480, 90], [250, 50], [100, 33], [330, 95],\n                [410, 12], [475, 44], [25, 67], [85, 21], [220, 88],\n                [600,150]\n           ]\n\n\nw = 600; h = 300; padding = 20\n\nxScale = d3.scale.linear()\n    .domain([0, d3.max(dataset, (d) -> d[0])]).range([padding, w-padding*2])\nyScale = d3.scale.linear()\n    .domain([0, d3.max(dataset, (d) -> d[1])]).range([h-padding, padding])\nrScale = d3.scale.linear()\n    .domain([0, d3.max(dataset, (d) -> d[1])]).range([2,5])\n\nsvg = d.append(\"svg\").attr(width:w,height:h)\nsvg.selectAll('circle')\n   .data(dataset)\n   .enter()\n   .append('circle')\n   .attr\n       cx : (d) -> xScale(d[0])\n       cy : (d) -> yScale(d[1])\n       r  : (d) -> rScale(d[1])\n\nsvg.selectAll(\"text\")\n   .data(dataset)\n   .enter()\n   .append(\"text\")\n   .text((d) -> d)\n   .attr\n       x : (d) -> xScale(d[0])\n       y : (d) -> yScale(d[1])\n       \"font-family\": \"sans-serif\"\n       \"font-size\"  : \"11px\"\n       \"fill\"       : \"red\""},"once":true}︡
︠5c7cc98b-9404-493e-b092-e31efd3dbfcbi︠

%md
## Axes
#### <http://alignedleft.com/tutorials/d3/axes/>
︡dcb56338-07ea-4438-be8a-178aa008ede0︡{"html":"<h2>Axes</h2>\n\n<h4><a href=\"http://alignedleft.com/tutorials/d3/axes/\">http://alignedleft.com/tutorials/d3/axes/</a></h4>\n"}︡
︠ab5d23cc-bcfb-412b-a6fb-ce2dcfb950c5︠


︡ec0a98d7-2eaf-409e-befc-d7bfc178db90︡
︠342364e5-0a29-4be9-a9fe-4b174838c5bf︠
%d3(css="""
.axis path,
    .axis line {
        fill: none;
        stroke: black;
        shape-rendering: crispEdges;
    }

    .axis text {
        font-family: sans-serif;
        font-size: 11px;
    }
""")

dataset = [
                [5, 20], [480, 90], [250, 50], [100, 33], [330, 95],
                [410, 12], [475, 44], [25, 67], [85, 21], [220, 88],
                [600,150]
           ]

w = 600; h = 300; padding = 40

xScale = d3.scale.linear()
    .domain([0, d3.max(dataset, (d) -> d[0])]).range([padding, w-padding*2])
yScale = d3.scale.linear()
    .domain([0, d3.max(dataset, (d) -> d[1])]).range([h-padding, padding])
rScale = d3.scale.linear()
    .domain([0, d3.max(dataset, (d) -> d[1])]).range([2,5])

xAxis = d3.svg.axis().scale(xScale).orient('bottom')
yAxis = d3.svg.axis().scale(yScale).orient('left')

svg = d.append("svg").attr(width:w,height:h)

svg.append('g')
   .attr("class", "axis")
   .attr("transform", "translate(0,#{h - padding})")
   .call(xAxis)

svg.append('g')
   .attr("class", "axis")
   .attr("transform", "translate(#{padding},0)")
   .call(yAxis)

svg.selectAll('circle')
   .data(dataset)
   .enter()
   .append('circle')
   .attr
       cx : (d) -> xScale(d[0])
       cy : (d) -> yScale(d[1])
       r  : (d) -> rScale(d[1])
︡53bfc49a-bb2d-4b86-9d53-318f30e21a35︡{"html":"<div id=\"a682a9c53-52ee-49fc-84fa-230a4e863a88\" style=\"background-color:#f0f0f0\" class=\"well\"></div><style type=\"text/css\">\n.axis path,\n    .axis line {\n        fill: none;\n        stroke: black;\n        shape-rendering: crispEdges;\n    }\n\n    .axis text {\n        font-family: sans-serif;\n        font-size: 11px;\n    }\n</style>"}︡{"obj":"{}","javascript":{"coffeescript":true,"code":"d=d3.select('#a682a9c53-52ee-49fc-84fa-230a4e863a88')\n\ndataset = [\n                [5, 20], [480, 90], [250, 50], [100, 33], [330, 95],\n                [410, 12], [475, 44], [25, 67], [85, 21], [220, 88],\n                [600,150]\n           ]\n\nw = 600; h = 300; padding = 40\n\nxScale = d3.scale.linear()\n    .domain([0, d3.max(dataset, (d) -> d[0])]).range([padding, w-padding*2])\nyScale = d3.scale.linear()\n    .domain([0, d3.max(dataset, (d) -> d[1])]).range([h-padding, padding])\nrScale = d3.scale.linear()\n    .domain([0, d3.max(dataset, (d) -> d[1])]).range([2,5])\n\nxAxis = d3.svg.axis().scale(xScale).orient('bottom')\nyAxis = d3.svg.axis().scale(yScale).orient('left')\n\nsvg = d.append(\"svg\").attr(width:w,height:h)\n\nsvg.append('g')\n   .attr(\"class\", \"axis\")\n   .attr(\"transform\", \"translate(0,#{h - padding})\")\n   .call(xAxis)\n\nsvg.append('g')\n   .attr(\"class\", \"axis\")\n   .attr(\"transform\", \"translate(#{padding},0)\")\n   .call(yAxis)\n\nsvg.selectAll('circle')\n   .data(dataset)\n   .enter()\n   .append('circle')\n   .attr\n       cx : (d) -> xScale(d[0])\n       cy : (d) -> yScale(d[1])\n       r  : (d) -> rScale(d[1])"},"once":true}︡
︠bbcf1fbc-d7e6-4af2-8fdd-8e2849e82364︠

%d3(css="""
.axis path,
    .axis line {
        fill: none;
        stroke: black;
        shape-rendering: crispEdges;
    }

    .axis text {
        font-family: sans-serif;
        font-size: 11px;
    }
""")

numDataPoints = 50
dataset = ( [Math.random()*1000, Math.random()*1000] for i in [0...numDataPoints] )

w = 600; h = 300; padding = 40

xScale = d3.scale.linear()
    .domain([0, d3.max(dataset, (d) -> d[0])]).range([padding, w-padding*2])
yScale = d3.scale.linear()
    .domain([0, d3.max(dataset, (d) -> d[1])]).range([h-padding, padding])
rScale = d3.scale.linear()
    .domain([0, d3.max(dataset, (d) -> d[1])]).range([2,5])

xAxis = d3.svg.axis().scale(xScale).orient('bottom').ticks(5)
yAxis = d3.svg.axis().scale(yScale).orient('left').ticks(5)

svg = d.append("svg").attr(width:w,height:h)

svg.append('g')
   .attr("class", "axis")
   .attr("transform", "translate(0,#{h - padding})")
   .call(xAxis)

svg.append('g')
   .attr("class", "axis")
   .attr("transform", "translate(#{padding},0)")
   .call(yAxis)

svg.selectAll('circle')
   .data(dataset)
   .enter()
   .append('circle')
   .attr
       cx : (d) -> xScale(d[0])
       cy : (d) -> yScale(d[1])
       r  : (d) -> rScale(d[1])
︡343767ee-b32a-4904-9ab4-7a493bb7125c︡{"html":"<div id=\"af571775f-a273-465b-8756-fe3b52c45faa\" style=\"background-color:#f0f0f0\" class=\"well\"></div><style type=\"text/css\">\n.axis path,\n    .axis line {\n        fill: none;\n        stroke: black;\n        shape-rendering: crispEdges;\n    }\n\n    .axis text {\n        font-family: sans-serif;\n        font-size: 11px;\n    }\n</style>"}︡{"obj":"{}","javascript":{"coffeescript":true,"code":"d=d3.select('#af571775f-a273-465b-8756-fe3b52c45faa')\n\nnumDataPoints = 50\ndataset = ( [Math.random()*1000, Math.random()*1000] for i in [0...numDataPoints] )\n\nw = 600; h = 300; padding = 40\n\nxScale = d3.scale.linear()\n    .domain([0, d3.max(dataset, (d) -> d[0])]).range([padding, w-padding*2])\nyScale = d3.scale.linear()\n    .domain([0, d3.max(dataset, (d) -> d[1])]).range([h-padding, padding])\nrScale = d3.scale.linear()\n    .domain([0, d3.max(dataset, (d) -> d[1])]).range([2,5])\n\nxAxis = d3.svg.axis().scale(xScale).orient('bottom').ticks(5)\nyAxis = d3.svg.axis().scale(yScale).orient('left').ticks(5)\n\nsvg = d.append(\"svg\").attr(width:w,height:h)\n\nsvg.append('g')\n   .attr(\"class\", \"axis\")\n   .attr(\"transform\", \"translate(0,#{h - padding})\")\n   .call(xAxis)\n\nsvg.append('g')\n   .attr(\"class\", \"axis\")\n   .attr(\"transform\", \"translate(#{padding},0)\")\n   .call(yAxis)\n\nsvg.selectAll('circle')\n   .data(dataset)\n   .enter()\n   .append('circle')\n   .attr\n       cx : (d) -> xScale(d[0])\n       cy : (d) -> yScale(d[1])\n       r  : (d) -> rScale(d[1])"},"once":true}︡
︠ab686ee7-cbd5-4449-ae9a-979ae6d2140a︠









