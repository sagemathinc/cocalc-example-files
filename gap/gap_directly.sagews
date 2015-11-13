︠7849fc9c-9d01-40cf-8537-7b11917d42c5s︠
%gap
(9 + 5)*(3+3);
︡66a5f5bd-7d53-4014-a535-ce9b916d3924︡︡{"stdout":"84","done":false}︡{"done":true}
︠5e126cd9-d054-4384-bd3d-9a58174c1ac8s︠
%gap
F:= GF( 16 );
LeftActingDomain( F );
︡e7483a14-87b3-46d4-8468-e952fe04a8d7︡︡{"stdout":"GF(2^4)\nGF(2)","done":false}︡{"done":true}
︠aacd269d-ab17-43e9-88cc-25281f6653b0s︠
%gap
G:= AsVectorSpace( GF( 4 ), F );
F = G;
LeftActingDomain( G );
︡9db7b64c-8df4-4db1-ba32-29cb2cf058f8︡︡{"stdout":"AsField( GF(2^2), GF(2^4) )\ntrue\nGF(2^2)","done":false}︡{"done":true}
︠1e304322-500e-4830-bf6d-8ffb11efa88ds︠
︡9c78bffd-d2ec-4b33-83cd-9a7a0f2d4cf4︡︡{"done":true}
︠66b05cd6-02e6-4663-a676-28ee6c64fd56s︠
%gap
s8 := Group( (1,2), (1,2,3,4,5,6,7,8) );
a8 := DerivedSubgroup( s8 );
︡84359815-a578-48ad-baaf-991a6c21697d︡︡{"stdout":"Group([ (1,2), (1,2,3,4,5,6,7,8) ])\nGroup([ (1,2,3), (2,3,4), (2,4)(3,5), (2,6,4), (3,7,5), (4,8,6) ])","done":false}︡{"done":true}
︠6134fd07-f486-4a14-bdf3-98a2172b72fds︠
%gap
Size(a8);
IsAbelian(a8);
IsPerfect(a8);
︡75f03b91-ceda-4186-9098-84aef7c5d28b︡︡{"stdout":"20160\nfalse\ntrue","done":false}︡{"done":true}
︠2712fbc9-42d9-44cc-a367-cbbad2218186s︠
%gap
syl2 := SylowSubgroup( a8, 2 );
Size( syl2 );
︡6e3f2fe5-7320-4e5c-9d3a-4e8414cf5f45︡︡{"stdout":"Group([ (1,3)(7,8), (2,4)(7,8), (5,6)(7,8), (5,7)(6,8), (1,2)(3,4)(5,7)\n(6,8), (1,5)(2,7)(3,6)(4,8) ])\n64","done":false}︡{"done":true}
︠b1658225-2a77-4ab3-8c7e-34862d932c3es︠
%gap
Normalizer( a8, syl2 ) = syl2;
︡da0a87a9-f223-489c-aec9-feb7c2c3b052︡︡{"stdout":"true","done":false}︡{"done":true}
︠fe66952c-a4ed-4f0b-8324-65190f75be23s︠
%gap
cent := Centralizer( a8, Centre( syl2 ) );
Size( cent );
︡750a21c0-40a9-41d3-a14a-79e3d7208bc9︡︡{"stdout":"Group([ (1,3)(2,4)(5,6)(7,8), (5,6)(7,8), (5,7)(6,8), (2,4)(7,8), (2,5)\n(4,6), (1,2)(3,4) ])\n192","done":false}︡{"done":true}
︠60c58572-8548-4ddc-9b29-c38b379b1d29s︠
︡8c750f5b-a0fe-4c60-ba0d-0fdfac46b3bd︡︡{"done":true}









