# CTF Challenges which i developed
This repo contains the challenges i contributed while authoring some CTF competetions, ideas are not original of course i got inspired from other challenges i solved, you can give the challenges a try 😗.

> it ain't much, but it's honest work 😁

## Launching Challenges
`YOU MUST HAVE Docker INSTALLED !!`

Not all challenges needs launching , it depends on the nature of the challenge, if it's needs remote access you can deploy the challenge locally using docker following these steps :

- Change directory to a prefered challenge directory

```bash
cd challenge_directory/
```
- Launch the docker container of the challenge using the command
> PS : All deployable challenges have a `docker-compose.yml` file which defines the required services of the challenge in order to work properly.
```bash
docker compose up
```
> You can add the _`-d`_ tag to the previous command to launch the challenge in the background.

- When you finish playing around with challenges you can clean up the containers and networks added by the `docker-compose.yml` file
```bash
docker compose down
```
> if you don't want to remove the whole thing you can just stop them by replacing `down` with `stop` in the previous command.

## Available Challenges

|Challenge Name|Category|Difficulty|Deployment Required|
|-|-:|-:|-:|
|[B4nner](challenges/B4nner)|Linux|Easy|True
|[B4nner_2](challenges/B4nner_2)|Linux|Medium|True

> This table will be updated everytime i add a challenge to the repo

## Issues
if you encouter any issues with the challenges don't hesitate to open an `Issue` or fix the problem yourself and open up a `Pull Request`.

Thank you 😇.