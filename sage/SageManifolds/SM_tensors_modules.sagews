︠c12cb49c-da60-4630-a517-d1d30275772eas︠
%auto
typeset_mode(True, display=False)
︡a1a6d23f-9251-471d-a3bc-1b84cc29a676︡︡{"auto":true}︡{"done":true}
︠416ebdeb-24d1-46e3-9715-f0a6f77d5eabi︠
%html
<h1 style="text-align: center;">Tensors on free modules</h1>
<h2 style="text-align: center;">&nbsp; A tutorial</h2>
<p>This Sage worksheet provides some introduction to <strong>tensors on free modules of finite rank</strong>. This is a pure algebraic subpart of <a href="http://sagemanifolds.obspm.fr/">SageManifolds</a> (version 0.8), which does not depend on other parts of SageManifolds and which has been integrated in Sage 6.6.</p>
<p>This worksheet is released under the GNU General Public License version 2.</p>
<p>(c) Eric Gourgoulhon, Michal Bejger (2015)</p>
<p><em><span style="color: #008080;">The whole worksheet file can be downloaded from</span> <a href="http://sagemanifolds.obspm.fr/doc/sws/SM_tensors_modules.sws">here</a>.</em></p>
<h2>Constructing a free module of finite rank</h2>
<p>Let $R$ be a commutative ring and $M$ a <em>free module of finite rank over</em> $R$, i.e. a module over $R$ that admits a <em>finite basis</em> (finite family of linearly independent generators). Since $R$ is commutative, it has the invariant basis number property: all bases of $M$ have the same cardinality, which is called the <em>rank of</em> $M$. In this tutorial, we consider a free module of rank 3 over the integer ring $\mathbb{Z}$:</p>

︡efcffe9e-f0e8-410b-9651-88fae861cb94︡︡{"done":true,"html":"<h1 style=\"text-align: center;\">Tensors on free modules</h1>\n<h2 style=\"text-align: center;\">&nbsp; A tutorial</h2>\n<p>This Sage worksheet provides some introduction to <strong>tensors on free modules of finite rank</strong>. This is a pure algebraic subpart of <a href=\"http://sagemanifolds.obspm.fr/\">SageManifolds</a> (version 0.8), which does not depend on other parts of SageManifolds and which has been integrated in Sage 6.6.</p>\n<p>This worksheet is released under the GNU General Public License version 2.</p>\n<p>(c) Eric Gourgoulhon, Michal Bejger (2015)</p>\n<p><em><span style=\"color: #008080;\">The whole worksheet file can be downloaded from</span> <a href=\"http://sagemanifolds.obspm.fr/doc/sws/SM_tensors_modules.sws\">here</a>.</em></p>\n<h2>Constructing a free module of finite rank</h2>\n<p>Let $R$ be a commutative ring and $M$ a <em>free module of finite rank over</em> $R$, i.e. a module over $R$ that admits a <em>finite basis</em> (finite family of linearly independent generators). Since $R$ is commutative, it has the invariant basis number property: all bases of $M$ have the same cardinality, which is called the <em>rank of</em> $M$. In this tutorial, we consider a free module of rank 3 over the integer ring $\\mathbb{Z}$:</p>"}
︠6eaf06af-35be-4b59-b8e7-a699694c6a8cs︠
M = FiniteRankFreeModule(ZZ, 3, name='M', start_index=1)
︡10184741-bf76-4e90-8f5a-f88c79a18670︡︡{"done":true}
︠0425fd41-8eb8-47a6-b548-ef6b389a5affi︠
%html
<p>The first two arguments are the ring and the rank; the third one is a string to denote the module and the last one defines the range of indices to be used for tensor components on the module: setting it to 1 means that indices will range in $\{1,2,3\}$. The default value is <span style="font-family: courier new,courier;">start_index=0</span>.</p>
<p>The command <span style="font-family: courier new,courier;">print</span> returns a short description of the just constructed module:</p>

︡fd926209-82e7-46d6-8133-b196c7931dcd︡︡{"done":true,"html":"<p>The first two arguments are the ring and the rank; the third one is a string to denote the module and the last one defines the range of indices to be used for tensor components on the module: setting it to 1 means that indices will range in $\\{1,2,3\\}$. The default value is <span style=\"font-family: courier new,courier;\">start_index=0</span>.</p>\n<p>The command <span style=\"font-family: courier new,courier;\">print</span> returns a short description of the just constructed module:</p>"}
︠fa32e62c-7368-4ebc-b8b0-0eb74dbe8568s︠
print M
︡c95a8060-303d-479d-b6af-0c7df2d9f20a︡︡{"stdout":"Rank-3 free module M over the Integer Ring\n","done":false}︡{"done":true}
︠82666b42-6b88-4e69-b01b-840ec6f8017di︠
%html
<p>If we ask just for M,&nbsp; the module's LaTeX symbol is returned (provided that the worksheet's Typeset box has been selected); by default, this is the same as the argument <span style="font-family: courier new,courier;">name</span> in the constructor (this can be changed by providing the optional argument <span style="font-family: courier new,courier;">latex_name</span>):</p>

︡b2f1fb12-a50b-40b2-b000-d4f2fa7ba3a3︡︡{"done":true,"html":"<p>If we ask just for M,&nbsp; the module's LaTeX symbol is returned (provided that the worksheet's Typeset box has been selected); by default, this is the same as the argument <span style=\"font-family: courier new,courier;\">name</span> in the constructor (this can be changed by providing the optional argument <span style=\"font-family: courier new,courier;\">latex_name</span>):</p>"}
︠ef813805-685f-4efa-b2d5-b7bfb4b6b3e8s︠
M
︡bf38df4c-6ad8-4324-8a90-575b00537ba2︡︡{"html":"<div>$M$</div>","done":false}︡{"done":true}
︠446bc415-69b5-4318-92cd-cb01bbc313bfs︠
M1 = FiniteRankFreeModule(ZZ, 3, name='M', latex_name=r'\mathcal{M}', start_index=1)
M1
︡0f553d0e-2009-4d69-98c2-dc6ff89537b5︡︡{"html":"<div>$\\mathcal{M}$</div>","done":false}︡{"done":true}
︠1fa587a2-f3f9-4161-859a-65c4a4270abfi︠
%html
<p>The indices of basis elements or tensor components on the module are generated by the method <span style="font-family: courier new,courier;">irange()</span>, to be used in loops:</p>

︡40ade4e8-3573-4f23-9cc0-a4653a91a60b︡︡{"done":true,"html":"<p>The indices of basis elements or tensor components on the module are generated by the method <span style=\"font-family: courier new,courier;\">irange()</span>, to be used in loops:</p>"}
︠4ca62212-208c-4a13-adfa-ec444ef0c9fds︠
for i in M.irange(): 
    print i,
︡b6675d37-92ca-4b37-87fc-a0f234afa14b︡︡{"stdout":"1 2 3","done":false}︡{"done":true}
︠f75deed3-07b7-4d43-8356-4dca1e612265i︠
%html
<p>If the parameter<span style="font-family: courier new,courier;"> start_index </span>had not been specified, the default range of the indices would have been $\{0,1,2\}$ instead:</p>

︡d9be8a76-2fa0-41c8-9c0f-28f9dcdb3184︡︡{"done":true,"html":"<p>If the parameter<span style=\"font-family: courier new,courier;\"> start_index </span>had not been specified, the default range of the indices would have been $\\{0,1,2\\}$ instead:</p>"}
︠c756043e-9c87-4a08-8e2f-5fb0fb680e80s︠
M0 = FiniteRankFreeModule(ZZ, 3, name='M')
for i in M0.irange():
    print i,
︡93eac87b-def4-4e48-9810-9c48f043e36f︡︡{"stdout":"0 1 2","done":false}︡{"done":true}
︠58e1cc63-9208-4bd4-86b2-8dafc01d0f2ci︠
%html
<p>$M$ is the category of modules over $\mathbb{Z}$:</p>

︡01fcae53-6f96-4a9f-b577-26d7d75b5314︡︡{"done":true,"html":"<p>$M$ is the category of modules over $\\mathbb{Z}$:</p>"}
︠5d32bb51-77fb-47b2-b37d-e123eb10ef20s︠
M.category()
︡eaf30477-d400-48c2-8822-d348b00b4b5e︡︡{"html":"<div>$\\mathbf{Modules}_{\\Bold{Z}}$</div>","done":false}︡{"done":true}
︠b1fb3196-2292-4181-b509-3dcbd728fe79i︠
%html
<p>Self-inquiry commands are</p>

︡96f24c26-b55c-4837-88e0-77c43daa7a14︡︡{"done":true,"html":"<p>Self-inquiry commands are</p>"}
︠ed98e3ae-5f41-4783-91fc-7d5645578df4s︠
M.base_ring()
︡17cd8abc-d3fa-474f-b059-560f3d21b987︡︡{"html":"<div>$\\Bold{Z}$</div>","done":false}︡{"done":true}
︠e30e7e06-ee13-4762-bd40-489e3a08831cs︠
M.rank()
︡c72e37b6-b492-4764-baee-55fc37b5bdc2︡︡{"html":"<div>$3$</div>","done":false}︡{"done":true}
︠21cb9022-4e32-4bf6-9d48-bc1dbcf62b47i︠
%html
<h2>Defining bases on the free module</h2>
<p>At construction, the free module $M$ has no pre-defined basis:</p>

︡bbd766bb-1613-49e7-b668-82acb7a78434︡︡{"done":true,"html":"<h2>Defining bases on the free module</h2>\n<p>At construction, the free module $M$ has no pre-defined basis:</p>"}
︠b7d6d172-525b-42df-9a8d-3db523dc06b2s︠
M.print_bases()
︡456897b0-5e7e-4483-ba6a-a568d88ed61c︡︡{"stdout":"Bases defined on the Rank-3 free module M over the Integer Ring:\n - (e_1,e_2,e_3) (default basis)\n - (f_1,f_2,f_3)\n","done":false}︡{"done":true}
︠6335970f-7270-4dec-ba8d-9b89994f803es︠
M.bases()
︡c6c8acdb-70ae-4fcc-83c8-c835e384dd9b︡︡{"html":"<div>[$\\left(e_1,e_2,e_3\\right)$, $\\left(f_1,f_2,f_3\\right)$]</div>","done":false}︡{"done":true}
︠a82c4146-527e-47f5-ab21-aa653e984273i︠
%html
<p>For this reason, the class <span style="font-family: courier new,courier;">FiniteRankFreeModule</span> does not inherit from Sage class <span style="font-family: courier new,courier;">CombinatorialFreeModule</span>:</p>

︡2465492d-a3d0-40a9-ba35-776d90deb6cb︡︡{"done":true,"html":"<p>For this reason, the class <span style=\"font-family: courier new,courier;\">FiniteRankFreeModule</span> does not inherit from Sage class <span style=\"font-family: courier new,courier;\">CombinatorialFreeModule</span>:</p>"}
︠f61715ca-9ebf-47da-ae9f-be61ed39cd66s︠
isinstance(M, CombinatorialFreeModule)
︡5d31a0b8-2395-45c8-a529-a8871fdb6c39︡︡{"html":"<div>$\\mathrm{False}$</div>","done":false}︡{"done":true}
︠638588c8-e023-4233-b2c2-b2d6fd281f49i︠
%html
<p>and $M$ does not belong to the category of modules with a distinguished basis:</p>

︡43dd4e55-bc67-46e8-971d-1fcae3a63cda︡︡{"done":true,"html":"<p>and $M$ does not belong to the category of modules with a distinguished basis:</p>"}
︠e3ef50b8-4619-4dd7-9230-aafdb6851418s︠
M in ModulesWithBasis(ZZ)
︡7c90024f-81c3-4c49-98c2-dfe14cdd7e02︡︡{"html":"<div>$\\mathrm{False}$</div>","done":false}︡{"done":true}
︠9f8302dc-80c6-4ffc-8cf3-4d5e3b131cbbi︠
%html
<p>It simply belongs to the category of modules over $\mathbb{Z}$:</p>

︡d9192115-4e0b-4440-bb52-ef1355350dbc︡︡{"done":true,"html":"<p>It simply belongs to the category of modules over $\\mathbb{Z}$:</p>"}
︠0c864572-21b3-4e0c-a6ac-c4bf395144fbs︠
M in Modules(ZZ)
︡32c4c9b9-7182-4c5f-a325-00fed73619c5︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠ec7f95f1-3a42-47cc-92c0-88fb82826c61i︠
%html
<p>We define a first basis on $M$ as follows:</p>

︡de1696e7-00c3-4228-9caf-c0e8f785300f︡︡{"done":true,"html":"<p>We define a first basis on $M$ as follows:</p>"}
︠8fc7380f-064f-4409-a19e-dd6dd621e55ds︠
e = M.basis('e') ; e
︡2e38d732-f40e-4378-bcfe-3012b2df5737︡︡{"html":"<div>$\\left(e_1,e_2,e_3\\right)$</div>","done":false}︡{"done":true}
︠712fbd49-2888-4e76-a95c-888ddfd1a4eds︠
M.print_bases()
︡6cb82785-d1ac-434b-9011-e698e0ef679a︡︡{"stdout":"Bases defined on the Rank-3 free module M over the Integer Ring:\n - (e_1,e_2,e_3) (default basis)\n - (f_1,f_2,f_3)\n","done":false}︡{"done":true}
︠0bca1d97-666a-492c-af6e-d63aa64da143i︠
%html
<p>The elements of the basis are accessed via their indices:</p>

︡277b52af-6fe2-4771-b0d2-7274b9794798︡︡{"done":true,"html":"<p>The elements of the basis are accessed via their indices:</p>"}
︠9fa6a641-bcbc-41e7-98ea-7d3255df9a24s︠
e[1]
︡2f317643-24e3-4606-9a1b-dca5ed0f497c︡︡{"html":"<div>$e_1$</div>","done":false}︡{"done":true}
︠cdfd97cb-3246-406e-839b-115f9d0760d3s︠
print e[1]
︡604cae5d-98d7-4b3d-9067-46a159c66ab3︡︡{"stdout":"Element e_1 of the Rank-3 free module M over the Integer Ring\n","done":false}︡{"done":true}
︠8ac12a3d-8ec3-40af-9e58-dc4f20360968s︠
e[1] in M
︡14a92502-ee82-41e7-9735-c94bdbf78b60︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠4986af73-187b-4724-89fc-fe4d6896734bs︠
e[1].parent()
︡1975e0dd-4bba-49e1-99ca-9a61f9b9ba27︡︡{"html":"<div>$M$</div>","done":false}︡{"done":true}
︠d0291f68-4f6c-462c-b9ec-3eed5b205f60i︠
%html
<p>Let us introduce a second basis on the free module $M$ from a family of 3 linearly independent module elements:</p>

︡42044d50-9472-4d34-a43e-79de2c94c93d︡︡{"done":true,"html":"<p>Let us introduce a second basis on the free module $M$ from a family of 3 linearly independent module elements:</p>"}
︠84ff46b8-0abb-46ed-be76-0de493a72f0as︠
f = M.basis('f', from_family=(-e[1]+2*e[2]-4*e[3], e[2]+2*e[3], e[2]+3*e[3]))
print f ; f
︡242c1d52-7642-45ed-be1d-2b0151c31493︡︡{"stdout":"Basis (f_1,f_2,f_3) on the Rank-3 free module M over the Integer Ring\n","done":false}︡{"html":"<div>$\\left(f_1,f_2,f_3\\right)$</div>","done":false}︡{"done":true}
︠83fffbbd-f6d1-4e94-9dd2-7afe7a050188i︠
%html
<p>We may ask to view each element of basis $f$ in terms of its expansion onto basis $e$, via the method<span style="font-family: courier new,courier;"> display(),</span> abridged as<span style="font-family: courier new,courier;"> disp()</span>:</p>

︡4b8a9e0e-2c58-42a1-8215-cd61abcc1b2d︡︡{"done":true,"html":"<p>We may ask to view each element of basis $f$ in terms of its expansion onto basis $e$, via the method<span style=\"font-family: courier new,courier;\"> display(),</span> abridged as<span style=\"font-family: courier new,courier;\"> disp()</span>:</p>"}
︠42368610-b27f-44c8-9676-49d29f5bbc48s︠
f[1].disp(e)
︡d845bd97-5b46-4193-a6df-d06ffb76df76︡︡{"html":"<div>$f_1 = -e_1 + 2 e_2 -4 e_3$</div>","done":false}︡{"done":true}
︠d44787a7-9c6e-41c3-9b35-0558afa11d57s︠
f[2].disp(e)
︡4e2b546e-dba5-4200-93d0-a815bbffce9f︡︡{"html":"<div>$f_2 = e_2 + 2 e_3$</div>","done":false}︡{"done":true}
︠1bdf7c81-28e3-4652-a3b4-bafccce109f6s︠
f[3].disp(e)
︡f7f1c999-5530-4ca1-8f32-2c9bb2ef107a︡︡{"html":"<div>$f_3 = e_2 + 3 e_3$</div>","done":false}︡{"done":true}
︠c8b1d766-8321-4b37-a56a-800f76d07d05i︠
%html
<p>Conversely, the expression of basis $e$ is terms of basis $f$ is</p>

︡f1ed24c0-8346-4114-b83a-1d8cdf110a95︡︡{"done":true,"html":"<p>Conversely, the expression of basis $e$ is terms of basis $f$ is</p>"}
︠c7a8ac4e-2f9a-4460-b5e8-ed549b0651afs︠
e[1].disp(f)
︡780fe26c-c180-46e1-9783-d90297c99380︡︡{"html":"<div>$e_1 = -f_1 + 10 f_2 -8 f_3$</div>","done":false}︡{"done":true}
︠6ee5d366-a5c0-4faa-9736-98dbf2304e70s︠
e[2].disp(f)
︡7696d92e-a426-4959-81aa-1d6713b23215︡︡{"html":"<div>$e_2 = 3 f_2 -2 f_3$</div>","done":false}︡{"done":true}
︠b60a6459-348f-4a3e-bd7d-889bf329193cs︠
e[3].disp(f)
︡4f5f9e55-201c-4b9a-a4fe-22a9d6cf1c81︡︡{"html":"<div>$e_3 = -f_2+f_3$</div>","done":false}︡{"done":true}
︠bc1ecf94-8aa9-4699-97e2-fe9a81b46b85i︠
%html
<p>The module automorphism $a$ relating the two bases is obtained as</p>

︡b04683c7-32e4-416e-9174-a161c066fdc7︡︡{"done":true,"html":"<p>The module automorphism $a$ relating the two bases is obtained as</p>"}
︠0db68551-bc10-4090-95e8-0386aef8ae68s︠
a = M.change_of_basis(e,f) ; a
︡b21669cd-f940-456a-b2f5-a8d22b7bc1d2︡︡{"html":"<div>$\\mbox{Automorphism of the Rank-3 free module M over the Integer Ring}$</div>","done":false}︡{"done":true}
︠980f4992-e89b-45de-8c49-9607fabe400ei︠
%html
<p>It belongs to the general linear group of the free module $M$:</p>

︡34139a52-c11d-4137-9462-efd2d22b4aca︡︡{"done":true,"html":"<p>It belongs to the general linear group of the free module $M$:</p>"}
︠606f2da0-7136-4a5e-8ceb-50c75c8c14c7s︠
a.parent()
︡0f45f421-f19e-414a-b858-66a96e347220︡︡{"html":"<div>$\\mathrm{GL}\\left( M \\right)$</div>","done":false}︡{"done":true}
︠922e1eb7-e057-4807-a62c-2e63ba4c92f1i︠
%html
<p>and its matrix w.r.t. basis $e$ is</p>

︡42f24bf0-48ce-4051-9332-10bfb059c52e︡︡{"done":true,"html":"<p>and its matrix w.r.t. basis $e$ is</p>"}
︠a3d0d2a2-d365-4f2c-83bf-75c81566225as︠
a.matrix(e)
︡13a6d0f4-786c-4b95-9372-25f9a30a8b0a︡︡{"html":"<div>$\\left(\\begin{array}{rrr}\n-1 &amp; 0 &amp; 0 \\\\\n2 &amp; 1 &amp; 1 \\\\\n-4 &amp; 2 &amp; 3\n\\end{array}\\right)$</div>","done":false}︡{"done":true}
︠fb7b8fc2-b021-454e-94ce-811c4c126335i︠
%html
<p>Let us check that the elements of basis $f$ are images of the elements of basis $e$ via $a$:</p>

︡8db9439b-fad3-4edf-87bd-8680c6fec429︡︡{"done":true,"html":"<p>Let us check that the elements of basis $f$ are images of the elements of basis $e$ via $a$:</p>"}
︠ce643d3f-600d-43c1-847a-e43b3cd88c61s︠
f[1] == a(e[1]), f[2] == a(e[2]), f[3] == a(e[3])
︡a36cf81a-0862-4eb2-9a82-b6327285fe1a︡︡{"html":"<div>($\\mathrm{True}$, $\\mathrm{True}$, $\\mathrm{True}$)</div>","done":false}︡{"done":true}
︠2ce996bc-0cc4-4ccc-9eb6-da6a798c514ai︠
%html
<p>The reverse change of basis is of course the inverse automorphism:</p>

︡99e980e3-c2c8-4fcb-80d8-03adafb2e546︡︡{"done":true,"html":"<p>The reverse change of basis is of course the inverse automorphism:</p>"}
︠5984817d-24d2-4cfe-9b97-6e6295205339s︠
M.change_of_basis(f,e) == a^(-1)
︡fcd3d54f-b447-4961-ac23-6eec928bb0a4︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠7a784c3d-113f-423b-ac2a-a9a5f25aec98s︠
(a^(-1)).matrix(f)
︡698b0235-40a7-49c2-9e78-5915d463d5ca︡︡{"html":"<div>$\\left(\\begin{array}{rrr}\n-1 &amp; 0 &amp; 0 \\\\\n10 &amp; 3 &amp; -1 \\\\\n-8 &amp; -2 &amp; 1\n\\end{array}\\right)$</div>","done":false}︡{"done":true}
︠4bc453f9-74b1-497d-a471-535ac2ef9f0ai︠
%html
<p>At this stage, two bases have been defined on $M$:</p>

︡4e1a0c81-40fd-4611-8be7-279a18e57105︡︡{"done":true,"html":"<p>At this stage, two bases have been defined on $M$:</p>"}
︠06a759ef-df41-4ae7-9a40-007ba7694649s︠
M.print_bases()
︡313f4f54-3f0a-4ea7-856b-9ff343e3be2f︡︡{"stdout":"Bases defined on the Rank-3 free module M over the Integer Ring:\n - (e_1,e_2,e_3) (default basis)\n - (f_1,f_2,f_3)\n","done":false}︡{"done":true}
︠b5a29d43-e0a6-4bc2-85c5-6f3e3d7c8e94i︠
%html
<p>The first defined basis, $e$, is considered as the <em>default basis</em>, which means that it can be skipped in any method argument requirying a basis. For instance, let us consider the method <span style="font-family: courier new,courier;">display()</span>:</p>

︡9ebfa4b3-5401-4371-b28a-edc11d7e9d0a︡︡{"done":true,"html":"<p>The first defined basis, $e$, is considered as the <em>default basis</em>, which means that it can be skipped in any method argument requirying a basis. For instance, let us consider the method <span style=\"font-family: courier new,courier;\">display()</span>:</p>"}
︠ca340f0c-8d3d-4448-9fc5-da679f62ec39s︠
f[1].display(e)
︡696355be-fc4b-42e5-9ed3-b164742f3be5︡︡{"html":"<div>$f_1 = -e_1 + 2 e_2 -4 e_3$</div>","done":false}︡{"done":true}
︠29492c68-99fc-408b-a287-ad4a68d3738ci︠
%html
<p>Since $e$ is the default basis, the above command is fully equivalent to</p>

︡e99025f9-7263-4e77-aee5-41e30710c778︡︡{"done":true,"html":"<p>Since $e$ is the default basis, the above command is fully equivalent to</p>"}
︠13f29363-4441-4c4a-b4a6-c8e0f4793607s︠
f[1].display()
︡db919abf-b1a7-4ceb-b8b1-1b469035e8ab︡︡{"html":"<div>$f_1 = -e_1 + 2 e_2 -4 e_3$</div>","done":false}︡{"done":true}
︠8c7264cc-f1a3-418c-a65b-574238377115i︠
%html
<p>Of course, the names of non-default bases have to be specified:</p>

︡2fc8009b-d710-4ef1-a68a-e497ea990f76︡︡{"done":true,"html":"<p>Of course, the names of non-default bases have to be specified:</p>"}
︠df4c7944-4a35-4b5f-ae22-6cc6229d6cbfs︠
f[1].display(f)
︡192ce50c-485e-49d2-a9ef-63f8f56ff70e︡︡{"html":"<div>$f_1 = f_1$</div>","done":false}︡{"done":true}
︠57762793-d871-4f90-acb8-9cb6fa0f7085s︠
e[1].display(f)
︡9530d37f-f184-4083-b135-2a201a3b7f4e︡︡{"html":"<div>$e_1 = -f_1 + 10 f_2 -8 f_3$</div>","done":false}︡{"done":true}
︠f794cb07-534f-4b3c-9da3-3817751ac7adi︠
%html
<p>Note that the concept of <strong><em>default basis</em></strong> is different from that of <strong><em>distinguished basis</em></strong> which is implemented in other free module constructions in Sage (e.g. <span style="font-family: courier new,courier;">CombinatorialFreeModule</span>): the default basis is intended only for shorthand notations in user commands, avoiding to repeat the basis name many times; it is by no means a privileged basis on the module. For user convenience, the default basis can be changed at any moment by means of the method <span style="font-family: courier new,courier;">set_default_basis()</span>:</p>

︡17f61e55-1c73-4c6e-8613-70ba2b476718︡︡{"done":true,"html":"<p>Note that the concept of <strong><em>default basis</em></strong> is different from that of <strong><em>distinguished basis</em></strong> which is implemented in other free module constructions in Sage (e.g. <span style=\"font-family: courier new,courier;\">CombinatorialFreeModule</span>): the default basis is intended only for shorthand notations in user commands, avoiding to repeat the basis name many times; it is by no means a privileged basis on the module. For user convenience, the default basis can be changed at any moment by means of the method <span style=\"font-family: courier new,courier;\">set_default_basis()</span>:</p>"}
︠65cb526e-d449-469e-b083-d3d0870ca1ees︠
M.set_default_basis(f)
e[1].display()
︡8c80168a-94ca-4c49-b540-175c3f5883dc︡︡{"html":"<div>$e_1 = -f_1 + 10 f_2 -8 f_3$</div>","done":false}︡{"done":true}
︠a9bf1efe-12a6-4313-9f38-80341054c9fdi︠
%html
<p>Let us revert to $e$ as the default basis:</p>

︡58a45c60-0dc9-4b03-946e-3372eaecc1fb︡︡{"done":true,"html":"<p>Let us revert to $e$ as the default basis:</p>"}
︠4ae0176c-9b5c-4728-8faa-68d7ab6a2652s︠
M.set_default_basis(e)
︡8106c197-9e3b-46ef-a768-59a7211c5898︡︡{"done":true}
︠f4d19a77-c25d-4af3-8eeb-a12996403c8ci︠
%html
<h2>Module elements</h2>
<p>Elements of the free module $M$ are constructed by providing their components with respect to a given basis to the operator () acting on the module:</p>

︡3e0ba5d9-78c2-4280-852f-22b82415bfeb︡︡{"done":true,"html":"<h2>Module elements</h2>\n<p>Elements of the free module $M$ are constructed by providing their components with respect to a given basis to the operator () acting on the module:</p>"}
︠a4d1b775-f0bd-4ff1-b0b9-b0f852f9d4e2s︠
v = M([3,-4,1], basis=e, name='v')
print v
︡bd39fd10-f5f5-488d-81b9-38abb2dc3a81︡︡{"stdout":"Element v of the Rank-3 free module M over the Integer Ring\n","done":false}︡{"done":true}
︠d81cb282-5e6a-42d2-bc83-3d15cd16898ci︠
%html
<p>Since $e$ is the default basis, its mention can be skipped:</p>

︡5833d3e0-01f2-4c0d-b8f5-8057e430b41f︡︡{"done":true,"html":"<p>Since $e$ is the default basis, its mention can be skipped:</p>"}
︠1658b54b-bd60-45ef-b4f1-dd8aba072177s︠
v = M([3,-4,1], name='v')
print v
︡2e4bc7fc-13a0-4833-a148-d7020739ad5d︡︡{"stdout":"Element v of the Rank-3 free module M over the Integer Ring\n","done":false}︡{"done":true}
︠14df5062-fdae-42d3-bb0b-ca39c9348e83s︠
v.disp()
︡40f77b54-2098-4f95-b60a-4461ec61f13a︡︡{"html":"<div>$v = 3 e_1 -4 e_2 +e_3$</div>","done":false}︡{"done":true}
︠017666a5-b11e-4f48-85e0-819063a1f31bi︠
%html
<p>While $v$ has been defined from the basis $e$, its expression in terms of the basis $f$ can be evaluated, thanks to the known relation between the two bases:</p>

︡52c1645c-bb6c-40a3-86fc-551708051547︡︡{"done":true,"html":"<p>While $v$ has been defined from the basis $e$, its expression in terms of the basis $f$ can be evaluated, thanks to the known relation between the two bases:</p>"}
︠93d6b047-80ee-4b00-98fa-3b41cca29e2as︠
v.disp(f)
︡f6385e91-69e8-40d0-b2f5-822498124e2b︡︡{"html":"<div>$v = -3 f_1 + 17 f_2 -15 f_3$</div>","done":false}︡{"done":true}
︠4af7a3e3-5b0f-4d3d-8e7c-b526ebe4ef70i︠
%html
<p>According to Sage terminology, the parent of $v$ is of course $M$:</p>

︡280c4731-e5bc-4684-8bd4-72a824786e3c︡︡{"done":true,"html":"<p>According to Sage terminology, the parent of $v$ is of course $M$:</p>"}
︠ba8e44af-24f6-413c-898f-79acc81e3c9ds︠
v.parent()
︡a9b84d7c-000b-4709-8f73-332c106cd4ea︡︡{"html":"<div>$M$</div>","done":false}︡{"done":true}
︠0c428301-efae-4b99-8daa-75f8cf195cd6i︠
%html
<p>We have also</p>

︡1245a6c0-fbec-4c87-96d4-700191c6c9b9︡︡{"done":true,"html":"<p>We have also</p>"}
︠601eb802-fb95-4a8a-86fa-c5c4f398ca1cs︠
v in M
︡92cde1ab-adb2-4a8d-80cb-60842a5d319e︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠72cba790-941c-47d0-a736-dd07f97363ffi︠
%html
<p>Let us define a second module element, from the basis $f$ this time:</p>

︡9f19efa5-2b7a-4542-9cf9-a8bd315c289e︡︡{"done":true,"html":"<p>Let us define a second module element, from the basis $f$ this time:</p>"}
︠031c0ba5-6953-4d9c-9f54-956988495f93s︠
u = M([-1,3,5], basis=f, name='u')
u.disp(f)
︡684f4332-1994-4427-ae45-1a96c895a9c1︡︡{"html":"<div>$u = -f_1 + 3 f_2 + 5 f_3$</div>","done":false}︡{"done":true}
︠1c2787eb-9553-48f7-836e-72969adc08b8i︠
%html
<p>Another way to define module elements is of course via linear combinations:</p>

︡f20a0174-7c66-49a2-b362-0c28fb241056︡︡{"done":true,"html":"<p>Another way to define module elements is of course via linear combinations:</p>"}
︠53ee1426-7ac4-45d7-beab-7458ef164501s︠
w = 2*e[1] - e[2] - 3*e[3]
print w
︡54632f4c-2afd-4604-8d98-ce30ac34ca9e︡︡{"stdout":"Element of the Rank-3 free module M over the Integer Ring\n","done":false}︡{"done":true}
︠518ad8cb-eac7-459a-8cb2-149e5ce3ed1as︠
w.disp()
︡f3ab4f65-9963-45f4-a6f8-58e2cc0cfe05︡︡{"html":"<div>$2 e_1 -e_2 -3 e_3$</div>","done":false}︡{"done":true}
︠54ac6d69-8074-41c6-a0a2-fa12f52a2f74i︠
%html
<p>As the result of a linear combination, $w$ has no name; it can be given one by the method <span style="font-family: courier new,courier;">set_name()</span> and the LaTeX symbol can be specified if different from the name:</p>

︡865f878b-166a-473e-8ada-8d638d690788︡︡{"done":true,"html":"<p>As the result of a linear combination, $w$ has no name; it can be given one by the method <span style=\"font-family: courier new,courier;\">set_name()</span> and the LaTeX symbol can be specified if different from the name:</p>"}
︠a6588302-cd7a-44cf-b61a-110e087c4399s︠
w.set_name('w', latex_name=r'\omega')
w.disp()
︡8f3b9968-4581-45a1-83e7-52f41dce4277︡︡{"html":"<div>$\\omega = 2 e_1 -e_2 -3 e_3$</div>","done":false}︡{"done":true}
︠46f8ed07-def9-4d9c-aebd-c45506d14ddei︠
%html
<p>Module operations are implemented, independently of the bases:</p>

︡df01b6be-dc94-453f-b588-4d5e6354df12︡︡{"done":true,"html":"<p>Module operations are implemented, independently of the bases:</p>"}
︠1c56e91d-e817-436d-b115-f6350bd3101fs︠
s = u + 3*v
print s
︡acda6edd-3ae5-4f0f-8bb6-b78ba1fb365e︡︡{"stdout":"Element of the Rank-3 free module M over the Integer Ring\n","done":false}︡{"done":true}
︠fa1bead7-d5e6-48e3-8c96-6ca3daf1e572s︠
s.disp()
︡89277a48-3f68-4e01-9359-a740695cfb47︡︡{"html":"<div>$10 e_1 -6 e_2 + 28 e_3$</div>","done":false}︡{"done":true}
︠1b8ed5e6-c71a-4f96-be31-9f7ece3caaf8s︠
s.disp(f)
︡5dab4645-2ef1-46bd-9548-f7311ba9774f︡︡{"html":"<div>$-10 f_1 + 54 f_2 -40 f_3$</div>","done":false}︡{"done":true}
︠5da41b1d-dde0-4ce6-b7bb-65604b816a13s︠
s = u - v
print s
︡385c04c8-b9ec-4465-983a-8679d299d181︡︡{"stdout":"Element u-v of the Rank-3 free module M over the Integer Ring\n","done":false}︡{"done":true}
︠663e5f61-738b-4e3d-b733-74d3f170527bs︠
s.disp()
︡36743c41-ec49-456c-b31d-114b0191a8d9︡︡{"html":"<div>$u-v = -2 e_1 + 10 e_2 + 24 e_3$</div>","done":false}︡{"done":true}
︠853ca159-637b-420e-983c-f3e61a760d71s︠
s.disp(f)
︡041db3c5-23e6-4492-b06f-e19acea26389︡︡{"html":"<div>$u-v = 2 f_1 -14 f_2 + 20 f_3$</div>","done":false}︡{"done":true}
︠c81e0364-fe09-478b-b166-566e21213409i︠
%html
<p>The components of a module element with respect to a given basis are given by the method <span style="font-family: courier new,courier;">components()</span>:</p>

︡b940a9f7-ca49-4f5a-afa9-479f5b6fb879︡︡{"done":true,"html":"<p>The components of a module element with respect to a given basis are given by the method <span style=\"font-family: courier new,courier;\">components()</span>:</p>"}
︠d44e3375-1c22-409e-a8b9-1b57c558cdd4s︠
v.components(f)
︡046c4aaf-e4a4-4b53-9f64-aac5ca9e2422︡︡{"html":"<div>$\\text{\\texttt{1{-}index{ }components{ }w.r.t.{ }Basis{ }(f{\\char`\\_}1,f{\\char`\\_}2,f{\\char`\\_}3){ }on{ }the{ }Rank{-}3{ }free{ }module{ }M{ }over{ }the{ }Integer{ }Ring}}$</div>","done":false}︡{"done":true}
︠8e78cd36-df50-4aa3-831a-3574a250ca64i︠
%html
<p>A shortcut is <span style="font-family: courier new,courier;">comp():</span></p>

︡1191dd04-ae72-4da7-9fb6-0a686fa6acef︡︡{"done":true,"html":"<p>A shortcut is <span style=\"font-family: courier new,courier;\">comp():</span></p>"}
︠db332186-1bcd-440f-bf36-bd0cb6d8b103s︠
v.comp(f) is v.components(f)
︡cd23ff7d-cb46-430e-b9a2-5c356ac34528︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠75d94fdc-3a7d-48e3-9e2e-9686fbee8055s︠
for i in M.irange(): 
    print v.comp(f)[i],
︡74c373aa-fe29-4440-91e1-6df16d92ae31︡︡{"stdout":"-3 17 -15","done":false}︡{"done":true}
︠f630495d-48bb-4f06-bbb5-2982c6f08f9ds︠
v.comp(f)[:]
︡b5867089-4cf7-4572-b2a0-c07199b91ff1︡︡{"html":"<div>[$-3$, $17$, $-15$]</div>","done":false}︡{"done":true}
︠d1070af8-a663-47b2-a552-bcf081d7b7adi︠
%html
<p>The function <span style="font-family: courier new,courier;">display_comp()</span> provides a list of components w.r.t. to a given basis:</p>

︡583ca62a-eed9-4ff3-af43-d1b5335994ad︡︡{"done":true,"html":"<p>The function <span style=\"font-family: courier new,courier;\">display_comp()</span> provides a list of components w.r.t. to a given basis:</p>"}
︠3f5e9ed6-3b36-4b0b-968c-b814f3443be4s︠
v.display_comp(f)
︡4d08bd5b-53c0-4ac0-b3db-a89262fb19fa︡︡{"html":"<div>$\\begin{array}{lcl} v_{\\phantom{\\, 1}}^{\\,1} &amp; = &amp; -3 \\\\ v_{\\phantom{\\, 2}}^{\\,2} &amp; = &amp; 17 \\\\ v_{\\phantom{\\, 3}}^{\\,3} &amp; = &amp; -15 \\end{array}$</div>","done":false}︡{"done":true}
︠4fefc10e-e837-487d-b930-c0bc3d2e8560i︠
%html
<p>As a shortcut, instead of calling the method comp(), the basis can be provided as the first argument of the square bracket operator:</p>

︡7e4c7310-4a06-4a98-a339-4bfb3b8ae368︡︡{"done":true,"html":"<p>As a shortcut, instead of calling the method comp(), the basis can be provided as the first argument of the square bracket operator:</p>"}
︠93c511eb-43c9-47b6-aca4-fa044d71dd5cs︠
v[f,2]
︡95335019-195e-45e9-b440-40fd4bf20110︡︡{"html":"<div>$17$</div>","done":false}︡{"done":true}
︠acd96292-d795-4657-a808-9ff3268ebcb6s︠
v[f,:]
︡b8ccaa50-0dd2-4eb0-8d4c-f4a924659c75︡︡{"html":"<div>[$-3$, $17$, $-15$]</div>","done":false}︡{"done":true}
︠4e449993-365b-4b4d-91ca-359f9709ff10i︠
%html
<p>For the default basis, the basis can be omitted:</p>

︡c2aca0f9-ee3d-416a-b72b-36ad1b226c3c︡︡{"done":true,"html":"<p>For the default basis, the basis can be omitted:</p>"}
︠a23a905a-efcb-4584-ae10-029b61de3973s︠
v[:]
︡e19a5848-9b65-4b2e-9e15-12c7262db624︡︡{"html":"<div>[$3$, $-4$, $1$]</div>","done":false}︡{"done":true}
︠5da28fbf-39bb-4916-a52f-d1f9b9df64f3s︠
v[2]
︡4ecb3fec-0790-4c32-a5de-6167115503d7︡︡{"html":"<div>$-4$</div>","done":false}︡{"done":true}
︠0f1a7f8a-7bda-46cb-b8de-1ae48425c053i︠
%html
<p>A specific module element is the zero one:</p>

︡918caff9-73c4-4679-8e1f-17a35bc20beb︡︡{"done":true,"html":"<p>A specific module element is the zero one:</p>"}
︠605ca30d-05f9-47e4-a71b-7637b12e8bf4s︠
print M.zero()
︡7c122e93-a7b4-4140-a7ac-b73945a98fda︡︡{"stdout":"Element zero of the Rank-3 free module M over the Integer Ring\n","done":false}︡{"done":true}
︠f2f523b5-eabe-41ea-b89a-7e63a110418fs︠
M.zero()[:]
︡8b07e417-1002-4a3c-bf6a-f8292cfad26e︡︡{"html":"<div>[$0$, $0$, $0$]</div>","done":false}︡{"done":true}
︠82056af3-e1ba-4333-a5b9-80c777436084s︠
M.zero()[f,:]
︡03934e47-8005-4e74-b747-212397b314ed︡︡{"html":"<div>[$0$, $0$, $0$]</div>","done":false}︡{"done":true}
︠584c72ba-8883-43f5-a509-228a78066c7fs︠
v + M.zero() == v
︡b00b929f-0f1d-48bc-ad1c-e22123eb269a︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠ca9510b3-f010-4ed1-851c-a86479a2854ei︠
%html
<h2>Linear forms</h2>
<p>Let us introduce some linear form on the free module $M$:</p>

︡b61031e6-cbf1-4ca5-b285-fdf19d6e793d︡︡{"done":true,"html":"<h2>Linear forms</h2>\n<p>Let us introduce some linear form on the free module $M$:</p>"}
︠4f771208-c833-4771-91d6-bcd623fe5ac6s︠
a = M.linear_form('a')
print a
︡ea2d78e6-d722-4b2f-b6aa-557a9808d916︡︡{"stdout":"Linear form a on the Rank-3 free module M over the Integer Ring\n","done":false}︡{"done":true}
︠d67b541e-5ab7-4a1f-92d2-22449d763bbdi︠
%html
<p>$a$ is specified by its components with respect to the basis dual to $e$:</p>

︡c782e5d5-4f03-43fa-978a-9e2f43433045︡︡{"done":true,"html":"<p>$a$ is specified by its components with respect to the basis dual to $e$:</p>"}
︠bb6a86ff-7599-4fee-9fed-1abc3c95a1cds︠
a[:] = [2,-1,3]
a.disp()
︡f3a23214-111d-4fbd-9e5c-253ae2d20e2f︡︡{"html":"<div>$a = 2 e^1 -e^2 + 3 e^3$</div>","done":false}︡{"done":true}
︠bc1ce506-fa71-4ed3-84ab-3909e298c6f4i︠
%html
<p>The notation $e^i$ stands for the elements of the basis dual to $e$, i.e. the basis of the dual module $M^*$ such that \[ e^i(e_j) = \delta^i_{\ \, j} \]</p>
<p>Indeed</p>

︡a2cb3705-f212-43a1-b29e-097dea5b4458︡︡{"done":true,"html":"<p>The notation $e^i$ stands for the elements of the basis dual to $e$, i.e. the basis of the dual module $M^*$ such that \\[ e^i(e_j) = \\delta^i_{\\ \\, j} \\]</p>\n<p>Indeed</p>"}
︠b669e171-fbeb-4f8e-96b2-5a2c46db5ee1s︠
ed = e.dual_basis()
ed
︡74f779ac-ec36-4ada-878d-15f34f8022c1︡︡{"html":"<div>$\\left(e^1,e^2,e^3\\right)$</div>","done":false}︡{"done":true}
︠d0f1db18-3bf5-454e-aa27-be5064d262des︠
print ed[1]
︡0abea853-2075-4e22-afe6-45474f7a980d︡︡{"stdout":"Linear form e^1 on the Rank-3 free module M over the Integer Ring\n","done":false}︡{"done":true}
︠12dc2b1f-10fb-4871-9e30-9b3ac3dd281fs︠
ed[1](e[1]), ed[1](e[2]), ed[1](e[3])
︡ad25e42d-8786-4f0f-82d8-ab6e1291d3e2︡︡{"html":"<div>($1$, $0$, $0$)</div>","done":false}︡{"done":true}
︠7128168e-6abd-4ca6-a25f-8c7b62840d88s︠
ed[2](e[1]), ed[2](e[2]), ed[2](e[3])
︡f3c1eeeb-6dc3-4000-a89c-3de4ccfdd7b8︡︡{"html":"<div>($0$, $1$, $0$)</div>","done":false}︡{"done":true}
︠eb3300c1-d906-4465-a32e-01606ce5c0b2s︠
ed[3](e[1]), ed[3](e[2]), ed[3](e[3])
︡b58a505d-138f-4c73-a1fc-694a88e12aa5︡︡{"html":"<div>($0$, $0$, $1$)</div>","done":false}︡{"done":true}
︠4d73c20a-a21a-4a61-ae49-795517d1ddbai︠
%html
<p>The linear form $a$ can also be defined by its components with respect to the basis dual to $f$:</p>

︡8979c619-24a7-4fb0-8189-06fba895b4a7︡︡{"done":true,"html":"<p>The linear form $a$ can also be defined by its components with respect to the basis dual to $f$:</p>"}
︠5e49df00-26ed-4706-9c11-4863a418cdc9s︠
a[f,:] = [2,-1,3]
a.disp(f)
︡a524d75f-30e1-498e-8b4e-e98cdaba6308︡︡{"html":"<div>$a = 2 f^1 -f^2 + 3 f^3$</div>","done":false}︡{"done":true}
︠5e72c566-2c7a-4b70-bc8f-22dbf07fe1d0i︠
%html
<p>For consistency, the previously defined components with respect to the basis dual to $e$ are automatically deleted and new ones are computed from the change-of-basis formula:</p>

︡b16db677-d6a7-4494-bccf-a099408bd15b︡︡{"done":true,"html":"<p>For consistency, the previously defined components with respect to the basis dual to $e$ are automatically deleted and new ones are computed from the change-of-basis formula:</p>"}
︠c50e3cb1-9c4d-49e9-9446-438c43b3ea0bs︠
a.disp()
︡eff7b195-bc18-47a3-8e24-183f5e029967︡︡{"html":"<div>$a = -36 e^1 -9 e^2 + 4 e^3$</div>","done":false}︡{"done":true}
︠50213a83-d275-439b-ba4e-a1ded4dcd8aci︠
%html
<p>By definition, linear forms belong to the dual module:</p>

︡83edfda0-0540-4e85-9d26-1e05ea7dfce1︡︡{"done":true,"html":"<p>By definition, linear forms belong to the dual module:</p>"}
︠bce8e6a3-f675-4947-a44a-dc17666805c4s︠
a.parent()
︡61698307-b375-4f3d-b908-54ec228abaca︡︡{"html":"<div>$M^*$</div>","done":false}︡{"done":true}
︠675ad312-d711-4293-af76-3238ef8a210es︠
print a.parent()
︡96d795a6-d17c-451d-a77d-ac36c1ff9f95︡︡{"stdout":"Dual of the Rank-3 free module M over the Integer Ring\n","done":false}︡{"done":true}
︠978c9d53-5327-412a-bc0d-4089c1bfe5e1s︠
a.parent() is M.dual()
︡971b5cb0-2c99-4b3f-b4d2-1622345589aa︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠7d2563bf-9073-43fc-8c01-19d5818bd3b7i︠
%html
<p>The dual module is itself a free module of the same rank as $M$:</p>

︡13e71ca8-b426-423d-859b-cf0ae8c08850︡︡{"done":true,"html":"<p>The dual module is itself a free module of the same rank as $M$:</p>"}
︠403c0a80-ec8d-4059-b203-21d75de06fees︠
isinstance(M.dual(), FiniteRankFreeModule)
︡d4fc15b3-a577-486c-acf1-ade5efe61b06︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠ae78763d-9200-426d-9f3f-9042ec0786des︠
M.dual().rank()
︡f253d7fb-e828-4bf8-9b24-3adf134fb863︡︡{"html":"<div>$3$</div>","done":false}︡{"done":true}
︠5d980568-a7a6-4463-8f85-5ceb98a66a41i︠
%html
<p>Linear forms map module elements to ring elements:</p>

︡9207f7b8-2962-4a06-a466-47db5d1a0051︡︡{"done":true,"html":"<p>Linear forms map module elements to ring elements:</p>"}
︠72ec0cd3-84b5-4b51-92d7-64b44fba2b6cs︠
a(v)
︡dc04448d-40d4-4291-a57d-e4a719aaf305︡︡{"html":"<div>$-68$</div>","done":false}︡{"done":true}
︠ca1537dc-0971-4da7-a048-50e28d774532s︠
a(u)
︡1c06618a-fb3f-47bf-bf99-fd62b47feea2︡︡{"html":"<div>$10$</div>","done":false}︡{"done":true}
︠7c7f9664-0206-4752-a578-7f3a0a515995i︠
%html
<p>in a linear way:</p>

︡80b71b2f-8b38-4a15-a670-b07289a91fb9︡︡{"done":true,"html":"<p>in a linear way:</p>"}
︠9588b865-9923-4c8b-9c74-21c1cd869196s︠
a(u+2*v) == a(u) + 2*a(v)
︡d3b2670c-82b7-4a71-98fb-4fb45fa8bbbe︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠64d805b5-9bf4-42c2-a979-2a96c01db813i︠
%html
<h2>Alternating forms</h2>
<p>Let us introduce a second linear form, $b$, on the free module $M$:</p>

︡3bfe4f8a-23ca-47a7-bb76-5fe1655902d7︡︡{"done":true,"html":"<h2>Alternating forms</h2>\n<p>Let us introduce a second linear form, $b$, on the free module $M$:</p>"}
︠477c4ac0-fc2e-4a5f-a2cc-3bfa6a6ab2a9s︠
b = M.linear_form('b')
b[:] = [-4,2,5]
︡c7660022-0447-4bc0-9def-f033a1a3714c︡︡{"done":true}
︠094efd2c-a98a-4ff0-b86d-b65322fb90f7i︠
%html
<p>and take its exterior product with the linear form $a$:</p>

︡27d14af9-ae57-4a2e-8ebd-0c691f7ff5fb︡︡{"done":true,"html":"<p>and take its exterior product with the linear form $a$:</p>"}
︠213e5823-c1f8-42f7-b140-cea86ab90bfcs︠
c = a.wedge(b)
print c
c
︡776bd79b-d7f8-4988-bf87-9b6c641c7915︡︡{"stdout":"Alternating form a/\\b of degree 2 on the Rank-3 free module M over the Integer Ring\n","done":false}︡{"html":"<div>$a\\wedge b$</div>","done":false}︡{"done":true}
︠7c92dde7-6801-4bf8-bca6-ef7dc6f6bdd3s︠
c.disp()
︡9b557f58-0e38-461d-9843-64c7ea7f5e94︡︡{"html":"<div>$a\\wedge b = -108 e^1\\wedge e^2 -164 e^1\\wedge e^3 -53 e^2\\wedge e^3$</div>","done":false}︡{"done":true}
︠4a922612-68af-4de6-abd7-7b19be3ebbf2s︠
c.disp(f)
︡e24f830f-877b-42ea-b341-6dd396655bd7︡︡{"html":"<div>$a\\wedge b = 12 f^1\\wedge f^2 + 70 f^1\\wedge f^3 -53 f^2\\wedge f^3$</div>","done":false}︡{"done":true}
︠b7139f61-4d3c-4e21-8890-5372b9a0e395s︠
c(u,v)
︡b205b5a4-c9f1-43f5-9709-c340304dfca6︡︡{"html":"<div>$8894$</div>","done":false}︡{"done":true}
︠5456e827-1154-4e83-b033-095498e284ebi︠
%html
<p>$c$ is antisymmetric:</p>

︡162dc140-bcd8-41ee-bc4d-bf6515b9730c︡︡{"done":true,"html":"<p>$c$ is antisymmetric:</p>"}
︠16da0823-2f6d-4d80-a0bc-816faad8ef1as︠
c(v,u)
︡61d96e2c-cd30-41ca-b2ea-f98b6eb67a4a︡︡{"html":"<div>$-8894$</div>","done":false}︡{"done":true}
︠08704d53-eec3-4492-9a0d-69657863dcd0i︠
%html
<p>and is multilinear:</p>

︡532ede59-8732-4956-8a45-8861654ade3c︡︡{"done":true,"html":"<p>and is multilinear:</p>"}
︠ae2f325c-1b30-44cf-9c38-f32bffd4996bs︠
c(u+4*w,v) == c(u,v) + 4*c(w,v)
︡59e65e20-83fd-4e19-8bb9-b85b0bda09a9︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠d2169fbf-5de8-4ff1-b819-efaddb955c38i︠
%html
<p>We may check the standard formula for the exterior product of two linear forms:</p>

︡f9a75bc8-9889-491d-b38e-f02b13177dd5︡︡{"done":true,"html":"<p>We may check the standard formula for the exterior product of two linear forms:</p>"}
︠09bbd09b-0c5d-4198-afc5-0d79993527bbs︠
c(u,v) == a(u)*b(v) - b(u)*a(v)
︡28b39b06-f583-4f87-92ba-644444402010︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠e7aafb07-e128-4e27-a37e-b13b3c3b86e4i︠
%html
<p>In terms of tensor product (denoted here by *), it reads</p>

︡05140ce2-b81e-4e14-8d44-d006e90fc85c︡︡{"done":true,"html":"<p>In terms of tensor product (denoted here by *), it reads</p>"}
︠e84d19f8-09c9-482b-9321-b73297d78d1bs︠
c == a*b - b*a
︡16d3fdca-a706-4d02-bc3d-5688d54bd534︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠085b3f15-591f-49cd-a149-8692377cdbd4i︠
%html
<p>The parent of the alternating form $c$ is the second external power of the dual module $M^*$, which is denoted by $\Lambda^2(M^*)$:</p>

︡7b1c7818-6512-403b-a60f-75254d688c2b︡︡{"done":true,"html":"<p>The parent of the alternating form $c$ is the second external power of the dual module $M^*$, which is denoted by $\\Lambda^2(M^*)$:</p>"}
︠f39ccc87-e83e-45e2-97b0-3ff66fa0149es︠
c.parent()
︡0c0e6cae-c257-4744-9184-6bb7b74f6914︡︡{"html":"<div>$\\Lambda^{2}\\left(M^*\\right)$</div>","done":false}︡{"done":true}
︠adb99b8e-fab1-486e-a458-8247983cfe30s︠
print c.parent()
︡ec7698fe-f9f6-417d-8ad7-6a7aa212dc56︡︡{"stdout":"2nd exterior power of the dual of the Rank-3 free module M over the Integer Ring\n","done":false}︡{"done":true}
︠7a29c358-fcd8-4ffe-8c45-4a1eeda7ddaci︠
%html
<p>$c$ is a tensor field of type $(0,2)$:</p>

︡fd59729c-a86e-4e80-8370-a20a45b9ad46︡︡{"done":true,"html":"<p>$c$ is a tensor field of type $(0,2)$:</p>"}
︠c23507d5-c65d-40a9-adcc-9707aa3b845fs︠
c.tensor_type()
︡c0513ed3-f524-4e3f-807d-d895f007d7ea︡︡{"html":"<div>($0$, $2$)</div>","done":false}︡{"done":true}
︠ba826ac2-be53-4268-8ff0-03cd3f058571i︠
%html
<p>whose components with respect to any basis are antisymmetric:</p>

︡2d783004-30f9-4b53-86d1-2a3c2261a9cc︡︡{"done":true,"html":"<p>whose components with respect to any basis are antisymmetric:</p>"}
︠02d66e6a-4fcd-4385-b65b-b5baf5a33c36s︠
c[:]  # components with respect to the default basis (e)
︡7f00cb2c-8d67-440e-9988-619b8d92de0b︡︡{"html":"<div>$\\left(\\begin{array}{rrr}\n0 &amp; -108 &amp; -164 \\\\\n108 &amp; 0 &amp; -53 \\\\\n164 &amp; 53 &amp; 0\n\\end{array}\\right)$</div>","done":false}︡{"done":true}
︠ff327778-a00f-4720-b3a3-cf57a68bd6c1s︠
c[f,:] # components with respect to basis f
︡948a4168-801a-47f9-b50e-905680f71a1d︡︡{"html":"<div>$\\left(\\begin{array}{rrr}\n0 &amp; 12 &amp; 70 \\\\\n-12 &amp; 0 &amp; -53 \\\\\n-70 &amp; 53 &amp; 0\n\\end{array}\\right)$</div>","done":false}︡{"done":true}
︠a554ccd7-05ec-4775-8abb-d9782b907db1s︠
c.comp(f)
︡c51f3f8c-bce1-4eb5-aaeb-055be33ae1a5︡︡{"html":"<div>$\\text{\\texttt{Fully{ }antisymmetric{ }2{-}indices{ }components{ }w.r.t.{ }Basis{ }(f{\\char`\\_}1,f{\\char`\\_}2,f{\\char`\\_}3){ }on{ }the{ }Rank{-}3{ }free{ }module{ }M{ }over{ }the{ }Integer{ }Ring}}$</div>","done":false}︡{"done":true}
︠7dac864a-bf65-482e-8db7-46f564e307e1i︠
%html
<p>An alternating form can be constructed from scratch:</p>

︡38f00d1d-c2b6-47e3-8602-e68204438522︡︡{"done":true,"html":"<p>An alternating form can be constructed from scratch:</p>"}
︠0356a753-cc39-4349-8f7f-79abdb56f0e7s︠
c1 = M.alternating_form(2)  # 2 stands for the degree
︡9e9da605-131a-4876-85c3-c096091a5724︡︡{"done":true}
︠69b2c9ba-9672-45b2-9e3d-d8db844f104ai︠
%html
<p>Only the non-zero and non-redundant components are to be defined (the others are deduced by antisymmetry); for the components with respect to the default basis, we write:</p>

︡f9810e5b-e7b5-4471-a121-e3059c73d2b4︡︡{"done":true,"html":"<p>Only the non-zero and non-redundant components are to be defined (the others are deduced by antisymmetry); for the components with respect to the default basis, we write:</p>"}
︠470caefc-e0cf-461c-a3c1-62bcb05026b6s︠
c1[1,2] = -108
c1[1,3] = -164
c1[2,3] = -53
︡8d6be67c-2bab-40e9-bb74-04065078d93e︡︡{"done":true}
︠1c3c167e-e03e-499b-a92a-b92c42d8358ai︠
%html
<p>Then</p>

︡1a120890-d874-496c-8664-645ec61abdad︡︡{"done":true,"html":"<p>Then</p>"}
︠55acf566-fe8f-4a3f-8dbf-7926a5ac4575s︠
c1[:]
︡2d5f7095-79ba-47f1-a49c-bde5b1e84223︡︡{"html":"<div>$\\left(\\begin{array}{rrr}\n0 &amp; -108 &amp; -164 \\\\\n108 &amp; 0 &amp; -53 \\\\\n164 &amp; 53 &amp; 0\n\\end{array}\\right)$</div>","done":false}︡{"done":true}
︠1c362383-f2d9-40d8-b3be-026d110932dcs︠
c1 == c
︡5fdcfd8b-5b9f-45c7-b1ac-9f4600766bab︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠c77ff9d3-5ca1-406b-953f-019db1ce95ddi︠
%html
<p>Internally, only non-redundant components are stored, in a dictionary whose keys are the indices:</p>

︡fff29494-65ba-4413-b65a-900d50b07295︡︡{"done":true,"html":"<p>Internally, only non-redundant components are stored, in a dictionary whose keys are the indices:</p>"}
︠4bc34a18-9300-4412-babf-6834a5e1a007s︠
c.comp(e)._comp
︡af113c28-8642-4c61-b788-29e37fe57416︡︡{"html":"<div>$\\left\\{\\left(1, 2\\right) : -108, \\left(1, 3\\right) : -164, \\left(2, 3\\right) : -53\\right\\}$</div>","done":false}︡{"done":true}
︠9c84c11f-7024-4bff-ad95-12ea1b324cd0s︠
c.comp(f)._comp
︡174895fa-3348-4e1f-98f5-34fad07da161︡︡{"html":"<div>$\\left\\{\\left(1, 2\\right) : 12, \\left(1, 3\\right) : 70, \\left(2, 3\\right) : -53\\right\\}$</div>","done":false}︡{"done":true}
︠6cca90d8-f176-4999-88d8-7472150487dbi︠
%html
<p>The other components are deduced by antisymmetry.</p>

<p>The exterior product of a linear form with an alternating form of degree 2 leads to an alternating form of degree 3:</p>

︡ce8ec0db-9198-401c-b852-ecaa63ad3707︡︡{"done":true,"html":"<p>The other components are deduced by antisymmetry.</p>\n\n<p>The exterior product of a linear form with an alternating form of degree 2 leads to an alternating form of degree 3:</p>"}
︠3255b225-4172-4eaa-8d22-adf31d8a2ea5s︠
d = M.linear_form('d')
d[:] = [-1,-2,4]
s = d.wedge(c)
print s
︡fdfc64e2-08c3-4af5-8571-1f39c5310023︡︡{"stdout":"Alternating form d/\\a/\\b of degree 3 on the Rank-3 free module M over the Integer Ring\n","done":false}︡{"done":true}
︠b68d73e7-5c94-46f9-8b47-7b0f090b5d00s︠
s.disp()
︡7064f349-d7e0-444b-9233-d8cac6ec8aa6︡︡{"html":"<div>$d\\wedge a\\wedge b = -707 e^1\\wedge e^2\\wedge e^3$</div>","done":false}︡{"done":true}
︠12a4b679-282b-497f-9f90-1f2e105800e1s︠
s.disp(f)
︡d30189ef-06aa-4bca-af23-e9c2a2468cbc︡︡{"html":"<div>$d\\wedge a\\wedge b = 707 f^1\\wedge f^2\\wedge f^3$</div>","done":false}︡{"done":true}
︠334ada1a-7b2e-4fce-820e-38f6d0ca38d6s︠
s(e[1], e[2], e[3])
︡773c7ec5-8f97-452e-94bc-6324df888dd4︡︡{"html":"<div>$-707$</div>","done":false}︡{"done":true}
︠73ac8d4e-4c3d-4dc5-a95a-0818d6cfd4e0s︠
s(f[1], f[2], f[3])
︡dd81f14b-080f-4365-9fdd-ebce23f93874︡︡{"html":"<div>$707$</div>","done":false}︡{"done":true}
︠726d3a95-2be0-40e4-9791-bc3392a86fd5i︠
%html
<p>$s$ is antisymmetric:</p>

︡24bbb8e4-6107-47fa-9b9e-19cc3176712e︡︡{"done":true,"html":"<p>$s$ is antisymmetric:</p>"}
︠d9215e2a-d702-48c8-b85b-72c8d023de55s︠
s(u,v,w), s(u,w,v), s(v,w,u), s(v,u,w), s(w,u,v), s(w,v,u)
︡9805948f-eb5f-40f5-ab0b-328be1547898︡︡{"html":"<div>($-144228$, $144228$, $-144228$, $144228$, $-144228$, $144228$)</div>","done":false}︡{"done":true}
︠030e6eb4-70f3-4721-8caa-d9ecce58b2d0i︠
%html
<h2>Tensors</h2>
<p>$k$ and $l$ being non negative integers, a tensor of type $(k,l)$ on the free module $M$ is a multilinear map</p>
<p>\[ t: \underbrace{M^*\times\cdots\times M^*}_{k\ \; \mbox{times}}<br />&nbsp;&nbsp;&nbsp; \times \underbrace{M\times\cdots\times M}_{l\ \; \mbox{times}}<br />&nbsp;&nbsp;&nbsp; \longrightarrow R \]</p>
<p>In the present case the ring $R$ is $\mathbb{Z}$.</p>
<p>For free modules of finite rank, we have the canonical isomorphism $M^{**} \simeq M$, so that the set of all tensors of type $(k,l)$ can be identified with the tensor product</p>
<p>\[ T^{(k,l)}(M) = \underbrace{M\otimes\cdots\otimes M}_{k\ \; \mbox{times}}<br />&nbsp;&nbsp;&nbsp; \otimes \underbrace{M^*\otimes\cdots\otimes M^*}_{l\ \; \mbox{times}} \]</p>
<p>In particular, tensors of type $(1,0)$ are identified with elements of $M$:</p>

︡e6f208e1-b257-4a70-83be-2b3ebdc330fb︡︡{"done":true,"html":"<h2>Tensors</h2>\n<p>$k$ and $l$ being non negative integers, a tensor of type $(k,l)$ on the free module $M$ is a multilinear map</p>\n<p>\\[ t: \\underbrace{M^*\\times\\cdots\\times M^*}_{k\\ \\; \\mbox{times}}<br />&nbsp;&nbsp;&nbsp; \\times \\underbrace{M\\times\\cdots\\times M}_{l\\ \\; \\mbox{times}}<br />&nbsp;&nbsp;&nbsp; \\longrightarrow R \\]</p>\n<p>In the present case the ring $R$ is $\\mathbb{Z}$.</p>\n<p>For free modules of finite rank, we have the canonical isomorphism $M^{**} \\simeq M$, so that the set of all tensors of type $(k,l)$ can be identified with the tensor product</p>\n<p>\\[ T^{(k,l)}(M) = \\underbrace{M\\otimes\\cdots\\otimes M}_{k\\ \\; \\mbox{times}}<br />&nbsp;&nbsp;&nbsp; \\otimes \\underbrace{M^*\\otimes\\cdots\\otimes M^*}_{l\\ \\; \\mbox{times}} \\]</p>\n<p>In particular, tensors of type $(1,0)$ are identified with elements of $M$:</p>"}
︠16c4ab44-f976-42a4-8f1d-89ecf2a87ec4s︠
M.tensor_module(1,0) is M
︡0ae14258-aa07-4a1b-ab48-0e625b76bdf3︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠04b01cb3-b6fc-450a-bc86-1ff9f22d176ds︠
v.tensor_type()
︡a8f62a0e-59e7-45f2-a473-86ffd271915d︡︡{"html":"<div>($1$, $0$)</div>","done":false}︡{"done":true}
︠559dc7af-a3c5-4391-9872-50b20f15ed7fi︠
%html
<p>According to the above definition, linear forms are tensors of type (0,1):</p>

︡b35b6ac8-61bd-4635-aa44-191cd96bcb06︡︡{"done":true,"html":"<p>According to the above definition, linear forms are tensors of type (0,1):</p>"}
︠b21c248c-927d-41cb-896b-39af657bb6cfs︠
a in M.tensor_module(0,1)
︡74f3b2f6-4dbe-4284-b216-92a91d3342c2︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠664a2e59-85fa-4713-a56c-2aee00c87b1ai︠
%html
<p>Note that, at the Python level, we do <em>not</em> have the identification of $T^{(0,1)}(M)$ with $M^*$:</p>

︡edbe1c6b-cd5b-4b3a-bd5e-73a3de9805a7︡︡{"done":true,"html":"<p>Note that, at the Python level, we do <em>not</em> have the identification of $T^{(0,1)}(M)$ with $M^*$:</p>"}
︠79f7387d-b097-4de2-bc24-b097bb05cb93s︠
M.tensor_module(0,1) is M.dual()
︡3bc0f4ed-c468-413e-8243-96757461a676︡︡{"html":"<div>$\\mathrm{False}$</div>","done":false}︡{"done":true}
︠31103571-a8ce-4111-aeee-cef13415f34ei︠
%html
<p>This is because $T^{(0,1)}(M)$ and $M^*$ are different objects:</p>

︡e773b556-1988-4ebe-b80b-5604f14e0ffd︡︡{"done":true,"html":"<p>This is because $T^{(0,1)}(M)$ and $M^*$ are different objects:</p>"}
︠e174df76-aa98-4b66-9805-f2a036a359b8s︠
type(M.tensor_module(0,1))
︡7ebacdfc-5c30-4520-8e07-946fadd083d8︡︡{"stdout":"<class 'sage.tensor.modules.tensor_free_module.TensorFreeModule_with_category'>\n","done":false}︡{"done":true}
︠30fe76f5-323e-44e2-888a-37bb6876c97bs︠
type(M.dual())
︡171c2772-8ef4-402e-90c8-79bc942ceb55︡︡{"stdout":"<class 'sage.tensor.modules.ext_pow_free_module.ExtPowerFreeModule_with_category'>\n","done":false}︡{"done":true}
︠ea389575-9d8d-475b-a2ae-bf7388236dcfi︠
%html
<p>However, we have coercion (automatic conversion) of elements of $M^*$ into elements of $T^{(0,1)}(M)$:</p>

︡5c650e80-8df8-4daa-b779-0429a37b654a︡︡{"done":true,"html":"<p>However, we have coercion (automatic conversion) of elements of $M^*$ into elements of $T^{(0,1)}(M)$:</p>"}
︠068ea03c-9a0c-4d11-8098-d5fb675dbb6es︠
M.tensor_module(0,1).has_coerce_map_from(M.dual())
︡ce001663-ab87-45b1-9724-d2fc5c2ed7c2︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠3e743b2a-8f4c-416e-8f1b-6f5626d9df09i︠
%html
<p>as well as coercion in the reverse direction:</p>

︡0c18dd61-db6a-4893-992c-8812b11914d4︡︡{"done":true,"html":"<p>as well as coercion in the reverse direction:</p>"}
︠bc91684e-da69-48c5-8d9e-9c600ac3059ds︠
M.dual().has_coerce_map_from(M.tensor_module(0,1))
︡971a5356-c7e7-4dc8-9139-c2080bf7497d︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠af1f5daa-7b54-41c4-8aa2-1779255e4478i︠
%html
<p>Arbitrary tensors are constructed via the module method <span style="font-family: courier new,courier;">tensor()</span>, by providing the tensor type $(k,l)$ and possibly the symbol to denote the tensor:</p>

︡c6179048-dd5e-46ef-8268-513569bfb185︡︡{"done":true,"html":"<p>Arbitrary tensors are constructed via the module method <span style=\"font-family: courier new,courier;\">tensor()</span>, by providing the tensor type $(k,l)$ and possibly the symbol to denote the tensor:</p>"}
︠5d743fe7-09fb-441f-9f84-b85a39343937s︠
t = M.tensor((1,1), name='t')
print t
︡0682221b-c6b1-4fa3-bc8b-742b068b9466︡︡{"stdout":"Type-(1,1) tensor t on the Rank-3 free module M over the Integer Ring\n","done":false}︡{"done":true}
︠68e88cba-6ddb-43e3-a613-249684c90487i︠
%html
<p>Let us set some component of $t$ in the basis $e$, for instance the component $t^1_{\ \, 2}$:</p>

︡10297ca4-3910-491f-ac89-b227c468f108︡︡{"done":true,"html":"<p>Let us set some component of $t$ in the basis $e$, for instance the component $t^1_{\\ \\, 2}$:</p>"}
︠f97c6880-18a5-4842-9b3f-2b4394671d4es︠
t[e,1,2] = -3
︡1b53180b-81d7-4416-b4a0-ea0e512ab3d7︡︡{"done":true}
︠003ceebc-5a77-4d36-ae5f-5f3c63349bc2i︠
%html
<p>Since $e$ is the default basis, a shortcut for the above is</p>

︡d89ab4a5-67ed-4ff6-a2a5-f749f55d87a6︡︡{"done":true,"html":"<p>Since $e$ is the default basis, a shortcut for the above is</p>"}
︠6837ec1e-ec92-4215-a823-455e75158e52s︠
t[1,2] = -3
︡a64846cd-4375-45de-a625-b687aa795323︡︡{"done":true}
︠8a18386e-6091-4481-93fb-2df471de5d70i︠
%html
<p>The unset components are zero:</p>

︡0cb0bb33-8ad7-4b26-adbf-dd18de295c8a︡︡{"done":true,"html":"<p>The unset components are zero:</p>"}
︠08a1d601-d7b5-4ee1-b3b9-4e90d14783eas︠
t[:]
︡cb01f60f-b6fd-4649-815d-605b58faf968︡︡{"html":"<div>$\\left(\\begin{array}{rrr}\n0 &amp; -3 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0\n\\end{array}\\right)$</div>","done":false}︡{"done":true}
︠9b51c2e2-2271-4a6b-b4b8-17da11ff90bbi︠
%html
<p>Components can be set at any time:</p>

︡e492dbbc-25cd-43cd-99b8-5505f3cfd611︡︡{"done":true,"html":"<p>Components can be set at any time:</p>"}
︠05833adf-e402-4450-9084-735c81e34fe5s︠
t[2,3] = 4
t[:]
︡2cd366eb-5c54-4d43-8ab3-3425b36ea57d︡︡{"html":"<div>$\\left(\\begin{array}{rrr}\n0 &amp; -3 &amp; 0 \\\\\n0 &amp; 0 &amp; 4 \\\\\n0 &amp; 0 &amp; 0\n\\end{array}\\right)$</div>","done":false}︡{"done":true}
︠ea2ec10f-333f-4897-9b22-cf7de184fd55i︠
%html
<p>The components with respect to the basis $f$ are evaluated by the change-of-basis formula $e\rightarrow f$:</p>

︡0913aa6c-c8c3-4818-994e-c40aca3259a1︡︡{"done":true,"html":"<p>The components with respect to the basis $f$ are evaluated by the change-of-basis formula $e\\rightarrow f$:</p>"}
︠d55382ae-c8b0-4fd3-8ebf-4bc976a8cc5fs︠
t[f,:]
︡d606ebf7-c303-40ef-babd-1e395d185b59︡︡{"html":"<div>$\\left(\\begin{array}{rrr}\n6 &amp; 3 &amp; 3 \\\\\n-108 &amp; -6 &amp; 6 \\\\\n80 &amp; 8 &amp; 0\n\\end{array}\\right)$</div>","done":false}︡{"done":true}
︠71bb75b0-1ce4-4a80-a97d-55c9cc33f6bei︠
%html
<p>Another view of $t$, which reflects the fact that $T^{(1,1)}(M) = M\otimes M^*$, is</p>

︡7d734589-2bc5-46d1-90c1-2704b4fcc29c︡︡{"done":true,"html":"<p>Another view of $t$, which reflects the fact that $T^{(1,1)}(M) = M\\otimes M^*$, is</p>"}
︠27dc2132-7ac8-4133-9c00-48ff45d1279ds︠
t.disp()
︡cb264584-74ad-47c7-8d9e-00b09755e1d5︡︡{"html":"<div>$t = -3 e_1\\otimes e^2 + 4 e_2\\otimes e^3$</div>","done":false}︡{"done":true}
︠4526af3f-f281-49dc-a99a-10d88a9c13d7i︠
%html
<p>Recall that $(e^i)$ is the basis of $M^*$ that is dual to the basis $(e_i)$ of $M$.</p>
<p>In term of the basis $(f_i)$ and its dual basis $(f^i)$, we have</p>

︡b296c0bd-02a0-44b3-a7e6-a831f475ab6c︡︡{"done":true,"html":"<p>Recall that $(e^i)$ is the basis of $M^*$ that is dual to the basis $(e_i)$ of $M$.</p>\n<p>In term of the basis $(f_i)$ and its dual basis $(f^i)$, we have</p>"}
︠e39cf6a9-ed6f-4cda-97d1-56f931958fb6s︠
t.disp(f)
︡1a4ff923-10c5-4cbe-830f-cfe8db2bc8f5︡︡{"html":"<div>$t = 6 f_1\\otimes f^1 + 3 f_1\\otimes f^2 + 3 f_1\\otimes f^3 -108 f_2\\otimes f^1 -6 f_2\\otimes f^2 + 6 f_2\\otimes f^3 + 80 f_3\\otimes f^1 + 8 f_3\\otimes f^2$</div>","done":false}︡{"done":true}
︠3df164e2-4f33-48d1-bea3-6293c2f6624ei︠
%html
<p>As a tensor of type (1,1), $t$ maps pairs (linear form, module element) to ring elements:</p>

︡616e9a4b-a629-4c66-8bd9-8027894f2f11︡︡{"done":true,"html":"<p>As a tensor of type (1,1), $t$ maps pairs (linear form, module element) to ring elements:</p>"}
︠4af4b4dc-e80b-4e41-82ab-9d67fafe1af9s︠
t(a,v)
︡2995236a-94b8-47f4-8756-eb1033cd3e35︡︡{"html":"<div>$-468$</div>","done":false}︡{"done":true}
︠6a96396e-c092-44bd-9475-0eb3d105e3abs︠
t(a,v).parent()
︡c5576b1e-9e35-4ef9-a180-85f063b2038f︡︡{"html":"<div>$\\Bold{Z}$</div>","done":false}︡{"done":true}
︠3647c259-89a6-491b-be9d-312ae2ccf343i︠
%html
<p>Tensors of type (1,1) can be considered as endomorphisms, thanks to the isomorphism</p>
<p>\[ \begin{array}{cccccc} \mathrm{End}(M) &amp; \longrightarrow &amp; T^{(1,1)}(M) \\ \tilde t &amp; \longmapsto &amp;&nbsp; t: &amp; M^*\times M &amp; \longrightarrow &amp; R \\&amp;&nbsp;&nbsp;&nbsp;&nbsp; &amp; &amp; (a,v) &amp; \longmapsto &amp; a(\tilde t(v)) \end{array} \]</p>

︡fec22667-bc50-4602-ab9a-ee2d463b64f9︡︡{"done":true,"html":"<p>Tensors of type (1,1) can be considered as endomorphisms, thanks to the isomorphism</p>\n<p>\\[ \\begin{array}{cccccc} \\mathrm{End}(M) &amp; \\longrightarrow &amp; T^{(1,1)}(M) \\\\ \\tilde t &amp; \\longmapsto &amp;&nbsp; t: &amp; M^*\\times M &amp; \\longrightarrow &amp; R \\\\&amp;&nbsp;&nbsp;&nbsp;&nbsp; &amp; &amp; (a,v) &amp; \\longmapsto &amp; a(\\tilde t(v)) \\end{array} \\]</p>"}
︠7de13d09-ef5e-40fd-b553-424b8bbe3279s︠
tt = End(M)(t)
print tt
︡dbc83a76-0fb8-492b-bbf4-30aceccaa69e︡︡{"stdout":"Generic endomorphism of Rank-3 free module M over the Integer Ring\n","done":false}︡{"done":true}
︠c4c93275-d751-498f-a868-3e19ded71c3ds︠
tt.parent()
︡ed004e75-d7ca-49c1-b33f-a2d1aadd86a1︡︡{"html":"<div>$\\mathrm{Hom}\\left(M,M\\right)$</div>","done":false}︡{"done":true}
︠dfa64368-28a6-49b5-a0d0-4329d2e600e5i︠
%html
<p>In a given basis, the matrix ${\tilde t}^i_{\ \, j}$ of the endomorphism $\tilde t$ is identical to the matrix of the tensor $t$:</p>

︡18713ed6-fae9-422e-9f45-3a0240bdcf44︡︡{"done":true,"html":"<p>In a given basis, the matrix ${\\tilde t}^i_{\\ \\, j}$ of the endomorphism $\\tilde t$ is identical to the matrix of the tensor $t$:</p>"}
︠17ef7ba9-a3cf-4b42-bc96-4e7a7a3a946bs︠
tt.matrix(e)
︡9b297a07-9f08-45cd-8c98-5796423d3749︡︡{"html":"<div>$\\left(\\begin{array}{rrr}\n0 &amp; -3 &amp; 0 \\\\\n0 &amp; 0 &amp; 4 \\\\\n0 &amp; 0 &amp; 0\n\\end{array}\\right)$</div>","done":false}︡{"done":true}
︠9d9b8a35-9acd-4760-988c-51329c71b0b9s︠
t[e,:]
︡b5b76868-5f15-42d3-a839-4d5d68759886︡︡{"html":"<div>$\\left(\\begin{array}{rrr}\n0 &amp; -3 &amp; 0 \\\\\n0 &amp; 0 &amp; 4 \\\\\n0 &amp; 0 &amp; 0\n\\end{array}\\right)$</div>","done":false}︡{"done":true}
︠1434ab11-831a-4e22-8952-af842c6680e3s︠
tt.matrix(e) == t[e,:]
︡06909d5f-ae51-4f5f-849d-14876117d39e︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠3fa7ac9c-e251-4cac-9117-afde6fead87bs︠
tt.matrix(f)
︡290d2473-3464-4ff0-b1eb-f5861b47fa47︡︡{"html":"<div>$\\left(\\begin{array}{rrr}\n6 &amp; 3 &amp; 3 \\\\\n-108 &amp; -6 &amp; 6 \\\\\n80 &amp; 8 &amp; 0\n\\end{array}\\right)$</div>","done":false}︡{"done":true}
︠94c82e98-36a1-46c4-a09d-4c98bb171916s︠
t[f,:]
︡842b77ad-7c00-4725-8f76-a1b18c93bf3f︡︡{"html":"<div>$\\left(\\begin{array}{rrr}\n6 &amp; 3 &amp; 3 \\\\\n-108 &amp; -6 &amp; 6 \\\\\n80 &amp; 8 &amp; 0\n\\end{array}\\right)$</div>","done":false}︡{"done":true}
︠89479945-95c4-46b6-b442-92d9aa81df29s︠
tt.matrix(f) == t[f,:]
︡de779ca5-741c-4fd6-95ab-c826bc53c4eb︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠0cc7a4b2-c299-4e2c-98f8-b9f60c5feb05i︠
%html
<p>As an endomorphism, $t$ maps module elements to module elements:</p>

︡ef6b0392-61fe-470a-96af-2489a0bd1d3e︡︡{"done":true,"html":"<p>As an endomorphism, $t$ maps module elements to module elements:</p>"}
︠81181037-9dcd-4d3d-b6e7-b768fd681e3es︠
tt(v)
︡30ae1f7a-890d-41fd-bb02-104ccd4856a5︡︡{"html":"<div>$t\\left(v\\right)$</div>","done":false}︡{"done":true}
︠82934913-2504-4458-9c49-46ca8533a45bs︠
tt(v).parent()
︡1f10b6fe-e42b-43b5-aeb8-04f0e4b46822︡︡{"html":"<div>$M$</div>","done":false}︡{"done":true}
︠52714852-1839-44fb-b543-5a1cfb00d85fs︠
tt(v).disp()
︡e485e9cd-a3ab-476d-bc5d-cf68a6f8731b︡︡{"html":"<div>$t\\left(v\\right) = 12 e_1 + 4 e_2$</div>","done":false}︡{"done":true}
︠1787a4c8-9f7c-4d66-89b1-87ab0877f4bbi︠
%html
<p>$t$ belongs to the module $T^{(1,1)}(M)$:</p>

︡deb2c21a-1783-4d9e-a224-7632d9cc0c58︡︡{"done":true,"html":"<p>$t$ belongs to the module $T^{(1,1)}(M)$:</p>"}
︠f4533393-8f7e-438e-a53e-4ef8a2dc4002s︠
t in M.tensor_module(1,1)
︡fa4f17f8-657e-43c3-8a94-89c1c1f26699︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠655089fd-f316-4f04-9340-81b2d5cd915di︠
%html
<p>or, in Sage terminology,</p>

︡fa98acae-852e-43b5-86d3-526bddf2781a︡︡{"done":true,"html":"<p>or, in Sage terminology,</p>"}
︠76796530-2af1-4805-be9c-d6df72c8b473s︠
t.parent() is M.tensor_module(1,1)
︡5627ac64-061e-44d5-8ff9-fcaee8e33d38︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠32c77a68-d0a9-4c71-aa4c-8089c1468661i︠
%html
<p>$T^{(1,1)}(M)$ is itself a free module of finite rank over $\mathbb{Z}$:</p>

︡28cf52f6-e970-4132-9e09-07b7e9a01f9b︡︡{"done":true,"html":"<p>$T^{(1,1)}(M)$ is itself a free module of finite rank over $\\mathbb{Z}$:</p>"}
︠7359d2c6-4e3a-48b5-be95-be11cba74bbds︠
isinstance(M.tensor_module(1,1), FiniteRankFreeModule)
︡710d5a3e-7bd7-46e6-95c0-20d506ab61f2︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠334786fb-d04d-41c3-a362-664d0b729a82s︠
M.tensor_module(1,1).base_ring()
︡422ba90a-dad1-47ca-a6e4-b6bbfe260496︡︡{"html":"<div>$\\Bold{Z}$</div>","done":false}︡{"done":true}
︠5dc77259-8c88-4105-85be-ab8552d61bc3s︠
M.tensor_module(1,1).rank()
︡2ac9185d-81d2-47e3-ab33-b3111a4851d2︡︡{"html":"<div>$9$</div>","done":false}︡{"done":true}
︠96eff310-541c-4b21-b769-fc0f4f3a2f04i︠
%html
<h2>Tensor calculus</h2>
<p>In addition to the arithmetic operations inherent to the module structure of $T^{(k,l)}(M)$, the following operations are implemented:</p>
<ul>
<li>tensor product</li>
<li>symmetrization and antisymmetrization</li>
<li>tensor contraction</li>
</ul>

<h3>Tensor product</h3>
<p>The tensor product is formed with the * operator. For instance the tensor product $t\otimes a$ is</p>

︡fb0b5dcb-0eef-4824-bd55-54f78a6f8ecf︡︡{"done":true,"html":"<h2>Tensor calculus</h2>\n<p>In addition to the arithmetic operations inherent to the module structure of $T^{(k,l)}(M)$, the following operations are implemented:</p>\n<ul>\n<li>tensor product</li>\n<li>symmetrization and antisymmetrization</li>\n<li>tensor contraction</li>\n</ul>\n\n<h3>Tensor product</h3>\n<p>The tensor product is formed with the * operator. For instance the tensor product $t\\otimes a$ is</p>"}
︠cf1bb683-771c-49e4-a2b3-0c2b3c46cd8bs︠
ta = t*a
print ta
︡38d5a183-7925-4ae2-be3d-461f1592422a︡︡{"stdout":"Type-(1,2) tensor t*a on the Rank-3 free module M over the Integer Ring\n","done":false}︡{"done":true}
︠7b9e4551-5094-48f8-97b5-1accc8446130s︠
ta
︡1a467e46-041d-4b71-bb65-75ae7db55a93︡︡{"html":"<div>$t\\otimes a$</div>","done":false}︡{"done":true}
︠6b0a8153-f0c1-43a0-84e3-4eee6005842cs︠
ta.disp()
︡8dca7e57-4704-4ebc-94e6-48e279b0f79c︡︡{"html":"<div>$t\\otimes a = 108 e_1\\otimes e^2\\otimes e^1 + 27 e_1\\otimes e^2\\otimes e^2 -12 e_1\\otimes e^2\\otimes e^3 -144 e_2\\otimes e^3\\otimes e^1 -36 e_2\\otimes e^3\\otimes e^2 + 16 e_2\\otimes e^3\\otimes e^3$</div>","done":false}︡{"done":true}
︠eef60746-2513-401d-b161-a22759929b18s︠
ta.disp(f)
︡4d229e58-c51a-499b-83d8-1a8a16f93054︡︡{"html":"<div>$t\\otimes a = 12 f_1\\otimes f^1\\otimes f^1 -6 f_1\\otimes f^1\\otimes f^2 + 18 f_1\\otimes f^1\\otimes f^3 + 6 f_1\\otimes f^2\\otimes f^1 -3 f_1\\otimes f^2\\otimes f^2 + 9 f_1\\otimes f^2\\otimes f^3 + 6 f_1\\otimes f^3\\otimes f^1 -3 f_1\\otimes f^3\\otimes f^2 + 9 f_1\\otimes f^3\\otimes f^3 -216 f_2\\otimes f^1\\otimes f^1 + 108 f_2\\otimes f^1\\otimes f^2 -324 f_2\\otimes f^1\\otimes f^3 -12 f_2\\otimes f^2\\otimes f^1 + 6 f_2\\otimes f^2\\otimes f^2 -18 f_2\\otimes f^2\\otimes f^3 + 12 f_2\\otimes f^3\\otimes f^1 -6 f_2\\otimes f^3\\otimes f^2 + 18 f_2\\otimes f^3\\otimes f^3 + 160 f_3\\otimes f^1\\otimes f^1 -80 f_3\\otimes f^1\\otimes f^2 + 240 f_3\\otimes f^1\\otimes f^3 + 16 f_3\\otimes f^2\\otimes f^1 -8 f_3\\otimes f^2\\otimes f^2 + 24 f_3\\otimes f^2\\otimes f^3$</div>","done":false}︡{"done":true}
︠a1b628b5-5c00-41b7-a35f-e3c0c4451371i︠
%html
<p>The components w.r.t. a given basis can also be displayed as an array:</p>

︡00e6624e-c0b7-4000-989d-198eaf6e294f︡︡{"done":true,"html":"<p>The components w.r.t. a given basis can also be displayed as an array:</p>"}
︠e3aee260-a111-4dbb-8394-e0165351d428s︠
ta[:] # components w.r.t. the default basis (e)
︡34bb809c-bb8c-4f16-a32a-40b3d4ebef9a︡︡{"html":"<div>[[[$0$, $0$, $0$], [$108$, $27$, $-12$], [$0$, $0$, $0$]], [[$0$, $0$, $0$], [$0$, $0$, $0$], [$-144$, $-36$, $16$]], [[$0$, $0$, $0$], [$0$, $0$, $0$], [$0$, $0$, $0$]]]</div>","done":false}︡{"done":true}
︠c629d35c-3651-48f6-b4a7-a2ffae2b1fdds︠
ta[f,:] # components w.r.t. basis f
︡de8dc1bc-d779-49d0-a4fc-e638520ca5c4︡︡{"html":"<div>[[[$12$, $-6$, $18$], [$6$, $-3$, $9$], [$6$, $-3$, $9$]], [[$-216$, $108$, $-324$], [$-12$, $6$, $-18$], [$12$, $-6$, $18$]], [[$160$, $-80$, $240$], [$16$, $-8$, $24$], [$0$, $0$, $0$]]]</div>","done":false}︡{"done":true}
︠363c0ab9-388e-46d6-9e7e-59a87caa7ae0i︠
%html
<p>Each component ca be accessed individually:</p>

︡9e6ea204-2fe8-4fbb-adea-3bf8fad73f18︡︡{"done":true,"html":"<p>Each component ca be accessed individually:</p>"}
︠22bf2f20-715b-4147-9df0-9cae98fd1134s︠
ta[1,2,3] # access to a component w.r.t. the default basis
︡94064e0a-0a67-4cd1-bd23-8fb0bcddf3a9︡︡{"html":"<div>$-12$</div>","done":false}︡{"done":true}
︠713e3416-4edb-4d9f-b55f-b131cd85ef8fs︠
ta[f,1,2,3]
︡8cba1d93-23c8-42c4-a55f-36ebe1fbf798︡︡{"html":"<div>$9$</div>","done":false}︡{"done":true}
︠363dace2-2bc8-4522-a727-00480f58f453s︠
ta.parent()
︡69ef55c5-9135-44ef-add5-b96727e21a67︡︡{"html":"<div>$T^{(1, 2)}\\left(M\\right)$</div>","done":false}︡{"done":true}
︠6022ad3c-a7e3-446e-853e-08fb8872cfcbs︠
ta in M.tensor_module(1,2)
︡beffc281-4bc7-438a-bff5-fe9b31190f41︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠60e69985-cf84-4817-8a19-395c88ddca9bi︠
%html
<p>The tensor product is not commutative:</p>

︡c5915fdf-3491-4567-8ae6-cdcd400883ed︡︡{"done":true,"html":"<p>The tensor product is not commutative:</p>"}
︠9a24f9e3-4686-4831-bb63-7b7ff4117cf6s︠
print a*t
︡75bed9bf-31e8-40db-9322-61d4e6e478b3︡︡{"stdout":"Type-(1,2) tensor a*t on the Rank-3 free module M over the Integer Ring\n","done":false}︡{"done":true}
︠11b4e6ee-1203-4674-88da-bbad543af889s︠
a*t == t*a
︡7d833fa9-dc07-413d-b078-b09dfb4b887f︡︡{"html":"<div>$\\mathrm{False}$</div>","done":false}︡{"done":true}
︠c00acf25-3e95-4ab4-ac22-c23f9bde021ei︠
%html
<p>Forming a tensor of rank 4:</p>

︡f2481675-45d3-448c-80b7-26c3bda3b3c3︡︡{"done":true,"html":"<p>Forming a tensor of rank 4:</p>"}
︠321c113d-87c3-4cd5-8e13-4462b83068bds︠
tav = ta*v
print tav
︡190df842-d283-42b7-9455-3a2c198073d5︡︡{"stdout":"Type-(2,2) tensor t*a*v on the Rank-3 free module M over the Integer Ring\n","done":false}︡{"done":true}
︠5474fe50-3ab5-4120-9f22-0dbe67f72954s︠
tav.disp()
︡b689f602-2d3c-4e53-9fb9-d3ab12b7ae1e︡︡{"html":"<div>$t\\otimes a\\otimes v = 324 e_1\\otimes e_1\\otimes e^2\\otimes e^1 + 81 e_1\\otimes e_1\\otimes e^2\\otimes e^2 -36 e_1\\otimes e_1\\otimes e^2\\otimes e^3 -432 e_1\\otimes e_2\\otimes e^2\\otimes e^1 -108 e_1\\otimes e_2\\otimes e^2\\otimes e^2 + 48 e_1\\otimes e_2\\otimes e^2\\otimes e^3 + 108 e_1\\otimes e_3\\otimes e^2\\otimes e^1 + 27 e_1\\otimes e_3\\otimes e^2\\otimes e^2 -12 e_1\\otimes e_3\\otimes e^2\\otimes e^3 -432 e_2\\otimes e_1\\otimes e^3\\otimes e^1 -108 e_2\\otimes e_1\\otimes e^3\\otimes e^2 + 48 e_2\\otimes e_1\\otimes e^3\\otimes e^3 + 576 e_2\\otimes e_2\\otimes e^3\\otimes e^1 + 144 e_2\\otimes e_2\\otimes e^3\\otimes e^2 -64 e_2\\otimes e_2\\otimes e^3\\otimes e^3 -144 e_2\\otimes e_3\\otimes e^3\\otimes e^1 -36 e_2\\otimes e_3\\otimes e^3\\otimes e^2 + 16 e_2\\otimes e_3\\otimes e^3\\otimes e^3$</div>","done":false}︡{"done":true}
︠5abf59ea-19de-4067-bcba-9e97375064cei︠
%html
<h3>Symmetrization / antisymmetrization</h3>
<p>The (anti)symmetrization of a tensor $t$ over $n$ arguments involve the division by $n!$, which does not always make sense in the base ring $R$. In the present case, $R=\mathbb{Z}$ and to (anti)symmetrize over 2 arguments, we restrict to tensors with even components:</p>

︡72787b63-a7fa-4ce9-9ec4-2d418cf682b0︡︡{"done":true,"html":"<h3>Symmetrization / antisymmetrization</h3>\n<p>The (anti)symmetrization of a tensor $t$ over $n$ arguments involve the division by $n!$, which does not always make sense in the base ring $R$. In the present case, $R=\\mathbb{Z}$ and to (anti)symmetrize over 2 arguments, we restrict to tensors with even components:</p>"}
︠a326f000-0713-4c84-a4e4-2bee67a121b4s︠
g = M.tensor((0,2), name='g')
g[1,2], g[2,1], g[2,2], g[3,2], g[3,3] = 2, -4, 8, 2, -6
g[:]
︡572ef5ce-a3c5-4d8c-96d0-a832857246f6︡︡{"html":"<div>$\\left(\\begin{array}{rrr}\n0 &amp; 2 &amp; 0 \\\\\n-4 &amp; 8 &amp; 0 \\\\\n0 &amp; 2 &amp; -6\n\\end{array}\\right)$</div>","done":false}︡{"done":true}
︠2a5bd1dc-e77c-45be-8f42-c33aa8155c0as︠
s = g.symmetrize() ; s
︡396859bc-18e8-40bf-b21f-6bf312bd4b34︡︡{"html":"<div>$\\mbox{Symmetric bilinear form  on the Rank-3 free module M over the Integer Ring}$</div>","done":false}︡{"done":true}
︠ac825d5a-ddf4-4d8d-b4c3-3b53b5d9f2cas︠
s.symmetries()
︡d71ecf0d-371e-4006-ba71-0d3834c182dd︡︡{"stdout":"symmetry: (0, 1); no antisymmetry\n","done":false}︡{"done":true}
︠ff523391-a8d8-48dc-a337-1465fe75f2ecs︠
s[:]
︡d747386c-40dd-4a2a-ac5f-b104058eb7df︡︡{"html":"<div>$\\left(\\begin{array}{rrr}\n0 &amp; -1 &amp; 0 \\\\\n-1 &amp; 8 &amp; 1 \\\\\n0 &amp; 1 &amp; -6\n\\end{array}\\right)$</div>","done":false}︡{"done":true}
︠25839fde-6331-49cd-94c2-b937a143aa6ci︠
%html
<p>Symmetrization can be performed on an arbitray number of arguments, by providing their positions (first position = 0). In the present case</p>

︡efd07253-342d-4e69-a5f9-057cc5141d24︡︡{"done":true,"html":"<p>Symmetrization can be performed on an arbitray number of arguments, by providing their positions (first position = 0). In the present case</p>"}
︠cc91775c-8850-4778-8e54-02235d2430e6s︠
s == g.symmetrize(0,1)
︡81fe5849-bf85-41d9-bf39-1f575e6e9d41︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠67683306-f968-4d09-948f-8d83a28c3e41i︠
%html
<p>One may use index notation to specify the symmetry:</p>

︡d7c727a4-7df2-4fbf-8c0c-f3a3397107ab︡︡{"done":true,"html":"<p>One may use index notation to specify the symmetry:</p>"}
︠36138493-47c4-4c27-8377-97914b1ee698s︠
s == g['_(ab)']
︡f8515f9b-f5d7-4ae9-8f4e-ed3f8727c8b5︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠7a870a8e-d0ef-4018-a84d-51ded1df410fs︠
s == g['_{(ab)}'] # LaTeX type notation
︡1c17bcdb-46d8-4478-9a06-5905b737607c︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠7f4d1f15-d68d-45bf-80e8-20949534d6c5i︠
%html
<p>Of course, since $s$ is already symmetric:</p>

︡9bf29be2-78d6-4a2d-9be5-48b575d35aba︡︡{"done":true,"html":"<p>Of course, since $s$ is already symmetric:</p>"}
︠4b20931f-39f7-4d53-8fa6-668dc1c842c6s︠
s.symmetrize() == s
︡608f4ef0-c581-44c1-bb66-42ba1bd0a967︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠6125d1b7-b868-4734-ae2d-4b8dc1449c7ei︠
%html
<p>The antisymmetrization proceeds accordingly:</p>

︡429a0bb0-d2d6-45b7-853a-3c685332369d︡︡{"done":true,"html":"<p>The antisymmetrization proceeds accordingly:</p>"}
︠ef0dc442-719a-470b-aa6a-efa50cf12bcds︠
s = g.antisymmetrize() ; s
︡9d544d5b-44d1-4d5d-9132-a7aa42b638cb︡︡{"html":"<div>$\\mbox{Alternating form of degree 2 on the Rank-3 free module M over the Integer Ring}$</div>","done":false}︡{"done":true}
︠552a1f11-07b0-4781-9c5f-a79cc2170461s︠
s.symmetries()
︡ded42e2b-ecb4-4e33-a494-80288e61ae63︡︡{"stdout":"no symmetry; antisymmetry: (0, 1)\n","done":false}︡{"done":true}
︠72147f69-7aba-44c2-9d0b-73ebcc909d1es︠
s[:]
︡0f04d119-2137-4243-ad31-be3224ee4aff︡︡{"html":"<div>$\\left(\\begin{array}{rrr}\n0 &amp; 3 &amp; 0 \\\\\n-3 &amp; 0 &amp; -1 \\\\\n0 &amp; 1 &amp; 0\n\\end{array}\\right)$</div>","done":false}︡{"done":true}
︠3b0fb526-9012-41b2-97c8-0a69c507c338s︠
s == g.antisymmetrize(0,1)
︡ec730fef-7203-43ad-a422-6d5f43232e9e︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠acfd6044-50f9-4efa-8273-ed90b70a89c7i︠
%html
<p>As for symmetries, index notation can be used, instead of <span style="font-family: courier new,courier;">antisymmetrize()</span>:</p>

︡3597d8a3-e6cf-429f-ac47-251b49254544︡︡{"done":true,"html":"<p>As for symmetries, index notation can be used, instead of <span style=\"font-family: courier new,courier;\">antisymmetrize()</span>:</p>"}
︠b92a197f-9152-40b8-b5e9-7524acd7d74es︠
s == g['_[ab]']
︡e8903ab6-d757-42d1-817a-869a668c827b︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠37170f8f-7244-4cfa-a697-609f1d7701ecs︠
s == g['_{[ab]}'] # LaTeX type notation
︡db7dfe29-b467-4bb9-9158-1d47a91b242e︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠744ea996-0954-40cd-aa1f-f71c8bb0c8c2i︠
%html
<p>Of course, since $s$ is already antisymmetric:</p>

︡1e2568ac-70e3-40aa-85ae-e28bd3f0c881︡︡{"done":true,"html":"<p>Of course, since $s$ is already antisymmetric:</p>"}
︠f630dffd-64c1-4f8c-9a5d-fe0783348539s︠
s == s.antisymmetrize()
︡828bccd7-55d4-48f0-83f7-06a341e80321︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠31c1ffe2-3300-4aae-a801-e9376ff1411ai︠
%html
<h3>Tensor contractions</h3>
<p>Contracting the type-(1,1) tensor $t$ with the module element $v$ results in another module element:</p>

︡9f1dbab1-d3e0-4856-b12b-357e8dd16e1b︡︡{"done":true,"html":"<h3>Tensor contractions</h3>\n<p>Contracting the type-(1,1) tensor $t$ with the module element $v$ results in another module element:</p>"}
︠a357b84a-7a26-4e05-8dfb-7c74b17acde6s︠
t.contract(v)
︡d305921c-8894-4d95-a9e2-33e88bb1964e︡︡{"html":"<div>$\\mbox{Element of the Rank-3 free module M over the Integer Ring}$</div>","done":false}︡{"done":true}
︠d4bf6174-fcf3-4a8f-b6f5-d340777c1ceai︠
%html
<p>The components (w.r.t. a given basis) of the contraction are of course $t^i_{\\&nbsp; j} v^j$:</p>

︡a49a339f-4cc7-4baa-9dd4-05f6caa6069c︡︡{"done":true,"html":"<p>The components (w.r.t. a given basis) of the contraction are of course $t^i_{\\\\&nbsp; j} v^j$:</p>"}
︠2122494f-efb5-4f9d-b673-dec3c7b1cef1s︠
t.contract(v)[i] == sum(t[i,j]*v[j] for j in M.irange())
︡e9c2dc6b-8f92-46b6-9b40-e8b26b81b2e6︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠3983e518-1618-48d5-88d4-960e6bb71f6fi︠
%html
<p>This contraction coincides with the action of $t$ as an endomorphism:</p>

︡a43d07d1-fa7e-423f-a41d-f041c7ccbe67︡︡{"done":true,"html":"<p>This contraction coincides with the action of $t$ as an endomorphism:</p>"}
︠6483b658-75d3-4cb1-a979-43e8e51feaees︠
t.contract(v) == tt(v)
︡1bc377be-825b-4b56-adde-c68e1381cab5︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠fde0da3e-665e-42a0-b252-4265a5009799i︠
%html
<p>Instead of <span style="font-family: courier new,courier;">contract()</span>, index notations can be used to denote the contraction:</p>

︡68425b71-b760-4572-9b49-4bde60c0f727︡︡{"done":true,"html":"<p>Instead of <span style=\"font-family: courier new,courier;\">contract()</span>, index notations can be used to denote the contraction:</p>"}
︠0fc19335-9987-46a0-9b55-1bf9ed942945s︠
t['^i_j']*v['j'] == t.contract(v)
︡4f858a2b-489c-4c94-92e7-2ad81535caa9︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠ec6d6e4a-249a-4a22-9f19-04c95afb3215i︠
%html
<p>Contracting the linear form $a$ with the module element $v$ results in a ring element:</p>

︡f17fa339-0dc5-4fb5-bbe4-4969e32f5e50︡︡{"done":true,"html":"<p>Contracting the linear form $a$ with the module element $v$ results in a ring element:</p>"}
︠687e046e-ebce-4ffb-917b-1273e52b08eds︠
a.contract(v)
︡b847d46a-75e4-4726-812c-7e215a38a657︡︡{"html":"<div>$-68$</div>","done":false}︡{"done":true}
︠76ee1678-8a66-4520-a42c-f62a72d97f08i︠
%html
<p>It is of course the result of the linear form acting on the module element:</p>

︡3bc06f27-50e3-46c8-b2dc-1b350dc985af︡︡{"done":true,"html":"<p>It is of course the result of the linear form acting on the module element:</p>"}
︠03daaad0-d11c-4b97-aa7e-295bb4169c9as︠
a.contract(v) == a(v)
︡e330556a-db74-4e6c-8517-94844ded7a37︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠5fdd2098-0f46-48c4-b4d2-af8234724c3fi︠
%html
<p>By default, the contraction is performed on the last index of the first tensor and the first index of the second one. To perform contraction on other indices, one should specify the indices positions (with the convention position=0 for the first index): for instance to get the contraction $z^i_{\ \, j} = T^i_{\ \, kj} v^k$ (with $T=t\otimes a$):</p>

︡ded4dd14-8f1e-49ab-857e-775cb04eb24d︡︡{"done":true,"html":"<p>By default, the contraction is performed on the last index of the first tensor and the first index of the second one. To perform contraction on other indices, one should specify the indices positions (with the convention position=0 for the first index): for instance to get the contraction $z^i_{\\ \\, j} = T^i_{\\ \\, kj} v^k$ (with $T=t\\otimes a$):</p>"}
︠5bbedc26-4ff0-4db6-80fa-d1ea9d092557s︠
z = ta.contract(1,v)  # 1 -> second index of ta
print z
︡1ce6bfa3-21a5-441f-a772-4451c6277116︡︡{"stdout":"Type-(1,1) tensor on the Rank-3 free module M over the Integer Ring\n","done":false}︡{"done":true}
︠2e30bdb8-15ad-4908-a652-b6258e267271i︠
%html
<p>To get $z^i_{\ \, jk} = t^l_{\ \, j} T^i_{\ \, l k}$:</p>

︡da0575cb-2209-445f-be5e-8cdc46c8828c︡︡{"done":true,"html":"<p>To get $z^i_{\\ \\, jk} = t^l_{\\ \\, j} T^i_{\\ \\, l k}$:</p>"}
︠fff3bce4-c271-4465-b926-eb5b223dc7ebs︠
z = t.contract(0, ta, 1)  # 0 -> first index of t, 1 -> second index of ta
print z
︡949c0b98-87ad-49f4-962e-c74867e891a5︡︡{"stdout":"Type-(1,2) tensor on the Rank-3 free module M over the Integer Ring\n","done":false}︡{"done":true}
︠116d6e1f-054c-4f21-a7ce-486ff869aa51i︠
%html
<p>or, in terms of index notation:</p>

︡e096599a-5bc0-4a92-a0ad-bd63ffd57287︡︡{"done":true,"html":"<p>or, in terms of index notation:</p>"}
︠e1aeef8d-507d-47e6-81c8-1a750ec8f16cs︠
z1 = t['^l_j']*ta['^i_lk']
z1 == z
︡7f7042b9-90cd-4dc8-a601-9e7c43e804d5︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠5d26f02e-4fbb-4b6e-b959-b519e0d54f67i︠
%html
<p>As for any function, inline documentation is obtained via the quotation mark:</p>

︡c3b2f0ce-4019-4713-9680-18f51ede7934︡︡{"done":true,"html":"<p>As for any function, inline documentation is obtained via the quotation mark:</p>"}
︠1613314a-ad72-4b3c-8ff2-1b5e1f4b4815s︠
t.contract?
︡2af0823d-c99a-40eb-91b3-490b088179e4︡︡{"code":{"source":"File: /projects/sage/sage-6.9/local/lib/python2.7/site-packages/sage/tensor/modules/free_module_tensor.py\nSignature : t.contract(*args)\nDocstring :\nContraction on one or more indices with another tensor.\n\nINPUT:\n\n* \"pos1\" -- positions of the indices in \"self\" involved in the\n  contraction; \"pos1\" must be a sequence of integers, with 0\n  standing for the first index position, 1 for the second one, etc;\n  if \"pos1\" is not provided, a single contraction on the last index\n  position of \"self\" is assumed\n\n* \"other\" -- the tensor to contract with\n\n* \"pos2\" -- positions of the indices in \"other\" involved in the\n  contraction, with the same conventions as for \"pos1\"; if \"pos2\"\n  is not provided, a single contraction on the first index position\n  of \"other\" is assumed\n\nOUTPUT:\n\n* tensor resulting from the contraction at the positions \"pos1\"\n  and \"pos2\" of \"self\" with \"other\"\n\nEXAMPLES:\n\nContraction of a tensor of type (0,1) with a tensor of type (1,0):\n\n   sage: M = FiniteRankFreeModule(ZZ, 3, name='M')\n   sage: e = M.basis('e')\n   sage: a = M.linear_form()  # tensor of type (0,1) is a linear form\n   sage: a[:] = [-3,2,1]\n   sage: b = M([2,5,-2])  # tensor of type (1,0) is a module element\n   sage: s = a.contract(b) ; s\n   2\n   sage: s in M.base_ring()\n   True\n   sage: s == a[0]*b[0] + a[1]*b[1] + a[2]*b[2]  # check of the computation\n   True\n\nThe positions of the contraction indices can be set explicitely:\n\n   sage: s == a.contract(0, b, 0)\n   True\n   sage: s == a.contract(0, b)\n   True\n   sage: s == a.contract(b, 0)\n   True\n\nInstead of the explicit call to the method \"contract()\", the index\nnotation can be used to specify the contraction, via Einstein\nconventation (summation on repeated indices); it suffices to pass\nthe indices as a string inside square brackets:\n\n   sage: s1 = a['_i']*b['^i'] ; s1\n   2\n   sage: s1 == s\n   True\n\nIn the present case, performing the contraction is identical to\napplying the linear form to the module element:\n\n   sage: a.contract(b) == a(b)\n   True\n\nor to applying the module element, considered as a tensor of type\n(1,0), to the linear form:\n\n   sage: a.contract(b) == b(a)\n   True\n\nWe have also:\n\n   sage: a.contract(b) == b.contract(a)\n   True\n\nContraction of a tensor of type (1,1) with a tensor of type (1,0):\n\n   sage: a = M.tensor((1,1))\n   sage: a[:] = [[-1,2,3],[4,-5,6],[7,8,9]]\n   sage: s = a.contract(b) ; s\n   Element of the Rank-3 free module M over the Integer Ring\n   sage: s.display()\n   2 e_0 - 29 e_1 + 36 e_2\n\nSince the index positions have not been specified, the contraction\ntakes place on the last position of a (i.e. no. 1) and the first\nposition of \"b\" (i.e. no. 0):\n\n   sage: a.contract(b) == a.contract(1, b, 0)\n   True\n   sage: a.contract(b) == b.contract(0, a, 1)\n   True\n   sage: a.contract(b) == b.contract(a, 1)\n   True\n\nUsing the index notation with Einstein convention:\n\n   sage: a['^i_j']*b['^j'] == a.contract(b)\n   True\n\nThe index \"i\" can be replaced by a dot:\n\n   sage: a['^._j']*b['^j'] == a.contract(b)\n   True\n\nand the symbol \"^\" may be omitted, the distinction between\ncontravariant and covariant indices being the position with respect\nto the symbol \"_\":\n\n   sage: a['._j']*b['j'] == a.contract(b)\n   True\n\nContraction is possible only between a contravariant index and a\ncovariant one:\n\n   sage: a.contract(0, b)\n   Traceback (most recent call last):\n   ...\n   TypeError: contraction on two contravariant indices not permitted\n\nContraction of a tensor of type (2,1) with a tensor of type (0,2):\n\n   sage: a = a*b ; a\n   Type-(2,1) tensor on the Rank-3 free module M over the Integer Ring\n   sage: b = M.tensor((0,2))\n   sage: b[:] = [[-2,3,1], [0,-2,3], [4,-7,6]]\n   sage: s = a.contract(1, b, 1) ; s\n   Type-(1,2) tensor on the Rank-3 free module M over the Integer Ring\n   sage: s[:]\n   [[[-9, 16, 39], [18, -32, -78], [27, -48, -117]],\n    [[36, -64, -156], [-45, 80, 195], [54, -96, -234]],\n    [[63, -112, -273], [72, -128, -312], [81, -144, -351]]]\n\nCheck of the computation:\n\n   sage: all(s[i,j,k] == a[i,0,j]*b[k,0]+a[i,1,j]*b[k,1]+a[i,2,j]*b[k,2]\n   ....:     for i in range(3) for j in range(3) for k in range(3))\n   True\n\nUsing index notation:\n\n   sage: a['il_j']*b['_kl'] == a.contract(1, b, 1)\n   True\n\nLaTeX notation are allowed:\n\n   sage: a['^{il}_j']*b['_{kl}'] == a.contract(1, b, 1)\n   True\n\nIndices not involved in the contraction may be replaced by dots:\n\n   sage: a['.l_.']*b['_.l'] == a.contract(1, b, 1)\n   True\n\nThe two tensors do not have to be defined on the same basis for the\ncontraction to take place, reflecting the fact that the contraction\nis basis-independent:\n\n   sage: A = M.automorphism()\n   sage: A[:] =  [[0,0,1], [1,0,0], [0,-1,0]]\n   sage: h = e.new_basis(A, 'h')\n   sage: b.comp(h)[:]  # forces the computation of b's components w.r.t. basis h\n   [-2 -3  0]\n   [ 7  6 -4]\n   [ 3 -1 -2]\n   sage: b.del_other_comp(h)  # deletes components w.r.t. basis e\n   sage: b._components.keys()  # indeed:\n   [Basis (h_0,h_1,h_2) on the Rank-3 free module M over the Integer Ring]\n   sage: a._components.keys()  # while a is known only in basis e:\n   [Basis (e_0,e_1,e_2) on the Rank-3 free module M over the Integer Ring]\n   sage: s1 = a.contract(1, b, 1) ; s1  # yet the computation is possible\n   Type-(1,2) tensor on the Rank-3 free module M over the Integer Ring\n   sage: s1 == s  # ... and yields the same result as previously:\n   True\n\nThe contraction can be performed on more than a single index; for\ninstance a 2-indices contraction of a type-(2,1) tensor with a\ntype-(1,2) one is:\n\n   sage: a  # a is a tensor of type-(2,1)\n   Type-(2,1) tensor on the Rank-3 free module M over the Integer Ring\n   sage: b = M([1,-1,2])*b ; b # a tensor of type (1,2)\n   Type-(1,2) tensor on the Rank-3 free module M over the Integer Ring\n   sage: s = a.contract(1,2,b,1,0) ; s # the double contraction\n   Type-(1,1) tensor on the Rank-3 free module M over the Integer Ring\n   sage: s[:]\n   [ -36   30   15]\n   [-252  210  105]\n   [-204  170   85]\n   sage: s == a['^.k_l']*b['^l_k.']  # the same thing in index notation\n   True","mode":"text/x-rst","lineno":-1,"filename":null},"done":false}︡{"done":true}
︠91fc3390-d378-4e91-82a0-5c428d6d9033︠










