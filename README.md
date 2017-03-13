## discord.webhooks

This is an extension to discord.py that allows you to use webhooks for discord bots.

This does depend on discord.py being installed however it is not installed when installing this package.

All dependencies should be installed already.

The reason why I do not do this is when someone needs to keep the voice support of discord.py installed.

## To install on Windows

```cmd
path\to\python.exe -m pip install --upgrade discord.webhooks
```

## To install on Linux

```sh
pip3 install --upgrade discord.webhooks
```

## Requirements

- discord.py
- Python 3.4+

## Documentation
- Documentation will be Soon™ or as soon as someone helps me make rst docs for this package for uploading into readthedocs.
*(I am bad at rst and I am not sure how to rst for anything.)*

## Example

example cog using the commands extension in discord.py that uses discord.webhooks:

```py
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


def setup(bot):
    """
    example webhook cog.
    """
    new_cog = WebHooks(bot)
    new_cog.botcommand()
    bot.add_cog(new_cog)
```
