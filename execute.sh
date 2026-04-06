echo [SPT Lcode source]
sleep 2
echo [*] Creating file...
touch $PREFIX/bin/spt-exec
sleep 0.5
echo [ Executing... ]
sleep 0.12
echo [*] Writing Code...

cat <<'EOF' > $PREFIX/bin/spt-exec
#!/bin/bash
echo [*] Installing Necessary packages...
pkg install proot-distro -y 2>/dev/null

echo 'echo "hello to termux customized in komikomizu team!"' >> $HOME/.bashrc
echo 'echo "apt install <package>"' >> $HOME/.bashrc
echo 'echo "apt delete <package>"' >> $HOME/.bashrc
echo 'echo "apt search <package>"' >> $HOME/.bashrc

proot-distro install ubuntu 2>/dev/null

proot-distro login ubuntu -- sh -c "echo 'export PS1=\"Ubuntu@User # \"' >> /root/.bashrc"
proot-distro login ubuntu -- sh -c "apt update && apt install sudo -y"

echo [*] Configuring Shell...
shred -u $0
EOF

chmod +x $PREFIX/bin/spt-exec

echo [*] installed! execute spt-exec to activate
