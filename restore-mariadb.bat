@echo off
setlocal enabledelayedexpansion

:: ----------------------------------------
:: Restore de la base MariaDB depuis un fichier SQL
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

:: Demander le fichier .sql à restaurer
echo Liste des fichiers disponibles dans %BACKUP_DIR% :
dir /b "%BACKUP_DIR%\*.sql"
echo.
set /p RESTORE_FILE="Entrez le nom du fichier de backup (.sql) à restaurer (ex: backup_2025-04-28_17-41.sql) : "

:: Vérifier que le fichier existe
if not exist "%BACKUP_DIR%\%RESTORE_FILE%" (
    echo ERREUR: Fichier %BACKUP_DIR%\%RESTORE_FILE% introuvable !
    pause
    exit /b 1
)

:: Faire le restore
echo Restoration de la base %DATABASE_NAME% depuis %RESTORE_FILE%...

docker exec -i %CONTAINER_NAME% sh -c "exec mysql -u%DB_USER% -p%DB_PASSWORD% %DATABASE_NAME%" < "%BACKUP_DIR%\%RESTORE_FILE%"

if %errorlevel%==0 (
    echo Restauration reussie.
) else (
    echo ERREUR durant la restauration.
)

pause
