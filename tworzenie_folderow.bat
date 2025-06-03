@echo off

echo 1. tworzenie pliku
echo 2. tworzenie folderu
echo 3. tworzenie konta     
echo 4. proby                      
                                                                                             
choice /C:1234 /N /M "Wybierz 1, 2, 3 lub 4: "
if errorlevel 4 if exist folder (goto tworzenie) else (goto usuwanie)
If errorlevel 3 goto konto
If errorlevel 2 goto folder
If errorlevel 1 goto plik

:plik
if exist plik.txt (del plik.txt) else (echo tekst > plik.txt)
if exist plik.txt (type plik.txt) else (echo plik nie istnieje)
goto koniec

:folder
if exist folder (rmdir folder) else (mkdir folder)
if exist folder (echo utworzono folder) else (echo usunieto folder)
goto koniec

:konto
net user urzytkownik 1234 /add
net user
net user urzytkownik /del
net user
goto koniec

:tworzenie
choice /C:YN /m "Czy chcesz stworzyc folder? "
if errorlevel 1 mkdir folder
if exist folder (echo folder stworzony)
goto koniec

:usuwanie
choice /C:YN /m "Czy chcesz usunac folder? "
if errorlvel 1 rmdir folder
if not exist folder (echo folder usuniety)
goto koniec

:koniec
echo koniec
pause