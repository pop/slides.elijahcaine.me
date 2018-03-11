
Crypto
======

*Practical Math*

| Follow along!
| http://slides.elijahcaine.me/crypto

.. TODO::

    - Better 2P example

.. #############################################################################

Elijah Caine M. Voigt
----------------------

- DevOps Engineer at Nordstrom

- Recent BS in CS from Oregon State

- Blog https://elijahcaine.me

- Twitter @pastyWhiteNoise

.. image:: /static/fashion.gif
    :align: right
    :target: http://www.reactiongifs.com/r/fash.gif
    :width: 50%


.. #############################################################################


Roadmap
-------

#. Diffie Hellman Key Exchange

#. Elliptic Curve Crypto

#. Hash Functions

#. Memory Hard Functions

#. Secure multi-party computations

#. Garbled Circuits


.. #############################################################################

Diffie Hellman Key Exchange
---------------------------

    A protocol for exchanging public keys over an insecure channel.

.. nextslide::

1. Alice and Bob publicly agree on a mod (p) and a base (g).
2. Alice and Bob both choose secret integers (a and b).
3. Alice sends Bob g\ :sup:`a` (mod p) (we call it A).  Bob sends Alice g\ :sup:`b` (mod p) (we call it B).
4. Alice computes B\ :sup:`a` (mod p).  Bob computes A\ :sup:`b` (mod p).  These are equivalent (mod p).  This is Alice and Bob's shared secret.

A\ :sup:`b` = (g\ :sup:`a`)\ :sup:`b` = (g\ :sup:`b`)\ :sup:`a` = B\ :sup:`a` (mod p)

*Computing 'a' given 'A' is very difficult when 'a' is large*


.. #############################################################################

Elliptic Curve Crytography
--------------------------

.. image:: /static/elliptic-curve-cryptography-1.hires.png
    :align: center
    :width: 100%


ECC Defined
~~~~~~~~~~~

    Public Key Cryprography which uses special properties of Elliptic Curves to create shared secrets.


"Addition"
~~~~~~~~~~

.. image:: /static/ecc-3.png
    :align: center
    :width: 100%

.. nextslide::

1. Take two points P and Q on the Elliptic Curve E.
2. Draw a line L which passes through these two points.
3. L should ultimately pass through three points: P, Q, and R.
4. Multiply the Y coordinate of R by -1, this is R'.
5. P ⊕ Q = R'.


"Multiplication"
~~~~~~~~~~~~~~~~

.. image:: /static/ecc-4.png
    :align: center
    :width: 100%

.. nextslide::

The "Double and Add" algorithm:

1. Take a point P ∈ E(Fp) and an integer n ≥ 1.
2. Set Q = P and R = O.
3. Loop while n > 0.

   4. If n ≡ 1 (mod 2), set R = R + Q
   5. Set Q = 2Q and n = floor(n/2).


DHKE in ECC
~~~~~~~~~~~

1. Alice and Bob agree on E(F\ :sub:`p`\ ): an Elliptic Curve over a finite field and P A public point P on E(F\ :sub:`p`\ ).
2. Alice chooses a secret integer a and Bob choose secret integers b .
3. Alice computes Q\ :sub:`a` = a P and Bob computes Q\ :sub:`b` = b P. These are the "Public Keys"
4. Alice sends Bob her public key, Bob send Alice his public key.
5. Alice computes a Q\ :sub:`b`\ , Bob computes b Q\ :sub:`a`\ .
6. The shared secret is a Q\ :sub:`b` = a (b P) = b (a P) = b Q\ :sub:`a`.


Why we care about ECC
~~~~~~~~~~~~~~~~~~~~~

*Greater security with less data.*

|

**[...] breaking a 228-bit RSA key requires less energy than boiling a teaspoon of water.**

|

**[...] breaking a 228-bit elliptic curve key requires enough energy to boil all the water on Earth.**


In the wild
~~~~~~~~~~~

Check your TLS Certs for ``_ECDHE_``

.. code::

    Technical Details
      Connection Encrypted (TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256, 128 bit keys, TLS 1.2)


.. #############################################################################

Hash Functions
--------------

    A function that takes arbitrary size input and returns unique constant size output.

.. nextslide::

.. code::

    H("Mary had a little lamb"): 8774a25d2f

                       H("Pop"): 21129ffe98

    H("Mary had a little lamb"): 8774a25d2f


Reversing a Hash Function
~~~~~~~~~~~~~~~~~~~~~~~~~

.. code::

    H("password"): 6b3a55e026
       
      H("123456"): e150a1ec81
       
     H("hunter2"): 46a9d5bde7

                ...

      H("qwerty"): 10231785cb


Attempts to secure Hash Functions
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code::

    H(H(H(...H("SALTpassword")...))): c07e32d739
       
      H(H(H(...H("SALT123456")...))): e0209a9bf0
       
     H(H(H(...H("SALThunter2")...))): 3f02b38713

                                   ...

      H(H(H(...H("SALTqwerty")...))): b2bb8650b7


In the wild
~~~~~~~~~~~

Cryptographic Hash Functions:

========== ========
Algorithm  Secure?
========== ========
MD5        No
SHA-1      No
SHA-256    No-ish
SHA-512    Yes-ish
SHA-3      Yes
========== ========

.. note::

    Fun Fact: The SHA family of hash functions were developed by the NSA!

.. #############################################################################

Memory Hard Functions
---------------------

.. image:: /static/dag-animated.gif
    :align: center
    :width: 100%


MHFs Defined
~~~~~~~~~~~~

    Hashing functions which are difficult to compute in memory-constrained systems.


Directed Acyclic Graphs
~~~~~~~~~~~~~~~~~~~~~~~

.. image:: /static/DAG.gif
    :align: center
    :width: 100%

.. nextslide::

.. image:: /static/dag-animated.gif
    :align: center
    :width: 100%


Why we care about MHFs
~~~~~~~~~~~~~~~~~~~~~~

Before:

.. code::

    ASIC Hash Function Compute Time: 4 cycles (concurrent)
    EC2 Hash Function Compute Time: 20 cycles

Memory Hard:

.. code::

    ASIC Memory Hard Hash Compute Time: 20+ cycles (sequential)
    EC2 Memory Hard Hash Compute Time: 20 cycles

In the wild
~~~~~~~~~~~

Scrypt

.. #############################################################################

Secure multi-party computation
------------------------------

    Evaluation of a program without knowledge of it's inputs or contents.

.. nextslide::

*The Millionare Problem*

.. code::

      function F = garbled(function f)
         input A = obfuscated(input a)
         input B = obfuscated(input b)
          F(A,B) = f(a,b)

.. #############################################################################

Garbled Circuits
----------------

.. image:: /static/garbled-circuit.jpg
    :align: center
    :width: 100%


Garbled Circuits defined
~~~~~~~~~~~~~~~~~~~~~~~~

    An implementation of secure multi-party calculations.


How to Garble
~~~~~~~~~~~~~

===== === ===
 OR    0   1  
===== === ===
**0**  0   1  
**1**  1   1  
===== === ===

#. Four possible inputs, Four possible outputs.
#. Inputs are encrypted ('0' -> 4355a46b19, etc)
#. Two keys used to decrypt *one gate outputs*.
#. Seeng inputs (encryption keys) doesn't spoil the values (``1`` or ``0``).
#. One can run the circuit without knowing the inputs.

.. note::

    Now let's walk through an example where Alice and Bob will garble and evaluate an "OR" gate.


Alice's circuit & input
~~~~~~~~~~~~~~~~~~~~~~~

1. Alice generates 4 keys ``Kx0``, ``Kx1``, ``Ky0``, and ``Ky1``.
2. Alice creates four variables corresponding with the four outputs of the OR table:

Plaintext

===== == ==
 OR   0  1
===== == ==
**0** 0  1
**1** 1  1
===== == ==

Garbled

======= ======== ========
 OR     ``Kx0``  ``Kx1``
======= ======== ========
**Ky0** ``B00``  ``B01``
**Ky1** ``B10``  ``B11``
======= ======== ========

.. nextslide::

3. Each box is encrypted with the two keys:

======= ====================== ======================
 OR     Kx0                    Kx1 
======= ====================== ======================
**Ky0** ``E( Kx0||Ky0, B00 )`` ``E( Kx0||Ky1, B01 )``
**Ky1** ``E( Kx1||Ky0, B10 )`` ``E( Kx1||Ky1, B11 )``
======= ====================== ======================

Which looks like:

================ ================ ================
 OR              ``f4982f5cfd4``  ``56198d52cb1``
================ ================ ================
``abfff1c5ed8``  ``d9b2aefb1fe``  ``d56f56bb9bb``
``abc7b0fb361``  ``917df3320d7``  ``4f2a86deb5e``
================ ================ ================

4. Alice sends the ciphertexts (``E( Kx0||ky0, B00)``, etc) and her input (``KxA``) to Bob.


Bob's input
~~~~~~~~~~~

5. Bob takes Alice's input(s), ``KxA``.

6. Bob uses oblivious transfer to compute is input ``KyB``.

7. Bob can run the circuit. ``garbled_OR( KxA , KyB )`` outputs 0 or 1.

.. note::

    Bob has enough information to get one of the four possible outputs of the
    circuit, but doesn't know if Alice's input is a 1 or a 0 at each circuit.

    Importantly, while Bob can share the output of the circuit, he should
    **not** share his input.
    That would make using OT (step 6) obtuse. 


Why we care about GCs
~~~~~~~~~~~~~~~~~~~~~

Contact sharing.

.. note::

    Good question.

.. #############################################################################

Why it all matters
~~~~~~~~~~~~~~~~~~

.. image:: /static/batman.gif
    :align: center
    :width: 100%
    :target: https://tenor.com/view/batman-gif-4575661

.. note::

    This matters for a few reasons:

    THESIS THESIS THESIS???
 
.. #############################################################################

Further Reading
---------------

| Crypto Course blog
| http://elijahcaine.me/tag/crytpo.html

| `A primer on elliptic curve cryptography`_
| (Nick Sullivan, Ars Technica)
| https://goo.gl/zaRGBo

| `What exactly is a "garbled circuit"?`_
| (mikero, crypto.stackexchange.com)
| https://crypto.stackexchange.com/questions/37991#37993

| `Memory Hard Functions and Password Hashings`_
| (Jeremiah M. Blocki, CERIAS Symposium)
| https://youtu.be/9yX4v89m5oo

.. _Crypto Class Course Syllabus: http://elijahcaine.me/crypto/independent-crypto-course-syllabus/
.. _A primer on elliptic curve cryptography: https://arstechnica.com/information-technology/2013/10/a-relatively-easy-to-understand-primer-on-elliptic-curve-cryptography/
.. _What exactly is a "garbled circuit"?: https://crypto.stackexchange.com/questions/37991/what-exactly-is-a-garbled-circuit/37993#37993
.. _Memory Hard Functions and Password Hashings: https://youtu.be/9yX4v89m5oo
