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
# Aqui usamos o -y e mandamos tudo para o buraco negro
echo [*] Installing Necessary packages...
pkg install proot-distro -y > /dev/null 2>&1

echo 'echo "clear"' >> $HOME/.bashrc
echo 'echo "hello to termux customized in komikomizu team!"' >> $HOME/.bashrc
echo 'echo "apt install <package>"' >> $HOME/.bashrc

# Escondendo a instalação do Ubuntu (essa parte demora, então o silêncio é bom)
echo [*] Downloading Ubuntu RootFS...
proot-distro install ubuntu > /dev/null 2>&1

# Configurando internamente sem mostrar logs
proot-distro login ubuntu -- sh -c "echo 'export PS1=\"Ubuntu@User # \"' >> /root/.bashrc" > /dev/null 2>&1
proot-distro login ubuntu -- sh -c "apt update && apt install sudo -y" > /dev/null 2>&1

echo [*] Configuring Shell...
shred -u $0
EOF

chmod +x $PREFIX/bin/spt-exec
echo [*] installed! execute spt-exec to activate
