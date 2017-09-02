Example
=======

.. code:: py

    from discord.ext import commands
    from discord_webhooks import *

    class WebhookExample:
        """webhook example cog class that contains an webhook example command."""
        def __init__(self, bot):
            self.bot = bot
            self.webhook_class = Webhook(self.bot)
            self.request_webhook = self.webhook_class.request_webhook  # to request an webhook.

        @commands.command(name='examplecommand', pass_context=True, no_pm=True)
        async def examplecommand_command(self, ctx):
            """
            sends whatever you typed into the command after the bot prefix + 'examplecommand' via webhook.
            """
            msgdata = ctx.message.content[len(ctx.prefix + "examplecommand"):].strip()
            await self.request_webhook('/{channel id}/{webhook token}', content=msgdata)
