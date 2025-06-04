@echo off

echo 1. tworzenie pliku
echo 2. tworzenie folderu 
echo 3. tworzenie konta   !ODPAL PRZEZ ADMINISTRATORA!  
echo 4. proby                      
                                                                                             
choice /C:1234 /N /M "Wybierz 1, 2, 3 lub 4: "
if errorlevel 4 (
    echo nic tu nie ma
    goto koniec
) else if errorlevel 3 (
    goto konto
) else if errorlevel 2 (
    if not exist folder (goto tworzenie) else (goto usuwanie) 
) else if errorlevel 1 (
    if not exist plik.txt (goto plik_t) else (goto plik_u) 
)

:plik_t
choice /C:YN /m "Czy chcesz stworzyc plik.txt? "
if errorlevel 2 (
    echo nie stworzyles pliku
) else if errorlevel 1 (
    echo > plik.txt
    echo plik stworzony
)
goto koniec

:plik_u
choice /C:YN /m "Czy chcesz usunac folder? "
if errorlevel 2 (
    echo nie usunoles folderu
) else if errorlevel 1 (
    del plik.txt
    echo plik usuniety
)
goto koniec

:konto
choice /C:YN /m "Czy chcesz ustalic haslo? "
if errorlevel 2 (
net user urzytkownik 1234 /add
net user
echo haslo to 1234
pause
net user urzytkownik /del
echo usunieto zbedne konto
) else if errorlevel 1 (
net user urzytkownik * /add
net user
net user urzytkownik /del
echo usunieto zbedne konto
)
goto koniec

:tworzenie
choice /C:YN /m "Czy chcesz stworzyc folder? "
if errorlevel 2 (
    echo nie stworzyles folderu
) else if errorlevel 1 (
    mkdir folder
    echo folder stworzony
)
goto koniec

:usuwanie
choice /C:YN /m "Czy chcesz usunac folder? "
if errorlevel 2 (
    echo nie usunoles folderu
) else if errorlevel 1 (
    rmdir /s /q folder
    echo folder usuniety
)
goto koniec

:koniec
pause