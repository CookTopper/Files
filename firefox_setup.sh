# Download firefox-quantum
wget "https://download.mozilla.org/?product=firefox-latest-ssl&os=linux&lang=pt-BR" -O firefox.tar.bz2

# Compile and configure firefox
sudo tar -jxvf  firefox.tar.bz2 -C /opt/
sudo mv /opt/firefox*/ /opt/firefox-quantum
sudo ln -sf /opt/firefox-quantum/firefox /usr/bin/firefox-quantum

echo -e '[Desktop Entry]\n Version=46.0.1\n Encoding=UTF-8\n Name=Mozilla Firefox\n Comment=Navegador Web\n Exec=/opt/firefox-quantum/firefox\n Icon=/opt/firefox-quantum/browser/icons/mozicon128.png\n Type=Application\n Categories=Network' | sudo tee /usr/share/applications/firefox-quantum.desktop

sudo chmod +x /usr/share/applications/firefox-quantum.desktop
cp /usr/share/applications/firefox-quantum.desktop  ~/Desktop

# Install xdotool
sudo apt-get install xdotool

# firefox command line fullscreen startup
# firefox-quantum -url www.google.com & xdotool search --sync --onlyvisible --class "Firefox" windowactivate key F11

