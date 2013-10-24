︠a521e768-8b68-4210-8677-78c891e861d3i︠
%md
# Octave Sage Worksheet Tutorial
- This is simply all the code from  <http://volga.eng.yale.edu/sohrab/matlab_tutorial.html>
- Go to the above site for more explanations.
- Press shift-enter to evaluate code below and move to the next cell; press alt-enter to evaluate in place.
- Double click on text between cells to edit it (it's markdown format)
︡9bdd2c50-2eaf-4cc3-849c-b44157190a49︡{"html":"<h1>Octave Sage Worksheet Tutorial</h1>\n\n<ul>\n<li>This is simply all the code from  <a href=\"http://volga.eng.yale.edu/sohrab/matlab_tutorial.html\">http://volga.eng.yale.edu/sohrab/matlab_tutorial.html</a></li>\n<li>Go to the above site for more explanations.</li>\n<li>Press shift-enter to evaluate code below and move to the next cell; press alt-enter to evaluate in place.</li>\n<li>Double click on text between cells to edit it (it&#8217;s markdown format)</li>\n</ul>\n"}︡
︠2142b7e6-e37d-48cb-85f0-3d677d2d0332a︠
# Set the default mode to octave, which makes this an octave worksheet.
%auto
%default_mode octave
︡37787908-9d74-4399-bbaa-f39c1f167c8c︡{"auto":true}︡
︠72fe9baf-e4ef-4336-85e7-c1733f50b4f9i︠
%md 
## Vectors and matrices
︡af24050a-4313-4377-ac1f-b83734735134︡{"html":"<h2>Vectors and matrices</h2>\n"}︡
︠244487ee-cf47-4427-9e5d-d646fc7eba27︠
w = [1 2
     3 4]
︡39820170-20c2-4d1b-8939-13963b6111dc︡{"stdout":"\nw =\n\n 1 2\n 3 4\n\n\n"}︡
︠55e7dfbe-e374-4e75-af8a-24d9cc1b18f8︠
z = [5
     6
     7]
︡eb249ea0-2f74-4a38-a905-d4c286b420e7︡{"stdout":"\n\nz =\n\n 5\n 6\n 7\n\n\n"}︡
︠d8954297-9f20-474b-95ca-035f81c1c35ei︠
%md
## Complex numbers and complex conjugation

︡16e63763-0232-4f98-9893-75446649726b︡{"html":"<h2>Complex numbers and complex conjugation</h2>\n"}︡
︠06410b6a-72cb-4e4e-886a-8edac727602d︠
z = 2+3*i
conj(z)
︡aa8574a3-cd36-4f91-969a-b03f88d2b85e︡{"stdout":"z = (2,3)\nans = (2,-3)\n"}︡
︠0682be13-c505-4007-b448-8511d03c40b6︠
z'
︡7eab3e62-aebb-4915-9ee9-1de310090621︡{"stdout":"ans = (2,-3)\n"}︡
︠1a4a6bae-4fd0-41fd-8dc9-bfaea3e6ededi︠
%md
## Transposition and Hermitian conjugation
︡929cd6d6-9147-4ea6-9bd4-c2d4a2927544︡{"html":"<h2>Transposition and Hermitian conjugation</h2>\n"}︡
︠e664d6be-fe62-4893-9d07-89bde129a879︠
M=[1+i,2;3,4]
M'
︡2dae884d-51eb-46f0-882a-7ad9ba625cdd︡{"stdout":"M =\n\n (1,1) (2,0)\n (3,0) (4,0)\n\n\nans =\n\n (1,-1) (3,-0)\n (2,-0) (4,-0)\n\n\n"}︡
︠c8c3be39-1a21-485a-8cdb-070c127d9899i︠
%md
## Reducing and paging matlab screen output

Put semicolon to silence output.
︡85a613b3-d7f7-43eb-b345-2e244f60a182︡{"html":"<h2>Reducing and paging matlab screen output</h2>\n\n<p>Put semicolon to silence output.</p>\n"}︡
︠d9ce6830-c0e3-4619-9f01-c527a2faf4a2︠
v=[1 2 3];
︡fa0170b2-dac3-4de7-b05b-1cb15807fdc2︡{"stdout":"\n"}︡
︠54c19d22-a5a9-43b0-9e84-2fc8bf8e90d1i︠
%md
## Creating a program file: .m files
- Using the editor, I wrote a small file `myfirst.m`
- Load it as follows, which sets `a`, `b`, `c`.
- NOTE: the sage octave interface doesn't correctly set the current working directory for loading scripts, which is why we do the cd below.  You have to set the path below to wherever you are running this worksheet.  This is very ugly, and will get fixed...

︡b6bfcbf8-4aef-492f-858e-7de7aeb6cea6︡{"html":"<h2>Creating a program file: .m files</h2>\n\n<ul>\n<li>Using the editor, I wrote a small file <code>myfirst.m</code></li>\n<li>Load it as follows, which sets <code>a</code>, <code>b</code>, <code>c</code>.</li>\n<li>NOTE: the sage octave interface doesn&#8217;t correctly set the current working directory for loading scripts, which is why we do the cd below.  You have to set the path below to wherever you are running this worksheet.  This is very ugly, and will get fixed&#8230;</li>\n</ul>\n"}︡
︠1f57a583-9afa-4076-9902-d7ae9eb56a6a︠
cd(); cd('sage-cloud-templates/octave'); pwd()
︡8dddf37e-66cc-4a79-9573-c0482b99540c︡{"stdout":"ans = /mnt/home/teaAuZ9M/sage-cloud-templates/octave\n"}︡
︠39ed6be3-f1f0-48a5-9ce3-1563bdf56c1c︠
myfirst

︡441d395d-c039-4518-a3e0-f64c316d4387︡{"stdout":"\n"}︡
︠249d17fa-6bac-4bc5-9402-49f372540816︠
a, b, c
︡34bbc7e7-3afa-47d6-a840-e90e1bace6cd︡{"stdout":"a = 2\nb = 3\nc = 5\n"}︡
︠3c105734-1db4-45a9-b04c-535af6ca1805i︠
%md
## Creating a vector of equally spaced numbers
︡7bf2995d-f067-48b6-adb0-5b334dc59a0e︡{"html":"<h2>Creating a vector of equally spaced numbers</h2>\n"}︡
︠b92c6e0d-cfc4-47e0-82b6-c9d46d9507f4︠
[3:3:12]
︡304b6064-ac1e-4995-927d-f0ed016ccefd︡{"stdout":"ans =\n\n 3 6 9 12\n\n\n"}︡
︠458f1dbd-f931-4097-b92f-940de6e99d59︠
linspace(3, 12, 3)
︡9ff1fd7a-58aa-4789-aed2-1549d349b1d2︡{"stdout":"ans =\n\n 3 7.5 12\n\n\n"}︡
︠1e89a19f-a66a-4943-950d-34fb636d5539i︠
%md
## Selecting parts of vectors and matrices: the colon operator
︡366014d6-13d0-437b-ab3f-be314acdc3d9︡{"html":"<h2>Selecting parts of vectors and matrices: the colon operator</h2>\n"}︡
︠fbda8430-486e-4e5c-a6e9-998fe2221317︠
v = 1:10;
w = v(2:5);
v(1:4) = w;
v, w
︡2fe7a98b-1740-40f3-8cad-35be5336a440︡{"stdout":"\n\n\nv =\n\n 2 3 4 5 5 6 7 8 9 10\n\n\nw =\n\n 2 3 4 5\n\n\n"}︡
︠6c1b720f-634e-4ee2-8cc0-2f8aad077ed1︠
M = rand(5)
︡5501b777-38e3-4827-8d82-f686ad1515a3︡{"stdout":"\n 0.936444 0.408223 0.0792802 0.120729 0.686016\n 0.648213 0.329586 0.842031 0.343852 0.505076\n 0.103871 0.205018 0.564111 0.720999 0.0475961\n 0.111617 0.584033 0.0621617 0.805288 0.358781\n 0.638088 0.328756 0.812207 0.686526 0.50059\n\n\n"}︡
︠5fedad16-1ce5-4e6e-b35c-6d73b8e83408︠
M(2:5,1:3)   % a 4 x 3 submatrix of M
︡246f5371-608f-4e00-8ae1-b18d98095e6b︡{"stdout":"M =\n\n 0.74116 0.357223 0.796885 0.642807 0.44094\n 0.324165 0.209321 0.780547 0.638626 0.48057\n 0.52199 0.466731 0.363482 0.270519 0.680753\n 0.973528 0.161067 0.793242 0.427292 0.0214446\n 0.289777 0.734638 0.423491 0.510815 0.658672\n\n\n"}︡
︠9acbf07d-29ea-4ebb-b4b4-381d93afbfcb︠
M(:,4)       % 4th column of M
︡3a4ced4b-b8b3-425a-8a15-c516f362b4ae︡{"stdout":"ans =\n\n 0.324165 0.209321 0.780547\n 0.52199 0.466731 0.363482\n 0.973528 0.161067 0.793242\n 0.289777 0.734638 0.423491\n\n\n"}︡
︠b4746df5-fc51-42a7-b88a-c0e65b854fef︠
M(2:4,:)     % the second through fourth rows of M as a submatrix
︡653c49b0-95e5-4f9a-b16e-89d2cc6d32c2︡{"stdout":"ans =\n\n 0.642807\n 0.638626\n 0.270519\n 0.427292\n 0.510815\n\n\n"}︡
︠ba1a019f-b41d-4df1-a39d-92bad7ed7b7bi︠
%md
## Creating identity and zero matrices

︡fb760117-1a90-4c9b-a214-b1b90dc9ae64︡{"html":"<h2>Creating identity and zero matrices</h2>\n"}︡
︠9f4cd2e2-ad20-4cd7-a170-ad6bdf627c81︠
eye(4)
︡c3c02ee4-8dac-4964-b95c-3aa9405643ce︡{"stdout":"ans =\n\n 1 0 0 0\n 0 1 0 0\n 0 0 1 0\n 0 0 0 1\n\n\n"}︡
︠245845eb-8fad-4ebd-a91c-b1afbe5c145b︠
zeros(2,5)

︡b13cf42b-8e27-46fc-a827-fe39a1468ce3︡{"stdout":"ans =\n\n 1 0 0 0\n 0 1 0 0\n 0 0 1 0\n 0 0 0 1\n\n\n"}︡
︠d1b469b8-aac1-4433-be72-4e4723ba73e6i︠
%md
## Creating a vector or matrix full of ones
︡5acf7d60-35c4-4903-ad96-c1b998c4b49c︡{"html":"<h2>Creating a vector or matrix full of ones</h2>\n"}︡
︠f87ae286-7bf7-42be-a6aa-0ba6c1e42854︠
ones(2,5)
︡1b4a4df5-1ce5-4fa3-bdfd-7b23bbfb12d8︡{"stdout":"ans =\n\n 0 0 0 0 0\n 0 0 0 0 0\n\n\n"}︡
︠3ebadd2d-a862-42c7-ac5d-ac20757f51c7i︠
%md
## Creating a diagonal matrix
︡329f13c2-7c00-40fd-b105-94c8901d2f66︡{"html":"<h2>Creating a diagonal matrix</h2>\n"}︡
︠101bbb07-6c72-4012-9dfa-267e66eed0c6︠
diag([1,2,3])

︡e530736e-8c06-4994-9090-4cfd843383e8︡{"stdout":"ans =\n\n 1 1 1 1 1\n 1 1 1 1 1\n\n\n"}︡
︠2fd53541-9c33-4c8b-8890-195ad8c2634bi︠
%md
## Creating off diagonal/triangular matrices

︡0d1c2ec7-5404-4470-8bf6-dbc2cecfd3b3︡{"html":"<h2>Creating off diagonal/triangular matrices</h2>\n"}︡
︠ce573a3f-af16-40c3-9b42-255e8426ecef︠
M = diag([10 20 30 40 50]) + diag([-3 -4 -5 -6],1)


︡7cedb702-c965-417f-af11-0996573480f9︡{"stdout":"ans =\n\n 10 -3 0 0 0\n 0 20 -4 0 0\n 0 0 30 -5 0\n 0 0 0 40 -6\n 0 0 0 0 50\n\n\n"}︡
︠90c50039-4d93-4f5e-b5e6-c66b093fa979i︠
%md
## Inverting a matrix
︡321c015c-3480-4c46-9440-5fb305da8551︡{"html":"<h2>Inverting a matrix</h2>\n"}︡
︠96ed3575-a3f7-425b-af5f-dc19eeb370a6︠
A = inv(M); A
︡8f9292e2-a65a-4853-ad66-b59f2352722d︡{"stdout":"A =\n\n 0.1 0.015 0.002 0.00025 3e-05\n 0 0.05 0.00666667 0.000833333 0.0001\n 0 0 0.0333333 0.00416667 0.0005\n 0 0 0 0.025 0.003\n 0 0 0 0 0.02\n\n\n"}︡
︠f2e081df-b607-4a0e-8025-d32b78d98375i︠
%md
## Diagonalizing a matrix
︡04018db4-11ca-47c7-bf08-ff97cd56dd79︡{"html":"<h2>Diagonalizing a matrix</h2>\n"}︡
︠21cc7f6b-44c2-4bc9-890f-c5ac98b7b34d︠
M = rand(4);
e = eig(M)
︡0b00c2a2-8eaa-4f96-9bbd-6eb52d0cfb42︡{"stdout":"A =\n\n 0.1 0.015 0.002 0.00025 3e-05\n 0 0.05 0.00666667 0.000833333 0.0001\n 0 0 0.0333333 0.00416667 0.0005\n 0 0 0 0.025 0.003\n 0 0 0 0 0.02\n\n\ne = eig(M)\n"}︡
︠cb0d78ed-61bc-4d79-ad02-bc00ae02a3ff︠
[v,e] = eig(M)
︡9fdfddd0-0025-4055-bf53-3236a21e4823︡{"stdout":"\n 1.71399\n 0.183105\n -0.269172\n -0.130517\n\n\n"}︡
︠c65e7abc-8105-437c-ad2f-97c2b6e3644fi︠
%md
## Programming
︡479405fc-62ee-4b57-832a-ff708c5fd91e︡{"html":"<h2>Programming</h2>\n"}︡
︠505fa4f7-bffc-4a8f-9e4d-2572490f069a︠
for j=1:5
    2*j+1
end
︡af1c373d-0453-463d-8bfc-49a593230bfc︡{"stdout":"ans = 3\nans = 5\nans = 7\nans = 9\nans = 11\n    2*j+1\n\n"}︡
︠9d41ead6-a26d-48e5-8333-54d7065ed7b1︠
n = 3
v = 0
for j=1:n
    v(j) = j^2;
end
v    
︡c7163841-7f8e-4abf-b3da-e6f067afaebb︡{"stdout":"n = 3\nv = 0\n\n\n\nv =\n\n 1 4 9\n\n\n"}︡
︠6117a4a3-8cf8-457e-ac46-b0c8320461e9︠
n = 3;
M = 0;
for j=1:n
  for k=1:n
     M(j,k) = 2*j^2 + cos(k*j*pi/50);
  end
end
M
︡e3a223c1-80ca-4ed2-bc9c-9c0beec885b9︡{"stdout":"\n\n\n\n\n\n\nM =\n\n 2.99803 2.99211 2.98229\n 8.99211 8.96858 8.92978\n 18.9823 18.9298 18.8443\n\n\n"}︡
︠ec129582-783b-483f-99ad-5cc4b489c22f︠

︠d4e8dea6-d767-43d8-a54f-6052e42f008di︠
%md
# Drawing graphics

- it's not smooth yet
- use the figure command, then show the image in *another* cell. 
- see comment above about setting this path
︡1670f1d6-bf04-430b-a34e-f5ad6cbbb6cf︡{"html":"<h1>Drawing graphics</h1>\n\n<ul>\n<li>it&#8217;s not smooth yet</li>\n<li>use the figure command, then show the image in <em>another</em> cell. </li>\n<li>see comment above about setting this path</li>\n</ul>\n"}︡
︠b4682c5c-e16f-4f16-86be-d79d30c20f1b︠
cd(); cd('sage-cloud-templates/octave'); pwd()
h = figure('visible', 'off');
surf(peaks);
saveas(h,"figure1.png");
︡63324aa7-c3b6-4905-9013-f0ce2407afb5︡{"stdout":"\n\n"}︡{"stdout":"\n"}︡
︠ce16cd52-4c95-4379-b7d1-0d204a4f65a5︠
%sage salvus.file("figure1.png")
︡ef47c1d7-8cad-4a5c-bcf5-7c748800d2d4︡{"once":false,"file":{"show":true,"uuid":"ad59f22b-00b3-4ab5-a4ed-7c5970d656b3","filename":"figure1.png"}}︡
︠680b7afd-7e99-4b97-81f7-6e535f5d4038︠
cd(); cd('sage-cloud-templates/octave'); pwd()
M = rand(10);
h = figure('visible', 'off');
plot(M);
saveas(h,"figure2.png");
︡7cdd4124-2d54-4275-aefa-adcaa7e6fa3d︡{"stdout":"ans = /mnt/home/teaAuZ9M/sage-cloud-templates/octave"}︡{"stdout":"\n"}︡
︠6bf57e4c-f987-4202-b41f-8ba1ca7fabdb︠
%sage salvus.file("figure2.png")
︡e9096630-cff8-4e60-a256-b99a1d79da15︡{"once":false,"file":{"show":true,"uuid":"4c4ae919-0548-4f0d-a4ef-dafb55c050c8","filename":"figure2.png"}}︡
︠08832df5-d54a-4992-8499-9b81c7e33f5d︠









