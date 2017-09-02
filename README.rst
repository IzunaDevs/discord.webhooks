discord.webhooks
================

.. raw:: html
    <!--- TODO: Change all of these badges later. --->

.. image:: https://api.codacy.com/project/badge/Grade/b505a5b0cf5e4b57b4b4c56fefe833b0
   :alt: Codacy Badge
   :target: https://www.codacy.com/app/AraHaan/discord-webhooks?utm_source=github.com&utm_medium=referral&utm_content=AraHaan/discord.webhooks&utm_campaign=badger
.. image:: https://img.shields.io/pypi/v/discord.webhooks.svg
   :target: https://pypi.python.org/pypi/discord.webhooks/
.. image:: https://img.shields.io/pypi/pyversions/discord.webhooks.svg
   :target: https://pypi.python.org/pypi/discord.webhooks/

This is an extension to discord.py that allows you to use webhooks for
discord bots.

This does depend on discord.py being installed however it is not
installed when installing this package.

All dependencies should be installed already.

The reason why I do not do this is when someone needs to keep the voice
support of discord.py installed.

To install on Windows
---------------------

.. code:: sh

    path\to\python.exe -m pip install --upgrade discord.webhooks

To install on Linux
-------------------

.. code:: sh

    pip3 install --upgrade discord.webhooks

Requirements
------------

-  discord.py
-  Python 3.4+

Documentation
-------------

See `docs/index.md <docs/index.md>`__ for documentation.

Example
-------

example cog using the commands extension in discord.py that uses
discord.webhooks:

.. code:: py

    from discord.ext import commands
    from discord_webhooks import *

    class WebhookExample:
        """webhook example cog class that contains an webhook example command."""
        def __init__(self, bot):
            self.webhook_class = Webhook(bot)
            self.request_webhook = self.webhook_class.request_webhook  # to request an webhook.

        @commands.command(name='examplecommand', pass_context=True, no_pm=True)
        async def examplecommand_command(self, ctx):
            """
            sends whatever you typed into the command after the bot prefix + 'examplecommand' via webhook.
            """
            msgdata = ctx.message.content[len(ctx.prefix + "examplecommand"):].strip()
            await self.request_webhook('/{channel id}/{webhook token}', content=msgdata)


    def setup(bot):
        """
        example webhook cog.
        """
        new_cog = WebHooks(bot)
        bot.add_cog(new_cog)

