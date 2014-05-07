︠73d9cd7e-11d8-4f5f-8072-2517fce80b1di︠
%md
## Example of a standard Javascript/HTML/CSS application in a worksheet.

 - Edit the files app.html, app.css and app.js, then evaluate the cell below.


︡09c1e655-83cf-4482-8554-2f5629c87ac9︡{"html":"<h2>Example of a standard Javascript/HTML/CSS application in a worksheet.</h2>\n\n<ul>\n<li>Edit the files app.html, app.css and app.js, then evaluate the cell below.</li>\n</ul>\n"}︡
︠208a9eb0-e3d1-471a-a9de-357e0f005e45︠
%load app.html app.css
sleep(0.1); salvus.javascript(open('app.js').read())  # I'll later make it so you can do '%load app.js'...

︡f85a3db0-1b42-4836-a598-b145bf889f8d︡{"once":false,"file":{"show":false,"uuid":"ea60a5a9-248a-49dc-a6f5-e1ca54581d9b","filename":"app.html"}}︡{"obj":"{}","javascript":{"coffeescript":false,"code":"opts.element.append($(\"<div>\").load(\"/blobs/app.html?uuid=ea60a5a9-248a-49dc-a6f5-e1ca54581d9b\"))"},"once":false}︡{"once":false,"file":{"show":false,"uuid":"6eb51297-400c-45d5-9ef3-a5c356f7e731","filename":"app.css"}}︡{"obj":"{}","javascript":{"coffeescript":false,"code":"$.get(\"/blobs/app.css?uuid=6eb51297-400c-45d5-9ef3-a5c356f7e731\", function(css) { $('<style type=text/css></style>').html(css).appendTo(\"body\")});"},"once":false}︡{"obj":"{}","javascript":{"coffeescript":false,"code":"$(\".app-button\").click(function(e) {\n\n    n = parseFloat($(\".app-input\").val());\n\n    worksheet.execute_code({\n        code: \"salvus.data['n'] * random()\",\n        data: {n:n},\n        preparse: false,\n        cb : function(mesg) {\n            console.log(mesg);\n            if (mesg.stdout) {\n                $(\".app-output\").append(mesg.stdout);\n            }\n        }\n    })\n})"},"once":false}︡
︠cd8cb026-c432-4ce1-ae37-86be83a57851︠


︡b930b5c4-4684-46d7-9e70-2a6dbe671523︡{"obj":"{}","javascript":{"coffeescript":false,"code":"$(\".app-button\").click(function(e) {\n\n    worksheet.execute_code({\n        code: \"salvus.data['n'] * random()\",\n        data: {n:5},\n        preparse: false,\n        cb : function(mesg) {\n            console.log(mesg);\n            if (mesg.stdout) {\n                $(\".app-output\").append(mesg.stdout);\n            }\n        }\n    })\n})"},"once":false}︡
︠9290a7fc-3e57-4523-b594-a71b2b22745f︠









