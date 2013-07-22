︠7849fc9c-9d01-40cf-8537-7b11917d42c5︠
%gap
(9 + 5)*(3+3);
︡f6c17eed-d33f-4182-b485-8d05c0995f7c︡{"stdout":"84\n"}︡
︠5e126cd9-d054-4384-bd3d-9a58174c1ac8︠
%gap
F:= GF( 16 );
LeftActingDomain( F );
︡15200b50-acbc-4909-81f4-b0353e90b391︡{"stdout":"GF(2^4)\nGF(2)\n"}︡
︠aacd269d-ab17-43e9-88cc-25281f6653b0︠
%gap
G:= AsVectorSpace( GF( 4 ), F );
F = G;
LeftActingDomain( G );
︡d8a862fd-501d-4234-b407-d52b18cc7ada︡{"stdout":"AsField( GF(2^2), GF(2^4) )\ntrue\nGF(2^2)\n"}︡
︠1e304322-500e-4830-bf6d-8ffb11efa88d︠
︡d0db647f-f14f-441d-abf4-5c23915c3efa︡
︠66b05cd6-02e6-4663-a676-28ee6c64fd56︠
%gap
s8 := Group( (1,2), (1,2,3,4,5,6,7,8) );
a8 := DerivedSubgroup( s8 );
︡f54c17be-4cd1-474c-be89-ab4497c70dc8︡{"stdout":"Group([ (1,2), (1,2,3,4,5,6,7,8) ])\nGroup([ (1,2,3), (2,3,4), (2,4)(3,5), (2,6,4), (2,4)(5,7), (2,8,6,4)(3,5) ])\n"}︡
︠6134fd07-f486-4a14-bdf3-98a2172b72fd︠
%gap
Size(a8);
IsAbelian(a8);
IsPerfect(a8);
︡a41a4ae9-33b7-416d-ad99-996a6350405f︡{"stdout":"20160\nfalse\ntrue\n"}︡
︠2712fbc9-42d9-44cc-a367-cbbad2218186︠
%gap
syl2 := SylowSubgroup( a8, 2 );
Size( syl2 );
︡20216857-380b-40ab-aa92-0dcdcef94b2e︡{"stdout":"Group([ (1,6)(5,8), (1,6)(2,4), (3,7)(5,8), (2,5)(4,8), (1,3)(2,5)(4,8)(6,7), \n  (1,2)(3,5)(4,6)(7,8) ])\n64\n"}︡
︠b1658225-2a77-4ab3-8c7e-34862d932c3e︠
%gap
Normalizer( a8, syl2 ) = syl2;
︡814d39d4-04e1-4ed4-a260-83407896d244︡{"stdout":"true\n"}︡
︠fe66952c-a4ed-4f0b-8324-65190f75be23︠
cent := Centralizer( a8, Centre( syl2 ) );
Size( cent );
︡b774812a-dcce-482c-998b-cabb437b6f92︡{"stderr":"Error in lines 1-1\nTraceback (most recent call last):\n  File \"/mnt/home/2Qrdjpk5/.sagemathcloud/sage_server.py\", line 494, in execute\n    exec compile(block+'\\n', '', 'single') in namespace, locals\n  File \"<string>\", line 1\n    c:= Centralizer( a8, Centre( syl2 ) );\n     ^\nSyntaxError: invalid syntax\n"}︡
︠60c58572-8548-4ddc-9b29-c38b379b1d29︠









