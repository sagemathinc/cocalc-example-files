︠1cbf958c-8438-4f2d-96ee-fe5ea3446a32︠
%md
#### %auto
   The %auto decorator sets a cell so that it will be automatically
   executed when the Sage process first starts.

   Thus %auto allows you to initialize functions, variables, interacts,
   etc., e.g., when loading a worksheet.

   NOTE: The %auto decorator just calls salvus.auto(True), which sets
   a cell metatag.  You *must* execute the cell containing %auto at
   least once in order for it to work.
︠7bce0e7f-535c-4d04-9716-35ae475712c4︠
%md
#### %axiom
Create an instance of the Axiom interpreter. For further documentation, view [this page](http://www.axiom-developer.org/axiom-website/documentation.html). Note that you must have Axiom installed in order to use it on Sage Math Cloud.

   TESTS:

      sage: axiom == loads(dumps(axiom))
      True
︠54f5a9cd-7d4e-4560-bb60-0677c6a7f3a7︠
%md
#### %capture
   Capture or ignore the output from evaluating the given code. (SALVUS only).

   Use capture as a block decorator by placing either %capture or
   %capture(optional args) at the beginning of a cell or at the
   beginning of a line.  If you use just plane %capture then stdout
   and stderr are completely ignored.  If you use %capture(args)
   you can redirect or echo stdout and stderr to variables or
   files.  For example if you start a cell with this line::
︠01d1941c-6049-4e00-825c-87a3f375bfe9︠
        %capture(stdout='output', stderr=open('error','w'), append=True, echo=True)
︠82ded579-f66a-4063-a0e6-64e373ff2f76︠
    %md
   then stdout is appended (because append=True) to the global
   variable output, stderr is written to the file 'error', and the
   output is still displayed in the output portion of the cell (echo=True).

   INPUT:

   - stdout -- string (or object with write method) to send stdout output to (string=name of variable)
   - stderr -- string (or object with write method) to send stderr output to (string=name of variable)
   - append -- (default: False) if stdout/stderr are a string, append to corresponding variable
   - echo   -- (default: False) if True, also echo stdout/stderr to the output cell.
︠24561ad1-0a2e-4e06-b3d3-5029ef50d037︠
%md
#### %coffeescript
   Execute code using CoffeeScript.

   For example:
︠323dc6a0-90d0-400c-86f2-72bb6c54f633︠
%coffeescript console.log 'hi'
︠021fb959-d3a7-48f5-980a-3e64c262fdde︠
%md
or
︠490a600d-b35d-4378-827a-9788d54147c5︠
coffeescript("console.log 'hi'")
︠44fbdbeb-dc0f-4193-8378-f2fd4022b0bb︠
%md
   You may either pass in a string or use this as a cell decorator,
   i.e., put %coffeescript at the top of a cell.

   If you set once=False, the code will be executed every time the
   output of the cell is rendered, e.g., on load, like with %auto:
︠3e52e4a6-b047-46ec-a379-f30fcd066530︠
coffeescript('console.log("hi")', once=False)
︠a321c3a1-5c27-41b2-9d61-45394a2a0520︠
%md
or
︠e240fdb5-3e03-4093-b1cc-9235e3e00804︠
      %coffeescript(once=False) console.log("hi")
︠7b5dfaad-c7b4-4cb6-bb4d-593fd76a9919︠
%md
To send code from Javascript back to the Python process to be executed
use the worksheet.execute_code function:
︠58b699a3-30ce-4cd4-a444-111da42f9db2︠
%javascript  worksheet.execute_code(string_to_execute)
︠23021163-f3f2-4468-9373-3badad497207︠
%md
You may also use a more general call format of the form:
︠65009715-a04f-4676-bf14-17018ab004ea︠
%javascript
   worksheet.execute_code({code:string_to_execute, data:jsonable_object,
                           preparse:true or false, cb:function});
︠0d8bfd5a-a117-4a29-9c51-1e10ad43ca71︠
%md
The data object is available when the string_to_execute is being
evaluated as salvus.data.  For example, if you execute this code in a
cell:
︠e8b8f58a-db83-4f51-af42-50fcb666fefc︠
javascript('''
       worksheet.execute_code({code:"a = salvus.data['b']/2; print a", data:{b:5},
                      preparse:false, cb:function(mesg) { console.log(mesg)} });
   ''')
︠4b9a52a8-e950-421d-aab7-e517bd1eafc6︠
%md
then the Python variable a is set to 2, and the Javascript console log
will display:

   Object {done: false, event: "output", id: "..."}
   Object {stdout: "2n", done: true, event: "output", id: "..."}

You can also send an interrupt signal to the Python process from
Javascript by calling worksheet.interrupt(), and kill the process with
worksheet.kill().  For example, here the a=4 never happens (but a=2
does):
︠3acef502-2c4b-4913-8c4e-60413256d146︠
%javascript
   worksheet.execute_code({code:'a=2; sleep(100); a=4;',
                           cb:function(mesg) { worksheet.interrupt(); console.log(mesg)}})
︠d206e0fd-fb4d-4504-b342-f95e484c0dfe︠
%md
or using CoffeeScript (a Javascript preparser):
︠86f325e2-4400-47bb-9411-11a22faf20f0︠
%coffeescript
   worksheet.execute_code
       code : 'a=2; sleep(100); a=4;'
       cb   : (mesg) ->
           worksheet.interrupt()
           console.log(mesg)
︠51325018-d41a-4d23-8ac3-c1f7c7e00156︠
%md
The Javascript code is evaluated with numerous standard Javascript
libraries available, including jQuery, Twitter Bootstrap, jQueryUI,
etc.
︠5fea33a7-3d0f-4372-8701-54de0b5105c4︠
%md
#### %cython

   Block decorator to easily include Cython code in the Salvus
   notebook. For full documentation, please visit [this page](http://docs.cython.org/src/tutorial/cython_tutorial.html).

   Just put %cython at the top of a cell, and the rest is compiled as
   Cython code. You can pass options to cython by typing "%cython(...
   var=value...)" instead.

   This is a wrapper around Sage's cython function, whose docstring
   is:

   Compile a Cython file. This converts a Cython file to a C (or C++
   file), and then compiles that. The .c file and the .so file are
   created in a temporary directory.

   INPUTS:

   * "filename" - the name of the file to be compiled. Should end with
     'pyx'.

   * "verbose" (bool, default False) - if True, print debugging
     information.

   * "compile_message" (bool, default False) - if True, print
     "'Compiling <filename>...'" to the standard error.

   * "use_cache" (bool, default False) - if True, check the temporary
     build directory to see if there is already a corresponding .so
     file. If so, and if the .so file is newer than the Cython file,
     don't recompile, just reuse the .so file.

   * "create_local_c_file" (bool, default False) - if True, save a
     copy of the .c file in the current directory.

   * "annotate" (bool, default True) - if True, create an html file
     which annotates the conversion from .pyx to .c. By default this
     is only created in the temporary directory, but if
     "create_local_c_file" is also True, then save a copy of the .html
     file in the current directory.

   * "sage_namespace" (bool, default True) - if True, import
     "sage.all".

   * "create_local_so_file" (bool, default False) - if True, save a
     copy of the compiled .so file in the current directory.

   TESTS:

   Before http://trac.sagemath.org/12975, it would have beeen needed
   to write "#clang c++", but upper case "C++" has resulted in an
   error:

      sage: code = [
      ... "#clang C++",
      ... "#cinclude %s/include/singular %s/include/factory"%(SAGE_LOCAL, SAGE_LOCAL),
      ... "#clib m readline singular givaro ntl gmpxx gmp",
      ... "from sage.rings.polynomial.multi_polynomial_libsingular cimport MPolynomial_libsingular",
      ... "from sage.libs.singular.polynomial cimport singular_polynomial_pow",
      ... "def test(MPolynomial_libsingular p):",
      ... "    singular_polynomial_pow(&p._poly, p._poly, 2, p._parent_ring)"]
      sage: cython(os.linesep.join(code))

   The function "test" now manipulates internal C data of polynomials,
   squaring them:

      sage: P.<x,y>=QQ[]
      sage: test(x)
      sage: x
      x^2
︠e1402121-9fba-4b05-a89d-2e211482d7c9︠
%md
#### %default_mode md(hide=False)
   Set the default mode for cell evaluation.  This is equivalent
   to putting %mode at the top of any cell that does not start
   with %.   Use default_mode() to return the current mode.
   Use default_mode("") to have no default mode.

   EXAMPLES:

   Make Pari/GP the default mode:
︠949f2525-ceaa-4840-ae4f-a0bdba3377d3︠
        default_mode("gp")
        default_mode()   # outputs "gp"
︠a26f4592-0bfb-47bc-8079-cff3e15194d2︠
%md
   Then switch back to Sage:
︠05ef0e09-9609-4bb5-b7ff-d3a10d51d6bd︠
        default_mode("")   # or default_mode("sage")
︠a27897a2-beeb-4e5a-b05b-964b02223212︠

︠5f034b67-62f2-494e-babd-8c968e0816f5︠
%md
   You can also use default_mode as a line decorator:
︠b0958699-bd59-4d94-9ac7-c05d2b83792e︠
        %default_mode gp   # equivalent to default_mode("gp")
︠3dd10217-ee9c-496a-8978-3165d591d3dc︠
%md
#### %exercise
   Use the %exercise cell decorator to create interactive exercise
   sets.  Put %exercise at the top of the cell, then write Sage code
   in the cell that defines the following (all are optional):

   - a ``question`` variable, as an HTML string with math in dollar
     signs

   - an ``answer`` variable, which can be any object, or a pair
     (correct_value, interact control) -- see the docstring for
     interact for controls.

   - an optional callable ``check(answer)`` that returns a boolean or
     a 2-tuple

           (True or False, message),

     where the first argument is True if the answer is correct, and
     the optional second argument is a message that should be
     displayed in response to the given answer.  NOTE: Often the
     input "answer" will be a string, so you may have to use Integer,
     RealNumber, or sage_eval to evaluate it, depending
     on what you want to allow the user to do.

   - hints -- optional list of strings to display in sequence each
     time the user enters a wrong answer.  The last string is
     displayed repeatedly.  If hints is omitted, the correct answer
     is displayed after three attempts.

   NOTE: The code that defines the exercise is executed so that it
   does not impact (and is not impacted by) the global scope of your
   variables elsewhere in your session.  Thus you can have many
   %exercise cells in a single worksheet with no interference between
   them.

   The following examples further illustrate how %exercise works.

   An exercise to test your ability to sum the first $n$ integers::
︠17bd52ca-8577-42c8-ae70-02cc38a70e6b︠
        %exercise
        title    = "Sum the first n integers, like Gauss did."
        n        = randint(3, 100)
        question = "What is the sum $1 + 2 + \\cdots + %s$ of the first %s positive integers?"%(n,n)
        answer   = n*(n+1)//2
︠4fa7b6a1-3a91-4b8f-b4bd-0b14fb1f0cba︠
%md
        Transpose a matrix::
︠29a6590d-deaf-4d4a-a011-4eb8b427d07f︠
        %exercise
        title    = r"Transpose a $2 \times 2$ Matrix"
        A        = random_matrix(ZZ,2)
        question = "What is the transpose of $%s?$"%latex(A)
        answer   = A.transpose()
︠3f74167f-17a2-4cb1-8ab7-bb296c3fd3b1︠
%md
        Add together a few numbers::
︠e8477bde-d7ee-468b-9bde-60a664bfa464︠
        %exercise
        k        = randint(2,5)
        title    = "Add %s numbers"%k
        v        = [randint(1,10) for _ in range(k)]
        question = "What is the sum $%s$?"%(' + '.join([str(x) for x in v]))
        answer   = sum(v)
︠09000ffb-3148-4dee-b39f-aaa57cb6e86b︠
%md
︠68d0173d-dc85-493a-a8af-249f1335b81a︠
        The trace of a matrix::
︠4ea138bb-99f8-4fd9-a2f4-048ac1a750cb︠
        %exercise
        title    = "Compute the trace of a matrix."
        A        = random_matrix(ZZ, 3, x=-5, y = 5)^2
        question = "What is the trace of $$%s?$$"%latex(A)
        answer   = A.trace()
︠1894db9a-d6e8-4178-b35c-56b3e7cd1335︠
%md
   Some basic arithmetic with hints and dynamic feedback::
︠5f411aa9-2389-45d0-b06c-2c9b72a7e93e︠
        %exercise
        k        = randint(2,5)
        title    = "Add %s numbers"%k
        v        = [randint(1,10) for _ in range(k)]
        question = "What is the sum $%s$?"%(' + '.join([str(x) for x in v]))
        answer   = sum(v)
        hints    = ['This is basic arithmetic.', 'The sum is near %s.'%(answer+randint(1,5)), "The answer is %s."%answer]
        def check(attempt):
            c = Integer(attempt) - answer
            if c == 0:
                return True
            if abs(c) >= 10:
                return False, "Gees -- not even close!"
            if c < 0:
                return False, "too low"
            if c > 0:
                return False, "too high"
︠7b3abe5e-f60f-42ef-a1e0-19214b5cd626︠
%md
#### %file
        Block decorator to write to a file.  Use as follows:
︠6c6b4e1a-6450-4025-9f51-b61c8cdb60c0︠
        %file('filename') put this line in the file
︠5890dff4-0db3-409d-9738-a5fe58ed7a73︠
%md
        or
︠4d56517d-ccf0-48b2-bba3-1488a22b2691︠
        %file('filename')
︠e03fe68a-4b16-4895-960a-2c259fa1c98d︠
%md
        everything in the rest of the
        cell goes into the file with given name.
        As with all block decorators in Salvus, the arguments to file can
        be an arbitrary expression.  For examples,
︠64de8ae1-6b25-4cda-b333-cb90ad706be0︠
        a = 'file'; b = ['name', 'txt']
︠db1e29e9-fc4b-46ff-9233-ecd24be3af1b︠
        %file(a+b[0]+'.'+b[1])  rest of line goes in 'filename.txt'
︠473e5adf-5bd7-4d5d-b0b0-67390bbab847︠
%md
#### %fork
   The %fork block decorator evaluates its code in a forked subprocess
   that does not block the main process.

   WARNING: This is highly experimental and possibly flakie. Use with
   caution.

   All (picklelable) global variables that are set in the forked
   subprocess are set in the parent when the forked subprocess
   terminates.  However, the forked subprocess has no other side
   effects, except what it might do to file handles and the
   filesystem.

   To see currently running forked subprocesses, type
   fork.children(), which returns a dictionary {pid:execute_uuid}.
   To kill a given subprocess and stop the cell waiting for input,
   type fork.kill(pid).  This is currently the only way to stop code
   running in %fork cells.
︠e120851f-a5fa-462d-8743-a4a349b04849︠
%md
#### %fortran
   Compile Fortran code and make it available to use. For further documentation, view [this page](http://www.math.utah.edu/~beebe/software/fortran-documentation.html).

   INPUT:

      * x -- a string containing code

   Use this as a decorator.   For example, put this in a cell and
   evaluate it:

      %fortran

      C FILE: FIB1.F
            SUBROUTINE FIB(A,N)
      C
      C     CALCULATE FIRST N FIBONACCI NUMBERS
      C
            INTEGER N
            REAL*8 A(N)
            DO I=1,N
               IF (I.EQ.1) THEN
                  A(I) = 0.0D0
               ELSEIF (I.EQ.2) THEN
                  A(I) = 1.0D0
               ELSE
                  A(I) = A(I-1) + A(I-2)
               ENDIF
            ENDDO
            END
      C END FILE FIB1.F

   In the next cell, evaluate this:

      import numpy
      n = numpy.array(range(10),dtype=float)
      fib(n,int(10))
      n

   This will produce this output: array([  0.,   1.,   1.,   2.,   3., 5.,   8.,  13.,  21.,  34.]).
︠5c0c0124-b97e-4603-8115-f2508fd0eb32︠
%md
#### %fricas
   Interface to a FriCAS interpreter. For further documentation, visit [this page](http://fricas.sourceforge.net/doc/). Note that you must have FriCAS installed  to use it on SMC.
︠44cc1309-91ef-4976-b6b4-8eecf9ab13c6︠
%md
#### %gap
   Interface to the GAP interpreter. For further documentation, visit [this page](http://www.gap-system.org/Doc/doc.html). Note that you must have GAP installed to use it on SMC.
︠9022ac04-8e3b-4f59-843f-0c737f54dea1︠
%md
#### %gap3
   A simple Expect interface to GAP3. For further documentation, visit [this page](http://www.gap-system.org/Gap3/Doc3/doc.html). Note that you must have GAP3 installed to use it on SMC.

   EXAMPLES:

      sage: from sage.interfaces.gap3 import Gap3
      sage: gap3 = Gap3(command='gap3')

   TESTS:

      sage: gap3(2) == gap3(3)                           #optional - gap3
      False
      sage: gap3(2) == gap3(2)                           #optional - gap3
      True
      sage: gap3.trait_names()                           #optional - gap3
      []

   We test the interface behaves correctly after a keyboard interrupt:

      sage: gap3(2)                                      #optional - gap3
      2
      sage: try:
      ...     gap3._keyboard_interrupt()
      ... except KeyboardInterrupt:
      ...     pass                                       #optional - gap3
      Interrupting Gap3...
      sage: gap3(2)                                      #optional - gap3
      2

   We test that the interface busts out of GAP3's break loop
   correctly:

      sage: f = gap3('function(L) return L[0]; end;;')   #optional - gap3
      sage: f([1,2,3])                                   #optional - gap3
      Traceback (most recent call last):
      ...
      RuntimeError: Gap3 produced error output
      Error, List Element: <position> must be a positive integer at
      return L[0] ...
︠24f5aeef-eb72-42cb-ab0c-8ca89c01c40a︠
%md
#### %giac
   Interface to the Giac interpreter.

   You must have the optional  Giac interpreter installed and
   available as the command "giac" in your PATH in order to use this
   interface. Try the command: print giac._install_hints() for more
   informations on giac installation.

   Type "giac.[tab]" for a list of all the functions available from
   your Giac install. Type "giac.[tab]?" for Giac's help about a given
   function. Type "giac(...)" to create a new Giac object.

   Full html documentation for giac is avaible from your giac
   installation at "$PREFIX"/share/giac/doc/en/cascmd_en/index.html

   EXAMPLES:

   Any Giac instruction can be evaluated as a string by the giac
   command. You can access the giac functions by adding the "giac."
   prefix to the usual Giac name.

      sage: l=giac('normal((y+sqrt(2))^4)'); l   # optional - giac
      y^4+4*sqrt(2)*y^3+12*y^2+8*sqrt(2)*y+4
      sage: f=giac('(u,v)->{ if (u<v){ [u,v] } else { [v,u] }}');f(1,2),f(3,1)   # optional - giac
      ([1,2], [1,3])

   The output of the giac command is a Giac object, and it can be used
   for another giac command.

      sage: l.factors()                          #optional  - giac
      [y+sqrt(2),4]
      sage: giac('(x^12-1)').factor( )           # optional - giac
      (x-1)*(x+1)*(x^2+1)*(x^2-x+1)*(x^2+x+1)*(x^4-x^2+1)
      sage: giac('assume(y>0)'); giac('y^2=3').solve('y')  #optional - giac
      y
      [sqrt(3)]

   You can create some Giac elements and avoid many quotes like this:

      sage: x,y,z=giac('x,y,z');type(y)   # optional - giac
      <class 'sage.interfaces.giac.GiacElement'>
      sage: I1=(1/(cos(2*y)+cos(y))).integral(y,0,pi/4).simplify()  #optional - giac
      sage: (I1-((-2*ln((sqrt(3)-3*tan(1/8*pi))/(sqrt(3)+3*tan(1/8*pi)))*sqrt(3)-3*tan(1/8*pi))/9)).normal()       # optional - giac
      0
      sage: ((y+z*sqrt(5))*(y-sqrt(5)*z)).normal() # optional - giac
      y^2-5*z^2

   Polynomials or elements of SR can be evaluated directly by the giac
   interface.

      sage: R.<a,b>=QQ[];f=(2+a+b);p=giac.gcd(f^3+5*f^5,f^2+f^5);p;R(p); #optional - giac
      a^2+2*a*b+4*a+b^2+4*b+4
      a^2 + 2*a*b + b^2 + 4*a + 4*b + 4

   Variable names in python and giac are independant.

      sage: a=sqrt(2);giac('Digits:=30;a:=5');a,giac('a'),giac(a),giac(a).evalf()  # optional - giac
      [...]
      (sqrt(2), 5, sqrt(2), 1.414213562373095048801688724209)
︠50cd0aac-e3ff-43b8-a6a4-03f6a7a9b098︠
%md
#### %gp
Interface to the PARI gp interpreter. For full documentation, please
visit [this page](http://pari.math.u-bordeaux.fr/doc.html).

   Type "gp.[tab]" for a list of all the functions available from your
   Gp install. Type "gp.[tab]?" for Gp's help about a given function.
   Type "gp(...)" to create a new Gp object, and "gp.eval(...)" to
   evaluate a string using Gp (and get the result back as a string).

      INPUT:

      * "stacksize" (int, default 10000000) -- the initial PARI
        stacksize in bytes (default 10MB)

      * "maxread" (int, default 100000) -- ??

      * "script_subdirectory" (string, default None) -- name of the
        subdirectory of SAGE_EXTCODE/pari from which to read scripts

      * "logfile" (string, default None) -- log file for the pexpect
        interface

      * "server" -- name of remote server

      * "server_tmpdir" -- name of temporary directory on remote
        server

      * "init_list_length" (int, default 1024) -- length of initial
        list of local variables.

      EXAMPLE:
︠2fa2db56-fea5-4bb3-8443-6030c3d6566c︠
%gp
Gp()
︠863362f6-2750-438b-a1ab-5544ec375efe︠
%md
PARI/GP interpreter
︠79f4c871-b704-4b2a-a78e-c6ef30b653ce︠
%md
#### %hide
   Hide a component of a cell.  By default, hide hides the the code
   editor part of the cell, but you can hide other parts by passing
   in an optional argument:

             'input', 'output'

   Use the cell.show(...) function to reveal a cell component.
︠04b583d1-7d81-4e5d-9297-1fe07d383f92︠
%md
#### %html
   Cell mode that renders everything after %html as HTML then hides
   the input (unless you pass in hide=False).\n
︠876ffdd1-e87b-4fbc-adb8-dc74dcbb662f︠
%html
        <h1>A Title</h1>
        <h2>Subtitle</h2>
︠679bfd8c-f491-41f7-b1d7-8939e5f20ddc︠
%html(hide=False)
        <h1>A Title</h1>
        <h2>Subtitle</h2>
︠a87ec0e6-4292-4745-9259-24988eae781d︠
%html(hide=False) <h1>Title</h1>
︠950da5c7-774a-48cc-a0a0-e52e07febf1f︠
%md
#### %java script
   Execute code using JavaScript.

   For example:
︠ef6dafd5-af8d-4c39-aa69-d6ec72ebb983︠
%javascript console.log('hi')
︠39deb4f0-9dda-47cc-a511-2b19c50eebb5︠
%md
or
︠4ebe3ea8-6598-4534-95e9-920b3c5db65c︠
javascript("console.log('hi')")
︠5d229873-bf9a-4808-994e-6adb004d4070︠
%md
   You may either pass in a string or use this as a cell decorator,
   i.e., put %javascript at the top of a cell.

   If you set once=False, the code will be executed every time the
   output of the cell is rendered, e.g., on load, like with %auto:
   javascript('.. some code ', once=False)

   or

      %javascript(once=False) ... some code

   WARNING: If once=True, then this code is likely to get executed
   *before* the rest of the output for this cell has been rendered by
   the client.

   To send code from Javascript back to the Python process to be executed
   use the worksheet.execute_code function:

      %javascript  worksheet.execute_code(string_to_execute)

   You may also use a more general call format of the form:

      %javascript
   worksheet.execute_code({code:string_to_execute, data:jsonable_object,
                               preparse:true or false, cb:function});

   The data object is available when the string_to_execute is being
   evaluated as salvus.data.  For example, if you execute this code in a
   cell:

      javascript('''
          worksheet.execute_code({code:"a = salvus.data['b']/2; print a", data:{b:5},
                         preparse:false, cb:function(mesg) { console.log(mesg)} });
      ''')

   then the Python variable a is set to 2, and the Javascript console log
   will display:

      Object {done: false, event: "output", id: "..."}
      Object {stdout: "2n", done: true, event: "output", id: "..."}

   You can also send an interrupt signal to the Python process from
   Javascript by calling worksheet.interrupt(), and kill the process with
   worksheet.kill().  For example, here the a=4 never happens (but a=2
   does):

      %javascript
      worksheet.execute_code({code:'a=2; sleep(100); a=4;',
                              cb:function(mesg) { worksheet.interrupt(); console.log(mesg)}})

   or using CoffeeScript (a Javascript preparser):

      %coffeescript
      worksheet.execute_code
          code : 'a=2; sleep(100); a=4;'
          cb   : (mesg) ->
              worksheet.interrupt()
              console.log(mesg)

   The Javascript code is evaluated with numerous standard Javascript
   libraries available, including jQuery, Twitter Bootstrap, jQueryUI,
   etc.
︠c433b0a2-2af9-429c-84d9-24df2d3338c0︠
%md
#### %kash
Use %kash to interface with KASH code, which is the command line of KANT software. For further docuementation, visit [this page](http://page.math.tu-berlin.de/~kant/publications.html#docu). Currently, this command appears to be experiencing a bug in which it returns the values from previous calls of %kash.
Examples of KASH:
    Basic operations:
︠5cf41652-69ce-4828-aa92-c9c0fe6af5dd︠
%kash
kash% x_z3 := pAdicRing(3,30);
︠128954dc-a5df-4086-ad67-243126a2397f︠
%md
    Rings:
︠78d42022-b6ee-4407-9b67-fae4085ec6d8︠
%kash
kash% 12345/25;
︠a986aeeb-3b9c-4eb4-970e-d45669544da1︠
%md
#### %latex
   Return a "LatexExpr" built out of the argument "x". For full documentation,
   please visit [this page](http://latex-project.org/guides/).

   INPUT:

   * "x" -- a Sage object

   * "combine_all" -- boolean (Default: "False") If "combine_all" is
     "True" and the input is a tuple, then it does not return a tuple
     and instead returns a string with all the elements separated by a
     single space.

   OUTPUT:

   A "LatexExpr" built from "x"

   EXAMPLES:
︠2bd379f2-157d-49ac-9e61-c4713e900162︠
latex(Integer(3))  # indirect doctest
latex(1==0)
print latex([x,2])
︠d4331e4b-8eb1-470e-9548-14420b11512b︠
%md
Check that http://trac.sagemath.org/11775 is fixed:
︠d7263b93-f809-4390-9d03-729d404c34bf︠
latex((x,2), combine_all=True)
︠7d127345-fede-44e1-bc01-2b1033a0a78a︠
%md
#### %lie
Use %lie to interface with the LiE package. Type lie.[tab] for a list of all the functions available from your
LiE install.  Type lie.[tab]? for LiE's help about a given
function.  Type lie(...) to create a new LiE object, and
lie.eval(...) to run a string using LiE (and get the result back as
a string). For further information, view [this page](http://www-math.univ-poitiers.fr/~maavl/LiEman/manual.pdf).
︠3ef4b314-4471-4166-aa6f-373bd8a171e6︠
%md
#### %lisp
Use %lisp to interface with lisp code. For further documentation, visit [this page](http://www.paulgraham.com/lispcode.html).
    Examples:
︠acf12a30-298b-49ea-b359-6407eec1ce70︠
%md
Subtracting 6 from 4:
︠8dbc2eaa-2931-4eca-94e1-2cddc6f1ef3b︠
%lisp
(- 4 6)
︡bdd3df09-8fe2-46f8-84b7-3a134cd48f5d︡{"stdout":"-2"}︡
︠3b3b5baa-8f3f-4782-9335-7b7e19f33d4b︠
%md
Finding the minimum value of a collection of numbers:
︠38919d14-07da-424d-b256-7c0b4ee34bc4︠
%lisp
(min 4 -2 1 4)
︠610291bc-bf7a-44f8-91d2-6c0f4d900bc4︠
%md
Note that sometimes lisp can hang while awaiting user input, among other things. Use
︠3be08e83-162d-4e76-a852-c7885cd18268︠
lisp.quit()
︠d6c63909-d641-416f-8b30-0b2967da5d23︠
%md
to restart the lisp system.
︠f7fe05d2-7221-40fa-a332-5638aa9d64b6︠
%md
#### %load
   Load Sage object from the file with name filename, which will have
   an .sobj extension added if it doesn't have one.  Or, if the input
   is a filename ending in .py, .pyx, or .sage, load that file into
   the current running session.  Loaded files are not loaded into
   their own namespace, i.e., this is much more like Python's
   "execfile" than Python's "import".

   You may also load an sobj or execute a code file available on the
   web by specifying the full URL to the file.  (Set "verbose = False"
   to supress the download progress indicator.)

   INPUT:

      * args -- any number of filename strings with any of the
        following extensions:

           .sobj, .sage, .py, .pyx, .html, .css, .js, .coffee, .pdf

      * "verbose" -- (default: True) load file over the network.

   If you load and of the web types (.html, .css, .js, .coffee), they
   are loaded into the web browser DOM (or Javascript session), not
   the Python process.

   If you load a pdf, it is displayed in the output of the worksheet.
   The extra options are passed to salvus.pdf -- see the docstring for
   that.

   In SageMathCloud you may also use load as a decorator, with
   filename separated by whitespace or commas:

      %load foo.sage  bar.py  a.pyx, b.pyx

   The following are all valid ways to use load:

      %load a.html
      %load a.css
      %load a.js
      %load a.coffee
      %load a.css a.js a.coffee a.html
      load('a.css', 'a.js', 'a.coffee', 'a.html')
      load('a.css a.js a.coffee a.html')
      load(['a.css', 'a.js', 'a.coffee', 'a.html'])

   ALIAS: %runfile is the same as %load, for compatibility with
   IPython.
︠3d1a0cae-15e0-439a-abf0-000be315cb12︠
%md
#### %macaulay2
Use %macaulay2 to interface with Macaulay2 code. For further documentation, visit [this page](http://www.math.uiuc.edu/Macaulay2/doc/Macaulay2-1.6/share/doc/Macaulay2/Macaulay2Doc/html/).

Examples:
    Addition:
︠f6e56ba4-905f-4bdf-a12c-0b392afbc521︠
%macaulay2
2 + 2
︠2aeab117-9f64-4b0f-bf3b-ffa06c4e3951︠
%md
    Strings:
︠3ea3890e-ee43-4e3a-9436-b8a8b68e1b54︠
%macaulay2
    s = "hi there"
︠8eb8180f-b145-45e7-8e98-8474e9be410e︠
%md
    Elementary uses of Groebner bases
︠593fad15-ddbe-4239-93e0-a53897ec9d4f︠
%macaulay2
    KK = ZZ/31991
    R = KK[x,y,z,w]
    I = ideal(x^2*y,x*y^2+x^3)
    J = gens gb I
︠44f0eb3b-7131-471a-94d6-abce36a76823︠
%md
#### %magics
   Type %magics to print all SageMathCloud magic commands or magics()
   to get a list of them.

   To use a magic command, either type

      %command <a line of code>

   or

      %command [rest of cell]

   Create your own magic command by dedefining a function that takes a
   string as input and outputs a string. (Yes, it is that simple.)
︠d8ae92a6-31b5-4462-a813-cc95e0cef0b6︠
%md
#### %magma
   Type "magma.[tab]" for a list of all the functions available from
   your Magma install. Type "magma.Function?" for Magma's help about a
   given "Function" Type "magma(...)" to create a new Magma object,
   and "magma.eval(...)" to run a string using Magma (and get the
   result back as a string).

   Note: If you do not own a local copy of Magma, try using the
     "magma_free" command instead, which uses the free demo web
     interface to Magma.

   You must use nvals = 0 to call a function that doesn't return
   anything, otherwise you'll get an error. (nvals is the number of
   return values.)
        **Note that Magma is proprietary and is not installed by default**


︡0ea5f26c-d44a-4d70-a42d-9c60bbfca0df︡
︠8755ab4a-f039-4110-9774-2847d4f96f61︠
%md
#### %maple
   Use %maple to run maple code. For full Maple documentation, please visit [this page](http://www.maplesoft.com/documentation_center/).
   **Note that Maple is proprietary and is not installed by default**
︠a82d6c94-827a-44a3-8826-9cb489a6bd05︠
%md
#### %mathematica
   Use %mathematica to interface with Mathematica code. Mathematica software utilizes symbolic mathematics and is further documented on [this page](http://reference.wolfram.com/mathematica/guide/Mathematica.html).
   **Note that Mathematica is proprietary and is not installed by default**
︠f9e3e771-1553-4f8e-9840-7ead8437e1c6︠
%md
#### %matlab
   Use %matlab to run MATLAB code. MATLAB is a language which provides an interactive environment for numerical computation. For full documentation, view [this page](http://www.mathworks.com/products/matlab/).
   **Note that MATLAB is proprietary and is not installed by default**
︠fb6a3bf6-ac6a-4023-a8ee-0b05c49d3d4e︠
%md
#### %maxima
   Interface to the Maxima interpreter. For full documentation, please visit [this page](http://maxima.sourceforge.net/documentation.html).

   EXAMPLES:
︠b7469fdd-cf09-42e2-add5-299e70c9592c︠
m = Maxima()
m == maxima
2 ^ 3 ^ 4
2 ^ (3 ^ 4)
(2 ^ 3) ^ 4
︠9428f318-12a3-441c-8d49-06fe52355a23︠
%md
#### %md
Cell mode that renders everything after %md as markdown and hides the input by default.

    EXAMPLES:
︠61034462-7a10-426a-9906-c2e5996683d5︠
%md
         A Title
         A subheading
︠39e67d33-d27b-4055-9e8e-4664c98f4e99︠
%md(hide=False)
         A title

        - a list
︠37f1ad85-7f53-45d3-835e-ff9f02a9f134︠
md("# A title", hide=False)
︠0af2e93a-d079-47d3-b089-25a03a5852e9︠
%md(hide=False) `some code`
︠5260025b-598c-4302-ba8d-c8f3a97ba1ad︠
%md
This uses the Python markdown2 library with the following
    extras enabled:

         'code-friendly', 'footnotes',
         'smarty-pants', 'wiki-tables'

    See https://github.com/trentm/python-markdown2/wiki/Extras
    We also use markdown2Mathjax so that LaTeX will be properly
    typeset if it is wrapped in $'s and $$'s, \(, \), \[, \],
    \begin{equation}, \end{equation}, \begin{align}, \end{align}.,
︠da2cb4ad-c9fc-4a54-98c2-4680b5bbe83b︠
%md
#### %mupad
Use %mupad to run mupad code. MuPAD operates using symbolic mathematic expressions. For full documentation, view [this page](http://www.mathworks.com/discovery/mupad.html).

        **Note that MuPAD is proprietary and is not installed by default**

︠fd0793ab-8707-4a7c-8218-05a23329697c︠
%md
#### %mwrank
Use %mwrank to run mwrank code. Written in C++, mwrank is used to compute Mordell-Weil groups of elliptic curves over Q via 2-descent. For full documentation, view [this page](http://homepages.warwick.ac.uk/~masgaj/mwrank/).

        Example code:
︠f3ee9c4c-c919-4a17-b7af-5c6f01636c39︠
M = Mwrank('-v 0 -l')
print M('0 0 1 -1 0')
︠0c78d683-65a3-47a0-8c9c-5b9de1d82071︠
%md
#### %octave
   Interface to the Octave interpreter. For full documentation, visit [this page](http://www.gnu.org/software/octave/doc/interpreter/Simple-Examples.html#Help-and-Documentation).

   EXAMPLES:
︠cad4a8de-31f2-4cfa-96f5-eba4c0129dd0︠
    octave.eval("a = [ 1, 1, 2; 3, 5, 8; 13, 21, 33 ]")    # optional - octave
︠27a6b13d-0760-4c91-9d8b-4821ff9bb449︠
    octave.eval("b = [ 1; 3; 13]")                         # optional - octave
︠ece99dbe-3e07-4739-9f70-16217b009c32︠
    octave.eval("c=a  b") # solves linear equation: a*c = b  # optional - octave; random output
︠e212a78f-8a16-42ce-8de3-9169472c82e4︠
    octave.eval("c")                                 # optional - octave; random output
︠e059d8d6-398f-4cba-97e1-ff453f1229f3︠
%md
#### %perl
   Block decorator to run code in a Perl session. For full documentation, visit [this page](http://perldoc.perl.org/).

   To use this, put %perl by itself in a cell so that it applies to
   the rest of the cell, or put it at the beginning of a line to run
   just that line using perl.

   EXAMPLE:

   A perl cell:
︠fd550f6b-4522-490f-b465-e926d8ec4431︠
%perl
      $apple_count = 5;
      $count_report = "There are $apple_count apples.";
      print "The report is: $count_report";
︠58de064e-c4be-43de-99f1-767f29f70cc8︠
%md
Or use %perl on one line:
︠98397638-8c7f-456b-b168-c01e0a6a8718︠
%perl  $apple_count = 5;  $count_report = "There are $apple_count apples."; print "The report is: $count_report";
︠9b8e51b2-03af-41f7-b1c5-c6e7249bbdb4︠
%md
You can combine %perl with capture, if you would like to capture
   the output to a variable.  For example:
︠967e06c1-6860-4a28-bd00-5d729382ad81︠
%capture(stdout='p')
      %perl print "hi"
︠cc44e6c6-b087-48c1-9c62-5049c416a3bc︠
%md
   Afterwards, p contains 'hi'.

   NOTE: No state is preserved between calls.  Each call is a separate
   process.
︠2454c251-70cf-46f6-ad3f-45afa3890d1f︠
%md
#### %prun
   Use %prun followed by a block of code to profile execution of that
   code.  This will display the resulting profile, along with a menu
   to select how to sort the data.

   EXAMPLES:

   Profile computing a tricky integral (on a single line):
︠b5e03a19-76a1-4bd4-b42d-2a2467b3e006︠
%prun integrate(sin(x^2),x)
︠4378a004-63b7-4759-afbc-dc676b6f39c9︠
%md Profile a block of code::
︠0835bebf-a214-4d4c-9857-377c8bc9955f︠
%prun
E = EllipticCurve([1..5])
v = E.anlist(10^5)
r = E.rank()
︠64026a2b-d854-47b4-a10f-5d7eef669193︠
%md
#### %python

   Block decorator to run code in pure Python mode, without it being
   preparsed by the Sage preparser.  Otherwise, nothing changes.

   To use this, put %python by itself in a cell so that it applies to
   the rest of the cell, or put it at the beginning of a line to
   disable preparsing just for that line.
︠587e7ae9-8260-4ab7-ba25-2bdc4b3bda21︠
%python
print "hello world"
for i in range(0, 10, 2):
    print i
︠8e778cce-f140-400c-9dfe-e0026a786b8e︠
%md
#### %r
   An interface to the R interpreter.

   R is a comprehensive collection of methods for statistics,
   modelling, bioinformatics, data analysis and much more. For more
   details, see http://www.r-project.org/about.html

   EXAMPLES:

      sage: r.summary(r.c(1,2,3,111,2,3,2,3,2,5,4))
      Min. 1st Qu.  Median    Mean 3rd Qu.    Max.
      1.00    2.00    3.00   12.55    3.50  111.00

   TESTS:

      sage: r == loads(dumps(r))
      True
︠caa74c25-eddc-4a78-bbf2-bedaae7c6878︠
%md
#### %reset
   If vars is specified, just restore the value of vars and leave
   all other variables alone.   In SageCloud, you can also use
   reset as a line decorator::
︠c205f496-bbf3-4f16-9058-ecee76fc2f9d︠
            %reset x, pi, sin   # comma-separated
            %reset x pi sin     # commas are optional
︠487b2d88-374b-4a30-a2a6-02bcd2acb278︠
%md
   If vars is not given, delete all user-defined variables, reset
   all global variables back to their default states, and reset
   all interfaces to other computer algebra systems.
︠fc50cb15-a71a-49aa-833a-91efcde4f5fc︠
%md
#### %ruby
   Block decorator to run code in a Ruby session.

   To use this, put %ruby by itself in a cell so that it applies to
   the rest of the cell, or put it at the beginning of a line to run
   just that line using ruby.

   EXAMPLE:

   A ruby cell:
︠e283e1af-90cd-4744-9a17-2878ba1e9094︠
%ruby
      lang = "ruby"
      print "Hello from #{lang}!"
︠62d3e7db-f29b-466f-93c1-1279e3b3a408︠
%md
Or use %ruby on one line:
︠5b5acf48-be41-45ae-8ce3-02cfe5ebbf7b︠
%ruby lang = "ruby"; print "Hello from #{lang}!"
︠52072002-1d2a-4c43-a1e2-56816bcbd35d︠
%md
 You can combine %ruby with capture, if you would like to capture
 the output to a variable.  For example:
︠a8fb8b70-1cd6-4cd7-bb9f-c9ece289738c︠
%capture(stdout='p')
%ruby lang = "ruby"; print "Hello from #{lang}!"
︠5e511672-e13e-48b4-b2e8-4df7639b3510︠
%md
Afterwards, p contains 'Hello from ruby!'.

   NOTE: No state is preserved between calls.  Each call is a separate
   process.
︠958e7011-b19f-4742-8236-b0217bc53722︠
%md
#### %runfile
   Load Sage object from the file with name filename, which will have
   an .sobj extension added if it doesn't have one.  Or, if the input
   is a filename ending in .py, .pyx, or .sage, load that file into
   the current running session.  Loaded files are not loaded into
   their own namespace, i.e., this is much more like Python's
   "execfile" than Python's "import".

   You may also load an sobj or execute a code file available on the
   web by specifying the full URL to the file.  (Set "verbose = False"
   to supress the download progress indicator.)

   INPUT:

      * args -- any number of filename strings with any of the
        following extensions:

           .sobj, .sage, .py, .pyx, .html, .css, .js, .coffee, .pdf

      * "verbose" -- (default: True) load file over the network.

   If you load and of the web types (.html, .css, .js, .coffee), they
   are loaded into the web browser DOM (or Javascript session), not
   the Python process.

   If you load a pdf, it is displayed in the output of the worksheet.
   The extra options are passed to salvus.pdf -- see the docstring for
   that.

   In SageMathCloud you may also use load as a decorator, with
   filename separated by whitespace or commas:

      %load foo.sage  bar.py  a.pyx, b.pyx

   The following are all valid ways to use load:

      %load a.html
      %load a.css
      %load a.js
      %load a.coffee
      %load a.css a.js a.coffee a.html
      load('a.css', 'a.js', 'a.coffee', 'a.html')
      load('a.css a.js a.coffee a.html')
      load(['a.css', 'a.js', 'a.coffee', 'a.html'])

   ALIAS: %runfile is the same as %load, for compatibility with
   IPython.
︠d46b6591-0b59-45bc-b72a-8581dad2b496︠
%md
#### %sage0
   Load Sage object from the file with name filename, which will have
   an .sobj extension added if it doesn't have one.  Or, if the input
   is a filename ending in .py, .pyx, or .sage, load that file into
   the current running session.  Loaded files are not loaded into
   their own namespace, i.e., this is much more like Python's
   "execfile" than Python's "import".

   You may also load an sobj or execute a code file available on the
   web by specifying the full URL to the file.  (Set "verbose = False"
   to supress the download progress indicator.)

   INPUT:

      * args -- any number of filename strings with any of the
        following extensions:

           .sobj, .sage, .py, .pyx, .html, .css, .js, .coffee, .pdf

      * "verbose" -- (default: True) load file over the network.

   If you load and of the web types (.html, .css, .js, .coffee), they
   are loaded into the web browser DOM (or Javascript session), not
   the Python process.

   If you load a pdf, it is displayed in the output of the worksheet.
   The extra options are passed to salvus.pdf -- see the docstring for
   that.

   In SageMathCloud you may also use load as a decorator, with
   filename separated by whitespace or commas:

      %load foo.sage  bar.py  a.pyx, b.pyx

   The following are all valid ways to use load:

      %load a.html
      %load a.css
      %load a.js
      %load a.coffee
      %load a.css a.js a.coffee a.html
      load('a.css', 'a.js', 'a.coffee', 'a.html')
      load('a.css a.js a.coffee a.html')
      load(['a.css', 'a.js', 'a.coffee', 'a.html'])

   ALIAS: %runfile is the same as %load, for compatibility with
   IPython.
︠cbf9435d-3716-43be-899e-9464c4c1aad3︠
%md
#### %scilab
   Interface to the Scilab interpreter.

   EXAMPLES:
      sage: a = scilab('[ 1, 1, 2; 3, 5, 8; 13, 21, 33 ]')    #
      optional - scilab sage: b = scilab('[ 1; 3; 13]')
      # optional - scilab sage: c = a * b
      # optional - scilab sage: print c
      # optional - scilab

         30. 122. 505.
**Note that Scilab is not proprietary and is not installed by default**
︠832dc33b-a67e-42c7-a22c-5508df8a4b35︠
%md
#### %script
   Block decorator to run an arbitrary shell command with input from a
   cell in Salvus.

   Put %script('shell command line') or %script(['command', 'arg1',
   'arg2', ...])  by itself on a line in a cell, and the command line
   is run with stdin the rest of the contents of the cell.  You can
   also use script in single line mode, e.g.,::
︠2507f9c2-4de3-40a0-93d6-63729ea34831︠
            %script('gp -q') factor(2^97 - 1)
︠1e416d2e-3988-4d13-9877-3a1843bbd7ad︠

%md
   or
︠19e80634-30d6-43b0-b65a-5ce535810f8d︠
            %script(['gp', '-q'])   factor(2^97 - 1)
︠1c4bceda-f4ec-4698-b21a-d023fabdf55f︠
%md
   will launch a gp session, feed 'factor(2^97-1)' into stdin, and
   display the resulting factorization.

   NOTE: the result is stored in the attribute "stdout", so you can do::
︠6a5401ae-b1e5-46de-8845-2c9cda0f27d3︠
            s = script('gp -q')
            %s factor(2^97-1)
            s.stdout
            '\n[11447 1]\n\n[13842607235828485645766393 1]\n\n'
︠0f41567c-70c5-48ae-94c5-c98faff5b7b1︠
%md
   and s.stdout will now be the output string.

   You may also specify the shell environment with the env keyword.
︠d1e7aac5-fd74-4eb4-903f-86c6780ed149︠
%md
####%sh
   Run a bash script in Salvus.

   EXAMPLES:

   Use as a block decorator on a single line::
︠3ca8491c-a57f-4682-8d6d-603f4b475989︠
            %sh pwd
︠a46c3e48-6821-4b48-bb6e-ee550f8cbedf︠
%md
   and multiline
︠d27de9b9-359b-41be-bf6b-7e590d7a7963︠
            %sh
            echo "hi"
            pwd
            ls -l
︠0f08064c-ca51-433b-a21b-08d0780f10a8︠
%md
   You can also just directly call it::
︠f36c02e3-59d4-4e7e-9fba-a3b401b396cd︠
            sh('pwd')
︠0889fddb-f614-4ca1-bb5d-8c940290bcb0︠
%md
   The output is printed. To capture it, use capture
︠72ef5343-5a14-4f8c-a8dd-808fa8211ce1︠
            %capture(stdout='output')
            %sh pwd
︠0527d4e7-558b-4287-9857-2b3fa6bd0544︠
%md
   After that, the variable output contains the current directory
︠b7b8a7a7-0b7c-4d09-acac-d77630d897f4︠
%md
#### %singular
   Interface to the Singular interpreter.

   EXAMPLES: A Groebner basis example.

     sage: R = singular.ring(0, '(x0,x1,x2)', 'lp')
     sage: I = singular.ideal([ 'x0*x1*x2 -x0^2*x2', 'x0^2*x1*x2-x0*x1^2*x2-x0*x1*x2^2', 'x0*x1-x0*x2-x1*x2'])
     sage: I.groebner()
     x1^2*x2^2,
     x0*x2^3-x1^2*x2^2+x1*x2^3,
     x0*x1-x0*x2-x1*x2,
     x0^2*x2-x0*x2^2-x1*x2^2
︠6df69528-974b-4072-a93e-eb1d67ee87c3︠
%md
#### %time
   Time execution of code exactly once in Salvus by:

 - putting %time at the top of a cell to time execution of the entire cell
 - put %time at the beginning of line to time execution of just that line
 - write time('some code') to executation of the contents of the string.

    If you want to time repeated execution of code for benchmarking purposes, use
    the timeit command instead.
︠7e888feb-4856-4776-9529-4fce1c02c930︠
%md
#### %timeit
   Time execution of a command or block of commands.  This command has been
   enhanced for Salvus so you may use it as a block decorator as well, e.g.,
︠e7af31dd-bc0e-4cb2-8108-91be6afe3d77︠
            %timeit 2+3
︠8be55fbe-6d54-456e-90bf-452b40a5057f︠
%md
   and
︠3cae7b1c-ff00-47b0-8b56-06aab96ee64c︠
            %timeit(number=10, preparse=False)  2^3
︠51b152be-ec4d-4217-a506-ec99447d8d53︠
%md
   and
︠b99f4b7a-f339-4123-b113-770b5f1ab7c0︠
            %timeit(preparse=False)
︠0b670cdf-2b8b-4c49-8a2f-bdfc03ff31d9︠
%md
   [rest of the cell]
︠d740a1b5-5eef-4cae-9412-a94ccfd346cc︠
%md
#### %typeset_mode
   Turn typeset mode on or off.  When on, each output is typeset using LaTeX.

   EXAMPLES::
︠ebe73d6a-82d9-4366-a573-558fe2b1647b︠
             typeset_mode()  # turns typesetting on

             typeset_mode(False)  # turn typesetting off

             typeset_mode(True, display=False) # typesetting mode on, but do not make output big and centered
︠de6ec6db-a41d-48fe-ac53-10e2a1066a52︠
%md
#### %var

   Create symbolic variables and inject them into the global namespace.

   NOTE: In SageCloud, you can use var as a line decorator::

       %var x
       %var a,b,theta          # separate with commas
       %var x y z t            # separate with spaces

   Here is the docstring for var in Sage:


   if len(args)==1:
       name = args[0]
   else:
       name = args
   G = salvus.namespace
   v = sage.all.SR.var(name, **kwds)
   if isinstance(v, tuple):
       for x in v:
           G[repr(x)] = x
   else:
       G[repr(v)] = v
   return v

var.__doc__ += sage.all.var.__doc__
︠7c7486d7-5b22-4d52-aaad-9f0ea4eae65e︠









