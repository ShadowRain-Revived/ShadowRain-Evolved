This is ShadowRain - A gimmick DoS operating system developed in Batch (Meaning it can only run alongside Windows)

==================================================================================================================
Each File Serves a different function, Of which can be edited to customize ShadowRain in any way.

- Startup.bat -> Handles File Searches and gives parameters to other files.
	(If a file doesn't exist which is required to run, It will throw an error then exit)

- ShadowRain.bat -> Handles Serving Commands into the CommandEngine for each version.
	(Will execute CommandEngine in the version defined in Startup)
	(If a command is 0.0.1 and above, That command will execute among all versions)
	(If a command is 0.0.2 and above, That command will not run on 0.0.1)

- CommandEngine.bat -> Handles modules from the modules folder
	(Modules are what holds each command among versions and are mainly duplicates of each other)
