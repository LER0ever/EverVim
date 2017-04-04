echo "Welcome to EverVim, a powerful & modern vim distribution"
echo "Booting EverVim ..."

if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    echo "Setup script needs administrator priviliges to create symlinks"
    exit
}

$invocation = (Get-Variable MyInvocation).Value
$currentdir = Split-Path $invocation.MyCommand.Path
$EVERHOME = $currentdir + "\home\EverVim\"

echo "Creating Directories ..."
md $EVERHOME
md $EVERHOME\.vim\autoload
md $EVERHOME\.vim\bundle
md $EVERHOME\.config

echo "Downloading Vim-Plug ..."
$uri = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
(New-Object Net.WebClient).DownloadFile($uri, $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($EVERHOME + "\.vim\autoload\plug.vim"))

echo "Soft-Linking Vim/NeoVim Config ..."
Push-Location -Path $EVERHOME
cmd /c mklink .vimrc ..\..\.vimrc
cmd /c mklink .vimrc.bundles ..\..\.vimrc.bundles
cmd /c mklink .vimrc.before ..\..\.vimrc.before
cmd /c mklink .gvimrc ..\..\.vimrc.gui

Push-Location -Path .config\
cmd /c mklink /J nvim\ ..\.vim\
Push-Location -Path nvim\
cmd /c mklink init.vim ..\..\.vimrc
cmd /c mklink ginit.vim ..\..\.gvimrc
Pop-Location
Pop-Location

Pop-Location

echo "All done with the setup. Now put your vim in the right place and click on the bat."
echo "Type :PlugInstall in your vim to complete the plugin installation"
