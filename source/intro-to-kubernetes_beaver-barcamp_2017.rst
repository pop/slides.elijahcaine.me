.. _intro-to-kubernetes_beaver-barcamp_2017:

Orchestrate your Containers in the Cloud with Kubernetes
========================================================

*A buzzword heavy talk about the emergent system admin tech*

The speaker
-----------

.. note::

    Name: Elijah C. Voigt
    Occupation: Student, Documentarian at CoreOS
    Qualifications: Documented the shit aout of this.

Name: Elijah C. Voigt.

Website: http://elijahcaine.me

Qualifications to talk about this topic:

- `This blog post`_

.. code:: diff

    diff --git a/kubernetes.github.io b/kubernetes.github.io
    + 288
    - 261

*Expert? Eh. Excited? HeckYes.gif*


Overview
--------

::

    Cluster
    +------------------------------------------------------+
    | [Kubelet0] (node)                   [Master] (node)  |
    | +-------------+--------------+   +-----------------+ |
    | |             |              |   |                 | |
    | | MyAppV2     | OtherApp     |   |                 | |
    | +----------------------------+  ++Kubernetes Daemon<-+--+
    | | Container   | Container2   |  ||-----------------+ +  |
    | +-----------+-+--------------+  ||Linux            | |  |
    | | Container | Kubernetes     |  |+-----------------+ |  |
    | | Runtime   | Daemon         <--+                    |  |
    | +-----------+----------------+ +---------------------+  |
    | | Linux                      | |   [Your Computer]      |
    | +----------------------------+ |   +------------------+ |
    +--------------------------------+   |                  | |
                                         |Kubectl           +-+
                                         +------------------+
                                         |Linux             |
                                         +------------------+

.. note::

    Kubernetes is a piece of Cloud Orchestration Software.
    The ultimate goal of orchestration software is to give system administrators the ability to treat their entire data center as one big computer.
    This is a crude diagram of how requests travel throgh Kubernetes.
    It captures the three core components: the clien (you) the kubernetes master node, and the kubelet.


Containers
----------

- Operating System level virtualization
- Ideal for:
    - (complete) Application Packaging
    - (variable amounts of) Process Isolation

.. image:: /static/intro-to-kubernetes_beaver-barcamp_2017/rkt-logo.png
    :align: center
    :target: https://github.com/rkt/rkt
    :alt: rkt logo

.. image:: /static/intro-to-kubernetes_beaver-barcamp_2017/docker-logo.png
    :align: center
    :target: https://github.com/docker/docker
    :alt: Docker logo

.. note::

    Containers are an impelementation of Operating System level virtualization,
    a better way to think about them is a sandbox which contains an applications dependencies, including the OS required to run that app (designed for ubuntu, runnable on centos).
    Limitation: cannot run a linux container on OSX, requires kernel parody.

Kubernetes
----------

- Container Orchestrator
    - Schedules containers onto nodes
    - Load based auto-scaling
    - Micro-manages containers

.. image:: /static/intro-to-kubernetes_beaver-barcamp_2017/kubernetes-logo.png
    :align: center
    :target: https://github.com/kubernetes/kubernetes
    :alt: Kubernetes logo
    :width: 40%

.. note::

    Kubernetes is a container orchestrator.
    Just like Linux scheules computation time on the CPU,
    Kubernetes schedules applications to run on shared nodes, and handles most of the legwork involved in that process.
    
Demo
----

`Follow along!`_

.. note::

    Deploy a simple application from scratch.
    Upgrade the application.
    Expose the application over the net.
    Kill the application.

.. _@pastyWhiteNoise: https://twitter.com/pastywhitenoise
.. _This blog post: http://elijahcaine.me/blog/deploying-buildbot-on-kubernetes/index.html
.. _Follow along!: https://gist.github.com/ElijahCaine/a56a464cd9830a8d34356409149fde2f
