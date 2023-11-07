# QOL_Scripts 🚀

Welkom bij de QOL_Scripts-repo! Hier vind je scripts die ontworpen zijn om de kwaliteit van je digitale leven te verbeteren. 🌟

## Obsidian Auto Sync Script 📚

Dit script is bedoeld om je Obsidian Vault automatisch te synchroniseren met een Git-repository. Het handelt `pull` en `push` commando's af met toevoeging van wijzigingen en maakt automatisch een logbestand aan.

### Hoe te gebruiken ⚙️

1. Plaats het script in een gewenste directory.
2. Zorg ervoor dat de variabelen `LOG_DIR` en `VAULT_DIR` correct zijn ingesteld naar je Obsidian Vault en de log directory.
3. Geef het script uitvoerrechten:
   ```bash
   chmod +x obsidian_sync.sh
   ```

4. Plan het script om periodiek te draaien met `cron`:
   ```bash
   crontab -e
   ```
   En voeg de volgende regel toe om het elke 30 minuten uit te voeren:
   ```bash
   */30 * * * * /pad/naar/obsidian_sync.sh
   ```
5. Controlleer het `obsidian_git_sync.log` bestand voor een log van de synchronisatie.

### Wat doet het script? 🤖
git pull om de nieuwste wijzigingen op te halen.
git add . om alle nieuwe of gewijzigde bestanden toe te voegen.
git commit om de wijzigingen te commit met een tijdstempel.
git push om de wijzigingen naar de remote repository te sturen.
Logt alle acties naar obsidian_git_sync.log.

### Benodigdheden 🛠️
Git moet geïnstalleerd zijn.
SSH of HTTPS configuratie voor toegang tot je remote Git repository.
cron moet beschikbaar zijn voor het inplannen van taken.

### Bijdragen ✨
Heb je ideeën om dit script te verbeteren? Je bijdragen zijn van harte welkom! Maak een pull-verzoek met je verbeteringen.
