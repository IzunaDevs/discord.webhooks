## Usage

To use this webhooks package you must first know the classes and the members.

> class Webhook

This class must be initialized with the bot client class initialization as an paramiter. The reason behind this is that the webhook requester function below uses the HTTPClient class itialization inside of that class.

> method request_webhook(partialurl, content=None, username=None, avatar_url=None, tts=False, file=None, embeds=None)

The *partialurl* paramiter in this method means the url to the webhook with the part of the webhook url you get from the discord client, that being the ``https://canary.discordapp.com/api/webhooks`` stripped from the input to this paramiter.
This is critical because it would be appended to the partialurl paramiter anyway from the WebHookRoute class builtin to this package. However stripping it is optional it can be the full url to the hook specified instead.

The *content* paramiter is optional. However it is for sending any text you want to the webhook.

The *username* paramiter is optional. It sets the name of the webhook.

The *avatar_url* paramiter is optional. It sets the avatar of the webhook.

The *tts* paramiter is optional. It sets if the weather or not to use tts on the webhook message.

The *file* paramiter is optional. It sets the file to send to the webhook. Note: With this the *embeds* paramiter is ignored as the request with this will ignore it anyway.

The *embeds* paramiter is optional. It allows you to embed stuff nicely inside of webhooks. It is because of this that this is also available for normal messages as well for bots. However this paramiter is ignored when *file* is specified.
