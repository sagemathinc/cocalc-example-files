︠a521e768-8b68-4210-8677-78c891e861d3i︠
%md
# Octave Sage Worksheet Tutorial
- This is simply all the code from  <http://volga.eng.yale.edu/sohrab/matlab_tutorial.html>
- Go to the above site for more explanations.
- Press shift-enter to evaluate code below and move to the next cell; press alt-enter to evaluate in place.
- Double click on text between cells to edit it (it's markdown format)
︡9bdd2c50-2eaf-4cc3-849c-b44157190a49︡︡{"done":true,"md":"# Octave Sage Worksheet Tutorial\n- This is simply all the code from  <http://volga.eng.yale.edu/sohrab/matlab_tutorial.html>\n- Go to the above site for more explanations.\n- Press shift-enter to evaluate code below and move to the next cell; press alt-enter to evaluate in place.\n- Double click on text between cells to edit it (it's markdown format)"}
︠2142b7e6-e37d-48cb-85f0-3d677d2d0332as︠
# Set the default mode to octave, which makes this an octave worksheet.
%auto
%default_mode octave
︡e65bff38-0152-4122-8956-c3346e441289︡︡{"stdout":"\n\n","done":false}︡{"done":true}
︠72fe9baf-e4ef-4336-85e7-c1733f50b4f9i︠
%md 
## Vectors and matrices
︡af24050a-4313-4377-ac1f-b83734735134︡︡{"done":true,"md":"## Vectors and matrices"}
︠244487ee-cf47-4427-9e5d-d646fc7eba27s︠
w = [1 2
     3 4]
︡8e17689d-037c-4a06-8ef4-936259a75b23︡︡{"stdout":"\nw =\n\n 1 2\n 3 4\n\n","done":false}︡{"done":true}
︠55e7dfbe-e374-4e75-af8a-24d9cc1b18f8s︠
z = [5
     6
     7]
︡53a96f2d-9a6b-4f49-ace5-df935b0eb90b︡︡{"stdout":"\n\nz =\n\n 5\n 6\n 7\n\n","done":false}︡{"done":true}
︠d8954297-9f20-474b-95ca-035f81c1c35ei︠
%md
## Complex numbers and complex conjugation

︡16e63763-0232-4f98-9893-75446649726b︡︡{"done":true,"md":"## Complex numbers and complex conjugation"}
︠06410b6a-72cb-4e4e-886a-8edac727602ds︠
z = 2+3*i
conj(z)
︡7bf607e9-eb3f-4dd1-bf2e-673dfa1306b3︡︡{"stdout":"z = (2,3)\nans = (2,-3)","done":false}︡{"done":true}
︠0682be13-c505-4007-b448-8511d03c40b6s︠
z'
︡f704ac29-600e-4f83-90c2-b13315b8c57b︡︡{"stdout":"ans = (2,-3)","done":false}︡{"done":true}
︠1a4a6bae-4fd0-41fd-8dc9-bfaea3e6ededi︠
%md
## Transposition and Hermitian conjugation
︡929cd6d6-9147-4ea6-9bd4-c2d4a2927544︡︡{"done":true,"md":"## Transposition and Hermitian conjugation"}
︠e664d6be-fe62-4893-9d07-89bde129a879s︠
M=[1+i,2;3,4]
M'
︡5242ff3d-5c0c-4c57-be4b-7680b4516426︡︡{"stdout":"M =\n\n (1,1) (2,0)\n (3,0) (4,0)\n\n\nans =\n\n (1,-1) (3,-0)\n (2,-0) (4,-0)\n\n","done":false}︡{"done":true}
︠c8c3be39-1a21-485a-8cdb-070c127d9899i︠
%md
## Reducing and paging matlab screen output

Put semicolon to silence output.
︡85a613b3-d7f7-43eb-b345-2e244f60a182︡︡{"done":true,"md":"## Reducing and paging matlab screen output\n\nPut semicolon to silence output."}
︠d9ce6830-c0e3-4619-9f01-c527a2faf4a2s︠
v=[1 2 3];
︡74777658-5e8b-4b2c-b0f1-cefdcc2b42e2︡︡{"done":true}
︠54c19d22-a5a9-43b0-9e84-2fc8bf8e90d1i︠
%md
## Creating a program file: .m files
- Using the editor, I wrote a small file `myfirst.m`
- Load it as follows, which sets `a`, `b`, `c`.
- NOTE: the sage octave interface doesn't correctly set the current working directory for loading scripts, which is why we do the cd below.  You have to set the path below to wherever you are running this worksheet.  This is very ugly, and will get fixed...

︡b6bfcbf8-4aef-492f-858e-7de7aeb6cea6︡︡{"done":true,"md":"## Creating a program file: .m files\n- Using the editor, I wrote a small file `myfirst.m`\n- Load it as follows, which sets `a`, `b`, `c`.\n- NOTE: the sage octave interface doesn't correctly set the current working directory for loading scripts, which is why we do the cd below.  You have to set the path below to wherever you are running this worksheet.  This is very ugly, and will get fixed..."}
︠1f57a583-9afa-4076-9902-d7ae9eb56a6as︠
cd(); cd('cloud-examples/octave'); pwd()
︡781b053e-97cd-4f15-9b48-ed7825b82cef︡︡{"stdout":"ans = /projects/1041134f-47fb-4a2c-8158-7ba2729f4bc0/cloud-examples/octave","done":false}︡{"done":true}
︠39ed6be3-f1f0-48a5-9ce3-1563bdf56c1cs︠
myfirst

︡0ac25142-32b2-4005-8adc-3aa4044ccd8c︡︡{"done":true}
︠249d17fa-6bac-4bc5-9402-49f372540816s︠
a, b, c
︡5a160aa5-a5f8-4ac4-8bab-1acaaacd6a2d︡︡{"stdout":"a = 2\nb = 3\nc = 5","done":false}︡{"done":true}
︠3c105734-1db4-45a9-b04c-535af6ca1805i︠
%md
## Creating a vector of equally spaced numbers
︡7bf2995d-f067-48b6-adb0-5b334dc59a0e︡︡{"done":true,"md":"## Creating a vector of equally spaced numbers"}
︠b92c6e0d-cfc4-47e0-82b6-c9d46d9507f4s︠
[3:3:12]
︡a329f65b-0253-4255-bba8-bc23a25e825c︡︡{"stdout":"ans =\n\n 3 6 9 12\n\n","done":false}︡{"done":true}
︠458f1dbd-f931-4097-b92f-940de6e99d59s︠
linspace(3, 12, 3)
︡ae1f1a64-fe2c-4eaa-bc90-71de3486acd3︡︡{"stdout":"ans =\n\n 3 7.5 12\n\n","done":false}︡{"done":true}
︠1e89a19f-a66a-4943-950d-34fb636d5539i︠
%md
## Selecting parts of vectors and matrices: the colon operator
︡366014d6-13d0-437b-ab3f-be314acdc3d9︡︡{"done":true,"md":"## Selecting parts of vectors and matrices: the colon operator"}
︠fbda8430-486e-4e5c-a6e9-998fe2221317s︠
v = 1:10;
w = v(2:5);
v(1:4) = w;
v, w
︡02fe9915-1001-4250-bee2-c1fba25af3b4︡︡{"stdout":"\n\n\nv =\n\n 2 3 4 5 5 6 7 8 9 10\n\n\nw =\n\n 2 3 4 5\n\n","done":false}︡{"done":true}
︠6c1b720f-634e-4ee2-8cc0-2f8aad077ed1s︠
M = rand(5)
︡2421ef5b-a41c-4766-83df-092e84453c1a︡︡{"stdout":"M =\n\n 0.941285 0.153281 0.074534 0.952117 0.802027\n 0.829158 0.0334255 0.19148 0.42151 0.0711905\n 0.880278 0.973486 0.290043 0.616042 0.177844\n 0.29837 0.963968 0.987599 0.142489 0.331631\n 0.196745 0.080216 0.674406 0.332727 0.680742\n\n","done":false}︡{"done":true}
︠5fedad16-1ce5-4e6e-b35c-6d73b8e83408s︠
M(2:5,1:3)   % a 4 x 3 submatrix of M
︡c8a83daa-9ffc-44bc-9d21-4e006a6071b2︡︡{"stdout":"ans =\n\n 0.829158 0.0334255 0.19148\n 0.880278 0.973486 0.290043\n 0.29837 0.963968 0.987599\n 0.196745 0.080216 0.674406\n\n","done":false}︡{"done":true}
︠9acbf07d-29ea-4ebb-b4b4-381d93afbfcbs︠
M(:,4)       % 4th column of M
︡26397dcf-3793-4dde-aff2-c9630d2c89fb︡︡{"stdout":"ans =\n\n 0.952117\n 0.42151\n 0.616042\n 0.142489\n 0.332727\n\n","done":false}︡{"done":true}
︠b4746df5-fc51-42a7-b88a-c0e65b854fefs︠
M(2:4,:)     % the second through fourth rows of M as a submatrix
︡cd3b5821-09f4-4265-a8e8-297ad21a9821︡︡{"stdout":"ans =\n\n 0.829158 0.0334255 0.19148 0.42151 0.0711905\n 0.880278 0.973486 0.290043 0.616042 0.177844\n 0.29837 0.963968 0.987599 0.142489 0.331631\n\n","done":false}︡{"done":true}
︠ba1a019f-b41d-4df1-a39d-92bad7ed7b7bi︠
%md
## Creating identity and zero matrices

︡fb760117-1a90-4c9b-a214-b1b90dc9ae64︡︡{"done":true,"md":"## Creating identity and zero matrices"}
︠9f4cd2e2-ad20-4cd7-a170-ad6bdf627c81s︠
eye(4)
︡b0c1628e-79ba-49fc-b981-683beb6255cd︡︡{"stdout":"ans =\n\n 1 0 0 0\n 0 1 0 0\n 0 0 1 0\n 0 0 0 1\n\n","done":false}︡{"done":true}
︠245845eb-8fad-4ebd-a91c-b1afbe5c145bs︠
zeros(2,5)

︡c713933b-e468-4b2e-b838-d4723394f32f︡︡{"stdout":"ans =\n\n 0 0 0 0 0\n 0 0 0 0 0\n\n","done":false}︡{"done":true}
︠d1b469b8-aac1-4433-be72-4e4723ba73e6i︠
%md
## Creating a vector or matrix full of ones
︡5acf7d60-35c4-4903-ad96-c1b998c4b49c︡︡{"done":true,"md":"## Creating a vector or matrix full of ones"}
︠f87ae286-7bf7-42be-a6aa-0ba6c1e42854s︠
ones(2,5)
︡322e3d80-deab-42f5-9b65-a03a5e700703︡︡{"stdout":"ans =\n\n 1 1 1 1 1\n 1 1 1 1 1\n\n","done":false}︡{"done":true}
︠3ebadd2d-a862-42c7-ac5d-ac20757f51c7i︠
%md
## Creating a diagonal matrix
︡329f13c2-7c00-40fd-b105-94c8901d2f66︡︡{"done":true,"md":"## Creating a diagonal matrix"}
︠101bbb07-6c72-4012-9dfa-267e66eed0c6s︠
diag([1,2,3])

︡bf5c6076-f2dc-40d0-9ec0-fb5577c7bdb1︡︡{"stdout":"ans =\n\n 1 0 0\n 0 2 0\n 0 0 3\n\n","done":false}︡{"done":true}
︠2fd53541-9c33-4c8b-8890-195ad8c2634bi︠
%md
## Creating off diagonal/triangular matrices

︡0d1c2ec7-5404-4470-8bf6-dbc2cecfd3b3︡︡{"done":true,"md":"## Creating off diagonal/triangular matrices"}
︠ce573a3f-af16-40c3-9b42-255e8426ecefs︠
M = diag([10 20 30 40 50]) + diag([-3 -4 -5 -6],1)


︡5ddee5b0-33a4-4930-81a9-74bdee73e836︡︡{"stdout":"M =\n\n 10 -3 0 0 0\n 0 20 -4 0 0\n 0 0 30 -5 0\n 0 0 0 40 -6\n 0 0 0 0 50\n\n","done":false}︡{"done":true}
︠90c50039-4d93-4f5e-b5e6-c66b093fa979i︠
%md
## Inverting a matrix
︡321c015c-3480-4c46-9440-5fb305da8551︡︡{"done":true,"md":"## Inverting a matrix"}
︠96ed3575-a3f7-425b-af5f-dc19eeb370a6s︠
A = inv(M); A
︡c293b659-688a-4a5f-bd3f-0aefb026e7e3︡︡{"stdout":"A =\n\n 0.1 0.015 0.002 0.00025 3e-05\n 0 0.05 0.00666667 0.000833333 0.0001\n 0 0 0.0333333 0.00416667 0.0005\n 0 0 0 0.025 0.003\n 0 0 0 0 0.02\n\n","done":false}︡{"done":true}
︠f2e081df-b607-4a0e-8025-d32b78d98375i︠
%md
## Diagonalizing a matrix
︡04018db4-11ca-47c7-bf08-ff97cd56dd79︡︡{"done":true,"md":"## Diagonalizing a matrix"}
︠21cc7f6b-44c2-4bc9-890f-c5ac98b7b34ds︠
M = rand(4);
e = eig(M)
︡92b706ac-86d6-4761-a689-de065b793f81︡︡{"stdout":"\ne =\n\n (1.97833,0)\n (-0.414242,0)\n (0.325217,0.147848)\n (0.325217,-0.147848)\n\n","done":false}︡{"done":true}
︠cb0d78ed-61bc-4d79-ad02-bc00ae02a3ffs︠
[v,e] = eig(M)
︡c13b50d9-31b0-43bc-aa84-ed83479b594e︡︡{"stdout":"v =\n\n (0.344989,0) (0.805598,0) (0.231467,-0.0348854) (0.231467,0.0348854)\n (0.750594,0) (-0.588339,0) (0.0539678,0.198473) (0.0539678,-0.198473)\n (0.296671,0) (-0.0183577,0) (0.59778,-0.277168) (0.59778,0.277168)\n (0.479143,0) (0.0673176,0) (-0.684645,0) (-0.684645,-0)\n\n\ne =\n\n (1.97833,0) (0,0) (0,0) (0,0)\n (0,0) (-0.414242,0) (0,0) (0,0)\n (0,0) (0,0) (0.325217,0.147848) (0,0)\n (0,0) (0,0) (0,0) (0.325217,-0.147848)\n\n","done":false}︡{"done":true}
︠c65e7abc-8105-437c-ad2f-97c2b6e3644fi︠
%md
## Programming
︡479405fc-62ee-4b57-832a-ff708c5fd91e︡︡{"done":true,"md":"## Programming"}
︠505fa4f7-bffc-4a8f-9e4d-2572490f069as︠
for j=1:5
    2*j+1
end
︡a9bcd940-530c-400d-9472-cdd546f767e9︡︡{"stdout":"\n\nans = 3\nans = 5\nans = 7\nans = 9\nans = 11","done":false}︡{"done":true}
︠9d41ead6-a26d-48e5-8333-54d7065ed7b1s︠
n = 3
v = 0
for j=1:n
    v(j) = j^2;
end
v
︡6f5d597f-ac49-418b-b0ac-48f2f8d04e3b︡︡{"stdout":"n = 3\nv = 0\n\n\n\nv =\n\n 1 4 9\n\n","done":false}︡{"done":true}
︠6117a4a3-8cf8-457e-ac46-b0c8320461e9s︠
n = 3;
M = 0;
for j=1:n
  for k=1:n
     M(j,k) = 2*j^2 + cos(k*j*pi/50);
  end
end
M
︡deb619c3-14b6-45c4-ae03-17decebb27b7︡︡{"stdout":"\n\n\n\n\n\n\nM =\n\n 2.99803 2.99211 2.98229\n 8.99211 8.96858 8.92978\n 18.9823 18.9298 18.8443\n\n","done":false}︡{"done":true}
︠ec129582-783b-483f-99ad-5cc4b489c22fs︠

︡63a77e7e-f1e9-496b-9d08-d49dfeff304d︡︡{"done":true}
︠d4e8dea6-d767-43d8-a54f-6052e42f008di︠
%md
# Drawing graphics

- it's not smooth yet
- use the figure command, then show the image in *another* cell. 
- see comment above about setting this path
︡1670f1d6-bf04-430b-a34e-f5ad6cbbb6cf︡︡{"done":true,"md":"# Drawing graphics\n\n- it's not smooth yet\n- use the figure command, then show the image in *another* cell. \n- see comment above about setting this path"}
︠b4682c5c-e16f-4f16-86be-d79d30c20f1bs︠
cd(); cd('cloud-examples/octave'); pwd()
h = figure('visible', 'off');
surf(peaks);
saveas(h,"figure1.png");
︡ec2ba78b-bd59-4c16-b6c3-1df2c3563b84︡︡{"stdout":"ans = /projects/1041134f-47fb-4a2c-8158-7ba2729f4bc0/cloud-examples/octave","done":false}︡{"done":true}
︠ce16cd52-4c95-4379-b7d1-0d204a4f65a5s︠
%sage salvus.file("figure1.png")
︡5ccc86bc-ef8c-48f0-92c8-2b041c32c53a︡︡{"once":false,"done":false,"file":{"show":true,"uuid":"d9d25e52-f2c4-4f1d-be69-269dcd90a836","filename":"figure1.png"}}︡{"done":true}
︠680b7afd-7e99-4b97-81f7-6e535f5d4038s︠
cd(); cd('cloud-examples/octave'); pwd()
M = rand(10);
h = figure('visible', 'off');
plot(M);
saveas(h,"figure2.png");
︡efe4ae14-5749-4583-8a7d-e36ac06b9657︡︡{"stdout":"ans = /projects/1041134f-47fb-4a2c-8158-7ba2729f4bc0/cloud-examples/octave","done":false}︡{"done":true}
︠6bf57e4c-f987-4202-b41f-8ba1ca7fabdbs︠
%sage salvus.file("figure2.png")
︡8a3d9b3e-f27d-48d1-a6a2-5f2d3fa0a7e9︡︡{"once":false,"done":false,"file":{"show":true,"uuid":"6345b806-387a-436a-9e07-a3fb60b6b14a","filename":"figure2.png"}}︡{"done":true}
︠08832df5-d54a-4992-8499-9b81c7e33f5ds︠
︡1602f524-f514-44c9-954f-39ba5c73b853︡︡{"done":true}









