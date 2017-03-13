@echo off
"%SystemDrive%\Python360\python.exe" setup.py sdist
"%SystemDrive%\Python360\python.exe" setup.py bdist_wheel
"%SystemDrive%\Python360\python.exe" -m twine upload "dist/*"
pause