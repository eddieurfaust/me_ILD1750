echo off

cd data

echo " [ ] Creating temporary directory '_tmp'"
mkdir _tmp
echo " [ ] Copying log files"
cp Sample_*.csv _tmp
echo " [ ] Changing dir"
cd _tmp

echo " [ ] Adding a newline to every file"
for /r %%i in (Sample_*.csv) do echo.>>%%i
echo " [ ] Adding another newline to every file"
for /r %%i in (Sample_*.csv) do echo.>>%%i
echo " [ ] Concatenating log files"
copy Sample_*.csv 0_all_data.dat

echo " [ ] Moving the result"
mv 0_all_data.dat ./../..
echo " [ ] Removing temporary log file copies"
rm Sample_*.csv
echo " [ ] Changing dir"
cd ..
echo " [ ] Deleting temporary folder"
rmdir _tmp

set /p DUMMY=All Done! - Hit ENTER to continue...
