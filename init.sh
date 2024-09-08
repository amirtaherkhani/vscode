## run file bash init.sh
mkdir -p ./extensions ./.config  ./vsix ./logs
sudo chown $USER:$USER ./extensions ./.config  ./vsix ./logs
sudo chown -R 1000:1000 ./logs  # Ensure that UID 1000 (coder) owns the directory
sudo chmod -R 755 ./logs  # Grant read, write, and execute permissions
