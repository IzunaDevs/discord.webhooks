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

        def botcommand(self):
            """Stores all command names in a dictionary."""
            # I recommend for bots to have an retained list in case they want to make their own help command.
            self.bot.commands_list.append('examplecommand')

        def __unload(self):
            """
            Clears registered commands.
            """
            # and to remove each command from the list to update the help command when cogs are unloaded.
            self.bot.commands_list.remove('examplecommand')

        @commands.command(name='examplecommand', pass_context=True, no_pm=True)
        async def examplecommand_command(self, ctx):
            """
            sends whatever you typed into the command after the bot prefix + 'examplecommand' via webhook.
            """
            msgdata = ctx.message.content[len(ctx.prefix + "examplecommand"):].strip()
            await self.request_webhook('/{channel id}/{webhook token}', content=msgdata)