︠c917fdb6-a6b5-40e1-9ba6-cda5d54e952f︠
gap.version()
︡eb3add54-1d54-4aa5-bc63-f82908f2ab52︡{"stdout":"'4.5.7'\n"}︡
︠a78c5876-45fc-49a1-be30-7b70c2486abe︠

A = AbelianGroup(3, [2,3,4], names="abc")
A
︡f78885c0-819a-408d-88d0-10ef2a288442︡{"stdout":"Multiplicative Abelian group isomorphic to C2 x C3 x C4\n"}︡
︠1e899c21-c300-42ac-991f-87c153052b80︠
a,b,c = A.gens()
(c^3*b).list()
︡5bbb7720-dbe2-4793-bece-21b71ea3b07c︡{"stdout":"[0, 1, 3]\n"}︡
︠5512ee66-76b0-4a87-9026-3844bd326a5c︠
A.permutation_group()
︡c002647c-53cb-49cc-90e6-a0d96292580b︡{"stdout":"Permutation Group with generators [(6,7,8,9), (3,4,5), (1,2)]\n"}︡
︠d509e8db-4824-4d01-a1a7-0fa2eed8d2b4︠
S5 = SymmetricGroup(5)
A5 = AlternatingGroup(5)
A5.is_subgroup(S5)
︡74393ee6-b835-4e86-a8f7-1b5e52dd92b7︡{"stdout":"True\n"}︡
︠9c1738a1-9db3-4f26-af7b-c3fd567f50d0︠
A5.gens()
︡bb949b09-ab6b-4503-a4c0-2e1d2649271e︡{"stdout":"[(3,4,5), (1,2,3,4,5)]\n"}︡
︠2caf53e2-844b-48f1-b2d6-d4018a99441e︠
S5_gap = gap(S5)
A5_gap = gap(A5)
︡c3ed38be-6489-4b1f-8d50-1a19c2d2a772︡
︠77fdb0e3-a043-4b2e-a932-b3303d407770︠
S5_gap.DerivedSeries()
︡89e9b4f9-3632-4e2c-bb72-59f1cc662979︡{"stdout":"[ SymmetricGroup( [ 1 .. 5 ] ), AlternatingGroup( [ 1 .. 5 ] ) ]\n"}︡
︠5ab82ebf-9b98-48b8-97ab-7db5373ac104︠
A5_gap.CompositionSeries()
︡33d4ded6-cf10-4a6f-89f0-d16f664f5b10︡{"stdout":"[ AlternatingGroup( [ 1 .. 5 ] ), Group( () ) ]\n"}︡
︠d5b89239-48ff-4b0c-a1ce-058f9bdb40db︠
for cjcls in A5_gap.ConjugacyClasses():
    print cjcls
    print cjcls.Orbits()
    print
︡176d7bd5-0ec1-4d36-b7c9-ab5337d80130︡{"stdout":"ConjugacyClass( AlternatingGroup( [ 1 .. 5 ] ), () )\n[ [ () ] ]\n\nConjugacyClass( AlternatingGroup( [ 1 .. 5 ] ), (1,2)(3,4) )\n[ [ (1,2)(3,4), (2,3)(4,5), (1,2)(4,5), (1,5)(3,4), (2,4)(3,5), (1,5)(2,3), \n      (1,2)(3,5), (1,3)(4,5), (1,4)(3,5), (2,5)(3,4), (1,3)(2,4), (1,4)(2,3), \n      (1,5)(2,4), (1,4)(2,5), (1,3)(2,5) ] ]\n\nConjugacyClass( AlternatingGroup( [ 1 .. 5 ] ), (1,2,3) )\n[ [ (1,2,3), (2,3,4), (1,2,4), (3,4,5), (2,4,5), (2,3,5), (1,2,5), (1,4,5), \n      (1,3,5), (2,5,3), (1,3,4), (2,4,3), (1,5,3), (1,4,3), (3,5,4), (2,5,4), \n      (1,4,2), (1,5,4), (1,5,2), (1,3,2) ] ]\n\nConjugacyClass( AlternatingGroup( [ 1 .. 5 ] ), (1,2,3,4,5) )\n[ [ (1,2,3,4,5), (1,2,4,5,3), (1,4,2,3,5), (1,2,5,3,4), (1,5,2,4,3), \n      (1,4,5,2,3), (1,3,5,4,2), (1,3,2,5,4), (1,3,4,2,5), (1,5,3,2,4), \n      (1,4,3,5,2), (1,5,4,3,2) ] ]\n\nConjugacyClass( AlternatingGroup( [ 1 .. 5 ] ), (1,2,3,5,4) )\n[ [ (1,2,3,5,4), (1,5,2,3,4), (1,2,4,3,5), (1,3,4,5,2), (1,3,2,4,5), \n      (1,2,5,4,3), (1,4,5,3,2), (1,4,2,5,3), (1,5,4,2,3), (1,4,3,2,5), \n      (1,5,3,4,2), (1,3,5,2,4) ] ]\n\n"}︡
︠8d30cce7-0c60-4060-ae05-d5ecce4c953b︠









