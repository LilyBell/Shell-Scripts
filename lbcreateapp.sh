#!/bin/sh

echo "Welcome to the Angular .NET Core application automated process by @LilyBell https://www.github.com/LilyBell"
echo "Manual instructions for this process can be found at https://github.com/LilyBell/angular_dotnet_startup/blob/master/readme.md"
echo "Input the name of the project to be created:"
read PROJECT_NAME
mkdir $PROJECT_NAME
cd $PROJECT_NAME
echo "Input the git repo to be cloned"
read REPO
echo "Creating new project $PROJECT_NAME Progress:[--------------------------------------------------] 0%"
echo "Cloning $REPO into $PWD"
env -i git clone --depth=1 $REPO .
echo "Creating new project $PROJECT_NAME Progress:[##------------------------------------------------] 5%"
echo "Removing .git"
rm -rf .git
echo "Creating new project $PROJECT_NAME Progress:[#####---------------------------------------------] 11%"
echo "Installing dependencies"
yarn install
echo "Creating new project $PROJECT_NAME Progress:[########------------------------------------------] 16%"
echo "Creating root directories"
echo "Creating new project $PROJECT_NAME Progress:[##########----------------------------------------] 21%"
echo "Creating src directory"
mkdir src
echo "Creating new project $PROJECT_NAME Progress:[##########----------------------------------------] 26%"
echo "Creating .vscode directory"
mkdir .vscode
echo "Creating new project $PROJECT_NAME Progress:[##########----------------------------------------] 32%"
echo "Creating .nuget directory"
mkdir .nuget
echo "Creating new project $PROJECT_NAME Progress:[##########----------------------------------------] 36%"
echo "Creating .blueprints directory"
mkdir .blueprints
env dotnet new sln -n . -o .