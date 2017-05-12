echo "Welcome to EverVim, a powerful & modern vim distribution"
echo "Booting EverVim ..."

if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    echo "Setup script needs administrator priviliges to create symlinks"
    exit
}

Push-Location ~

if (!(Test-Path "~\.EverVim")) {
    echo "Cloning into ~\.EverVim ..."
    git clone https://github.com/LER0ever/EverVim ~\.EverVim
}

echo "Processing files and directories ..."
mkdir -Path ~\.EverVim\autoload -Force
mkdir -Path ~\.EverVim\bundle -Force
cmd /c rmdir %LOCALAPPDATA%\nvim\
cmd /c rmdir %USERPROFILE%\vimfiles\
if (Test-Path "~\.EverVim\init.vim" -PathType Leaf){
    Remove-Item -Path ~\.EverVim\init.vim -Force -Recurse
    Remove-Item -Path ~\.EverVim\ginit.vim -Force -Recurse
}

echo "Soft-Linking Vim/NeoVim Config ..."
cmd /c mklink /D %USERPROFILE%\vimfiles\ %USERPROFILE%\.EverVim\
cmd /c mklink /D %LOCALAPPDATA%\nvim\ %USERPROFILE%\.EverVim\
cmd /c mklink %USERPROFILE%\.EverVim\init.vim %USERPROFILE%\.EverVim\vimrc
cmd /c mklink %USERPROFILE%\.EverVim\ginit.vim %USERPROFILE%\.EverVim\core\gui.vim

if (!(Test-Path "~\.EverVim.vimrc")) {
    echo "Copied EverVim configuration sample to ~\.EverVim.vimrc"
    Copy-Item -Path ~\.EverVim\.EverVim.vimrc.sample -Destination ~\.EverVim.vimrc -Force
}

echo "Downloading Vim-Plug ..."
$uri = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
(New-Object Net.WebClient).DownloadFile($uri, $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath("~\.EverVim\autoload\plug.vim"))

Pop-Location

echo "All done with the setup. "
echo "Now please open up your vim and Type :PlugInstall in your vim to complete the plugin installation"
