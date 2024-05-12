jagrosh-musicbot-docker
---

For functionality, see: https://github.com/jagrosh/MusicBot

Image is built and tagged from the version supplied in [version](version).

Run using
```bash
touch serversettings.json
docker run --detach \
  --env TOKEN=YOURTOKENHERE \
  --env OWNER=YOURUSERIDHERE \
  --env PREFIX='!' \
  --volume $(pwd)/serversettings.json:/app/serversettings.json \
  nastye/jagrosh-musicbot:VERSION
```
