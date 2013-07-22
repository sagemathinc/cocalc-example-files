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
S5.orbit(0)
︡8a9803f2-6e2f-4672-8bf7-a531c687f1c4︡{"stderr":"Error in lines 1-1\nTraceback (most recent call last):\n  File \"/mnt/home/2Qrdjpk5/.sagemathcloud/sage_server.py\", line 494, in execute\n    exec compile(block+'\\n', '', 'single') in namespace, locals\n  File \"\", line 1, in <module>\n  File \"cachefunc.pyx\", line 1462, in sage.misc.cachefunc.CachedMethodCaller.__call__ (sage/misc/cachefunc.c:7598)\n  File \"cachefunc.pyx\", line 2044, in sage.misc.cachefunc.CachedMethod._instance_call (sage/misc/cachefunc.c:10094)\n  File \"/usr/local/sage/sage-5.10.rc1/local/lib/python2.7/site-packages/sage/groups/perm_gps/permgroup.py\", line 1186, in orbit\n    point = input_for_gap(point, 0, container)\n  File \"/usr/local/sage/sage-5.10.rc1/local/lib/python2.7/site-packages/sage/groups/perm_gps/permgroup.py\", line 1170, in input_for_gap\n    raise ValueError('{0} is not part of the domain'.format(x))\nValueError: 0 is not part of the domain\n"}︡
︠f137d660-3c16-4d51-980c-40bfe562686f︠
S5_gap = gap(S5)
A5_gap = gap(A5)
︡c77e2850-94a7-4e59-88da-324c15e08eb9︡
︠77fdb0e3-a043-4b2e-a932-b3303d407770︠
S5_gap.DerivedSeries()
︡ea6f9272-14fa-43f1-bdda-bbef71d0d4f7︡{"stdout":"[ SymmetricGroup( [ 1 .. 5 ] ), AlternatingGroup( [ 1 .. 5 ] ) ]\n"}︡
︠5ab82ebf-9b98-48b8-97ab-7db5373ac104︠
A5_gap.CompositionSeries()
︡a08649ee-805f-49e3-8872-a779c80c1607︡{"stdout":"[ AlternatingGroup( [ 1 .. 5 ] ), Group( () ) ]\n"}︡
︠d5b89239-48ff-4b0c-a1ce-058f9bdb40db︠
for cjcls in A5_gap.ConjugacyClasses():
    print cjcls
    print cjcls.Orbits()
    print
︡31f7b414-775d-4a72-a3c5-e797c246e592︡{"stdout":"ConjugacyClass( AlternatingGroup( [ 1 .. 5 ] ), () )\n[ [ () ] ]\n\nConjugacyClass( AlternatingGroup( [ 1 .. 5 ] ), (1,2)(3,4) )\n[ [ (1,2)(3,4), (2,3)(4,5), (1,2)(4,5), (1,5)(3,4), (2,4)(3,5), (1,5)(2,3), \n      (1,2)(3,5), (1,3)(4,5), (1,4)(3,5), (2,5)(3,4), (1,3)(2,4), (1,4)(2,3), \n      (1,5)(2,4), (1,4)(2,5), (1,3)(2,5) ] ]\n\nConjugacyClass( AlternatingGroup( [ 1 .. 5 ] ), (1,2,3) )\n[ [ (1,2,3), (2,3,4), (1,2,4), (3,4,5), (2,4,5), (2,3,5), (1,2,5), (1,4,5), \n      (1,3,5), (2,5,3), (1,3,4), (2,4,3), (1,5,3), (1,4,3), (3,5,4), (2,5,4), \n      (1,4,2), (1,5,4), (1,5,2), (1,3,2) ] ]\n\nConjugacyClass( AlternatingGroup( [ 1 .. 5 ] ), (1,2,3,4,5) )\n[ [ (1,2,3,4,5), (1,2,4,5,3), (1,4,2,3,5), (1,2,5,3,4), (1,5,2,4,3), \n      (1,4,5,2,3), (1,3,5,4,2), (1,3,2,5,4), (1,3,4,2,5), (1,5,3,2,4), \n      (1,4,3,5,2), (1,5,4,3,2) ] ]\n\nConjugacyClass( AlternatingGroup( [ 1 .. 5 ] ), (1,2,3,5,4) )\n[ [ (1,2,3,5,4), (1,5,2,3,4), (1,2,4,3,5), (1,3,4,5,2), (1,3,2,4,5), \n      (1,2,5,4,3), (1,4,5,3,2), (1,4,2,5,3), (1,5,4,2,3), (1,4,3,2,5), \n      (1,5,3,4,2), (1,3,5,2,4) ] ]\n\n"}︡
︠8d30cce7-0c60-4060-ae05-d5ecce4c953b︠









