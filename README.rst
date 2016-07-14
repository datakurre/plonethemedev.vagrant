plonethemedev.vagrant
=====================

Please, see `plonedev.vagrant`_ for generic Plone vagrant box instructions.

.. _plonedev.vagrant: https://github.com/plone/plonedev.vagrant

This is an example project about the usage of `plonetheme-webpack-plugin`_
in building Plone themes with Webpack. While this project runs Plone in a
vagrant box, NodeJS (4 or later) )and npm is expected to be available on
host.

.. _plonetheme-webpack-plugin: https://github.com/datakurre/plonetheme-webpack-plugin

Clone the project:

.. code:: shell

   $ git clone https://github.com/datakurre/plonethemedev.vagrant
   $ cd plonethemedev.vagrant

Start Plone and webpack-dev-server:

.. code:: shell

   $ make watch

An example Plone site with hot-reloaded theme should be now available
at http://localhost:8080/Plone/ (at first, the theme must be manually
enabled from the configuration panel).

Production theme is built with:

.. code:: shell

   $ make

Please, note that Plone must be running while running the build, because
webpack fetches all the default resources directly from a Plone site.
