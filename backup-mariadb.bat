@echo off
setlocal enabledelayedexpansion

:: ----------------------------------------
:: Backup de la base MariaDB depuis Docker
:: Variables chargées depuis .env
:: ----------------------------------------

:: Charger toutes les variables du fichier .env
for /f "usebackq tokens=1,2 delims==" %%A in (".env") do (
    set "VAR=%%A"
    set "VAL=%%B"
    if /I "!VAR!"=="CONTAINER_NAME" set CONTAINER_NAME=!VAL!
    if /I "!VAR!"=="DATABASE_NAME" set DATABASE_NAME=!VAL!
    if /I "!VAR!"=="DB_USER" set DB_USER=!VAL!
    if /I "!VAR!"=="DB_PASSWORD" set DB_PASSWORD=!VAL!
    if /I "!VAR!"=="BACKUP_DIR" set BACKUP_DIR=!VAL!
)

:: Vérification des variables
if "%CONTAINER_NAME%"=="" (
    echo ERREUR: CONTAINER_NAME vide !
    pause
    exit /b 1
)
if "%DATABASE_NAME%"=="" (
    echo ERREUR: DATABASE_NAME vide !
    pause
    exit /b 1
)
if "%DB_USER%"=="" (
    echo ERREUR: DB_USER vide !
    pause
    exit /b 1
)
if "%DB_PASSWORD%"=="" (
    echo ERREUR: DB_PASSWORD vide !
    pause
    exit /b 1
)
if "%BACKUP_DIR%"=="" (
    set BACKUP_DIR=backup
)

:: Format de la date pour le fichier
for /f "tokens=2 delims==" %%I in ('"wmic OS Get localdatetime /value"') do set ldt=%%I
set DATE_YEAR=!ldt:~0,4!
set DATE_MONTH=!ldt:~4,2!
set DATE_DAY=!ldt:~6,2!
set TIME_HOUR=!ldt:~8,2!
set TIME_MINUTE=!ldt:~10,2!
set BACKUP_FILE=%BACKUP_DIR%\backup_%DATE_YEAR%-%DATE_MONTH%-%DATE_DAY%_%TIME_HOUR%-%TIME_MINUTE%.sql

:: Créer le dossier backup s'il n'existe pas
if not exist "%BACKUP_DIR%" (
    mkdir "%BACKUP_DIR%"
)

:: Faire le dump en utilisant docker exec
echo Backup de la base %DATABASE_NAME% en cours...

docker exec %CONTAINER_NAME% sh -c "exec mysqldump -u%DB_USER% -p%DB_PASSWORD% %DATABASE_NAME%" > "%BACKUP_FILE%"

if %errorlevel%==0 (
    echo Backup reussi : %BACKUP_FILE%
) else (
    echo ERREUR durant le backup.
)

pause
