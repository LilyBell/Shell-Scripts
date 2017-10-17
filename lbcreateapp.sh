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
echo "Creating new project $PROJECT_NAME Progress:[#####################-----------------------------] 42%"
echo "Creating new .NET Soluction"
env dotnet new sln -n . -o .
echo "Creating new project $PROJECT_NAME Progress:[########################--------------------------] 47%"
echo "Correcting solution filename"
mv ..sln .sln 
echo "Creating new project $PROJECT_NAME Progress:[###############################-------------------] 63%"
echo "Creating .NET Core class library"
env dotnet new classlib -n common -o ./src/common
echo "Creating new project $PROJECT_NAME Progress:[###################################---------------] 68%"
echo "Adding projects to solution"
env dotnet sln . add ./src/common/common.csproj
env dotnet sln . add ./src/client/client.csproj
function optional_barebones() {
    echo "Would you like to remove default views and controllers? [Y] Yes or [N] No"
    read OPTIONAL
    case $OPTIONAL in
        "Y")    echo "Creating new project $PROJECT_NAME Progress:[######################################-------------] 74%"
                echo "Removing default views and controllers"
                mv ./src/client/appsettings.Development.json ./src/client/appsettings.dev.json
                rm -rf ./src/client/wwwroot
                rm -rf ./src/client/controllers
                rm -rf ./src/client/models
                rm -rf ./src/client/views
                rm -rf ./src/client/.bowerrc
                rm -rf ./src/client/bower.json
                rm -rf ./src/client/bundleconfig.json
                ;;
        "N")    echo "Creating new project $PROJECT_NAME Progress:[######################################----------] 79%"
                echo "Retaining default views and controllers"
                ;;
        *)      echo "You must choose [Y] Yes or [N] No"
                optional_barebones
                ;;
    esac
}
optional_barebones
echo "Creating new project $PROJECT_NAME Progress:[##########################################---------] 84%"
echo "Moving Angular compatible views and controllers"
mv ./templates/Views ./src/client
mv ./templates/Controllers ./src/client
cd ./src/client
echo "Creating new project $PROJECT_NAME Progress:[############################################-------] 89%"
echo "Creating new Angular project"
env ng new wwwroot
cd ./wwwroot
echo "Creating new project $PROJECT_NAME Progress:[###############################################---] 94%"
echo "Building Angular project"
env ng build
echo "Creating new $PROJECT_NAME Progress:[##################################################] 100%"
echo "Running .NET Project"
cd ..
env dotnet restore
env dotnet run