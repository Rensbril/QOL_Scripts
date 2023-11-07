# QOL_Scripts 🚀

Welkom bij de QOL_Scripts-repo! Hier vind je scripts die ontworpen zijn om de kwaliteit van je digitale leven te verbeteren. 🌟

## Obsidian Auto Sync Script 📚

Dit script is bedoeld om je Obsidian Vault automatisch te synchroniseren met een Git-repository.   
Het handelt `pull` en `push` commando's af met toevoeging van wijzigingen en maakt automatisch een logbestand aan.

### Hoe te gebruiken ⚙️

1. Plaats de `setup.sh` en `obsidian_sync.sh` scripts in een gewenste directory.
2. Voer `setup.sh` uit om je log- en vault-directory's grafisch te selecteren:
   ```bash
   chmod +x setup.sh <- dit heb ik al gedaan maar het proberen waard mocht je tegen problemen aanlopen.
   ./setup.sh
   ```
   Dit zal `obsidian.sh` aanpassen met de geselecteerde paden.
3. Plan het `obsidian.sh` script om periodiek te draaien met `cron`:
   ```bash
   crontab-e
   ```
   En voeg de volgende regel toe om het script elke 30 minuten uit te voeren:
   ```bash
   */30 * * * * /pad/naar/obsidian.sh
   ```
4. Controleer het `obsidian_git_sync.log` bestand voor de logs

### Wat doet het script? 🤖

Voert een git pull uit om de nieuwste wijzigingen op te halen.  
Voegt met git add . alle nieuwe of gewijzigde bestanden toe.  
Commits de wijzigingen met een tijdstempel via git commit.  
Verstuurt de wijzigingen naar de remote repository met git push.  
Logt alle acties naar obsidian_git_sync.log.  

### Benodigdheden 🛠️

`Git` moet geïnstalleerd zijn.  
`SSH` of `HTTPS` configuratie voor toegang tot je remote Git repository.  
`cron` moet beschikbaar zijn voor het inplannen van taken.  

### Bijdragen ✨
Heb je ideeën om dit script te verbeteren? Je bijdragen zijn van harte welkom! Maak een pull-verzoek met je verbeteringen.
