︠17fa1ee7-9bf7-4723-a5e2-3779f4fbfbd5i︠
%md
Linux Primer
------------

Underneath everything in the Sagemath Cloud sits the free open-source operating system [Linux](http://www.linux.org).
It is a very powerful system which powers everything from smartphones, desktop computers, large servers and supercomputers.
In order to make this power useful, software applications run under your identity and interact with Linux.
For example, they can read files from a storage system, the loaded data in memory can be modified, the
application reacts dynamically to input and finally produces human readable output or stores data back to files.

Most of the time, application interfaces like the very *Sage Worksheet* you are currently viewing is more than enough for your needs.
**But**: There are cases, where you might need a specific task or feature, which you cannot reach from that high level of abstractions.

Hence, the following introduction goes a little bit deeper and explains a few common "*command line utilities*".
They open up a new world, which is much closer to the actual operating system.
This allows for much more flexibility and makes this powerful system more useful for you.

Last words before we start: The following is neither fancy nor new -
it is rather a collection of everyday tools like in a real-world toolbox.
Combined and with some experience, they allow you to accomplish a vast variety of tasks.

Also, don't be scared. Sagemath Cloud's unique snapshot feature can rescue all files that get damaged or dissapear during your explorations ;-)
︡fd08ba97-b7b3-4c31-abf0-c73ffaa7055f︡{"html":"<h2>Linux Primer</h2>\n\n<p>Underneath everything in the Sagemath Cloud sits the free open-source operating system <a href=\"http://www.linux.org\">Linux</a>.\nIt is a very powerful system which powers everything from smartphones, desktop computers, large servers and supercomputers.\nIn order to make this power useful, software applications run under your identity and interact with Linux.\nFor example, they can read files from a storage system, the loaded data in memory can be modified, the\napplication reacts dynamically to input and finally produces human readable output or stores data back to files.</p>\n\n<p>Most of the time, application interfaces like the very <em>Sage Worksheet</em> you are currently viewing is more than enough for your needs.\n<strong>But</strong>: There are cases, where you might need a specific task or feature, which you cannot reach from that high level of abstractions.</p>\n\n<p>Hence, the following introduction goes a little bit deeper and explains a few common &#8220;<em>command line utilities</em>&#8221;.\nThey open up a new world, which is much closer to the actual operating system.\nThis allows for much more flexibility and makes this powerful system more useful for you.</p>\n\n<p>Last words before we start: The following is neither fancy nor new -\nit is rather a collection of everyday tools like in a real-world toolbox.\nCombined and with some experience, they allow you to accomplish a vast variety of tasks.</p>\n\n<p>Also, don&#8217;t be scared. Sagemath Cloud&#8217;s unique snapshot feature can rescue all files that get damaged or dissapear during your explorations ;-)</p>\n"}︡
︠58de95cf-7ae9-4f1a-8fab-1af765b89899i︠
%md
### Note

The following examples are in cells that start with **`%sh`**.
That "magic" annotation tells the Sage Notebook to run the content of the cell inside the most famous Linux terminal, called ***bash***.
︡f7f285d9-dbea-48d2-96c9-81c963b9e81a︡{"html":"<h3>Note</h3>\n\n<p>The following examples are in cells that start with <strong><code>%sh</code></strong>.\nThat &#8220;magic&#8221; annotation tells the Sage Notebook to run the content of the cell inside the most famous Linux terminal, called <strong><em>bash</em></strong>.</p>\n"}︡
︠59c2161c-0049-4aa5-95a7-71e8925c0ccfi︠
%md
### Your way around the filesystem

A single "*file*" is a stream of data (mathematican's can think of it as a vector of bytes) which has a name, a date and some other properties.
The so called "*file system*" is an organization tool for all these individual files, where files are collected in "*directories*".
All those directories are organized in a hierarchy, where the common topmost ancestor is the `/`.
Therefore, all paths to files start with that slash and the intermediate levels are these directories.

Examples:

* /home/alice/file1
* /etc/fstab
* /usr/bin/bash
︡04672af5-c988-4fde-9d36-fa51cbb4ac97︡{"html":"<h3>Your way around the filesystem</h3>\n\n<p>A single &#8220;<em>file</em>&#8221; is a stream of data (mathematican&#8217;s can think of it as a vector of bytes) which has a name, a date and some other properties.\nThe so called &#8220;<em>file system</em>&#8221; is an organization tool for all these individual files, where files are collected in &#8220;<em>directories</em>&#8221;.\nAll those directories are organized in a hierarchy, where the common topmost ancestor is the <code>/</code>.\nTherefore, all paths to files start with that slash and the intermediate levels are these directories.</p>\n\n<p>Examples:</p>\n\n<ul>\n<li>/home/alice/file1</li>\n<li>/etc/fstab</li>\n<li>/usr/bin/bash</li>\n</ul>\n"}︡
︠42d7df3e-7a34-4910-8a84-5ebaaad4c4e1︠
%sh
# lines starting with # are comments, they are ignored but will explain to you what's going on!
# pwd = print working directory
# pwd tells you, where you are.
pwd
︡1bd3b702-5598-4a07-97c4-22b64f86678d︡{"stdout":"/mnt/home/2Qrdjpk5\n"}︡
︠adfd0f17-d234-4ebb-bf6f-8f6fd8e5cb2a︠
%md










